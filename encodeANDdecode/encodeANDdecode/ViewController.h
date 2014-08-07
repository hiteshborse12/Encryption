//
//  ViewController.h
//  encodeANDdecode
//
//  Created by Genie Technology on 22/03/14.
//  Copyright (c) 2014 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *plaintxtfield;
- (IBAction)encrypt:(id)sender;
- (IBAction)decryptbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *encryptlbl;
@property (strong, nonatomic) IBOutlet UITextView *decryptlbl;



@end
