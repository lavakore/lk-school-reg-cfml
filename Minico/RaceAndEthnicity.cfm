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
<cfquery name="MyDemo" datasource="RegData">
	SELECT * FROM RegDemo WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfquery name="MyRace" datasource="RegData">
	SELECT * FROM studentrace WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfset race = valuelist(myrace.racecd)>
<cfquery name="UDMe" datasource="RegData">
	UPDATE Registration SET Prog_demo = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Minidoka Schools Registration</title>
<link href="/inc/screenstyles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="/inc/printstyles.css" rel="stylesheet" type="text/css" media="print" />
<script src="/inc/SpryAssets/SpryValidationRadio.js" type="text/javascript"></script>
<script src="/inc/SpryAssets/SpryValidationCheckbox.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function doSub() {
if(Spry.Widget.Form.validate(document.form1))
  {document.form1.submit();}else{MM_goToURL('parent','#Start');}
}
//-->
</script>
<link href="/inc/SpryAssets/SpryValidationRadio.css" rel="stylesheet" type="text/css" />
<link href="/inc/SpryAssets/SpryValidationCheckbox.css" rel="stylesheet" type="text/css" />
</head>
<body onload="form1.username.focus();">
<form id="form1" name="form1" method="post" action="./ProcessRace.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs">  <cfoutput>#Minico#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#R_Race_And_Ethnicity#</cfoutput>:</h2>
        <p><cfoutput>#R_Note#</cfoutput><br />
          &nbsp;<br />
        </p>
        <table width="95%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td width="65" valign="top"><cfoutput>#R_Part_A#:</cfoutput></td>
            <td><cfoutput>#R_Part_A_Question#</cfoutput><br />
              <span id="spryfedethnicity">
              <label>
                <input type="radio" name="fedethnicity" value="0" id="fedethnicity_0" <cfif mydemo.fedethnicity eq 0>checked="checked"</cfif> />
                <cfoutput>#R_Part_A_Answer_1#</cfoutput></label>
<br />
              <label>
                <input type="radio" name="fedethnicity" value="1" id="fedethnicity_1" <cfif mydemo.fedethnicity eq 1>checked="checked"</cfif> />
                <cfoutput>#R_Part_A_Answer_2#</cfoutput></label>
<span style="font-size:0.75em;"><cfoutput>#R_Part_A_Answer_2_Description#</cfoutput></span><br />
              <span class="radioRequiredMsg"><cfoutput>#R_Error#</cfoutput><a href="javascript:;" onclick="MM_openBrWindow('./race-ethnicity-faq.cfm','faqwin','scrollbars=yes,width=800,height=600')"> <cfoutput>#R_Error_FAQ#</cfoutput></a>.</span></span></td>
          </tr>
          <tr>
            <td colspan="2" valign="top"><br />
              <cfoutput>#R_Center_Note#</cfoutput><br />
            &nbsp;</td>
          </tr>
          <tr>
            <td width="65" valign="top"><cfoutput>#R_Part_B#</cfoutput>:</td>
            <td><p><cfoutput>#R_Part_B_Question#</cfoutput>
              </p>
              <p><span id="sprycheckbox1">
                <label>
                  <input type="checkbox" name="Race" value="1" id="Race_0" <cfif race contains "1">checked="checked"</cfif> />
                  <strong><cfoutput>#R_Part_B_Answer_1#</cfoutput></strong></label>
                <span style="font-size:0.75em;"><cfoutput>#R_Part_B_Answer_1_Description#</cfoutput></span><br />
                <label>
                  <input type="checkbox" name="Race" value="2" id="Race_1" <cfif race contains "2">checked="checked"</cfif> />
                  <strong><cfoutput>#R_Part_B_Answer_2#</cfoutput></strong></label>
                <span style="font-size:0.75em;"><cfoutput>#R_Part_B_Answer_2_Description#</cfoutput></span><br />
                <label>
                  <input type="checkbox" name="Race" value="3" id="Race_2" <cfif race contains "3">checked="checked"</cfif> />
                  <strong><cfoutput>#R_Part_B_Answer_3#</cfoutput></strong></label>
                <span style="font-size:0.75em;"><cfoutput>#R_Part_B_Answer_3_Description#</cfoutput></span><br />
                <label>
                  <input type="checkbox" name="Race" value="4" id="Race_3" <cfif race contains "4">checked="checked"</cfif> />
                  <strong><cfoutput>#R_Part_B_Answer_4#</cfoutput></strong></label>
                <span style="font-size:0.75em;"><cfoutput>#R_Part_B_Answer_4_Description#</cfoutput></span><br />
                <label>
                  <input type="checkbox" name="Race" value="5" id="Race_4" <cfif race contains "5">checked="checked"</cfif> />
                  <strong><cfoutput>#R_Part_B_Answer_5#</cfoutput></strong><span style="font-size:0.75em;"><cfoutput>#R_Part_B_Answer_5_Description#</cfoutput></span><br /></label>
                <span class="checkboxMinSelectionsMsg"><cfoutput>#R_Error#</cfoutput><a href="javascript:;" onclick="MM_openBrWindow('./race-ethnicity-faq.cfm','faqwin','scrollbars=yes,width=800,height=600')"> <cfoutput>#R_Error_FAQ#</cfoutput></a>.</span></span><br />
            </p></td>
          </tr>
        </table>
        <p><br />
        </p>
        
        <p align="left">&nbsp;</p>
        <div style="text-align:center"></div>
        <div class="buttons">
          <input type="button" name="Button" id="Submit" onclick="doSub();" value="<cfoutput>#Cont#</cfoutput>" />
        </div>
      </div>
      <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="complete"><cfoutput>#Login#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Demographics#</cfoutput></span><br />
          <span class="current"><cfoutput>#Ethnicity_Race#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Dress_Code#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Computer_Use#</cfoutput></span><br />
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
<script type="text/javascript">
<!--
var spryradio1 = new Spry.Widget.ValidationRadio("spryfedethnicity");
var sprycheckbox1 = new Spry.Widget.ValidationCheckbox("sprycheckbox1", {isRequired:false, minSelections:1});
//-->
</script>
</body>
</html>
