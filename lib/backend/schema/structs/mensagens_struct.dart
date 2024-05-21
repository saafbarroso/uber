// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensagensStruct extends FFFirebaseStruct {
  MensagensStruct({
    String? texto,
    DocumentReference? enviadoPor,
    DateTime? dataEnvio,
    List<DocumentReference>? lidoPor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _texto = texto,
        _enviadoPor = enviadoPor,
        _dataEnvio = dataEnvio,
        _lidoPor = lidoPor,
        super(firestoreUtilData);

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;
  bool hasTexto() => _texto != null;

  // "enviado_por" field.
  DocumentReference? _enviadoPor;
  DocumentReference? get enviadoPor => _enviadoPor;
  set enviadoPor(DocumentReference? val) => _enviadoPor = val;
  bool hasEnviadoPor() => _enviadoPor != null;

  // "data_envio" field.
  DateTime? _dataEnvio;
  DateTime? get dataEnvio => _dataEnvio;
  set dataEnvio(DateTime? val) => _dataEnvio = val;
  bool hasDataEnvio() => _dataEnvio != null;

  // "lido_por" field.
  List<DocumentReference>? _lidoPor;
  List<DocumentReference> get lidoPor => _lidoPor ?? const [];
  set lidoPor(List<DocumentReference>? val) => _lidoPor = val;
  void updateLidoPor(Function(List<DocumentReference>) updateFn) =>
      updateFn(_lidoPor ??= []);
  bool hasLidoPor() => _lidoPor != null;

  static MensagensStruct fromMap(Map<String, dynamic> data) => MensagensStruct(
        texto: data['texto'] as String?,
        enviadoPor: data['enviado_por'] as DocumentReference?,
        dataEnvio: data['data_envio'] as DateTime?,
        lidoPor: getDataList(data['lido_por']),
      );

  static MensagensStruct? maybeFromMap(dynamic data) => data is Map
      ? MensagensStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'texto': _texto,
        'enviado_por': _enviadoPor,
        'data_envio': _dataEnvio,
        'lido_por': _lidoPor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'enviado_por': serializeParam(
          _enviadoPor,
          ParamType.DocumentReference,
        ),
        'data_envio': serializeParam(
          _dataEnvio,
          ParamType.DateTime,
        ),
        'lido_por': serializeParam(
          _lidoPor,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static MensagensStruct fromSerializableMap(Map<String, dynamic> data) =>
      MensagensStruct(
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        enviadoPor: deserializeParam(
          data['enviado_por'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        dataEnvio: deserializeParam(
          data['data_envio'],
          ParamType.DateTime,
          false,
        ),
        lidoPor: deserializeParam<DocumentReference>(
          data['lido_por'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['user'],
        ),
      );

  @override
  String toString() => 'MensagensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MensagensStruct &&
        texto == other.texto &&
        enviadoPor == other.enviadoPor &&
        dataEnvio == other.dataEnvio &&
        listEquality.equals(lidoPor, other.lidoPor);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([texto, enviadoPor, dataEnvio, lidoPor]);
}

MensagensStruct createMensagensStruct({
  String? texto,
  DocumentReference? enviadoPor,
  DateTime? dataEnvio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MensagensStruct(
      texto: texto,
      enviadoPor: enviadoPor,
      dataEnvio: dataEnvio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MensagensStruct? updateMensagensStruct(
  MensagensStruct? mensagens, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mensagens
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMensagensStructData(
  Map<String, dynamic> firestoreData,
  MensagensStruct? mensagens,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mensagens == null) {
    return;
  }
  if (mensagens.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mensagens.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mensagensData = getMensagensFirestoreData(mensagens, forFieldValue);
  final nestedData = mensagensData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mensagens.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMensagensFirestoreData(
  MensagensStruct? mensagens, [
  bool forFieldValue = false,
]) {
  if (mensagens == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mensagens.toMap());

  // Add any Firestore field values
  mensagens.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMensagensListFirestoreData(
  List<MensagensStruct>? mensagenss,
) =>
    mensagenss?.map((e) => getMensagensFirestoreData(e, true)).toList() ?? [];
