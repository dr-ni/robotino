#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/time.h>

//oneshot example

#define INTERVAL 2              // number of seconds to go off

void TimerStop(int signum) {
    printf("Timer ran out! Stopping timer\n");
}

void TimerSet(int interval) {
    printf("starting timer\n");
    struct itimerval it_val;

    it_val.it_value.tv_sec = interval;
    it_val.it_value.tv_usec = 0;
    it_val.it_interval.tv_sec = 0;
    it_val.it_interval.tv_usec = 0;

    if (signal(SIGALRM, TimerStop) == SIG_ERR) {
        perror("Unable to catch SIGALRM");
        exit(1);
    }
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        perror("error calling setitimer()");
        exit(1);
    }
}

int main(int argc, char *argv[]) {

    TimerSet(INTERVAL);

    while (1) {
        // do stuff
    }
    return 0;
}


//multiple

/* 
#define INTERVAL 10
int count=0; 
int howmany = 0;
void alarm_wakeup (int i)
{
   struct itimerval tout_val;
   signal(SIGALRM,alarm_wakeup);
   howmany += INTERVAL;
   printf("\n%d sec up partner, Wakeup!!!\n",howmany);
   tout_val.it_interval.tv_sec = 0;
   tout_val.it_interval.tv_usec = 0;
   tout_val.it_value.tv_sec = INTERVAL; // 10 seconds timer
   tout_val.it_value.tv_usec = 0;
   setitimer(ITIMER_REAL, &tout_val,0);
}
 
void exit_func (int i)
{
    signal(SIGINT,exit_func);
    printf("\nBye Bye!!!\n");
    exit(0);
}
 
int main ()
{
  struct itimerval tout_val;
  
  tout_val.it_interval.tv_sec = 0;
  tout_val.it_interval.tv_usec = 0;
  //Configure the timer to expire after 10 sec...
  tout_val.it_value.tv_sec = INTERVAL; // 10 seconds timer
  tout_val.it_value.tv_usec = 0;
  setitimer(ITIMER_REAL, &tout_val,0);
 
  signal(SIGALRM,alarm_wakeup); // set the Alarm signal capture //
  signal(SIGINT,exit_func);
   
  while (1)
  {
    ;;
  } 
  return 0;
}
*/
