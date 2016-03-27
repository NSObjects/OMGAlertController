//
//  ViewController.m
//  OMGAlertController
//
//  Created by 林涛 on 16/3/16.
//  Copyright © 2016年 林涛. All rights reserved.
//

#import "ViewController.h"
#import "OMGAlertController.h"

@interface ViewController ()
@property (nonatomic, strong) OMGAlertController *alertController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showAlerView:(id)sender {
    self.alertController = [OMGAlertController alertControllerWithTitle:@"Demo" message:@"Demo Message" preferredStyle:UIAlertControllerStyleAlert];
    
    OMGAlertAction *cancelAction = [OMGAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(OMGAlertAction *action) {
        NSLog(@"Ok");
    }];
    OMGAlertAction *okAction = [OMGAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(OMGAlertAction *action) {
        NSLog(@"Cancel");
    }];
    
    [self.alertController addAction:cancelAction];
    [self.alertController addAction:okAction];
    [self.alertController presentInViewController:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
