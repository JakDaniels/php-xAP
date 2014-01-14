%module xAP
%{
#define LINUX 1
#include "xaplib/xapdef.h"
#include "appdef.h"
%}
#define LINUX 1
%include "xaplib/xapdef.h"
%include "appdef.h"
