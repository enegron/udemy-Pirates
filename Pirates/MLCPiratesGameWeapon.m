//
//  MLCPiratesGameWeapon.m
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import "MLCPiratesGameWeapon.h"

@implementation MLCPiratesGameWeapon

-(void) newWeaponNamed:(NSString*)name hasBonus:(int)bonus{
    self.name = name;
    self.bonus = bonus;
}

@end
