import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "chat_id" field.
  DocumentReference? _chatId;
  DocumentReference? get chatId => _chatId;
  bool hasChatId() => _chatId != null;

  // "data_criado" field.
  DateTime? _dataCriado;
  DateTime? get dataCriado => _dataCriado;
  bool hasDataCriado() => _dataCriado != null;

  // "membros" field.
  List<DocumentReference>? _membros;
  List<DocumentReference> get membros => _membros ?? const [];
  bool hasMembros() => _membros != null;

  // "mensagens" field.
  List<MensagensStruct>? _mensagens;
  List<MensagensStruct> get mensagens => _mensagens ?? const [];
  bool hasMensagens() => _mensagens != null;

  void _initializeFields() {
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _chatId = snapshotData['chat_id'] as DocumentReference?;
    _dataCriado = snapshotData['data_criado'] as DateTime?;
    _membros = getDataList(snapshotData['membros']);
    _mensagens = getStructList(
      snapshotData['mensagens'],
      MensagensStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? criadoPor,
  DocumentReference? chatId,
  DateTime? dataCriado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'criado_por': criadoPor,
      'chat_id': chatId,
      'data_criado': dataCriado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.criadoPor == e2?.criadoPor &&
        e1?.chatId == e2?.chatId &&
        e1?.dataCriado == e2?.dataCriado &&
        listEquality.equals(e1?.membros, e2?.membros) &&
        listEquality.equals(e1?.mensagens, e2?.mensagens);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality()
      .hash([e?.criadoPor, e?.chatId, e?.dataCriado, e?.membros, e?.mensagens]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
