<cfparam name="SESSION.Student_Number" default="0">
<cfif SESSION.Student_Number eq 0>
  <cflocation addtoken="no" url="/">
</cfif>
<cfif SESSION.Language eq "English">
  <cfinclude template="/Lang/English.cfm">
  <cfinclude template="Lang/English.cfm">
  <cfelse>
  <cfinclude template="/Lang/Spanish.cfm">
  <cfinclude template="Lang/Spanish.cfm">
</cfif>
<cfquery name="MyInfo" datasource="RegData">
	SELECT * FROM Registration WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfquery name="UDMe" datasource="RegData">
	UPDATE Registration SET Prog_Dress = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
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
<body>
<form id="form1" name="form1" method="post" action="./ProcessComp.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs">  <cfoutput>#Minico#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#C_Computer_Internet_Use#</cfoutput>:</h2>
        <div align="justify"><cfoutput>#replace(C_Text,chr(10),chr(10)&"<br />","ALL")#</cfoutput><br />
<br />
        </div>
        <div style="text-align:center"><cfif SESSION.Language eq "English">
          <a href="javascript:;" onclick="MM_openBrWindow('https://registration.minidokaschools.org/files/eng_internetuse.pdf','myWin','scrollbars=yes,width=640,height=480')"><img src="/images/pdf_icon.gif" alt="<cfoutput>#C_Computer_Use_Form#</cfoutput>" width="100" height="100" border="0" /><cfelse><a href="javascript:;" onclick="MM_openBrWindow('https://registration.minidokaschools.org/files/esp_internetuse.pdf','myWin','scrollbars=yes,width=640,height=480')"><img src="/images/pdf_icon.gif" alt="<cfoutput>#C_Computer_Use_Form#</cfoutput>" width="100" height="100" border="0" /></cfif><br />
        <cfoutput>#C_Computer_Use_Form#</cfoutput></a></div>
        </p>
        <p align="left">&nbsp;</p>
        <div style="text-align:center"></div>
        <div class="buttons">
          <input type="submit" name="Submit" id="Submit" value="<cfoutput>#Cont#</cfoutput>" />
        </div>
      </div>
      <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="complete"><cfoutput>#Login#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Demographics#</cfoutput></span><br />
          
          <span class="complete"><cfoutput>#Dress_Code#</cfoutput></span><br />
          <span class="current"><cfoutput>#Computer_Use#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Fees#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Class_Schedule#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Finish#</cfoutput></span> </div>
      </div>
      <div id="clear"></div>
    </div>
    <div id="bottom"></div>
  </div>
  <div id="footer"><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</form>
</body>
</html>
