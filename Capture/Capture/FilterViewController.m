//
//  FilterViewController.m
//  Capture
//
//  Created by andrew Mcdonald on 1/20/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCell.h"
#import "SickSlider.h"

//add segment control for choosing front or rear camera
//add target method that changes the camera device
//add methods to allow for video capture and stopping. hint delegate method
//add a UICollectionView to fillerVC (storyboard) at the bottom:
//     take inspiration from instagrams filter scroller (1row of square filters)

//Extra : find out how to flip camera view when changing between front and rear


@interface FilterViewController () <UICollectionViewDataSource, UICollectionViewDelegate,SickSliderDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@property (nonatomic) NSArray * filters;

@property (weak, nonatomic) IBOutlet SickSlider *slider1;

@end

@implementation FilterViewController


-(void)setOriginalImage:(UIImage *)originalImage  {

    NSLog(@"filter image view %@",self.filterImageView); 
    
    self.filterImageView.image = originalImage;
    
    _originalImage = originalImage;
    
}

-(void)sliderDidFinishUpdatingWithValue:(float)value {
    
    NSLog(@"slider is %f",value);
    
}
-(UIImage *)resizeImage:(UIImage *)originalImage withSize:(CGSize)size {
   
    float scale = (originalImage.size.height > originalImage.size.width) ? size.width / originalImage.size.width: size.height / originalImage.size.height;
    
    CGSize ratioSize = CGSizeMake(originalImage.size.width * scale, originalImage.size.height *scale);
    
    
    UIGraphicsBeginImageContextWithOptions(ratioSize, NO, 0.0);
    [originalImage drawInRect:CGRectMake(0, 0, ratioSize.width, ratioSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *) filterImage:(UIImage *)originalImage withFilterName:(NSString *)filterName {

    CIContext * context = [CIContext contextWithOptions:nil];
    
    //CIImage * inputImage = originalImage.CIImage;
    CIImage * inputImage = [[CIImage alloc] initWithCGImage:originalImage.CGImage];
    
   // NSLog(@"%@",inputImage);
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    //[filter setValue:@80 forKey:kCIInputScaleKey];
    
    CIImage * result = [filter valueForKey:kCIOutputImageKey];
    
    CGRect rect = [result extent];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:rect];
    
    return [UIImage imageWithCGImage:cgImage scale:originalImage. scale orientation:originalImage.imageOrientation];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.filterImageView.image = self.originalImage;
    
    self.filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
  
    NSLog(@"%@",self.filters);
    
    self.filterCollectionView.delegate = self;
    self.filterCollectionView.dataSource = self;
    
    self.filterImageView.image = [self filterImage: self.originalImage withFilterName:self.filters[0]];   //dictionary that can house the filters
    self.slider1.delgate = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.filters.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{          //cell from collectionView
    
    FilterCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
   
    
    NSString * filterName = self.filters[indexPath.item];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        UIImage * resizedImage = [self resizeImage:self.originalImage withSize:cell.imageView.frame.size];
        
         UIImage * filterImage = [self filterImage:resizedImage withFilterName:filterName];
    

        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = filterImage;
        
        });
        
    
    });
    
       NSLog(@"%@",filterName);
    
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * filterName = self.filters[indexPath.item];
   
    UIImage * resizedImage = [self resizeImage:self.originalImage withSize:self.filterImageView.frame.size];
    
    UIImage * filterImage = [self filterImage:self.originalImage withFilterName:filterName];

    self.filterImageView.image = filterImage;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
