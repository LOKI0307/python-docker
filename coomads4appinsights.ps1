 $abc=az monitor app-insights component show --app "test1027" -g "ConsoleInsightRSGroup" | ConvertFrom-Json
 $resource_id="hidden-link:" + $abc.id +"=Resource"
 Write-Host $resource_id
 #az monitor app-insights web-test list --resource-group "ConsoleInsightRSGroup"
 #az monitor app-insights web-test show --resource-group "ConsoleInsightRSGroup" -n "console rs api version-console insight - rs"


 #az monitor app-insights web-test create --location "Central US" --description "Ping web test alert for mytestwebapp" --enabled true --frequency 900 --expected-status-code "401" `
 #--web-test-kind "standard" --locations Id="us-fl-mia-edge" --defined-web-test-name "my-webtest-my-component" --http-verb "POST" --request-body "SGVsbG8gd29ybGQ=" --request-url "https://bing.com" `
 #--retry-enabled true --synthetic-monitor-id "my-webtest-my-component" --timeout 120 --ssl-lifetime-check 100 --ssl-check true --resource-group "ConsoleInsightRSGroup" --name "my-webtest-my-component" `
 #--tags $resource_id
 #hidden-link:/subscriptions/91d8605f-b80a-4b1c-bca1-6ec55bfd1deb/resourceGroups/ConsoleInsightRSGroup/providers/microsoft.insights/components/test1027=Resource 


 #az monitor app-insights web-test create --location "Central US" --description "Ping web test alert for mytestwebapp" --enabled `
#true --frequency 900 --web-test-kind "standard" --locations Id="us-fl-mia-edge" --defined-web-test-name "my-webtest-my-component" `
#--http-verb "GET"  --request-url "https://bing.com" --retry-enabled true --synthetic-monitor-id `
#"my-webtest-my-component" --timeout 120 --ssl-lifetime-check 100 --ssl-check true --resource-group "ConsoleInsightRSGroup" --name `
#"my-webtest-my-component" 


#az monitor app-insights web-test create --kind "ping" --location "Central US" `
#--web-test "<WebTest         Name=\"joytest1\"         Id=\"ec14f587-a3f6-40ac-8952-75c900e1d153\"         Enabled=\"True\"         CssProjectStructure=\"\"         CssIteration=\"\"         Timeout=\"120\"         WorkItemIds=\"\"         xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\"         Description=\"\"         CredentialUserName=\"\"         CredentialPassword=\"\"         PreAuthenticate=\"True\"         Proxy=\"default\"         StopOnError=\"False\"         RecordedResultFile=\"\"         ResultsLocale=\"\">        <Items>        <Request         Method=\"GET\"         Guid=\"a7247e6c-29c1-2451-f4c8-78afe599253d\"         Version=\"1.1\"         Url=\"https://joyfun2.azurewebsites.net\"         ThinkTime=\"0\"         Timeout=\"120\"         ParseDependentRequests=\"False\"         FollowRedirects=\"True\"         RecordResult=\"True\"         Cache=\"False\"         ResponseTimeGoal=\"0\"         Encoding=\"utf-8\"         ExpectedHttpStatusCode=\"200\"         ExpectedResponseUrl=\"\"         ReportingName=\"\"         IgnoreHttpStatusCode=\"False\" />        </Items>        </WebTest>" `
#--description "Ping web test alert for mytestwebapp" --enabled true --frequency 900 `
#--web-test-kind "ping" --locations Id="us-fl-mia-edge" --defined-web-test-name "joytest1" `
#--retry-enabled true --synthetic-monitor-id "joytest1" --timeout 120 `
#-g "ConsoleInsightRSGroup" -n "joytest1" --tags $resource_id 



az monitor app-insights web-test create --kind "ping" --location "South Central US" --web-test "<WebTest Name=\"my-webtest\" Id=\"678ddf96-1ab8-44c8-9274-123456789abc\" Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"120\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\" ><Items><Request Method=\"GET\" Guid=\"a4162485-9114-fcfc-e086-123456789abc\" Version=\"1.1\" Url=\"http://my-component.azurewebsites.net\" ThinkTime=\"0\" Timeout=\"120\" ParseDependentRequests=\"True\" FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"False\" ResponseTimeGoal=\"0\" Encoding=\"utf-8\" ExpectedHttpStatusCode=\"200\" ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" /></Items></WebTest>" `
--description "Ping web test alert for mytestwebapp" --enabled true --frequency 900 --web-test-kind "ping" --locations Id="us-fl-mia-edge" --defined-web-test-name "my-webtest-test1027" --retry-enabled true --synthetic-monitor-id "my-webtest-test1027" `
 --timeout 120 --resource-group "ConsoleInsightRSGroup" ----web-test-name "my-webtest-test1027" --tags $resource_id 


 #az deployment group create --name "rollout01" --resource-group "ConsoleInsightRSGroup" --subscription "91d8605f-b80a-4b1c-bca1-6ec55bfd1deb" --template-file urlpingwebtest.bicep





#"<WebTest   Name=\"sample-test\"   Enabled=\"True\"         CssProjectStructure=\"\"    CssIteration=\"\"  Timeout=\"120\"  WorkItemIds=\"\"         xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\"         Description=\"\"  CredentialUserName=\"\"  CredentialPassword=\"\"         PreAuthenticate=\"True\"  Proxy=\"default\"  StopOnError=\"False\"         RecordedResultFile=\"\"  ResultsLocale=\"\">  <Items>  <Request Method=\"GET\"    Version=\"1.1\"  Url=\"www.google.com\" ThinkTime=\"0\"  Timeout=\"300\" ParseDependentRequests=\"True\"         FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"False\"         ResponseTimeGoal=\"0\"  Encoding=\"utf-8\"  ExpectedHttpStatusCode=\"200\"         ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" />        </Items>  <ValidationRules> <ValidationRule  Classname=\"Microsoft.VisualStudio.TestTools.WebTesting.Rules.ValidationRuleFindText, Microsoft.VisualStudio.QualityTools.WebTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a\" DisplayName=\"Find Text\"         Description=\"Verifies the existence of the specified text in the response.\"         Level=\"High\"  ExecutionOrder=\"BeforeDependents\">  <RuleParameters>        <RuleParameter Name=\"FindText\" Value=\"done\" />  <RuleParameter Name=\"IgnoreCase\" Value=\"False\" />  <RuleParameter Name=\"UseRegularExpression\" Value=\"False\" />  <RuleParameter Name=\"PassIfTextFound\" Value=\"True\" />  </RuleParameters> </ValidationRule>  </ValidationRules>  </WebTest>"


#az monitor app-insights web-test create --kind "ping" --location "Central US" 
#--web-test "<WebTest Name=\"my-webtest\" Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"120\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\" ><Items><Request Method=\"GET\" Version=\"1.1\" Url=\"http://my-component.azurewebsites.net\" ThinkTime=\"0\" Timeout=\"120\" ParseDependentRequests=\"True\" FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"False\" ResponseTimeGoal=\"0\" Encoding=\"utf-8\" ExpectedHttpStatusCode=\"200\" ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" /></Items></WebTest>" --description "Ping web test alert for mytestwebapp" --enabled true --frequency 900 --web-test-kind "ping" --locations Id="us-fl-mia-edge" --defined-web-test-name "test123" --retry-enabled true --synthetic-monitor-id "test123" --timeout 120 --resource-group "ConsoleInsightRSGroup" --name "test123" --tags hidden-link:XX=XX