//
//  ViewController.m
//  一个iOS开发者必须掌握的66个知识点
//
//  Created by XianCheng Wang on 2018/7/23.
//  Copyright © 2018年 XianCheng Wang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FristViewController.h"
#define  ANGLE_2_HUDU(X) (X)*M_PI/180.0
#define  DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width

#define  DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
@interface ViewController (){
    
    NSTimer *timer;
}

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;

@property (nonatomic,strong)UIButton *addButton;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 监听键盘frame发生变化的通知 并可以通过键盘的属性获得对象
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
//    [self demo33];
    
//    [self demo66];
    
    [self.view addSubview:self.addButton];


}


-(UIButton *)addButton{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom]; _addButton.frame = CGRectMake(0,DEVICE_HEIGHT - 50, DEVICE_WIDTH, 50);

        CAGradientLayer *gLayer = [CAGradientLayer layer];
        gLayer.colors = @[(__bridge id)[UIColor colorWithRed:63/255.0
                                                       green:171/255.0
                                                        blue:250/255
                                                       alpha:1].CGColor,
                          (__bridge id)[UIColor colorWithRed:74/255.0 green:212/255.0 blue:246/255.0 alpha:1].CGColor];
        gLayer.startPoint = CGPointMake(0, 0);
        gLayer.endPoint = CGPointMake(1.0, 0);
        gLayer.frame = _addButton.bounds;
        [_addButton.layer addSublayer:gLayer];
        
        [_addButton setTitle:@"将选中的房源加入店铺" forState:UIControlStateNormal];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }return _addButton;
}



// 1.不可变数组、 转变为可变数组
-(NSMutableArray *)muArrWithArr:(NSArray *)arr{
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:arr];
    return muArr;
}

// 2.获取字符串的长度
-(CGFloat )longWithString:(NSString *)string{
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    
    return size.width;
}

// 3. 将单独的某个仕途上的视图控制器的导航条隐藏
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

// 4.1边帽法(拉伸图片)将某一像素点不断地复制  其他像素点 拉伸之后不会变图片变形
-(UIImage *)demo4_one{
    UIImage *image = [UIImage imageNamed:@"biubiu.png"];
    // 第一种
     UIImage *newImage_one = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    return newImage_one;
}
// 4.2边帽法(拉伸图片)将某一像素点不断地复制  其他像素点 拉伸之后不会变图片变形
-(UIImage *)demo4_second{
    UIImage *image = [UIImage imageNamed:@"biubiu.png"];
    // 第二种
    [image resizableImageWithCapInsets:UIEdgeInsetsMake(0,image.size.width, 0, 0) resizingMode:image.size.width];
    return image;
}

// 5.监听系统发送的通知
-(void)keyboardWillChangeFrame:(NSNotification *)noti{
    NSDictionary *dic = noti.userInfo;
    // 获取键盘时长
    float time = [[dic objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    time;
    
    // 获取键盘坐标
    CGRect rect = [[dic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    rect;
}

// 6.通过字符串绘制矩形 MAXFloat
-(void)demo6{
    NSArray *_chatArr = [NSArray arrayWithObjects:@"hehe",@"haha", nil];
    for (int i = 0; i < _chatArr.count; i++) {
        NSString *str = _chatArr[i];
        CGRect rect = [str boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
            // 画在指定的矩形区域内
        [str drawInRect:CGRectMake(30, 100,rect.size.width,rect.size.height) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    }

}

// 7.视图层级切换
-(void)demo7{
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    // 1.如果父视图不可交互，那么放在其上边的字数图也不可交互
    // 2.如果父视图可以交互，那么放在上次按的子视图的可交互性有自己决定
}


// 8.二进制数据转变类型
-(void)demo{
    // 8.1.1字符串转变成二进制
    NSString *str = @"一去二三里，三村四五家，儿童六七个，八九十枝花";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 8.1.3 二进制转化字符串
    NSString *str2 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // 8.2 图片转data
    UIImage *image2 = [UIImage imageNamed:@"biubiu.png"];
    NSData *data2 = UIImageJPEGRepresentation(image2,1);
    
}


// 9.如何删除一个试图上的所有子类
-(void)demo9{
    for (UIView *v in self.view.subviews) {
        [v removeFromSuperview];
    }
}

//10.将某个视图放在最前面
-(void)demo10{
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    redView.backgroundColor = [UIColor redColor];
    [self.view bringSubviewToFront:redView];
}

// 11.页面跳转动画
-(void)demo11{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:window cache:NO];
    [UIView animateWithDuration:1 animations:^{
    }];
}

// 12.将数据库的文件拷贝到沙河
-(void)demo12{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"papapapap" ofType:@"sqlite"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error = nil;
        if ([[NSFileManager defaultManager] copyItemAtPath:path toPath:@"文件路径" error:&error]) {
            NSLog(@"copy 成功");
        }
    }
}

// 13。直接进入网页
-(void)deno13{
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

// 14.将结构体转成字符串再输出
-(void)demo14{
   CGRect rect = CGRectMake(0,0,100, 100);
NSLog(@"%@",NSStringFromCGRect(rect));
}

// 15角度转弧度
-(void)demo15{
    
    // 计算圆形轨迹上空间的中心点坐标
    float x = 160 + 100 *cos(ANGLE_2_HUDU(10));
    float y = 240 + 100 * sin(ANGLE_2_HUDU(60));
    
    // X = 中心点 + 半径 * sin@
}

// 16交叉导入
-(void)demo16{
    // 为防止交叉导入 @class
    /* 只是桃酥编译器有这个类，但是该类的.h文件中有什么东西 编译器是不知道的
当真正需要使用这个类的时候，还必须在。文件中导入import"towViewcontroll.h"
    */
    
}
// 17 center + bounds = frame
-(void)demo17{
    UIImageView *image;
    image.bounds = CGRectMake(0, 0,200, 200);
    image.center = self.view.center;
    
}
// 18查询父视图
-(void)demo18{
    UIImageView *imageView;
    // 查看父视图
    NSLog(@"%@",imageView.superview);
    // 查看子视图
    NSLog(@"%@",imageView.subviews);
}
// 19 重新添加XIB文件
-(void)demo19{
    // 如果创建的xib文件的名字不同，需要在入口方法中，调用以下方法
    ViewController *vc = [[ViewController alloc] initWithNibName:@"Empty" bundle:nil];
}

// 20 屏幕获取触摸对象
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取触摸对象
    UITouch *touch = [touches anyObject];
    // 获取触摸对象在某一点的一个点
    CGPoint point = [touch locationInView:self.view];
    // 把结构体转换为字符串输出
    NSLog(@"%@",NSStringFromCGPoint(point));
    if (CGRectContainsPoint(self.view.frame, point)) {
        self.view.center = point;
    }
}
// 21判断对象之间联系常用的属性
-(void)demo21{
    CGPoint point = CGPointMake(0, 0);
    // 1判断某个对象坐标是否包含某个点
    CGRectContainsPoint(self.view.frame, point);
    // 2.判断两个坐标是否有交集
    CGRect r1 = CGRectMake(0,0, 100, 100);
    CGRect r2 = CGRectMake(0,0, 100, 100);;
    CGRectIntersection(r1,r2);
    // 3.判断两个对象什么时候相等
//isEqualToString:
    // 4.判断字符串类型根据长度的时候，需要调用length
}

// 22获取系统当前时间
-(void)demo22{
    NSDate *date = [NSDate date];
    // 时间格式年yyyy 月MM 日dd 小时HH 分钟mm 秒ss
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [formatter stringFromDate:date];
    NSLog(@"str ==== %@",str);
    // 2018:18:204:14:07:30
    
    // 2018:18:23:14:07:97
    
    // 2018-07-23 14:33:02
}

// 23分割（返回值类型-数组），拼接字符串
-(void)demo23{
    NSString *str = @"123,456,789,10,11";
    // 分割
    NSArray *arr = [str componentsSeparatedByString:@","];
    // 拼接
   NSString *str2 = [NSString stringWithString:@"qwer"];
    [NSString stringWithFormat:@"poiu"];
    // 去掉字符串中的空格
    [str stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    // 去掉字符串中的换行符
    [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

// 24定时器 延时加载
-(void)demo24{
    // 定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    
    
    
    // GCD 延时执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟时间*/ * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    
    
}

-(void)timeAction{
    NSLog(@"~~~大家好~~~");
    [timer invalidate];
    timer = nil;
}

// 25 文本框结束编辑，让键盘下去
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
// 26 向相册保存图片
-(void)demo26{
    UIImageWriteToSavedPhotosAlbum([UIImage imageNamed:@"biubiu"], self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
}

// 27输出当前方法的方法名
-(void)demo27{
    NSLog(@"当前方法的方法名:%s",__func__);
}

// 28三目运算符
-(void)demo28{

    NSString *str =  (2) > 5? @"sb":@"hehe";
}

//29 在数组中随机去除数据
-(void)demo29{
    
    NSMutableArray *muDataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    // 1.去除随机数
    int  random = arc4random()%muDataArr.count;
    // 2.取出想要的类型
    NSString *str = muDataArr[random];
    // 3.移除
    [muDataArr removeObjectAtIndex:random];
}

// 30 视图修建、透明度、隐藏视图、移除视图
-(void)demo30{
    UIView *bigView = [[UIView alloc] initWithFrame:
                       CGRectMake(
                       0,
                       0,
                       [UIScreen mainScreen].bounds.size.width,
                       [UIScreen mainScreen].bounds.size.height)];
    // 1.是否对视图进行修改
    bigView.clipsToBounds = YES;
    // 2.这是圆角直径
    bigView.layer.cornerRadius = 90;
    bigView.layer.masksToBounds = YES;
    // 3.透明度
    bigView.alpha = 0.5;
    // 4.移除视图
    [bigView removeFromSuperview];
}

// 31字符串输出孔家属性值
-(void)demo31{
    NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
}


// 32.第一响应者
-(void)demo32{
    // 1.1 成为第一响应者：
    [[[UITextField alloc] init] becomeFirstResponder];
    
    // 1.2 取消第一响应者：
    [[[UITextField alloc] init] resignFirstResponder];
    
    // 2. 在touchBegin中调用
    [self.view endEditing:YES];
}

// 33.导航控制器相关控件内容
-(void)demo33{
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    // 导航条标题
    self.navigationItem.title = @"导航条";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
     self.navigationController.navigationBar.tintColor = [UIColor redColor];
  
}
-(void)leftAction{
//    FristViewController *frist_VC = [[FristViewController alloc] init];
//    [self.navigationController pushViewController:frist_VC animated:YES];
    
    [self demo35];
}
// 34.弹框
-(void)demo34{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"无题" message:@"秦时明月汉时关,\n  万里长征人未还。\n  但使龙城飞将在，\n  不使胡马度阴山。\n" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:sureAction];
    [self presentViewController:alertC animated:YES completion:nil];

    
}
// 35.九宫格
-(void)demo35{
    CGFloat btn_W = 40;
    CGFloat W = ([UIScreen mainScreen].bounds.size.width - (40 * 3) - 100)/2 + 40;
    //方法1: 嵌套for 循环
    int c = 1;
    for (int a = 0 ; a < 3; a ++) {
        for (int b = 0 ; b < 3 ; b++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.backgroundColor = [UIColor redColor];
            btn.frame = CGRectMake(50 + W * b, 134 + W * a, btn_W, btn_W);
            [btn setTitle:[NSString stringWithFormat:@"%d",c++] forState:UIControlStateNormal];
            [self.view addSubview:btn];
        }
    }

    
}
// 36.直接在输出中判断布尔值
-(void)demo36{
    NSString *sex = @"";
    sex?@"男鸟":@"女鸟";
}
// 37.服务器 去掉out  printon -- 剧中的in换行符
-(void)demo37{
        NSString *sex = @"";
    NSString *str = [sex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    /*
     
    + controlCharacterSet
    + whitespaceCharacterSet              //空格
    + whitespaceAndNewlineCharacterSet    //空格和换行符
    + decimalDigitCharacterSet            //0-9的数字
    + letterCharacterSet                  //所有字母
    + lowercaseLetterCharacterSet         //小写字母
    + uppercaseLetterCharacterSet         //大写字母
    + alphanumericCharacterSet            //所有数字和字母（大小写不分）
    + punctuationCharacterSet             //标点符号
    + newlineCharacterSet                 //换行
    
     */
}
// 38. 如果URL中路径的字符串凭借的时候 有中文
-(void)demo38{
    NSString *path;
    NSString *encodingString = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
// 39.获取沙河文件中某个文件夹下的所有内容
-(void)demo39{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Socuments"];
    
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:nil];
    
}
// 40.获取沙河文件中的某个文件的属性
-(void)demo40{
    NSString *filePath =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/str.plist"];
    //返回值类型是字典  所以我们可以通过字典内的键值  取出我们想要的数据
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    unsigned long long size= [dic fileSize];
    NSLog(@"----%llu",size);
    NSLog(@"dic====%@",dic);
    
}

// 41.输出对象的时候 设置输出字符串格式 调用的方法
-(NSString *)description{
    
    return [NSString stringWithFormat:@"IP-----%p   name----%@   age-----%@",self, self.name, self.age];
}
// 42.沙盒文件中路径查找的便捷方式
-(void)demo42{
//    1.获取根目录文件路径
    
    NSLog(@"-----%@",NSHomeDirectory());
    
//    2.获取临时文件路径  方法类似于获取根目录文件 路径
    
    NSString * temp = NSTemporaryDirectory();
    
//    3.获取资源包路径
    
    NSString  *appPath =    [[NSBundle mainBundle]bundlePath];
    
//    4.获取某图片或文件夹路径
    
    NSString * imageViewPath =[[NSBundle mainBundle]pathForResource:@"18" ofType:@"jpg"];
//    5. 获取某目录下的文件 —> 文件路径
    
//    NSDictionary * dic =[[NSFileManager defaultManager]attributesOfItemAtPath:[self getPath] error:nil];

}
// 43.对象序列化 归档
-(void)demo43{
//    1. 创建可变的data (相当于一个空的袋子 )
    NSMutableData * data= [[NSMutableData alloc]initWithCapacity:0];
    
//    2.归档  关键词 : archiver
    
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    
    
//    3.编码 : (就是将对象类转变为二进制数据的过程)
    NSArray *_arr;
    UIView *_view;
    
    [archiver encodeObject:_arr];
    //如果有多个对象的时候 通过 设置 key值来区分
    
    [archiver encodeObject:_arr forKey:@"arr"];
    
    [archiver encodeObject:_view forKey:@"view"];
    
    
    
//    4.结束编码的时候  必须调用 接收方法 (完成编码)
    [archiver finishEncoding];
    
    
    
//    5.可以将转变为二进制数据类型的 对象类写入沙盒中
    
    [data writeToFile:  [self getFilePath] atomically:YES];
    
    
    
    
//    反序列化 (将二进制数据类型 转换为对象类)
//    1. 在沙盒中取出data数据
    
    NSData * data2 = [[NSData alloc] initWithContentsOfFile:[self getFilePath]];
    
//    2.将取出的数据交给反序列化来读
    
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data2];
    
//    3.解码
    
    NSArray * arr =  [unarchiver decodeObject];
    
    //如果有多个对象 (如上)
    
    NSArray * arr2 = [unarchiver decodeObjectForKey:@"arr"];
    
//    4.结束解码 :
    
    [unarchiver finishDecoding];
}
-(NSString *)getFilePath{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/arr.plist"];
}


// 44.44:  NSUserDefaults储存数据 (储存轻量级的数据(账号 密码  是否登录))
-(void)demo44{
    
    //1.NSUserDefaults 可以存储的数据类型 : NSString  字典  数组  NSNumber BOOL NSData(二进制数据) NSDate(时间) int(integer)  Double   float, URL(网址)
    //2.强制数据及时存储到沙盒
    //userDefaults 向沙盒中储存数据  是按照一定的时间戳定时储存数据  如果数据还没来得及存储 而此时程序出现问题 那么数据就会丢失  所以 我们可以同步一下强制数据及时存储到沙盒
    
    //synchronize 同步  保证数据及时的储存到沙盒中
    //同步数据
    [[NSUserDefaults standardUserDefaults]synchronize];
    

}
// 45.NSUserDefaults  存取文件
-(void)demo45{
    //存数据:
    [[NSUserDefaults standardUserDefaults]setObject:@"name" forKey:@"name"];
    [[NSUserDefaults standardUserDefaults]setObject:@"paw" forKey:@"paw"];
    
    //同步数据
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //取数据:
    NSString * nameString = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    NSString * pswString  = [[NSUserDefaults standardUserDefaults]objectForKey:@"psw"];
}
// 46.判断某路径下是否存在文件 是不是文件夹    关键词 :fileExistsAtPath
-(void)demo46{
    NSString *filePath1 =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/str.plist"];
    NSString *filePath2 =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ABC"];
    BOOL isDirectory ;
    BOOL isExist= [[NSFileManager defaultManager] fileExistsAtPath:filePath2 isDirectory:&isDirectory];
    if (isExist==YES) {
        NSLog(@"存在文件");
        if (isDirectory==YES) {
            NSLog(@"是个文件夹");
        }else{
            NSLog(@"不是文件夹");
        }
    }else{
        NSLog(@"不存在文件");

    }
}
// 47 .网络请求中网络超时设置
-(void)demo47{
//    request .timeoutInterval = 10;
    
}
// 48.
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
 NSArray  *arr = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",];
    return arr;
}

// 49. btn 按钮的失去响应
-(void)demo49{
    UIButton *btn;
    btn .enabled = NO;
    //默认值 YES
    btn.enabled = YES;

}// 50.在为URL添加字符串时 包含特殊字符或中文的 需要编码转换
-(void)demo50{
   NSString *string =[string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

}
// 51.图片转化二进制
-(void)demo51{
    //两种方法都可以 但是 PNG的返回的图片量与原图大小差不多 而jpg 的会压缩参数
//    NSData * data = UIImagePNGRepresentation(self.imageView.image);
//    NSData * data = UIImageJPEGRepresentation(self.imageView.image, 0.1);
    
}
//52.断点下载个别属性摘要
-(void)demo52{
    
}

//53.OC中对用户名和密码编码 和加密常用的方法  base64 MD5
-(void)demo53{
//    [_nameField.text base64EncodedString] 编码
//    [_nameField.text base64DecodedString] 解码
//    [_pswField.text MD5] 加密
}

//54.在web请求体重  截取某个字段
-(void)demo54{
//    @"https://api.weibo.com/oauth2/authorize?client_id=1950801855&response_type=code &redirect_uri=http://www.baidu.com" 该请求体中的 code
//
//    NSRange range =[request.URL .absoluteString rangeOfString:@"code="];
//
//    NSString * code =[[request.URL.absoluteString componentsSeparatedByString:@"="] lastObject];
//
//    都是单纯地字符串操作
}

//55.判断授权token 和 过期时间的两种方式 :
-(BOOL )demo55{
    //方式1:
    NSString * token =[[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSDate * time =[[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
    if (token == nil || [token isEqualToString:@""]) {
        return NO;
    }
    if ([[NSDate date]compare:time] != NSOrderedAscending) {
        return NO;
    }
    return YES;
    
//    //方式2:
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    //过期时间
//    NSDate * date = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
//    if (token == nil || [token isEqualToString:@""]) {
//        return NO;
//    }
//    //当前时间
//    NSDate * currentDate =[NSDate date];
//    //当前时间和过期时间 对比
//    if ([[currentDate laterDate:date]isEqualToDate:currentDate]) {
//        return NO;
//    }
//    return YES;
    

}

//56 如果需要设置多个tag值时

-(void)demo56{
    //一般设置tag值 只需要设置为数字进行区分的话 就可以 但是如果接口较多 需要区分的话 单独的设置为数字 时间久的话 不好辨认 所以我们可以模仿系统  来写出一个枚举来
    
    // NSInteger 指的是枚举中值的类型 RequestType 总的请求类型
//    typedef NS_ENUM(NSInteger, RequestType) {
//        GetTokenRequestTag = 0,
//        GetStatusListRequestTag
//        //需要再往下写的时候  不需要设置数字就可以 因为系统会自动递增
//    };
//
//    调用时 :
//    view.tag = GetTokenRequestTag;

    
}
//57 向上取整
-(CGFloat )demo57:(NSString *)string{
    //首先可以先获取矩形高度 然后向上取整
    CGRect rect =[string boundingRectWithSize:CGSizeMake(310, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil];
    //向上取整
    return ceilf(rect.size.height);
    

    
    
}

//58查找某个具体文件(eg:图片)路径的方法
-(NSString *)demo58{
    NSString * directoryPath =[NSHomeDirectory()stringByAppendingPathComponent:@"Documents/ImageCache"];
    //保证沙盒中的Documents 中一定有一个ImageCache 文件夹
    if (![[NSFileManager defaultManager]fileExistsAtPath:directoryPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //把图片的地址字符串分割 最后一个/ 之后的那段就是图片的名字
    NSString * fileName =[[@"URLString" componentsSeparatedByString:@"/"] lastObject];
    NSString * filePath =[NSString stringWithFormat:@"%@/%@", directoryPath, fileName];
    return filePath;
    

}

//59 导航栏添加UI控件
-(void)demo59{
//    self.navigationItem.titleView = segment;
    

}

//61视图留白
-(void)demo60{
    self.automaticallyAdjustsScrollViewInsets = NO;

}
// 61 iOS汉字转拼音
-(void)demo61{
    NSMutableString * hanzi =[[NSMutableString alloc] initWithString:@"中华人民共和国 重庆 长城 单家庄"];
    CFMutableStringRef hanziRef =(__bridge CFMutableStringRef)hanzi;
    //CFStringTransform 字符串转化
    //kCFStringTransformMandarinLatin 汉字转拼音
    //kCFStringTransformStripDiacritics 拼音去音标
    CFStringTransform(hanziRef, 0, kCFStringTransformMandarinLatin, NO);
    NSLog(@"---%@",hanziRef);
    CFStringTransform(hanziRef, 0, kCFStringTransformStripDiacritics, NO);
    NSLog(@"111---%@",hanziRef);
    

}

//62.设备宽高宏定义
-(void)demo62{
#define  DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
    
#define  DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
    
}

// 63给button 按钮设置背景图片时 设置背景图片大小 防止图片变形
-(void)demo63{
    UIImage *btnImg =[UIImage imageNamed:[NSString stringWithFormat:@"button_table_%@",@"d"]];
    UIImage * bbImg =[btnImg stretchableImageWithLeftCapWidth:100 topCapHeight:100];
    UIButton *btn;
    [btn setBackgroundImage:bbImg forState:UIControlStateNormal];
    

}
// 64 异常崩溃处理





// 65: 去除掉首尾的空白字符和换行字符
-(void)demo65{
    NSString * headerData = [headerData stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
    headerData = [headerData stringByReplacingOccurrencesOfString:@"/r" withString:@""];
    headerData = [headerData stringByReplacingOccurrencesOfString:@"/n" withString:@""];
    

}

// 66为视图view自定义矩形大小
-(void)demo66{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect viewBounds = self.view.bounds;
    float navBarHeight = self.navigationController.navigationBar.frame.size.height + 20;
    viewBounds.size.height = ([[UIScreen mainScreen] bounds].size.height) - navBarHeight;
    self.view.bounds = viewBounds;
}


// 67为视图view自定义矩形大小
-(void)demo67{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect viewBounds = self.view.bounds;
    float navBarHeight = self.navigationController.navigationBar.frame.size.height + 20;
    viewBounds.size.height = ([[UIScreen mainScreen] bounds].size.height) - navBarHeight;
    self.view.bounds = viewBounds;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
