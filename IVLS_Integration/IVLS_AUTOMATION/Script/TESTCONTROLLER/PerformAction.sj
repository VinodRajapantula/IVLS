//function PerformTaskAction()
//{
//  // Declare Variables
//  var oJob,oTask,TaskName,JobName,HostName;
//  TaskName = "TASK_SIMULATOR";
//  TaskName = aqString.ToUpper(aqString.Trim(TaskName));
//  JobName = "SIMULATOR"
//  JobName = aqString.ToUpper(aqString.Trim(JobName));
//  HostName = "SIMULATOR"
//  HostName = aqString.ToUpper(aqString.Trim(HostName));
//  // Setting Job
//  for(var iJob = 0; iJob < NetworkSuite.Jobs.Count ; iJob++)
//  {
//    var strJob = NetworkSuite.Jobs.Items(iJob).Name;
//    if(aqString.Compare(JobName,strJob, false)==0)
//      {
//        oJob = NetworkSuite.Jobs.Items(iJob);
//        iJob = NetworkSuite.Jobs.Count;
//      }
//  }
//
//  //Setting Task
//  for(var iTask = 0; iTask < oJob.Tasks.Count ; iTask++)
//  {
//    var strTask = oJob.Tasks.Items(iTask).Name;
//    if(aqString.Compare(TaskName,strTask, false)==0)
//      {
//        oTask = oJob.Tasks.Items(iTask);
//        iTask =  oJob.Tasks.Count;
//      }
//  }
//  //Specifies that TestComplete on the remote host will be closed after the task is executed
//  oTask.ActionAfterRun = saClose;
//  // Specifies the host on which the task will be run
//  oTask.Host = NetworkSuite.Hosts.ItemByName(HostName);
//  // Specify THe Project Path
//  oTask.ProjectPath = "\IVLS_AUTOMATION\\IVLS_AUTOMATION.mds";
//  // Set the Test Script or Business Function Path
//  oTask.Test = "IVLS_AUTOMATION\\Script\\SimulatorFunctions\\OpenSimulatorApp";
//  // Run the Test task
//  oTask.Run(true);
//  oTask.Test = "IVLS_AUTOMATION\\Script\\SimulatorFunctions\\CreateInstrument";
//  oTask.Run(true);
//  
//
//}