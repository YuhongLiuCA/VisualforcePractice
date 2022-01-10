public with sharing class SingleAccountController {
    public Account myAccount {get; set;}
    String searchText;
    Account result;

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String s) {
        searchText = s;
    }
    
    public Account getResult() {
        return result;
    }
    
    public void SearchAccountByName() {
        String searchName = '%'+searchText+'%';
        result = [SELECT (SELECT name, lastName, firstName,Title,Phone FROM Contacts), name, annualRevenue, type, accountNumber FROM Account WHERE name LIKE :searchName LIMIT 1];
    }
    public SingleAccountController(ApexPages.StandardController sController) {
        if(myAccount == null) {
            myAccount = [SELECT (SELECT name, lastName, firstName,Title,Phone FROM Contacts), name, annualRevenue, type, accountNumber 
            FROM Account LIMIT 1];
        }
    }
}