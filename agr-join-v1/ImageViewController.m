//
//  ImageViewController.m
//  agr-join-v1
//
//  Created by findview on 15/11/19.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(UIButton*)sender {
    
    NSString *username = _usernameTextField.text;
    NSString *password = _passwordTextField.text;
    if(username.length == 0) {
        
        return;
    }else if(password.length == 0){
        
        return;
    }else{
        
        NSLog(@"用户名是: %@", username);
        NSLog(@"密码是: %@", password);
    }
}


@end
