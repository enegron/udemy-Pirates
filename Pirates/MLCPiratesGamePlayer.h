//
//  MLCPiratesGamePlayer.h
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLCPiratesGameWeapon.h"
#import "MLCPiratesGameArmor.h"

@interface MLCPiratesGamePlayer : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) MLCPiratesGameWeapon *weapon;
@property (strong, nonatomic) MLCPiratesGameArmor *armor;


@end
