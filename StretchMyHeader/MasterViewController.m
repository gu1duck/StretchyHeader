//
//  MasterViewController.m
//  StretchMyHeader
//
//  Created by Jeremy Petter on 2015-06-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ArticleTableViewCell.h"
#import "NewsItem.h"

@interface MasterViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property NSMutableArray *newsItems;

extern double const kTableHeaderHeight;

@end

@implementation MasterViewController

double const kTableHeaderHeight = 280;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.headerView];
    self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight,0,0,0);
    [self updateHeaderView];
    
    self.newsItems = [@[
                        [NewsItem newsItemWithCategory:world andSubtitle:@"Climate change protests, divestments meet fossil fuels realities"],
                        [NewsItem newsItemWithCategory:europe andSubtitle:@"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"],
                        [NewsItem newsItemWithCategory:middleEast andSubtitle:@"Airstrikes boost Islamic State, FBI director warns more hostages possible"],
                        [NewsItem newsItemWithCategory:africa andSubtitle:@"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"],
                        [NewsItem newsItemWithCategory:asiaPacific andSubtitle:@"Despite UN ruling, Japan seeks backing for whale hunting"],
                        [NewsItem newsItemWithCategory:americas andSubtitle:@"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"],
                        [NewsItem newsItemWithCategory:world andSubtitle:@"South Africa in $40 billion deal for Russian nuclear reactors"],
                        [NewsItem newsItemWithCategory:europe andSubtitle:@"'One million babies' created by EU student exchanges"]
                       ] mutableCopy];
    
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.newsItems) {
        self.newsItems = [[NSMutableArray alloc] init];
    }
    [self.newsItems insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.newsItems[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NewsItem* newsItem = self.newsItems[indexPath.row];
    [cell setupWithNewsItem:newsItem];
    

//    cell.titleLabel.text = @"Test Cell";
//    if (indexPath.row % 2){
//        cell.headlineLabel.text = @"Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus quis purus et tincidunt. Sed in tincidunt lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus quis purus et tincidunt. Sed in tincidunt lacus.";
//    } else {
//        cell.headlineLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus quis purus et tincidunt. Sed in tincidunt lacus.";
//    }
    
//    NSDate *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.newsItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void) updateHeaderView {
    
    if (self.tableView.contentOffset.y < -self.tableView.contentInset.top) {
        CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, self.tableView.contentOffset.y);
        self.headerView.frame = newFrame;
    }
    
    if (self.tableView.contentOffset.y > -self.tableView.contentInset.top) {
            CGRect newFrame = CGRectMake(0, -self.tableView.contentInset.top, self.view.frame.size.width, kTableHeaderHeight);
        NSLog(@"%f",self.tableView.contentOffset.y);
        NSLog(@"%f",self.tableView.contentInset.top);
            self.headerView.frame = newFrame;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self updateHeaderView];
}

@end
