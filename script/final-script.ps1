#mendatory variables
$resourceGroupName="ConsoleInsightRSGroup"
$location="Central US"
$appServicePlanName="ASP-ConsoleInsightRSGroup-87bd"
$subscriptionId="91d8605f-b80a-4b1c-bca1-6ec55bfd1deb"
$app_insights="console insight - rs"

#Login into respective subscription
az login --tenant $subscriptionId | Out-Null


# Function for getting app URL
function Get-app-url{
param ($location,$resourceGroupName,$appServicePlanName)
$app_url =@{}
$appServicePlan=az appservice plan show --name $appServicePlanName --resource-group $resourceGroupName | ConvertFrom-Json
Write-Host $appServicePlan.Id
$apps = Get-AzWebApp -Location $location | Where-Object {$_.ServerFarmId -eq $appServicePlan.Id}
#echo $apps
# Loop through each app and display its information
foreach ($app in $apps) {

    #$app_url += $($app.DefaultHostName)
    $ymp=$app.Name

    $app_url.$ymp=$app.DefaultHostName
}
return $app_url
    }

# Function for generate name
function generate-name{
param ($urls)
$names = @()
foreach ($url in $urls) {
$names+=$url.Split(".").split("-") | Select-String -Pattern 'author','consolereflector','dev','prod','bl','bl-ui' -SimpleMatch

}
$name=$names -join "-"
return $name

}

#Function for status code
function respective_code_url{
param($url)
$url.ToLower()
$url1="author"
$url2="blui"
$url3="bl"
$url4="catalog"
$url5="catalogmgr"
$url6="execute"
$url7="portalsvc"
$url8="rec"
$url9="salesforce"
if ($url -match $url1)
{return "200"}
elseif ($url -match $url3)
{return "403"}
elseif ($url -match $url2)
{return "200"}
elseif ($url -match $url4)
{return "200"}
elseif ($url -match $url5)
{return "200"}
elseif ($url -match $url6)
{return "401"}
elseif ($url -match $url7)
{return "403"}
elseif ($url -match $url8)
{return "200"}
elseif ($url -match $url9)
{return "401"}

}


$app_detailes=Get-app-url -location $location -resourceGroupName $resourceGroupName -appServicePlanName $appServicePlanName
echo $app_detailes
$app_detail=az monitor app-insights component show --app $app_insights -g $resourceGroupName | ConvertFrom-Json
$resource_id="hidden-link:" + $app_detail.id +"=Resource"

foreach ($app_name in $app_detailes.Keys)
{
$app_detail=az monitor app-insights component show --app $app_insights -g $resourceGroupName | ConvertFrom-Json
$resource_id="hidden-link:" + $app_detail.id +"=Resource"
$web_test_name=generate-name -urls $app_detailes[$app_name]
$url=$app_detailes[$app_name]
$expected_code="200"
 write-host $web_test_name
 Write-Host $app_name
 write-host $url

 $web_test = [string]::Format('<WebTest Name=\"{0}\"  Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"120\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\" ><Items><Request Method=\"GET\"  Version=\"1.1\" Url=\"{1}\" ThinkTime=\"0\" Timeout=\"120\" ParseDependentRequests=\"True\" FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"False\" ResponseTimeGoal=\"0\" Encoding=\"utf-8\" ExpectedHttpStatusCode=\"{2}\" ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" /></Items></WebTest>',$web_test_name,$url,$expected_code)
echo $web_test
az monitor app-insights web-test create --kind "ping" --location "South Central US" --web-test $web_test  --description "Ping web test alert for mytestwebapp" --enabled true --frequency 300 --web-test-kind "ping" --locations Id="us-fl-mia-edge"  --defined-web-test-name $web_test_name --retry-enabled true --synthetic-monitor-id $web_test_name --timeout 120 --resource-group $resourceGroupName --name $web_test_name --tags $resource_id
}
