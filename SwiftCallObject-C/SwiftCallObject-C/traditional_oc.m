//
//  traditional_oc.m
//  SwiftCallObject-C
//
//  Created by 宋小伟 on 2022/10/10.
//  Copyright © 2022 GarveyCalvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "traditional_oc.h"

const int global_ten = 10;

TrafficLightColor const TrafficLightColorRed = @"Red";
TrafficLightColor const TrafficLightColorYellow = @"Yellow";
TrafficLightColor const TrafficLightColorGreen = @"Green";

Shape const ShapeCircle = 1;
Shape const ShapeTriangle = 2;
Shape const ShapeSquare = 3;

int add(int m, int n) {
    return  m + n;
}

int vsum(int count, va_list numbers) {
    int s = 0, i = 0;
    
    while (i < count) {
        s += va_arg(numbers, int);
        ++i;
    }
    
    return  s;
}

int sum(int count, ...) {
    int s = 0;
    va_list ap;
    
    va_start(ap, count);
    s = vsum(count, ap);
    va_end(ap);
    
    return  s;
}

Location moveX(Location loc, double delta) {
    loc.x += delta;
    
    return loc;
}

Location moveY(Location loc, double delta) {
    loc.y += delta;
    
    return loc;
}

Location createWithXY(double xy) {
    Location loc = { .x = xy, .y = xy };
    
    return loc;
}

Location origin = { .x = 0, .y = 0 };
Location getOrigin() {
    return origin;
}

Location setOrigin(Location newOrigin) {
    origin = newOrigin;
    
    return origin;
}

void printAddress(const int * p) {
    printf("%016lx\n", (unsigned long)p);
}

int doubler(int * p) {
    *p = (*p) * 2;
    
    return *p;
}

void aFuncWithCallBack(void * context, CALLBACK callback) {
    sleep(4);
    callback(context);
}
