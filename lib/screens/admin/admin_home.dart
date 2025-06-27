import 'package:flutter/material.dart';
// import 'admin_sales.dart';
// import 'admin_classes.dart';
// import 'admin_clients.dart';
// import 'admin_analytics.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню Администратора'),
      ),
      body: ListView(
        children: [
          // Продажи
          ExpansionTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Продажи'),
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Информация о продажах'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalesInfoScreen()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Добавить запись о продаже'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSaleScreen()),
                ),
              ),
            ],
          ),
          
          // Занятия
          ExpansionTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Занятия'),
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Добавить занятие'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddClassScreen()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Список занятий'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ClassesListScreen()),
                // ),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Информация о занятиях'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassesInfoScreen()),
                ),
              ),
            ],
          ),
          
          // Клиенты
          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text('Клиенты'),
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Добавить клиента'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddClientScreen()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Список клиентов'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ClientsListScreen()),
                // ),
              ),
            ],
          ),
          
          // Аналитика
          ExpansionTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Аналитика'),
            children: [
              ListTile(
                leading: const Icon(Icons.assessment),
                title: const Text('Количество проданных абонементов'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionsAnalyticsScreen()),
                ),
              ),
            ],
          ),
          
          // Выход
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Выйти'),
            onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}

// Экран информации о продажах
class SalesInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Информация о продажах')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Продажа ${index + 1}'),
          subtitle: Text('Сумма: ${(index + 1) * 2500} руб.'),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

// Экран добавления продажи
class AddSaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить продажу')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Название услуги'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Сумма'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран добавления занятия
class AddClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить занятие')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Название занятия'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Время проведения'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран информации о занятиях
class ClassesInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Информация о занятиях')),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => ListTile(
          title: Text('Занятие ${index + 1}'),
          subtitle: Text('Посещаемость: ${(index + 3) * 5}%'),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

// Экран добавления клиента
class AddClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить клиента')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Фамилия'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Имя'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Телефон'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран аналитики абонементов
class SubscriptionsAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Продажи абонементов')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Статистика продаж абонементов',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Администратор ${index + 1}'),
                  subtitle: Text('Продано абонементов: ${(index + 1) * 12}'),
                  trailing: Text('${(index + 1) * 85000} руб.'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}