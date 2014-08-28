//
//  GICircleMenu.h
//  Etsuri
//
//  Created by Gigih Iski Prasetyawan on 4/2/14.
//  Copyright (c) 2014 etsuri. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Enum for feed segue
 *
 */
typedef enum FMFeedMenuEnum : int {
    FMERenew = 0,
    FMERespond,
    FMEPublishExtend,
    FMEPublishURL,
    FMETakePhoto,
    FMEPublish
} FMFeedMenuEnum;

@class GIMenu;
@protocol GIMenuDelegate <NSObject>
@optional
- (void) response : (NSIndexPath *) indexPath;
- (void) selectedMenu : (FMFeedMenuEnum) indexMenu;

@required

@end

@interface GICircleMenu : NSObject

@property (nonatomic, strong) UITableView *tableView;

/**
 * selection
 *
 */
@property (nonatomic) FMFeedMenuEnum selection;

/**
 * Delegate
 *
 */
@property (nonatomic, weak) id <GIMenuDelegate> delegate;

/**
 * init with tableview
 *
 */
- (id) initWithTableView:(UITableView *)viewOfTable;

/**
 * remove overlayed menu
 *
 */
- (void) removeMenu;

@property (strong, nonatomic) IBOutlet UIView *view;

@end
