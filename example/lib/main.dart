import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_device_context/secure_device_context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureDeviceContext _secureDeviceContextPlugin = SecureDeviceContext();

  bool? _isDevMode;
  bool? _isJailbreak;
  bool? _isEmulator;
  bool? _isDebugMode;
  RiskLevel? _riskLevel;
  List<SecureContext>? _contexts;
  Map<String, dynamic>? _status;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPlatformState();
    });
  }

  Future<void> initPlatformState() async {
    bool? isDevMode;
    bool? isJailbreak;
    bool? isEmulator;
    bool? isDebugMode;
    RiskLevel? riskLevel;
    List<SecureContext>? contexts;
    Map<String, dynamic>? status;

    try {
      isDevMode = await _secureDeviceContextPlugin.isDevMode;
      isJailbreak = await _secureDeviceContextPlugin.isJailbreak;
      isEmulator = await _secureDeviceContextPlugin.isEmulator;
      isDebugMode = await _secureDeviceContextPlugin.isDebugMode;
      riskLevel = await _secureDeviceContextPlugin.riskLevel;
      contexts = await _secureDeviceContextPlugin.contexts;
      status = await _secureDeviceContextPlugin.status;
    } on PlatformException catch (e) {
      debugPrint('Failed to load device context: ${e.message}');
    }

    if (!mounted) return;

    setState(() {
      _isDevMode = isDevMode;
      _isJailbreak = isJailbreak;
      _isEmulator = isEmulator;
      _isDebugMode = isDebugMode;
      _riskLevel = riskLevel;
      _contexts = contexts;
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Secure Device Context'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _buildResultTile('Risk Level', _riskLevel?.value),
          _buildResultTile('Is Dev Mode (Android)', _isDevMode?.toString()),
          _buildResultTile('Is Jailbreak/Rooted', _isJailbreak?.toString()),
          _buildResultTile('Is Emulator', _isEmulator?.toString()),
          _buildResultTile('Is Debug Mode', _isDebugMode?.toString()),
          const Divider(),
          const Text(
            'Contexts Detected:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            _contexts?.map((SecureContext e) => e.value).join(', ') ?? 'None',
          ),
          const SizedBox(height: 16),
          const Text(
            'Raw Status Map:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_status?.toString() ?? 'Unknown'),
        ],
      ),
    ),
  );

  Widget _buildResultTile(String title, String? value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 16)),
        Text(
          value ?? 'Loading...',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
