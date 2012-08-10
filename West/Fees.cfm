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
	UPDATE Registration SET Prog_Comp = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#Now()#"> WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_integer">
</cfquery>
<cfquery name="MyDemo" datasource="PSLive">
SELECT ID
FROM Students
WHERE Student_Number = <cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_numeric"> 
</cfquery>
<cfquery name="MyFees" datasource="PSLive">
SELECT *
FROM Fee
WHERE StudentID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#MyDemo.ID#"> 
AND Fee_Balance > 0
AND Fee_Type_Name = 'SOY Balance'
ORDER BY TermID ASC, CreationDate ASC
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
<div id="wrap">
  <div id="top"></div>
  <div id="content">
     <div class="header">
        <h1><cfoutput>#Title1#</cfoutput></h1>
        <h2><cfoutput>#Title2#</cfoutput></h2>
      </div>
      <div class="breadcrumbs">  <cfoutput>#West#</cfoutput> | <cfoutput>#MyInfo.Last_Name#</cfoutput>, <cfoutput>#MyInfo.First_Name#</cfoutput> <cfoutput>#MyInfo.Middle_Name#</cfoutput></div>
    <div class="middle">
      <h2><cfoutput>#F_Student_Activity_Fees#</cfoutput>:</h2>
      </p>
      <cfif MyFees.RecordCount GT 0>
        <div align="center"><img src="/images/exclamation.png" alt="Exclaimation!" width="16" height="16" align="absmiddle" /><strong><cfoutput>#F_Unpaid_Fines#</cfoutput></strong> <br />
          &nbsp; </div>
        <table width="100%" border="0" align="center" cellspacing="0" style="font-size:0.75em;">
          <tr style="color:#FFFFFF">
            <th bgcolor="#990000" width="10%"><div align="left">Year</div></th>
            <th bgcolor="#990000"><div align="left">Description</div></th>
            <th bgcolor="#990000" width="15%"><div align="right">Fee</div></th>
            <th bgcolor="#990000" width="15%"><div align="right">Payment</div></th>
            <th bgcolor="#990000" width="15%"><div align="right">Balance</div></th>
          </tr>
          <cfset ytotfee = 0>
          <cfset ytotpay = 0>
          <cfoutput query="MyFees">
            <cfquery name="MyFees2" datasource="PSLive">
SELECT *
FROM Fee
WHERE StudentID = <cfqueryparam cfsqltype="cf_sql_numeric" value="#MyDemo.ID#"> 
AND TermID > <cfqueryparam cfsqltype="cf_sql_numeric" value="#MyFees.TermID - 100#">
AND TermID < <cfqueryparam cfsqltype="cf_sql_numeric" value="#MyFees.TermID#">
ORDER BY TermID ASC, CreationDate ASC
                                </cfquery>
            <cfloop query="MyFees2">
              <cfset ytotfee = ytotfee + #MyFees2.Fee_Amount#>
              <cfset ytotpay = ytotpay + #MyFees2.Fee_Paid#>
              <tr>
                <td valign="top" bgcolor="##FFAAAA"><div align="left">#replace((MyFees2.YearID + 1990),"20","")#-#replace((MyFees2.YearID + 1991),"20","")#</div></td>
                <td bgcolor="##FFAAAA"><div align="left">#MyFees2.Description#</div></td>
                <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees2.Fee_Amount)#</div></td>
                <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees2.Fee_Paid)#</div></td>
                <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees2.Fee_Balance)#</div></td>
              </tr>
            </cfloop>
            <tr>
              <td valign="top" bgcolor="##FFAAAA"><div align="left">#replace((MyFees.YearID + 1989),"20","")#-#replace((MyFees.YearID + 1990),"20","")#</div></td>
              <td bgcolor="##FFAAAA"><div align="left">#replace((MyFees.YearID + 1989),"20","")#-#replace((MyFees.YearID + 1990),"20","")# Year Total</div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(ytotfee)#</div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(ytotpay)#</div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees.Fee_Balance)#</div></td>
            </tr>
            <tr>
              <td colspan="5" bgcolor="##FFAAAA"><hr align="left" />
              </td>
            </tr>
            <tr>
              <td valign="top" bgcolor="##FFAAAA"><div align="left">#replace((MyFees.YearID + 1990),"20","")#-#replace((MyFees.YearID + 1991),"20","")#</div></td>
            <td bgcolor="##FFAAAA"><div align="left">
                  <cfif MyFees.YearID neq 19>
                    Carryover from #replace((MyFees.YearID + 1989),"20","")#-#replace((MyFees.YearID + 1990),"20","")#
                    <cfelse>
                    <strong>Total Due</strong>
                  </cfif>
                </div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees.Fee_Amount)#</div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees.Fee_Paid)#</div></td>
              <td bgcolor="##FFAAAA"><div align="right">#DollarFormat(MyFees.Fee_Balance)#</div></td>
            </tr>
            <cfset ytotfee = #MyFees.Fee_Amount#>
            <cfset ytotpay = #MyFees.Fee_Paid#>
          </cfoutput>
        </table>
      </cfif>
      <br />
      <table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="right"><strong><cfoutput>#F_0809_Fee_List#</cfoutput>:&nbsp; </strong></div></td>
          <td><table border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="right"><cfoutput>#F_Activity_Card#</cfoutput>:&nbsp; </div></td>
                <td>$15.00</td>
              </tr>
              <tr>
                <td><div align="right"><cfoutput>#F_Annual#</cfoutput>:&nbsp;</div></td>
                <td>$26.00</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br />
      <div align="left">
        <p><cfoutput>#F_Note#</cfoutput></p>
      <div align="center">
        <blockquote> <cfoutput>#F_Pay_To#</cfoutput>
        </blockquote>
      </div>
      <div align="center"></div>
      <form id="form1" name="form1" method="post" action="./ProcessFees.cfm">
        <div class="buttons">
          <input type="submit" name="Submit" id="Submit" value="<cfoutput>#Cont#</cfoutput>" />
        </div>
      </form>
    </div>
    <div class="right">
        <h2><cfoutput>#RegProg#</cfoutput></h2>
        <div> <span class="complete"><cfoutput>#Login#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Welcome_Letter#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Demographics#</cfoutput></span><br />
          
          <span class="complete"><cfoutput>#Dress_Code#</cfoutput></span><br />
          <span class="complete"><cfoutput>#Computer_Use#</cfoutput></span><br />
          <span class="current"><cfoutput>#Fees#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Class_Schedule#</cfoutput></span><br />
          <span class="incomplete"><cfoutput>#Finish#</cfoutput></span> </div>
      </div>
    <div id="clear"></div>
  </div>
  <div id="bottom"></div>
</div>
<div id="footer"><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=iVL6kpGcmNuCc3EVjVC0o5qk9K7fggg0BCPxALSjNR7TIcRj8FRbu"></script></span></div>
</body>
</html>
