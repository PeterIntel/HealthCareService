$postmanCollection = "SmartBedAPIGateaway.postman_collection.json"
$postmanEnvironment = "DevHealthcare.postman_environment.json"
$postmanGlobals = "HealthCare.postman_globals.json"
$registerProcareAgent = "TestResults\RegisterProcareAgent\newman_report_$(Get-Date -UFormat '%Y-%m-%d_%H-%M-%S')";
$updateProCareAgent = "TestResults\UpdateProCareAgent\newman_report_$(Get-Date -UFormat '%Y-%m-%d_%H-%M-%S')";
$updateBedStatus = "TestResults\UpdateBedStatus\newman_report_$(Get-Date -UFormat '%Y-%m-%d_%H-%M-%S')";
$deleteProCareAgent = "TestResults\DeleteProCareAgent\newman_report_$(Get-Date -UFormat '%Y-%m-%d_%H-%M-%S')";

newman run $postmanCollection --folder RegisterProCareAgent -d agentToRegister.json -e $postmanEnvironment -g $postmanGlobals --export-environment $postmanEnvironment --export-globals $postmanGlobals --reporters cli,json,html --reporter-json-export "$($registerProcareAgent)$('.json')" --reporter-html-export "$($registerProcareAgent)$('.html')"
newman run $postmanCollection --folder UpdateProCareAgent -d agentToUpdate.json -e $postmanEnvironment -g $postmanGlobals --export-environment $postmanEnvironment --export-globals $postmanGlobals --reporters cli,json,html --reporter-json-export "$($updateProCareAgent)$('.json')" --reporter-html-export "$($updateProCareAgent)$('.html')"
newman run $postmanCollection --folder UpdateBedStatus -d bedToUpdate.json -e $postmanEnvironment -g $postmanGlobals --export-environment $postmanEnvironment --export-globals $postmanGlobals --reporters cli,json,html --reporter-json-export "$($updateBedStatus)$('.json')" --reporter-html-export "$($updateBedStatus)$('.html')"
newman run $postmanCollection --folder DeleteProCareAgent -d agentToDelete.json -e $postmanEnvironment -g $postmanGlobals --export-environment $postmanEnvironment --export-globals $postmanGlobals --reporters cli,json,html --reporter-json-export "$($deleteProCareAgent)$('.json')" --reporter-html-export "$($deleteProCareAgent)$('.html')"