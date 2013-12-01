//
//  ViewController.m
//  BRParallaxCollectionView
//
//  Created by Jesús on 30/11/13.
//  Copyright (c) 2013 Jesús. All rights reserved.
//

#import "ViewController.h"

static NSInteger const tagCellLabel = 100;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *svBackground;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"bgImage.jpg"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    iv.frame = (CGRect){.origin = CGPointZero, .size = img.size};
    [_svBackground addSubview:iv];
    [_svBackground setContentSize:img.size];
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _collectionView) {
        CGFloat pageSize = CGRectGetWidth(scrollView.bounds);
        CGFloat scrollRatio = (_svBackground.contentSize.width - pageSize) / (scrollView.contentSize.width - pageSize);
        _svBackground.contentOffset = CGPointMake(scrollRatio * scrollView.contentOffset.x , 0);
    }
}

#pragma mark UICollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [(UILabel*)[cell viewWithTag:tagCellLabel] setText:[NSString stringWithFormat:@"View %d", indexPath.row + 1]];
    return cell;
}



@end
