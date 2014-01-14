//
//  ViewController.m
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITextField *magicalCreatureTextField;
    __weak IBOutlet UITableView *myTableView;
    NSMutableArray *creatures;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	creatures = [NSMutableArray array];
    MagicalCreature *creature = [MagicalCreature new];
    creature.name = @"Dracula Don";
    [creatures addObject:creature];
}

- (void)viewDidAppear:(BOOL)animated
{
    [myTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"MCMSID"];
    MagicalCreature *myCreature = [creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = myCreature.name;
    
    return cell;
}

- (IBAction)onAddButtonPressed:(id)sender
{
    MagicalCreature *creature = [MagicalCreature new];
    creature.name = magicalCreatureTextField.text;
    [creatures addObject:creature];
    magicalCreatureTextField.text = @"";
    [myTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *myCreatureViewController = segue.destinationViewController;
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    myCreatureViewController.creature = creatures[indexPath.row];
}

@end
