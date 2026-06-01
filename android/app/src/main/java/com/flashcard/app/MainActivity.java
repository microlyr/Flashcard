package com.flashcard.app;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebSettings;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        WebView webView = new WebView(this);
        WebSettings settings = webView.getSettings();

        // 启用 JavaScript（AI API 调用必需）
        settings.setJavaScriptEnabled(true);
        // 启用 DOM Storage（localStorage 持久化必需）
        settings.setDomStorageEnabled(true);
        // 允许访问本地文件
        settings.setAllowFileAccess(true);
        // 支持缩放
        settings.setSupportZoom(true);
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        // 适配屏幕
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);

        // 加载打包在 assets 中的 HTML
        webView.loadUrl("file:///android_asset/flashcard.html");

        setContentView(webView);
    }
}
