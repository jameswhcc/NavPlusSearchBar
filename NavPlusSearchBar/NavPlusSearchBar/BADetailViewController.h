//
//  BADetailViewController.h
//  NavPlusSearchBar
//
//  Created by James Nelson on 9/25/13.
//  Copyright (c) 2013 DogBone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BADetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
