# 保持所有的 JNI 方法
-keepclasseswithmembers,includedescriptorclasses class org.luckypray.dexkit.** {
    native <methods>;
}

# 保持与 C++ 层通信的 Schema 和 Result 类
# 这些类会被 C++ 通过 JNI 实例化或访问字段，混淆会导致找不到类/字段
-keep class org.luckypray.dexkit.schema.** { *; }
-keep class org.luckypray.dexkit.result.** { *; }
-keep class org.luckypray.dexkit.query.** { *; }

# 保持枚举类，因为 C++ 可能会根据名称或序数映射
-keepclassmembers enum org.luckypray.dexkit.** { *; }

# 保持 FlatBuffers 相关的类（如果使用了）
-keep class com.google.flatbuffers.** { *; }

# 如果有任何类是通过反射调用的，也需要保持
-keep class org.luckypray.dexkit.DexKitBridge { *; }
