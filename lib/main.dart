import 'package:flutter/material.dart';

void main() {
  runApp(WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF25D366), // Replaces accentColor
        ),
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Color(0xFF075E54),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Camera Screen")),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action here
        },
        backgroundColor: Color(0xFF25D366),
        child: Icon(Icons.message),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text("Contact ${index + 1}"),
          subtitle: Text("Last message..."),
          trailing: Text("12:45 PM"),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
          title: Text("My Status"),
          subtitle: Text("Tap to add status update"),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Recent updates", style: TextStyle(color: Colors.grey)),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text("Friend's Status"),
          subtitle: Text("Today, 8:35 AM"),
        ),
      ],
    );
  }
}

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(Icons.phone, color: Colors.white),
          ),
          title: Text("Contact ${index + 1}"),
          subtitle: Text("Incoming call"),
          trailing: Icon(Icons.call, color: Colors.green),
        );
      },
    );
  }
}
