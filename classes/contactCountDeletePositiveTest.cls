@isTest(seealldata=true)
public class contactCountDeletePositiveTest {

@istest
    public static void contactCountDeletePositiveTest(){
        Account acct = new Account(Name = 'TestAcct');
        Account acct2 = new Account(Name = 'TestAcct2');

        Insert acct;
        Insert acct2;

        Contact con = new Contact(FirstName = 'TestCon', LastName = 'TestCon', AccountId = acct.Id);
                
        Database.SaveResult insertSR = Database.insert(con);
        System.assert(insertSR.isSuccess());

        con.accountid = acct2.Id;
        Database.SaveResult UpdateSR = Database.update(con);
        System.assert(updateSR.isSuccess());
        
        Database.DeleteResult deleteSR = Database.delete(con);
        System.assert(deleteSR.isSuccess());
        
        Database.unDeleteResult unDeleteSR = Database.undelete(con);
        System.assert(unDeleteSR.isSuccess());
        
        con.accountid = null;
        Database.SaveResult UpdateSR2 = Database.update(con);
        System.assert(updateSR.isSuccess());
    }
}