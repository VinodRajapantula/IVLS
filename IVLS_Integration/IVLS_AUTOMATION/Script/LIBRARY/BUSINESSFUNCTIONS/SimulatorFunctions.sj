//USEUNIT Utility
var ConfigurationFilePath = "\\\\VS7RFCLH1\\ivls_integration_automation\\IVLS_Integration\\TESTDESIGN\\TESTENVIRONMENT\\Configuration.xml";
var NGlobal = NetworkSuite.Variables;
/*================================================================================================================
  Function Name  : CloseSimulatorApp
  Purpose        : This function is used to Close Simulator Application
  Pre-Condition  : N/A
  Inputs         : N/A
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 7th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function  CloseSimulatorApp()
{
    try
    {
      var WshShell = new ActiveXObject("WScript.Shell");
      var oExec = WshShell.Exec("taskkill /F /IM javaw.exe");
    }
    catch(err)
    {     
        Log.Message("Unable to Close  VetLab Simulator due to  "+err.message);
    }
}
/*================================================================================================================
  Function Name  : OpenSimulatorApp
  Purpose        : This function is used to Launch/Open Simulator Application
  Pre-Condition  : N/A
  Inputs         : Reads Simulator App Path and App Name from Configuration.XML file
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 7th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function OpenSimulatorApp()
{   
    var strAppName = NGlobal.SimulatorAppName;
    var strAppPath = NGlobal.SimulatorAppPath;
    
    try
    {
        // Open Command prompt to launch Similator
        LogStatus("MESSAGE", " Open Command Prompt Window to launch Simulator");
        var shell=new ActiveXObject("WScript.Shell");
        var strCmd = "cmd /K CD "+strAppPath+" & "+strAppName;
        shell.Run(strCmd);
        aqUtils.Delay(NGlobal.DefaultWaitTimeInMiliSecs);
        LogStatus("MESSAGE", "Sucessfully launched CMD prompt to Run Simulator Application ");
        // Close command prompt window once command is executed
        shell.Exec("taskkill /F /IM cmd.exe");
        LogStatus("MESSAGE", "Closing The Command Prompt Window");
        LogStatus("MESSAGE", "Waiting for application to launch..........");
        aqUtils.Delay(NGlobal.MinWaitTimeInMiliSecs);
        var oParent = Sys.Process("javaw");
        var oWindow = oParent.Find("AWTComponentAccessibleName","VetLab Simulator: 1.00.0154a",2);
        if(oWindow.Exists == true)
        {
          LogStatus(true, "VetLab Simulator Launched Sucessfully")
        }
        else
        {
          LogStatus(false, "Unable to launch  VetLab Simulator: 1.00.0154a")
        }
  }
  catch(err)
  {     
      LogStatus("Terminate","Unable to Launch VetLab Simulator due to  "+err.message +" Please check Simulator Application Path ....");
  }
}
/*================================================================================================================
  Function Name  : CreateInstrument
  Purpose        : This function is used to Create / Select Instrument from Simulator Application
  Pre-Condition  : N/A
  Inputs         : Instrument Name
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 8th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function CreateInstrument()
{
 
  var strInstrument = NGlobal.InputData;
  
  var strSubMenu = aqString.Trim(strInstrument);
  var boolStatus = false;
  var Counter = 1;
  var oParent = Sys.Process("javaw");
  try
  {
    var oMenu = oParent.Find("AWTComponentAccessibleName","Create",10);
    oMenu.Click();
    var oSubMenu = oParent.Find("AWTComponentAccessibleName",strSubMenu,10);
    oSubMenu.Click();
    aqUtils.Delay(2000);
    PropArray = new Array ("JavaClassName", "JavaFullClassName");
    ValuesArray = new Array ("JLabel", "javax.swing.JLabel");
    do
    {
        objLabel = oParent.FindAllChildren(PropArray, ValuesArray, 25);
        oLabel = (new VBArray(objLabel)).toArray();
        if (oLabel.length > 0)
        {
          for (i = 0; i < oLabel.length; i++)
          {
            if(oLabel[i].Exists)
            {
              var strStatus = aqString.Trim(aqObject.GetPropertyValue(oLabel[i] , "AWTComponentAccessibleName"));
              if(aqString.ToLower(strStatus) != "ready")
              {
                boolStatus = true;
                i = oLabel.length;
              }
            }
          } 
        }
        Counter = Counter +1;
    }while (boolStatus == false && Counter < 10);    
    if(boolStatus == true)
    {

        LogStatus(true, "Selected Instrument "+strSubMenu +" , is in ready State");
    }
    else
    {
      LogStatus(false,"Selected Instrument "+strSubMenu +" , is not in ready State");
    }
  }
  catch(err)
  {     
      LogStatus("Terminate","Unable to Create/Select Instrument from Simulator due to  "+err.message);
  }
}
/*================================================================================================================
  Function Name  : verifyResultSentCount
  Purpose        : This function is used to verify result sent status in Simulator Application
  Pre-Condition  : N/A
  Inputs         : N/A
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 8th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function verifyResultSentCount()
{
    var strResultCount = NGlobal.InputData;
    var oParent = Sys.Process("javaw");
    try
    {
      PropArray = new Array ("AWTComponentAccessibleName", "JavaClassName","AWTComponentIndex");
      ValuesArray = new Array ("Selected Instrument Information", "IRAPInstrumentStatusPanel",0);
      objFrame = oParent.FindAllChildren(PropArray, ValuesArray, 25);
      oFrame = (new VBArray(objFrame)).toArray();
      boolFlag = false;
      if (oFrame[0].Exists)
      {
            LabelPropArray = new Array ("JavaClassName", "AWTComponentIndex");
            LabelValuesArray = new Array ("JLabel",15);
            objLabel = oFrame[0].FindAllChildren(LabelPropArray, LabelValuesArray, 25);
            oLabel = (new VBArray(objLabel)).toArray();
            if (oLabel.length > 0)
            {
                for (i = 0; i < oLabel.length; i++)
                {
                    if(oLabel[i].Exists)
                    {
                      var strStatus = aqString.Trim(aqObject.GetPropertyValue(oLabel[i] , "AWTComponentAccessibleName"));
                      LogStatus("MESSAGE", " Total No. Of Results Sent by Simulator to IVLS Lab Station is  "+strStatus)

                      if(strResultCount ==  strStatus)
                      {
                        LogStatus(true, "Sucessfully Verified Result Sent Count is displaying as expected Count  "+strStatus)
                        i = oLabel.length;
                        boolFlag = true;
                      }

                    }
                }
            }
      }
      else
      {
        LogStatus(false, " Selected Instruments Frame Not Found")
      }
      if(boolFlag==false)
      {
        LogStatus(false, " Verification Result Sent Failed, Expected Result Sent Count is "+strResultCount +" Actual Result Sent Count is displaying as  "+strStatus)
      }
    }
    catch(err)
    {     
        LogStatus(false,"Unable to verify Result Sent count on Simulator due to "+err.message);
    }
}
/*================================================================================================================
  Function Name  : verifyResultRequestsCount
  Purpose        : This function is used to verify result request received to Simulator Application
  Pre-Condition  : N/A
  Inputs         : N/A
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 8th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function verifyResultRequestsCount()
{
    var strResultCount = NGlobal.InputData;
    var oParent = Sys.Process("javaw");
    try
    {
        PropArray = new Array ("AWTComponentAccessibleName", "JavaClassName","AWTComponentIndex");
        ValuesArray = new Array ("Selected Instrument Information", "IRAPInstrumentStatusPanel",0);
        objFrame = oParent.FindAllChildren(PropArray, ValuesArray, 25);
        oFrame = (new VBArray(objFrame)).toArray();
        boolFlag = false;
        if (oFrame[0].Exists)
        {
              LabelPropArray = new Array ("JavaClassName", "AWTComponentIndex");
              LabelValuesArray = new Array ("JLabel",17);
              objLabel = oFrame[0].FindAllChildren(LabelPropArray, LabelValuesArray, 25);
              oLabel = (new VBArray(objLabel)).toArray();
              if (oLabel.length > 0)
              {
                  for (i = 0; i < oLabel.length; i++)
                  {
                      if(oLabel[i].Exists)
                      {
                        var strStatus = aqString.Trim(aqObject.GetPropertyValue(oLabel[i] , "AWTComponentAccessibleName"));
                        LogStatus("MESSAGE", " Total No. Of Results Request received to Simulator from IVLS Lab Station is   "+strStatus)

                        if(strResultCount ==  strStatus)
                        {
                          LogStatus(true, "Sucessfully Verified Result Request Count is displaying as expected Count  "+strStatus)
                          i = oLabel.length;
                          boolFlag = true;
                        }

                      }
                  }
              }
        }
        else
        {
          LogStatus("MESSAGE"," Selected Instrument is  Not Found")
        }
        if(boolFlag==false)
        {
          LogStatus(false, " Verification Result Request Failed, Expected Result Request Count is "+strResultCount +" Actual Result Request Count is displaying as  "+strStatus)
        }
    }
    catch(err)
    {     
        LogStatus("TERMINATE", "Unable to verify result request count on Simulator due to "+err.message);
    }
}

function fnSetNetworkVariableValue(NewtorkVariableName,NetworkVariableValue)
{
  if(NGlobal.VariableExists(NewtorkVariableName))
  {
    NGlobal.VariableByName(NewtorkVariableName)=NetworkVariableValue;
  }
}