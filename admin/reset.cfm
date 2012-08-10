<cfparam name="URL.student_number" type="integer" default="0">
<cfparam name="URL.return" default="problems.cfm">
<cfquery name="resetRegDemo" datasource="RegData">
DELETE FROM regdemofixed WHERE student_number = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.student_number#">
</cfquery>
<cfquery name="resetTimes" datasource="RegData">
UPDATE Registration set reglang = NULL, prog_login = NULL, prog_letter = NULL, prog_demo = NULL, prog_dress = NULL, prog_comp = NULL, prog_fees = NULL, prog_locker = NULL, prog_finish = NULL, prog_race = NULL WHERE student_number = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.student_number#">
</cfquery>
<cflocation addtoken="no" url="#URL.return#">