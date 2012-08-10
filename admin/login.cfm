<cfif IsDefined("FORM.username")>
  <cfset MM_redirectLoginSuccess="status.cfm">
  <cfset MM_redirectLoginFailed="login.cfm?error=true">
  <cfquery  name="MM_rsUser" datasource="RegData">
  SELECT username,password FROM users WHERE username=<cfqueryparam value="#FORM.username#" cfsqltype="cf_sql_clob" maxlength="50"> AND password=<cfqueryparam value="#FORM.password#" cfsqltype="cf_sql_clob" maxlength="50">
  </cfquery>
  <cfif MM_rsUser.RecordCount NEQ 0>
    <cftry>
      <cflock scope="Session" timeout="30" type="Exclusive">
        <cfset Session.MM_Username=FORM.username>
        <cfset Session.MM_UserAuthorization="">
      </cflock>
      <cfif IsDefined("URL.accessdenied") AND false>
        <cfset MM_redirectLoginSuccess=URL.accessdenied>
      </cfif>
      <cflocation url="#MM_redirectLoginSuccess#" addtoken="no">
      <cfcatch type="Lock">
        <!--- code for handling timeout of cflock --->
      </cfcatch>
    </cftry>
  </cfif>
  <cflocation url="#MM_redirectLoginFailed#" addtoken="no">
  <cfelse>
  <cfset MM_LoginAction=CGI.SCRIPT_NAME>
  <cfif CGI.QUERY_STRING NEQ "">
    <cfset MM_LoginAction=MM_LoginAction & "?" & XMLFormat(CGI.QUERY_STRING)>
  </cfif>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
<meta name="Robots" content="noindex,nofollow" />
<title>Registration '11
 Admin Login</title>
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
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
        <h1>Login</h1>
        <form id="LoginFrm" name="LoginFrm" method="POST" action="<cfoutput>#MM_loginAction#</cfoutput>">
          <table border="0" cellspacing="0" cellpadding="0" style="margin:0 auto;">
            <tr>
              <th valign="middle" scope="col"><label for="username">
                <div align="left">Username:</div>
                </label></th>
              <th scope="col"><div align="left">
                  <input type="text" name="username" id="username" />
                </div></th>
            </tr>
            <tr>
              <th valign="middle"><label for="password">
                <div align="left">Password:</div>
                </label></th>
              <td><div align="left">
                  <input type="password" name="password" id="password" />
                </div></td>
            </tr>
            <tr>
              <th valign="middle"><div align="left"></div></th>
              <td><div align="left">
                  <input type="submit" name="submit" id="submit" value="Login" />
                </div></td>
            </tr>
          </table>
        </form>
      </div>
      <div class="bottom"></div>
    </div>
    <div class="clearer"></div>
  </div>
  <div class="clearer"></div>
</div>
<div id="end_body"></div>
<div id="footer"> &copy; 2008-2011 Minidoka County Joint School District #331 <br />
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</body>
</html>
