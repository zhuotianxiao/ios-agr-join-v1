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
    
    //通过代码添加一个按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10,300, 100, 100)];
    
    UIImage *image = [UIImage imageNamed:@"btn_01"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setTitle:@"默认状态" forState:UIControlStateNormal];
    [btn setTitle:@"高亮状态" forState:UIControlStateHighlighted];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) clickBtn:(id)sender {
    
    NSLog(@"点击代码添加的按钮,触发的事件");
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
-(IBAction)romate:(UIButton*)sender {
    
    
    CGAffineTransform transForm = self.previewIcon.transform;
    if(sender.tag) {
        
        //向右旋转
        transForm = CGAffineTransformRotate(transForm,M_PI_4);//向上移动20
    }else {
        
        //向左旋转
         transForm = CGAffineTransformRotate(transForm,-M_PI_4);//向上移动20
    }
    self.previewIcon.transform = transForm;
    
}
-(IBAction) plus:(UIButton*)sender {
    
    CGAffineTransform transForm = self.previewIcon.transform;
    if(sender.tag) {
        
        NSLog(@"缩小图片");
        transForm = CGAffineTransformScale(transForm,0.8, 0.8);
    }else {
        
        NSLog(@"放大图片");
        transForm = CGAffineTransformScale(transForm, 1.1, 1.1);
    }
    
    self.previewIcon.transform = transForm;
}

@end
