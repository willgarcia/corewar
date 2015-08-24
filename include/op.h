/* Instruction constraints */

/* Authorized characters */
#define LABEL_CHARS             "abcdefghijklmnopqrstuvwxyz_0123456789"

/* Number of arguments per instruction, 0->MAX_ARGS_NUMBER */
#define ARGS_MAX_NUMBER         4
/* Arguments separator */
#define ARGS_SEPARATOR          ','

/* Type of parameter: register (eg: ld r1,r2) */
#define REG_NUMBER              16

/* Type of parameter: direct, require a value/label (eg: ld % :label, r7) */
#define DIRECT_CHAR             '%'
