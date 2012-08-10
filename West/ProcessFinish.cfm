<cflock scope="session" type="exclusive" timeout="20">
  <cfset SESSION.Language = "English">
  <cfset SESSION.Student_Number = 0>
  <cfset SESSION.LoginRetry = "false">
</cflock>
<cflocation addtoken="no" url="/">
