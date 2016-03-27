//
//  OMGAlertController.m
//  OMGAlertController
//
//  Created by 林涛 on 16/3/16.
//  Copyright © 2016年 林涛. All rights reserved.
//

#import "OMGAlertController.h"
#import "OMGAlertAction.h"

@interface OMGAlertController()<UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *alertActions;
@property (nonatomic, strong) UIViewController *viewController;
@end

@implementation OMGAlertController

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    OMGAlertController *alertController = [[OMGAlertController alloc]initWithTitle:title message:message preferredStyle:preferredStyle];
    return alertController;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    self = [super init];
    if (self) {
        _title = title;
        _message = message;
        _preferredStyle = preferredStyle;
    }
    return self;
}

- (void)addAction:(OMGAlertAction *)action {
    [self.alertActions addObject:action];
}

- (NSArray <OMGAlertAction *>*)actions {
    return [self.alertActions mutableCopy];
}

- (NSMutableArray *)alertActions {
	if(_alertActions == nil) {
		_alertActions = [[NSMutableArray alloc] init];
	}
	return _alertActions;
}

- (void)presentInViewController:(UIViewController *)viewController; {

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
    UIAlertView * alertView = nil;
    NSMutableArray *actions = [NSMutableArray arrayWithArray:self.alertActions];
    for (OMGAlertAction *action in self.alertActions) {
        if (action.style == OMGAlertActionStyleCancel) {
            alertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:nil cancelButtonTitle:action.title otherButtonTitles:nil, nil];
            [actions removeObject:action];
            break;
        }
    }
    
    if (!alertView) {
        alertView = [[UIAlertView alloc]init];
        alertView.title = self.title;
        alertView.message = self.message;
    }
    
    for (OMGAlertAction *action in actions) {
        if (action.handler) {
            alertView.delegate = self;
        }
        [alertView addButtonWithTitle:action.title];
    }
    [alertView show];
#else
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:self.preferredStyle];
    
    for (OMGAlertAction *omgAction in self.alertActions) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:omgAction.title style:omgAction.style handler:^(UIAlertAction * _Nonnull action) {
            omgAction.handler(omgAction);
        }];
        [alertController addAction:alertAction];
    }
    
    [viewController presentViewController:alertController animated:YES completion:nil];
#endif

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    for (OMGAlertAction *action in self.actions) {
        if ([action.title isEqualToString:[alertView buttonTitleAtIndex:buttonIndex]]) {
            action.handler(action);
        }
    }
}
@end
