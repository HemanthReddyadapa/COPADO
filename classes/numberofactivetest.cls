@istest
public class numberofactivetest {
	@istest
    public static void numberof(){
         account acc=new account();
        acc.Name='test';
        acc.Number_Of_Contacts__c=0;
        acc.Number_of_Inactive__c=0;
        insert acc;
        list<contact> contacts=new list<contact>();
        contact c=new contact();
        c.LastName='Test';
        c.Phone='8232898';
        c.AccountId=acc.id;
        c.Status__c='Active';
        insert c;
        contacts.add(c);
        contact c1=new contact();
        c1.LastName='test2';
        c1.AccountId=acc.id;
        c1.Status__c='Inactive';
        c1.Phone='228729';
        insert c1;
        contacts.add(c1);
		numberofactiveandinactive.active(contacts);
    }
}