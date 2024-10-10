import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> myTransactionsData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.cartShopping,
      color: Colors.white,
    ),
    'color': Colors.yellow[700],
    'name': 'Grocery',
    'totalAmount': '-500',
    'date': '09/25/24',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.car,
      color: Colors.white,
    ),
    'color': Colors.blue[700],
    'name': 'Transport',
    'totalAmount': '-50',
    'date': '09/25/24',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'color': Colors.red,
    'name': 'Snacks',
    'totalAmount': '-20',
    'date': '09/26/24',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.mobile,
      color: Colors.white,
    ),
    'color': Colors.green,
    'name': 'Phone Bill',
    'totalAmount': '-100',
    'date': '09/26/24',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'color': Colors.purple,
    'name': 'Health',
    'totalAmount': '-250',
    'date': '09/26/24',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.moneyCheck,
      color: Colors.white,
    ),
    'color': Colors.yellow,
    'name': 'Salary',
    'totalAmount': '+3,000',
    'date': '09/2/24',
  },
];
