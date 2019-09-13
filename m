Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp839132wrp;
        Fri, 13 Sep 2019 07:46:09 -0700 (PDT)
X-Received: by 2002:aca:538a:: with SMTP id h132mr3591926oib.66.1568385969330;
        Fri, 13 Sep 2019 07:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568385969; cv=none;
        d=google.com; s=arc-20160816;
        b=XjoyjnKtnWzJp5ueAFDpLka5mpDxckg2Nqd3zFH8W8AOZnrkp2zY99YvGKgSWIEy5P
         xWMBoRv6bGTsdSmDdQANL0ypUpVMnOBgju273F+Y1WOexADquBy9kGwBL2QjXYAaJVdX
         JDCXNUDlRkZSi3lGqK18y/KAJN3c+BGS2Sm2Uj3485ZqSs8LQPrprx91sQJLxwXsP678
         4weRLmwKShVx4xr2woy1NTPb2L+qrazVzLHFm47fgFdLInyiIoMyglSeXeG1oIGES44K
         MqtifxIrph2OHWnggaXZ8nUMx3+kmj9HOFrbni1xk8+0mTfCaC7d3GtpqMHySRQgdiN+
         kO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1bl2Xj95tqBnpEpLK/678Enw8h8cM9MArIPcF8vU1HA=;
        b=ZKd5BfFiMRR9YRGNo16NG/87GB1loIZJP+uHSuL+mqea3nlOJ6PemjHkLbqDUpOsKQ
         NEsVhlau8kAFUSr9zalZVmz95xOgJ2seQ/tUhZkeM9X4xyrcDWvJSH2hfbeDuqjqfQJ7
         +Vaj9PwvdnODgvX8suO/L4nTSqhnkomG4jZBQUUIGDCH13MOZNSqko0UUaFaPVZKemD2
         gRn3O/icIFr03fInwrtT8VIWVOvx4OcG+XyFXHYb2h13zhZDdA9cafxgB2Kfear+2Whl
         nPq1txZ4gTbGgHbkywtyB/RM9J59wmiOlQQ2kNMwV39imp7rd61MaLx37E39+kI3til2
         Cx4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TNMkbt97;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z18sor1397570oic.166.2019.09.13.07.46.09
        (Google Transport Security);
        Fri, 13 Sep 2019 07:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TNMkbt97;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bl2Xj95tqBnpEpLK/678Enw8h8cM9MArIPcF8vU1HA=;
        b=TNMkbt972cPuvrrD65KbPAm/v6wV0hB7a8sJgDplZbagSygOwz940eNYvm/0+ppqvb
         aspT2ZUAR3bZYcU1oZfKSsIh21sI3U/PalzHNeYHWBVhmtotCQtDQyUjcSzgCblaBxlp
         1Dn5rTYdJA2MHbx352P7vUM5seVTFPbDlzSI9roYPpoJjoajS0wk3uTB09LDvFnY6c1d
         RPl6MEMkXu/OFdhQEeMMW+OnBznRI3ELSUPGawZ20jUxAX5W/Jvet6EMeb4yHKCTdnm5
         9BURH+FjSPgED/TooYkfzzHB73OHIX95xRIvj4g3Y72Dzfs9Besb30ESItzsWsF2/Ghs
         mBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bl2Xj95tqBnpEpLK/678Enw8h8cM9MArIPcF8vU1HA=;
        b=E+ZvSLZi3pazvOZPD3e+FLCU9dcJbdhRUvPfv/R3OE409lznXFdZO+asQUoI9IJ4LE
         kHG77zNxd+0cphvR7MgzhciLdVZSSbBm7aOGHzA+8rcdB1+6nLwbhQP++NA10FPU5z6Y
         nGnFtfrbEK06UC4kwYV8S4Qd1aqa/4g31jFAeNnnoaHukpumP4+VBy4saTxp975RS/hO
         GeUvd8QzxV55AS/0f0d0Asvyo3VswEcA3UqjHlvd6mIbmx1iOEJ8dsCmomSRaGUEkNCt
         8EUtxeE5eyTHgYRGPBK5xpe5jE7PXEW8TVhX/pGZBIwNgD0CtzaCNaDSVmbVKrWKqIBz
         +lEA==
X-Gm-Message-State: APjAAAVLDAV6tKX1W+wG0lM/RtJqrGBPBHPrGGVy9ttktHOEj38Aj/u1
	KxX4O0n6TSSpimQivDK/nUWsioYTlxNQ9wKJEMWtpRiH
X-Google-Smtp-Source: APXvYqy9VSOWIt8Tcl/F9rAiGsb3hGFHXd0oN3BkxXuy/RSKOIPEu0z1lRTyP3CbakQLf2bDU76XKuHL0Qt2yaRzuyk=
X-Received: by 2002:aca:f002:: with SMTP id o2mr2132507oih.62.1568385968751;
 Fri, 13 Sep 2019 07:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-5-alex.bennee@linaro.org> <CAL1e-=giNc1e+kN04KqHFQGkJbP4BKziQyxVd3-RTtL+UOfSoQ@mail.gmail.com>
 <874l1j18vm.fsf@linaro.org>
In-Reply-To: <874l1j18vm.fsf@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 13 Sep 2019 16:45:57 +0200
Message-ID: <CAL1e-=g_qPLYSba8ji6NuayhGDjK8nMTc3BNibuAH=xnQyGKuA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to elf-arch.h
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:Stellaris" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000089c74e0592705027"
X-TUID: +TiGZ9sFeJVC

--00000000000089c74e0592705027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2019 at 11:26 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

>
> Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:
>
> > 10.09.2019. 21.34, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> =D1=98=
=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >>
> >> This is preparatory for plugins which will want to report the
> >> architecture to plugins. Move the ELF_ARCH definition out of the
> >> loader and into its own header.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> --
> >
> > Hi, Alex.
> >
> > I advice some caution here
> > . For example, EM_NANOMIPS, and some other EM_xxx constants are not
> > included in the new header.
>
> EM_ARCH was never set to EM_NANOMIPS. In fact I can see e_machine is
> checked against it so I guess it is only ever used to checking the
> loading elf directly.
>
> In fact EM_ARCH is only really the default fallback case for checking
> the elf type if there is not a more "forgiving" check done by arch
> specific code (elf_check_arch). The only other cace is the fallback for
> EM_MACHINE unless PPC does something with it.
>
> > I am not sure what exactly you want to achieve
> > with this refactoring. But you may miss your goal, since some EM_xxx wi=
ll
> > be missing from your new header. Is this the right way to achieve what
> you
> > want, and could you unintentionally introduce bugs? Can you outline in
> more
> > details your intentions around the new header? Is this refactoring the
> only
> > way?
>
> As mentioned in the other reply maybe exposing a value from configure
> into config-target.[mak|h] would be a better approach?
>
>
Alex,

I am not sure about that either - and I still don't know the details of
what info
the new plugin(s) need. An alternative solution may be better (and needed).

For MIPS, we are in a situation (that is probably hard to comprehend by
other platforms' people) that QEMU compiled with TARGET_MIPS must
accept both EM_MIPS and EM_NANOMIPS as valid in corresponding
field of elf header (other checks, like compatibility of the CPU with such
elf file, are performed later on, separately). Needless to say, all this is
not known in compile time.

Perhaps we need to record EM_xxx value of accepted (loaded) elf file,
and expose that value through a callback, or a similar mechanism, to
the plugins in question?

Sorry for a little late response. Yours,
Aleksandar



> >
> > Thanks, Aleksandar
> >
> >>  bsd-user/elfload.c     |  13 +----
> >>  include/elf/elf-arch.h | 109 ++++++++++++++++++++++++++++++++++++++++=
+
> >>  linux-user/elfload.c   |  27 ++--------
> >>  3 files changed, 115 insertions(+), 34 deletions(-)
> >>  create mode 100644 include/elf/elf-arch.h
> >>
> >> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> >> index 321ee98b86b..adaae0e0dca 100644
> >> --- a/bsd-user/elfload.c
> >> +++ b/bsd-user/elfload.c
> >> @@ -5,6 +5,7 @@
> >>  #include "qemu.h"
> >>  #include "disas/disas.h"
> >>  #include "qemu/path.h"
> >> +#include "elf/elf-arch.h"
> >>
> >>  #ifdef _ARCH_PPC64
> >>  #undef ARCH_DLINFO
> >> @@ -12,7 +13,6 @@
> >>  #undef ELF_HWCAP
> >>  #undef ELF_CLASS
> >>  #undef ELF_DATA
> >> -#undef ELF_ARCH
> >>  #endif
> >>
> >>  /* from personality.h */
> >> @@ -115,7 +115,6 @@ static uint32_t get_elf_hwcap(void)
> >>
> >>  #define ELF_CLASS      ELFCLASS64
> >>  #define ELF_DATA       ELFDATA2LSB
> >> -#define ELF_ARCH       EM_X86_64
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -141,7 +140,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>   */
> >>  #define ELF_CLASS       ELFCLASS32
> >>  #define ELF_DATA        ELFDATA2LSB
> >> -#define ELF_ARCH        EM_386
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -176,7 +174,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>  #else
> >>  #define ELF_DATA        ELFDATA2LSB
> >>  #endif
> >> -#define ELF_ARCH        EM_ARM
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -231,7 +228,6 @@ enum
> >>
> >>  #define ELF_CLASS   ELFCLASS64
> >>  #define ELF_DATA    ELFDATA2MSB
> >> -#define ELF_ARCH    EM_SPARCV9
> >>
> >>  #define STACK_BIAS              2047
> >>
> >> @@ -265,7 +261,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS   ELFCLASS32
> >>  #define ELF_DATA    ELFDATA2MSB
> >> -#define ELF_ARCH    EM_SPARC
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -302,7 +297,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>  #else
> >>  #define ELF_DATA        ELFDATA2LSB
> >>  #endif
> >> -#define ELF_ARCH        EM_PPC
> >>
> >>  /*
> >>   * We need to put in some extra aux table entries to tell glibc what
> >> @@ -388,7 +382,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *_regs, struct image_info *
> >>  #else
> >>  #define ELF_DATA        ELFDATA2LSB
> >>  #endif
> >> -#define ELF_ARCH    EM_MIPS
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -410,7 +403,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS ELFCLASS32
> >>  #define ELF_DATA  ELFDATA2LSB
> >> -#define ELF_ARCH  EM_SH
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -432,7 +424,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS ELFCLASS32
> >>  #define ELF_DATA  ELFDATA2LSB
> >> -#define ELF_ARCH  EM_CRIS
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -452,7 +443,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS       ELFCLASS32
> >>  #define ELF_DATA        ELFDATA2MSB
> >> -#define ELF_ARCH        EM_68K
> >>
> >>  /* ??? Does this need to do anything?
> >>  #define ELF_PLAT_INIT(_r) */
> >> @@ -477,7 +467,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS      ELFCLASS64
> >>  #define ELF_DATA       ELFDATA2MSB
> >> -#define ELF_ARCH       EM_ALPHA
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> diff --git a/include/elf/elf-arch.h b/include/elf/elf-arch.h
> >> new file mode 100644
> >> index 00000000000..9e052543c51
> >> --- /dev/null
> >> +++ b/include/elf/elf-arch.h
> >> @@ -0,0 +1,109 @@
> >> +/*
> >> + * Elf Architecture Definition
> >> + *
> >> + * This is a simple expansion to define common Elf types for the
> >> + * various machines for the various places it's needed in the source
> >> + * tree.
> >> + *
> >> + * Copyright (c) 2019 Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> + *
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later.
> >> + * See the COPYING file in the top-level directory.
> >> + */
> >> +
> >> +#ifndef _ELF_ARCH_H_
> >> +#define _ELF_ARCH_H_
> >> +
> >> +#include "elf/elf.h"
> >> +
> >> +#ifndef NEED_CPU_H
> >> +#error Needs an target definition
> >> +#endif
> >> +
> >> +#ifdef ELF_ARCH
> >> +#error ELF_ARCH should only be defined once in this file
> >> +#endif
> >> +
> >> +#ifdef TARGET_I386
> >> +#ifdef TARGET_X86_64
> >> +#define ELF_ARCH EM_X86_64
> >> +#else
> >> +#define ELF_ARCH EM_386
> >> +#endif
> >> +#endif
> >> +
> >> +#ifdef TARGET_ARM
> >> +#ifndef TARGET_AARCH64
> >> +#define ELF_ARCH EM_ARM
> >> +#else
> >> +#define ELF_ARCH EM_AARCH64
> >> +#endif
> >> +#endif
> >> +
> >> +#ifdef TARGET_SPARC
> >> +#ifdef TARGET_SPARC64
> >> +#define ELF_ARCH EM_SPARCV9
> >> +#else
> >> +#define ELF_ARCH EM_SPARC
> >> +#endif
> >> +#endif
> >> +
> >> +#ifdef TARGET_PPC
> >> +#define ELF_ARCH EM_PPC
> >> +#endif
> >> +
> >> +#ifdef TARGET_MIPS
> >> +#define ELF_ARCH EM_MIPS
> >> +#endif
> >> +
> >> +#ifdef TARGET_MICROBLAZE
> >> +#define ELF_ARCH EM_MICROBLAZE
> >> +#endif
> >> +
> >> +#ifdef TARGET_NIOS2
> >> +#define ELF_ARCH EM_ALTERA_NIOS2
> >> +#endif
> >> +
> >> +#ifdef TARGET_OPENRISC
> >> +#define ELF_ARCH EM_OPENRISC
> >> +#endif
> >> +
> >> +#ifdef TARGET_SH4
> >> +#define ELF_ARCH EM_SH
> >> +#endif
> >> +
> >> +#ifdef TARGET_CRIS
> >> +#define ELF_ARCH EM_CRIS
> >> +#endif
> >> +
> >> +#ifdef TARGET_M68K
> >> +#define ELF_ARCH EM_68K
> >> +#endif
> >> +
> >> +#ifdef TARGET_ALPHA
> >> +#define ELF_ARCH EM_ALPHA
> >> +#endif
> >> +
> >> +#ifdef TARGET_S390X
> >> +#define ELF_ARCH EM_S390
> >> +#endif
> >> +
> >> +#ifdef TARGET_TILEGX
> >> +#define ELF_ARCH EM_TILEGX
> >> +#endif
> >> +
> >> +#ifdef TARGET_RISCV
> >> +#define ELF_ARCH EM_RISCV
> >> +#endif
> >> +
> >> +#ifdef TARGET_HPPA
> >> +#define ELF_ARCH EM_PARISC
> >> +#endif
> >> +
> >> +#ifdef TARGET_XTENSA
> >> +#define ELF_ARCH EM_XTENSA
> >> +#endif
> >> +
> >> +#endif /* _ELF_ARCH_H_ */
> >> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> >> index 59a0d21c6f1..3ac7016a7e3 100644
> >> --- a/linux-user/elfload.c
> >> +++ b/linux-user/elfload.c
> >> @@ -8,10 +8,15 @@
> >>  #include "qemu.h"
> >>  #include "disas/disas.h"
> >>  #include "elf/elf.h"
> >> +#include "elf/elf-arch.h"
> >>  #include "qemu/path.h"
> >>  #include "qemu/queue.h"
> >>  #include "qemu/guest-random.h"
> >>
> >> +#ifndef ELF_ARCH
> >> +#error something got missed
> >> +#endif
> >> +
> >>  #ifdef _ARCH_PPC64
> >>  #undef ARCH_DLINFO
> >>  #undef ELF_PLATFORM
> >> @@ -19,7 +24,6 @@
> >>  #undef ELF_HWCAP2
> >>  #undef ELF_CLASS
> >>  #undef ELF_DATA
> >> -#undef ELF_ARCH
> >>  #endif
> >>
> >>  #define ELF_OSABI   ELFOSABI_SYSV
> >> @@ -148,7 +152,6 @@ static uint32_t get_elf_hwcap(void)
> >>  #define ELF_START_MMAP 0x2aaaaab000ULL
> >>
> >>  #define ELF_CLASS      ELFCLASS64
> >> -#define ELF_ARCH       EM_X86_64
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs, struct
> > image_info *infop)
> >>  {
> >> @@ -211,7 +214,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t
> > *regs, const CPUX86State *en
> >>   * These are used to set parameters in the core dumps.
> >>   */
> >>  #define ELF_CLASS       ELFCLASS32
> >> -#define ELF_ARCH        EM_386
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -273,7 +275,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t
> > *regs, const CPUX86State *en
> >>
> >>  #define ELF_START_MMAP 0x80000000
> >>
> >> -#define ELF_ARCH        EM_ARM
> >>  #define ELF_CLASS       ELFCLASS32
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >> @@ -539,7 +540,6 @@ static const char *get_elf_platform(void)
> >>  /* 64 bit ARM definitions */
> >>  #define ELF_START_MMAP 0x80000000
> >>
> >> -#define ELF_ARCH        EM_AARCH64
> >>  #define ELF_CLASS       ELFCLASS64
> >>  #ifdef TARGET_WORDS_BIGENDIAN
> >>  # define ELF_PLATFORM    "aarch64_be"
> >> @@ -667,7 +667,6 @@ static uint32_t get_elf_hwcap(void)
> >>  #endif
> >>
> >>  #define ELF_CLASS   ELFCLASS64
> >> -#define ELF_ARCH    EM_SPARCV9
> >>
> >>  #define STACK_BIAS              2047
> >>
> >> @@ -696,7 +695,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs,
> >>                      | HWCAP_SPARC_MULDIV)
> >>
> >>  #define ELF_CLASS   ELFCLASS32
> >> -#define ELF_ARCH    EM_SPARC
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -728,8 +726,6 @@ static inline void init_thread(struct target_pt_re=
gs
> > *regs,
> >>
> >>  #endif
> >>
> >> -#define ELF_ARCH        EM_PPC
> >> -
> >>  /* Feature masks for the Aux Vector Hardware Capabilities (AT_HWCAP).
> >>     See arch/powerpc/include/asm/cputable.h.  */
> >>  enum {
> >> @@ -921,7 +917,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t
> > *regs, const CPUPPCState *en
> >>  #else
> >>  #define ELF_CLASS   ELFCLASS32
> >>  #endif
> >> -#define ELF_ARCH    EM_MIPS
> >>
> >>  #define elf_check_arch(x) ((x) =3D=3D EM_MIPS || (x) =3D=3D EM_NANOMI=
PS)
> >>
> >> @@ -1014,7 +1009,6 @@ static uint32_t get_elf_hwcap(void)
> >>  #define elf_check_arch(x) ( (x) =3D=3D EM_MICROBLAZE || (x) =3D=3D
> > EM_MICROBLAZE_OLD)
> >>
> >>  #define ELF_CLASS   ELFCLASS32
> >> -#define ELF_ARCH    EM_MICROBLAZE
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -1053,7 +1047,6 @@ static void
> elf_core_copy_regs(target_elf_gregset_t
> > *regs, const CPUMBState *env
> >>  #define elf_check_arch(x) ((x) =3D=3D EM_ALTERA_NIOS2)
> >>
> >>  #define ELF_CLASS   ELFCLASS32
> >> -#define ELF_ARCH    EM_ALTERA_NIOS2
> >>
> >>  static void init_thread(struct target_pt_regs *regs, struct image_inf=
o
> > *infop)
> >>  {
> >> @@ -1107,7 +1100,6 @@ static void
> elf_core_copy_regs(target_elf_gregset_t
> > *regs,
> >>
> >>  #define ELF_START_MMAP 0x08000000
> >>
> >> -#define ELF_ARCH EM_OPENRISC
> >>  #define ELF_CLASS ELFCLASS32
> >>  #define ELF_DATA  ELFDATA2MSB
> >>
> >> @@ -1146,7 +1138,6 @@ static void
> elf_core_copy_regs(target_elf_gregset_t
> > *regs,
> >>  #define ELF_START_MMAP 0x80000000
> >>
> >>  #define ELF_CLASS ELFCLASS32
> >> -#define ELF_ARCH  EM_SH
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -1228,7 +1219,6 @@ static uint32_t get_elf_hwcap(void)
> >>  #define ELF_START_MMAP 0x80000000
> >>
> >>  #define ELF_CLASS ELFCLASS32
> >> -#define ELF_ARCH  EM_CRIS
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -1245,7 +1235,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs,
> >>  #define ELF_START_MMAP 0x80000000
> >>
> >>  #define ELF_CLASS       ELFCLASS32
> >> -#define ELF_ARCH        EM_68K
> >>
> >>  /* ??? Does this need to do anything?
> >>     #define ELF_PLAT_INIT(_r) */
> >> @@ -1296,7 +1285,6 @@ static void
> elf_core_copy_regs(target_elf_gregset_t
> > *regs, const CPUM68KState *e
> >>  #define ELF_START_MMAP (0x30000000000ULL)
> >>
> >>  #define ELF_CLASS      ELFCLASS64
> >> -#define ELF_ARCH       EM_ALPHA
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -1316,7 +1304,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs,
> >>
> >>  #define ELF_CLASS      ELFCLASS64
> >>  #define ELF_DATA       ELFDATA2MSB
> >> -#define ELF_ARCH       EM_S390
> >>
> >>  #define ELF_HWCAP get_elf_hwcap()
> >>
> >> @@ -1362,7 +1349,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs, struct image_info *i
> >>
> >>  #define ELF_CLASS   ELFCLASS64
> >>  #define ELF_DATA    ELFDATA2LSB
> >> -#define ELF_ARCH    EM_TILEGX
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> @@ -1379,7 +1365,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs,
> >>  #ifdef TARGET_RISCV
> >>
> >>  #define ELF_START_MMAP 0x80000000
> >> -#define ELF_ARCH  EM_RISCV
> >>
> >>  #ifdef TARGET_RISCV32
> >>  #define ELF_CLASS ELFCLASS32
> >> @@ -1402,7 +1387,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs,
> >>
> >>  #define ELF_START_MMAP  0x80000000
> >>  #define ELF_CLASS       ELFCLASS32
> >> -#define ELF_ARCH        EM_PARISC
> >>  #define ELF_PLATFORM    "PARISC"
> >>  #define STACK_GROWS_DOWN 0
> >>  #define STACK_ALIGNMENT  64
> >> @@ -1427,7 +1411,6 @@ static inline void init_thread(struct
> > target_pt_regs *regs,
> >>  #define ELF_START_MMAP 0x20000000
> >>
> >>  #define ELF_CLASS       ELFCLASS32
> >> -#define ELF_ARCH        EM_XTENSA
> >>
> >>  static inline void init_thread(struct target_pt_regs *regs,
> >>                                 struct image_info *infop)
> >> --
> >> 2.20.1
> >>
> >>
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000089c74e0592705027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 11:26 AM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com" targ=
et=3D"_blank">aleksandar.m.mail@gmail.com</a>&gt; writes:<br>
<br>
&gt; 10.09.2019. 21.34, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; =
=D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;&gt;<br>
&gt;&gt; This is preparatory for plugins which will want to report the<br>
&gt;&gt; architecture to plugins. Move the ELF_ARCH definition out of the<b=
r>
&gt;&gt; loader and into its own header.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; --<br>
&gt;<br>
&gt; Hi, Alex.<br>
&gt;<br>
&gt; I advice some caution here<br>
&gt; . For example, EM_NANOMIPS, and some other EM_xxx constants are not<br=
>
&gt; included in the new header.<br>
<br>
EM_ARCH was never set to EM_NANOMIPS. In fact I can see e_machine is<br>
checked against it so I guess it is only ever used to checking the<br>
loading elf directly.<br>
<br>
In fact EM_ARCH is only really the default fallback case for checking<br>
the elf type if there is not a more &quot;forgiving&quot; check done by arc=
h<br>
specific code (elf_check_arch). The only other cace is the fallback for<br>
EM_MACHINE unless PPC does something with it.<br>
<br>
&gt; I am not sure what exactly you want to achieve<br>
&gt; with this refactoring. But you may miss your goal, since some EM_xxx w=
ill<br>
&gt; be missing from your new header. Is this the right way to achieve what=
 you<br>
&gt; want, and could you unintentionally introduce bugs? Can you outline in=
 more<br>
&gt; details your intentions around the new header? Is this refactoring the=
 only<br>
&gt; way?<br>
<br>
As mentioned in the other reply maybe exposing a value from configure<br>
into config-target.[mak|h] would be a better approach?<br>
<br></blockquote><div><br></div><div>Alex,</div><div><br></div><div>I am no=
t sure about that either - and I still don&#39;t know the details of what i=
nfo</div><div>the new plugin(s) need. An alternative solution may be better=
 (and needed).</div><div><br></div><div>For MIPS, we are in a situation (th=
at is probably hard to comprehend by</div><div>other platforms&#39; people)=
 that QEMU compiled with TARGET_MIPS must</div><div>accept both EM_MIPS and=
 EM_NANOMIPS as valid in corresponding</div><div>field of elf header (other=
 checks, like compatibility of the CPU with such</div><div>elf file, are pe=
rformed later on, separately). Needless to say, all this is</div><div>not k=
nown in compile time.</div><div><br></div><div>Perhaps we need to record EM=
_xxx value of accepted (loaded) elf file,</div><div>and expose that value t=
hrough a callback, or a similar mechanism, to</div><div>the plugins in ques=
tion?</div><div><br></div><div><div>Sorry for a little late response. Yours=
,</div></div><div>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Thanks, Aleksandar<br>
&gt;<br>
&gt;&gt;=C2=A0 bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +----<br>
&gt;&gt;=C2=A0 include/elf/elf-arch.h | 109 +++++++++++++++++++++++++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 linux-user/elfload.c=C2=A0 =C2=A0|=C2=A0 27 ++--------<br>
&gt;&gt;=C2=A0 3 files changed, 115 insertions(+), 34 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 include/elf/elf-arch.h<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
&gt;&gt; index 321ee98b86b..adaae0e0dca 100644<br>
&gt;&gt; --- a/bsd-user/elfload.c<br>
&gt;&gt; +++ b/bsd-user/elfload.c<br>
&gt;&gt; @@ -5,6 +5,7 @@<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;disas/disas.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/path.h&quot;<br>
&gt;&gt; +#include &quot;elf/elf-arch.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #ifdef _ARCH_PPC64<br>
&gt;&gt;=C2=A0 #undef ARCH_DLINFO<br>
&gt;&gt; @@ -12,7 +13,6 @@<br>
&gt;&gt;=C2=A0 #undef ELF_HWCAP<br>
&gt;&gt;=C2=A0 #undef ELF_CLASS<br>
&gt;&gt;=C2=A0 #undef ELF_DATA<br>
&gt;&gt; -#undef ELF_ARCH<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* from personality.h */<br>
&gt;&gt; @@ -115,7 +115,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2LSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_X86_64<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -141,7 +140,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_386<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -176,7 +174,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_ARM<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -231,7 +228,6 @@ enum<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARCV9<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define STACK_BIAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2047<br>
&gt;&gt;<br>
&gt;&gt; @@ -265,7 +261,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARC<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -302,7 +297,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PPC<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0* We need to put in some extra aux table entries to te=
ll glibc what<br>
&gt;&gt; @@ -388,7 +382,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *_regs, struct image_info *<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MIPS<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -410,7 +403,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 ELFDATA2LSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 EM_SH<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -432,7 +424,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 ELFDATA2LSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 EM_CRIS<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -452,7 +443,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_68K<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* ??? Does this need to do anything?<br>
&gt;&gt;=C2=A0 #define ELF_PLAT_INIT(_r) */<br>
&gt;&gt; @@ -477,7 +467,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2MSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_ALPHA<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; diff --git a/include/elf/elf-arch.h b/include/elf/elf-arch.h<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..9e052543c51<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/include/elf/elf-arch.h<br>
&gt;&gt; @@ -0,0 +1,109 @@<br>
&gt;&gt; +/*<br>
&gt;&gt; + * Elf Architecture Definition<br>
&gt;&gt; + *<br>
&gt;&gt; + * This is a simple expansion to define common Elf types for the<=
br>
&gt;&gt; + * various machines for the various places it&#39;s needed in the=
 source<br>
&gt;&gt; + * tree.<br>
&gt;&gt; + *<br>
&gt;&gt; + * Copyright (c) 2019 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex=
.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; + *<br>
&gt;&gt; + * SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt;&gt; + *<br>
&gt;&gt; + * This work is licensed under the terms of the GNU GPL, version =
2 or<br>
&gt; later.<br>
&gt;&gt; + * See the COPYING file in the top-level directory.<br>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +#ifndef _ELF_ARCH_H_<br>
&gt;&gt; +#define _ELF_ARCH_H_<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;elf/elf.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +#ifndef NEED_CPU_H<br>
&gt;&gt; +#error Needs an target definition<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef ELF_ARCH<br>
&gt;&gt; +#error ELF_ARCH should only be defined once in this file<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_I386<br>
&gt;&gt; +#ifdef TARGET_X86_64<br>
&gt;&gt; +#define ELF_ARCH EM_X86_64<br>
&gt;&gt; +#else<br>
&gt;&gt; +#define ELF_ARCH EM_386<br>
&gt;&gt; +#endif<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_ARM<br>
&gt;&gt; +#ifndef TARGET_AARCH64<br>
&gt;&gt; +#define ELF_ARCH EM_ARM<br>
&gt;&gt; +#else<br>
&gt;&gt; +#define ELF_ARCH EM_AARCH64<br>
&gt;&gt; +#endif<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_SPARC<br>
&gt;&gt; +#ifdef TARGET_SPARC64<br>
&gt;&gt; +#define ELF_ARCH EM_SPARCV9<br>
&gt;&gt; +#else<br>
&gt;&gt; +#define ELF_ARCH EM_SPARC<br>
&gt;&gt; +#endif<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_PPC<br>
&gt;&gt; +#define ELF_ARCH EM_PPC<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_MIPS<br>
&gt;&gt; +#define ELF_ARCH EM_MIPS<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_MICROBLAZE<br>
&gt;&gt; +#define ELF_ARCH EM_MICROBLAZE<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_NIOS2<br>
&gt;&gt; +#define ELF_ARCH EM_ALTERA_NIOS2<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_OPENRISC<br>
&gt;&gt; +#define ELF_ARCH EM_OPENRISC<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_SH4<br>
&gt;&gt; +#define ELF_ARCH EM_SH<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_CRIS<br>
&gt;&gt; +#define ELF_ARCH EM_CRIS<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_M68K<br>
&gt;&gt; +#define ELF_ARCH EM_68K<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_ALPHA<br>
&gt;&gt; +#define ELF_ARCH EM_ALPHA<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_S390X<br>
&gt;&gt; +#define ELF_ARCH EM_S390<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_TILEGX<br>
&gt;&gt; +#define ELF_ARCH EM_TILEGX<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_RISCV<br>
&gt;&gt; +#define ELF_ARCH EM_RISCV<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_HPPA<br>
&gt;&gt; +#define ELF_ARCH EM_PARISC<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef TARGET_XTENSA<br>
&gt;&gt; +#define ELF_ARCH EM_XTENSA<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#endif /* _ELF_ARCH_H_ */<br>
&gt;&gt; diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
&gt;&gt; index 59a0d21c6f1..3ac7016a7e3 100644<br>
&gt;&gt; --- a/linux-user/elfload.c<br>
&gt;&gt; +++ b/linux-user/elfload.c<br>
&gt;&gt; @@ -8,10 +8,15 @@<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;disas/disas.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;elf/elf.h&quot;<br>
&gt;&gt; +#include &quot;elf/elf-arch.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/path.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/queue.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/guest-random.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#ifndef ELF_ARCH<br>
&gt;&gt; +#error something got missed<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #ifdef _ARCH_PPC64<br>
&gt;&gt;=C2=A0 #undef ARCH_DLINFO<br>
&gt;&gt;=C2=A0 #undef ELF_PLATFORM<br>
&gt;&gt; @@ -19,7 +24,6 @@<br>
&gt;&gt;=C2=A0 #undef ELF_HWCAP2<br>
&gt;&gt;=C2=A0 #undef ELF_CLASS<br>
&gt;&gt;=C2=A0 #undef ELF_DATA<br>
&gt;&gt; -#undef ELF_ARCH<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_OSABI=C2=A0 =C2=A0ELFOSABI_SYSV<br>
&gt;&gt; @@ -148,7 +152,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x2aaaaab000ULL<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_X86_64<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs, =
struct<br>
&gt; image_info *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -211,7 +214,6 @@ static void elf_core_copy_regs(target_elf_greg=
set_t<br>
&gt; *regs, const CPUX86State *en<br>
&gt;&gt;=C2=A0 =C2=A0* These are used to set parameters in the core dumps.<=
br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_386<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -273,7 +275,6 @@ static void elf_core_copy_regs(target_elf_greg=
set_t<br>
&gt; *regs, const CPUX86State *en<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt;<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_ARM<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt; @@ -539,7 +540,6 @@ static const char *get_elf_platform(void)<br>
&gt;&gt;=C2=A0 /* 64 bit ARM definitions */<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt;<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_AARCH64<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS64<br>
&gt;&gt;=C2=A0 #ifdef TARGET_WORDS_BIGENDIAN<br>
&gt;&gt;=C2=A0 # define ELF_PLATFORM=C2=A0 =C2=A0 &quot;aarch64_be&quot;<br=
>
&gt;&gt; @@ -667,7 +667,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARCV9<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define STACK_BIAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2047<br>
&gt;&gt;<br>
&gt;&gt; @@ -696,7 +695,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | HWCAP_SPARC_MULDIV)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARC<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -728,8 +726,6 @@ static inline void init_thread(struct target_p=
t_regs<br>
&gt; *regs,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PPC<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 /* Feature masks for the Aux Vector Hardware Capabilities (A=
T_HWCAP).<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0See arch/powerpc/include/asm/cputable.h.=C2=A0 =
*/<br>
&gt;&gt;=C2=A0 enum {<br>
&gt;&gt; @@ -921,7 +917,6 @@ static void elf_core_copy_regs(target_elf_greg=
set_t<br>
&gt; *regs, const CPUPPCState *en<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MIPS<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define elf_check_arch(x) ((x) =3D=3D EM_MIPS || (x) =3D=3D =
EM_NANOMIPS)<br>
&gt;&gt;<br>
&gt;&gt; @@ -1014,7 +1009,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;&gt;=C2=A0 #define elf_check_arch(x) ( (x) =3D=3D EM_MICROBLAZE || (x) =
=3D=3D<br>
&gt; EM_MICROBLAZE_OLD)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MICROBLAZE<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -1053,7 +1047,6 @@ static void elf_core_copy_regs(target_elf_gr=
egset_t<br>
&gt; *regs, const CPUMBState *env<br>
&gt;&gt;=C2=A0 #define elf_check_arch(x) ((x) =3D=3D EM_ALTERA_NIOS2)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_ALTERA_NIOS2<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void init_thread(struct target_pt_regs *regs, struct =
image_info<br>
&gt; *infop)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -1107,7 +1100,6 @@ static void elf_core_copy_regs(target_elf_gr=
egset_t<br>
&gt; *regs,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x08000000<br>
&gt;&gt;<br>
&gt;&gt; -#define ELF_ARCH EM_OPENRISC<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 ELFDATA2MSB<br>
&gt;&gt;<br>
&gt;&gt; @@ -1146,7 +1138,6 @@ static void elf_core_copy_regs(target_elf_gr=
egset_t<br>
&gt; *regs,<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 EM_SH<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -1228,7 +1219,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 EM_CRIS<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -1245,7 +1235,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs,<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_68K<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* ??? Does this need to do anything?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0#define ELF_PLAT_INIT(_r) */<br>
&gt;&gt; @@ -1296,7 +1285,6 @@ static void elf_core_copy_regs(target_elf_gr=
egset_t<br>
&gt; *regs, const CPUM68KState *e<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP (0x30000000000ULL)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_ALPHA<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -1316,7 +1304,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2MSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_S390<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_HWCAP get_elf_hwcap()<br>
&gt;&gt;<br>
&gt;&gt; @@ -1362,7 +1349,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs, struct image_info *i<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt;&gt;=C2=A0 #define ELF_DATA=C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_TILEGX<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; @@ -1379,7 +1365,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs,<br>
&gt;&gt;=C2=A0 #ifdef TARGET_RISCV<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x80000000<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 EM_RISCV<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #ifdef TARGET_RISCV32<br>
&gt;&gt;=C2=A0 #define ELF_CLASS ELFCLASS32<br>
&gt;&gt; @@ -1402,7 +1387,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP=C2=A0 0x80000000<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PARISC<br>
&gt;&gt;=C2=A0 #define ELF_PLATFORM=C2=A0 =C2=A0 &quot;PARISC&quot;<br>
&gt;&gt;=C2=A0 #define STACK_GROWS_DOWN 0<br>
&gt;&gt;=C2=A0 #define STACK_ALIGNMENT=C2=A0 64<br>
&gt;&gt; @@ -1427,7 +1411,6 @@ static inline void init_thread(struct<br>
&gt; target_pt_regs *regs,<br>
&gt;&gt;=C2=A0 #define ELF_START_MMAP 0x20000000<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_XTENSA<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static inline void init_thread(struct target_pt_regs *regs,<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct image_info *info=
p)<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--00000000000089c74e0592705027--
