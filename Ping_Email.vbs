Dim Arg, FileToBeUsed
Set Arg = WScript.Arguments
'Parameter 1, sent from calling batch file - \\geobase-win\ced\GADS\R2017\R398\Batch\Ping_Email.bat
FileToBeUsed = Arg(0)
'msgbox "First parameter passed was " & FileToBeUsed

Dim HelpFile, WebServiceLink, PublicLink, StaffLink, NetworkLink
HelpFile = "\\geobase-win\ced\GADS\R2017\R398\Batch\CED_Web_Apps_Server_Report_Help.txt"
WebServiceLink = "https://wsitd03/website/QA/QueryJSON.html"    'To allow checking ES services (http)
PublicLink = "https://wspdsmap.cityoftacoma.org/website/DART/staff/index_TEST.html"
StaffLink = "https://wsitd03/website/DART/StaffMap/index_TEST.html"
DashboardLink = "https://asga.tacoma.lcl/AnalyticsReports/?feature=Trends&type=WebApplicationsOverview&relativeDate=Today"
NetworkLink = "\\geobase-win\ced\GADS\R2017\R398\Batch\Ping_Email.bat"

Const ForReading = 1, ForWriting = 2, ForAppending = 8

Dim fso, f, objCDO1
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(FileToBeUsed, ForReading)
Set objCDO1 = CreateObject("CDO.Message")

objCDO1.Textbody = "STEP 1: Please review GADS Web Apps Server Report below. If errors are present: forward this email to Jimmie Farmer & run the Checks below." & vbCrLf & vbCrLf _
			& "Detailed Troubleshooting Help: " & HelpFile & vbCrLf _
			& "Today's Log File: " & FileToBeUsed & vbCrLf & vbCrLf _
			& "STEP 2: Run Web Service Check: " & WebServiceLink & vbCrLf _
			& "STEP 3: Run Public DART Check: " & PublicLink & vbCrLf _
			& "STEP 4: Run Staff DART Check: " & StaffLink & vbCrLf & vbCrLf _
			& "STEP 5: Check Application Dashboard: " & DashboardLink & vbCrLf & vbCrLf _
			& "Rerun Network Check (this report): " & NetworkLink & vbCrLf _
			& f.ReadAll

f.Close
'objCDO1.TO ="mmurnane@cityoftacoma.org"
objCDO1.TO ="mmurnane@ci.tacoma.wa.us; aabramovich@ci.tacoma.wa.us"
objCDO1.From = "mmurnane@ci.tacoma.wa.us"
objCDO1.Subject = "GADS Web Apps Server Report"
objCDO1.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
objCDO1.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp001.tacoma.lcl"
objCDO1.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
objCDO1.Configuration.Fields.Update     
objCDO1.Send

'Clear the objects
Set Arg = Nothing
Set f = Nothing
Set fso = Nothing