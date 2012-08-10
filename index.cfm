<!---<cflocation addtoken="no" url="down.cfm">--->
<!---cfif cgi.https neq "on">
  <cflocation url="https://registration.minidokaschools.org" addtoken="no">
</cfif--->
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
<script src="/inc/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="/inc/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function redirectSecure()
{
if (document.location.protocol != "https:"){
var oldURL = window.location.hostname + window.location.pathname+window.location.search;
var newURL = "https://" + oldURL;
window.location = newURL;
}
}
redirectSecure();
//-->
</script>
</head>
<body onload="form1.username.focus();">
<form id="form1" name="form1" method="post" action="https://registration.minidokaschools.org/ProcessLogin.cfm">
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
        <cfoutput>#Wel_P1#</cfoutput> <br />
        <br />
        <cfoutput>#Wel_P2#</cfoutput><br />
        <br />
        <div style="text-align:center">
          <cfif RetryLogin eq true>
            <span style="font-weight:bold;color:#FF0000;"><cfoutput>#Wel_P6#</cfoutput></span><br />
            <br />
          </cfif>
          <strong><cfoutput>#Wel_P3#</cfoutput>:</strong><br />
          </span> <span style="text-align:center"><span id="spryusername">
          <input name="username" type="text" id="username" size="32" />
          <br />
          <span class="textfieldRequiredMsg"><cfoutput>#Wel_P7#</cfoutput></span></span><br />
          <strong><cfoutput>#Wel_P4#</cfoutput>:</strong><br />
          <span id="sprypassword">
          <input name="password" type="password" id="password" size="32" />
          <br />
          <span class="textfieldRequiredMsg"><cfoutput>#Wel_P8#</cfoutput></span></span><br />
          <input type="submit" name="Submit" id="Submit" value="<cfoutput>#Cont#</cfoutput>" /> <br />
          <br />
          <br />
          <a href="/ProcessLang.cfm"><cfoutput>#OtherLang#</cfoutput></a> </div>
        
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
<script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("spryusername", "none");
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprypassword");
//-->
</script>
</body>
</html>
