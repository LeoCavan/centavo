import 'package:centavo/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:centavo/screens/add_expense/blocs/get_categoriesbloc/get_categories_bloc.dart';
import 'package:centavo/screens/add_expense/views/add_expense.dart';
import 'package:centavo/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:centavo/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
      builder: (context, state) {
        if (state is GetExpensesSuccess) {
          return Scaffold(
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              // ),

              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  backgroundColor: Colors.white,
                  fixedColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.house_fill), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.graph_square_fill),
                        label: 'Dashboard'),
                  ]),
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () async {
                  var newExpense = await Navigator.push(
                    context,
                    MaterialPageRoute<Expense>(
                      builder: (BuildContext context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => CreateCategoryBloc(
                              FirebaseExpenseRepo(),
                            ),
                          ),
                          BlocProvider(
                            create: (context) => GetCategoriesBloc(
                              FirebaseExpenseRepo(),
                            )..add(
                                GetCategories(),
                              ),
                          ),
                          BlocProvider(
                            create: (context) => CreateExpenseBloc(
                              FirebaseExpenseRepo(),
                            ),
                          ),
                        ],
                        child: const AddExpense(),
                      ),
                    ),
                  );

                  if (newExpense != null) {
                    setState(() {
                      state.expenses.insert(0, newExpense);
                    });
                  }
                },
                child: const Icon(CupertinoIcons.add),
              ),
              body:
                  index == 0 ? MainScreen(state.expenses) : const StatScreen());
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
