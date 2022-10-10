//
//  traditional_oc.h
//  SwiftCallObject-C
//
//  Created by 宋小伟 on 2022/10/10.
//  Copyright © 2022 GarveyCalvin. All rights reserved.
//

#ifndef traditional_oc_h
#define traditional_oc_h

#import <Foundation/Foundation.h>

const int global_ten;


typedef NSString * TrafficLightColor NS_STRING_ENUM;

TrafficLightColor const TrafficLightColorRed;
TrafficLightColor const TrafficLightColorYellow;
TrafficLightColor const TrafficLightColorGreen;

typedef int Shape NS_EXTENSIBLE_STRING_ENUM;

Shape const ShapeCircle;
Shape const ShapeTriangle;
Shape const ShapeSquare;

int add(int, int);

int sum(int, ...);
int vsum(int, va_list);

typedef struct {
    double x, y;
} Location;

Location moveX(Location, double) CF_SWIFT_NAME(Location.moveX(self:delta:));
Location moveY(Location, double);

Location createWithXY(double xy) CF_SWIFT_NAME(Location.init(xy:));
Location getOrigin(void) CF_SWIFT_NAME(getter:Location.origin());
Location setOrigin(Location newOrigin) CF_SWIFT_NAME(setter:Location.origin(newOrigin:));

typedef union {
    char character;
    int code;
} ASCII;

typedef struct{
    union {
        char model;
        int series;
    };
    
    struct {
        double pricing;
        bool isAvalable;
    } info;
} Car;

typedef NS_ENUM(int, TraffcLightColor) {
    RED, YELLOW, GREEN
};

void printAddress(const int *);
int doubler(int *);

typedef  void (*CALLBACK)(void *);
void aFuncWithCallBack(void * context, CALLBACK);

#endif /* traditional_oc_h */
