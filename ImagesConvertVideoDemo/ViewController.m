//
//  ViewController.m
//  ImagesConvertVideoDemo
//
//  Created by HN on 2021/5/18.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SDWebImageDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getImages];
}

// 获取图片
- (void)getImages {
    NSArray *imageUrlArray = @[@"https://video.cnhnb.com/video/mp4/douhuo/2021/04/08/eee7cdbba8cb4d9b8d2ab6d6b2ac9c09.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/24/59fa99dc757a4d44b3a09e5fdcd9d6e3.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/miniapp/2021/03/20/8664f5edc73e4d6891caeb4aa14ee337.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/10/d9167b1041cb49a2bb2d897ee7676c3c.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/04/15e1e854bf6b4b98ba2cb9b5528fb976.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/04/998b644962364ede9a4d8d1af45f77e3.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/04/4bf8820c6a4d4c0482ca0d9dc271f096.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/03/a6f9789ec7ba42a4b67fa7b29647bd1a.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/03/1cc646c8b5ad4e34b75a89292cc1a792.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/03/7459674e847d49e7ab8337fe56d53d55.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/03/86f1d849dca44bc3bcb3bdd4e158f9e9.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/03/01/da48b9687dd34a3a881347e0fc28fd04.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/02/07/875d17111b534655b7b42cbbb97c647b.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/01/23/bf7869316294442eb8ede7fe7e9ac022.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2021/01/09/d64965c85ab64389b0b4ee7c39b4ae97.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/10/7499e5f4ce864b2c884abf3af6112f56.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/10/281c5a0dd5a049aeba1172909e7f4b5f.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/09/be22d76796b240f1b31b54d9f0088f23.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/09/58a4fc9cb83e4a268411245058f88ab1.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/09/b3ea7bb36ed044f18bff0ab8ac887fa0.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/08/c9f597f0eed347d2ac5fa3d8b7e23a1c.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/08/50946c1619db414cac166cd785102593.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/07/7031b25dfbe54d189140afd45a2adb91.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/07/4d03585b5b084934922434fd1f2b2ad2.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/03/2fbf4adeabbd4e08b1e91c22947922ab.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/03/a199d9bf2d044dad9f28825ad1a8a646.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/03/e3d14bb89a25458288279f984acd0c08.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/05/24/05b961c7053e4de0b891da0261b4a9c3.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/05/24/05b961c7053e4de0b891da0261b4a9c3.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/02/a23c36a1e7394155ad72b870043ac1cb.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/02/33cd3487bff44a4eb5eb758d84016a0c.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/02/0cd41b6ed8644034a2381170951ef374.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/9d8b6aa31f82458ab3f25c4c6f89d7cd.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/4ab29480f8574c7d9ac1241ef3aeb46a.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/c976d53a98474ad992c995bfcc04964a.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/ac932e96d1b143dc8bf1ca9b3743c9e9.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/91a42a30a930442295439f12dd3945f5.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/12/01/765eb88274144fb1a7785fabfd88b56e.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/6f43df7ab5bd43778aae14a1770259e7.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/2e40d10db91249eb8fa1b5c60c47ccde.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/fcd0485552c94e4a9410787f8d8e6475.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/0c6e8fb2afe742e1bc67d26f93d7650a.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/aa8a13c7c54c465684b903c07788d2c7.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/803a7f7582c2413c8f65b5218d629bdc.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/8b31fbe739fc4c06908348825728a86e.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/30/ae025ed6b9204f979d2ee2e8e529fd21.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/28/c413d199e5c04b3fbc33a98c08131145.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/11/28/6fbb69ee2f3442f4a3484acaae567c14.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/07/24/c0a54c07d3ed4eaca88cb573c9ff4244.mp4?vframe/jpg/offset/0/",
                               @"https://video.cnhnb.com/video/mp4/douhuo/2020/07/24/e8a94fc443494c11b4db57be9949f9e7.mp4?vframe/jpg/offset/0/"];
    //下载图片
    [self downloadImages:imageUrlArray completion:^(NSArray *resultArray) {
        NSMutableArray *items = [NSMutableArray new];
        for(int i=0;i<resultArray.count;i++) {
            NSObject *obj = [resultArray objectAtIndex:i];
            if([obj isKindOfClass:[UIImage class]]) {
                //只取UIImage对象，其他类型忽略之
                [items addObject:obj];
            }
        }
        if (resultArray.count) {
            [self testCompressionSession:resultArray];
        }
    }];
}

#pragma mark- 按钮点击操作
//视频合成按钮点击操作
- (void)testCompressionSession:(NSArray *)imageArray {
    //设置mov路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *moviePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mov",@"test"]];
    //定义视频的大小320 480 倍数
    CGSize size = CGSizeMake(320,480);
    NSError *error = nil;
    //    转成UTF-8编码
    unlink([moviePath UTF8String]);
    NSLog(@"path->%@",moviePath);
    //     iphone提供了AVFoundation库来方便的操作多媒体设备，AVAssetWriter这个类可以方便的将图像和音频写成一个完整的视频文件
    AVAssetWriter *videoWriter = [[AVAssetWriter alloc]initWithURL:[NSURL fileURLWithPath:moviePath]fileType:AVFileTypeQuickTimeMovie error:&error];
    NSParameterAssert(videoWriter);
    if(error) {
        NSLog(@"error =%@",[error localizedDescription]);
        return;
    }
    //mov的格式设置 编码格式 宽度 高度
    NSDictionary *videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:AVVideoCodecTypeH264,AVVideoCodecKey,
                                   [NSNumber numberWithInt:size.width],AVVideoWidthKey,
                                   [NSNumber numberWithInt:size.height],AVVideoHeightKey,nil];
    AVAssetWriterInput *writerInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo outputSettings:videoSettings];
    NSDictionary *sourcePixelBufferAttributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:kCVPixelFormatType_32ARGB],kCVPixelBufferPixelFormatTypeKey,nil];
    //    AVAssetWriterInputPixelBufferAdaptor提供CVPixelBufferPool实例,
    //    可以使用分配像素缓冲区写入输出文件。使用提供的像素为缓冲池分配通常
    //    是更有效的比添加像素缓冲区分配使用一个单独的池
    AVAssetWriterInputPixelBufferAdaptor *adaptor = [AVAssetWriterInputPixelBufferAdaptor assetWriterInputPixelBufferAdaptorWithAssetWriterInput:writerInput sourcePixelBufferAttributes:sourcePixelBufferAttributesDictionary];
    NSParameterAssert(writerInput);
    NSParameterAssert([videoWriter canAddInput:writerInput]);
    if([videoWriter canAddInput:writerInput]){
        NSLog(@"11111");
    } else {
        NSLog(@"22222");
    }
    [videoWriter addInput:writerInput];
    [videoWriter startWriting];
    [videoWriter startSessionAtSourceTime:kCMTimeZero];
    //合成多张图片为一个视频文件
    dispatch_queue_t dispatchQueue = dispatch_queue_create("mediaInputQueue",NULL);
    int __block frame = 0;
    [writerInput requestMediaDataWhenReadyOnQueue:dispatchQueue usingBlock:^{
        while([writerInput isReadyForMoreMediaData]) {
            if(++frame >= [imageArray count]) {
                [writerInput markAsFinished];
                [videoWriter finishWritingWithCompletionHandler:^{
                    NSLog(@"完成");
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                        self.ww_progressLbe.text = @"视频合成完毕";
                    }];
                    
                }];
                break;
            }
            CVPixelBufferRef buffer = NULL;
            int idx = frame;
//            NSString *progress = [NSString stringWithFormat:@"%0.2lf",idx / (CGFloat)[imageArr count]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                //                self.ww_progressLbe.text = [NSString stringWithFormat:@"合成进度:%@",progress];
            }];
            
            buffer = (CVPixelBufferRef)[self pixelBufferFromCGImage:[[imageArray objectAtIndex:idx]CGImage]size:size];
            if(buffer){
                //设置每秒钟播放图片的个数
                if(![adaptor appendPixelBuffer:buffer withPresentationTime:CMTimeMake(frame,25)]) {
                    NSLog(@"FAIL");
                } else {
//                    NSLog(@"OK");
                }
                CFRelease(buffer);
            }
        }
    }];
}

- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image size:(CGSize)size {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES],kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES],kCVPixelBufferCGBitmapContextCompatibilityKey,nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault,size.width,size.height,kCVPixelFormatType_32ARGB,(__bridge CFDictionaryRef) options,&pxbuffer);
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    CVPixelBufferLockBaseAddress(pxbuffer,0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata !=NULL);
    CGColorSpaceRef rgbColorSpace=CGColorSpaceCreateDeviceRGB();
    //    当你调用这个函数的时候，Quartz创建一个位图绘制环境，也就是位图上下文。当你向上下文中绘制信息时，Quartz把你要绘制的信息作为位图数据绘制到指定的内存块。一个新的位图上下文的像素格式由三个参数决定：每个组件的位数，颜色空间，alpha选项
    CGContextRef context = CGBitmapContextCreate(pxdata,size.width,size.height,8,4*size.width,rgbColorSpace,kCGImageAlphaPremultipliedFirst);
    NSParameterAssert(context);
    //使用CGContextDrawImage绘制图片  这里设置不正确的话 会导致视频颠倒
    //    当通过CGContextDrawImage绘制图片到一个context中时，如果传入的是UIImage的CGImageRef，因为UIKit和CG坐标系y轴相反，所以图片绘制将会上下颠倒
    CGContextDrawImage(context,CGRectMake(0,0,CGImageGetWidth(image),CGImageGetHeight(image)), image);
    // 释放色彩空间
    CGColorSpaceRelease(rgbColorSpace);
    // 释放context
    CGContextRelease(context);
    // 解锁pixel buffer
    CVPixelBufferUnlockBaseAddress(pxbuffer,0);
    return pxbuffer;
}

/**
 批量下载图片
 保持顺序;
 全部下载完成后才进行回调;
 回调结果中,下载正确和失败的状态保持与原先一致的顺序;
 */
- (void)downloadImages:(NSArray<NSString *> *)imgsArray completion:(void(^)(NSArray *resultArray))completionBlock {
    SDWebImageDownloader *manager = [SDWebImageDownloader sharedDownloader];
    //    manager.downloadTimeout = 20;
    __block NSMutableDictionary *resultDict = [NSMutableDictionary new];
    for(int i=0;i<imgsArray.count;i++) {
        NSString *imgUrl = [imgsArray objectAtIndex:i];
        [manager downloadImageWithURL:[NSURL URLWithString:imgUrl]
                              options:SDWebImageDownloaderUseNSURLCache|SDWebImageDownloaderScaleDownLargeImages
                             progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            if(finished){
                if(error){
                    //在对应的位置放一个error对象
                    [resultDict setObject:error forKey:@(i)];
                }else{
                    [resultDict setObject:image forKey:@(i)];
                }
                if(resultDict.count == imgsArray.count) {
                    //全部下载完成
                    NSArray *resultArray = [self createDownloadResultArray:resultDict count:imgsArray.count];
                    if(completionBlock){
                        completionBlock(resultArray);
                    }
                }
            }
        }];
    }
}

- (NSArray *)createDownloadResultArray:(NSDictionary *)dict count:(NSInteger)count {
    NSMutableArray *resultArray = [NSMutableArray new];
    for(int i=0;i<count;i++) {
        NSObject *obj = [dict objectForKey:@(i)];
        [resultArray addObject:obj];
    }
    return resultArray;
}

@end
