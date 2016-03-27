//
//  OMGAlertAction.h
//  OMGAlertController
//
//  Created by 林涛 on 16/3/16.
//  Copyright © 2016年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, OMGAlertActionStyle) {
    OMGAlertActionStyleDefault = 0,
    OMGAlertActionStyleCancel,
    OMGAlertActionStyleDestructive
} ;

@interface OMGAlertAction : NSObject
typedef void(^AlertHandler)( OMGAlertAction * action);
@property (nullable, nonatomic, readonly) NSString *title;

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
+ (instancetype)actionWithTitle:(NSString *)title style:(OMGAlertActionStyle)style handler:(void (^)(OMGAlertAction * action))handler;
@property (nonatomic, readonly) OMGAlertActionStyle style;
#else
+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(OMGAlertAction * action))handler;
@property (nonatomic, readonly) UIAlertActionStyle style;
#endif
@property (nullable, nonatomic, copy) AlertHandler handler;
@property (nonatomic, getter=isEnabled) BOOL enabled;
@end
