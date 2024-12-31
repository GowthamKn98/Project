import { LightningElement, wire } from 'lwc';
import getOrders from '@salesforce/apex/OrderController.getOrders';

export default class OrderController extends LightningElement 
{
    orders;
    columns = [
        { label: 'Order Number', fieldName: 'Order_Number__c', type: 'text' },
        { label: 'Order Date', fieldName: 'Order_Date__c', type: 'date' },
        { label: 'Total Amount', fieldName: 'Total_Amount__c', type: 'currency' },
    ];

    @wire(getOrders)
    wiredOrders({ error, data }) 
    {
        if (data) 
        {
            this.orders = data;
        } 
        else if (error) 
        {
            console.error(error);
        }
    }
}
