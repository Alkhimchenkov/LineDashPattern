//
//  TableViewCell.m
//  LineDashPattern
//
//  Created by Андрей on 29.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "TableViewCell.h"
#import "Constatns.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    NSLog(@"CELL internal bounds: %@", NSStringFromCGRect(self.bounds));
    //    [self.viewComponent setFrame:self.bounds];
    NSLog(@"CELL viewComponent bounds: %@", NSStringFromCGRect(self.viewComponent.bounds));
    //    [self removeLayerByName:@"BorderLayer" view:self.viewComponent];
    //    [self.viewComponent.layer addSublayer:[self lineDashPattern:self.viewComponent]];
    [super layoutSubviews];
    NSLog(@"CELL internal bounds: %@", NSStringFromCGRect(self.bounds));
    CGRect frame = CGRectMake(self.bounds.origin.x + 5, self.bounds.origin.y + 5,
                              self.bounds.size.width - 10, self.bounds.size.height - 5);
    [self.viewComponent setFrame:frame];
    NSLog(@"CELL viewComponent bounds: %@", NSStringFromCGRect(self.viewComponent.bounds));
    [self removeLayerByName:@"BorderLayer" view:self.viewComponent];
    [self.viewComponent.layer addSublayer:[self lineDashPattern:self.viewComponent]];

}

//- (CAShapeLayer*)lineDashPattern:(UIView*)cellView
//{
//    CAShapeLayer *border = [CAShapeLayer layer];
//    border.name = @"BorderLayer";
//    border.fillColor = nil;
//    border.path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:10.0].CGPath;
//    border.frame = cellView.bounds;
//    
//    border.strokeColor = UIColorFromHEX(COLOR_MAIN).CGColor;
//    border.lineWidth = 4;
//    border.lineDashPattern = @[@15];
//    
//    return border;
//}
//
//
//- (void)removeLayerByName:(NSString*)layerNameToRemove view:(UIView*)myView
//{
//    for (CAShapeLayer *childLayer in [myView.layer sublayers]) {
//        if ([childLayer.name isEqualToString:layerNameToRemove]) {
//            [childLayer removeFromSuperlayer];
//            break;
//        }
//    }
//}



-(CAShapeLayer*)lineDashPattern:(UIView*)cellView{
    
    
    //    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //    UIBezierPath *path = [UIBezierPath bezierPath];
    //    //draw a line
    //    [path moveToPoint:CGPointMake(0.0, cell.frame.size.height)]; //add yourStartPoint here
    //    [path addLineToPoint:CGPointMake(cell.frame.size.width, cell.frame.size.height)];// add yourEndPoint here
    //    UIColor *fill = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f];
    //    shapelayer.strokeStart = 0.0;
    //    shapelayer.strokeColor = fill.CGColor;
    //    shapelayer.lineWidth = 1.0;
    //    shapelayer.lineJoin = kCALineJoinRound;
    //    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:3 ], nil];
    //    //    shapelayer.lineDashPhase = 3.0f;
    //    shapelayer.path = path.CGPath;
    
    
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.name = @"ArroundLayer";
    border.fillColor = [UIColor clearColor].CGColor;
    
    border.strokeColor = UIColorFromHEX(COLOR_MAIN).CGColor;
    //    border.strokeStart = 0.0;
    border.lineWidth = 4;
    border.lineJoin=kCALineJoinRound;
    border.frame = cellView.bounds;
    border.lineDashPattern = @[@8];
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    [path moveToPoint:CGPointMake(0.0, 0.0)]; //add yourStartPoint here
//    [path addLineToPoint:CGPointMake(cellView.frame.size.width, 0.0)];// add yourEndPoint here
//    
//    [path moveToPoint:CGPointMake(0.0, cellView.frame.size.height)]; //add yourStartPoint here
//    [path addLineToPoint:CGPointMake(cellView.frame.size.width, cellView.frame.size.height)];// add yourEndPoint here
//    
//    [path moveToPoint:CGPointMake(0.0, 0.0)]; //add yourStartPoint here
//    [path addLineToPoint:CGPointMake(0.0, cellView.frame.size.height)];// add yourEndPoint here
//    
//    [path moveToPoint:CGPointMake(cellView.frame.size.width, 0.0)]; //add yourStartPoint here
//    [path addLineToPoint:CGPointMake(cellView.frame.size.width, cellView.frame.size.height)];// add yourEndPoint here
    
    
    //   path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:5.0];
    
 //   border.path = path.CGPath;
    
      border.path = [UIBezierPath bezierPathWithRoundedRect:cellView.bounds cornerRadius:10.0].CGPath;
    
    return border;
}


- (void)removeLayerByName:(NSString *)layerNameToRemove view:(UIView*)myView
{
    for (CAShapeLayer *childLayer in [myView.layer sublayers]) {
        if ([childLayer.name isEqualToString:layerNameToRemove]) {
            [childLayer removeFromSuperlayer];
            break;
        }
    }
}


@end
