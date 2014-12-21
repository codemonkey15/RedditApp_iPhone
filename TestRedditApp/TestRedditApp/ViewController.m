//
//  ViewController.m
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.searchTextField.delegate = self;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MyTableViewController *svc = [segue destinationViewController];
    svc.jsonData = _result;
}

- (IBAction)searchButtonPressed:(id)sender {
    //NSLog(self.searchTextField.text);
    NSString *ReqURLStr = [@"http://www.reddit.com/r/pics/search.json?q=" stringByAppendingString: self.searchTextField.text];
    NSLog(@"%@", ReqURLStr);
    NSLog(@"---------");
    NSURLRequest *Request = [NSURLRequest requestWithURL:[NSURL URLWithString:ReqURLStr]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:Request returningResponse: &resp error: &error];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    _result = responseString;
    NSLog(@"%@", responseString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (bool)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

@end
