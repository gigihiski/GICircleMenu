//
//  GICircleMenu.m
//  Etsuri
//
//  Created by Gigih Iski Prasetyawan on 4/2/14.
//  Copyright (c) 2014 etsuri. All rights reserved.
//

#import "GICircleMenu.h"

#define BTN_WIDTH 47.0
#define BTN_HEIGHT 65.0

@implementation GICircleMenu {
    BOOL optionButtonON;
    NSDictionary *selected;
    
    UIButton *publishBtn, *renewsBtn, *respondBtn, *takePhotoBtn, *urlBtn, *writeBtn, *backBtn;
}

@synthesize tableView;
@synthesize view;
@synthesize delegate;
@synthesize selection;

- (id) initWithTableView:(UITableView *)viewOfTable {
    if(self = [super init]){
        tableView = viewOfTable;
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
        recognizer.minimumPressDuration = 0.3f;
        [tableView addGestureRecognizer:recognizer];
        
        publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"publish"]
                              forState:UIControlStateNormal];
        [publishBtn addTarget:self action:@selector(publishAction:)
             forControlEvents:UIControlEventTouchUpInside];
        
        renewsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [renewsBtn setBackgroundImage:[UIImage imageNamed:@"renews"]
                             forState:UIControlStateNormal];
        [renewsBtn addTarget:self action:@selector(renewAction:)
            forControlEvents:UIControlEventTouchUpInside];
        
        respondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [respondBtn setBackgroundImage:[UIImage imageNamed:@"respond"]
                              forState:UIControlStateNormal];
        [respondBtn addTarget:self action:@selector(respondAction:)
             forControlEvents:UIControlEventTouchUpInside];
        
        takePhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [takePhotoBtn setBackgroundImage:[UIImage imageNamed:@"take_photo"]
                                forState:UIControlStateNormal];
        [takePhotoBtn addTarget:self action:@selector(takePhotoAction:)
               forControlEvents:UIControlEventTouchUpInside];
        
        urlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [urlBtn setBackgroundImage:[UIImage imageNamed:@"url"]
                          forState:UIControlStateNormal];
        [urlBtn addTarget:self action:@selector(urlAction:)
         forControlEvents:UIControlEventTouchUpInside];
        
        writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [writeBtn setBackgroundImage:[UIImage imageNamed:@"write"]
                            forState:UIControlStateNormal];
        [writeBtn addTarget:self action:@selector(writeAction:)
           forControlEvents:UIControlEventTouchUpInside];
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"backplus"]
                           forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backAction:)
          forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
		CGPoint p = [recognizer locationInView:tableView];
        CGPoint tp = [recognizer locationInView:view];
        NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:p];
        if (indexPath == nil){
            [self createEmptyOptionButtons:tp];
        }
        else{
            [self createOptionButtons:tp];
            [delegate response:indexPath];
        }
	}
}

-(void)createOptionButtons:(CGPoint)midPoint{
    optionButtonON = TRUE;
    float pointX = -25;
    float pointY = -15;
    
    midPoint.x = midPoint.x;
    midPoint.y = midPoint.y;
    
    publishBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    respondBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    renewsBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    
    writeBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    takePhotoBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    urlBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    
    backBtn.frame = CGRectMake(midPoint.x + pointX, midPoint.y + pointY, BTN_WIDTH, BTN_WIDTH);
    
    backBtn.alpha = 0.2;
    publishBtn.alpha = 0.2;
    respondBtn.alpha = 0.2;
    renewsBtn.alpha = 0.2;
    
    writeBtn.alpha = 0;
    takePhotoBtn.alpha = 0;
    urlBtn.alpha = 0;
    
    [self.view addSubview:publishBtn];
    [self.view addSubview:respondBtn];
    [self.view addSubview:renewsBtn];
    
    [self.view addSubview:backBtn];
    [self.view addSubview:writeBtn];
    [self.view addSubview:takePhotoBtn];
    [self.view addSubview:urlBtn];
    
    CGRect pf = CGRectMake(midPoint.x - 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect ref = CGRectMake(midPoint.x + pointX, midPoint.y - 100.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect rnf = CGRectMake(midPoint.x + 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    
    CGRect wf = CGRectMake(midPoint.x - 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect tf = CGRectMake(midPoint.x + pointX, midPoint.y - 100.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect uf = CGRectMake(midPoint.x + 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    
    [UIView animateWithDuration:0.2 animations:^{
        //
        publishBtn.frame = pf;
        respondBtn.frame = ref;
        renewsBtn.frame = rnf;
        
        writeBtn.frame = wf;
        takePhotoBtn.frame = tf;
        urlBtn.frame = uf;
        
        publishBtn.alpha = 1;
        respondBtn.alpha = 1;
        renewsBtn.alpha = 1;
    }];
    
}

-(void)createEmptyOptionButtons:(CGPoint)midPoint{
    optionButtonON = TRUE;
    float pointX = -25;
    float pointY = -15;
    
    midPoint.x = midPoint.x;
    midPoint.y = midPoint.y;
    
    publishBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    
    writeBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    takePhotoBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    urlBtn.frame = CGRectMake(midPoint.x, midPoint.y, BTN_WIDTH, BTN_HEIGHT);
    
    backBtn.frame = CGRectMake(midPoint.x + pointX, midPoint.y + pointY, BTN_WIDTH, BTN_WIDTH);
    
    backBtn.alpha = 0.2;
    publishBtn.alpha = 0.2;
    
    writeBtn.alpha = 0;
    takePhotoBtn.alpha = 0;
    urlBtn.alpha = 0;
    
    [self.view addSubview:publishBtn];
    
    [self.view addSubview:backBtn];
    [self.view addSubview:writeBtn];
    [self.view addSubview:takePhotoBtn];
    [self.view addSubview:urlBtn];
    
    CGRect pf = CGRectMake(midPoint.x + pointX, midPoint.y - 100.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    
    CGRect wf = CGRectMake(midPoint.x - 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect tf = CGRectMake(midPoint.x + pointX, midPoint.y - 100.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    CGRect uf = CGRectMake(midPoint.x + 70.0 + pointX, midPoint.y - 50.0 + pointY, BTN_WIDTH, BTN_HEIGHT);
    
    [UIView animateWithDuration:0.2 animations:^{
        //
        publishBtn.frame = pf;
        
        writeBtn.frame = wf;
        takePhotoBtn.frame = tf;
        urlBtn.frame = uf;
        
        publishBtn.alpha = 1;
        respondBtn.alpha = 1;
    }];
    
}

-(void)removeOptionButton{
    optionButtonON = NO;
    [publishBtn removeFromSuperview];
    [renewsBtn removeFromSuperview];
    [respondBtn removeFromSuperview];
    [takePhotoBtn removeFromSuperview];
    [urlBtn removeFromSuperview];
    [writeBtn removeFromSuperview];
    [backBtn removeFromSuperview];
}

#pragma mark - OptionButton Action

- (void)backAction:(id)sender {
    if(!optionButtonON){
        optionButtonON = YES;
        [UIView animateWithDuration:0.3 animations:^{
            publishBtn.alpha = 1;
            respondBtn.alpha = 1;
            renewsBtn.alpha = 1;
            
            writeBtn.alpha = 0;
            takePhotoBtn.alpha = 0;
            urlBtn.alpha = 0;
            
            backBtn.alpha = 0.2;
        }];
    } else {
        [self removeOptionButton];
    }
}

- (void) removeMenu {
    [self removeOptionButton];
}

- (void)renewAction:(id)sender {
    [self removeOptionButton];
    [self setSelection:FMERenew];
    
    [delegate selectedMenu:FMERenew];
}

- (void)respondAction:(id)sender {
    [self removeOptionButton];
    [self setSelection:FMERenew];
    
    [delegate selectedMenu:FMERespond];
}

- (void)publishAction:(id)sender {
    optionButtonON = NO;
    [UIView animateWithDuration:0.3 animations:^{
        publishBtn.alpha = 0;
        respondBtn.alpha = 0;
        renewsBtn.alpha = 0;
        
        writeBtn.alpha = 1;
        takePhotoBtn.alpha = 1;
        urlBtn.alpha = 1;
        
        backBtn.alpha = 1;
        [self setSelection:FMEPublishExtend];
        
        [delegate selectedMenu:FMEPublishExtend];
    }];
}

- (void)urlAction:(id)sender {
    [self removeOptionButton];
    [self setSelection:FMEPublishURL];
    
    [delegate selectedMenu:FMEPublishURL];
}

- (void)takePhotoAction:(id)sender {
    [self removeOptionButton];
    [self setSelection:FMETakePhoto];
    
    [delegate selectedMenu:FMETakePhoto];
}

- (void)writeAction:(id)sender {
    [self removeOptionButton];
    [self setSelection:FMEPublish];
    
    [delegate selectedMenu:FMEPublish];
}

@end
