import 'package:flutter/material.dart';
// import 'trainer_classes.dart';
// import 'trainer_programs.dart';
// import 'trainer_clients.dart';

class TrainerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню Тренера'),
      ),
      body: ListView(
        children: [
          // Занятия
          ExpansionTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Занятия'),
            children: [
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Список занятий'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassesListScreen()),
                ),
              ),
            ],
          ),
          
          // Программы
          ExpansionTile(
            leading: const Icon(Icons.description),
            title: const Text('Программы'),
            children: [
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Список программ'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgramsListScreen()),
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
                leading: const Icon(Icons.list),
                title: const Text('Список клиентов'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientsListScreen()),
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

// Экран списка занятий
class ClassesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список занятий')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Занятие ${index + 1}'),
          subtitle: Text('Тренер: Иванов И.И.'),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

// Экран списка программ
class ProgramsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список программ')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: Text('Программа ${index + 1}'),
          subtitle: Text('Продолжительность: ${(index + 1) * 4} недель'),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

// Экран списка клиентов
class ClientsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список клиентов')),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ListTile(
          title: Text('Клиент ${index + 1}'),
          subtitle: Text('Абонемент: ${index % 3 == 0 ? 'Стандарт' : 'Премиум'}'),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}