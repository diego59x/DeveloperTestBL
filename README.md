# DeveloperTestBL

## How to run it
Later
### Transactions flow
Four files take action for this, TransactionService, TransactionPool, HttpsTransaction and Transaction
1. At first a Task called Transaction is created - TransactionPool
2. From the function m._load() the request flow starts
3. An empty object of type HttpsTransaction is created - TransactionService
    1. And set up the callback for request on same file
4. The request object is stored on TransactionPool
5. Set up active request and task - TransactionPool
6. The Task is configurate to response due changes on their fields, response and state - TransactionPool
7. The Task is initialize and filled with the request data - TransactionPool
8. Validate type of request and start of transaction - Transaction
8. Request is made and response is set - HttpsTransaction
9. Due response was changed from Task, the observefields set on step 6 are executed - TransactionPool
10. The response from task is set to Httpstransaction object, then the callback set on step 3.1 is called - TransactionPool
11. At this point the response is checked to errors, if fine a succes event is dispatched and returning the data and flow to the step 2 - TransactionService

TransactionService: Manage the creation and response of the request and communicates with Main Thread
TransactionPool: Manage Task events and creates it
HttpsTransaction: Have the logic to truly make request, also this object helps to communicate along files
Transaction: Manage all types of transactions and stablish the response
