function doPost(e) {
  /*
  * Goto https://script.google.com
  * Save this as <filename>.gs
  * Publish > Deploy as web app
  * Copy "Current web app URL", which you can configure with cuertm tool
  */
  
  var OkrSpreadsheetId = '1hVsTCikwaVBxl53m3GruXiByA0zh4QTPUdikrfW3XIE';
  var OkrSpreadsheet = SpreadsheetApp.openById(OkrSpreadsheetId);
  var params = e.parameter;
  var newfiles = params.files.split(',')
  var existingContent = OkrSpreadsheet.getRange(params.cell_no).getValue().split('\n');
  
  var mergeNClean = function (uncleanedarr)  {
   var a = uncleanedarr; 
   for(var i=0; i<a.length; ++i) {
        for(var j=i+1; j<a.length; ++j) {
            if(a[i] === a[j])
                a.splice(j--, 1);
        }
    } 
   return a; 
  }
  
  var output_ = mergeNClean(existingContent.concat(newfiles)).join('\n');
  if(OkrSpreadsheet.getRange(params.cell_no).getValue() != undefined) {
     OkrSpreadsheet.getRange(params.cell_no).setValue(output_);
    return ContentService.createTextOutput("OKR Updated successfully.");
  }
  
  return ContentService.createTextOutput("Error updating OKR");
}
