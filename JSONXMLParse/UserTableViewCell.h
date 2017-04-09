//
//  UserTableViewCell.h
//  JSONXMLParse
//
//  Created by Balu Naik on 4/7/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel *userNamelbl;
@property (weak, nonatomic) IBOutlet UILabel *descrptLbltext;

@end
