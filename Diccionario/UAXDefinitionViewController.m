//
//  UAXDefinitionViewController.m
//  Diccionario
//
//  Created by Juan Jose Ramirez Escribano on 9/1/15.
//  Copyright (c) 2015 UAX. All rights reserved.
//

#import "UAXDefinitionViewController.h"

@interface UAXDefinitionViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) NSString *word;

@end

@implementation UAXDefinitionViewController

- (instancetype)initWithWord:(NSString*)word
{
    self = [super init];
    if (self) {
        self.word = word;
        self.title = [NSString stringWithFormat:@"Visualizando palabra %@", word];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.browser.delegate = self;
    
    [self loadWord:self.word];
}

- (void)loadWord:(NSString*)word {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://lema.rae.es/drae/srv/search?val=%@", word]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.browser loadRequest:request];
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    __block UAXDefinitionViewController *weakSelf = self;
    [UIView animateWithDuration:1.0f animations:^{
        weakSelf.loading.alpha = 0.0f;
    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    __block UAXDefinitionViewController *weakSelf = self;
    [UIView animateWithDuration:1.0f animations:^{
        weakSelf.loading.alpha = 1.0f;
    }];
}

#pragma mark - Words delegate

- (void)wordSelected:(NSString *)word {
    [self loadWord:word];
}


















@end
