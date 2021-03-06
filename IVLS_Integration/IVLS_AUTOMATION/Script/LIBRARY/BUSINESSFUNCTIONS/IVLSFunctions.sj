//USEUNIT Utility
 var ConfigurationFilePath = "\\\\VS7RFCLH1\\ivls_integration_automation\\IVLS_Integration\\TESTDESIGN\\TESTENVIRONMENT\\Configuration.xml";
 var NGlobal = NetworkSuite.Variables;
/*================================================================================================================
  Function Name  : RunTestForPendingPatient
  Purpose        : This function is used to Run Test for given Patient and Test Name from Pending Patient List
  Pre-Condition  : N/A
  Inputs         : Test Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 22nd July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function RunTestForPendingPatient()
{
  var oParent = Sys.Process("javaw");
  arrInputData = aqString.Trim(NGlobal.InputData);
  var strPatirntName = aqString.Trim(arrInputData.split("|")[0]);
  fnSetNetworkVariableValue("PatientName",strPatirntName);
  var strTestName = aqString.Trim(arrInputData.split("|")[1]);
  var patientFlag = false;
  var tabFlag = false;
  try
  {
    arryTabProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
    arryTabValues = new Array ("FawkesTabPane", 0,"tabPane");
    objTab = oParent.FindAllChildren(arryTabProp, arryTabValues, 25);
    oTab = (new VBArray(objTab)).toArray();
    // Click on Pending Tab
    if (oTab.length > 0)
      {
            objLabel =  oTab[0].FindAllChildren("JavaClassName", "Label", 25);
            oLabel = (new VBArray(objLabel)).toArray();
            if(oLabel.length > 0)
            {
              for (i = 0; i < oLabel.length; i++)
                {
                  var labelname = aqString.Trim(aqObject.GetPropertyValue(oLabel[i] , "JavaFXObjectText"));
                  if(!(aqString.Find(labelname,"Pending",0,false)==-1))
                    {
                        var TabClick = oLabel[i];
                        TabClick.Click();
                        tabFlag = true;
                        LogStatus(true, "Clicked on Pending Tab");
                        i = oLabel.length;
                    }
                }
            }
      }
      if(!(tabFlag))
      {
          LogStatus(false, "Unable to find Pending Tab with the provided properties, Please check the properities and try again........"); 
      }
      
      // Selecting Pending Patient from List View 
      arryListViewProp = new Array ("JavaClassName","JavaFXObjectName");
      arryListViewValues = new Array ("FawkesListView","pendingListView");
      objListView = oParent.FindAllChildren(arryListViewProp, arryListViewValues, 25);
      oListView = (new VBArray(objListView)).toArray();
      strKeyStroke = labelname.split("(")[1];
      steKeyStrokeSize = strKeyStroke.split(")")[0];
      oListView[0].Click();
      oListView[0].Keys("[Down]");
      if(steKeyStrokeSize > 4)
      {
        for(var n=1; n<=steKeyStrokeSize;n++)
        {
          oListView[0].Keys("[Up]");
        }
      }
      if (oListView.length > 0)
      {
        var Counter = 0;
        do
        {
            Counter = Counter+1;
            var objListCell =  oListView[0].FindAllChildren("JavaClassName","FawkesListCell",25);
            var oListCell = (new VBArray(objListCell)).toArray();
            var oFirstCell = oListCell[0].Find("JavaClassName","FawkesLabel",20);
            for (var i = 0; i < oListCell.length; i++)
            {
              arryPatientProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
              arryPatientValues = new Array ("FawkesLabel", 0,"patientName");
              arryTestProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
              arryTestValues = new Array ("FawkesLabel", 2,"profile");
              var objTestLabel = oListCell[i].FindAllChildren(arryTestProp, arryTestValues,30);
              var objPatientLabel = oListCell[i].FindAllChildren(arryPatientProp, arryPatientValues,30);            
              oPatientPendingList = (new VBArray(objPatientLabel)).toArray();
              oTestPendingList = (new VBArray(objTestLabel)).toArray();
              var PatientName = aqString.Trim(aqObject.GetPropertyValue(oPatientPendingList[0] , "JavaFXObjectText"));
              var TestName = aqString.Trim(aqObject.GetPropertyValue(oTestPendingList[0] , "JavaFXObjectText"));
              Log.Message("Act Patient ="+PatientName +" Exp Patient = "+strPatirntName );
              Log.Message("Act Test ="+TestName +" Exp Test = "+strTestName );
              if((aqString.Compare(PatientName,aqString.Trim(strPatirntName),false)==0) && (aqString.Compare(TestName,aqString.Trim(strTestName),false)==0))
              {
                    //oPatientPendingList[0].Click();
                    patientFlag = true;
                    LogStatus(true, "Sucessfully Selected Patient "+strPatirntName +" whose test name is "+strTestName +"  , from the Patient Pending List view");
                     // Click on Run Button
                    arryRunButtonProp = new Array ("JavaClassName", "JavaFXObjectName","JavaFXObjectText");
                    arryRunButtonValues = new Array ("FawkesButton","runButton","Run");
                    var oButton = oParent.Find(arryRunButtonProp,arryRunButtonValues,30);
                    var blnVisible = aqObject.GetPropertyValue(oButton, "VisibleOnScreen");    
                    if(oButton.Exists)
                    {
                       do
                       {
                         if(blnVisible==false)
                         {
                            oPatientPendingList[0].Click();
                            blnVisible = aqObject.GetPropertyValue(oButton, "VisibleOnScreen");
                         }
                       }while(blnVisible==false)
                       oButton.Click();
                        LogStatus(true, "Sucessfully Clicked on Run Button");
                    }
                    else
                    {
                        LogStatus(false, "Failed to Click on Run Button, Please check the Run Button Properties and try again...");
                    }
              }
              else
              {
                  if(!(patientFlag))
                  {
                    oListView[0].Keys("[Down]");
                  }
              }
            }
            if(patientFlag)
            {
              Counter = 5;
            }
        }while(Counter<5 && patientFlag == false);
        if(!(patientFlag))
        {
            LogStatus(false, "Unable to find Patient "+strPatirntName +" and  test name  "+strTestName +"  , in the from the Patient Pending List"); 
        }
      }
    }
    catch(err)
    {
          LogStatus("TERMINATE", "Unable to execute Run Test For Pending Patient operation due to "+err.message);
    }
}
 /*================================================================================================================
  Function Name  : GetRequisitionID
  Purpose        : This function will get RequisitionID from Select Instrument Window in IVLS Application
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 23st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
 function GetRequisitionID()
 {
    aqUtils.Delay(NGlobal.MinWaitTimeInMiliSecs);
    try
    {
      var oParent = Sys.Process("javaw");
      arryTextFieldProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
      arryTextFieldValues = new Array ("FawkesHBox", 1,"reqIdEditHBox");
    
      var oTextArea = Sys.Process("javaw").Find(arryTextFieldProp,arryTextFieldValues,25)
      if(oTextArea.Exists)
        {
          arryTextProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
          arryTextValues = new Array ("FawkesClearableTextField", 0,"requisitionIdTextField");
          var oText = oTextArea.Find(arryTextProp,arryTextValues,25)
          var Reqid = oText.gettext();
          Reqid = Reqid.toString();
          fnSetNetworkVariableValue("ReqID",aqString.Trim(Reqid));
          LogStatus(true, "Sucessfully Captured Capture Requisition ID "+Reqid +" from Select Instrument Screen");
        }
    }
    catch(err)
    {
          LogStatus("TERMINATE", "Unable to Capture Requisition ID operation due to "+err.message);
    }
 }
 /*================================================================================================================
  Function Name  : NavigateHomeScreen
  Purpose        : This function will navigate to IVLS Application Home Screen
  Inputs         :  
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 23st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function NavigateHomeScreen()
{
  var oParent = Sys.Process("javaw");
  try
  {
      arryHomeProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
      arryHomeValues = new Array ("FawkesButton", 0,"navigation-bar-gray-button");
      var oButton = oParent.Find(arryHomeProp,arryHomeValues,25);
      if(oButton.Exists)
       {
          oButton.Click();
          LogStatus(true, "Sucessfully Navigated to IVLS Home Screen");
       }
       else
       {
          LogStatus(false, "Unable to Click on HOME Button , failed to  Navigated to IVLS Home Screen");       
       }
  }    
  catch(err)
  {
      LogStatus("TERMINATE", "Unable to Navigate Home Scrren due to "+err.message);
  }
}
 /*================================================================================================================
  Function Name  : SelectInstrumentToRunTests
  Purpose        : This function will Select Instrument to Run Test
  Inputs         :  Instrument Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 23st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function SelectInstrumentToRunTests()
  {
    var oParent = Sys.Process("javaw");
    var strInstrument = aqString.Trim(NGlobal.InputData);
    var instrumnetFlag = false;
    try
    {
        var oInstrumentPane = oParent.Find("JavaClassName","InstrumentButtonSelectionPane",25)
        arryInstrumentProp = new Array ("JavaClassName","JavaFXObjectName");
        arryInstrumentValue = new Array ("FawkesText","instrumentNameText");
    
        var objInstrument = oInstrumentPane.FindAllChildren(arryInstrumentProp,arryInstrumentValue,25);
        oInstrument = (new VBArray(objInstrument)).toArray();
        for(var i = 0; i< oInstrument.length; i++)
        {
            var InstrumentName = aqString.Trim(oInstrument[i].getText());
            if(aqString.Compare(InstrumentName,aqString.Trim(strInstrument),false)==0)
            {
                oInstrument[i].Click();
                instrumnetFlag = true;
                i = oInstrument.length;
                LogStatus(true, "Sucessfully selected Instrument "+ strInstrument +"  from the Instrument Pane");
                 // Click on Run Button
                    arryRunButtonProp = new Array ("JavaClassName", "JavaFXObjectName","JavaFXObjectText");
                    arryRunButtonValues = new Array ("FawkesButton","runButton","Run");
                    var oButton = oParent.Find(arryRunButtonProp,arryRunButtonValues,30);
                    var blnVisible = aqObject.GetPropertyValue(oButton, "VisibleOnScreen");
                    if(oButton.Exists)
                    {
                      if(blnVisible==true)
                      {
                          oButton.Click();
                          LogStatus(true, "Sucessfully Clicked on RUN button");
                          aqUtils.Delay(NGlobal.MinWaitTimeInMiliSecs);
                          arryViewButtonProp = new Array ("JavaClassName", "JavaFXObjectText");
                          arryViewButtonValues = new Array ("FawkesButton","View Results");
                          var oViewButton = oParent.Find(arryViewButtonProp,arryViewButtonValues,30);
                          if(oViewButton.Exists)
                          {
                              oViewButton.Click();
                              LogStatus(true, "Sucessfully Clicked on View Reults Button");
                          }
                          else
                          {
                              LogStatus(false, "Unable to click on View Reults Button ");
                          }
                      }
                      else
                      {
                          LogStatus(false, "Unable to click on Run Button , as button is disable on Screen");
                      }
                    }
                    else
                    {
                        LogStatus(false, "Unable to Find Run Button on Screen");
                    }
            }     
        }
        if(!(instrumnetFlag))
        {
          LogStatus(false, "Unable to find instrument "+strInstrument +"  in the Instrument Pane, PLease Select the right instrument...");
        }    
    }
    catch(err)
    {
        LogStatus("TERMINATE", "Unable to Select Instrument and Run Tests due to "+err.message);
    
    }
  }
 /*================================================================================================================
  Function Name  : SelectPatientToViewResults
  Purpose        : This function will Select Patient to Enter Results
  Inputs         : Patient Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 23st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function SelectPatientToViewResults()
  {
    var oParent = Sys.Process("javaw");
    var arrInputData = aqString.Trim(NGlobal.InputData);
    var strPatientName = aqString.Trim(arrInputData.split("|")[0]);
    var strInstrumentName = aqString.Trim(arrInputData.split("|")[1]);
    var PatientFlag = false;
    try
    {
        arryInstrumentPaneProp = new Array ("JavaClassName","JavaFXObjectName");
        arryInstrumentPaneValue = new Array ("RunningLabRequestsPane","runningLabRequestsPane");
        var oInstrumentPane = oParent.Find(arryInstrumentPaneProp,arryInstrumentPaneValue,25)
        arryPAtientProp = new Array ("JavaClassName","JavaFXObjectName");
        arryPatientValue = new Array ("FawkesLabel","nameLabel");
    
        var objPatient = oInstrumentPane.FindAllChildren(arryPAtientProp,arryPatientValue,25);
        oPatient = (new VBArray(objPatient)).toArray();
        for(var i = 0; i< oPatient.length; i++)
        {
            var PatientName = aqString.Trim(oPatient[i].getText());
            if(aqString.Compare(PatientName,aqString.Trim(strPatientName),false)==0)
            {
                arryInstrumentProp = new Array ("JavaClassName","JavaFXObjectName");
                arryInstrumentValue = new Array ("FawkesText","instrumentNameText");
                var objInstrument = oInstrumentPane.FindAllChildren(arryInstrumentProp,arryInstrumentValue,25)
                var oInstrument = (new VBArray(objInstrument)).toArray();
                for(var k = 0; k< oInstrument.length; k++)
                {
                  var InstrumentName = aqString.Trim(oInstrument[k].getText());
                  if(aqString.Compare(InstrumentName,aqString.Trim(strInstrumentName),false)==0)
                  {
                      oInstrument[k].Click();
                      i = oInstrument.length;
                      PatientFlag = true;
                      LogStatus(true, "Sucessfully selected Patient "+ strPatientName +"  from the Recent Running Lab Request Pane");
                      //Log.Message("Sucessfully selected Patient "+ strPatientName +" for the test ran on Instrument  "+strInstrumentName +" from the Recent Running Lab Request Pane");
                      i = oPatient.length;
                  }
                }
                
            }
        }
        if(!(PatientFlag))
        {
          LogStatus(false, "Unable to find Patient "+strPatientName +"  in the Recent Running Lab Request Pane to enter results, PLease Check  the Patient Name...");
        }
        else
        {
            arryButtonProp = new Array ("JavaClassName", "JavaFXObjectText");
            arryButtonValues = new Array ("FawkesButton","View Results");
            var oButton = oParent.Find(arryButtonProp,arryButtonValues,30);
            if(oButton.Exists)
            {
                oButton.Click();
                arryBackButtonProp = new Array ("JavaClassName", "JavaFXObjectName","JavaFXObjectText");
                arryBackButtonValues = new Array ("FawkesButton","backButton","Back");
                var oBackButton = oParent.Find(arryBackButtonProp,arryBackButtonValues,30);
                LogStatus(true, "Sucessfully Clicked on View Results Button");
                aqUtils.Delay(1000);
                //Log.Message("Sucessfully Clicked on Enter Results Button");
                if(oBackButton.Exists)
                {
                  oBackButton.Click();
                  LogStatus(true, "Clicked on Back Button to navigate to Home Screen");
                  //Log.Message("Clicked on Back Button to navigate to Home Screen");
                }
                
            }
            else
            {
              LogStatus("TERMINATE", "Failed to Click on View  Results Button, Cannot Proceed further execution. Terminating the execution........");
              //Log.Message("Failed to Click on View Results Button, Cannot Proceed further execution. Terminating the execution........");
            }
                    
        }
    }
    catch(err)
    {
        LogStatus("TERMINATE", "Unable to Select Patirnt to enter Test Results due to "+err.message);
    }
  }
/*================================================================================================================
  Function Name  : VerifyLabResultsInIVLS
  Purpose        : This function verifies IVLS Test Results with  Simulator Sent Test results
  Pre-Condition  : Test Data XML file
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
  function VerifyLabResultsInIVLS()
  {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strInstrumentTestResultFile =NGlobal.SimulatorTestResultFileName;
    var strSimulatorResultFilePath = NGlobal.SimulatorXMLDataFilePath+strInstrumentTestResultFile;
      //load the file sync'ly 
      xmlDoc.async = false
      try
      {
          xmlDoc.load(strSimulatorResultFilePath);      
          // Get Node List
          var NodeList = xmlDoc.getElementsByTagName("Result");
          var LabResultTestCount = NodeList.length;
          for(iResult =0; iResult <LabResultTestCount ;iResult++)
          {
              var TestName = NodeList[iResult].getElementsByTagName("name");
              var TestResult = NodeList[iResult].getElementsByTagName("value");
              var status = verifyTestResult(TestName[0].text , TestResult[0].text)
              if(status)
              {
                Log.Message(TestName[0].text +" : "+TestResult[0].text +" : "+status);
                LogStatus(true, " Successfully Verified IVLS Test Results , Test Name : "+TestName[0].text +" and Test Result : "+TestResult[0].text +"  with Simulator sent test results");
              }
              else
              {
                LogStatus(false, " Varification Failed for Test Name "+TestName[0].text);
              }
          }
      }
      catch(e)
      {
          //LogStatus("Terminate", "  Unable to Read Test Data XML file in specified path"+Global.TestDataFolderPath);
          Log.Message(" Test Result "+e.message);
      }
  } 
/*================================================================================================================
  Function Name  : verifyTestResult
  Purpose        : This function verifies IVLS Test Results with  given Test Name and result
  Pre-Condition  : Test Data XML file
  Inputs         : strTestName ,strTestResult
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/ 
function verifyTestResult(strTestName,strTestResult)
{
  strTestName = aqString.Trim(strTestName);
  strTestResult = aqString.Trim(strTestResult);
  var statusFlag = false;
  try
  {
    var oParent = Sys.Process("javaw");
    var oGrid = oParent.Find("JavaClassName","FawkesGridPane",25)
    if(oGrid.Exists)
    {
        var objLabel = oGrid.FindAllChildren("JavaClassName","FawkesLabel",25);
        var oLabel = (new VBArray(objLabel)).toArray();
        for(var i = oLabel.length-7; i>=0 ;i=i-3)
        {
          var TestName = aqString.Trim(aqObject.GetPropertyValue(oLabel[i], "JavaFXObjectText"));
          var TestResult = aqString.Trim(aqObject.GetPropertyValue(oLabel[i-1], "JavaFXObjectText"));
          //Log.Message("TestName  "+TestName +"    Result :"+TestResult);
          if(!(aqString.Find(TestName,strTestName,0,false)==-1) && !(aqString.Find(TestResult,strTestResult,0,false)==-1))
          {
              statusFlag = true;
              i = -1;
          }
        }
    }
    return statusFlag;
  }
  catch(err)
  { 
    LogStatus("TERMINATE", "Unable to Verify Lab Test Results "+err.message);
  }
}
/*================================================================================================================
  Function Name  : ReStartIVLSApplication
  Purpose        : This function is used to ReStart IVLS Application
  Pre-Condition  : N/A
  Inputs         : NA
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 22nd July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
  function ReStartIVLSApplication()
  {
    var oParent = Sys.Process("javaw");
    try
    {
        arryReStartProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
        arryRestartValues = new Array ("FawkesButton", 3,"navigation-bar-red-button");
        var oButton = oParent.Find(arryReStartProp,arryRestartValues,25);
        if(oButton.Exists)
         {
            oButton.Click();
            LogStatus(true, "Sucessfully Clicked on IVLS ReStart button");
            arryReStartConfirnProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectText");
            arryReStartConfirnValues = new Array ("FawkesButton", 1,"Restart");
            var oReStartButton = oParent.Find(arryReStartConfirnProp,arryReStartConfirnValues,25);
            if(oReStartButton.Exists)
            {
                LogStatus(true, "Sucessfully Clicked on ReStart Confirmation button");
                aqUtils.Delay(2000);
                oReStartButton.Click();
            }
            else
            {
                LogStatus(true, "Unable to Click on ReStart Confirmation button, Failed to find Object");
            }
         }
         else
         {
            LogStatus(false, "Unable to Click on IVLS ReStart button , failed to  find IVLS ReStart button on Home Screen");       
         }
    }    
    catch(err)
    {
        LogStatus("TERMINATE", "Unable to Click on Restart button on IVLS  Home Scrren due to "+err.message);
    }
  }
/*================================================================================================================
  Function Name  : WaitUntilReadyIVLS
  Purpose        : This function is used wait until IVLS Application is loadedto ReStart IVLS Application  Pre-Condition  : N/A
  Inputs         : NA
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 22nd July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/  
 function WaitUntilReadyIVLS()
{
     var oParent = Sys.Process("javaw");
     var Counter = 1;
     var ReadyFlag = false;
     var arryReadyProp = new Array ("JavaClassName", "JavaFXObjectIndex","JavaFXObjectName");
     var arryReadyValues = new Array ("FawkesBorderPane",0,"mainFrame");
     try
    {
        
        do
        {
          var oWindow = oParent.Find(arryReadyProp,arryReadyValues,50);
          if(oWindow.Exists)
          {
            ReadyFlag = true;
            Counter = 20;
            LogStatus(true, "IVLS Application is sucessfully loaded......");
          }
          else
          {
              aqUtils.Delay(5000);
              Counter = Counter+1;
          }
          
        }while(Counter < 20 || ReadyFlag==false)
    }    
    catch(err)
    {
        LogStatus("TERMINATE", "Unable to Wait until IVLS Application is Read"+e.message);
    }

} 
  
  
  
  
  
  
  
