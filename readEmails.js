function readEmails() {
  var doc = DocumentApp.getActiveDocument().getBody();
  var threads = GmailApp.getInboxThreads(0, 100);
  for(var i in threads){
    var msg = threads[i].getFirstMessageSubject();
     msg = LanguageApp.translate(msg, 'en', 'fr');
    doc.appendParagraph(msg);
  }
}

function onOpen(){
  var menu = DocumentApp.getUi().createMenu('Salesforce Demo');
  menu.addItem('Read Emails', 'readEmails');
  menu.addToUi();
}
