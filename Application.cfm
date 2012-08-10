<cfapplication name="reg10" clientmanagement="no" sessionmanagement="yes" sessiontimeout="#createtimespan(0,1,0,0)#" setclientcookies="yes">
<!--- START filter for SQL Injection Attack 
<cfset SQL_CMDs = ArrayNew(1)>
<cfset LoopHitCount=0>
<cfset mystring="declare,set,exec,select,grant,delete,insert,drop,alter,replace,truncate,update,create,rename,describe,from,into,table,view,union,cast,char">
<cfset SQL_CMDs=mystring.Split(",")>
<cfset CheckVal = cgi.QUERY_STRING>
<cfset BadStuff = "">
<cfloop index="CMD_Loop" from="1" to="#ArrayLen(SQL_CMDs)#">
  <cfset paramname= SQL_CMDs[#CMD_Loop#]>
  <!--- START filter for SQL Injection Attack via GET Variables--->
  <CFSET st = FindNoCase(paramname,CheckVal,1)>
  <cfif st gt 0 >
    <cfset BadStuff = BadStuff & "Suspect GET Value: " & paramname & "<br />">
    <cfset LoopHitCount = LoopHitCount + 1>
  </cfif>
  <!--- END filter for SQL Injection Attack via GET Variables--->
  <!--- START filter for SQL Injection Attack via POST Variables--->
  <cfif isdefined("form.fieldnames")>
    <cfloop list="#form.fieldnames#" index="z">
      <CFSET st = FindNoCase(paramname,evaluate(z),1)>
      <cfif st gt 0 >
        <cfset BadStuff = BadStuff & "Suspect POST Value: " & paramname & "<br />">
        <cfset LoopHitCount = LoopHitCount + 1>
      </cfif>
    </cfloop>
  </cfif>
  <!--- END filter for SQL Injection Attack via POST Variables--->
</cfloop>

<cfif LoopHitCount gt 2>
  <cfmail to="jbywater@minidokaschools.org" from="noreply@minidokaschools.org" type="html" subject="SQL Injection Hack Attempted!">
    <cfoutput>
      <h1>This request is being blocked due to suspected Unauthorized Access.</h1>
      <p>#CheckVal#<br />
        #BadStuff#</p>
      <p><b>Date:</b> #DateFormat(Now(),"MM/DD/YYYY")# #TimeFormat(Now(),"h:mm:ss tt")#</p>
      <p><b>Remote Address:</b> #CGI.REMOTE_ADDR#</p>
      <p><b>All Headers:</b> #CGI.ALL_HTTP#</p>
    </cfoutput>
  </cfmail>
  <cfoutput>
    <h1>This request is being blocked due to suspected Unauthorized Access.</h1>
    <p>#CheckVal#<br />
      #BadStuff#</p>
      <p><b>Date:</b> #DateFormat(Now(),"MM/DD/YYYY")# #TimeFormat(Now(),"h:mm:ss tt")#</p>
      <p><b>Remote Address:</b> #CGI.REMOTE_ADDR#</p>
      <p><b>All Headers:</b> #CGI.ALL_HTTP#</p>
      <p>If you believe you have reached this in error, please contact us at (208) 436-9149.</p>
  </cfoutput>
  <cfabort>
</cfif>
<!--- END filter for SQL Injection Attack --->--->