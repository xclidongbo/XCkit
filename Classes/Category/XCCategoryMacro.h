//
//  XCCategoryMacro.h
//  XCkit
//
//  Created by lidongbo on 08/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#ifndef XCCategoryMacro_h
#define XCCategoryMacro_h




/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif



/**
 NSLog Plus
 */
#define XCLog(format, ...) do{ fprintf(stderr, "-----------------------\n<%s : %d> \nmethod: %s\n", \
                                [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
                                __LINE__,\
                                __func__);\
                                (NSLog)((format), ##__VA_ARGS__); \
                                fprintf(stderr, "-----------------------\n"); \
                            } while (0)



#endif /* XCCategoryMacro_h */


#if __has_feature(objc_arc)
/**
 ARC下 完整单例的宏定义.
 用法: interface 下 XC_SINGLETON_INT;
    implement 下 XC_SINGLETON_IMP
 */
#define XC_SINGLETON_INT XC_SINGLETON_INT_NAME(shareSingleton)
#define XC_SINGLETON_INT_NAME(shareName) \
+ (instancetype)shareName;


#define XC_SINGLETON_IMP XC_SINGLETON_IMP_NAME(shareSingleton)

#define XC_SINGLETON_IMP_NAME(shareName) \
static id singleton = nil;\
+ (instancetype)shareName {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
singleton = [[super allocWithZone:NULL] init];\
});\
return singleton;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return [[self class] shareName];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return [[self class] shareName];\
}\
- (id)mutableCopyWithZone:(nullable NSZone *)zone {\
return [[self class] shareName];\
}

#else

#endif
