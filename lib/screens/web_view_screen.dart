import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/models/azkar.dart';
import 'package:quran_app/screens/nav_bar_screen.dart';
import 'package:quran_app/src/app_color.dart';
import 'package:quran_app/utils/app_navigator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  int index;
  String azkarType;

  WebViewScreen({required this.azkarType, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              AppNavigator.appNavigator(context, NavBarScreen(),
                  isFinished: true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.kBlackColor,
              size: 24.sp,
            )),
        centerTitle: true,
        title: Text(
          azkarType,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlackColor),
        ),
      ),
      body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(azkarLinks[index]))),
    );
  }
}
