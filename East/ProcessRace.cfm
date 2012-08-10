<cfquery name="UPDATERACE" datasource="RegData">
UPDATE regdemofixed SET fedethnicity = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.FedEthnicity#">, race = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.race#"> WHERE student_number = <cfqueryparam cfsqltype="cf_sql_integer" value="#SESSION.Student_Number#">
</cfquery>
<cflocation addtoken="no" url="./DressCode.cfm">