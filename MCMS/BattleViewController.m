//
//  BattleViewController.m
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "BattleViewController.h"
#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"
#import "Accessory.h"

@interface BattleViewController ()
{
    __weak IBOutlet UIImageView *firstPlayerImage;
    __weak IBOutlet UIImageView *secondPlayerImage;
    __weak IBOutlet UITextField *firstPlayerName;
    __weak IBOutlet UITextField *firstPlayerAccessoryOne;
    __weak IBOutlet UITextField *firstPlayerAccessoryTwo;
    __weak IBOutlet UITextField *secondPlayerName;
    __weak IBOutlet UITextField *secondPlayerAccessoryOne;
    __weak IBOutlet UITextField *secondPlayerAccessoryTwo;
    __weak IBOutlet UILabel *firstPlayerMaxPoints;
    __weak IBOutlet UILabel *secondPlayerMaxPoints;
    __weak IBOutlet UILabel *firstWinOrLoseLabel;
    __weak IBOutlet UILabel *secondWinOrLoseLabel;
    Accessory *accessory1;
    Accessory *accessory2;
    Accessory *accessory21;
    Accessory *accessory22;
    
}

@end

@implementation BattleViewController
@synthesize creature1, creature2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstPlayerImage.image = creature1.image;
    firstPlayerName.text = creature1.name;

    accessory1 = [creature1.accessories objectAtIndex:0];
    accessory2 = [creature1.accessories objectAtIndex:1];
    
    firstPlayerAccessoryOne.text = [NSString stringWithFormat:@"%@ (%i)", accessory1.name, accessory1.strength];
    firstPlayerAccessoryTwo.text = [NSString stringWithFormat:@"%@ (%i)", accessory2.name, accessory2.strength];

    firstPlayerMaxPoints.text = [NSString stringWithFormat:@"%i", (accessory1.strength + accessory2.strength)];
    
    secondPlayerImage.image = creature2.image;
    secondPlayerName.text = creature2.name;
    
    accessory21 = [creature2.accessories objectAtIndex:0];
    accessory22 = [creature2.accessories objectAtIndex:1];
    
    secondPlayerAccessoryOne.text = [NSString stringWithFormat:@"%@ (%i)", accessory21.name, accessory21.strength];
    secondPlayerAccessoryTwo.text = [NSString stringWithFormat:@"%@ (%i)", accessory22.name, accessory22.strength];
    
    secondPlayerMaxPoints.text = [NSString stringWithFormat:@"%i", (accessory21.strength + accessory22.strength)];
}

- (IBAction)onFightButtonPressed:(id)sender {
    int firstPlayerStrike = (arc4random()%(accessory1.strength + accessory2.strength)) + 1;
    int secondPlayerStrike = (arc4random()%(accessory21.strength + accessory22.strength)) + 1;
    
    firstPlayerMaxPoints.text = [NSString stringWithFormat:@"%i", firstPlayerStrike];
    secondPlayerMaxPoints.text = [NSString stringWithFormat:@"%i", secondPlayerStrike];
    
    if (firstPlayerStrike > secondPlayerStrike) {
        firstWinOrLoseLabel.text = @"Winner!";
        firstWinOrLoseLabel.textColor = [UIColor greenColor];
        secondWinOrLoseLabel.text = @"Loser!";
        secondWinOrLoseLabel.textColor = [UIColor redColor];
    } else if (firstPlayerStrike < secondPlayerStrike) {
        firstWinOrLoseLabel.text = @"Loser!";
        firstWinOrLoseLabel.textColor = [UIColor redColor];
        secondWinOrLoseLabel.text = @"Winner!";
        secondWinOrLoseLabel.textColor = [UIColor greenColor];
    } else {
        firstWinOrLoseLabel.text = @"Draw";
        firstWinOrLoseLabel.textColor = [UIColor yellowColor];
        secondWinOrLoseLabel.text = @"Draw";
        secondWinOrLoseLabel.textColor = [UIColor yellowColor];
    }
    firstWinOrLoseLabel.hidden = NO;
    secondWinOrLoseLabel.hidden = NO;
    firstPlayerImage.alpha = 0.25;
    secondPlayerImage.alpha = 0.25;
}

@end
