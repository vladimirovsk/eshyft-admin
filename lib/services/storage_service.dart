import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:eshyftadmin/models/storage_item.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();
  final _accountNameController =
  TextEditingController(text: 'flutter_secure_storage_service');

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  IOSOptions _getIOSOptions() => IOSOptions(
    accountName: _getAccountName(),
  );

  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;


  Future<void> writeSecureData(StorageItem newItem) async {
    try {
      await _secureStorage.write(
          key: newItem.key,
          value: newItem.value,
          aOptions: _getAndroidOptions(),
          iOptions: _getIOSOptions(),
    );
    } catch (e) {
      debugPrint("ERROR Writing secureStorage ${e}");
    }
  }

  Future<String?> readSecureData(String key) async {
    var readData =  await _secureStorage.read(
        key: key,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions()
    );
    // debugPrint("Reading key $key $readData");
    return await readData;
  }

  Future<void> deleteSecureData(StorageItem item) async {
    debugPrint("Deleting data having key ${item.key}");
    await _secureStorage.delete(
        key: item.key,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions()
    );
  }

  Future<List<StorageItem>> readAllSecureData() async {
    try {
      var allData = await _secureStorage.readAll(
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions(),
      );
      List<StorageItem> list =
      allData.entries.map((e) =>
        StorageItem(e.key, e.value)
      ).toList();
      debugPrint("Reading all secured data ${list.toString()}");
      return list;
    } catch (e) {
      debugPrint('Empty SecureData');
      return [];
    }
  }

  Future<void> deleteAllSecureData() async {
    debugPrint("Deleting all secured data");
    await _secureStorage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions());
  }

  Future<void> printAllSecureData() async {
    try {
      final Map<String, String> allData = await _secureStorage.readAll();
      allData.forEach((key, value) {
        print('Key: $key, Value: $value');
      });
    } catch (e) {
      print('Error reading secure storage: $e');
    }
  }

  Future<bool> containsKeyInSecureData(String key) async {
    debugPrint("Checking data for the key $key");
    var containsKey = await _secureStorage.containsKey(
        key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),);
    return containsKey;
  }
}
