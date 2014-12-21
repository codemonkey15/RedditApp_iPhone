//
//  MyTableViewController.m
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

NSMutableArray *array;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc] init];
    
    NSDictionary *dict = nil;
    
    //NSLog(@"%@", _jsonData);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSData *json = [_jsonData dataUsingEncoding:NSUTF8StringEncoding];
    
    if(NSClassFromString(@"NSJSONSerialization")){
        NSError *error = nil;
        
        if(json){
            dict = [NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
        }
    }
    
    NSDictionary *dataDic = dict[@"data"];
    
    NSArray *arr = dataDic[@"children"];
    
    
    
    for (NSDictionary *dictionary in arr) {
        
        NSDictionary *subDataDic = dictionary[@"data"];
        
        MyTableViewCell *cell = [[MyTableViewCell alloc] init];
        
        NSString *title = [subDataDic objectForKey:@"title"];
        cell.titleVal = title;
        NSLog(@"Title: %@",title);
        
        
        NSString *author = [subDataDic objectForKey:@"author"];
        cell.authorVal = author;
        NSLog(@"Author: %@",author);
        
        NSString *created = [subDataDic objectForKey:@"created"];
        cell.dateVal = created;
        NSLog(@"Created: %@",created);
        
        NSString *score = [subDataDic objectForKey:@"score"];
        cell.scoreVal = score;
        NSLog(@"Score: %@",score);
        
        [array addObject:cell];
        
    }
    
    
    //for(id key in dict)
     //...........................................   NSLog(@"key=%@ value=%@", key, [dict objectForKey:key]);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell..
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myIdentifier" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myIdentifier"];
    }
    
    MyTableViewCell *cell1 = [array objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = cell1.titleVal;
    cell.authorLabel.text = cell1.authorVal;
    //cell.dateLabel.text = cell1.dateVal;
    //cell.scoreLabel.text = cell1.scoreVal;
    
    //cell.titleLabel.text = @"My Title";
    //cell.authorLabel.text = @"My Author";
    //cell.dateLabel.text = @"createDate";
    //cell.scoreLabel.text = @"100";
    //cell.imageView.image = [UIImage imageNamed:@"redditImg.png"];
    //cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
