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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITextField *magicalCreatureTextField;
    
}

@end

@implementation ViewController
@synthesize creatures, myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	creatures = [NSMutableArray array];
    MagicalCreature *creature = [MagicalCreature new];
    creature.accessories = [NSMutableArray array];
    creature.name = @"Dracula Don";
    creature.description = @"Likes blood, dislikes syntax errors";
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"Dracula" ofType:@"jpeg" inDirectory:@"Images"];
    creature.image = [UIImage imageWithContentsOfFile:imagePath];
    [creatures addObject:creature];
    MagicalCreature *creature2 = [MagicalCreature new];
    creature2.accessories = [NSMutableArray array];
    creature2.name = @"Frankenstein Fred";
    creature2.description = @"Sensitive, and emotional";
    imagePath = [[NSBundle mainBundle] pathForResource:@"Frankenstein" ofType:@"jpeg" inDirectory:@"Images"];
    creature2.image = [UIImage imageWithContentsOfFile:imagePath];
    [creatures addObject:creature2];
    MagicalCreature *creature3 = [MagicalCreature new];
    creature3.accessories = [NSMutableArray array];
    creature3.name = @"Cookie Monster";
    creature3.description = @"Eats anything, but prefers cookies";
    imagePath = [[NSBundle mainBundle] pathForResource:@"CookieMonster" ofType:@"jpeg" inDirectory:@"Images"];
    creature3.image = [UIImage imageWithContentsOfFile:imagePath];
    [creatures addObject:creature3];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", myCreature.name, myCreature.description];
    
    return cell;
}

- (IBAction)onAddButtonPressed:(id)sender
{
    MagicalCreature *creature = [MagicalCreature new];
    creature.name = magicalCreatureTextField.text;
    [creatures addObject:creature];
    magicalCreatureTextField.text = @"";
    [myTableView reloadData];
    [magicalCreatureTextField resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showSegue"]) {
        CreatureViewController *myCreatureViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
        myCreatureViewController.creature = creatures[indexPath.row];
    }
    if ([segue.identifier isEqualToString:@"BattleSegue"]) {
        BattleViewController *myBattleViewController = segue.destinationViewController;
        
        int random = (arc4random() % creatures.count);
        myBattleViewController.creature1 = [creatures objectAtIndex:random];
        
        BOOL duplicate = YES;
        while (duplicate) {
            int newRandom = arc4random() % creatures.count;
            if (newRandom != random) {
                myBattleViewController.creature2 = [creatures objectAtIndex:newRandom];
                duplicate = NO;
            }
        }
    }
}

@end
