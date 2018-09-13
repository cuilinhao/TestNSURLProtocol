//
//  ViewController.m
//  MOBTestNSURLProtocol
//
//  Created by 崔林豪 on 2018/9/13.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

#pragma mark -  生命周期 Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)btnClick:(id)sender
{
    [self sendRequest];
}

#pragma mark - request
- (void) sendRequest
{
    
    NSString *text = self.textField.text;
    if (![text isEqualToString:@""]) {
        
        NSURL *url = [NSURL URLWithString:text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

#pragma mark - AFN重定向

- (IBAction)changeBtn:(id)sender
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //http://httpbin.org
    [manager GET:@"http://www.baidu.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *bookInfo = (NSDictionary*)responseObject;
        NSLog(@"------->>>>>>bookInfo:%@",bookInfo);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"------->>>>>>request faile:%@",error.description);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
