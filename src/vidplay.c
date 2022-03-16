#include <stdio.h>
#include <string.h>
#include <tgi.h>
#include "version.h"

extern void play();



unsigned char version_opt=0;
unsigned char help_opt=0;

void version()
{
  printf("vidplay %s\n",VERSION);
}

void usage()
{
  printf("usage:\n");
  printf("vidplay FILE.vhi : ");
  printf("Play a video\n");
  printf("--help\n");
  printf("--version\n");
  printf("\n\nCode : Jede (jede@oric.org)\n");
  return;
}

unsigned char getopts(char *arg)
{
  // 2: arg is not an option
  if (arg[0]!='-') return 2;
  if (strcmp(arg,"--version")==0 || strcmp(arg,"-v")==0) 
  {
    version_opt=1;
    return 0;
  }
  
  if (strcmp(arg,"--help")==0 || strcmp(arg,"-h")==0) 
  {
    help_opt=1;
    return 0;
  }  

  return 1;
  
}

int main(int argc,char *argv[])
{
  FILE *fp;

  unsigned char header[20];
  unsigned int sizeframe=0;
  unsigned int numberofframes=0;

  unsigned char i,ret,found_a_folder_in_arg_found=0;

  if (argc==2 || argc==3)
  {
    for (i=1;i<argc;i++)
    {
      ret=getopts(argv[i]);
      if (ret==1) 
      {
        //this is a parameter but not recognized
        usage();
        return 1;
      }
      if (ret==2) 
      {
        //theses are to stop if we have 2 folders on commands line, in the future it will bepossible
        if (found_a_folder_in_arg_found==0) 
            found_a_folder_in_arg_found=1;
        else
        {
          // here we found 2 folders on the command line
          usage();
          return 1;
        }
      }
    }
  }
    else
    {
      usage();
      return 1;
    }

  if (version_opt==1)
  {
    version();
    return 0;
  }
  
  if (help_opt==1)
  {
    usage();
    return 0;
  }  

fp=fopen(argv[1],"r");
if (fp==NULL)  
{
  printf("Can't open %s\n",argv[1]);
  return 0;
}

tgi_install (tgi_static_stddrv);

tgi_init ();
tgi_clear ();
printf("Playing ... : %s ",argv[1]); 

//fread(header, 8, 1, fp );
/*
sizeframe=header[6]+header[7]*256;
numberofframes=header[4]+header[5]*256;
*/
/*
printf("Playing ... : %s sizeframe : %d",argv[1],sizeframe); 

while (1)
fread(0xa000, sizeframe, 1, fp );    
  */

play();
fclose(fp);
  
	
}
