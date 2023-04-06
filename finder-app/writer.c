// Assignment 1: writer.c
// Author: Cherelei Banzon

#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
//   printf("The quick brown fox jumps over the lazy dog near the bank of the river.\n");

   openlog(NULL, 0, LOG_USER);
	syslog(LOG_INFO, "writer.c: Start Logging");

   if (argc != 3) {
	   syslog(LOG_ERR, "Invalid Number of arguments: %d", argc);
		closelog();
		exit(1);
	} else {
	   syslog(LOG_INFO, "Filename: %s", argv[1]);
		syslog(LOG_INFO, "Text    : %s", argv[2]);
	}

   FILE *fptr;

	fptr = fopen(argv[1], "w");

	if (fptr == NULL) {
	   syslog(LOG_ERR, "The file could not be opened: %s", argv[1]);
		closelog();
		exit(1);
	}

	fprintf(fptr, "%s", argv[2]);

	if (ferror(fptr)) {
	   syslog(LOG_ERR, "Error writing in file: %s", argv[1]);
		closelog();
		exit(1);
	} else {
	   syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
	}

	fclose(fptr);
   closelog();

   return 0;
}
