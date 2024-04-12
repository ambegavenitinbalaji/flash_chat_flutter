import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  // static String id = 'chat-screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  // late final String messageText;
  String messageText = "";

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   var messages = await FirebaseFirestore.instance
  //       .collection('Messages')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       print(doc.data());
  //     }
  //   });
  // }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('Messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade300,
        leading: null,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                messageStream();
                // _auth.signOut();
                // Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
        title: Text("⚡️ Chat"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _firestore.collection("Messages").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                }
                final messages = snapshot.data?.docs;
                List<MessageBubble> messageBubbles = [];
                for (var message in messages!) {
                  final messageText = message.data()['textMessage'];
                  final messageSender = message.data()['sender'];

                  final messageBubble =
                      MessageBubble(sender: messageSender, text: messageText);
                  messageBubbles.add(messageBubble);
                }
                return Column(
                  children: messageBubbles,
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Enter your message here...",
                      ),
                      onChanged: (value) {
                        messageText = value;
                        // print(
                        //     "TextField OnChanged before value - ${value} -messageText- ${messageText}");
                        // messageText = value;
                        // print(
                        //     "TextField OnChanged after value - ${value} -messageText- ${messageText}");
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print(messageText);
                    print(loggedInUser.email);
                    _firestore.collection('Messages').add(
                      {
                        'textMessage': messageText,
                        'sender': loggedInUser.email
                      },
                    );
                  },
                  child: const Text(
                    "SEND",
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.sender, required this.text, super.key});

  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(
        "$text from $sender",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
