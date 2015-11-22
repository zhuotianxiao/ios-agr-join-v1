//
//  ImageViewController.m
//  agr-join-v1
//
//  Created by findview on 15/11/19.
//  Copyright © 2015年 cn.findview. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property(nonatomic,strong) UILabel *noLabel;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *descLabel;
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;
@property(nonatomic, strong) NSArray *array;
@property(nonatomic,assign) NSInteger index;//显示图片的索引
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化view
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width,30)];
    [self.noLabel setTextAlignment:NSTextAlignmentCenter];
    self.noLabel.backgroundColor = [UIColor redColor];
    self.noLabel.text = @"标题";
    UIImage *image = [UIImage imageNamed:@"btn_01"];
    CGFloat width = 100;// 图片的宽
    CGFloat height = 100;//图片的高
    CGFloat x = (self.view.bounds.size.width - width)*0.5;
    CGFloat y = CGRectGetMaxY(_noLabel.frame) + 20;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    _imageView.image = image;
    
    
    //左右箭头
    CGFloat x1 = x * 0.5;
    CGFloat y1 = self.imageView.center.y;
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(x1, y1, 20,20)];
    
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    _leftButton.center = CGPointMake(self.imageView.frame.origin.x*0.5, y1);
    
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 20, 20)];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    _rightButton.center = CGPointMake(self.view.frame.size.width - self.leftButton.center.x, self.imageView.center.y);
    //描述文字
    CGFloat descY = CGRectGetMaxY(self.imageView.frame)+20;
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.frame.size.width, 30)];
    self.descLabel.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.noLabel];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.descLabel];
    [self.view addSubview:self.leftButton];
    [self.view addSubview:self.rightButton];
    
    self.leftButton.tag = 0;
    self.rightButton.tag = 1;
    //绑定事件
    
    [self.leftButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self refreshImgWithIndex:_index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)array{
    
    if(_array == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageList" ofType:@"plist"];
        _array = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _array;
}
-(void) clickBtn:(id)sender {
    
    UIButton *btn = sender;
    if(btn.tag) {
        
        //向左移动
        _index --;
        
    }else {
        
        //有
        _index ++ ;
    }
    
    
    [self refreshImgWithIndex:_index];
}

-(void) refreshImgWithIndex:(NSInteger) index {
    
    NSLog(@"当前显示的图片的索引是 : %d", index);
    
    UIImage *image = [UIImage imageNamed:self.array[_index][@"path"]];
    self.imageView.image = image;
    self.leftButton.enabled = YES;
    self.rightButton.enabled = YES;

    if(_index <= 0){
        
        _index = 0;

        self.rightButton.enabled = NO;
    }
    
    if(_index >= self.array.count - 1) {
        
        self.leftButton.enabled = NO;
        _index = self.array.count - 1;
       
    }
   
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
