//
//  SPAJPDFWebViewController.h
//  BLESS
//
//  Created by Basvi on 8/8/16.
//  Copyright © 2016 InfoConnect Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HtmlGenerator.h"

@interface SPAJPDFWebViewController : HtmlGenerator{
    NSString *filePath;
}
@property (strong, nonatomic) NSDictionary* dictTransaction;

@end
