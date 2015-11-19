//
//  ViewController.m
//  agr-join-v1
//
//  Created by findview on 15/11/14.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *previewIcon;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
                                                                   
}
- (IBAction)click:(UIButton*)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    CGAffineTransform transForm  = self.previewIcon.transform;
    switch (sender.tag) {
        case 0:
            
            //向上移动
            transForm = CGAffineTransformTranslate(transForm, 0, -20);//向上移动20
            break;
        case 1:
            
            //向右移动
            transForm = CGAffineTransformTranslate(transForm, 20, 0);//向上移动20
            break;
            
        case 2:
            
            //向下移动
            transForm = CGAffineTransformTranslate(transForm, 0, 20);//向上移动20
            break;
            
        case 3:
            
            //向左移动
            transForm = CGAffineTransformTranslate(transForm, -20, 0);//向上移动20
            break;
            
        default:
            break;
    }
    
    self.previewIcon.transform = transForm;
    [UIView commitAnimations];
}

@end
