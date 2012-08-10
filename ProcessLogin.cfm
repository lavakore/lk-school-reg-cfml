<cfparam name="username" default="">
<cfparam name="password" default="">
<cfquery name="LoginQ" datasource="RegData">
SELECT * FROM Registration WHERE 
(lower(Registration.Student_Web_ID) LIKE <cfqueryparam value="#lcase(username)#" cfsqltype="cf_sql_varchar"> AND Registration.Student_Web_Password = <cfqueryparam value="#password#" cfsqltype="cf_sql_integer">) 
OR (lower(Registration.Web_ID) LIKE <cfqueryparam value="#lcase(username)#" cfsqltype="cf_sql_varchar"> AND Registration.Web_Password = <cfqueryparam value="#password#" cfsqltype="cf_sql_integer">) 
</cfquery>
<cflock scope="session" timeout="20" type="exclusive">
  <cfif LoginQ.RecordCount eq 1>
    <cfset SESSION.student_number = LoginQ.student_number>
    <cfset SESSION.LoginRetry = "false">
    <cfelse>
    <cfset SESSION.LoginRetry = "true">
    <cflocation addtoken="no" url="/">
  </cfif>
</cflock>
<cfquery name="LoginReg" datasource="RegData">
SELECT student_number FROM regdemofixed WHERE 
student_number = <cfqueryparam value="#LoginQ.student_number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfset nextURl = "">
<cfif LoginQ.RecordCount eq 1>
  <cfswitch expression="#LoginQ.SchoolID#">
    <cfcase value="301">
    <cfset nextURl = "/Minico/">
    </cfcase>
    <cfcase value="201">
    <cfset nextURl = "/East/">
    </cfcase>
    <cfcase value="202">
    <cfset nextURl = "/West/">
    </cfcase>
  </cfswitch>
  <cfif LoginQ.Prog_Letter eq "">
    <cflocation addtoken="no" url="#nextURL#Letter.cfm">
    <cfelseif LoginQ.Prog_Demo eq "" or LoginReg.RecordCount eq 0>
    <cflocation addtoken="no" url="#nextURL#Demographics.cfm">
    <cfelseif LoginQ.prog_race eq "">
    <cflocation addtoken="no" url="#nextURL#RaceAndEthnicity.cfm">
    <cfelseif LoginQ.Prog_Dress eq "">
    <cflocation addtoken="no" url="#nextURL#DressCode.cfm">
    <cfelseif LoginQ.Prog_Comp eq "">
    <cflocation addtoken="no" url="#nextURL#ComputerUse.cfm">
    <cfelseif LoginQ.Prog_Fees eq "">
    <cflocation addtoken="no" url="#nextURL#Fees.cfm">
    <cfelseif LoginQ.Prog_Locker eq "">
    <cflocation addtoken="no" url="#nextURL#ClassSchedule.cfm">
    <cfelseif LoginQ.Prog_Finish eq "">
    <cflocation addtoken="no" url="#nextURL#Finish.cfm">
    <cfelse>
    <cflocation addtoken="no" url="#nextURL#ClassSchedule.cfm">
  </cfif>
</cfif>
