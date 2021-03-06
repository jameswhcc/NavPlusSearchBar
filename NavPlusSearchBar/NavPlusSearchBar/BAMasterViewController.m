//
//  BAMasterViewController.m
//  NavPlusSearchBar
//
//  Created by James Nelson on 9/25/13.
//  Copyright (c) 2013 DogBone. All rights reserved.
//

#import "BAMasterViewController.h"

#import "BADetailViewController.h"

@interface BAMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation BAMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
#warning - For UISearchBarStyleProminent
///*
    self.navigationController.navigationBar.translucent = NO;
    self.searchDisplayController.searchBar.translucent = NO;
    self.searchDisplayController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.searchDisplayController.searchBar.backgroundColor = [UIColor redColor];
    
    UIView *view = self.searchDisplayController.searchBar.subviews.firstObject;
    UIView *background = view.subviews.firstObject;
    
    CGRect rect = background.frame;
    rect.size.height += 20;
    UIView *newBackground = [[UIView alloc] initWithFrame:rect];
    newBackground.backgroundColor= [UIColor redColor];
    [background addSubview:newBackground];
//*/
#warning - For UISearchBarStyleMinimal
/*
 
    self.navigationController.navigationBar.translucent = NO;
    self.searchDisplayController.searchBar.translucent = NO;
    self.searchDisplayController.searchBar.backgroundColor = [UIColor grayColor];
    self.searchDisplayController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    UIView *view = self.searchDisplayController.searchBar.subviews.firstObject;
    UIView *background = view.subviews.firstObject;
    
    CGRect rect = background.frame;
    rect.size.height += 20;
    UIView *newBackground = [[UIView alloc] initWithFrame:rect];
    newBackground.backgroundColor= [UIColor redColor];
    [background addSubview:newBackground];
    
//*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    
    float r, g, b;
    r = random()%2;
    g = random()%155+100;
    b = random()%50+100;
    
    cell.backgroundColor = [UIColor colorWithRed:r/255.f green:g/255.f blue:g/255.f alpha:1.0];
    
    r = random()%155+100;
    g = random()%155+100;
    b = random()%155+100;
    cell.textLabel.textColor = [UIColor colorWithRed:r/255.f green:g/255.f blue:g/255.f alpha:1.0];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
