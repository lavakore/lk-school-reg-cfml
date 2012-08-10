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
	UPDATE Registration SET Prog_Fees = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfquery name="MyClassesT1" datasource="PSLive">
SELECT CC.Course_Number, CC.TermID, Courses.Course_Name, Sections.Expression, Sections.Room, Teachers.LastFirst
FROM Students, CC, Courses, Sections, Teachers
WHERE CC.StudentID = Students.ID
AND Courses.Course_Number = CC.Course_Number
AND Sections.ID = CC.SectionID
AND Teachers.ID = CC.TeacherID
AND Students.Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_numeric"> 
AND CC.TermID IN (2100,2101)
ORDER BY Sections.Expression ASC
</cfquery>
<cfquery name="MyClassesT2" datasource="PSLive">
SELECT CC.Course_Number, CC.TermID, Courses.Course_Name, Sections.Expression, Sections.Room, Teachers.LastFirst
FROM Students, CC, Courses, Sections, Teachers
WHERE CC.StudentID = Students.ID
AND Courses.Course_Number = CC.Course_Number
AND Sections.ID = CC.SectionID
AND Teachers.ID = CC.TeacherID
AND Students.Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_numeric"> 
AND CC.TermID IN (2100,2102)
ORDER BY Sections.Expression ASC
</cfquery>
<cfquery name="MyClassesT3" datasource="PSLive">
SELECT CC.Course_Number, CC.TermID, Courses.Course_Name, Sections.Expression, Sections.Room, Teachers.LastFirst
FROM Students, CC, Courses, Sections, Teachers
WHERE CC.StudentID = Students.ID
AND Courses.Course_Number = CC.Course_Number
AND Sections.ID = CC.SectionID
AND Teachers.ID = CC.TeacherID
AND Students.Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_numeric"> 
AND CC.TermID IN (2100,2103)
ORDER BY Sections.Expression ASC
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
<form id="form1" name="form1" method="post" action="./ProcessSched.cfm">
  <div id="wrap">
    <div id="top"></div>
    <div id="content">
      <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs"> <cfoutput>#West#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
      <div class="middle">
        <h2><cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput> <cfoutput>#Class_Schedule#</cfoutput>:</h2>
        <p style="color:#990000"><img src="/images/exclamation.png" alt="Exclaimation!" width="16" height="16" align="absmiddle" /> <cfoutput>#S_Warning#</cfoutput><br />
          &nbsp;</p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="5" style="text-align:center; color:#3B6EBF; font-size:16px; font-weight:bold;">Trimester 1</td>
          </tr>
          <tr>
            <th>Period</th>
            <th><div align="center">Course ID</div></th>
            <th><div align="left">Course Title</div></th>
            <th><div align="left">Teacher Name</div></th>
            <th><div align="center">Room</div></th>
          </tr>
          <cfoutput query="MyClassesT1">
            <tr>
              <td><div align="center">#replace(MyClassesT1.Expression,"(A)","","all")#</div></td>
              <td><div align="center">#MyClassesT1.Course_Number#</div></td>
              <td><div align="left">#UCase(MyClassesT1.Course_Name)#</div></td>
              <td><div align="left">#MyClassesT1.LastFirst#</div></td>
              <td><div align="center">#MyClassesT1.Room#</div></td>
            </tr>
          </cfoutput>
          <tr>
            <td colspan="5" style="text-align:center; color:#3B6EBF; font-size:16px; font-weight:bold;"><br />
              Trimester 2</td>
          </tr>
          <tr>
            <th>Period</th>
            <th><div align="center">Course ID</div></th>
            <th><div align="left">Course Title</div></th>
            <th><div align="left">Teacher Name</div></th>
            <th><div align="center">Room</div></th>
          </tr>
          <cfoutput query="MyClassesT2">
            <tr>
              <td><div align="center">#replace(MyClassesT2.Expression,"(A)","","all")#</div></td>
              <td><div align="center">#MyClassesT2.Course_Number#</div></td>
              <td><div align="left">#UCase(MyClassesT2.Course_Name)#</div></td>
              <td><div align="left">#MyClassesT2.LastFirst#</div></td>
              <td><div align="center">#MyClassesT2.Room#</div></td>
            </tr>
          </cfoutput>
          <tr>
            <td colspan="5" style="text-align:center; color:#3B6EBF; font-size:16px; font-weight:bold;"><br />
              Trimester 3</td>
          </tr>
          <tr>
            <th>Period</th>
            <th><div align="center">Course ID</div></th>
            <th><div align="left">Course Title</div></th>
            <th><div align="left">Teacher Name</div></th>
            <th><div align="center">Room</div></th>
          </tr>
          <cfoutput query="MyClassesT3">
            <tr>
              <td><div align="center">#replace(MyClassesT3.Expression,"(A)","","all")#</div></td>
              <td><div align="center">#MyClassesT3.Course_Number#</div></td>
              <td><div align="left">#UCase(MyClassesT3.Course_Name)#</div></td>
              <td><div align="left">#MyClassesT3.LastFirst#</div></td>
              <td><div align="center">#MyClassesT3.Room#</div></td>
            </tr>
          </cfoutput>
        </table>
        
        <div class="buttons"><br />
          <input type="submit" name="Submit" id="Submit" value="<cfoutput>#Cont#</cfoutput>" />
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
          <span class="current"><cfoutput>#Class_Schedule#</cfoutput></span><br />
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
