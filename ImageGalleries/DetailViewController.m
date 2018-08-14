//
//  DetailViewController.m
//  ImageGalleries
//
//  Created by NICE on 2018-08-13.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *detailViewScrollView;
@property (nonatomic, weak) UIImageView *detailImageView;


@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *detailImageView = [[UIImageView alloc] initWithImage:self.tappedImage];
    detailImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.detailImageView = detailImageView;
    [self.detailViewScrollView addSubview:self.detailImageView];
    
    self.detailImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.detailImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.detailImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.detailImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.detailImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
    self.detailViewScrollView.delegate = self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.detailImageView;
}



@end
