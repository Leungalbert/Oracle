select to_char(b.END_INTERVAL_TIME, 'yyyymmddhh24') sampletime, a.*
  from (select *
          from (select sq.snap_id,
                       sq.sql_id,
                       nvl((round(sq.elap / 1000000, 3)), to_number(null)) elap_time,
                       nvl((round(sq.CPUT / 1000000, 3)), to_number(null)) cpu_time,
                       nvl((round(sq.IO_TIME / 1000000, 3)), to_number(null)) io_time,
                       sq.exec,
                       sq.buffer_get,
                       sq.disk_read,
                       to_char(decode(sq.exec,
                                      0,
                                      to_number(null),
                                      nvl((round(sq.elap / sq.exec / 1000000,
                                                 3)),
                                          to_number(null)))) avag_time
                  from (select *
                          from (select st.snap_id,
                                       st.sql_id,
                                       max(module) module,
                                       sum(elapsed_time_delta) elap,
                                       sum(cpu_time_delta) cput,
                                       sum(executions_delta) exec,
                                       sum(IOWAIT_DELTA) io_time,
                                       sum(BUFFER_GETS_DELTA) buffer_get,
                                       sum(DISK_READS_DELTA) disk_read
                                  from dba_hist_sqlstat st,
                                       (select snap_id, dbid, instance_number
                                          from (select snap_id,
                                                       dbid,
                                                       instance_number,
                                                       row_number() over(order by snap_id desc) sp
                                                  from (select snap_id,
                                                               dbid,
                                                               so.instance_number
                                                          from dba_hist_snapshot so,
                                                               v$instance        it
                                                         where so.instance_number =
                                                               it.instance_number))
                                         where sp = 1) endsnap_id,
                                       (select snap_id, dbid, instance_number
                                          from (select snap_id,
                                                       dbid,
                                                       instance_number,
                                                       row_number() over(order by snap_id desc) sp
                                                  from (select snap_id,
                                                               dbid,
                                                               so.instance_number
                                                          from dba_hist_snapshot so,
                                                               v$instance        it
                                                         where so.instance_number =
                                                               it.instance_number))
                                         where sp = 2) beginsnap_id
                                 where st.dbid = endsnap_id.dbid
                                   and st.dbid = beginsnap_id.dbid
                                   and st.instance_number =
                                       endsnap_id.instance_number
                                   and st.instance_number =
                                       beginsnap_id.instance_number
                                   and beginsnap_id.snap_id < st.snap_id
                                   and st.snap_id <= endsnap_id.snap_id
                                 group by st.sql_id, st.snap_id, st.sql_id)) sq
                 order by elap_time desc) differ
         where differ.sql_id not in
               (select sql_id
                  from dba_hist_sqlstat
                 where snap_id = (to_number(differ.snap_id) - 24))) a,
       dba_hist_snapshot b
 where a.snap_id = b.snap_id
