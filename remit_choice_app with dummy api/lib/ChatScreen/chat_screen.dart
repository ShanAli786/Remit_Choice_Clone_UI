// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _showAttachButton = false; // Whether to show the attach button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Remit Choice Support'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Currently Replaying in 3 minutes',
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 18, // Adjust the font size as needed
              ),
            ),
          ),
        ),
      ),

      //==========================Bubble message, and Avatar image section===================
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/texture.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Adjust the fitting of the image
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: SizedBox(
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0), // Add bottom padding
                      child: Text(
                        "support",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold, // Set font weight to bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  foregroundImage: AssetImage('assets/remit_logo.png'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildMessageBubble(
                          message:
                              'Hi, Welcome to Remit Choice Customer Support Services.',
                          isUser: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _buildMessageInputBar(),
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Row(
                  children: const [
                    Text("Powerd by Remit Choice ltd."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble({required String message, required bool isUser}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width *
            0.6, // Set width to half of screen width
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isUser
                ? Colors.orange
                : const Color.fromARGB(255, 164, 221, 248),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3), // Shadow color
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//================================Message INput Bar==============================
  Widget _buildMessageInputBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _showAttachButton = !_showAttachButton;
              });
            },
            icon: Icon(_showAttachButton ? Icons.close : Icons.attach_file),
          ),
          if (_showAttachButton) ...[
            IconButton(
              onPressed: () {
                // Handle file attachment
              },
              icon: const Icon(
                Icons.attach_file,
                color: Colors.lightBlueAccent,
              ),
            ),
            // Add more attachment options here if needed
          ],
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Handle sending message
              String message = _messageController.text;
              if (message.isNotEmpty) {
                // Add logic to send the message
                _messageController.clear();
              }
            },
            icon: const Icon(
              Icons.telegram_sharp,
              color: Colors.lightBlueAccent,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
