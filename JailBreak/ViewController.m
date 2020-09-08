//
//  ViewController.m
//  JailBreak
//
//  Created by Mr_deng on 2020/4/29.
//  Copyright © 2020 Mr_deng. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <mach-o/dyld.h>
#include <sys/stat.h>




#define CYDIA_APP_PATH  "/Applications/Cydia.app"

@interface ViewController ()

@property(nonatomic, strong)NSArray* dataSource;

@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@property (nonatomic, strong)UIColor *color;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat height = 150;
    UIButton *btn_1 = [self createBtnWithTitle:@"检测-1"];
    btn_1.frame = CGRectMake(0, height, self.view.frame.size.width - 60, 35);
    [btn_1 addTarget:self action:@selector(btnAction_1) forControlEvents:UIControlEventTouchUpInside];
    height +=45;

    UIButton *btn_2 = [self createBtnWithTitle:@"检测-2"];
    btn_2.frame = CGRectMake(0, height, self.view.frame.size.width - 60, 35);
    [btn_2 addTarget:self action:@selector(btnAction_2) forControlEvents:UIControlEventTouchUpInside];
    height +=45;

    
    UIButton *btn_3 = [self createBtnWithTitle:@"检测-3"];
    btn_3.frame = CGRectMake(0, height, self.view.frame.size.width - 60, 35);
    [btn_3 addTarget:self action:@selector(btnAction_3) forControlEvents:UIControlEventTouchUpInside];
    height +=45;

    UIButton *btn_4 = [self createBtnWithTitle:@"检测-4"];
    btn_4.frame = CGRectMake(0, height, self.view.frame.size.width - 60, 35);
    [btn_4 addTarget:self action:@selector(btnAction_4) forControlEvents:UIControlEventTouchUpInside];
    height +=45;

    
    UIButton *btn_5 = [self createBtnWithTitle:@"检测-5"];
    btn_5.frame = CGRectMake(0, height, self.view.frame.size.width - 60, 35);
    [btn_5 addTarget:self action:@selector(btnAction_5) forControlEvents:UIControlEventTouchUpInside];
}

-(UIButton*)createBtnWithTitle:(NSString*)title{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview: button];
    return button;
}


-(NSArray*)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[
            @"/Applications/Cydia.app",
            @"/Applications/limera1n.app",
            @"/Applications/greenpois0n.app",
            @"/Applications/blackra1n.app",
            @"/Applications/blacksn0w.app",
            @"/Applications/redsn0w.app",
            @"/Applications/Absinthe.app",
            @"/Library/MobileSubstrate/MobileSubstrate.dylib",
            @"/bin/bash",
            @"/usr/sbin/sshd",
            @"/etc/apt",
            @"/private/var/lib/apt/"
        ];
    }
    return _dataSource;
}



-(void)btnAction_1{
    
    self.color = [UIColor blackColor];
    
    BOOL root = NO;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSArray *pathArray = @[@"/etc/ssh/sshd_config",
                           @"/usr/libexec/ssh-keysign",
                           @"/usr/sbin/sshd",
                           @"/usr/sbin/sshd",
                           @"/bin/sh",
                           @"/bin/bash",
                           @"/etc/apt",
                           @"/Application/Cydia.app/",
                           @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                           
                           @"/Applications/Cydia.app",
                           @"/Applications/limera1n.app",
                           @"/Applications/greenpois0n.app",
                           @"/Applications/blackra1n.app",
                           @"/Applications/blacksn0w.app",
                           @"/Applications/redsn0w.app",
                           @"/Applications/Absinthe.app",
                           @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                           @"/bin/bash",
                           @"/usr/sbin/sshd",
                           @"/etc/apt",
                           @"/private/var/lib/apt/"
                           ];
    for (NSString *path in pathArray) {
        root = [fileManager fileExistsAtPath:path];
      // 如果存在这些目录，就是已经越狱
        if (root) {
            NSLog(@"你的手机已经-----越狱了-----%@",path);
          break;
        }
    }
    NSLog(@"你的手机已经-----没有越狱-----");
    
}


-(void)btnAction_2{
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
          NSLog(@"你的手机已经-----越狱了-----");
    }
}

-(void)btnAction_3{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
        NSLog(@"你的手机已经-----越狱了-----");
        NSArray *appList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"User/Applications/" error:nil];
        NSLog(@"appList = %@", appList);
     }
}

-(void)btnAction_4{
    
    struct stat stat_info;
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
       NSLog(@"你的手机已经-----越狱了-----");
    }
    
}

char* printEnv(void) {
   char *env = getenv("DYLD_INSERT_LIBRARIES");
   return env;
}

-(void)btnAction_5{
    if (printEnv()) {
       NSLog(@"你的手机已经-----越狱了-----");
    }
}





@end
