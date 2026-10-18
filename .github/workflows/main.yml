
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BuildHomePage(),
  ));
}

class BuildHomePage extends StatefulWidget {
  const BuildHomePage({super.key});

  @override
  State<BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<BuildHomePage> {
  String? selectedFile;
  bool isBuilding = false;
  String status = 'اختر ملف مشروعك للبدء';

  Future<void> selectProject() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          selectedFile = result.files.single.name;
          status = 'تم اختيار الملف. يلزم ربط خادم البناء لإنشاء APK.';
        });
      }
    } catch (e) {
      setState(() {
        status = 'تعذّر اختيار الملف.';
      });
    }
  }

  Future<void> buildApk() async {
    if (selectedFile == null) {
      setState(() {
        status = 'اختر ملف ZIP أولاً.';
      });
      return;
    }

    setState(() {
      isBuilding = true;
      status = 'لم يتم بدء البناء: خادم البناء غير متصل.';
    });

    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    setState(() {
      isBuilding = false;
      status = 'لم يُنشأ APK. يجب إعداد خادم بناء حقيقي أولاً.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B14),
      appBar: AppBar(
        title: const Text('محول المشاريع'),
        centerTitle: true,
        backgroundColor: const Color(0xFF171526),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 25),
            const Icon(
              Icons.android,
              size: 76,
              color: Color(0xFF9B7BFF),
            ),
            const SizedBox(height: 20),
            const Text(
              'حوّل مشروعك إلى تطبيق أندرويد',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'اختر ملف ZIP يحتوي على مشروعك.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF171526),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF50416E)),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.folder_zip_outlined,
                    color: Color(0xFFB7A0FF),
                    size: 48,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    selectedFile ?? 'لم يتم اختيار أي ملف',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: isBuilding ? null : selectProject,
                      icon: const Icon(Icons.folder_open),
                      label: const Text('اختيار ملف ZIP'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: isBuilding ? null : buildApk,
                icon: const Icon(Icons.build_circle_outlined),
                label: Text(isBuilding ? 'جارٍ الفحص...' : 'بناء APK'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7955E8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF171526),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Color(0xFFB7A0FF),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
