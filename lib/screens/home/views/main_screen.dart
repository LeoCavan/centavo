import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {
  final List<Expense> expenses;
  const MainScreen(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5, color: Colors.grey, offset: Offset(5, 5))
                  ],
                  borderRadius: BorderRadius.circular(25)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      Text(
                        '+2,170.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '+3,000.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '-830.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const Column(
                  children: [
                    Divider(
                      color: Colors.grey,
                      height: 50,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    height: 450,
                    width: MediaQuery.of(context).size.width / 1.14,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: expenses.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Color(
                                                    expenses[i].category.color),
                                                shape: BoxShape.circle),
                                          ),
                                          Image.asset(
                                            'assets/${expenses[i].category.icon}.png',
                                            scale: 15,
                                            color: Colors.white,
                                          )
                                          // myTransactionsData[i]['icon'],
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat('dd/MM/yyyy')
                                                .format(expenses[i].date),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline),
                                          ),
                                          Text(
                                            expenses[i].category.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "-${expenses[i].amount}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
