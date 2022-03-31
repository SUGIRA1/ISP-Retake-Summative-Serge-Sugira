# simulate traffic at a junction
This program simulates traffic flow at a junction

When coming up with the algorithm, I considered that we have the following combinations for traffic.
1) Cars allowed to move from North to South and South to North. 
2) Cars allowed to move from North to West and South to East
3) Cars allowed to move from East to West and West to East
4) Cars allowed to move from East to North and West to South

I created different structs for holding different states such as lights and flow.

In the flow method, I check the currently open path and allow cars to move from that direction.

For the demo purposes, the time for traffic flow per flow has been set to 10 seconds. 

# running
Run the program using ```gcc main.c``` then ```./a.out```.
