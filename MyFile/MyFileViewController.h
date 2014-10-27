//
//  MyFileViewController.h
//  MyFile
//
//  Created by Ehkalu Moo on 10/20/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web;
- (IBAction)LocalPDF:(id)sender;
- (IBAction)ExternalPDF:(id)sender;

@end
