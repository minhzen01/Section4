import 'package:flutter/material.dart';
import 'package:sec4_card/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ?
      Column(
        children: [
          Text(
            'No Transaction added yet!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      )
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                      child: Text(
                        '\$' + transactions[index].amount.toStringAsFixed(2),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                  ),
                ),
                radius: 30,
              ),
              title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6,),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(transactions[index].date),),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
          // return Card(
          //   child: Row(
          //     // mainAxisAlignment: MainAxisAlignment.,
          //     // crossAxisAlignment: CrossAxisAlignment.,
          //     children: [
          //       Container(
          //         margin: const EdgeInsets.symmetric(
          //           vertical: 15,
          //           horizontal:20,
          //         ),
          //         padding: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColor,
          //             width: 1,
          //           ),
          //         ),
          //         child: Text(
          //           '\$' + transactions[index].amount.toStringAsFixed(2),
          //           style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         // mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Text(
          //             transactions[index].title,
          //             style: Theme.of(context).textTheme.headline6,
          //             // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             DateFormat('dd/MM/yyyy').format(transactions[index].date),
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
