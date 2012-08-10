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
	UPDATE Registration SET Prog_Locker = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#">, Prog_Finish = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
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
<body onload="form1.username.focus();">
<form id="form1" name="form1" method="post" action="./ProcessFinish.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs">  <cfoutput>#East#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#Fin_Congrats#</cfoutput></h2>
        <cfoutput>#MyInfo.First_Name# #MyInfo.Last_Name# #Fin_Now_Reg# </cfoutput><br />
        <br />
       <cfoutput>#Fin_Note#</cfoutput>
        <br />
        <br />
        &nbsp;
        <div style="font-size:14px; color:#3B6EBF; text-align:center; font-style:italic;"><cfoutput>#Fin_See_You_There#</cfoutput></div>
        <br />
        <br />
        &nbsp;
        <div class="buttons">
          <input type="submit" name="Submit" id="Submit" value="<cfoutput>#Finish#</cfoutput>" />
        </div>
      </div>
      <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="complete"><cfoutput>#Login#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Demographics#</cfoutput></span><br />
          
          <span class="complete"><cfoutput>#Dress_Code#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Computer_Use#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Fees#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Class_Schedule#</cfoutput></span><br />
          <span class="current"><cfoutput>#Finish#</cfoutput></span> </div>
      </div>
      <div id="clear"></div>
    </div>
    <div id="bottom"></div>
  </div>
  <div id="footer"><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</form>
</body>
</html>
