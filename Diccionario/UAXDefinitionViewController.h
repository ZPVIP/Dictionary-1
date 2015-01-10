//
//  UAXDefinitionViewController.h
//  Diccionario
//
//  Created by Juan Jose Ramirez Escribano on 9/1/15.
//  Copyright (c) 2015 UAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAXWordsListViewController.h"

@interface UAXDefinitionViewController : UIViewController<UAXWordListViewControllerDelegate>

- (instancetype)initWithWord:(NSString*)word;

@end
