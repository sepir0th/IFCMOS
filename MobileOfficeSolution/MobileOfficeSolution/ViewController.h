//
//  ViewController.h
//  MobileOfficeSolution
//
//  Created by Erwin Lim  on 10/12/16.
//  Copyright © 2016 Erwin Lim InfoConnect. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Login.h"
#import "CarouselViewController.h"

@interface ViewController : UIViewController<LoginDelegate, CarouselDelegate >{
    Login *_Login;
    CarouselViewController *_CVC;
}
@property (nonatomic, retain) Login *Login;
@property (nonatomic, retain) CarouselViewController *CVC;
@property (nonatomic, assign,readwrite) int sss;

@end
