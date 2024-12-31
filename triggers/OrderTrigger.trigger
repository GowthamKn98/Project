trigger OrderTrigger on Orderr__c (After insert) 
{
	List<Task> tasks = new List<Task>();
    for(Orderr__c order : Trigger.new)
    {
        Task task=new Task(
        	Subject = 'Confirm Order',
            WhatId = order.Id,
            Status = 'Not Started',
            Priority = 'High',
            Description = 'Please confirm the order: ' + order.Order_Number__c
        );
        tasks.add(task);
    }
    if (!tasks.isEmpty()) {
        insert tasks;
    }
}