//
//  FriendDetailVC.m
//  GithubFriends
//
//  Created by andrew Mcdonald on 1/8/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "FriendDetailVC.h"

// Add Property to thes class.h called "friendInfo"

//Grab the request code from NewFriendVC.m

//change the url to https  ://api.github.com/users/USERNAME/repos

// make USERNAME dynamic based on friendinfo[@"login"]

// the return will be an NsArray of repos

// log the repos array

//  EXTRA

// make selecting a cell push to FriendDetailVC
//and set friend
@interface FriendDetailVC () <UITableViewDelegate,UITableViewDataSource>



@end

@implementation FriendDetailVC
{
    NSArray * repos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *username = self.friendInfo[@"login"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos",username];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",repos);
    
    UITableView * tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 368)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    

    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = [[ UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
  //  NSDictionary * repoInfo = repos[indexPath.row];
  //  cell.textLabel.text = reoInfo[@'name'];
    
    //same thing above as below!!!!!!!!!!!!!!!!
    
    
    cell.textLabel.text = repos[indexPath.row][@"name"];
    if (repos[indexPath.row][@"description"] == [NSNull null]) {
            
    }else {
        

    cell.detailTextLabel.text =repos [indexPath.row][@"description"];
    
    }
        return cell;
}


//NSString *username = usernameField.text;


//NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@",username];

//NSURL * url = [NSURL URLWithString:urlString];

//NSURLRequest *request = [NSURLRequest requestWithURL:url];

//NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end