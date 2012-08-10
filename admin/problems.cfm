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
<cfif MyInfo.School neq "ALL">AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
AND Registration.Prog_Demo IS NOT NULL
<cfoutput>#ORDERBY#</cfoutput>
</cfquery>
<cfset stulist = "">
<cfloop query="RegStu"><cfset stulist = stulist & "," & RegStu.Student_Number></cfloop>
<cfquery name="RegStuNC" datasource="RegData">
SELECT RegDemo.*, Registration.RegLang, Registration.Prog_Login, Registration.Prog_Demo, Registration.Grade_Level, Registration.Last_Name as OrigLN, Registration.First_Name as OrigFN, Registration.Middle_Name as OrigMN
FROM RegDemo, Registration
WHERE Registration.Student_Number = RegDemo.Student_Number
AND Registration.Prog_fees IS NULL
AND Registration.Prog_Login IS NOT NULL
<cfif MyInfo.School neq "ALL">AND Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
<cfoutput>#ORDERBY#</cfoutput>
</cfquery>
<cfquery name="Recordset1" datasource="RegData">
SELECT Student_Number
FROM Registration 
<cfif MyInfo.School neq "ALL">WHERE Registration.SchoolID = <cfqueryparam value="#MyInfo.School#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfset MaxRows_RegStu=50>
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

function doreset(who, stuname) {
	var answer = confirm("Are you sure you want to reset " + stuname + "? (This action cannot be undone.)");
	if (answer) {window.location = "./reset.cfm?student_number=" + who;}
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
        <h1><cfswitch expression="#MyInfo.School#"><cfcase value="ALL">All Schools</cfcase><cfcase value="301">Minico High School</cfcase><cfcase value="201">East Minico Middle School</cfcase><cfcase value="202">West Minico Middle School</cfcase></cfswitch> - Students</h1>
        <p>
          <input name="Return" type="button" id="Return" onclick="MM_goToURL('parent','./status.cfm');return document.MM_returnValue" value="Return Home" />
        </p>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <th scope="col"><cfif #Sort# eq "OrigName">
                <span class="style1"><a class="style1" href="/admin/problems.cfm?Sort=OrigName1">Original Name  </a>
                <cfelseif #Sort# eq "OrigName1">
                <a class="style1" href="/admin/problems.cfm?Sort=OrigName">Original Name </a>
                <cfelse>
                <a class="style1" href="/admin/problems.cfm?Sort=OrigName">Original Name </a> </span>
              </cfif></th>
            <th scope="col"><cfif #Sort# eq "Name">
                <span class="style1"><a class="style1" href="/admin/problems.cfm?Sort=Name1">Name  </a>
                <cfelseif #Sort# eq "Name1">
                <a class="style1" href="/admin/problems.cfm?Sort=Name">Name </a>
                <cfelse>
                <a class="style1" href="/admin/problems.cfm?Sort=Name">Name </a> </span>
              </cfif></th>
            <th scope="col"><cfif #Sort# eq "Grade">
                <span class="style1"><a class="style1" href="/admin/problems.cfm?Sort=Grade1">Grade  </a>
                <cfelseif #Sort# eq "Grade1">
                <a class="style1" href="/admin/problems.cfm?Sort=Grade">Grade </a>
                <cfelse>
                <a class="style1" href="/admin/problems.cfm?Sort=Grade">Grade </a> </span>
              </cfif></th>
            <th scope="col"><cfif #Sort# eq "DT">
                <span class="style1"><a class="style1" href="/admin/problems.cfm?Sort=DT1">Date/Time  </a>
                <cfelseif #Sort# eq "DT1">
                <a class="style1" href="/admin/problems.cfm?Sort=DT">Date/Time </a>
                <cfelse>
                <a class="style1" href="/admin/problems.cfm?Sort=DT">Date/Time </a> </span>
              </cfif></th>
            <th scope="col"><span class="style1">Language</span></th>
            <th scope="col">Guardian</th>
            <th scope="col">Reset</th>
            
          </tr>
          <cfoutput query="regstunc" startrow="#StartRow_RegStu#" maxrows="#MaxRows_RegStu#">
            <tr>
              <td scope="col"<cfif #trim(regstunc.OrigLN)# neq #trim(regstunc.Last_Name)# or #trim(regstunc.OrigFN)# neq #trim(regstunc.First_Name)#> bgcolor="##FFFF00"<cfelseif #trim(regstunc.OrigMN)# neq #trim(regstunc.Middle_Name)#> bgcolor="##FFFFCC"</cfif>><div align="left" style="text-transform:capitalize">#regstunc.OrigLN#, #regstunc.OrigFN# #regstunc.OrigMN#</div></td>
              <td scope="col"<cfif #trim(regstunc.OrigLN)# neq #trim(regstunc.Last_Name)# or #trim(regstunc.OrigFN)# neq #trim(regstunc.First_Name)#> bgcolor="##FFFF00"<cfelseif #trim(regstunc.OrigMN)# neq #trim(regstunc.Middle_Name)#> bgcolor="##FFFFCC"</cfif>><div align="left" style="text-transform:capitalize"><a href="/admin/prob_details.cfm?Student_Number=#regstunc.Student_Number#">#regstunc.Last_Name#, #regstunc.First_Name# #regstunc.Middle_Name#</a></div></td>
              <td scope="col"><div align="center">#regstunc.Grade_Level#</div></td>
              <td scope="col"><div align="center">#LSDateFormat(dateadd("h",-6,regstunc.Prog_Login),'MMM D')#, #lcase(LSTimeFormat(dateadd("h",-6,regstunc.Prog_Login),'h:mmtt'))#</div></td>
              <td scope="col"><div align="center">#regstunc.RegLang#</div></td>

              <td scope="col"><div align="left">#regstunc.Guardian#</div></td>
              <td scope="col" style="text-align:right;"><a href="javascript:;" style="text-decoration:none; border:none;" onclick="doreset(#regstunc.student_number#,'#regstunc.Last_Name#, #regstunc.First_Name#');"><img src="/admin/images/table_refresh.gif" width="16" height="16" alt="Reset" style="border:none;" /></a></td>
              
            </tr>
          </cfoutput>
          <cfif regstunc.recordcount eq 0>
          <tr>
            <td colspan="7">
            No Records Found.
            </td>
          </tr>
          </cfif>
          <tr>
            <td colspan="7" scope="col"><div align="center">
              <table border="0">
                <cfoutput>
                  <tr>
                    <td><cfif PageNum_RegStu GT 1>
                        <a href="#CurrentPage#?PageNum_RegStu=1#QueryString_RegStu#">First</a>
                      </cfif>
                    </td>
                    <td><cfif PageNum_RegStu GT 1>
                        <a href="#CurrentPage#?PageNum_RegStu=#Max(DecrementValue(PageNum_RegStu),1)##QueryString_RegStu#">Previous</a>
                      </cfif>
                    </td>
                    <td><cfif PageNum_RegStu LT TotalPages_RegStu>
                        <a href="#CurrentPage#?PageNum_RegStu=#Min(IncrementValue(PageNum_RegStu),TotalPages_RegStu)##QueryString_RegStu#">Next</a>
                      </cfif>
                    </td>
                    <td><cfif PageNum_RegStu LT TotalPages_RegStu>
                        <a href="#CurrentPage#?PageNum_RegStu=#TotalPages_RegStu##QueryString_RegStu#">Last</a>
                      </cfif>
                    </td>
                  </tr>
                </cfoutput>
              </table>
            </div>
              <div align="center"></div>
              <label>
              <div align="center"></div>
              </label>
              <div align="center"></div></td>
          </tr>
        </table><div align="center"><a href="<cfoutput>#CurrentPage#?MM_logout=1</cfoutput>">Logout</a><br />
&nbsp;</div>
      </div>
      <div class="bottom"></div>
    </div>
    <div class="clearer">
      
    </div>
  </div>
  <div class="clearer"></div>
</div>
<div id="end_body"></div>
<div id="footer"> &copy; 2008-2011 Minidoka County Joint School District #331  <br />
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</body>
</html>
