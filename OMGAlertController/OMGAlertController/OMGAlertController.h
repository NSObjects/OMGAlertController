//
//  OMGAlertController.h
//  OMGAlertController
//
//  Created by 林涛 on 16/3/16.
//  Copyright © 2016年 林涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OMGAlertAction.h"

@interface OMGAlertController : NSObject

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;

- (void)addAction:(OMGAlertAction *)action;

- (void)presentInViewController:(UIViewController *)viewController;

@property (nonatomic, readonly) NSArray<OMGAlertAction *> *actions;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *message;

@property (nonatomic, readonly) UIAlertControllerStyle preferredStyle;

@end
