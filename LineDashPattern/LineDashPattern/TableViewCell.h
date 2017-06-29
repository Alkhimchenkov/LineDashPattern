//
//  TableViewCell.h
//  LineDashPattern
//
//  Created by Андрей on 29.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageCell;
@property (strong, nonatomic) IBOutlet UILabel *txtHeader;
@property (strong, nonatomic) IBOutlet UILabel *txtDetail;
@property (strong, nonatomic) IBOutlet UIView *viewComponent;

@end
