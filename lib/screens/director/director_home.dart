import 'package:flutter/material.dart';
// import 'director_employees.dart';
// import 'director_clients.dart';
// import 'director_sales.dart';
// import 'director_reports.dart';

class DirectorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Меню Директора')),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Сотрудники'),
            children: [
              ListTile(
                title: const Text('Приём сотрудника'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
                // ),
              ),
              ListTile(
                title: const Text('Список сотрудников'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => EmployeesListScreen()),
                // ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Клиенты'),
            children: [
              ListTile(
                title: const Text('Список покупателей'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ClientsListScreen()),
                // ),
              ),
              ListTile(
                title: const Text('Зарегистрировать клиента'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddClientScreen()),
                // ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Продажи'),
            children: [
              ListTile(
                title: const Text('Список продаж'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SalesListScreen()),
                // ),
              ),
              ListTile(
                title: const Text('Объём продаж'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SalesVolumeScreen()),
                // ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Отчёты'),
            children: [
              ListTile(
                title: const Text('Объём выручки'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RevenueReportScreen()),
                // ),
              ),
              ListTile(
                title: const Text('Количество услуг'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ServicesReportScreen()),
                // ),
              ),
            ],
          ),
          ListTile(
            title: const Text('Выйти'),
            onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}