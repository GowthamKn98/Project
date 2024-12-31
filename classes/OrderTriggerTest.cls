@isTest
public class OrderTriggerTest {
    @isTest
    static void testOrderTrigger() {
        Orderr__c order = new Orderr__c(Order_Number__c='ORD123', Order_Date__c=Date.today(), Total_Amount__c=100);
        insert order;

        Task t = [SELECT Id, Subject FROM Task WHERE WhatId = :order.Id];
        System.assertEquals('Confirm Order', t.Subject);
    }
}