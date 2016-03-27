//
//  OMGAlertAction.m
//  OMGAlertController
//
//  Created by 林涛 on 16/3/16.
//  Copyright © 2016年 林涛. All rights reserved.
//

#import "OMGAlertAction.h"

@implementation OMGAlertAction


#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(OMGAlertActionStyle)style handler:(void (^)(OMGAlertAction *action))handler {
    OMGAlertAction *alertAction = [[OMGAlertAction alloc]initWithTitle:title style:style handler:handler];
    
    return alertAction;
}

- (instancetype)initWithTitle:(NSString *)title style:(OMGAlertActionStyle)style handler:(void (^)(OMGAlertAction *action))handler  {
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
        _handler = handler;
    }
    return self;
}
#else

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(OMGAlertAction *action))handler {
    OMGAlertAction *alertAction = [[OMGAlertAction alloc]initWithTitle:title style:style handler:handler];
    
    return alertAction;
}

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(OMGAlertAction *action))handler  {
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
        _handler = handler;
    }
    return self;
}
#endif



@end
