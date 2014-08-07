//
//  ViewController.m
//  encodeANDdecode
//
//  Created by Genie Technology on 22/03/14.
//  Copyright (c) 2014 Genie Soft Systems. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>
#import "FBEncryptorAES.h"
@interface ViewController ()
{
    NSString *plainString;
    NSString *base64String;
    NSString *output;    
}
@property (nonatomic, retain) IBOutlet UISwitch* separateline;
@property (strong, nonatomic) IBOutlet UITextField *encryptkey;
@property (strong, nonatomic) IBOutlet UITextField *decryptkey;

@end

@implementation ViewController
@synthesize plaintxtfield,encryptlbl,decryptlbl,encryptkey,decryptkey;

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

- (IBAction)encrypt:(id)sender
{
    [plaintxtfield resignFirstResponder];
    [encryptkey resignFirstResponder];
    [decryptkey resignFirstResponder];
  
    
    plainString = plaintxtfield.text;
    NSLog(plainString);
    output = [FBEncryptorAES encryptBase64String:plainString
                                                    keyString:self.encryptkey.text
                                                separateLines:[self.separateline isOn]];
    NSLog(@"MYENCRYPT: %@", output);
    
    encryptlbl.text=output;
    
 
}

- (IBAction)decryptbtn:(id)sender
{
    [plaintxtfield resignFirstResponder];
    [encryptkey resignFirstResponder];
    [decryptkey resignFirstResponder];
    
    NSString* msg = [FBEncryptorAES decryptBase64String:encryptlbl.text
                                              keyString:self.decryptkey.text];
    
     NSLog(@"MYDECRYPT: %@",msg);
    if([msg isEqualToString:@""])
    {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Check Key" delegate:Nil cancelButtonTitle:@"Try agin" otherButtonTitles:nil];
        [alt show];
    }
    else
    {
    decryptlbl.text=msg;
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;

}
@end
