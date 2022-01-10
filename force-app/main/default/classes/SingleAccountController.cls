public with sharing class SingleAccountController {
    public Account myAccount {get; set;}
    public SingleAccountController(ApexPages.StandardController sController) {
        if(myAccount.isSet('name') == false) {
            myAccount = [SELECT (SELECT name, lastName, firstName FROM Contacts), name, annualRevenue, type, accountNumber 
            FROM Account LIMIT 1];
        }
    }
}
