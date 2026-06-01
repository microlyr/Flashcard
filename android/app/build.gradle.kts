plugins {
    id("com.android.application")
}

android {
    namespace = "com.flashcard.app"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.flashcard.app"
        minSdk = 26
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // 纯 WebView，无需额外依赖
}
