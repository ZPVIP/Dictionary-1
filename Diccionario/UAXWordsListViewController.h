//
//  UAXWordsListViewController.h
//  Diccionario
//
//  Created by Juan Jose Ramirez Escribano on 9/1/15.
//  Copyright (c) 2015 UAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UAXWordListViewControllerDelegate
- (void)wordSelected:(NSString*)word;
@end

@interface UAXWordsListViewController : UITableViewController
@property (weak, nonatomic) id<UAXWordListViewControllerDelegate> delegate;

@end
