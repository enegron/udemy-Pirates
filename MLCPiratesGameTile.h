    //
//  MLCPiratesGameTile.h
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLCPiratesGameArmor.h"
#import "MLCPiratesGameWeapon.h"
#import "MLCPiratesGamePlant.h"
    
@interface MLCPiratesGameTile : NSObject

@property (strong, nonatomic) NSString* story;
@property (strong, nonatomic) MLCPiratesGameArmor* armor;
@property (strong, nonatomic) MLCPiratesGameWeapon* weapon;
@property (strong, nonatomic) MLCPiratesGamePlant* plant;

@property (nonatomic) BOOL bossPresent;

@end
