# Linux System Commands

mkdir - make a directory
cd - change directory
![Pasted image 20230117232405](Attachments/Pasted%20image%2020230117232405.png)
cat - used to conCATenate a file. can be used to view the output of a file, create a file, and add text to a file.
![Pasted image 20230117232534](Attachments/Pasted%20image%2020230117232534.png)
ls - lists all files
![Pasted image 20230117231553](Attachments/Pasted%20image%2020230117231553.png)
ls -l - lists all files in long form
![Pasted image 20230117231638](Attachments/Pasted%20image%2020230117231638.png)
ls -lh - lists long form in human readable format
![Pasted image 20230117231831](Attachments/Pasted%20image%2020230117231831.png)
ls -ld - Used to see permissions for a directory
![Pasted image 20230117231912](Attachments/Pasted%20image%2020230117231912.png)
ls -a - used to see a list of all files, including hidden files
![Pasted image 20230117232048](Attachments/Pasted%20image%2020230117232048.png)
whoami - used to see current user
![Pasted image 20230117232238](Attachments/Pasted%20image%2020230117232238.png)
pwd - used to see Present Working Directory
![Pasted image 20230117232306](Attachments/Pasted%20image%2020230117232306.png)

chmod -Change file access permissions.
![Pasted image 20230118200703](Attachments/Pasted%20image%2020230118200703.png)
chown - Change ownership of the file.
![Pasted image 20230118201032](Attachments/Pasted%20image%2020230118201032.png)
chgrp - Change the group ownership of the file
![Pasted image 20230118201213](Attachments/Pasted%20image%2020230118201213.png)
cal - displays calendar
![Pasted image 20230117231026](Attachments/Pasted%20image%2020230117231026.png)
ps - report a snapshot of current processes
![Pasted image 20230117231158](Attachments/Pasted%20image%2020230117231158.png)
pstree - see process tree
![Pasted image 20230117231124](Attachments/Pasted%20image%2020230117231124.png)
# System Calls
```c
#include<unistd.h>
#include<stdio.h>
#include<fcntl.h>

int main()
{
int fd;
char buffer[80];
char msg[50] = "hello TSEC Assignments";
fd = open ("check.txt", O_RDWR);
printf("fd = %d", fd);
if (fd != -1)
{
printf("\n check.txt opened with read write access\n");
write(fd, msg, sizeof(msg));
lseek(fd,0,SEEK_SET);
read(fd, buffer, sizeof(msg));
printf("\n %s was written to my file \n", buffer);
close(fd);
}

return 0;
}

// Compile and execute this program by typing 'gcc -o readwriteopenclose readwriteopenclose.c' and then ./readwriteopenclose
```

![Pasted image 20230118212107](Attachments/Pasted%20image%2020230118212107.png)
# Processor ID

```c
  /* CELEBG20

   This example provides information for your user ID.

 */
#define _POSIX_SOURCE
#include <pwd.h>
#include <sys/types.h>
#include <unistd.h>

main() {
  struct passwd *p;
  uid_t  uid;

  if ((p = getpwuid(uid = getuid())) == NULL)
    perror("getpwuid() error");
  else {
    puts("getpwuid() returned the following info for your userid:");
    printf("  pw_name  : %s\n",       p->pw_name);
    printf("  pw_uid   : %d\n", (int) p->pw_uid);
    printf("  pw_gid   : %d\n", (int) p->pw_gid);
    printf("  pw_dir   : %s\n",       p->pw_dir);
    printf("  pw_shell : %s\n",       p->pw_shell);

    printf("Process ID of this program is = %d\n", getpid());
    printf("User ID of this program is = %d\n", getuid());
    printf("Effective User ID is = %d\n", (int) geteuid());
    printf("Group ID is = %d\n", (int) getgid());
    printf("Effective Group ID is = %d\n", (int) getegid());


    printf("Process Group ID = %d\n", getpgrp());
    printf("Parent Process ID = %d\n", getppid());
    printf("PGID = %d\n", getpgid());
  }
}
```

![Pasted image 20230124202139](Attachments/Pasted%20image%2020230124202139.png)

# Sort, Grep, AWK

Sort
![Pasted image 20230117224552](Attachments/Pasted%20image%2020230117224552.png)

grep
![Pasted image 20230117225745](Attachments/Pasted%20image%2020230117225745.png)

awk
![Pasted image 20230117230126](Attachments/Pasted%20image%2020230117230126.png)