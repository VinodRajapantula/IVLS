//USEUNIT Utility
 var ConfigurationFilePath = "\\\\VS7RFCLH1\\ivls_integration_automation\\IVLS_Integration\\TESTDESIGN\\TESTENVIRONMENT\\Configuration.xml";
 var NGlobal = NetworkSuite.Variables;
 /*================================================================================================================
  Function Name  : verifyLabResultStatusCS
  Purpose        : This function is verify lab result status in Corner Stone database table Lab_Results_log
  Inputs         : TestDataXML 
  Output         : ClientId , PatientId and ReqID
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 21st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function verifyLabResultStatusCS()
{
    var oConnect = new ActiveXObject("ADODB.Connection");
    var strConnectionString = "DSN=Cornerstone";
    var oRecordSet;
    var strPatientID= "'"+NGlobal.PatientID+"'";
    var strReqID = "'"+NGlobal.ReqID+"'";
    var resultFlag = false;
    var resultstatus="";
    var SQL = "select * from lab_results_log where patientid="+strPatientID+" AND req_id="+strReqID;
    try
    {
      oConnect.Open(strConnectionString);
      if(oConnect.state==1)
        {
            LogStatus("MESSAGE", "  Sucessfully Connected to Corner Stone Database");
            oRecordSet = oConnect.Execute(SQL);
            while(!(oRecordSet.EOF))
            {
             for(var i = 0; i< oRecordSet.Fields.count; i++) 
             { 
                  
                  if((aqString.Compare(aqString.Trim(aqString.ToLower(oRecordSet.Fields(i).Name)),"result_status",false)==0))
                  {
                      resultstatus = oRecordSet.Fields(i).Value;
                      if(aqString.Compare(aqString.Trim(aqString.ToLower(oRecordSet.Fields(i).Value)),"CO",false)==0)
                      {
                          resultFlag = true;
                          resultstatus = "COMPLETED"
                          i = oRecordSet.Fields.count;
                      }
                  }
            }
            oRecordSet.MoveNext(); 
            }
            oRecordSet.Close();
            oConnect.Close();
        }
        else
        {
             LogStatus("MESSAGE", "   Unable to  Connected to Corner Stone Database");
        }
        if(resultFlag)
        {
            LogStatus(true, " Verification Passed,Lab Test Result Status in Corner Stone Database for Test Ran in IVLS is completed and displaying status as "+resultstatus);
            LogStatus("MESSAGE"," PADITENT ID :"+NGlobal.PatientID +" PATIENT NAME "+NGlobal.PatientName +"  LAB RESULT STATUS : "+resultstatus);
            
        }
        else
        {
          LogStatus("MESSAGE"," PADITENT ID :"+NGlobal.PatientID +" PATIENT NAME "+NGlobal.PatientName +"  LAB RESULT STATUS : "+resultstatus);
          LogStatus(false,"  Verification Failed , Lab Test Result status in Corner Stone Database for Test Ran in IVLS is not completed result is displaying as PENDING REQUEST");
        }
    }
    catch(e)
    {
            LogStatus("TERMINATE", " Unable to perform Database Operation due to "+e.message);
    }
}
 /*================================================================================================================
  Function Name  : GetPatientIDCS
  Purpose        : This function is get the Patient ID  based on Patient NAme from Corner Stone database table Patient
  Inputs         : TestDataXML 
  Output         : PatientName 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 21st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function GetPatientIDCS()
{
    var oConnect = new ActiveXObject("ADODB.Connection");
    var strConnectionString = "DSN=Cornerstone";
    var oRecordSet;
    var resultFlag =false;
    var strPatientName = aqString.Trim(NGlobal.InputData);
    var SQL = "select patientid from patient where name='"+strPatientName+"'";
    
      oConnect.Open(strConnectionString);
      if(oConnect.state==1)
        {
            LogStatus("MESSAGE", "  Sucessfully Connected to Corner Stone Database");
            oRecordSet = oConnect.Execute(SQL);
            while(!(oRecordSet.EOF))
            {
              for(var i = 0; i< oRecordSet.Fields.count; i++) 
              { 
                     if((aqString.Compare(aqString.Trim(aqString.ToLower(oRecordSet.Fields(i).Name)),"patientid",false)==0))
                     {
                          fnSetNetworkVariableValue("PatientID",aqString.Trim(aqString.ToLower(oRecordSet.Fields(i).Value)));
                          resultFlag = true;
                          LogStatus(true, " Sucessfully found Patient ID  "+oRecordSet.Fields(i).Value +" in Corner Stone Database foe given Patient Name "+strPatientName);
                          i= oRecordSet.Fields.count;
                     }      
              }
            oRecordSet.MoveNext(); 
            }
            oRecordSet.Close();
            oConnect.Close();
        }
        else
        {
             Log.Message(" Failed to  Connected to Corner Stone Database");
        }
        if(!(resultFlag))
        {
          LogStatus("TERMINATE", " Unable to find Patient ID  "+strPatientID +" in Corner Stone Database, Please check the Patient ID and try again.....");
        }
}
 /*================================================================================================================
  Function Name  : getNewReqID
  Purpose        : This function is search if generated reqid is already in Lab_request_header, if not generates new req id
  Inputs         : TestDataXML 
  Output         :  
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 24st July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function getNewReqID()
{
    var oConnect = new ActiveXObject("ADODB.Connection");
    var strConnectionString = "DSN=Cornerstone";
    var oRecordSet;
    var resultFlag =false;
    var newReqID = generateReqID();
    do
    {
      var SQL = "select count(*)  from lab_request_header where req_id='"+newReqID+"'";
      oConnect.Open(strConnectionString);
      if(oConnect.state==1)
      {
          oRecordSet = oConnect.Execute(SQL);
          while(!(oRecordSet.EOF))
          {
             if(oRecordSet.Fields(0).Value == 0)
             {
                  fnSetNetworkVariableValue("ReqID",newReqID);
                  resultFlag = true;
             }
             else
             {
                  newReqID = getNewReqID();
                  resultFlag = false;
             }
                   
              oRecordSet.MoveNext();       
            }
             
      }
          
    }while(resultFlag==false)
    oRecordSet.Close();
    oConnect.Close();
}
/*================================================================================================================
  Function Name  : CreateSimulatorTestResultXMLFile
  Purpose        : This function is to Copy existing Result XML file from Test Data folder to Simulator Data folder with Requisition ID file name
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
function CreateSimulatorTestResultXMLFile()
{
  var fso, f;
  strInstrument = aqString.Trim(NGlobal.InputData);
  var strSimulatorFilePath = NGlobal.TestDataFolderPath+"SIMULATOR\\"+strInstrument+".xml"
  var strSimulatorXMLDataFilePath = NGlobal.SimulatorXMLDataFilePath;
  var strSimulatorFileName = NGlobal.ReqID+"-"+strInstrument+".xml"
  fnCreateNetworkSuiteVariable("SimulatorTestResultFileName","String");
  fnSetNetworkVariableValue("SimulatorTestResultFileName",strSimulatorFileName);
  try
  {
    fso = new ActiveXObject("Scripting.FileSystemObject");
    fso = new ActiveXObject("Scripting.FileSystemObject");
    fso.CopyFile (strSimulatorFilePath, strSimulatorXMLDataFilePath+strSimulatorFileName);
    LogStatus(true , " Sucessfully Created Simulator Result XML file in Simulator Data Folder with name "+strSimulatorFileName);
  }
  catch(e)
  {
      LogStatus("Terminate", "  Unable to create Simulator Result XML file in Simulator Data Folder due to "+e.message);  
  }
}
/*================================================================================================================
  Function Name  : CreateLabRequestCS
  Purpose        : This function is to Create Lab Request in Corner Stone Application Database
  Pre-Condition  : Test Data XML file , Patient and Client Info Already alaviable in CS Database.
  Inputs         : Client ID , Patient ID , Profile ID , Visit Type ID  and Lab ID
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function CreateLabRequestCS()
{
    var strOrderDateTime = getLabRequestOrderDate();
    getNewReqID();
    var oConnect = new ActiveXObject("ADODB.Connection");
    var strConnectionString = "DSN=Cornerstone";
    var requestflag = false;
    var oRecordSet;
    try
    {
        
        var resultFlag =false;
        var arrTestData = aqString.Trim(NGlobal.InputData);
        strClientID = aqString.Trim(arrTestData.split("|")[0]);
        strPatientID = aqString.Trim(arrTestData.split("|")[1]);
        strLabID = aqString.Trim(arrTestData.split("|")[2]);
        strVisitTypeID = aqString.Trim(arrTestData.split("|")[3]);
        strProfileID = aqString.Trim(arrTestData.split("|")[4]);
        strReqId = NGlobal.ReqID;
        fnSetNetworkVariableValue("ClientID",strClientID);
        fnSetNetworkVariableValue("PatientID",strPatientID);
        fnSetNetworkVariableValue("LabID",strLabID);
        fnSetNetworkVariableValue("VisitTypeID",strVisitTypeID);
        fnSetNetworkVariableValue("ProfileID",strProfileID);
        var INSERT_LAB_REQUEST_HEADER = "INSERT INTO LAB_REQUEST_HEADER (lab_id ,req_id,req_seq_nbr,clientid,patientid,staffid,staffsequence,sample_drawn_by,date_time_ordered,instructions,visittype_id,sample_source,change_sync_increment,create_sync_increment,from_database_id,suspend_update_trigger,labrexx_xml,practiceid,online_request_flag,antech_pims_req_id,critical_request_flag,no_of_containers ,container_size,no_of_specimens,spl_stain,requested_pathologists,source,biopsytype_excisional,biopsytype_incisional,biopsytype_needle,biopsytype_endoscopic,tissues_submitted,cytology_accession_no,patient_history,temporary_sex,temporary_species,temporary_breed,practice_req_id) Values('"+strLabID+"','"+strReqId+"','1','"+strClientID+"','"+strPatientID+"','CS','1','null','"+strOrderDateTime+"','null','"+strVisitTypeID+"','null','0','0','null','N','null','1','0','null','0','0','null','0','No','null','null','0', '0','0','0','No','null','null','null','null','null','0')"
        var INSERT_LAB_PROFILES_ON_ORDER = "INSERT INTO LAB_PROFILES_ON_ORDER (clientid,patientid,lab_id,req_id,req_seq_nbr,sequence,profile_id,date_time_ordered,change_sync_increment,create_sync_increment,from_database_id,suspend_update_trigger)Values('"+strClientID+"','"+strPatientID+"','"+strLabID+"','"+strReqId+"','1','1','"+strProfileID+"','"+strOrderDateTime+"','0','0','null','N')";
        var SELECT_LAB_REQUEST_COUNT = "select count(*)  from lab_request_header where req_id='"+strReqId+"'";
        Log.Message(INSERT_LAB_REQUEST_HEADER);
        Log.Message(INSERT_LAB_PROFILES_ON_ORDER);
        oConnect.Open(strConnectionString);
        if(oConnect.state==1)
          {
              oConnect.Execute(INSERT_LAB_REQUEST_HEADER);
              LogStatus(true, "  Sucessfully executed query "+ INSERT_LAB_REQUEST_HEADER );
              oConnect.Execute(INSERT_LAB_PROFILES_ON_ORDER);
              LogStatus(true, "  Sucessfully executed query "+ INSERT_LAB_PROFILES_ON_ORDER );
              oRecordSet = oConnect.Execute(SELECT_LAB_REQUEST_COUNT);
              while(!(oRecordSet.EOF))
              {
                    if(oRecordSet.Fields(0).Value > 0)
                    {
                      requestflag = true;
                      LogStatus(true, "  Sucessfully verified Lab request existence in CS database with  query "+ SELECT_LAB_REQUEST_COUNT );
                      LogStatus(true, "  Sucessfully Created Lab Request in Corner Stone Database ");
        
                    }
              oRecordSet.MoveNext();  
             }
          }
          if(requestflag==false)
          {
              LogStatus(false, "  Failed to create Lab Request in Corner Stone Database ");
          }
          oRecordSet.Close();
          oConnect.Close();
    }
    catch(e)
    {
        LogStatus("TERMINATE", " Unable to connect to Corner Stone Data Base, Terminating the Script execution due to "+e.message);  
        Log.Error(" Unable to connect to Corner Stone Data Base, Terminating the Script execution due to "+e.message);
    }
}
/*================================================================================================================
  Function Name  : CheckIVLSMachineConnectivity
  Purpose        : This function with until IVLS machine is up and connected to the network  on Restart.
  Pre-Condition  : NA
  Inputs         : NA
  Output         : 
  Created By'    : Alliance Global Services - Automation CoE Team
  Date           : 15th July, 2014
  Reviewed By    : 
  Reviewed On    : 
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Modified By Date 
  Purpose Reviewed By Reviewed On 
  ================================================================================================================*/
function CheckIVLSMachineConnectivity()
{
    do
    {
      aqUtils.Delay(30000);
      strMachineName = NGlobal.IVLSMachineName;
      var status = ckeckNetwotkConnection(strMachineName);
    }while(status==false)
    aqUtils.Delay(100000);
}