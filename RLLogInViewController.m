//
//  RLLogInViewController.m
//  RegLogIn
//
//  Created by student on 02-06-14.
//  Copyright (c) 2014 RL. All rights reserved.
//

#import "RLLogInViewController.h"
#import <Parse/Parse.h>

@interface RLLogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation RLLogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
      [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.emailTextField.text password:self.passwordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login succeeded!"
                                                                                                message:@"Have Fun!"
                                                                                               delegate:self
                                                                                      cancelButtonTitle:@"OK"
                                                                                      otherButtonTitles:nil];
                                            [alertView show];
                                            
                                            // Do stuff after successful login.
                                            self.emailTextField.text = user.username;
                                            self.passwordTextField.text = @"password";
                                            self.emailTextField.enabled = false;
                                            self.passwordTextField.enabled = false;
                                            
                                        } else {
                                            // The login failed. Check error to see why.
                                            self.emailTextField.enabled = true;
                                            self.passwordTextField.enabled = true;
                                            
                                            NSString *errorString = [error userInfo][@"error"];
                                            
                                            
                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login Failed!"
                                                                                                message:errorString
                                                                                               delegate:nil
                                                                                      cancelButtonTitle:@"OK"
                                                                                      otherButtonTitles:nil];
                                            
                                            [alertView show];
                                            
                                            
                                        }
                                    }];
    
}


@end
