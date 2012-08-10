<cfparam name="SESSION.Student_Number" default="0">
<cfif SESSION.Student_Number eq 0>
  <cflocation addtoken="no" url="/">
</cfif>
<cfquery datasource="RegData">
INSERT INTO regdemofixed (Student_Number, Last_Name, First_Name, Middle_Name, Lastfirst, Homelangresult, Guardian, ID_Name_Of_Language, Parentslang, Dob, Birthplace, Mailing_Street, Street, Mailing_City, Mailing_State, Mailing_Zip, Home_Phone, GuardianCell_Phone, Guardianemail, Mother, Mother_Employer, Motherdayphone, Mother_Cell_Phone, Father, Father_Employer, Fatherdayphone, Father_Cell_Phone, Emerg_Contact_1, Emerg_Phone_1, Emerg_Contact_2, Emerg_Phone_2, Emerg_Contact_3, Emerg_3_Phone, Emerg_Contact_4, Emerg_Phone_4, Alert_Medical, Doctor_Name, Doctor_Phone)
VALUES (<cfqueryparam value="#SESSION.Student_Number#" cfsqltype="cf_sql_numeric">
, <cfif IsDefined("FORM.Last_Name") AND #FORM.Last_Name# NEQ "">
<cfqueryparam value="#FORM.Last_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.First_Name") AND #FORM.First_Name# NEQ "">
<cfqueryparam value="#FORM.First_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Middle_Name") AND #FORM.Middle_Name# NEQ "">
<cfqueryparam value="#FORM.Middle_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Last_Name") AND #FORM.Last_Name# NEQ "">
<cfqueryparam value="#FORM.Last_Name#, #FORM.First_Name# #FORM.Middle_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.HomeLangResult") AND #FORM.HomeLangResult# NEQ "">
<cfqueryparam value="#FORM.HomeLangResult#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Guardian") AND #FORM.Guardian# NEQ "">
<cfqueryparam value="#FORM.Guardian#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.ID_Name_of_Language") AND #FORM.ID_Name_of_Language# NEQ "">
<cfqueryparam value="#FORM.ID_Name_of_Language#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.ParentsLang") AND #FORM.ParentsLang# NEQ "">
<cfqueryparam value="#FORM.ParentsLang#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.DOB") AND #FORM.DOB# NEQ "">
<cfqueryparam value="#FORM.DOB#" cfsqltype="cf_sql_timestamp">
<cfelse>
NULL
</cfif>
, <cfif IsDefined("FORM.Birthplace") AND #FORM.Birthplace# NEQ "">
<cfqueryparam value="#FORM.Birthplace#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mailing_Street") AND #FORM.Mailing_Street# NEQ "">
<cfqueryparam value="#FORM.Mailing_Street#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Street") AND #FORM.Street# NEQ "">
<cfqueryparam value="#FORM.Street#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mailing_City") AND #FORM.Mailing_City# NEQ "">
<cfqueryparam value="#FORM.Mailing_City#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mailing_State") AND #FORM.Mailing_State# NEQ "">
<cfqueryparam value="#FORM.Mailing_State#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mailing_Zip") AND #FORM.Mailing_Zip# NEQ "">
<cfqueryparam value="#FORM.Mailing_Zip#" cfsqltype="cf_sql_numeric">
<cfelse>
NULL
</cfif>
, <cfif IsDefined("FORM.Home_Phone") AND #FORM.Home_Phone# NEQ "">
<cfqueryparam value="#FORM.Home_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.GuardianCell_Phone") AND #FORM.GuardianCell_Phone# NEQ "">
<cfqueryparam value="#FORM.GuardianCell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.GuardianEmail") AND #FORM.GuardianEmail# NEQ "">
<cfqueryparam value="#FORM.GuardianEmail#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mother") AND #FORM.Mother# NEQ "">
<cfqueryparam value="#FORM.Mother#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mother_Employer") AND #FORM.Mother_Employer# NEQ "">
<cfqueryparam value="#FORM.Mother_Employer#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.motherdayphone") AND #FORM.motherdayphone# NEQ "">
<cfqueryparam value="#FORM.motherdayphone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Mother_Cell_Phone") AND #FORM.Mother_Cell_Phone# NEQ "">
<cfqueryparam value="#FORM.Mother_Cell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Father") AND #FORM.Father# NEQ "">
<cfqueryparam value="#FORM.Father#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Father_Employer") AND #FORM.Father_Employer# NEQ "">
<cfqueryparam value="#FORM.Father_Employer#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.fatherdayphone") AND #FORM.fatherdayphone# NEQ "">
<cfqueryparam value="#FORM.fatherdayphone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Father_Cell_Phone") AND #FORM.Father_Cell_Phone# NEQ "">
<cfqueryparam value="#FORM.Father_Cell_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Contact_1") AND #FORM.Emerg_Contact_1# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_1#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Phone_1") AND #FORM.Emerg_Phone_1# NEQ "">
<cfqueryparam value="#FORM.Emerg_Phone_1#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Contact_2") AND #FORM.Emerg_Contact_2# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_2#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Phone_2") AND #FORM.Emerg_Phone_2# NEQ "">
<cfqueryparam value="#FORM.Emerg_Phone_2#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Contact_3") AND #FORM.Emerg_Contact_3# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_3#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_3_Phone") AND #FORM.Emerg_3_Phone# NEQ "">
<cfqueryparam value="#FORM.Emerg_3_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_Contact_4") AND #FORM.Emerg_Contact_4# NEQ "">
<cfqueryparam value="#FORM.Emerg_Contact_4#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Emerg_4_Phone") AND #FORM.Emerg_4_Phone# NEQ "">
<cfqueryparam value="#FORM.Emerg_4_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Alert_Medical") AND #FORM.Alert_Medical# NEQ "">
<cfqueryparam value="#FORM.Alert_Medical#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Doctor_Name") AND #FORM.Doctor_Name# NEQ "">
<cfqueryparam value="#FORM.Doctor_Name#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.Doctor_Phone") AND #FORM.Doctor_Phone# NEQ "">
<cfqueryparam value="#FORM.Doctor_Phone#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
)
</cfquery>
<cflocation addtoken="no" url="./DressCode.cfm">
