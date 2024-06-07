import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<dynamic> users = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (isLoading) return;

    if (refresh) {
      currentPage = 1;
      hasMore = true;
    }

    setState(() {
      isLoading = true;
    });

    final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=10'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        if (refresh) {
          users = data['data'];
        } else {
          users.addAll(data['data']);
        }
        hasMore = data['page'] < data['total_pages'];
        currentPage++;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load users');
    }
  }

  Future<void> _refresh() async {
    // await fetchUsers(refresh = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: users.isEmpty
          ? Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('No data available'),
            )
          : RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: users.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    fetchUsers();
                    return const Center(child: CircularProgressIndicator());
                  }

                  final user = users[index];
                  return ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        user['avatar'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('${user['first_name']} ${user['last_name']}'),
                    subtitle: Text(user['email']),
                    onTap: () {
                      Navigator.pop(context,
                          '${user['first_name']} ${user['last_name']}');
                    },
                  );
                },
              ),
            ),
    );
  }
}
