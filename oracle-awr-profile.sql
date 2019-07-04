select s.snap_date,
       decode(s.redosize, null, '--shutdown or end--', s.currtime)  "TIME",
       to_char(round(s.seconds / 60, 2)) "elapse(min)",
       round(t.db_time / 1000000 / 60, 2) "DB time(min)",
       s.redosize redo,
       round(s.redosize / s.seconds, 2) "redo/s",
       s.logicalreads logical,
       round(s.logicalreads / s.seconds, 2) "logical/s",
       physicalreads physical,
       round(s.physicalreads / s.seconds, 2) "phy/s",
       s.executes execs,
       round(s.executes / s.seconds, 2) "execs/s",
       s.parse,
       round(s.parse / s.seconds, 2) "parse/s",
       s.hardparse,
       round(s.hardparse / s.seconds, 2) "hardparse/s",
       s.transactions trans,
       round(s.transactions / s.seconds, 2) "trans/s"
  from (select curr_redo - last_redo redosize,
               curr_logicalreads - last_logicalreads logicalreads,
               curr_physicalreads - last_physicalreads physicalreads,
               curr_executes - last_executes executes,
               curr_parse - last_parse parse,
               curr_hardparse - last_hardparse hardparse,
               curr_transactions - last_transactions transactions,
               round(((currtime + 0) - (lasttime + 0)) * 3600 * 24, 0)  seconds,
               to_char(currtime, 'yy/mm/dd') snap_date,
               to_char(currtime, 'hh24:mi') currtime,
               currsnap_id endsnap_id,
               to_char(startup_time, 'yyyy-mm-dd hh24:mi:ss') startup_time
          from (select a.redo last_redo,
                       a.logicalreads last_logicalreads,
                       a.physicalreads last_physicalreads,
                       a.executes last_executes,
                       a.parse last_parse,
                       a.hardparse last_hardparse,
                       a.transactions last_transactions,
                       lead(a.redo, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_redo,
                       lead(a.logicalreads, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_logicalreads,
                       lead(a.physicalreads, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_physicalreads,
                       lead(a.executes, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_executes,
                       lead(a.parse, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_parse,
                       lead(a.hardparse, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_hardparse,
                       lead(a.transactions, 1, null) over(partition by  b.startup_time order by b.end_interval_time) curr_transactions,
                       b.end_interval_time lasttime,
                       lead(b.end_interval_time, 1, null) over(partition by  b.startup_time order by b.end_interval_time) currtime,
                       lead(b.snap_id, 1, null) over(partition by  b.startup_time order by b.end_interval_time) currsnap_id,
                       b.startup_time
                  from (select snap_id,
                               dbid,
                               instance_number,
                               sum(decode(stat_name, 'redo size', value, 0))  redo,
                               sum(decode(stat_name,
                                          'session logical reads',
                                          value,
                                          0)) logicalreads,
                               sum(decode(stat_name,
                                          'physical reads',
                                          value,
                                          0)) physicalreads,
                               sum(decode(stat_name, 'execute count', value,  0)) executes,
                               sum(decode(stat_name,
                                          'parse count (total)',
                                          value,
                                          0)) parse,
                               sum(decode(stat_name,
                                          'parse count (hard)',
                                          value,
                                          0)) hardparse,
                               sum(decode(stat_name,
                                          'user rollbacks',
                                          value,
                                          'user commits',
                                          value,
                                          0)) transactions
                          from dba_hist_sysstat
                         where stat_name in
                               ('redo size',
                                'session logical reads',
                                'physical reads',
                                'execute count',
                                'user rollbacks',
                                'user commits',
                                'parse count (hard)',
                                'parse count (total)')
                         group by snap_id, dbid, instance_number) a,
                       dba_hist_snapshot b,
                       v$instance c
                 where a.snap_id = b.snap_id
                   and a.dbid = b.dbid
                   and a.instance_number = b.instance_number
                   and b.instance_number = c.instance_number
                 order by end_interval_time)) s,
       (select lead(a.value, 1, null) over(partition by b.startup_time  order by b.end_interval_time) - a.value db_time,
               lead(b.snap_id, 1, null) over(partition by b.startup_time  order by b.end_interval_time) endsnap_id
          from dba_hist_sys_time_model a, dba_hist_snapshot b, v$instance  c
         where a.snap_id = b.snap_id
           and a.dbid = b.dbid
           and a.instance_number = b.instance_number
           and a.instance_number = c.instance_number
           and a.stat_name = 'DB time') t
where s.endsnap_id = t.endsnap_id
order by s.snap_date, time desc;
