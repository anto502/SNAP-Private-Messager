import 'package:supabase_flutter/supabase_flutter.dart';

class SnapSupabase {
  static const url = String.fromEnvironment('SUPABASE_URL');
  static const publishableKey =
      String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');
  static const anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static String get key =>
      publishableKey.isNotEmpty ? publishableKey : anonKey;

  static bool get configured => url.isNotEmpty && key.isNotEmpty;

  static SupabaseClient? get client =>
      configured ? Supabase.instance.client : null;

  static String? get userId => client?.auth.currentUser?.id;

  static Future<void> initialize() async {
    if (!configured) return;

    await Supabase.initialize(
      url: url,
      publishableKey: key,
    );
  }

  static Future<void> signIn(String email, String password) async {
    final supabase = client;
    if (supabase == null) return;

    final result = await supabase.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );

    if (result.user == null) {
      throw Exception('Invalid credentials');
    }
  }

  static Future<void> signUp(
    String email,
    String password,
    String username,
  ) async {
    final supabase = client;
    if (supabase == null) return;

    final result = await supabase.auth.signUp(
      email: email.trim(),
      password: password,
      data: {
        'username': username,
        'display_name': username,
      },
    );

    if (result.user == null) {
      throw Exception('Unable to create account');
    }
  }

  static Future<void> signOut() async {
    await client?.auth.signOut();
  }

  static Future<void> sendMessage({
    required String conversationId,
    required String body,
  }) async {
    final supabase = client;
    final senderId = userId;

    if (supabase == null || senderId == null) return;

    await supabase.from('messages').insert({
      'conversation_id': conversationId,
      'sender_id': senderId,
      'body': body.trim(),
      'message_type': 'text',
    });
  }

  static Stream<List<Map<String, dynamic>>> watchMessages(
    String conversationId,
  ) {
    final supabase = client;

    if (supabase == null) {
      return const Stream.empty();
    }

    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('conversation_id', conversationId)
        .order('created_at');
  }
}
