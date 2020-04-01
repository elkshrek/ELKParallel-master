//
//  ViewController.m
//  ELKParallel-master
//
//  Created by wing on 2020/4/1.
//  Copyright © 2020 wing. All rights reserved.
//

#import "ViewController.h"
#import "ELKParallel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UILabel *parallel = [[UILabel alloc] initWithFrame:CGRectMake(30.f, 100.f, 100.f, 20.f)];
    parallel.text = @"ELKParallel";
    [self.view addSubview:parallel];
    
}


@end
