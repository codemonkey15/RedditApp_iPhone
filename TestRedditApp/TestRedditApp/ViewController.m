//
//  ViewController.m
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.searchTextField.delegate = self;
    
    self.searchButton.layer.cornerRadius = 5.0f;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MyTableViewController *svc = [segue destinationViewController];
    NSData *jsonData = [_result dataUsingEncoding:NSUTF8StringEncoding];

    if(NSClassFromString(@"NSJSONSerialization")){
        NSError *error = nil;
        
        if(jsonData){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//            NSLog(@"jsonData: %@", dict);
//            NSLog(@"list: %@", [[dict objectForKey:@"data"] objectForKey:@"children"]);
//            svc.resultsDict = [NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
            svc.resultsArray = [[dict objectForKey:@"data"] objectForKey:@"children"];
        }
    }
    
//    svc.jsonData = _result;
}

- (IBAction)searchButtonPressed:(id)sender {
    //NSLog(self.searchTextField.text);
    if(self.searchTextField.text.length > 0) {
        NSString *ReqURLStr = [@"http://www.reddit.com/r/pics/search.json?q=" stringByAppendingString: self.searchTextField.text];
        NSLog(@"%@", ReqURLStr);
        NSLog(@"---------");
        NSURLRequest *Request = [NSURLRequest requestWithURL:[NSURL URLWithString:ReqURLStr]];
        NSURLResponse *resp = nil;
        NSError *requestError = nil;
        NSData *response = [NSURLConnection sendSynchronousRequest:Request returningResponse: &resp error: &requestError];
//        NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
//        _result = responseString;
        
        NSError *error = nil;
        
//        if(jsonData){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
            //            NSLog(@"jsonData: %@", dict);
            //            NSLog(@"list: %@", [[dict objectForKey:@"data"] objectForKey:@"children"]);
            //            svc.resultsDict = [NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
        MyTableViewController *myTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTableVC"];
        myTableVC.searchTerm = self.searchTextField.text;
        myTableVC.resultsArray = [[dict objectForKey:@"data"] objectForKey:@"children"];
        [self.navigationController pushViewController:myTableVC animated:YES];
//        }
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Search text is empty, please enter a search keyword" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
//    NSLog(@"%@", responseString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

@end
