<cfif IsDefined("URL.MM_logout") AND URL.MM_logout EQ "1">
  <cflock scope="Session" type="Exclusive" timeout="30" throwontimeout="no">
    <cfset Session.MM_Username="">
    <cfset Session.MM_UserAuthorization="">
  </cflock>
  <cfset MM_logoutRedirectPage="/admin/">
  <cfif MM_logoutRedirectPage EQ "">
    <cfset MM_logoutRedirectPage=CGI.SCRIPT_NAME>
  </cfif>
  <cfset MM_logoutQuery=ListDeleteAt(CGI.QUERY_STRING,ListContainsNoCase(CGI.QUERY_STRING,"MM_logout=","&"),"&")>
  <cfif MM_logoutQuery NEQ "">
    <cfif Find("?",MM_logoutRedirectPage) EQ 0>
      <cfset MM_logoutRedirectPage=MM_logoutRedirectPage & "?" & MM_logoutQuery>
      <cfelse>
      <cfset MM_logoutRedirectPage=MM_logoutRedirectPage & "&" & MM_logoutQuery>
    </cfif>
  </cfif>
  <cflocation url="#MM_logoutRedirectPage#" addtoken="no">
</cfif>
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
<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>
<cfparam name="PageNum_RegStu" default="1">
<cfparam name="Sort" default="DT">
<cfset #ORDERBY# = "">
<cfif #Sort# eq "DT">
  <cfset #ORDERBY# = "ORDER BY Registration.Prog_Login DESC">
</cfif>
<cfif #Sort# eq "Name">
  <cfset #ORDERBY# = "ORDER BY Last_Name, First_Name, Middle_Name">
</cfif>
<cfif #Sort# eq "Grade">
  <cfset #ORDERBY# = "ORDER BY Registration.Grade_Level, Last_Name, First_Name, Middle_Name">
</cfif>
<cfif #Sort# eq "OrigName">
  <cfset #ORDERBY# = "ORDER BY Registration.Last_Name, Registration.First_Name, Registration.Middle_Name">
</cfif>
<cfif #Sort# eq "DT1">
  <cfset #ORDERBY# = "ORDER BY Registration.Prog_Login ASC">
</cfif>
<cfif #Sort# eq "Name1">
  <cfset #ORDERBY# = "ORDER BY Last_Name DESC, First_Name DESC, Middle_Name DESC">
</cfif>
<cfif #Sort# eq "Grade1">
  <cfset #ORDERBY# = "ORDER BY Registration.Grade_Level DESC, Last_Name, First_Name, Middle_Name">
</cfif>
<cfif #Sort# eq "OrigName1">
  <cfset #ORDERBY# = "ORDER BY Registration.Last_Name DESC, Registration.First_Name DESC, Registration.Middle_Name DESC">
</cfif>
<cfquery name="RegStu" datasource="RegData">
SELECT regdemofixed.*, Registration.RegLang, Registration.Prog_Login, Registration.Prog_Demo, Registration.Grade_Level, Registration.Last_Name as OrigLN, Registration.First_Name as OrigFN, Registration.Middle_Name as OrigMN
FROM regdemofixed, Registration
WHERE Registration.Student_Number = regdemofixed.Student_Number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
<cfoutput>#ORDERBY#</cfoutput>
</cfquery>
<cfset stulist = "">
<cfloop query="RegStu"><cfset stulist = stulist & "," & RegStu.Student_Number></cfloop>
<cfquery name="RegStuNC" datasource="RegData">
SELECT Registration.Prog_Demo, Registration.Prog_Login
FROM Registration
WHERE Registration.prog_fees IS NULL AND Registration.Prog_Login IS NOT NULL
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="Reg6" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 6 
</cfquery>
<cfquery name="Reg7" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 7 
</cfquery>
<cfquery name="Reg8" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 8 
</cfquery>
<cfquery name="Reg9" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 9 
</cfquery>
<cfquery name="Reg10" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 10 
</cfquery>
<cfquery name="Reg11" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 11 
</cfquery>
<cfquery name="Reg12" datasource="RegData">
SELECT Registration.Grade_Level, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.Prog_Demo IS NOT NULL
AND Registration.student_number = regdemofixed.student_number
<cfif MyInfo.School neq "ALL">
AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif> AND Registration.Grade_Level = 12 
</cfquery>
<cfquery name="Recordset1" datasource="RegData">
SELECT Student_Number
FROM Registration 
<cfif MyInfo.School neq "ALL">WHERE Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<!---<cfquery name="D3" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number 
AND Registration.Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/3/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/4/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D4" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number 
AND Registration.Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/4/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/5/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D5" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number 
AND Registration.Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/5/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/6/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D6" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/6/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/7/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D7" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/7/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/8/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D8" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/8/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/9/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D9" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/9/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/10/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D10" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/10/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/11/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D11" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/11/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/12/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D12" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/12/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/13/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D13" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_date" value="08/13/2011">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_date" value="08/14/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>--->
<cfquery name="D14" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
<!---AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/14/2011">--->
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="08/15/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D15" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="08/15/2011 06:00:00">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="08/16/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D16" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="08/16/2011 06:00:00">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/17/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D17" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/17/2011 06:00:00">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/18/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D18" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/18/2011 06:00:00">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/19/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D19" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/19/2011 06:00:00">
AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/20/2011 06:00:00">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfquery name="D20" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/20/2011 06:00:00">
<!---AND Registration.Prog_Demo < <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/21/2011">--->
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<!---<cfquery name="D21" datasource="RegData">
SELECT Registration.Prog_Login, regdemofixed.Student_Number
FROM Registration, regdemofixed
WHERE Registration.student_number = regdemofixed.student_number
AND Prog_Demo >= <cfqueryparam cfsqltype="cf_sql_timestamp" value="08/21/2011">
<cfif MyInfo.School neq "ALL">
AND SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>--->
<cfset MaxRows_RegStu=25>
<cfset StartRow_RegStu=Min((PageNum_RegStu-1)*MaxRows_RegStu+1,Max(RegStu.RecordCount,1))>
<cfset EndRow_RegStu=Min(StartRow_RegStu+MaxRows_RegStu-1,RegStu.RecordCount)>
<cfset TotalPages_RegStu=Ceiling(RegStu.RecordCount/MaxRows_RegStu)>
<cfset QueryString_RegStu=Iif(CGI.QUERY_STRING NEQ "",DE("&"&XMLFormat(CGI.QUERY_STRING)),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_RegStu,"PageNum_RegStu=","&")>
<cfif tempPos NEQ 0>
  <cfset QueryString_RegStu=ListDeleteAt(QueryString_RegStu,tempPos,"&")>
</cfif>
<cffunction name="FormatPhone" returntype="string" output="yes">
  <cfargument name="Phone" default="0" required="yes">
  <cfset #Phone1# = #Phone#>
  <cfset #Phone2# = trim(rereplace(#Phone#,"[^0-9]","","ALL"))>
  <cfif len(#Phone2#) eq 7>
    <cfset #Phone2# = "(208) " & left(#Phone2#,3) & "-" & right(#Phone2#,4)>
    <cfelseif len(#Phone2#) eq 10>
    <cfset #Phone2# = "(" & left(#Phone2#,3) & ") " & mid(#Phone2#,3,3) & "-" & right(#Phone2#,4)>
    <cfelse>
    <cfset #Phone2# = #Phone1#>
  </cfif>
  <cfreturn "#Phone2#">
</cffunction>
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
<title>Registration '11 Admin Status</title>
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<meta http-equiv="Refresh" content="15" />
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
        <h1><cfswitch expression="#MyInfo.School#"><cfcase value="ALL">All Schools</cfcase><cfcase value="301">Minico High School</cfcase><cfcase value="201">East Minico Middle School</cfcase><cfcase value="202">West Minico Middle School</cfcase></cfswitch> - Status</h1>
        <p><cfoutput>#numberformat(RegStu.RecordCount/Recordset1.RecordCount*100,"0.00")#</cfoutput>% (<cfoutput>#RegStu.RecordCount# of #Recordset1.RecordCount#</cfoutput>) Registered.</p>
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%"><div align="center"><strong>
                <cfchart format="png" show3d="yes">
                <cfchartseries type="pie" colorlist="##FFCC33,##AA0000">
                <cfchartdata item="Students Registered" value="#RegStu.RecordCount#">
                <cfchartdata item="Students Not Registered" value="#Recordset1.RecordCount - RegStu.RecordCount - RegStuNC.RecordCount#">
                <cfchartdata item="Students Not Completed" value="#RegStuNC.RecordCount#">
                </cfchartseries>
                </cfchart>
                </strong></div></td>
            <td><div align="center">
                <cfchart format="png" show3d="yes">
                <cfchartseries type="pie" colorlist="##0099CC,##FF9900,##FFCC33,##99CC00" >
                <cfif MyInfo.School eq "ALL" or MyInfo.School eq 201 or MyInfo.School eq 202>
                  <cfchartdata item="6th Grade" value="#Reg6.RecordCount#">
                  <cfchartdata item="7th Grade" value="#Reg7.RecordCount#">
                  <cfchartdata item="8th Grade" value="#Reg8.RecordCount#">
                </cfif>
                <cfif MyInfo.School eq "ALL" or MyInfo.School eq 301>
                  <cfchartdata item="9th Grade" value="#Reg9.RecordCount#">
                  <cfchartdata item="10th Grade" value="#Reg10.RecordCount#">
                  <cfchartdata item="11th Grade" value="#Reg11.RecordCount#">
                  <cfchartdata item="12th Grade" value="#Reg12.RecordCount#">
                </cfif>
                </cfchartseries>
                </cfchart>
              </div></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <cfchart format="png" xaxistitle="Date" yaxistitle="Registrations" show3d="yes" chartwidth="550">
                <cfchartseries type="bar">
                <!---<cfchartdata item="03" value="#D3.RecordCount#">
                <cfchartdata item="04" value="#D4.RecordCount#">
                <cfchartdata item="05" value="#D5.RecordCount#">
                <cfchartdata item="06" value="#D6.RecordCount#">
                <cfchartdata item="07" value="#D7.RecordCount#">
                <cfchartdata item="08" value="#D8.RecordCount#">
                <cfchartdata item="09" value="#D9.RecordCount#">
                <cfchartdata item="10" value="#D10.RecordCount#">
                <cfchartdata item="11" value="#D11.RecordCount#">
                <cfchartdata item="12" value="#D12.RecordCount#">
                <cfchartdata item="13" value="#D13.RecordCount#">--->
                <cfchartdata item="14" value="#D14.RecordCount#">
                <cfchartdata item="15" value="#D15.RecordCount#">
                <cfchartdata item="16" value="#D16.RecordCount#">
                <cfchartdata item="17" value="#D17.RecordCount#">
                <cfchartdata item="18" value="#D18.RecordCount#">
                <cfchartdata item="19" value="#D19.RecordCount#">
                <cfchartdata item="20" value="#D20.RecordCount#">
                <!---<cfchartdata item="21" value="#D21.RecordCount#">--->
                </cfchartseries>
                </cfchart>
              </div></td>
          </tr>
        </table>
        <p align="center"><a href="view.cfm">View Students that have registered.</a></p>
        <p align="center"><a href="problems.cfm">View Students that have started and not completed.</a></p>
      <p align="center"><a href="<cfoutput>#CurrentPage#?MM_logout=1</cfoutput>">Logout
      </a><br />&nbsp;</p>
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
