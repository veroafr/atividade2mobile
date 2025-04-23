import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskListPage(),
    );
  }
}

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Task> _tasks = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text('Organizador de Tarefas'),
        titleTextStyle: TextStyle(
          
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://i.ibb.co/B2d2RtJ5/01-Beige.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Nenhuma tarefa adicionada',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TaskItem(
                    task: task,
                    onDelete: () {
                      setState(() {
                        _tasks.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título da Tarefa',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição ',
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  final title = _titleController.text.trim();
                  final description = _descriptionController.text.trim();
                  if (title.isNotEmpty) {
                    setState(() {
                      _tasks.add(Task(title: title, description: description));
                    });
                    _titleController.clear();
                    _descriptionController.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Adicionar Tarefa'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;

  const TaskItem({Key? key, required this.task, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(55, 23, 6, 29),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (task.description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(task.description),
                ],
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Color.fromARGB(255, 104, 4, 161)),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
