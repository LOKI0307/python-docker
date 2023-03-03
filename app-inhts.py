import os
cmm='az monitor app-insights component show --app "console insight - rs" -g "ConsoleInsightRSGroup" --subscription "91d8605f-b80a-4b1c-bca1-6ec55bfd1deb"'
sight_info = os.system(cmm)
print(type(sight_info))