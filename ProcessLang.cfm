<cfparam name="SESSION.Language" default="English">
<cflock scope="session" type="exclusive" timeout="20">
  <cfif SESSION.Language eq "English">
    <cfset SESSION.Language = "Spanish">
    <cfelse>
    <cfset SESSION.Language = "English">
  </cfif>
</cflock>
<cflocation addtoken="no" url="/">