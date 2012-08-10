<cflock scope="Session" type="ReadOnly" timeout="30" throwontimeout="no">
  <cfset MM_Username=Iif(IsDefined("Session.MM_Username"),"Session.MM_Username",DE(""))>
  <cfset MM_UserAuthorization=Iif(IsDefined("Session.MM_UserAuthorization"),"Session.MM_UserAuthorization",DE(""))>
</cflock>
<cfif MM_Username EQ "">
  <cfset MM_referer=CGI.SCRIPT_NAME>
  <cfif CGI.QUERY_STRING NEQ "">
    <cfset MM_referer=MM_referer & "?" & CGI.QUERY_STRING>
  </cfif>
  <cfset MM_failureURL="login.cfm?accessdenied=" & URLEncodedFormat(MM_referer)>
  <cflocation url="#MM_failureURL#" addtoken="no">
</cfif>
<cfquery name="MyInfo" datasource="RegData">
SELECT *
FROM users
WHERE username = <cfqueryparam value="#SESSION.MM_Username#" cfsqltype="cf_sql_clob" maxlength="50"> 
</cfquery>
<cfset MSCH = "">
<cfif MyInfo.School neq "ALL">
  <cfset MSCH = MyInfo.School>
</cfif>
<cfparam name="URL.Student_Number" default="1" type="Numeric">
<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>
<cfif IsDefined("FORM.MM_UpdateRecord") AND FORM.MM_UpdateRecord EQ "form1">
  <cfquery datasource="RegData">   
    UPDATE regdemofixed
SET Last_Name=<cfif IsDefined("FORM.Last_Name") AND #FORM.Last_Name# NEQ "">
<cfqueryparam value="#FORM.Last_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, First_Name=<cfif IsDefined("FORM.First_Name") AND #FORM.First_Name# NEQ "">
<cfqueryparam value="#FORM.First_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Middle_Name=<cfif IsDefined("FORM.Middle_Name") AND #FORM.Middle_Name# NEQ "">
<cfqueryparam value="#FORM.Middle_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Homelangresult=<cfif IsDefined("FORM.Homelangresult") AND #FORM.Homelangresult# NEQ "">
<cfqueryparam value="#FORM.Homelangresult#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Guardian=<cfif IsDefined("FORM.Guardian") AND #FORM.Guardian# NEQ "">
<cfqueryparam value="#FORM.Guardian#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Gender=<cfif IsDefined("FORM.Gender") AND #FORM.Gender# NEQ "">
<cfqueryparam value="#FORM.Gender#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Ethnicity=<cfif IsDefined("FORM.Ethnicity") AND #FORM.Ethnicity# NEQ "">
<cfqueryparam value="#FORM.Ethnicity#" cfsqltype="cf_sql_numeric">
<cfelse>
NULL
</cfif>
, ID_Name_Of_Language=<cfif IsDefined("FORM.ID_Name_Of_Language") AND #FORM.ID_Name_Of_Language# NEQ "">
<cfqueryparam value="#FORM.ID_Name_Of_Language#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Parentslang=<cfif IsDefined("FORM.Parentslang") AND #FORM.Parentslang# NEQ "">
<cfqueryparam value="#FORM.Parentslang#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Dob=<cfif IsDefined("FORM.Dob") AND #FORM.Dob# NEQ "">
<cfqueryparam value="#FORM.Dob#" cfsqltype="cf_sql_timestamp">
<cfelse>
NULL
</cfif>
, Birthplace=<cfif IsDefined("FORM.Birthplace") AND #FORM.Birthplace# NEQ "">
<cfqueryparam value="#FORM.Birthplace#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mailing_Street=<cfif IsDefined("FORM.Mailing_Street") AND #FORM.Mailing_Street# NEQ "">
<cfqueryparam value="#FORM.Mailing_Street#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Street=<cfif IsDefined("FORM.Street") AND #FORM.Street# NEQ "">
<cfqueryparam value="#FORM.Street#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mailing_City=<cfif IsDefined("FORM.Mailing_City") AND #FORM.Mailing_City# NEQ "">
<cfqueryparam value="#FORM.Mailing_City#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mailing_State=<cfif IsDefined("FORM.Mailing_State") AND #FORM.Mailing_State# NEQ "">
<cfqueryparam value="#FORM.Mailing_State#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mailing_Zip=<cfif IsDefined("FORM.Mailing_Zip") AND #FORM.Mailing_Zip# NEQ "">
<cfqueryparam value="#FORM.Mailing_Zip#" cfsqltype="cf_sql_numeric">
<cfelse>
NULL
</cfif>
, Home_Phone=<cfif IsDefined("FORM.Home_Phone") AND #FORM.Home_Phone# NEQ "">
<cfqueryparam value="#FORM.Home_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, GuardianCell_Phone=<cfif IsDefined("FORM.GuardianCell_Phone") AND #FORM.GuardianCell_Phone# NEQ "">
<cfqueryparam value="#FORM.GuardianCell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Guardianemail=<cfif IsDefined("FORM.Guardianemail") AND #FORM.Guardianemail# NEQ "">
<cfqueryparam value="#FORM.Guardianemail#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mother=<cfif IsDefined("FORM.Mother") AND #FORM.Mother# NEQ "">
<cfqueryparam value="#FORM.Mother#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mother_Employer=<cfif IsDefined("FORM.Mother_Employer") AND #FORM.Mother_Employer# NEQ "">
<cfqueryparam value="#FORM.Mother_Employer#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Motherdayphone=<cfif IsDefined("FORM.Motherdayphone") AND #FORM.Motherdayphone# NEQ "">
<cfqueryparam value="#FORM.Motherdayphone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Mother_Cell_Phone=<cfif IsDefined("FORM.Mother_Cell_Phone") AND #FORM.Mother_Cell_Phone# NEQ "">
<cfqueryparam value="#FORM.Mother_Cell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Father=<cfif IsDefined("FORM.Father") AND #FORM.Father# NEQ "">
<cfqueryparam value="#FORM.Father#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Father_Employer=<cfif IsDefined("FORM.Father_Employer") AND #FORM.Father_Employer# NEQ "">
<cfqueryparam value="#FORM.Father_Employer#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Fatherdayphone=<cfif IsDefined("FORM.Fatherdayphone") AND #FORM.Fatherdayphone# NEQ "">
<cfqueryparam value="#FORM.Fatherdayphone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Father_Cell_Phone=<cfif IsDefined("FORM.Father_Cell_Phone") AND #FORM.Father_Cell_Phone# NEQ "">
<cfqueryparam value="#FORM.Father_Cell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Contact_1=<cfif IsDefined("FORM.Emerg_Contact_1") AND #FORM.Emerg_Contact_1# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_1#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Phone_1=<cfif IsDefined("FORM.Emerg_Phone_1") AND #FORM.Emerg_Phone_1# NEQ "">
<cfqueryparam value="#FORM.Emerg_Phone_1#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Contact_2=<cfif IsDefined("FORM.Emerg_Contact_2") AND #FORM.Emerg_Contact_2# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_2#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Phone_2=<cfif IsDefined("FORM.Emerg_Phone_2") AND #FORM.Emerg_Phone_2# NEQ "">
<cfqueryparam value="#FORM.Emerg_Phone_2#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Contact_3=<cfif IsDefined("FORM.Emerg_Contact_3") AND #FORM.Emerg_Contact_3# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_3#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_3_Phone=<cfif IsDefined("FORM.Emerg_3_Phone") AND #FORM.Emerg_3_Phone# NEQ "">
<cfqueryparam value="#FORM.Emerg_3_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Contact_4=<cfif IsDefined("FORM.Emerg_Contact_4") AND #FORM.Emerg_Contact_4# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_4#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Emerg_Phone_4=<cfif IsDefined("FORM.Emerg_Phone_4") AND #FORM.Emerg_Phone_4# NEQ "">
<cfqueryparam value="#FORM.Emerg_Phone_4#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Alert_Medical=<cfif IsDefined("FORM.Alert_Medical") AND #FORM.Alert_Medical# NEQ "">
<cfqueryparam value="#FORM.Alert_Medical#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, Doctor_Name=<cfif IsDefined("FORM.Doctor_Name") AND #FORM.Doctor_Name# NEQ "">
<cfqueryparam value="#FORM.Doctor_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, race=<cfif IsDefined("FORM.race") AND #FORM.race# NEQ "">
<cfqueryparam value="#FORM.race#" cfsqltype="cf_sql_clob" maxlength="50">
<cfelse>
''
</cfif>
, fedethnicity=<cfif IsDefined("FORM.fedethnicity") AND #FORM.fedethnicity# NEQ "">
<cfqueryparam value="#FORM.fedethnicity#" cfsqltype="cf_sql_integer">
<cfelse>
''
</cfif>
, Doctor_Phone=<cfif IsDefined("FORM.Doctor_Phone") AND #FORM.Doctor_Phone# NEQ "">
<cfqueryparam value="#FORM.Doctor_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
WHERE Student_Number=<cfqueryparam value="#FORM.Student_Number#" cfsqltype="cf_sql_numeric">
  </cfquery>
  <cflocation url="/admin/details.cfm?Student_Number=#FORM.Student_Number#">
</cfif>
<cfquery name="StuUpdate" datasource="RegData">
SELECT *
FROM regdemofixed
WHERE Student_Number = <cfqueryparam value="#URL.Student_Number#" cfsqltype="cf_sql_numeric"> 
</cfquery>
<cfquery name="StuOrig" datasource="RegData">
SELECT *
FROM RegDemo
WHERE Student_Number = <cfqueryparam value="#URL.Student_Number#" cfsqltype="cf_sql_numeric"> 
</cfquery>
<cfquery name="StuProg" datasource="RegData">
SELECT * FROM Registration WHERE student_number = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.Student_Number#">
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<CFHEADER name="Expires" value="#Now()#">
<CFHEADER name="Pragma" value="no-cache">
<CFHEADER name="cache-control" value="no-cache, no-store,must-revalidate">
<meta http-equiv="Expires" content="<cfoutput>#Dateformat(Now(),'DDD, DD MMM YYYY')# #TimeFormat(Now(),'HH:MM:SS')# MST</cfoutput>" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="cache-control" value="no-cache, no-store, must-revalidate" />
<meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
<meta name="Robots" content="noindex,nofollow" />
<title>Registration '11
 Admin Status</title>
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script type="text/javascript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
</head>
<body>
<div id="head">
  <div id="title"> Registration '11 Admin</div>
</div>
<div id="body_wrapper">
  <div id="body">
    <div id="all">
      <div class="top"></div>
      <div class="content">
        <h1>Details</h1>
        <form action="<cfoutput>#CurrentPage#</cfoutput>" method="post" name="form1" id="form1">
          <input name="Return" type="button" id="Return" onclick="MM_goToURL('self','/admin/problems.cfm');return document.MM_returnValue" value="Return to List" />
          <table border="1" cellpadding="2" cellspacing="0">
            <tr>
              <th style="text-align: left">Login</td>
              <td style="text-align: left"><cfoutput>#LSDateFormat(dateadd("h",-6,StuProg.prog_login))#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_login))#</cfoutput></td>
              <td rowspan="9" style="text-align: left">&nbsp;</td>
              <th style="text-align: left">Student Username</th>
              <td style="text-align: left"><cfoutput>#StuProg.student_web_id#</cfoutput></td>
            </tr>
            <tr>
              <th style="text-align: left">Letter            
              <td style="text-align: left"><cfif StuProg.prog_letter neq ""><cfoutput>#LSDateFormat(StuProg.prog_letter)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_letter))#</cfoutput><cfelse>&nbsp;</cfif></td>
              <th style="text-align: left">Student Password</th>
              <td style="text-align: left"><cfoutput>#StuProg.student_web_password#</cfoutput></td>
            </tr>
            <tr>
              <th style="text-align: left">Demographics            
              <td style="text-align: left"><cfif StuProg.prog_demo neq ""><cfoutput>#LSDateFormat(StuProg.prog_demo)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_demo))#</cfoutput><cfelse>&nbsp;</cfif></td>
              <th colspan="2" rowspan="7" style="text-align: left">&nbsp;</th>
            </tr>
            <tr>
              <th style="text-align: left">Dress Code            
              <td style="text-align: left"><cfif StuProg.prog_dress neq ""><cfoutput>#LSDateFormat(StuProg.prog_dress)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_dress))#</cfoutput><cfelse>&nbsp;</cfif></td>
            </tr>
            <tr>
              <th style="text-align: left">Computer Use            
              <td style="text-align: left"><cfif StuProg.prog_comp neq ""><cfoutput>#LSDateFormat(StuProg.prog_comp)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_comp))#</cfoutput><cfelse>&nbsp;</cfif></td>
            </tr>
            <tr>
              <th style="text-align: left">Fees            
              <td style="text-align: left"><cfif StuProg.prog_fees neq ""><cfoutput>#LSDateFormat(StuProg.prog_fees)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_fees))#</cfoutput><cfelse>&nbsp;</cfif></td>
            </tr>
            <tr>
              <th style="text-align: left">Schedule            
              <td style="text-align: left"><cfif StuProg.prog_locker neq ""><cfoutput>#LSDateFormat(StuProg.prog_locker)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_locker))#</cfoutput><cfelse>&nbsp;</cfif></td>
            </tr>
            <tr>
              <th style="text-align: left">Finish            
              <td style="text-align: left"><cfif StuProg.prog_finish neq ""><cfoutput>#LSDateFormat(StuProg.prog_finish)#</cfoutput> <cfoutput>#LSTimeFormat(dateadd("h",-6,StuProg.prog_finish))#</cfoutput><cfelse>&nbsp;</cfif></td>
            </tr>
          </table>
          <table width="100%" border="1" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF">
            <tr>
              <th width="33%"><span class="style1">Field</span></th>
              <th><span class="style1">New Value</span></th>
              <th width="33%"><span class="style1">Old Value</span></th>
            </tr>
            <tr valign="baseline">
              <th width="33%" align="right" nowrap="nowrap">Student_Number:</th>
              <td><cfoutput>#StuUpdate.Student_Number#</cfoutput></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Student_Number#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Last_Name#) neq trim(#StuOrig.Last_Name#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Last_Name:</th>
              <td><input type="text" name="Last_Name" value="<cfoutput>#StuUpdate.Last_Name#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Last_Name#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.First_Name#) neq trim(#StuOrig.First_Name#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">First_Name:</th>
              <td><input type="text" name="First_Name" value="<cfoutput>#StuUpdate.First_Name#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.First_Name#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Middle_Name#) neq trim(#StuOrig.Middle_Name#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Middle_Name:</th>
              <td><input type="text" name="Middle_Name" value="<cfoutput>#StuUpdate.Middle_Name#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Middle_Name#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Homelangresult#) neq trim(#StuOrig.Homelangresult#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Homelangresult:</th>
              <td><input type="text" name="Homelangresult" value="<cfoutput>#StuUpdate.Homelangresult#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Homelangresult#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Guardian#) neq trim(#StuOrig.Guardian#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Guardian:</th>
              <td><input type="text" name="Guardian" value="<cfoutput>#StuUpdate.Guardian#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Guardian#</cfoutput>
              <input type="hidden" name="Ethnicity" value="<cfoutput>#StuUpdate.Ethnicity#</cfoutput>" size="32" /></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.ID_Name_Of_Language#) neq trim(#StuOrig.ID_Name_Of_Language#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">ID_Name_Of_Language:</th>
              <td><input type="text" name="ID_Name_Of_Language" value="<cfoutput>#StuUpdate.ID_Name_Of_Language#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.ID_Name_Of_Language#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Parentslang#) neq trim(#StuOrig.Parentslang#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Parentslang:</th>
              <td><input type="text" name="Parentslang" value="<cfoutput>#StuUpdate.Parentslang#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Parentslang#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Dob#) neq trim(#StuOrig.Dob#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Dob:</th>
              <td><input type="text" name="Dob" value="<cfoutput>#LSDateFormat(StuUpdate.Dob,'M/DD/YYYY')#</cfoutput>" size="32" /></td>
              <td width="33%"><cfoutput>#LSDateFormat(StuOrig.Dob,'M/DD/YYYY')#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Birthplace#) neq trim(#StuOrig.Birthplace#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Birthplace:</th>
              <td><input type="text" name="Birthplace" value="<cfoutput>#StuUpdate.Birthplace#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Birthplace#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mailing_Street#) neq trim(#StuOrig.Mailing_Street#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mailing_Street:</th>
              <td><input type="text" name="Mailing_Street" value="<cfoutput>#StuUpdate.Mailing_Street#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mailing_Street#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Street#) neq trim(#StuOrig.Street#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Street:</th>
              <td><input type="text" name="Street" value="<cfoutput>#StuUpdate.Street#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Street#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mailing_City#) neq trim(#StuOrig.Mailing_City#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mailing_City:</th>
              <td><input type="text" name="Mailing_City" value="<cfoutput>#StuUpdate.Mailing_City#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mailing_City#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mailing_State#) neq trim(#StuOrig.Mailing_State#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mailing_State:</th>
              <td><input type="text" name="Mailing_State" value="<cfoutput>#StuUpdate.Mailing_State#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mailing_State#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mailing_Zip#) neq trim(#StuOrig.Mailing_Zip#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mailing_Zip:</th>
              <td><input type="text" name="Mailing_Zip" value="<cfoutput>#StuUpdate.Mailing_Zip#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mailing_Zip#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Home_Phone#) neq trim(#StuOrig.Home_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Home_Phone:</th>
              <td><input type="text" name="Home_Phone" value="<cfoutput>#StuUpdate.Home_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Home_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.GuardianCell_Phone#) neq trim(#StuOrig.GuardianCell_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">GuardianCell_Phone:</th>
              <td><input type="text" name="GuardianCell_Phone" value="<cfoutput>#StuUpdate.GuardianCell_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.GuardianCell_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Guardianemail#) neq trim(#StuOrig.Guardianemail#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Guardianemail:</th>
              <td><input type="text" name="Guardianemail" value="<cfoutput>#StuUpdate.Guardianemail#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Guardianemail#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mother#) neq trim(#StuOrig.Mother#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mother:</th>
              <td><input type="text" name="Mother" value="<cfoutput>#StuUpdate.Mother#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mother#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mother_Employer#) neq trim(#StuOrig.Mother_Employer#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mother_Employer:</th>
              <td><input type="text" name="Mother_Employer" value="<cfoutput>#StuUpdate.Mother_Employer#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mother_Employer#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Motherdayphone#) neq trim(#StuOrig.Motherdayphone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Motherdayphone:</th>
              <td><input type="text" name="Motherdayphone" value="<cfoutput>#StuUpdate.Motherdayphone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Motherdayphone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Mother_Cell_Phone#) neq trim(#StuOrig.Mother_Cell_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Mother_Cell_Phone:</th>
              <td><input type="text" name="Mother_Cell_Phone" value="<cfoutput>#StuUpdate.Mother_Cell_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Mother_Cell_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Father#) neq trim(#StuOrig.Father#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Father:</th>
              <td><input type="text" name="Father" value="<cfoutput>#StuUpdate.Father#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Father#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Father_Employer#) neq trim(#StuOrig.Father_Employer#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Father_Employer:</th>
              <td><input type="text" name="Father_Employer" value="<cfoutput>#StuUpdate.Father_Employer#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Father_Employer#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Fatherdayphone#) neq trim(#StuOrig.Fatherdayphone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Fatherdayphone:</th>
              <td><input type="text" name="Fatherdayphone" value="<cfoutput>#StuUpdate.Fatherdayphone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Fatherdayphone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Father_Cell_Phone#) neq trim(#StuOrig.Father_Cell_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Father_Cell_Phone:</th>
              <td><input type="text" name="Father_Cell_Phone" value="<cfoutput>#StuUpdate.Father_Cell_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Father_Cell_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Contact_1#) neq trim(#StuOrig.Emerg_Contact_1#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Contact_1:</th>
              <td><input type="text" name="Emerg_Contact_1" value="<cfoutput>#StuUpdate.Emerg_Contact_1#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Contact_1#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Phone_1#) neq trim(#StuOrig.Emerg_Phone_1#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Phone_1:</th>
              <td><input type="text" name="Emerg_Phone_1" value="<cfoutput>#StuUpdate.Emerg_Phone_1#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Phone_1#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Contact_2#) neq trim(#StuOrig.Emerg_Contact_2#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Contact_2:</th>
              <td><input type="text" name="Emerg_Contact_2" value="<cfoutput>#StuUpdate.Emerg_Contact_2#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Contact_2#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Phone_2#) neq trim(#StuOrig.Emerg_Phone_2#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Phone_2:</th>
              <td><input type="text" name="Emerg_Phone_2" value="<cfoutput>#StuUpdate.Emerg_Phone_2#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Phone_2#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Contact_3#) neq trim(#StuOrig.Emerg_Contact_3#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Contact_3:</th>
              <td><input type="text" name="Emerg_Contact_3" value="<cfoutput>#StuUpdate.Emerg_Contact_3#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Contact_3#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_3_Phone#) neq trim(#StuOrig.Emerg_3_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_3_Phone:</th>
              <td><input type="text" name="Emerg_3_Phone" value="<cfoutput>#StuUpdate.Emerg_3_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_3_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Contact_4#) neq trim(#StuOrig.Emerg_Contact_4#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Contact_4:</th>
              <td><input type="text" name="Emerg_Contact_4" value="<cfoutput>#StuUpdate.Emerg_Contact_4#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Contact_4#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Emerg_Phone_4#) neq trim(#StuOrig.Emerg_Phone_4#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Emerg_Phone_4:</th>
              <td><input type="text" name="Emerg_Phone_4" value="<cfoutput>#StuUpdate.Emerg_Phone_4#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Emerg_Phone_4#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Alert_Medical#) neq trim(#StuOrig.Alert_Medical#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Alert_Medical:</th>
              <td><input type="text" name="Alert_Medical" value="<cfoutput>#StuUpdate.Alert_Medical#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Alert_Medical#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Doctor_Name#) neq trim(#StuOrig.Doctor_Name#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Doctor_Name:</th>
              <td><input type="text" name="Doctor_Name" value="<cfoutput>#StuUpdate.Doctor_Name#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Doctor_Name#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Doctor_Phone#) neq trim(#StuOrig.Doctor_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th width="33%" align="right" nowrap="nowrap">Doctor_Phone:</th>
              <td><input type="text" name="Doctor_Phone" value="<cfoutput>#StuUpdate.Doctor_Phone#</cfoutput>" size="32" /></td>
              <td width="33%">&nbsp;<cfoutput>#StuOrig.Doctor_Phone#</cfoutput></td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Doctor_Phone#) neq trim(#StuOrig.Doctor_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th align="right" nowrap="nowrap">fedethnicity:</th>
              <td><input type="text" name="fedethnicity" value="<cfoutput>#StuUpdate.fedethnicity#</cfoutput>" size="32" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="baseline"<cfif trim(#StuUpdate.Doctor_Phone#) neq trim(#StuOrig.Doctor_Phone#)> bgcolor="#FFFF99"</cfif>>
              <th align="right" nowrap="nowrap">race</th>
              <td><input type="text" name="race" value="<cfoutput>#StuUpdate.race#</cfoutput>" size="32" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr valign="baseline">
              <th colspan="3" align="right" nowrap="nowrap"><div align="center">
                  <input name="Submit" type="submit" value="Update" />
                </div></th>
            </tr>
          </table>
          <input type="hidden" name="Student_Number" value="<cfoutput>#StuUpdate.Student_Number#</cfoutput>" />
          <input type="hidden" name="MM_UpdateRecord" value="form1" />
        </form>
      </div>
      <div class="bottom"></div>
    </div>
    <div class="clearer"></div>
  </div>
  <div class="clearer"></div>
</div>
<div id="end_body"></div>
<div id="footer"> &copy; 2008-2011 Minidoka County Joint School District #331  <br />
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</body>
</html>
