//USEUNIT Utility
//USEUNIT SimulatorFunctions
//USEUNIT CornerStoneFunctions
//USEUNIT IVLSFunctions
/*================================================================================================================
  Function Name  : TestController
  Purpose        : Test Ccntroller will drive  Test Suite execution  across different remote machines to execute end-toend flows
  Pre-Condition  : N/A
  Inputs         : NA
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 24nd July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function TestController()
{
  //Declare Variables
  var strMachineName,strHostName,strUserName,strUserPwd,strBasePath,strTestName,strJobName,strRemoteConnection,strDataIteration,intIterateOn;
  // Read Confiruration XML file to setup Project Configuration Settings.
  fnSetConfigurationDetails();
  fnSetNetworkConfigurationDetails();
  // Create Application Log File
  fnCreateApplicationLogFile();
  // Reading Host details 
  fnReadHostDeatils();
//  Configure Host/Remote Machine details
  for(var iHost =0; iHost < Global.HostTable.RowCount ; iHost++)
  {
      strMachineName = Global.HostTable.Item("MachineName",iHost);
      strHostName = Global.HostTable.Item("HostName",iHost);
      strUserName = Global.HostTable.Item("UserName",iHost);
      strUserPwd =  Global.HostTable.Item("UserPWD",iHost);
      strBasePath =  Global.HostTable.Item("BasePath",iHost);
      strTaskName = Global.HostTable.Item("TaskName",iHost);
      strJobName =  Global.HostTable.Item("JobName",iHost);
      strRemoteConnection = Global.HostTable.Item("RemoteConnectionFlag",iHost);
       // if RemoteConnection flag is true then create HOSt else check remote machine is in network.
      if(aqString.Compare(aqString.Trim(aqString.ToUpper(strRemoteConnection)) , "YES",false)==0)
      {
           //Creating Host Connection
          fnCreateHostConnection(strHostName,strMachineName,strUserName,strUserPwd,strBasePath);
           //Creating Job(s) and Task(s) for Connected Host machine
          fnCreateJobsAndTask(strJobName,strTaskName,strHostName, strMachineName)
      }
      else
      {
          var ChkConnectionGlag = ckeckNetwotkConnection(strMachineName)
          if((ChkConnectionGlag))
          {
              LogStatus(true,"Network Connection Status : Success , Machine Name "+strMachineName +"  is connected to the newwork");
          }
          else
          {
              LogStatus("Message" ," Execution is terminating..");
              LogStatus("Terminate","Network Connection Status : Failed, Machine Name "+strMachineName +"  is not connected to network  , Please check the Network Connection Cable and try again.........");
          }
      } 
  }   
  LogDotedine();
  // Reading Test Suite File 
  fnReadTestSuiteFile();
  // Reading Test Scenario Variables
  fnReadTestSCenarioFile();
  // Creating Test Suite global Variables
  fnCreateTestSuiteVariables();
  // Creating Test Scenario global Variables
  fnCreateTestScenarioVariables();
  // Creating Host global Variables
  fnCreateHostVariables();
  // Iterate through each Test Scenario from TestSuite Table Variable
  LogStatus("", " TEST SCENARIO EXECUTION.");
  for (iTestSuite = 0; iTestSuite < Global.TestScenarioCount; iTestSuite++)
          {
                  Global.ScenarioID  = Global.TestSuiteTable.Item("ScenarioID",iTestSuite);
                  Global.ScenarioName  = Global.TestSuiteTable.Item("ScenarioName",iTestSuite);
                  Global.DataIteration  = Global.TestSuiteTable.Item("DataIteration",iTestSuite);
                  Global.IterationCount  = Global.TestSuiteTable.Item("IterationCount",iTestSuite);
                  Global.ScenarioExecutionFlag  = Global.TestSuiteTable.Item("ScenarioExecutionFlag",iTestSuite);
                  Global.TestDataName  = Global.TestSuiteTable.Item("TestDataName",iTestSuite);
                  
                  Global.TestDataFolderPath=Global.TestDataFolderPath+Global.TestDataName+".xml";
                  // Write Test Scenario Start  to log file
                  Global.ScenarioExecutionFlag = aqString.Trim(aqString.ToUpper(Global.ScenarioExecutionFlag));
                  if(aqString.Compare(Global.ScenarioExecutionFlag,"YES",false)==0)
                  {
                      LogTestScenarioStart(Global.ScenarioID,Global.ScenarioName,Global.IterationCount);
                      for(var iteration = 1; iteration <= Global.IterationCount; iteration++)
                      {
                          for(var iScenario =0; iScenario < Global.TestScenarioTable.RowCount ; iScenario++)
                          {
                              Global.TestScenarioID = Global.TestScenarioTable.Item("TestScenarioID",iScenario);
                              Global.TestStepID = Global.TestScenarioTable.Item("TestStepID",iScenario);
                              Global.TestStepDescription = Global.TestScenarioTable.Item("TestStepDescription",iScenario);
                              Global.PerformAction = Global.TestScenarioTable.Item("PerformAction",iScenario);
                              Global.InputData = Global.TestScenarioTable.Item("InputData",iScenario);
                              NGlobal.InputData =Global.InputData;
                              Global.StepExecuteFlag = Global.TestScenarioTable.Item("StepExecuteFlag",iScenario);
                              Global.Application = Global.TestScenarioTable.Item("Application",iScenario);
                              if(aqString.Compare(Global.TestScenarioID,Global.ScenarioID,false)==0)
                              {
                                  
                                  if(aqString.Compare(Global.StepExecuteFlag,"YES",false)==0)
                                  {
                                    LogStatus("", "  Execution Started For Iteration "+iteration);
                                    LogStatus("", "  Executing... Test Scenario : "+Global.TestScenarioID + " Step Id :"+Global.TestStepID  +"  Step Descrtiption : "+Global.TestStepDescription);
                                    LogBusinessFunctionStart(Global.PerformAction , Global.Application)
                                    if(aqString.Compare(aqString.Trim(aqString.ToUpper(Global.TestDataName)),"WITHSAMEDATA",false)==0)
                                    {
                                        if(aqString.Find(Global.InputData,";",0,false)>=0)
                                        {
                                            strDataIteration = Global.DataIteration;
                                            strDataIteration = strDataIteration.split(";");
                                            intIterateOn = strDataIteration[1];
                                        }
                                        else
                                        {
                                            var intIterateOn = iteration;
                                        }
                                    }
                                    if((aqString.Find(Global.InputData,"[",0,false)==0)&& (aqString.Find(Global.InputData,"]",1,false)>0))
                                    {
                                        Global.InputData = fnGetTestData(Global.TestScenarioID , iteration , Global.PerformAction)
                                        fnSetNetworkVariableValue("InputData",Global.InputData);
                                    }
                                    var strCurrentMachineName = "";
                                    var strCurrentExecution = "";
                                    if((aqString.Compare(aqString.Trim(Global.Application),"SIMULATOR",false)==0) || (aqString.Compare(aqString.Trim(Global.Application),"IVLS",false)==0))
                                    {
                                        strCurrentExecution = "REMOTE";
                                        strCurrentMachineName = fnGetHostMachineNamebyHostName(Global.Application);
                                        Global.MachineName = strCurrentMachineName;
                                        Global.HostName = fnGetHostDetailsbyMachineName(strCurrentMachineName,"HOSTNAME");
                                        Global.TaskName = fnGetHostDetailsbyMachineName(strCurrentMachineName,"TASKNAME");
                                        Global.JobName = fnGetHostDetailsbyMachineName(strCurrentMachineName,"JOBNAME");
                                    }
                                    else
                                    {
                                        strCurrentExecution = "LOCAL";
                                    }
                                    PerformAction(Global.PerformAction , strCurrentExecution);
                                    LogBusinessFunctionEnd(Global.PerformAction)
                                    LogDotedine();
                                  }
                              }
                          } 
                      }
                      // Write Test Scenario End to log file
                      LogTestScenarioEnd(Global.ScenarioName);
                  }
          }
  // Release all the Global Variables
  fnDeleteGlobalVariable("TestScenarioCount");
  fnRemoveTestScenarioVariables();
  fnRemoveHostVariables();
  fnRemoveTestSuiteVariables();
  fnRemoveGlobalData();
}
function PerformAction(strAction , strExecuteOn)
{
    LogStatus("", "");
    strExecuteOn = aqString.Trim(aqString.ToUpper(strExecuteOn));
    switch (strExecuteOn)
    {
      case 'REMOTE'     :     RunTaskOnRemote();
                              break;
      case 'LOCAL'      :     RunTaskOnLocal();
                              break;
    }
}
function RunTaskOnRemote()
{
    // Declare Variables
    var oJob,oTask,TaskName,JobName,HostName;
    TaskName = aqString.ToUpper(aqString.Trim(Global.TaskName));
    JobName = aqString.ToUpper(aqString.Trim(Global.JobName));
    HostName = aqString.ToUpper(aqString.Trim(Global.HostName));
    // Setting Job
    for(var iJob = 0; iJob < NetworkSuite.Jobs.Count ; iJob++)
    {
        var strJob = NetworkSuite.Jobs.Items(iJob).Name;
        if(aqString.Compare(JobName,strJob, false)==0)
        {
          oJob = NetworkSuite.Jobs.Items(iJob);
          iJob = NetworkSuite.Jobs.Count;
        }
    }
  //Setting Task
    for(var iTask = 0; iTask < oJob.Tasks.Count ; iTask++)
    {
      var strTask = oJob.Tasks.Items(iTask).Name;
      if(aqString.Compare(TaskName,strTask, false)==0)
        {
          oTask = oJob.Tasks.Items(iTask);
          iTask =  oJob.Tasks.Count;
        }
    }
    //Specifies that TestComplete on the remote host will be closed after the task is executed
    oTask.ActionAfterRun = saClose;
    // Specifies the host on which the task will be run
    oTask.Host = NetworkSuite.Hosts.ItemByName(HostName);
    // Specify THe Project Path
    oTask.ProjectPath = Global.ProjectPath;
    // Set the Test Script or Business Function Path
    strApplication =aqString.Trim(aqString.ToUpper(Global.Application));
    switch (strApplication)
    {
      case 'SIMULATOR'  :     strTestPath =NGlobal.SimulatorTestScriptPath;
                              strTestPath = strTestPath+Global.PerformAction;
                              break;
      case 'IVLS'       :     strTestPath =NGlobal.IVLSTestScriptPath;
                              strTestPath = strTestPath+Global.PerformAction;
                              break;
    }
    oTask.Test = strTestPath;
    // Run the Test task
    oTask.Run(true);
}
function RunTaskOnLocal()
{
  strRunTest = "CornerStoneFunctions."+Global.PerformAction;
  Runner.CallMethod(strRunTest);
}