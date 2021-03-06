//Write All Common Generic Functions

var ConfigurationFilePath = "\\\\VS7RFCLH1\\ivls_integration_automation\\IVLS_Integration\\TESTDESIGN\\TESTENVIRONMENT\\Configuration.xml";
var Global = ProjectSuite.Variables;
var NGlobal = NetworkSuite.Variables;
/*================================================================================================================
  Function Name  : fnSetConfigurationDetails
  Purpose        : This function is used to create projecsuite variables for Configuration setup data 
  Pre-Condition  : Test Environment folder path has to be setup at Configuration Global Variable 
  Inputs         : Configuration.XML file 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function fnSetConfigurationDetails()
  {
    // Create ProjectSuite Global Variable
    // -----Project Setting Global Variables------
    fnCreateGlobalVariables("ProjectName","string");
    fnCreateGlobalVariables("ProjectPath","string");
    // -----Framework Configuration  Settings Global Variables------
    fnCreateGlobalVariables("FrameworkFolderPath","string");
    fnCreateGlobalVariables("ApplicationLogsFolderPath","string");
    fnCreateGlobalVariables("ApplicationLogsFilePath","string");
    fnCreateGlobalVariables("TestScenarioPath","string");
    fnCreateGlobalVariables("TestSuitePath","string");
    fnCreateGlobalVariables("TestDataFolderPath","string")
    // -----Simulator Configuration Settings Global Variables------
    fnCreateGlobalVariables("SimulatorAppPath","string");
    fnCreateGlobalVariables("SimulatorAppName","string");
    fnCreateGlobalVariables("SimulatorBuildVersion","string");
    fnCreateGlobalVariables("SimulatorMachineName","string");
    fnCreateGlobalVariables("SimulatorTestScriptPath","string");
    fnCreateGlobalVariables("SimulatorXMLDataFilePath","string");
    
    // -----IVLS Configuration Settings Global Variables------
    fnCreateGlobalVariables("IVLSAppName","string");
    fnCreateGlobalVariables("IVLSBuildVersion","string");
    fnCreateGlobalVariables("IVLSMachineName","string");
    fnCreateGlobalVariables("IVLSTestScriptPath","string");
    // -----Corner Stone Configuration Settings Global Variables------
    fnCreateGlobalVariables("CornerStoneAppName","string");
    fnCreateGlobalVariables("CornerStoneBuildVersion","string");
    fnCreateGlobalVariables("CornerStoneMachineName","string");
    // ----- Global Wait Settings  -------------------
    fnCreateGlobalVariables("MaxWaitTimeInMiliSecs","Integer");
    fnCreateGlobalVariables("MinWaitTimeInMiliSecs","Integer");
    fnCreateGlobalVariables("DefaultWaitTimeInMiliSecs","Integer");
    // ------- Host Global Variables
    fnCreateGlobalVariables("MachineName","string");
    fnCreateGlobalVariables("HostName","string");
    fnCreateGlobalVariables("UserName","string");
    fnCreateGlobalVariables("UserPWD","string");
    fnCreateGlobalVariables("BasePath","string");
    fnCreateGlobalVariables("TaskName","string");
    fnCreateGlobalVariables("JobName","string");
    fnCreateGlobalVariables("RemoteConnectionFlag","Boolean");
 
    // Reading Configuration XML file to Set Global Varable Values
    Log.Message("  Reading Configutaion.XML file for setting Global Data");
    fnSetGlobalVariableValue("ProjectName",fnGetConfigFileData("ProjectName"));
    fnSetGlobalVariableValue("ProjectPath",fnGetConfigFileData("ProjectPath"));
    fnSetGlobalVariableValue("FrameworkFolderPath",fnGetConfigFileData("FrameworkFolderPath"));
    fnSetGlobalVariableValue("ApplicationLogsFolderPath",fnGetConfigFileData("ApplicationLogsFolderPath"));
    var timestamp = new Date();
    strMonth = timestamp.getMonth()+1;
    strCustomdate = strMonth+""+timestamp.getDate()+""+timestamp.getFullYear()+""+timestamp.getHours()+""+timestamp.getMinutes()+""+timestamp.getSeconds();
    fnSetGlobalVariableValue("TestScenarioPath",Global.FrameworkFolderPath+"\\TESTDESIGN\\TESTSUITE\\TestScenario.xml");
    fnSetGlobalVariableValue("TestSuitePath",Global.FrameworkFolderPath+"\\TESTDESIGN\\TESTSUITE\\TestSuite.xml");
    fnSetGlobalVariableValue("TestDataFolderPath",Global.FrameworkFolderPath+"\\TESTDESIGN\\TESTDATA\\");
    //fnSetGlobalVariableValue("ApplicationLogsFilePath",Global.ApplicationLogsFolderPath+"\\"+"IVLS_Integration_LogReport_"+strCustomdate+".log");
    fnSetGlobalVariableValue("SimulatorAppPath",fnGetConfigFileData("SimulatorAppPath"));
    fnSetGlobalVariableValue("SimulatorAppName",fnGetConfigFileData("SimulatorAppName"));
    fnSetGlobalVariableValue("SimulatorBuildVersion",fnGetConfigFileData("SimulatorBuildVersion"));
    fnSetGlobalVariableValue("SimulatorMachineName",fnGetConfigFileData("SimulatorMachineName"));
    fnSetGlobalVariableValue("SimulatorTestScriptPath",fnGetConfigFileData("SimulatorTestScriptPath"));
    fnSetGlobalVariableValue("IVLSAppName",fnGetConfigFileData("IVLSAppName"));
    fnSetGlobalVariableValue("IVLSBuildVersion",fnGetConfigFileData("IVLSBuildVersion"));
    fnSetGlobalVariableValue("IVLSMachineName",fnGetConfigFileData("IVLSMachineName"));
    fnSetGlobalVariableValue("IVLSTestScriptPath",fnGetConfigFileData("IVLSTestScriptPath"));
    fnSetGlobalVariableValue("CornerStoneAppName",fnGetConfigFileData("CornerStoneAppName"));
    fnSetGlobalVariableValue("CornerStoneBuildVersion",fnGetConfigFileData("CornerStoneBuildVersion"));
    fnSetGlobalVariableValue("CornerStoneMachineName",fnGetConfigFileData("CornerStoneMachineName"));
    fnSetGlobalVariableValue("MaxWaitTimeInMiliSecs",fnGetConfigFileData("MaxWaitTimeInMiliSecs"));
    fnSetGlobalVariableValue("MinWaitTimeInMiliSecs",fnGetConfigFileData("MinWaitTimeInMiliSecs"));
    fnSetGlobalVariableValue("DefaultWaitTimeInMiliSecs",fnGetConfigFileData("DefaultWaitTimeInMiliSecs"));
 }
 function fnSetNetworkConfigurationDetails()
  {
    // Create NetworkSuite Global Variable
   // -----Framework Configuration  Settings Global Variables------
      fnCreateNetworkSuiteVariable("FrameworkFolderPath","string");
      fnCreateNetworkSuiteVariable("ApplicationLogsFolderPath","string");
      fnCreateNetworkSuiteVariable("ApplicationLogsFilePath","string");
      fnCreateNetworkSuiteVariable("TestDataFolderPath","string")
    // -----Simulator Configuration Settings Global Variables------
    fnCreateNetworkSuiteVariable("SimulatorAppPath","string");
    fnCreateNetworkSuiteVariable("SimulatorAppName","string");
    fnCreateNetworkSuiteVariable("SimulatorBuildVersion","string");
    fnCreateNetworkSuiteVariable("SimulatorMachineName","string");
    fnCreateNetworkSuiteVariable("SimulatorTestScriptPath","string");
    fnCreateNetworkSuiteVariable("SimulatorXMLDataFilePath","string");
    // -----IVLS Configuration Settings Global Variables------
    fnCreateNetworkSuiteVariable("IVLSAppName","string");
    fnCreateNetworkSuiteVariable("IVLSBuildVersion","string");
    fnCreateNetworkSuiteVariable("IVLSMachineName","string");
    fnCreateNetworkSuiteVariable("IVLSTestScriptPath","string");
    // -----Corner Stone Configuration Settings Global Variables------
    fnCreateNetworkSuiteVariable("CornerStoneAppName","string");
    fnCreateNetworkSuiteVariable("CornerStoneBuildVersion","string");
    fnCreateNetworkSuiteVariable("CornerStoneMachineName","string");
    // ----- Global Wait Settings  -------------------
    fnCreateNetworkSuiteVariable("MaxWaitTimeInMiliSecs","Integer");
    fnCreateNetworkSuiteVariable("MinWaitTimeInMiliSecs","Integer");
    fnCreateNetworkSuiteVariable("DefaultWaitTimeInMiliSecs","Integer");
    
        // Test Data Global Variables
    fnCreateNetworkSuiteVariable("InputData","String");
    fnCreateNetworkSuiteVariable("ClientID","String");
    fnCreateNetworkSuiteVariable("PatientID","String");
    fnCreateNetworkSuiteVariable("PatientName","String");
    fnCreateNetworkSuiteVariable("ReqID","String");
    fnCreateNetworkSuiteVariable("LabID","String");
    fnCreateNetworkSuiteVariable("LABTESTNAME","String");
    fnCreateNetworkSuiteVariable("ProfileID","String");
    fnCreateNetworkSuiteVariable("VisitTypeID","String");
    
    fnSetNetworkVariableValue("FrameworkFolderPath",fnGetConfigFileData("FrameworkFolderPath"));
    fnSetNetworkVariableValue("ApplicationLogsFolderPath",fnGetConfigFileData("ApplicationLogsFolderPath"));
    fnSetNetworkVariableValue("TestDataFolderPath",Global.FrameworkFolderPath+"\\TESTDESIGN\\TESTDATA\\");
    var timestamp = new Date();
    strMonth = timestamp.getMonth()+1;
    strCustomdate = strMonth+""+timestamp.getDate()+""+timestamp.getFullYear()+""+timestamp.getHours()+""+timestamp.getMinutes()+""+timestamp.getSeconds();
    fnSetNetworkVariableValue("ApplicationLogsFilePath",Global.ApplicationLogsFolderPath+"\\"+"IVLS_Integration_LogReport_"+strCustomdate+".log");
    fnSetNetworkVariableValue("SimulatorAppPath",fnGetConfigFileData("SimulatorAppPath"));
    fnSetNetworkVariableValue("SimulatorAppName",fnGetConfigFileData("SimulatorAppName"));
    fnSetNetworkVariableValue("SimulatorBuildVersion",fnGetConfigFileData("SimulatorBuildVersion"));
    fnSetNetworkVariableValue("SimulatorMachineName",fnGetConfigFileData("SimulatorMachineName"));
    fnSetNetworkVariableValue("SimulatorTestScriptPath",fnGetConfigFileData("SimulatorTestScriptPath"));
    fnSetNetworkVariableValue("SimulatorXMLDataFilePath",fnGetConfigFileData("SimulatorXMLDataFilePath"));
    fnSetNetworkVariableValue("IVLSAppName",fnGetConfigFileData("IVLSAppName"));
    fnSetNetworkVariableValue("IVLSBuildVersion",fnGetConfigFileData("IVLSBuildVersion"));
    fnSetNetworkVariableValue("IVLSMachineName",fnGetConfigFileData("IVLSMachineName"));
    fnSetNetworkVariableValue("IVLSTestScriptPath",fnGetConfigFileData("IVLSTestScriptPath"));
    fnSetNetworkVariableValue("CornerStoneAppName",fnGetConfigFileData("CornerStoneAppName"));
    fnSetNetworkVariableValue("CornerStoneBuildVersion",fnGetConfigFileData("CornerStoneBuildVersion"));
    fnSetNetworkVariableValue("CornerStoneMachineName",fnGetConfigFileData("CornerStoneMachineName"));
    fnSetNetworkVariableValue("MaxWaitTimeInMiliSecs",fnGetConfigFileData("MaxWaitTimeInMiliSecs"));
    fnSetNetworkVariableValue("MinWaitTimeInMiliSecs",fnGetConfigFileData("MinWaitTimeInMiliSecs"));
    fnSetNetworkVariableValue("DefaultWaitTimeInMiliSecs",fnGetConfigFileData("DefaultWaitTimeInMiliSecs"));
 }
 /*================================================================================================================
  Function Name  : fnRemoveGlobalData
  Purpose        : This function is used to delete all existing projecsuite variables containing Configuration setup data 
  Pre-Condition  :  
  Inputs         : Configuration.XML file 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function fnRemoveGlobalData()
  {
    // Delete all  ProjectSuite Global Variable
    fnDeleteGlobalVariable("ProjectName");
    fnDeleteGlobalVariable("ProjectPath");
    fnDeleteGlobalVariable("FrameworkFolderPath");
    fnDeleteGlobalVariable("ApplicationLogsFolderPath");
    fnDeleteGlobalVariable("TestScenarioPath");
    fnDeleteGlobalVariable("TestSuitePath");
    fnDeleteGlobalVariable("ApplicationLogsFilePath");
    fnDeleteGlobalVariable("TestDataFolderPath");
    fnDeleteGlobalVariable("SimulatorAppPath");
    fnDeleteGlobalVariable("SimulatorAppName");
    fnDeleteGlobalVariable("SimulatorBuildVersion");
    fnDeleteGlobalVariable("SimulatorTestScriptPath");
    fnDeleteGlobalVariable("SimulatorMachineName");
    fnDeleteGlobalVariable("IVLSAppName");
    fnDeleteGlobalVariable("IVLSBuildVersion");
    fnDeleteGlobalVariable("IVLSTestScriptPath");
    fnDeleteGlobalVariable("IVLSMachineName");
    fnDeleteGlobalVariable("CornerStoneAppName");
    fnDeleteGlobalVariable("CornerStoneBuildVersion");
    fnDeleteGlobalVariable("CornerStoneMachineName");
    fnDeleteGlobalVariable("MaxWaitTimeInMiliSecs");
    fnDeleteGlobalVariable("MinWaitTimeInMiliSecs");
    fnDeleteGlobalVariable("DefaultWaitTimeInMiliSecs");
    fnDeleteGlobalVariable("TestScenarioTable");
    fnDeleteGlobalVariable("TestSuiteTable");
    fnDeleteGlobalVariable("HostTable");
    
    fnDeleteNewtorkVariable("ProjectName");
    fnDeleteNewtorkVariable("ProjectPath");
    fnDeleteNewtorkVariable("FrameworkFolderPath");
    fnDeleteNewtorkVariable("ApplicationLogsFolderPath");
    fnDeleteNewtorkVariable("TestScenarioPath");
    fnDeleteNewtorkVariable("TestSuitePath");
    fnDeleteNewtorkVariable("ApplicationLogsFilePath");
    fnDeleteNewtorkVariable("TestDataFolderPath");
    fnDeleteNewtorkVariable("SimulatorAppPath");
    fnDeleteNewtorkVariable("SimulatorAppName");
    fnDeleteNewtorkVariable("SimulatorBuildVersion");
    fnDeleteGlobalVariable("SimulatorTestScriptPath");
    fnDeleteNewtorkVariable("SimulatorMachineName");
    fnDeleteNewtorkVariable("IVLSAppName");
    fnDeleteNewtorkVariable("IVLSBuildVersion");
    fnDeleteNewtorkVariable("IVLSTestScriptPath");
    fnDeleteNewtorkVariable("IVLSMachineName");
    fnDeleteNewtorkVariable("CornerStoneAppName");
    fnDeleteNewtorkVariable("CornerStoneBuildVersion");
    fnDeleteNewtorkVariable("CornerStoneMachineName");
    fnDeleteNewtorkVariable("MaxWaitTimeInMiliSecs");
    fnDeleteNewtorkVariable("MinWaitTimeInMiliSecs");
    fnDeleteNewtorkVariable("DefaultWaitTimeInMiliSecs");
    fnDeleteNewtorkVariable("ClientID");
    fnDeleteNewtorkVariable("PatientID");
    fnDeleteNewtorkVariable("ReqID");
    
  }
  
/*================================================================================================================
  Function Name  : fnCreateGlobalVariables
  Purpose        : This function is used to create projecsuite variables
  Pre-Condition  : N/A
  Inputs         : Variable Name , Variable type 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function fnCreateGlobalVariables(GlobalVariableName,VariableType)
{
  if(!Global.VariableExists(GlobalVariableName))
  {
    Global.AddVariable(GlobalVariableName , VariableType);
  }
}
function fnCreateNetworkSuiteVariable(NetworkVariableName,VariableType)
{
  if(!NetworkSuite.Variables.VariableExists(NetworkVariableName))
  {
      NetworkSuite.Variables.AddVariable(NetworkVariableName,VariableType);
   }   
}
/*================================================================================================================
  Function Name  : fnDeleteGlobalVariable
  Purpose        : This function is used to delete projecsuite variables
  Pre-Condition  : N/A
  Inputs         : Variable Name 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function fnDeleteGlobalVariable(GlobalVariableName)
{
  if(Global.VariableExists(GlobalVariableName))
  {
    Global.RemoveVariable(GlobalVariableName);
  }
}
function fnDeleteNewtorkVariable(NetworkVariableName)
{
  if(NetworkSuite.Variables.VariableExists(NetworkVariableName))
  {
    NetworkSuite.Variables.RemoveVariable(NetworkVariableName)
  }
}
/*================================================================================================================
  Function Name  : fnSetGlobalVariableValue
  Purpose        : This function is used to set the value to projectsuite variable
  Pre-Condition  : N/A
  Inputs         : Variable Name , Variable value
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function fnSetGlobalVariableValue(GlobalVariableName,GlobalVariableValue)
{
  if(Global.VariableExists(GlobalVariableName))
  {
    Global.VariableByName(GlobalVariableName) = GlobalVariableValue;
  }
}
function fnSetNetworkVariableValue(NewtorkVariableName,NetworkVariableValue)
{
  if(NetworkSuite.Variables.VariableExists(NewtorkVariableName))
  {
    NetworkSuite.Variables.VariableByName(NewtorkVariableName)=NetworkVariableValue;
  }
}
/*================================================================================================================
  Function Name  : ckeckNetwotkConnection
  Purpose        : This function is used to check N/W Connection Status for given machine name
  Pre-Condition  : N/A
  Inputs         : MachineName
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 10th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/

function ckeckNetwotkConnection(strMachineName)
{ 
    var fso, fp,fd, strStatus;
    var ForReading = 1;
    var strComputerName = strMachineName;
    
    var strOutputtextFilePath = Global.FrameworkFolderPath+"\\TESTDESIGN\\TESTDATA\\checkconnection.txt";
    var blnStatus = false;
    // Ping to verify n/w connection status
    try
    {
      var shell=new ActiveXObject("WScript.Shell");
      var strCmd = "cmd /K ping -n 1 "+strComputerName+" | FIND /i \"Reply\">>"+strOutputtextFilePath;
      shell.Run(strCmd);
      aqUtils.Delay(Global.MinWaitTimeInMiliSecs);
      shell.Exec("taskkill /F /IM cmd.exe");
      aqUtils.Delay(Global.DefaultWaitTimeInMiliSecs);
    }
    catch(err)
    {
        LogStatus("" ," Execution is terminating.. due to "+err.message);
        return blnStatus;
    }
     // Verify connection status in Ouput text file
    try
    {
      fso = new ActiveXObject("Scripting.FileSystemObject");
      aqUtils.Delay(Global.DefaultWaitTimeInMiliSecs);
      if (fso.FileExists(strOutputtextFilePath))
      {
          fp = fso.OpenTextFile(strOutputtextFilePath, ForReading);
          strStatus = fp.ReadLine();
          if(aqString.Find(strStatus,"bytes=32 time<1ms TTL=128",0,false)>1)
          {
              blnStatus = true;
          }
          else
          {
              blnStatus = false;
          }
          fp.Close();
          // Delete the network connect status output file
          fd = fso.GetFile(strOutputtextFilePath);
          fd.Delete(true);
      }
      else
      {
        LogStatus(false, "Unable to find Connection Status verification Output File due to "+err.message);
      }
    }
    catch(err) 
    {
        return blnStatus;
    }
    return blnStatus;
}
/*================================================================================================================
  Function Name  : fnGetConfigFileData
  Purpose        : This function is used to retrive node value from Congifuration file 
  Pre-Condition  :  
  Inputs         : Nodename 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnGetConfigFileData(strNodeName)
  {
      var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");

      //load the file sync'ly     
      xmlDoc.async = false
      try
      {
          xmlDoc.load(ConfigurationFilePath);       
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("*");
          for(var Elem=0;  Elem<NodeList.length ; Elem++)
          {
              if (aqString.Compare(NodeList[Elem].tagName, strNodeName,false)==0)
              { 
                  return NodeList[Elem].text;
              }
          }
      } 
      catch(e)
      {
          LogStatus("Terminate", " Unable to Read  Configutaion.XML file in specified path"+ConfigurationFilePath);    
      }
  }
/*================================================================================================================
  Function Name  : fnReadTestSuiteFile
  Purpose        : This function is used to read Test Suite XML file and assign to Table type Global Variable 
  Pre-Condition  : TestSuite.XML has be to available
  Inputs         : TestSuiteFilePath 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnReadTestSuiteFile()
  {
      var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
      var intTestScenarioCount;
      //load the file sync'ly 
      xmlDoc.async = false
      try
      {
          xmlDoc.load(Global.TestSuitePath);      
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("TestScenario");
          fnCreateGlobalVariables("TestScenarioCount","Integer");
          fnSetGlobalVariableValue("TestScenarioCount",NodeList.length);
          fnCreateGlobalVariables("TestSuiteTable","Table");
          Global.TestSuiteTable.RowCount = Global.TestScenarioCount;
          Global.TestSuiteTable.AddColumn("ScenarioID");
          Global.TestSuiteTable.AddColumn("ScenarioName");
          Global.TestSuiteTable.AddColumn("DataIteration");
          Global.TestSuiteTable.AddColumn("IterationCount");
          Global.TestSuiteTable.AddColumn("ScenarioExecutionFlag");
          Global.TestSuiteTable.AddColumn("TestDataName");
          //Writing Test Suite details from TestSuite XML file to TestSuite Table Variable
          for (Elem = 0; Elem < Global.TestScenarioCount; Elem++)
          {
                  Global.TestSuiteTable.Item("ScenarioID",Elem)= NodeList[Elem].getElementsByTagName("ScenarioID")[0].childNodes[0].nodeValue;
                  Global.TestSuiteTable.Item("ScenarioName",Elem)= NodeList[Elem].getElementsByTagName("ScenarioName")[0].childNodes[0].nodeValue;
                  Global.TestSuiteTable.Item("DataIteration",Elem)= NodeList[Elem].getElementsByTagName("DataIteration")[0].childNodes[0].nodeValue;
                  Global.TestSuiteTable.Item("IterationCount",Elem)= NodeList[Elem].getElementsByTagName("IterationCount")[0].childNodes[0].nodeValue;
                  Global.TestSuiteTable.Item("ScenarioExecutionFlag",Elem)= NodeList[Elem].getElementsByTagName("ScenarioExecutionFlag")[0].childNodes[0].nodeValue;
                  Global.TestSuiteTable.Item("TestDataName",Elem)= NodeList[Elem].getElementsByTagName("TestDataName")[0].childNodes[0].nodeValue;
          }
      } 
      catch(e)
      {
          LogStatus("Terminate", "  Unable to Read TestSuite.XML file in specified path"+Global.TestSuitePath);    
      }
  }
/*================================================================================================================
  Function Name  : fnCreateTestSuiteVariables
  Purpose        : This function is used to Create  Test Suite Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnCreateTestSuiteVariables()
  {
      fnCreateGlobalVariables("ScenarioID","String");
      fnCreateGlobalVariables("ScenarioName","String");
      fnCreateGlobalVariables("DataIteration","String");
      fnCreateGlobalVariables("IterationCount","String");
      fnCreateGlobalVariables("ScenarioExecutionFlag","String");
      fnCreateGlobalVariables("TestDataName","String");
  }
  
/*================================================================================================================
  Function Name  : fnRemoveTestSuiteVariables
  Purpose        : This function is used to delete  Test Suite Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnRemoveTestSuiteVariables()
  {
      fnDeleteGlobalVariable("ScenarioID");
      fnDeleteGlobalVariable("ScenarioName");
      fnDeleteGlobalVariable("DataIteration");
      fnDeleteGlobalVariable("IterationCount");
      fnDeleteGlobalVariable("ScenarioExecutionFlag");
      fnDeleteGlobalVariable("TestDataName");
  }
  /*================================================================================================================
  Function Name  : fnSetTestDataFilePathVariable
  Purpose        : This function is used to Set Test Data File Path
  Pre-Condition  : Test Data file has be to available
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnSetTestDataFilePathVariable()
  {
      Global.VariableByName("TestDataName").value;
  }
  /*================================================================================================================
  Function Name  : fnReadTestSCenarioFile
  Purpose        : This function is used to read Test Scenario XML file and assign to Table type Global Variable 
  Pre-Condition  : TestSuite.XML has be to available
  Inputs         : TestSuiteFilePath 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnReadTestSCenarioFile()
  {
      var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
      var intTestScenarioCount;
      var intTestStepCount =0;
      //load the file sync'ly 
      xmlDoc.async = false
      try
      {
          xmlDoc.load(Global.TestScenarioPath);      
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("TestScenario");
          var intScenarioCount = NodeList.length;
          // Creating Test Scenario Global Variable Table
          fnCreateGlobalVariables("TestScenarioTable","Table");
          Global.TestScenarioTable.RowCount = 1;
          Global.TestScenarioTable.AddColumn("TestScenarioID");
          Global.TestScenarioTable.AddColumn("TestStepID");
          Global.TestScenarioTable.AddColumn("TestStepDescription");
          Global.TestScenarioTable.AddColumn("PerformAction");
          Global.TestScenarioTable.AddColumn("InputData");
          Global.TestScenarioTable.AddColumn("StepExecuteFlag");
          Global.TestScenarioTable.AddColumn("Application");
          
          // Reading Scenario details
          for(var iScenario =0; iScenario < intScenarioCount ; iScenario++)
          {
              var strScenarioID = NodeList[iScenario].getAttribute("ScenarioID");
              var TestCaseNode = NodeList[iScenario].getElementsByTagName("TestStep");
              // Writing  Test Steps to Scenario Global Table
              for(var itestStep = 0; itestStep < TestCaseNode.length ; itestStep++)
              {           
                  intTestStepCount = intTestStepCount + 1;
                  Global.TestScenarioTable.RowCount = intTestStepCount;
                  Global.TestScenarioTable.Item("TestScenarioID",intTestStepCount-1)= strScenarioID;
                  Global.TestScenarioTable.Item("TestStepID",intTestStepCount-1)= TestCaseNode[itestStep].getAttribute("StepId");
                  Global.TestScenarioTable.Item("TestStepDescription",intTestStepCount-1)= TestCaseNode[itestStep].getElementsByTagName("StepDescription")[0].childNodes[0].nodeValue;
                  Global.TestScenarioTable.Item("PerformAction",intTestStepCount-1)= TestCaseNode[itestStep].getElementsByTagName("PerformAction")[0].childNodes[0].nodeValue;
                  Global.TestScenarioTable.Item("InputData",intTestStepCount-1)= TestCaseNode[itestStep].getElementsByTagName("InputData")[0].childNodes[0].nodeValue;
                  Global.TestScenarioTable.Item("StepExecuteFlag",intTestStepCount-1)= TestCaseNode[itestStep].getElementsByTagName("StepExecuteFlag")[0].childNodes[0].nodeValue;
                  Global.TestScenarioTable.Item("Application",intTestStepCount-1)= TestCaseNode[itestStep].getElementsByTagName("Application")[0].childNodes[0].nodeValue;
                  
              }   
              
          }
      } 
      catch(e)
      {
          LogStatus("Terminate", "  Unable to Read TestScenario.XML file in specified path"+Global.TestScenarioPath);    
      }
  }
/*================================================================================================================
  Function Name  : fnCreateTestScenarioVariables
  Purpose        : This function is used to Create  Test Scenario  Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnCreateTestScenarioVariables()
  {
      fnCreateGlobalVariables("TestScenarioID","String");
      fnCreateGlobalVariables("TestStepID","String");
      fnCreateGlobalVariables("TestStepDescription","String");
      fnCreateGlobalVariables("PerformAction","String");
      fnCreateGlobalVariables("InputData","String");
      fnCreateGlobalVariables("StepExecuteFlag","String");
      fnCreateGlobalVariables("Application","String");
  }
/*================================================================================================================
  Function Name  : fnRemoveTestScenarioVariables
  Purpose        : This function is used to delete  Test Scenario  Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnRemoveTestScenarioVariables()
  {
      fnDeleteGlobalVariable("ScenarioID");
      fnDeleteGlobalVariable("TestStepID");
      fnDeleteGlobalVariable("TestStepDescription");
      fnDeleteGlobalVariable("PerformAction");
      fnDeleteGlobalVariable("InputData");
      fnDeleteGlobalVariable("StepExecuteFlag");
      fnDeleteGlobalVariable("Application");
  }
/*================================================================================================================
  Function Name  : fnCreateHostVariables
  Purpose        : This function is used to Create  Host  Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnCreateHostVariables()
  {
      fnCreateGlobalVariables("MachineName","String");
      fnCreateGlobalVariables("HostName","String");
      fnCreateGlobalVariables("UserName","String");
      fnCreateGlobalVariables("UserPWD","String");
      fnCreateGlobalVariables("BasePath","String");
      fnCreateGlobalVariables("TaskName","String");
      fnCreateGlobalVariables("JobName","String");
      fnCreateGlobalVariables("RemoteConnectionFlag","String");
  }
/*================================================================================================================
  Function Name  : fnRemoveHostVariables
  Purpose        : This function is used to delete  Host  Global Variables
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnRemoveHostVariables()
  {
      fnDeleteGlobalVariable("MachineName");
      fnDeleteGlobalVariable("HostName");
      fnDeleteGlobalVariable("UserName");
      fnDeleteGlobalVariable("UserPWD");
      fnDeleteGlobalVariable("BasePath");
      fnDeleteGlobalVariable("TaskName");
      fnDeleteGlobalVariable("JobName");
      fnDeleteGlobalVariable("RemoteConnectionFlag");
  }
 /*================================================================================================================
  Function Name  : fnReadHostDeatils
  Purpose        : This function is used to read Host Machine details from Configuration XML file and assign to Table type Global Variable 
  Pre-Condition  : Configuration.XML has be to available
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnReadHostDeatils()
  {
      var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
      var intRowCount =0;
      var HostMachineCount
      //load the file sync'ly 
      xmlDoc.async = false
      try
      {
          xmlDoc.load(ConfigurationFilePath);      
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("Host");
          var HostMachineCount = NodeList.length;
          // Creating Host Global Variable Table
          fnCreateGlobalVariables("HostTable","Table");
          Global.HostTable.RowCount = 1;
          Global.HostTable.AddColumn("MachineName");
          Global.HostTable.AddColumn("HostName");
          Global.HostTable.AddColumn("UserName");
          Global.HostTable.AddColumn("UserPWD");
          Global.HostTable.AddColumn("BasePath");
          Global.HostTable.AddColumn("TaskName");
          Global.HostTable.AddColumn("JobName");
          Global.HostTable.AddColumn("RemoteConnectionFlag");
          // Reading Host details
          for(var iHost =0; iHost < HostMachineCount ; iHost++)
          {
              intRowCount = intRowCount+1;
              Global.HostTable.RowCount = intRowCount;
              Global.HostTable.Item("MachineName",intRowCount-1)= NodeList[iHost].getElementsByTagName("MachineName")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("HostName",intRowCount-1)= NodeList[iHost].getElementsByTagName("HostName")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("UserName",intRowCount-1)= NodeList[iHost].getElementsByTagName("UserName")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("UserPWD",intRowCount-1)= NodeList[iHost].getElementsByTagName("UserPWD")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("BasePath",intRowCount-1)= NodeList[iHost].getElementsByTagName("BasePath")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("TaskName",intRowCount-1)= NodeList[iHost].getElementsByTagName("TaskName")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("JobName",intRowCount-1)= NodeList[iHost].getElementsByTagName("JobName")[0].childNodes[0].nodeValue;
              Global.HostTable.Item("RemoteConnectionFlag",intRowCount-1)= NodeList[iHost].getElementsByTagName("RemoteConnectionFlag")[0].childNodes[0].nodeValue;
              
          }
      } 
      catch(e)
      {
          LogStatus("Terminate", "  Unable to Read Host details in  Configuration.XML file in specified path"+ConfigurationFilePath);    
      }
  }  
  
 /*================================================================================================================
  Function Name  : fnGetHostDetailsbyMachineName
  Purpose        : This function is used to return  Host details for given nachine name from HOST Table 
  Pre-Condition  : Host Table has be to available
  Inputs         : Machine Name, ReturnString
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnGetHostDetailsbyMachineName(strMachineName,strSearch)
  {
          strMachineName = aqString.Trim(strMachineName);
          strSearch = aqString.Trim(aqString.ToUpper(strSearch));
          
          for(var iHost =0; iHost < Global.HostTable.RowCount ; iHost++)
          {
              if(aqString.Compare(aqString.Trim(Global.HostTable.Item("MachineName",iHost)),strMachineName,false)==0)
              {
                switch (strSearch)
                {
                  case 'HOSTNAME': return Global.HostTable.Item("HostName",iHost);
                                    break;
                  case 'USERNAME': return Global.HostTable.Item("UserName",iHost);
                                    break;
                  case 'USERPWD'  : return Global.HostTable.Item("UserPWD",iHost);
                                    break;
                  case 'BASEPATH': return Global.HostTable.Item("BasePath",iHost);
                                    break;
                  case 'TASKNAME': return Global.HostTable.Item("TaskName",iHost);
                                    break;
                  case 'JOBNAME': return Global.HostTable.Item("JobName",iHost);
                                    break;
                  default         : Log.Error("Unable to find Host details");
                                    iHost = Global.HostTable.RowCount;
                }
              }
              
          }   
  }
/*================================================================================================================
  Function Name  : fnGetHostMachineNamebyHostName
  Purpose        : This function is used to return  MachineName details for given Host name from HOST Table 
  Pre-Condition  : Host Table has be to available
  Inputs         : Host Name, ReturnString
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 11th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnGetHostMachineNamebyHostName(strHostName)
  {
          strHostName = aqString.Trim(strHostName);
          foundflag = false;
          for(var iHost =0; iHost < Global.HostTable.RowCount ; iHost++)
          {
              if(aqString.Compare(aqString.Trim(Global.HostTable.Item("HostName",iHost)),strHostName,false)==0)
              {
                return Global.HostTable.Item("MachineName",iHost);
                foundflag = true;
                iHost = Global.HostTable.RowCount;
              }
          }
          if(foundflag == false)
            LogStatus("Terminate", " Unable to Find Machine Name in Host Table, Please Check the given Host Name"+strHostName);
  } 
/*================================================================================================================
  Function Name  : fnCreateHostConnection
  Purpose        : This function is used to Create  Host Machine
  Pre-Condition  : Configuration.XML
  Inputs         :  HostName , Remote Machine Address/Name,Domain,UserName,Password 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 14th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnCreateHostConnection(strHostName,strMachineName,strUserName,strUserPWD,strBasePath)
  {
      try
      {
        if(ckeckNetwotkConnection(aqString.Trim(strMachineName)) == true)
        {
          LogStatus(true,"Network Connection Status : Success , Machine Name "+strMachineName +"  is connected to the newwork");
          if(!(NetworkSuite.Hosts.ItemByName(strHostName)))
          {
            var Host = NetworkSuite.Hosts.AddNew();
            Host.Name = aqString.Trim(strHostName);
            Host.Address = aqString.Trim(strMachineName);
            Host.UserName = aqString.Trim(strUserName);
            Host.Password = aqString.Trim(strUserPWD);
            Host.BasePath = aqString.Trim(strBasePath);
            Host.LogonMode = 0;
            Host.CopyProjectToSlave();
            LogStatus(true,"Create Host Connection  Status : Success , Host Name  "+strHostName +"  is created for Remote Machine  "+strMachineName);
          }
          else
          {
              NetworkSuite.Hosts.ItemByName(strHostName).CopyProjectToSlave();
              LogStatus(true,"Create Host Connection Status  : Success , Host Name  "+strHostName +"  is created for Remote Machine  "+strMachineName);
          }
        }
        else
        {
            LogStatus("","Error Occured , May be Due to "+err.message);
            LogStatus("Terminate","Network Connection Status : Failed, Machine Name "+strMachineName +"  is not connected to network  , Please check the Network Connection Cable and try again.........");
        }
    } 
    catch(e)
    {
        LogStatus("", " Error Occurred due to "+e.message);
        LogStatus("Terminate", " Unable to  create Host Connection for  "+ strHostName +" Status : Failed, Please check network connection of Machine Name "+strMachineName);   
    }    
  }
/*================================================================================================================
  Function Name  : fnCreateJobsAndTask
  Purpose        : This function is used to Create  new Job and Task
  Pre-Condition  : Configuration.XML
  Inputs         :  JobName 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
  function fnCreateJobsAndTask(strJobName,strTaskName,strHostName, strMachineName)
  {
    try
    {
        if(!(NetworkSuite.Jobs.ItemByName(strJobName)))
        {
          var oJob = NetworkSuite.Jobs.AddNew();
          oJob.Name = strJobName
          LogStatus(true,"Create Job for Host  "+strHostName+"  Status : Success , Job   "+strJobName +"  is created  Successfully on Machine  "+strMachineName +" under Host  "+strHostName);
          if(!(oJob.Tasks.ItemByName(strTaskName)))
          {
              var oTask = oJob.Tasks.AddNew();
              oTask.Name = strTaskName;
              oTask.Host = NetworkSuite.Hosts.ItemByName(strHostName);
              oTask.HostTimeOut = 10
              oTask.CopyRemoteLogMode = crlWhenNotOK;
              oTask.ActionAfterRun = saClose;
              oTask.RemoteApplication = 1;
              oTask.ProjectPath = "\IVLS_AUTOMATION\\IVLS_AUTOMATION.mds";
              LogStatus(true,"Create Task for Job "+strJobName +"  Status : Success , Task    "+strTaskName +"  is created  Successfully on Host "+strHostName +"  for Job "+strJobName);
          }
          else
          {
            LogStatus(true,"Create Task for Job "+strJobName +"  Status : Success , Task    "+strTaskName +"  is created  Successfully on Host "+strHostName +"  for Job "+strJobName);
          }
        }
        else
        {
            LogStatus(true,"Create Job for Host  "+strHostName+"  Status : Success , Job   "+strJobName +"  is created  Successfully on Machine  "+strMachineName +" under Host  "+strHostName);
            if(!(NetworkSuite.Jobs.ItemByName(strJobName).Tasks.ItemByName(strTaskName)))
            {
                var oTask = NetworkSuite.Jobs.ItemByName(strJobName).Tasks.AddNew();
                oTask.Name = strTaskName;
                oTask.Host = NetworkSuite.Hosts.ItemByName(strHostName);
                oTask.HostTimeOut = 10
                oTask.CopyRemoteLogMode = crlWhenNotOK;
                oTask.ActionAfterRun = saClose;
                oTask.RemoteApplication = 1;
                oTask.ProjectPath = "\IVLS_AUTOMATION\\IVLS_AUTOMATION.mds";
                LogStatus(true,"Create Task for Job "+strJobName +"  Status : Success , Task    "+strTaskName +"  is created  Successfully on Host "+strHostName +"  for Job "+strJobName);
            }
            else
            {
              LogStatus(true,"Create Task for Job "+strJobName +"  Status : Success , Task    "+strTaskName +"  is created  Successfully on Host "+strHostName +"  for Job "+strJobName);
            }
            
        }
    } 
    catch(e)
    {
        LogStatus("", " Error Occurred due to "+e.message);
        LogStatus("Terminate", " Unable to Create Jobs and Tasks for Host Name "+ strHostName +", Please check network connection");   
    }
  }
  /*================================================================================================================
  Function Name  : TimeStamp
  Purpose        : This function is will return current Date and Time Stamp
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function TimeStamp()
  {
      var currentdate = new Date();
      var datetime = currentdate.getMonth()+1+ "/"+ currentdate.getDate()
                    + "/" + currentdate.getFullYear() + " @ " 
                    + currentdate.getHours() + ":" 
                    + currentdate.getMinutes() + ":" + currentdate.getSeconds();
        return datetime;
  }
  
  function getLabRequestOrderDate()
  {
   var currentdate = new Date();
   strMonth = currentdate.getMonth()+1;
   strMonth = strMonth.toString();
   strDay = currentdate.getDate();
   strDay = strDay.toString();
   if(strMonth.length < 2)
   {
    strMonth = "0"+strMonth;
   }
   if(strDay.length < 2)
   {
      strDay = "0"+strDay;
   }
   strHours = currentdate.getHours();
   strHours = strHours.toString();
   if(strHours.length < 2)
   {
      strHours = "0"+strHours;
   }
   var strOrderDate = currentdate.getFullYear()+"-"+strMonth+"-"+strDay+" "+strHours+":" +currentdate.getMinutes()+ ":" +currentdate.getSeconds();
   return strOrderDate;
  }
  
   /*================================================================================================================
  Function Name  : LogTime
  Purpose        : This function is will return LoG Date and Time Stamp
  Pre-Condition  : 
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogTime()
  {
    var currentdate = new Date();
    var datetime = "[LOGS:"+ " @ " 
                    + currentdate.getHours() + ":" 
                    + currentdate.getMinutes() + ":" + currentdate.getSeconds()+"]";
        return datetime;
  
  }
  
/*================================================================================================================
  Function Name  : fnCreateApplicationLogFile
  Purpose        : This function is used to Create  Application Log File
  Pre-Condition  : Configuration.XML
  Inputs         : Application Log File Name 
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function fnCreateApplicationLogFile()
  {
    var fso, fp,ts;
    var strDate = new Date();
    var strUser = new ActiveXObject("WScript.Network");
    var strCompuerName = aqString.ToUpper(strUser.computerName);
    fso = new ActiveXObject("Scripting.FileSystemObject");
    fp = fso.CreateTextFile(NGlobal.ApplicationLogsFilePath);
    fp.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    fp.WriteLine("!!!!!!!!!!!!!!!!!!!!!!   I V L S AUTOMATION  - TEST EXECUTION LOGS  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    fp.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    fp.WriteLine("TEST ENVIRONMENT");
    fp.WriteLine("................................................................................................................................");
    fp.WriteLine("S.No	| MACHINE NAME	| APPLICATION NAME	| BUILD VER.       	| EXECUTED ON		| EXECUTED BY	| EXECUTED FROM	");
    fp.WriteLine("................................................................................................................................");
    fp.WriteLine("1	| "+Global.SimulatorMachineName+"	| "+Global.SimulatorAppName+"	| "+Global.SimulatorBuildVersion+"	| "+TimeStamp()+"	| "+strUser.UserName+"	| "+strCompuerName);	
    fp.WriteLine("2	| "+Global.IVLSMachineName+"	| "+Global.IVLSAppName+" | "+Global.IVLSBuildVersion+"		| "+TimeStamp()+"	| "+strUser.UserName+"	| "+strCompuerName);
    fp.WriteLine("3	| "+Global.CornerStoneMachineName+"	| "+Global.CornerStoneAppName+"		| "+Global.CornerStoneBuildVersion+"			| "+TimeStamp()+"	| "+strUser.UserName+"	| "+strCompuerName);	
    fp.WriteLine("................................................................................................................................");
    fp.WriteLine("");
    fp.WriteLine("CHECKING NETWORK CONNECTION OF REMOTE MACHINE(S) FOR CREATING HOST CONNECTION");
    fp.WriteLine("");
    fp.Close();
  }
  /*================================================================================================================
  Function Name  : LogStatus
  Purpose        : This function is used to Create  Application Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : Report Status,Report Description
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogStatus(strStatus , strReportDesc)
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);
      strStatus = aqString.ToUpper(strStatus);
      switch (strStatus)
      {
                              
          case 'WARNING'    : ts.WriteLine(LogTime()+"--[STATUS : WARNING] "+strReportDesc);
                              Log.Message("[STATUS : WARNING] "+strReportDesc)
                              break;
                              
          case 'TRUE'       : ts.WriteLine(LogTime()+"--[STATUS : PASS] "+strReportDesc);
                              Log.Event(("[STATUS : PASS] "+strReportDesc));
                              break;
                              
          case 'FALSE'      : ts.WriteLine(LogTime()+"--[STATUS : FAIL] "+strReportDesc);
                              Log.Event(("[STATUS : FAIL] "+strReportDesc));
                              break;
                              
          case 'TERMINATE'  : ts.WriteLine(LogTime()+"--[STATUS : EXECUTION TERMINATED] "+strReportDesc);
                              Log.Error("[STATUS : EXECUTION TERMINATED] "+strReportDesc +" due to  "+err.message);
                              break;
          case 'MESSAGE'    : ts.WriteLine(LogTime()+"--[STATUS : MESSAGE] "+strReportDesc);
                              Log.Message("[STATUS : MESSAGE] "+strReportDesc)
                              break;
          default           : ts.WriteLine(strReportDesc);
                              break;
          
      }
      ts.Close();
    }
    catch(e)
    {
        Log.Error("Unable to find Application Log File  "+NGlobal.ApplicationLogsFilePath+"   due to "+e.message);
    }
  
  }
 /*================================================================================================================
  Function Name  : LogTestScenarioStart
  Purpose        : This function is used to Create  Test Scenario log header in Application Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : TestScenarioName
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogTestScenarioStart(strScenarioID, strScenarioName, IterationCount)
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);
      ts.WriteLine("--------------------------------------------------------------------------------------------------------------------------------");
      ts.WriteLine("	Scenario Id     : "+strScenarioID);
      ts.WriteLine("	Scenario Name   : "+"\""+strScenarioName+"\"");
      ts.WriteLine("	Iteration Count : "+IterationCount);    
      ts.WriteLine("--------------------------------------------------------------------------------------------------------------------------------");
      ts.WriteLine("    Test Scenario Execution Started.......");
      ts.WriteLine("--------------------------------------------------------------------------------------------------------------------------------");
      Log.Message("Test Scenario \""+strScenarioName +"\" Execution Started.......");
      ts.Close();
    }
    catch(e)
    {
        Log.Error("Error ---  Application Log File"+Global.ApplicationLogsFilePath+"   due to "+e.message);
    }
  
  }
  /*================================================================================================================
  Function Name  : LogTestScenarioEnd
  Purpose        : This function is used to Create  Test Scenario log footer in Application Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : TestScenarioName
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogTestScenarioEnd(strScenarioName)
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);
      ts.WriteLine("--------------------------------------------------------------------------------------------------------------------------------");
      ts.WriteLine("    Test Scenario Execution Completed...........");
      ts.WriteLine("--------------------------------------------------------------------------------------------------------------------------------");
      ts.Close();
      Log.Message("Test Scenario \""+strScenarioName +"\"  Execution Completed");
    }
    catch(e)
    {
        Log.Error("Error ---  Application Log File"+Global.ApplicationLogsFilePath+"   due to "+e.message);
    }
  
  }
 /*================================================================================================================
  Function Name  : LogBusinessFunctionStart
  Purpose        : This function is used to Create  Business Function log header in Application Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : BusinessFunction Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogBusinessFunctionStart(strActioName , strComputerName)
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);
      ts.WriteLine("BUSINESS FUNCTION : "+strActioName+" EXECUTION STARTED.....ON "+strComputerName +" MACHINE");
      ts.WriteLine("");
      ts.Close();
    }
    catch(e)
    {
        Log.Error("Error ---  Application Log File"+Global.ApplicationLogsFilePath+"   due to "+e.message);
    }
  }
  /*================================================================================================================
  Function Name  : LogBusinessFunctionEnd
  Purpose        : This function is used to Create  Business Function log footer in Application Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : BusinessFunction Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogBusinessFunctionEnd(strActioName)
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);
      ts.WriteLine("");
      ts.WriteLine("BUSINESS FUNCTION : "+strActioName+" EXECUTION COMPLETED");
      ts.WriteLine("");
      ts.Close();
    }
    catch(e)
    {
        Log.Error("Error ---  Application Log File"+Global.ApplicationLogsFilePath+"   due to "+e.message);
    }
  }
/*================================================================================================================
  Function Name  : LogDotedine
  Purpose        : This function is u create a dotted line inApplication Log File
  Pre-Condition  : Application Log file should be already created
  Inputs         : BusinessFunction Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function LogDotedine()
  {
    var fso, f1, ts;
    var ForAppending = 8;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    try
    {
      ts = fso.OpenTextFile(NGlobal.ApplicationLogsFilePath, ForAppending,false);  
      ts.WriteLine("................................................................................................................................");
      ts.Close();
    }
    catch(e)
    {
        Log.Error("Error ---  Application Log File"+Global.ApplicationLogsFilePath+"   due to "+e.message);
    }
  }
/*================================================================================================================
  Function Name  : fnGetTestData
  Purpose        : This function is to gets Business Function Test Data from Test Data XML file
  Pre-Condition  : Test Data XML file
  Inputs         : TestScenario ID, Iteration No. , Business Function Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function fnGetTestData(strScenarioID , intIterationNo , strFunctionName)
  {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strInputData ="";
    var counter = 0;
      //load the file sync'ly 
      xmlDoc.async = false
      try
      {
          xmlDoc.load(Global.TestDataFolderPath);      
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("TestScenario");
          var TestDataScenarioCount = NodeList.length;
          for(var iData = 0 ; iData < TestDataScenarioCount ; iData++)
          {
            strScenarioID = aqString.Trim(strScenarioID)
            if(aqString.Compare(aqString.Trim(NodeList[iData].getAttribute("ScenarioID")),strScenarioID,false)==0)
            {
                var IterationNode = NodeList[iData].getElementsByTagName("TestIteration");
                for(var iIteration = 0 ; iIteration < IterationNode.length ; iIteration++)
                {
                  if(IterationNode[iIteration].getAttribute("Iteration")==intIterationNo)
                  {
                      var FunctionNode = IterationNode[iIteration].getElementsByTagName("Function");
                      for(var iFunction = 0 ; iFunction < FunctionNode.length ; iFunction++)
                      {
                          strFunctionName = aqString.Trim(strFunctionName);
                          if(aqString.Compare(aqString.Trim(FunctionNode[iFunction].getAttribute("name")),strFunctionName,false)==0)
                          {
                             var ParameterNode = FunctionNode[iFunction].childNodes
                             for(var iParameter=0;  iParameter<ParameterNode.length ; iParameter++)
                                {
                                    if(counter==0)
                                    {
                                      strInputData = ParameterNode[iParameter].text;
                                      counter = counter + 1;
                                    }
                                    else
                                    {
                                        strInputData = strInputData+"|"+ParameterNode[iParameter].text;
                                    }
                                } 
                          }
                      }
                  }
                  
                
                }
            } 
          }
  
  
  
      }
      catch(e)
      {
          LogStatus("Terminate", "  Unable to Read Test Data XML file in specified path"+Global.TestDataFolderPath);
      }
  
    return strInputData;
  }
function generateReqID()
{
  var reqid = Math.floor((Math.random() * 100000) + 1); 
  if(reqid >= 1 && reqid < 10)
  {
    reqid = reqid * 10000;
  }
  else if(reqid >= 10 && reqid < 100)
  {
    reqid = reqid * 10000;
  }
  else if(reqid >= 100 && reqid < 1000)
  {
    reqid = reqid * 1000;
  }
  else if(reqid >= 1000 && reqid < 10000)
  {
    reqid = reqid * 10;
  }
  else if(reqid ==0 || reqid ==10000 )
  {
    reqid = generateReqID();
  }
  return reqid ;
}
