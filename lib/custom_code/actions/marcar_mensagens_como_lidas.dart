// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future marcarMensagensComoLidas(
  String documentId,
  DocumentReference referenciaUsuario,
) async {
  try {
    // Referência para o documento específico na coleção "chat"
    DocumentReference documento =
        FirebaseFirestore.instance.collection('chat').doc(documentId);

    // Obtém o documento atual
    DocumentSnapshot snapshot = await documento.get();

    // Verifica se o documento existe
    if (snapshot.exists) {
      // Obtém o campo "mensagens" do documento
      dynamic mensagens1 = snapshot.data()! as Map<String, dynamic>;
      List<dynamic> mensagens = mensagens1['mensagens'];
      // Verifica se o campo "mensagens" não é nulo
      if (mensagens != null) {
        // Itera sobre a lista de mapas de mensagens
        for (int i = 0; i < mensagens.length; i++) {
          // Obtém a mensagem específica usando o índice
          Map<String, dynamic>? mensagem =
              mensagens[i] as Map<String, dynamic>?;

          // Verifica se a mensagem não é nula
          if (mensagem != null) {
            // Verifica se a mensagem contém o campo 'lido_por'
            if (mensagem.containsKey('lido_por')) {
              // Verifica se a referência do usuário não está presente em "lido_por"
              if (!(mensagem['lido_por'] as List<dynamic>)
                  .contains(referenciaUsuario)) {
                // Adiciona a referência do usuário em "lido_por"
                mensagem['lido_por'] =
                    (mensagem['lido_por'] as List<dynamic>?) ?? [];
                mensagem['lido_por'].add(referenciaUsuario);
              }
            } else {
              // Se o campo 'lido_por' não existir, cria-o com a referência do usuário
              mensagem['lido_por'] = [referenciaUsuario];
            }
          }
        }

        // Atualiza o documento no Firestore
        await documento.update({'mensagens': mensagens});
        print('Mensagens marcadas como lidas com sucesso!');
      } else {
        print('O campo "mensagens" é nulo no documento.');
      }
    } else {
      print('O documento com ID $documentId não existe.');
    }
  } catch (e) {
    print('Erro ao marcar mensagens como lidas: $e');
  }
}
