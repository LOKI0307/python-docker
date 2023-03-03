var id = guid('seed')
var timeout = 120
var frequency = 300
var guidId = guid('seed')
var method = 'GET'
var url = 'https://www.azureblue.io'
var expectedHttpStatusCode = 200
var version = '1.1'
var followRedirects = 'True'
var recordResults = 'True'
var cache = 'False'
var parseDependentRequests = 'False'
var ignoreHttpStatusCode = 'False'
var name1 = "rollout01"
var rg ="ConsoleInsightRSGroup"
var subscriptionId ="91d8605f-b80a-4b1c-bca1-6ec55bfd1deb"
var appInsightsName ="test1027"

resource urlPingWebTest 'Microsoft.Insights/webtests@2015-05-01' = {
  name: '${name1}'
  location: 'Central US'
  tags: {
    'hidden-link:/subscriptions/${subscriptionId}/resourceGroups/${rg}/providers/microsoft.insights/components/${appInsightsName}': 'Resource'
  }
  kind: 'ping'
  properties: {
    Configuration: {
      WebTest: '<WebTest xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" Name="${name1}" Id="${id}" Enabled="True" CssProjectStructure="" CssIteration="" Timeout="${timeout}" WorkItemIds="" Description="" CredentialUserName="" CredentialPassword="" PreAuthenticate="True" Proxy="default" StopOnError="False" RecordedResultFile="" ResultsLocale=""> <Items> <Request Method="${method}" Guid="${guidId}" Version="${version}" Url="${url}" ThinkTime="0" Timeout="${timeout}" ParseDependentRequests="${parseDependentRequests}" FollowRedirects="${followRedirects}" RecordResult="${recordResults}" Cache="${cache}" ResponseTimeGoal="0" Encoding="utf-8" ExpectedHttpStatusCode="${expectedHttpStatusCode}" ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="${ignoreHttpStatusCode}" /> </Items> </WebTest>'
    }
    Description: 'Runs a classic URL ping test'    
    Enabled: true
    Frequency: frequency
    Kind: 'ping'
    Locations: [
      {
        Id: 'emea-nl-ams-azr'
      }
      {
        Id: 'emea-ru-msa-edge'
      }
      {
        Id: 'apac-hk-hkn-azr'
      }
      {
        Id: 'latam-br-gru-edge'
      }
      {
        Id: 'emea-au-syd-edge'
      }
    ]
    Name: '${name1}'
    RetryEnabled: true 
    SyntheticMonitorId: '${name}-id'
    Timeout: timeout
  }
}