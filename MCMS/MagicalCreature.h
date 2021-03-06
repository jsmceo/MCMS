//
//  MagicalCreature.h
//  MCMS
//
//  Created by John Malloy on 1/14/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Accessory.h"

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *description;
@property UIImage *image;
@property NSMutableArray *accessories;

@end
