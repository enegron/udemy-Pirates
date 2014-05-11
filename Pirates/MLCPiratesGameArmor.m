//
//  MLCPiratesGameArmor.m
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import "MLCPiratesGameArmor.h"

@implementation MLCPiratesGameArmor

-(void) newArmorNamed:(NSString*)name hasBonus:(int)bonus{
    self.name = name;
    self.bonus = bonus;
}

@end
