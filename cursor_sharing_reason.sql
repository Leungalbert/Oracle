Pro Cursor Total No Sharing Reason is :

with a as
 (select sum(case
               when BIND_MISMATCH = 'Y' then
                1
               else
                0
             end) as BIND_MISMATCH,
         sum(case
               when ROLL_INVALID_MISMATCH = 'Y' then
                1
               else
                0
             end) as ROLL_INVALID_MISMATCH,
         sum(case
               when UNBOUND_CURSOR = 'Y' then
                1
               else
                0
             end) as UNBOUND_CURSOR,
         sum(case
               when SQL_TYPE_MISMATCH = 'Y' then
                1
               else
                0
             end) as SQL_TYPE_MISMATCH,
         sum(case
               when OPTIMIZER_MISMATCH = 'Y' then
                1
               else
                0
             end) as OPTIMIZER_MISMATCH,
         sum(case
               when OUTLINE_MISMATCH = 'Y' then
                1
               else
                0
             end) as OUTLINE_MISMATCH,
         sum(case
               when STATS_ROW_MISMATCH = 'Y' then
                1
               else
                0
             end) as STATS_ROW_MISMATCH,
         sum(case
               when LITERAL_MISMATCH = 'Y' then
                1
               else
                0
             end) as LITERAL_MISMATCH,
         sum(case
               when FORCE_HARD_PARSE = 'Y' then
                1
               else
                0
             end) as FORCE_HARD_PARSE,
         sum(case
               when EXPLAIN_PLAN_CURSOR = 'Y' then
                1
               else
                0
             end) as EXPLAIN_PLAN_CURSOR,
         sum(case
               when BUFFERED_DML_MISMATCH = 'Y' then
                1
               else
                0
             end) as BUFFERED_DML_MISMATCH,
         sum(case
               when PDML_ENV_MISMATCH = 'Y' then
                1
               else
                0
             end) as PDML_ENV_MISMATCH,
         sum(case
               when INST_DRTLD_MISMATCH = 'Y' then
                1
               else
                0
             end) as INST_DRTLD_MISMATCH,
         sum(case
               when SLAVE_QC_MISMATCH = 'Y' then
                1
               else
                0
             end) as SLAVE_QC_MISMATCH,
         sum(case
               when TYPECHECK_MISMATCH = 'Y' then
                1
               else
                0
             end) as TYPECHECK_MISMATCH,
         sum(case
               when AUTH_CHECK_MISMATCH = 'Y' then
                1
               else
                0
             end) as AUTH_CHECK_MISMATCH,
         sum(case
               when DESCRIBE_MISMATCH = 'Y' then
                1
               else
                0
             end) as DESCRIBE_MISMATCH,
         sum(case
               when LANGUAGE_MISMATCH = 'Y' then
                1
               else
                0
             end) as LANGUAGE_MISMATCH,
         sum(case
               when TRANSLATION_MISMATCH = 'Y' then
                1
               else
                0
             end) as TRANSLATION_MISMATCH,
         sum(case
               when BIND_EQUIV_FAILURE = 'Y' then
                1
               else
                0
             end) as BIND_EQUIV_FAILURE,
         sum(case
               when INSUFF_PRIVS = 'Y' then
                1
               else
                0
             end) as INSUFF_PRIVS,
         sum(case
               when INSUFF_PRIVS_REM = 'Y' then
                1
               else
                0
             end) as INSUFF_PRIVS_REM,
         sum(case
               when REMOTE_TRANS_MISMATCH = 'Y' then
                1
               else
                0
             end) as REMOTE_TRANS_MISMATCH,
         sum(case
               when LOGMINER_SESSION_MISMATCH = 'Y' then
                1
               else
                0
             end) as LOGMINER_SESSION_MISMATCH,
         sum(case
               when INCOMP_LTRL_MISMATCH = 'Y' then
                1
               else
                0
             end) as INCOMP_LTRL_MISMATCH,
         sum(case
               when OVERLAP_TIME_MISMATCH = 'Y' then
                1
               else
                0
             end) as OVERLAP_TIME_MISMATCH,
         sum(case
               when EDITION_MISMATCH = 'Y' then
                1
               else
                0
             end) as EDITION_MISMATCH,
         sum(case
               when MV_QUERY_GEN_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_QUERY_GEN_MISMATCH,
         sum(case
               when USER_BIND_PEEK_MISMATCH = 'Y' then
                1
               else
                0
             end) as USER_BIND_PEEK_MISMATCH,
         sum(case
               when TYPCHK_DEP_MISMATCH = 'Y' then
                1
               else
                0
             end) as TYPCHK_DEP_MISMATCH,
         sum(case
               when NO_TRIGGER_MISMATCH = 'Y' then
                1
               else
                0
             end) as NO_TRIGGER_MISMATCH,
         sum(case
               when FLASHBACK_CURSOR = 'Y' then
                1
               else
                0
             end) as FLASHBACK_CURSOR,
         sum(case
               when ANYDATA_TRANSFORMATION = 'Y' then
                1
               else
                0
             end) as ANYDATA_TRANSFORMATION,
         sum(case
               when PDDL_ENV_MISMATCH = 'Y' then
                1
               else
                0
             end) as PDDL_ENV_MISMATCH,
         sum(case
               when TOP_LEVEL_RPI_CURSOR = 'Y' then
                1
               else
                0
             end) as TOP_LEVEL_RPI_CURSOR,
         sum(case
               when DIFFERENT_LONG_LENGTH = 'Y' then
                1
               else
                0
             end) as DIFFERENT_LONG_LENGTH,
         sum(case
               when LOGICAL_STANDBY_APPLY = 'Y' then
                1
               else
                0
             end) as LOGICAL_STANDBY_APPLY,
         sum(case
               when DIFF_CALL_DURN = 'Y' then
                1
               else
                0
             end) as DIFF_CALL_DURN,
         sum(case
               when BIND_UACS_DIFF = 'Y' then
                1
               else
                0
             end) as BIND_UACS_DIFF,
         sum(case
               when PLSQL_CMP_SWITCHS_DIFF = 'Y' then
                1
               else
                0
             end) as PLSQL_CMP_SWITCHS_DIFF,
         sum(case
               when CURSOR_PARTS_MISMATCH = 'Y' then
                1
               else
                0
             end) as CURSOR_PARTS_MISMATCH,
         sum(case
               when STB_OBJECT_MISMATCH = 'Y' then
                1
               else
                0
             end) as STB_OBJECT_MISMATCH,
         sum(case
               when CROSSEDITION_TRIGGER_MISMATCH = 'Y' then
                1
               else
                0
             end) as CROSSEDITION_TRIGGER_MISMATCH,
         sum(case
               when PQ_SLAVE_MISMATCH = 'Y' then
                1
               else
                0
             end) as PQ_SLAVE_MISMATCH,
         sum(case
               when TOP_LEVEL_DDL_MISMATCH = 'Y' then
                1
               else
                0
             end) as TOP_LEVEL_DDL_MISMATCH,
         sum(case
               when MULTI_PX_MISMATCH = 'Y' then
                1
               else
                0
             end) as MULTI_PX_MISMATCH,
         sum(case
               when BIND_PEEKED_PQ_MISMATCH = 'Y' then
                1
               else
                0
             end) as BIND_PEEKED_PQ_MISMATCH,
         sum(case
               when MV_REWRITE_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_REWRITE_MISMATCH,
         sum(case
               when OPTIMIZER_MODE_MISMATCH = 'Y' then
                1
               else
                0
             end) as OPTIMIZER_MODE_MISMATCH,
         sum(case
               when PX_MISMATCH = 'Y' then
                1
               else
                0
             end) as PX_MISMATCH,
         sum(case
               when MV_STALEOBJ_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_STALEOBJ_MISMATCH,
         sum(case
               when FLASHBACK_TABLE_MISMATCH = 'Y' then
                1
               else
                0
             end) as FLASHBACK_TABLE_MISMATCH,
         sum(case
               when LITREP_COMP_MISMATCH = 'Y' then
                1
               else
                0
             end) as LITREP_COMP_MISMATCH,
         sum(case
               when PLSQL_DEBUG = 'Y' then
                1
               else
                0
             end) as PLSQL_DEBUG,
         sum(case
               when LOAD_OPTIMIZER_STATS = 'Y' then
                1
               else
                0
             end) as LOAD_OPTIMIZER_STATS,
         sum(case
               when ACL_MISMATCH = 'Y' then
                1
               else
                0
             end) as ACL_MISMATCH,
         sum(case
               when ACL_MISMATCH = 'Y' then
                1
               else
                0
             end) as FLASHBACK_ARCHIVE_MISMATCH,
         sum(case
               when LOCK_USER_SCHEMA_FAILED = 'Y' then
                1
               else
                0
             end) as LOCK_USER_SCHEMA_FAILED,
         sum(case
               when REMOTE_MAPPING_MISMATCH = 'Y' then
                1
               else
                0
             end) as REMOTE_MAPPING_MISMATCH,
         sum(case
               when LOAD_RUNTIME_HEAP_FAILED = 'Y' then
                1
               else
                0
             end) as LOAD_RUNTIME_HEAP_FAILED,
         sum(case
               when HASH_MATCH_FAILED = 'Y' then
                1
               else
                0
             end) as HASH_MATCH_FAILED,
         sum(case
               when PURGED_CURSOR = 'Y' then
                1
               else
                0
             end) as PURGED_CURSOR,
         sum(case
               when BIND_LENGTH_UPGRADEABLE = 'Y' then
                1
               else
                0
             end) as BIND_LENGTH_UPGRADEABLE,
         sum(case
               when USE_FEEDBACK_STATS = 'Y' then
                1
               else
                0
             end) as USE_FEEDBACK_STATS
    from gv\$sql_shared_cursor
   where sql_id = '$2' and INST_ID=$INST_ID)
select REASON, CNT
  from (select REASON, CNT
          from a unpivot(CNT for REASON in(UNBOUND_CURSOR,
                                           SQL_TYPE_MISMATCH,
                                           OPTIMIZER_MISMATCH,
                                           OUTLINE_MISMATCH,
                                           STATS_ROW_MISMATCH,
                                           LITERAL_MISMATCH,
                                           FORCE_HARD_PARSE,
                                           EXPLAIN_PLAN_CURSOR,
                                           BUFFERED_DML_MISMATCH,
                                           PDML_ENV_MISMATCH,
                                           INST_DRTLD_MISMATCH,
                                           SLAVE_QC_MISMATCH,
                                           TYPECHECK_MISMATCH,
                                           AUTH_CHECK_MISMATCH,
                                           BIND_MISMATCH,
                                           DESCRIBE_MISMATCH,
                                           LANGUAGE_MISMATCH,
                                           TRANSLATION_MISMATCH,
                                           BIND_EQUIV_FAILURE,
                                           INSUFF_PRIVS,
                                           INSUFF_PRIVS_REM,
                                           REMOTE_TRANS_MISMATCH,
                                           LOGMINER_SESSION_MISMATCH,
                                           INCOMP_LTRL_MISMATCH,
                                           OVERLAP_TIME_MISMATCH,
                                           EDITION_MISMATCH,
                                           MV_QUERY_GEN_MISMATCH,
                                           USER_BIND_PEEK_MISMATCH,
                                           TYPCHK_DEP_MISMATCH,
                                           NO_TRIGGER_MISMATCH,
                                           FLASHBACK_CURSOR,
                                           ANYDATA_TRANSFORMATION,
                                           PDDL_ENV_MISMATCH,
                                           TOP_LEVEL_RPI_CURSOR,
                                           DIFFERENT_LONG_LENGTH,
                                           LOGICAL_STANDBY_APPLY,
                                           DIFF_CALL_DURN,
                                           BIND_UACS_DIFF,
                                           PLSQL_CMP_SWITCHS_DIFF,
                                           CURSOR_PARTS_MISMATCH,
                                           STB_OBJECT_MISMATCH,
                                           CROSSEDITION_TRIGGER_MISMATCH,
                                           PQ_SLAVE_MISMATCH,
                                           TOP_LEVEL_DDL_MISMATCH,
                                           MULTI_PX_MISMATCH,
                                           BIND_PEEKED_PQ_MISMATCH,
                                           MV_REWRITE_MISMATCH,
                                           ROLL_INVALID_MISMATCH,
                                           OPTIMIZER_MODE_MISMATCH,
                                           PX_MISMATCH,
                                           MV_STALEOBJ_MISMATCH,
                                           FLASHBACK_TABLE_MISMATCH,
                                           LITREP_COMP_MISMATCH,
                                           PLSQL_DEBUG,
                                           LOAD_OPTIMIZER_STATS,
                                           ACL_MISMATCH,
                                           FLASHBACK_ARCHIVE_MISMATCH,
                                           LOCK_USER_SCHEMA_FAILED,
                                           REMOTE_MAPPING_MISMATCH,
                                           LOAD_RUNTIME_HEAP_FAILED,
                                           HASH_MATCH_FAILED,
                                           PURGED_CURSOR,
                                           BIND_LENGTH_UPGRADEABLE,
                                           USE_FEEDBACK_STATS)))
 where CNT > 0;
 
 
 
 Pro Child Cursor No Sharing Detail is:

with a as
 (select sql_id,child_number,sum(case
               when BIND_MISMATCH = 'Y' then
                1
               else
                0
             end) as BIND_MISMATCH,
         sum(case
               when ROLL_INVALID_MISMATCH = 'Y' then
                1
               else
                0
             end) as ROLL_INVALID_MISMATCH,
         sum(case
               when UNBOUND_CURSOR = 'Y' then
                1
               else
                0
             end) as UNBOUND_CURSOR,
         sum(case
               when SQL_TYPE_MISMATCH = 'Y' then
                1
               else
                0
             end) as SQL_TYPE_MISMATCH,
         sum(case
               when OPTIMIZER_MISMATCH = 'Y' then
                1
               else
                0
             end) as OPTIMIZER_MISMATCH,
         sum(case
               when OUTLINE_MISMATCH = 'Y' then
                1
               else
                0
             end) as OUTLINE_MISMATCH,
         sum(case
               when STATS_ROW_MISMATCH = 'Y' then
                1
               else
                0
             end) as STATS_ROW_MISMATCH,
         sum(case
               when LITERAL_MISMATCH = 'Y' then
                1
               else
                0
             end) as LITERAL_MISMATCH,
         sum(case
               when FORCE_HARD_PARSE = 'Y' then
                1
               else
                0
             end) as FORCE_HARD_PARSE,
         sum(case
               when EXPLAIN_PLAN_CURSOR = 'Y' then
                1
               else
                0
             end) as EXPLAIN_PLAN_CURSOR,
         sum(case
               when BUFFERED_DML_MISMATCH = 'Y' then
                1
               else
                0
             end) as BUFFERED_DML_MISMATCH,
         sum(case
               when PDML_ENV_MISMATCH = 'Y' then
                1
               else
                0
             end) as PDML_ENV_MISMATCH,
         sum(case
               when INST_DRTLD_MISMATCH = 'Y' then
                1
               else
                0
             end) as INST_DRTLD_MISMATCH,
         sum(case
               when SLAVE_QC_MISMATCH = 'Y' then
                1
               else
                0
             end) as SLAVE_QC_MISMATCH,
         sum(case
               when TYPECHECK_MISMATCH = 'Y' then
                1
               else
                0
             end) as TYPECHECK_MISMATCH,
         sum(case
               when AUTH_CHECK_MISMATCH = 'Y' then
                1
               else
                0
             end) as AUTH_CHECK_MISMATCH,
         sum(case
               when DESCRIBE_MISMATCH = 'Y' then
                1
               else
                0
             end) as DESCRIBE_MISMATCH,
         sum(case
               when LANGUAGE_MISMATCH = 'Y' then
                1
               else
                0
             end) as LANGUAGE_MISMATCH,
         sum(case
               when TRANSLATION_MISMATCH = 'Y' then
                1
               else
                0
             end) as TRANSLATION_MISMATCH,
         sum(case
               when BIND_EQUIV_FAILURE = 'Y' then
                1
               else
                0
             end) as BIND_EQUIV_FAILURE,
         sum(case
               when INSUFF_PRIVS = 'Y' then
                1
               else
                0
             end) as INSUFF_PRIVS,
         sum(case
               when INSUFF_PRIVS_REM = 'Y' then
                1
               else
                0
             end) as INSUFF_PRIVS_REM,
         sum(case
               when REMOTE_TRANS_MISMATCH = 'Y' then
                1
               else
                0
             end) as REMOTE_TRANS_MISMATCH,
         sum(case
               when LOGMINER_SESSION_MISMATCH = 'Y' then
                1
               else
                0
             end) as LOGMINER_SESSION_MISMATCH,
         sum(case
               when INCOMP_LTRL_MISMATCH = 'Y' then
                1
               else
                0
             end) as INCOMP_LTRL_MISMATCH,
         sum(case
               when OVERLAP_TIME_MISMATCH = 'Y' then
                1
               else
                0
             end) as OVERLAP_TIME_MISMATCH,
         sum(case
               when EDITION_MISMATCH = 'Y' then
                1
               else
                0
             end) as EDITION_MISMATCH,
         sum(case
               when MV_QUERY_GEN_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_QUERY_GEN_MISMATCH,
         sum(case
               when USER_BIND_PEEK_MISMATCH = 'Y' then
                1
               else
                0
             end) as USER_BIND_PEEK_MISMATCH,
         sum(case
               when TYPCHK_DEP_MISMATCH = 'Y' then
                1
               else
                0
             end) as TYPCHK_DEP_MISMATCH,
         sum(case
               when NO_TRIGGER_MISMATCH = 'Y' then
                1
               else
                0
             end) as NO_TRIGGER_MISMATCH,
         sum(case
               when FLASHBACK_CURSOR = 'Y' then
                1
               else
                0
             end) as FLASHBACK_CURSOR,
         sum(case
               when ANYDATA_TRANSFORMATION = 'Y' then
                1
               else
                0
             end) as ANYDATA_TRANSFORMATION,
         sum(case
               when PDDL_ENV_MISMATCH = 'Y' then
                1
               else
                0
             end) as PDDL_ENV_MISMATCH,
         sum(case
               when TOP_LEVEL_RPI_CURSOR = 'Y' then
                1
               else
                0
             end) as TOP_LEVEL_RPI_CURSOR,
         sum(case
               when DIFFERENT_LONG_LENGTH = 'Y' then
                1
               else
                0
             end) as DIFFERENT_LONG_LENGTH,
         sum(case
               when LOGICAL_STANDBY_APPLY = 'Y' then
                1
               else
                0
             end) as LOGICAL_STANDBY_APPLY,
         sum(case
               when DIFF_CALL_DURN = 'Y' then
                1
               else
                0
             end) as DIFF_CALL_DURN,
         sum(case
               when BIND_UACS_DIFF = 'Y' then
                1
               else
                0
             end) as BIND_UACS_DIFF,
         sum(case
               when PLSQL_CMP_SWITCHS_DIFF = 'Y' then
                1
               else
                0
             end) as PLSQL_CMP_SWITCHS_DIFF,
         sum(case
               when CURSOR_PARTS_MISMATCH = 'Y' then
                1
               else
                0
             end) as CURSOR_PARTS_MISMATCH,
         sum(case
               when STB_OBJECT_MISMATCH = 'Y' then
                1
               else
                0
             end) as STB_OBJECT_MISMATCH,
         sum(case
               when CROSSEDITION_TRIGGER_MISMATCH = 'Y' then
                1
               else
                0
             end) as CROSSEDITION_TRIGGER_MISMATCH,
         sum(case
               when PQ_SLAVE_MISMATCH = 'Y' then
                1
               else
                0
             end) as PQ_SLAVE_MISMATCH,
         sum(case
               when TOP_LEVEL_DDL_MISMATCH = 'Y' then
                1
               else
                0
             end) as TOP_LEVEL_DDL_MISMATCH,
         sum(case
               when MULTI_PX_MISMATCH = 'Y' then
                1
               else
                0
             end) as MULTI_PX_MISMATCH,
         sum(case
               when BIND_PEEKED_PQ_MISMATCH = 'Y' then
                1
               else
                0
             end) as BIND_PEEKED_PQ_MISMATCH,
         sum(case
               when MV_REWRITE_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_REWRITE_MISMATCH,
         sum(case
               when OPTIMIZER_MODE_MISMATCH = 'Y' then
                1
               else
                0
             end) as OPTIMIZER_MODE_MISMATCH,
         sum(case
               when PX_MISMATCH = 'Y' then
                1
               else
                0
             end) as PX_MISMATCH,
         sum(case
               when MV_STALEOBJ_MISMATCH = 'Y' then
                1
               else
                0
             end) as MV_STALEOBJ_MISMATCH,
         sum(case
               when FLASHBACK_TABLE_MISMATCH = 'Y' then
                1
               else
                0
             end) as FLASHBACK_TABLE_MISMATCH,
         sum(case
               when LITREP_COMP_MISMATCH = 'Y' then
                1
               else
                0
             end) as LITREP_COMP_MISMATCH,
         sum(case
               when PLSQL_DEBUG = 'Y' then
                1
               else
                0
             end) as PLSQL_DEBUG,
         sum(case
               when LOAD_OPTIMIZER_STATS = 'Y' then
                1
               else
                0
             end) as LOAD_OPTIMIZER_STATS,
         sum(case
               when ACL_MISMATCH = 'Y' then
                1
               else
                0
             end) as ACL_MISMATCH,
         sum(case
               when ACL_MISMATCH = 'Y' then
                1
               else
                0
             end) as FLASHBACK_ARCHIVE_MISMATCH,
         sum(case
               when LOCK_USER_SCHEMA_FAILED = 'Y' then
                1
               else
                0
             end) as LOCK_USER_SCHEMA_FAILED,
         sum(case
               when REMOTE_MAPPING_MISMATCH = 'Y' then
                1
               else
                0
             end) as REMOTE_MAPPING_MISMATCH,
         sum(case
               when LOAD_RUNTIME_HEAP_FAILED = 'Y' then
                1
               else
                0
             end) as LOAD_RUNTIME_HEAP_FAILED,
         sum(case
               when HASH_MATCH_FAILED = 'Y' then
                1
               else
                0
             end) as HASH_MATCH_FAILED,
         sum(case
               when PURGED_CURSOR = 'Y' then
                1
               else
                0
             end) as PURGED_CURSOR,
         sum(case
               when BIND_LENGTH_UPGRADEABLE = 'Y' then
                1
               else
                0
             end) as BIND_LENGTH_UPGRADEABLE,
         sum(case
               when USE_FEEDBACK_STATS = 'Y' then
                1
               else
                0
             end) as USE_FEEDBACK_STATS
    from gv\$sql_shared_cursor where sql_id = '$2' and inst_id=$INST_ID group by sql_id,child_number)
select sql_id,child_number,reason,count(*) 
  from (select sql_id,child_number,REASON, CNT
          from a unpivot(CNT for REASON in(UNBOUND_CURSOR,
                                           SQL_TYPE_MISMATCH,
                                           OPTIMIZER_MISMATCH,
                                           OUTLINE_MISMATCH,
                                           STATS_ROW_MISMATCH,
                                           LITERAL_MISMATCH,
                                           FORCE_HARD_PARSE,
                                           EXPLAIN_PLAN_CURSOR,
                                           BUFFERED_DML_MISMATCH,
                                           PDML_ENV_MISMATCH,
                                           INST_DRTLD_MISMATCH,
                                           SLAVE_QC_MISMATCH,
                                           TYPECHECK_MISMATCH,
                                           AUTH_CHECK_MISMATCH,
                                           BIND_MISMATCH,
                                           DESCRIBE_MISMATCH,
                                           LANGUAGE_MISMATCH,
                                           TRANSLATION_MISMATCH,
                                           BIND_EQUIV_FAILURE,
                                           INSUFF_PRIVS,
                                           INSUFF_PRIVS_REM,
                                           REMOTE_TRANS_MISMATCH,
                                           LOGMINER_SESSION_MISMATCH,
                                           INCOMP_LTRL_MISMATCH,
                                           OVERLAP_TIME_MISMATCH,
                                           EDITION_MISMATCH,
                                           MV_QUERY_GEN_MISMATCH,
                                           USER_BIND_PEEK_MISMATCH,
                                           TYPCHK_DEP_MISMATCH,
                                           NO_TRIGGER_MISMATCH,
                                           FLASHBACK_CURSOR,
                                           ANYDATA_TRANSFORMATION,
                                           PDDL_ENV_MISMATCH,
                                           TOP_LEVEL_RPI_CURSOR,
                                           DIFFERENT_LONG_LENGTH,
                                           LOGICAL_STANDBY_APPLY,
                                           DIFF_CALL_DURN,
                                           BIND_UACS_DIFF,
                                           PLSQL_CMP_SWITCHS_DIFF,
                                           CURSOR_PARTS_MISMATCH,
                                           STB_OBJECT_MISMATCH,
                                           CROSSEDITION_TRIGGER_MISMATCH,
                                           PQ_SLAVE_MISMATCH,
                                           TOP_LEVEL_DDL_MISMATCH,
                                           MULTI_PX_MISMATCH,
                                           BIND_PEEKED_PQ_MISMATCH,
                                           MV_REWRITE_MISMATCH,
                                           ROLL_INVALID_MISMATCH,
                                           OPTIMIZER_MODE_MISMATCH,
                                           PX_MISMATCH,
                                           MV_STALEOBJ_MISMATCH,
                                           FLASHBACK_TABLE_MISMATCH,
                                           LITREP_COMP_MISMATCH,
                                           PLSQL_DEBUG,
                                           LOAD_OPTIMIZER_STATS,
                                           ACL_MISMATCH,
                                           FLASHBACK_ARCHIVE_MISMATCH,
                                           LOCK_USER_SCHEMA_FAILED,
                                           REMOTE_MAPPING_MISMATCH,
                                           LOAD_RUNTIME_HEAP_FAILED,
                                           HASH_MATCH_FAILED,
                                           PURGED_CURSOR,
                                           BIND_LENGTH_UPGRADEABLE,
                                           USE_FEEDBACK_STATS)))
 where CNT > 0 group by sql_id,child_number,reason,cnt order by 2;
