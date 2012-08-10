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
<script src="/inc/SpryAssets/SpryValidationRadio.js" type="text/javascript"></script>
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
</head>
<body onload="form1.username.focus();">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="middle" style="width:610px;">
        <h2>Race and Ethnicity, Frequently Asked Questions:</h2>
        <p><strong>Q: Why do you need this information?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> The demographics of our society have changed significantly in the last few decades. These changes will allow our students and staff to more accurately describe who they are. We (school district or state) are required by the Federal government to use the new categories. All states and school districts are required to do the same. There are good reasons in addition to meeting federal requirements, though. We routinely report aggregate information to the federal government for funding and evaluation purposes, as well as civil rights compliance. We also use racial and ethnic data to evaluate our placement and program needs, providing the best services for all students. The U.S. Census in 2000 used the new categories. This is a trend that education and human service agencies will follow.</p>
        <p>&nbsp;</p>
        <p> <strong>Q: Is the federal government checking my immigration status?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> No. This information will be maintained in your  student records. It will not be reported to any federal agency in a way that identifies you or your child. No one will check for immigration status from the information you give here.</p>
        <p>&nbsp;</p>
        <p> <strong>Q: Will the school release my student's race and ethnicity to other parties?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> Individual student records are protected by the Federal Education Records and Privacy Act (FERPA). The new race and ethnicity standards have no effect on FERPA ’s protection of student records. FERPA does not designate race and ethnicity as directory information, and race and ethnicity have the same protection as any other non directory information in a student’s education record.</p>
        <p><br />
          <strong>Q: Haven't we given this information before? Why do you need to ask again?</strong></p>
        <p style="text-align: justify"><strong>A: </strong>This is indeed a major effort, but it would be more beneficial to ask everyone again and at the same time with the new format. This way no one will miss the opportunity to identify themselves in a more accurate way.</p>
        <p><br />
          <strong>Q: I am Hispanic. Why do I have to answer more questions?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> One of the major changes is the recognition that members of Hispanic populations can be of different races. The federal government would like to afford Hispanic/Latino populations the opportunity to better describe themselves according to their culture and heritage. So yes, you will be asked to select one or more races, even if you have indicated that you are Hispanic/Latino.</p>
        <p>&nbsp;</p>
        <p><strong>Q: How do I know I won't be discriminated against after I've told you I belong to a minority group?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> This is exactly why we need to maintain better racial and ethnic data about our students. We are required to maintain this information about each individual in his or her record, in case a civil right investigation surfaces. Again, state and local guidelines are in place to ensure that racial and ethnic data will not be reported elsewhere in a way that you may be identified. The state and districts follow FERPA rules and regulations to safeguard the privacy of student records (see question above).</p>
<p>&nbsp;</p>
        <p><strong>Q: You can't make me do it, can you?</strong></p>
        <p style="text-align: justify"><strong>A:</strong> No, we can’t; but providing the information would be beneficial for you or your child.  If you choose not to provide such information, we are required to provide an answer on your behalf. The federal government believes that in getting aggregate numbers from states and districts, it would be more preferable to have complete data this way, than having missing data. Because we are required to provide an answer on your behalf, you will not be eligible to complete online registration. Please contact the school for more information.</p>
      </div>
      <div id="clear"></div>
    </div>
    <div id="bottom"></div>
  </div>
  <div id="footer"><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</body>
</html>
