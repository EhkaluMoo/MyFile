//
//  MyFileViewController.m
//  MyFile
//
//  Created by Ehkalu Moo on 10/20/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "MyFileViewController.h"

@interface MyFileViewController ()

@end

@implementation MyFileViewController
@synthesize web;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [web release];
    [super dealloc];
}
- (IBAction)btnLocalPDF:(id)sender {
    [self loadlocalFile];
}
- (IBAction)btnExternalPDF:(id)sender {
    [self loadexternalFile];
    
}
- (void)loadlocalFile
{
    //check if iphone or ipad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"angrybirds" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        [web loadRequest:request];
        
        
    }
    
    else {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"angrybirds" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [web loadRequest:request];
        
    }
    
    
}

- (void)loadexternalFile
{
    
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        //check if iphone or ipad
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            NSURL *targetURL = [NSURL URLWithString:@"http://ckonkol.com/wp-content/uploads/2013/02/How-to-share-your-Apps-over-Air-for-Testers.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [web loadRequest:request];
            
        }
        
        else {
            
            NSURL *targetURL = [NSURL URLWithString:@"http://ckonkol.com/wp-content/uploads/2013/02/How-to-share-your-Apps-over-Air-for-Testers.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [web loadRequest:request];
            
        }
        
        
    }
    
    
    
}
- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}
- (BOOL) checkinternet
{
    //check internet connection
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
}
@end
