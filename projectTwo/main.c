#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

extern void starterTraffic();
extern void switcherTraffic(void);

#define trafficSetter_0 0
#define trafficSetter_1 1
#define trafficSetter_2 2
#define trafficSetter_3 3

// time for traffic to flow
#define TIMER 10

// enums
typedef enum
{
    false,
    true
} bool;

// lights enum
typedef enum
{
    Red,
    Green
} lights;

// traffic pattern and flow enum
typedef enum
{
    northToWestSouthToEast,
    northToSouthSouthToNorth,
    EastToNorthWestToSouth,
    EastToWestWestToEast,
    MAX
} flow;

typedef struct
{
    bool checkTraffic;
    lights trafficLight;
} Lane;

typedef struct
{
    Lane laneThrough;
    Lane laneTurn;
} Road;

static flow trafficState;

int testCase;

static void lightsClear(void);
static void lightsUpdate(void);
static Road North, South, East, West;

// this method is used to clear the lights and set them to red
static void lightsClear(void)
{
    North.laneThrough.trafficLight = Red;
    North.laneTurn.trafficLight = Red;
    South.laneThrough.trafficLight = Red;
    South.laneTurn.trafficLight = Red;
    East.laneThrough.trafficLight = Red;
    East.laneTurn.trafficLight = Red;
    West.laneThrough.trafficLight = Red;
    West.laneTurn.trafficLight = Red;
};

/* Update traffic Lights according to flow*/
static void lightsUpdate(void)
{
    lightsClear();

    // open lights depend on traffic pattern
    switch (trafficState)
    {
    case northToWestSouthToEast:
        North.laneTurn.trafficLight = Green;
        South.laneTurn.trafficLight = Green;
        break;

    case northToSouthSouthToNorth:
        North.laneThrough.trafficLight = Green;
        South.laneThrough.trafficLight = Green;
        break;

    case EastToNorthWestToSouth:
        East.laneTurn.trafficLight = Green;
        West.laneTurn.trafficLight = Green;
        break;

    case EastToWestWestToEast:
        East.laneThrough.trafficLight = Green;
        West.laneThrough.trafficLight = Green;
        break;

    default:
        break;
    }
};

/* Initialize road info*/
void starterTraffic()
{
    int value = 0;

    if (trafficSetter_1 <= value && value < trafficSetter_3)
    {
        testCase = value;
    }
    else
    {
        testCase = 0;
    }
    trafficState = northToWestSouthToEast;
    lightsUpdate();
};

/* Monitors traffic conditions for the intersections and
set the traffic signal accordingly*/
void switcherTraffic(void)
{
    if (trafficState == 0)
    {
        printf("Started monitoring\n");
    }

    // check the current green light and let cars move
    if (trafficState == northToWestSouthToEast)
    { // variables being checked
        printf("\nCars going from north to west and south to east ... \n");
        // show timer
        for (int i = TIMER; i > 0; i--)
        {
            printf("%d ", i);
            fflush(stdout);
            sleep(1);
        }
        goto next_junction;
    }
    else if (trafficState == northToSouthSouthToNorth)
    {
        printf("\n\nCars going from north to south and south to north ... \n");
        // show timer
        for (int i = TIMER; i > 0; i--)
        {
            printf("%d ", i);
            fflush(stdout);
            sleep(1);
        }
        goto next_junction;
    }
    else if (trafficState == EastToNorthWestToSouth)
    {
        printf("\n\nCars going from east to north and west to south ... \n");
        // show timer
        for (int i = TIMER; i > 0; i--)
        {
            printf("%d ", i);
            fflush(stdout);
            sleep(1);
        }
        goto next_junction;
    }
    else if (trafficState == EastToWestWestToEast)
    {
        printf("\n\nCars going from east to west and west to east ... \n");
        // show timer
        for (int i = TIMER; i > 0; i--)
        {
            printf("%d ", i);
            fflush(stdout);
            sleep(1);
        }
        goto next_junction;
    }

    return;

// open the next junction
next_junction:
    trafficState = (trafficState + trafficSetter_1) % MAX;
    lightsUpdate();
};

// main
int main(int argc, char *argv[])
{
    starterTraffic();

    while (1)
    {
        switcherTraffic();
    };

    return 0;
}