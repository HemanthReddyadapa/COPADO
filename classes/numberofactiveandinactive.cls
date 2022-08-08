public class numberofactiveandinactive {
    public static void active(list<contact> contacts){
        map<id,contact> conmap=new map<id,contact>();
        for(contact con:contacts){
            conmap.put(con.AccountId,con);
        }
        integer active=0;
        integer inactive=0;
        list<account> ac=new list<account>();
        list<account> acclist=[select id,Number_Of_Contacts__c,Number_of_Inactive__c,(select id,Status__c from contacts) from account where id in:conmap.keyset()];
        for(account acc:acclist){
            for(contact con:acc.contacts){
                if(con.Status__c=='Active'){
                    active++;
                }else{
                    inactive++;
                }
            }
            acc.Number_Of_Contacts__c=active;
            acc.Number_of_Inactive__c=inactive;
            ac.add(acc);
        }
        update ac;
    }
}