<cfif cgi.https eq "off">
  <cflocation url="https://registration.minidokaschools.org" addtoken="no">
</cfif>
<cfparam name="SESSION.Language" default="English">
<cfif SESSION.Language eq "English">
  <cfinclude template="/Lang/English.cfm">
  <cfelse>
  <cfinclude template="/Lang/Spanish.cfm">
</cfif>
<cfset RetryLogin = False>
<cflock scope="session" type="readonly" timeout="20">
  <cfif isdefined("SESSION.LoginRetry") and SESSION.LoginRetry eq "true">
    <cfset RetryLogin = true>
  </cfif>
</cflock>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Minidoka Schools Registration</title>
<link href="/inc/screenstyles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="/inc/printstyles.css" rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body onload="form1.username.focus();">
<form id="form1" name="form1" method="post" action="/ProcessLogin.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs"> <cfoutput>#Minico#</cfoutput> | <cfoutput>#East#</cfoutput> | <cfoutput>#West#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#Wel_Welcome#</cfoutput></h2>
        <div align="center"><br />
          <br />
          <br />
          <br />
          <strong>Online Registration is temporarily unavailable. Please try back later.</strong><br />
          <br />
          <br />
          <br />
          <br />
        </div>
      </div>
      <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="current"><cfoutput>#Login#</cfoutput></span><br />
          <!---<span class="incomplete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Demographics#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Dress_Code#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Computer_Use#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Fees#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Class_Schedule#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Locker#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Finish#</cfoutput></span> ---></div>
      </div>
      <div id="clear"></div>
    </div>
    <div id="bottom"></div>
  </div>
  <div id="footer"><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</form>
</body>
</html>
