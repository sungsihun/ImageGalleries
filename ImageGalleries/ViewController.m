//
//  ViewController.m
//  ImageGalleries
//
//  Created by NICE on 2018-08-13.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView1;
@property (nonatomic, weak) UIImageView *imageView2;
@property (nonatomic, weak) UIImageView *imageView3;
@property (nonatomic) NSMutableArray* imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArray = [[NSMutableArray alloc] init];
    
    // image 1
    UIImage *image1 = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = YES;
    self.imageView1 = imageView1;
    [self.scrollView addSubview:self.imageView1];
    
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;

    
    [self.imageView1.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.imageView1.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.imageArray addObject:image1];
    
    


    // image 2
    UIImage *image2 = [UIImage imageNamed:@"Lighthouse-night.jpg"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    self.imageView2 = imageView2;
    [self.scrollView addSubview:self.imageView2];

    self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView2.leadingAnchor constraintEqualToAnchor:self.imageView1.trailingAnchor].active = YES;

    
    [self.imageView2.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.imageView2.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.imageArray addObject:image2];




    // image 3
    UIImage *image3 = [UIImage imageNamed:@"Lighthouse-zoomed"];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:image3];
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.clipsToBounds = YES;
    self.imageView3 = imageView3;
    [self.scrollView addSubview:self.imageView3];

    self.imageView3.translatesAutoresizingMaskIntoConstraints = NO;

    [self.imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView3.leadingAnchor constraintEqualToAnchor:self.imageView2.trailingAnchor].active = YES;
    [self.imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    [self.imageView3.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.imageView3.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.imageArray addObject:image3];

    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.scrollView addGestureRecognizer:tapGesture];
    
}

- (void)tapAction:(UIImage*)sender {
    int imageIndex = self.scrollView.contentOffset.x / self.imageView1.frame.size.width;
    UIImage *tappedImage = self.imageArray[imageIndex];
    [self performSegueWithIdentifier:@"tapActionSegue" sender:tappedImage];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImage*)sender {
    if ([[segue identifier] isEqualToString:@"tapActionSegue"]) {
        
        DetailViewController *detailViewController = ((DetailViewController *)segue.destinationViewController);
        detailViewController.tappedImage = sender;
        NSLog(@"%@", sender);
        NSLog(@"%@", detailViewController.tappedImage);
    }
}



@end
