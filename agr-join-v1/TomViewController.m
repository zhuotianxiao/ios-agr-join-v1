//
//  TomViewController.m
//  agr-join-v1
//
//  Created by findview on 15/11/21.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import "TomViewController.h"

/**tom猫**/
@interface TomViewController ()
@property(nonatomic,strong) NSDictionary *dictionary;       //当前动画需要的图片资源
@property(nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation TomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载图片数据
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"];
    self.dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSLog(@"%@",self.dictionary);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)click:(id)sender {
    
    NSString *key = ((UIButton*)sender).currentTitle;
    NSInteger count = [_dictionary[key] intValue];
    
    NSMutableArray *imgs = [NSMutableArray array];      //创建可变数组
    NSBundle *bundle = [NSBundle mainBundle];
    for(NSInteger i = 0;i<count; i++) {
        
        NSString *imgName = [NSString stringWithFormat:@"%@_%02d.jpg",key, i];
        //NSLog(@"%@",imgName);
        NSString *imgPath = [bundle pathForResource: imgName ofType:nil];
        NSLog(@"%@", imgPath);
        UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
        
        [imgs addObject:image];
    }
    
    _imageView.animationImages = imgs;
    _imageView.animationDuration = count*0.075;
    
    if([_imageView isAnimating]) {
        
        return;
    }
    [_imageView startAnimating];
    
    [self performSelector:@selector(clearData) withObject:nil afterDelay:_imageView.animationDuration];
}

/**
 *  <#Description#>
 */
-(void)clearData {
    
    _imageView.animationImages = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
