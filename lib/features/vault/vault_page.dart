import 'package:flutter/material.dart';

class VaultPage extends StatelessWidget {
  const VaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Private Vault')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Vault protected'),
              subtitle: const Text('Biometric protection is ready to configure'),
              trailing: Switch(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('No private files yet.'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
