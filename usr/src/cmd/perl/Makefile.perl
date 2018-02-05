#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#
#
# Copyright (c) 2014 Racktop Systems.
# Copyright 2015, OmniTI Computer Consulting, Inc. All rights reserved.
#

include $(SRC)/lib/Makefile.lib

# PERL_VERSION and PERL_ARCH used to be set here,
# but as they were also needed in usr/src/pkg/Makefile,
# the definition was moved to usr/src/Makefile.master

# Do some macro substitution to figure out if PERL is inside the ADJUNCT_PROTO
# area so that the build uses includes and libraries from the ADJUNCT_PROTO if
# that is where PERL is located.
_PERL_ADJUNCT_PROTO=$(PERL:$(ADJUNCT_PROTO)%=$(ADJUNCT_PROTO))
PERL_ADJUNCT_PROTO=$(_PERL_ADJUNCT_PROTO:$(PERL)=)

PERLDIR = $(PERL_ADJUNCT_PROTO)$(PERL_PREFIX)
PERLLIBDIR = $(PERL_ADJUNCT_PROTO)$(PERL_ARCHLIB)
PERLINCDIR = $(PERLLIBDIR)/CORE

PERLMOD = $(MODULE).pm
PERLEXT = $(MACH)/$(MODULE).so

ROOTPERLDIR = $(ROOT)$(PERL_PREFIX)
ROOTPERLLIBDIR = $(ROOT)$(PERL_ARCHLIB)
ROOTPERLMODDIR = $(ROOTPERLLIBDIR)/Sun/Solaris
ROOTPERLEXTDIR = $(ROOTPERLLIBDIR)/auto/Sun/Solaris/$(MODULE)

ROOTPERLMOD = $(ROOTPERLMODDIR)/$(MODULE).pm
ROOTPERLEXT = $(ROOTPERLEXTDIR)/$(MODULE).so

CSTD = $(CSTD_GNU99)
