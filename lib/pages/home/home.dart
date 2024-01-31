import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createNote,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        controller.notes[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        controller.notes[index].content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: const Text("Edit"),
                            onTap: () => controller.updateNote(index),
                          ),
                          PopupMenuItem(
                            child: const Text("Delete"),
                            onTap: () => controller.deleteNote(
                              controller.notes[index].id!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }
}
