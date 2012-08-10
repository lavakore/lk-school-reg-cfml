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
<cfquery name="UDMe" datasource="RegData">
	UPDATE Registration SET Prog_Demo = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Minidoka Schools Registration</title>
<link href="/inc/screenstyles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="/inc/printstyles.css" rel="stylesheet" type="text/css" media="print" />
<script src="/inc/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="/inc/SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<link href="/inc/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="/inc/SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
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
<style type="text/css">
<!--
body,td,th {
	font-size: 0.74em;
}
-->
</style></head>
<body onload="form1.username.focus();">
<form id="form1" name="form1" method="post" action="./ProcessDemo.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs">  <cfoutput>#West#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#Demographics#</cfoutput>:</h2>
        <p><strong><cfoutput>#D_Please_Verify#</cfoutput></strong><br />
          <br />
        </p>
        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
          <tr>
        <td valign="top"><strong><cfoutput>#D_Students_legal_last_name#</cfoutput></strong></td>
        <td><span id="spryLastFirst">
            <input name="Last_Name" type="text" id="Last_Name" value="<cfoutput>#MyDemo.Last_Name#</cfoutput>" size="28" />
            <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
        <td valign="top"><strong><cfoutput>#D_Students_legal_First_Name#</cfoutput></strong></td>
        <td><span id="sprytextfield33">
            <input name="First_Name" type="text" id="First_Name" value="<cfoutput>#MyDemo.First_Name#</cfoutput>" size="28" />
            <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
        <td valign="top"><strong><cfoutput>#D_Students_legal_middle_name#</cfoutput></strong></td>
        <td><span id="sprytextfield32">
        <input name="Middle_Name" type="text" id="Middle_Name" value="<cfoutput>#MyDemo.Middle_Name#</cfoutput>" size="28" />
        </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Birthdate#</cfoutput></strong></td>
      <td><span id="spryDOB2">
        <input name="DOB" type="text" id="DOB" value="<cfoutput>#LSDateFormat(MyDemo.Dob,'M/D/YYYY')#</cfoutput>" size="15" />
        <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span><span class="textfieldInvalidFormatMsg">Invalid format. (mm/dd/yyyy</span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Birthplace#</cfoutput></strong></td>
      <td><span id="spryBirthplace2">
        <input name="Birthplace" type="text" id="Birthplace" value="<cfoutput>#MyDemo.Birthplace#</cfoutput>" size="28" />
        <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput> (City, State) </span></span></td>
    </tr>
    
    <tr>
      <td valign="top"><strong><cfoutput>#D_Parent_Guardian#</cfoutput></strong></td>
      <td><span id="spryGuardian">
          <input name="Guardian" type="text" id="Guardian" value="<cfoutput>#MyDemo.Guardian#</cfoutput>" size="28" />
          <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Gender#</cfoutput></strong></td>
      <td><cfif #MyDemo.Gender# eq "M">
          <cfoutput>#D_Male#</cfoutput>
          <cfelse>
          <cfoutput>#D_Female#</cfoutput>
        </cfif></td>
    </tr>
    <!---tr>
      <td valign="top"><strong><cfoutput>#D_Ethnicity#</cfoutput></strong></td>
      <td><cfif #MyDemo.Ethnicity# eq 1>
          American Indian
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 2>
          Asian
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 3>
          Black/African American
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 4>
          Native Hawaiian/Pacific Islander
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 5>
          Caucasian
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 6>
          Hispanic/Latin American
        </cfif>
        <cfif #MyDemo.Ethnicity# eq 7>
          Other/Unknown
        </cfif></td>
    </tr--->
    <tr>
      <td valign="top"><strong><cfoutput>#D_Students_Language#</cfoutput></strong></td>
      <td><span id="spryID_Name_of_Language">
          <select name="ID_Name_of_Language" id="ID_Name_of_Language">
              <option value="" <cfif (isDefined("MyDemo.ID_Name_Of_Language") AND "" EQ MyDemo.ID_Name_Of_Language)>selected="selected"</cfif>></option>
              <option value="English" <cfif (isDefined("MyDemo.ID_Name_Of_Language") AND "English" EQ MyDemo.ID_Name_Of_Language)>selected="selected"</cfif>>Proficient English</option>
              <option value="Limited" <cfif (isDefined("MyDemo.ID_Name_Of_Language") AND "Limited" EQ MyDemo.ID_Name_Of_Language)>selected="selected"</cfif>>Limited English</option>
              <option value="No" <cfif (isDefined("MyDemo.ID_Name_Of_Language") AND "No" EQ MyDemo.ID_Name_Of_Language)>selected="selected"</cfif>>No English</option>
          </select>
          <span class="selectRequiredMsg"><br /><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Parents_Language#</cfoutput></strong></td>
      <td><span id="spryParentsLang">
          <select name="ParentsLang" id="ParentsLang">
              <option value="" <cfif (isDefined("MyDemo.Parentslang") AND "" EQ MyDemo.Parentslang)>selected="selected"</cfif>></option>
              <option value="English" <cfif (isDefined("MyDemo.Parentslang") AND "English" EQ MyDemo.Parentslang)>selected="selected"</cfif>>Proficient English</option>
              <option value="Limited" <cfif (isDefined("MyDemo.Parentslang") AND "Limited" EQ MyDemo.Parentslang)>selected="selected"</cfif>>Limited English</option>
<option value="No" <cfif (isDefined("MyDemo.Parentslang") AND "No" EQ MyDemo.Parentslang)>selected="selected"</cfif>>No English</option>
          </select>
          <span class="selectRequiredMsg"><br /><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Language_Spoken_In_Home#</cfoutput> </strong></td>
      <td><span id="spryHomeLangResult">
        <select name="HomeLangResult" id="HomeLangResult">
          <option value="" <cfif (isDefined("MyDemo.Homelangresult") AND "" EQ MyDemo.Homelangresult)>selected="selected"</cfif>></option>
          <option value="English" selected="selected" <cfif (isDefined("MyDemo.Homelangresult") AND "English" EQ MyDemo.Homelangresult)>selected="selected"</cfif>>English</option>
          <option value="Spanish" <cfif (isDefined("MyDemo.Homelangresult") AND "Spanish" EQ MyDemo.Homelangresult)>selected="selected"</cfif>>Spanish</option>
          <option value="Both" <cfif (isDefined("MyDemo.Homelangresult") AND "Both" EQ MyDemo.Homelangresult)>selected="selected"</cfif>>English/Spanish</option>
          <option value="Other" <cfif (isDefined("MyDemo.Homelangresult") AND "Other" EQ MyDemo.Homelangresult)>selected="selected"</cfif>>Other</option>
        </select>
      <span class="selectRequiredMsg"><br /><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Physical_Address#</cfoutput></strong></td>
      <td><span id="spryStreet2">
        <input name="Street" type="text" id="Street" value="<cfoutput>#MyDemo.Street#</cfoutput>" size="28" />
        <span class="textfieldRequiredMsg">
          <cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mailing_Street#</cfoutput></strong></td>
      <td><span id="spryMailing_Street">
          <input name="Mailing_Street" type="text" id="Mailing_Street" value="<cfoutput>#MyDemo.Mailing_Street#</cfoutput>" size="28" />
          <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mailing_City#</cfoutput></strong></td>
      <td><span id="spryCity">
          <input name="Mailing_City" type="text" id="Mailing_City" value="<cfoutput>#MyDemo.Mailing_City#</cfoutput>" size="28" />
          <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mailing_State#</cfoutput></strong></td>
      <td><span id="spryState">
          <input name="Mailing_State" type="text" id="Mailing_State" value="<cfoutput>#MyDemo.Mailing_State#</cfoutput>" size="5" maxlength="2" />
          <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span></span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mailing_Zip#</cfoutput></strong></td>
      <td><span id="spryZip">
      <input name="Mailing_Zip" type="text" id="Mailing_Zip" value="<cfoutput>#MyDemo.Mailing_Zip#</cfoutput>" size="12" maxlength="10" />
      <span class="textfieldRequiredMsg"><cfoutput>#Required#</cfoutput></span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Home_Phone#</cfoutput></strong></td>
      <td><span id="spryHomePhone">
          <input name="Home_Phone" type="text" id="Home_Phone" value="<cfoutput>#MyDemo.Home_Phone#</cfoutput>" size="15" maxlength="15" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Parent_Guardian_Email#</cfoutput></strong></td>
      <td><span id="spryGuardianEmail">
      <input name="GuardianEmail" type="text" id="GuardianEmail" value="<cfoutput>#MyDemo.Guardianemail#</cfoutput>" size="28" />
      <span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mothers_Name#</cfoutput></strong></td>
      <td><span id="sprytextfield13">
          <input name="Mother" type="text" id="Mother" value="<cfoutput>#MyDemo.Mother#</cfoutput>" size="28" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mothers_Employer#</cfoutput></strong></td>
      <td><span id="sprytextfield14">
          <input name="Mother_Employer" type="text" id="Mother_Employer" value="<cfoutput>#MyDemo.Mother_Employer#</cfoutput>" size="28" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mothers_Work_Phone#</cfoutput></strong></td>
      <td><span id="sprytextfield15">
          <input name="motherdayphone" type="text" id="motherdayphone" value="<cfoutput>#MyDemo.Motherdayphone#</cfoutput>" size="15" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Mothers_Cell_Phone#</cfoutput></strong></td>
      <td><span id="sprytextfield16">
          <input name="Mother_Cell_Phone" type="text" id="Mother_Cell_Phone" value="<cfoutput>#MyDemo.Mother_Cell_Phone#</cfoutput>" size="15" />
          </span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Fathers_Name#</cfoutput></strong></td>
      <td><span id="sprytextfield17">
          <input name="Father" type="text" id="Father" value="<cfoutput>#MyDemo.Father#</cfoutput>" size="28" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Fathers_Employer#</cfoutput></strong></td>
      <td><span id="sprytextfield18">
          <input name="Father_Employer" type="text" id="Father_Employer" value="<cfoutput>#MyDemo.Father_Employer#</cfoutput>" size="28" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Fathers_Work_Phone#</cfoutput></strong></td>
      <td><span id="sprytextfield19">
          <input name="fatherdayphone" type="text" id="fatherdayphone" value="<cfoutput>#MyDemo.Fatherdayphone#</cfoutput>" size="15" />
          </span></td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Fathers_Cell_Phone#</cfoutput></strong></td>
      <td><span id="sprytextfield20">
          <input name="Father_Cell_Phone" type="text" id="Father_Cell_Phone" value="<cfoutput>#MyDemo.Father_Cell_Phone#</cfoutput>" size="15" />
          </span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong><cfoutput>#D_Guardians_Cell_Phone#</cfoutput> </strong></td>
      <td><span id="sprytextfield12">
        <input name="GuardianCell_Phone" type="text" id="GuardianCell_Phone" value="<cfoutput>#MyDemo.GuardianCell_Phone#</cfoutput>" size="15" />
      </span></td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Emergency_Contact#</cfoutput> 1 </strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top"><em><cfoutput>#D_Name#</cfoutput>:</em> <span id="sprytextfield21">
        <input name="Emerg_Contact_1" type="text" id="Emerg_Contact_1" value="<cfoutput>#MyDemo.Emerg_Contact_1#</cfoutput>" size="23" />
      </span><em><cfoutput>#D_Phone#</cfoutput>:</em> <span id="sprytextfield22">
          <input name="Emerg_Phone_1" type="text" id="Emerg_Phone_1" value="<cfoutput>#MyDemo.Emerg_Phone_1#</cfoutput>" size="15" />
          </span></td>
      </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Emergency_Contact#</cfoutput> 2 </strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top"><em><cfoutput>#D_Name#</cfoutput>:</em><span id="sprytextfield23">
      <input name="Emerg_Contact_2" type="text" id="Emerg_Contact_2" value="<cfoutput>#MyDemo.Emerg_Contact_2#</cfoutput>" size="23" />
      </span><em><cfoutput>#D_Phone#</cfoutput>:</em> <span id="sprytextfield24">
          <input name="Emerg_Phone_2" type="text" id="Emerg_Phone_2" value="<cfoutput>#MyDemo.Emerg_Phone_2#</cfoutput>" size="15" />
          </span></td>
      </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Emergency_Contact#</cfoutput> 3 </strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top"><em><cfoutput>#D_Name#</cfoutput>:</em><span id="sprytextfield25">
      <input name="Emerg_Contact_3" type="text" id="Emerg_Contact_3" value="<cfoutput>#MyDemo.Emerg_Contact_3#</cfoutput>" size="23" />
      </span><em><cfoutput>#D_Phone#</cfoutput>:</em> <span id="sprytextfield26">
          <input name="Emerg_3_Phone" type="text" id="Emerg_3_Phone" value="<cfoutput>#MyDemo.Emerg_3_Phone#</cfoutput>" size="15" />
          </span></td>
      </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Emergency_Contact#</cfoutput> 4 </strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top"><em><cfoutput>#D_Name#</cfoutput>:</em><span id="sprytextfield27">
      <input name="Emerg_Contact_4" type="text" id="Emerg_Contact_4" value="<cfoutput>#MyDemo.Emerg_Contact_4#</cfoutput>" size="23" />
      </span><em><cfoutput>#D_Phone#</cfoutput>:</em> <span id="sprytextfield28">
          <input name="Emerg_4_Phone" type="text" id="Emerg_4_Phone" value="<cfoutput>#MyDemo.Emerg_Phone_4#</cfoutput>" size="15" />
          </span></td>
      </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Medical_Alert#</cfoutput></strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top">        <textarea name="Alert_Medical" cols="45" rows="2" id="Alert_Medical"><cfoutput>#MyDemo.Alert_Medical#</cfoutput></textarea>        </td>
      </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" valign="top"><strong><cfoutput>#D_Physician#</cfoutput> </strong></td>
      </tr>
    <tr>
      <td colspan="2" valign="top"><em><cfoutput>#D_Name#</cfoutput>:</em><span id="sprytextfield30">
      <input name="Doctor_Name" type="text" id="Doctor_Name" value="<cfoutput>#MyDemo.Doctor_Name#</cfoutput>" size="23" />
      </span><em><cfoutput>#D_Phone#</cfoutput>:</em> <span id="sprytextfield31">
          <input name="Doctor_Phone" type="text" id="Doctor_Phone" value="<cfoutput>#MyDemo.Doctor_Phone#</cfoutput>" size="15" />
          </span></td>
      </tr>
        </table>
        <p align="left">&nbsp;</p>
        <div style="text-align:center"></div>
        <div class="buttons">
          <input type="button" name="Button" id="Submit" onclick="location.href='#top';doSub();" value="<cfoutput>#Cont#</cfoutput>" />
        </div>
      </div>
      <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="complete"><cfoutput>#Login#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="current"><cfoutput>#Demographics#</cfoutput></span><br />
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
var sprytextfield2 = new Spry.Widget.ValidationTextField("spryGuardian");
var spryselect2 = new Spry.Widget.ValidationSelect("spryID_Name_of_Language");
var spryselect3 = new Spry.Widget.ValidationSelect("spryParentsLang");
var spryselect1 = new Spry.Widget.ValidationSelect("spryHomeLangResult");
var sprytextfield5 = new Spry.Widget.ValidationTextField("spryMailing_Street");
var sprytextfield7 = new Spry.Widget.ValidationTextField("spryCity");
var sprytextfield8 = new Spry.Widget.ValidationTextField("spryState");
var sprytextfield9 = new Spry.Widget.ValidationTextField("spryZip", "zip_code");
var sprytextfield10 = new Spry.Widget.ValidationTextField("spryHomePhone", "none", {isRequired:false});
var sprytextfield11 = new Spry.Widget.ValidationTextField("spryGuardianEmail", "email", {isRequired:false});
var sprytextfield13 = new Spry.Widget.ValidationTextField("sprytextfield13", "none", {isRequired:false});
var sprytextfield14 = new Spry.Widget.ValidationTextField("sprytextfield14", "none", {isRequired:false});
var sprytextfield15 = new Spry.Widget.ValidationTextField("sprytextfield15", "none", {isRequired:false});
var sprytextfield16 = new Spry.Widget.ValidationTextField("sprytextfield16", "none", {isRequired:false});
var sprytextfield17 = new Spry.Widget.ValidationTextField("sprytextfield17", "none", {isRequired:false});
var sprytextfield18 = new Spry.Widget.ValidationTextField("sprytextfield18", "none", {isRequired:false});
var sprytextfield19 = new Spry.Widget.ValidationTextField("sprytextfield19", "none", {isRequired:false});
var sprytextfield20 = new Spry.Widget.ValidationTextField("sprytextfield20", "none", {isRequired:false});
var sprytextfield21 = new Spry.Widget.ValidationTextField("sprytextfield21", "none", {isRequired:false});
var sprytextfield22 = new Spry.Widget.ValidationTextField("sprytextfield22", "none", {isRequired:false});
var sprytextfield23 = new Spry.Widget.ValidationTextField("sprytextfield23", "none", {isRequired:false});
var sprytextfield24 = new Spry.Widget.ValidationTextField("sprytextfield24", "none", {isRequired:false});
var sprytextfield25 = new Spry.Widget.ValidationTextField("sprytextfield25", "none", {isRequired:false});
var sprytextfield26 = new Spry.Widget.ValidationTextField("sprytextfield26", "none", {isRequired:false});
var sprytextfield27 = new Spry.Widget.ValidationTextField("sprytextfield27", "none", {isRequired:false});
var sprytextfield28 = new Spry.Widget.ValidationTextField("sprytextfield28", "none", {isRequired:false});
var sprytextfield30 = new Spry.Widget.ValidationTextField("sprytextfield30", "none", {isRequired:false});
var sprytextfield31 = new Spry.Widget.ValidationTextField("sprytextfield31", "none", {isRequired:false});
var sprytextfield1 = new Spry.Widget.ValidationTextField("spryLastFirst");
var sprytextfield33 = new Spry.Widget.ValidationTextField("sprytextfield33");
var sprytextfield32 = new Spry.Widget.ValidationTextField("sprytextfield32", "none", {isRequired:false});
var sprytextfield12 = new Spry.Widget.ValidationTextField("sprytextfield12", "none", {isRequired:false});
var sprytextfield3 = new Spry.Widget.ValidationTextField("spryDOB2", "date", {format:"mm/dd/yyyy"});
var sprytextfield4 = new Spry.Widget.ValidationTextField("spryBirthplace2");
var sprytextfield6 = new Spry.Widget.ValidationTextField("spryStreet2");
//-->
</script>
</body>
</html>
