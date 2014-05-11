//
//  MLCPiratesGameViewController.h
//  Pirates
//
//  Created by Eric Negron on 4/27/14.
//  Copyright (c) 2014 Eric Negron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLCPiratesGameTile.h"
#import "MLCPiratesGamePlayer.h"

@interface MLCPiratesGameViewController : UIViewController

@property (strong, nonatomic) MLCPiratesGamePlayer* player;
@property (strong, nonatomic) MLCPiratesGamePlayer* boss;


@property (strong, nonatomic) IBOutlet UILabel *playerHealthLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerDamageLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerArmorLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerWeaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorBonusLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponBonusLabel;

@property (nonatomic) int gameBoardRows;
@property (nonatomic) int gameBoardColumns;

@property (strong, nonatomic) NSArray* gameBoard;

@property (nonatomic) int currentRow;
@property (nonatomic) int currentColumn;

@property (strong, nonatomic) IBOutlet UILabel *currentRowLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentColumnLabel;


@property (strong, nonatomic) MLCPiratesGameTile* currentTile;

@property (strong, nonatomic) IBOutlet UILabel *currentTilesStoryLabel;
@property (strong, nonatomic) IBOutlet UIButton *tileAction;
- (IBAction)tileActionPress:(UIButton *)sender;



@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;

- (IBAction)upButton:(UIButton *)sender;
- (IBAction)downButton:(UIButton *)sender;
- (IBAction)leftButton:(UIButton *)sender;
- (IBAction)rightButton:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *resetButton;
- (IBAction)resetButtonPressed:(UIButton *)sender;


-(void) updateCurrentPositionLabel;
-(void) updatePlayerStats;

-(void) initializeGame;


@end
