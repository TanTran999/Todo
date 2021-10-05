import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

Stream<QuerySnapshot<Object?>>? getNotes =
    firestore.collection('todo').orderBy('time', descending: true).snapshots();

