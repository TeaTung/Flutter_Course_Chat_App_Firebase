import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('chat')
          .orderBy('createAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        final chatDocs = chatSnapshot.data.documents;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) => Text(
            chatDocs[index]['text'],
          ),
          itemCount: chatDocs.length,
        );
      },
    );
  }
}
