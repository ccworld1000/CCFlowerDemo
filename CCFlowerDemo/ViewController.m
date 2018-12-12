//
//  ViewController.m
//  CCFlowerDemo
//
//  Created by dengyouhua on 2018/12/12.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCFlowerDemo

#import "ViewController.h"
#import "CCFlower.h"
#import "UIImage+buffer.h"

@interface ViewController ()

@property (nonatomic, strong) CCFlower *flower;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flower = [CCFlower new];
    
    UIImage *image = [UIImage imageNamed:@"h"];
    self.imageView1.image = image;
    
    UIImage *image2 = [UIImage imageNamed:@"rose"];
    self.imageView2.image = image2;
    

    CVPixelBufferRef buffer = [image buffer];
    
    CCFlowerOutput *output = [self.flower predictionFromData:buffer error:nil];

    NSString * classLabel = output.classLabel;
    double per = [output.prob[classLabel] doubleValue] * 100;
    self.text1.text = [NSString stringWithFormat:@"It's a %@ at %ld%%", classLabel, (NSInteger) per];
    
    CVPixelBufferRelease(buffer);
    
    buffer = [image2 buffer];
    output = [self.flower predictionFromData:buffer error:nil];
    classLabel = output.classLabel;
    per = [output.prob[classLabel] doubleValue] * 100;
    self.text2.text = [NSString stringWithFormat:@"It's a %@ at %ld%%", classLabel, (NSInteger) per];
    
    CVPixelBufferRelease(buffer);
}


@end
