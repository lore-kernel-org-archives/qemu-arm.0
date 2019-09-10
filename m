Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp86643wrp;
        Tue, 10 Sep 2019 14:39:33 -0700 (PDT)
X-Received: by 2002:aca:882:: with SMTP id 124mr1372635oii.125.1568151573358;
        Tue, 10 Sep 2019 14:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568151573; cv=none;
        d=google.com; s=arc-20160816;
        b=sUasPl+Kl+q0ZZ3SyMvVXgcl7Co7esq5Zw3PSZecU9tqudyvbdPisoveAzhvdH0LP0
         wEOFrQm0b4HU3l08TkH+C+Wd+HkYZetwqq3k25/iuembMFokDO7IMJDYfdzELGe++gj5
         qH9qXTCC6J7Ym7VFr7YxtcsbTwZ9awCURIGZsRrLSt17X6TvuNiE/32ygCZu4ue4pUi5
         gGYJBXnAyNPnmtHfsUlXJi3/a4MuGMQJIdVKdoQT9MBgiHqIWBHYaiy5d2gHc/2wGERc
         iRZGNQtQRwjVRcDJN2MmNyjN/BYajEpZdoYKPZ1BQbiSnWDI1LqrLAUcXI64C7o12oW8
         mXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=d+rJ7NonfXP65izljiZmmU387OX15LnnugJ2LjRtHOY=;
        b=v7Hpsr98+HmWM6Gp334Hjd3IzGUB65s/fYQqkCgRz0bAzvJT2PLCK0mCbJDOGnlCCz
         ygD3xPoRRhdcdYsZpkgZEfMKskp1Gi5hENZEzLep7Uuf0V09P+fxgDaKHLVjQoWiftc7
         76gzfqLZ9+w4B+Z6FYTYy2+QRNNRF6C8zQmvtzZQXzqlYo9Fxi3IqdS7toXHR/PgxqWb
         kvcLEfVG9Rt0veqDhG9qLY0Fb+9gtXe8zaBt1Co0frIavHRjibTGquBvhGNaO20B658m
         rUWs84Gk+YsENky3uME1cHRdmm2EHt/Kr9MFST+o1lahlXZk8KqGfcY5MfoBCdl7fqYH
         cV9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=vIHFggaQ;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 97sor3306321otm.61.2019.09.10.14.39.33
        (Google Transport Security);
        Tue, 10 Sep 2019 14:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=vIHFggaQ;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=d+rJ7NonfXP65izljiZmmU387OX15LnnugJ2LjRtHOY=;
        b=vIHFggaQ4z0xHA8exLTX98a1tf4sObKJtbV+9d8q/ovvb6rpa228+xAMthgFFK2Ex2
         RA9FIqANLdy17evySKwL0mH/xFoewzJpGyJmUJnRhsz0a2SA+DCRL7jaZe+zLElHEv1x
         +UtdZXIBLHQ0rnvkw6XACoX2nFmlJgWFCVtid4w6xoFyaQlhbPocnmHEZnx7oe7YIqGO
         yrwghf4dQjPze0emIyLRJxGbbqmG7v3p0rzvVPlS9t0EZQ2JV487AK0i2TllDZ+nZ1WK
         EnW6//6FiuIF9W76o5f9oUMvKIDYp5bLPjHy62VF7SW8H4dnLg8yz0jM46b6oNV0YEhd
         Jd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=d+rJ7NonfXP65izljiZmmU387OX15LnnugJ2LjRtHOY=;
        b=Vzj9tE2WulTvE+23UfJj95mjLwkkwA07z1lBvi0zQ3m1EfcujApZElRfKT/LEvMua/
         1Gw6cwKd4jDWbJ4zk4QwO9d3gDdnI3CCBYYEZDgmPZYclekqXcq1Gk0SbOfn9iGXbper
         7eXaI2iyo17ONGj8XgqtSqBSJLS/39BQyt2P3HKWt9KHBKTdFF2KpChhZOYkW/yFr1Fq
         EiVraB/ArtR+iKM/E21sAnlGQa/rxXFVKrAVxlG+5I9zWjHjWNjTqBEt5HXBGIjl7JjQ
         u3wrizN9yEEeKAgYKVPCN+LanFRX5VIPl32NGXEdb6BAFcVLQiib4akfl69NlfZEZjVZ
         uRDw==
X-Gm-Message-State: APjAAAUoORVKXk+WQq77I+MenkoAlDEgmFGvije0NVto0M5g250Hv0vh
	S5LvQ5H6eDw5mHxAuyswm3pZwzElG0AEcWl6n7pzlg==
X-Google-Smtp-Source: APXvYqyV5VU3/onR7uD72kfbuqwHHZ7GmAKe7npmDofhrDn3mjujD3v6eFdn5T/YGhQDPz/viYBcil6z7UU3ewAkmcI=
X-Received: by 2002:a9d:127:: with SMTP id 36mr21570669otu.64.1568151572669;
 Tue, 10 Sep 2019 14:39:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 10 Sep 2019 14:39:32
 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 10 Sep 2019 14:39:32
 -0700 (PDT)
In-Reply-To: <20190910193408.28917-5-alex.bennee@linaro.org>
References: <20190910193408.28917-1-alex.bennee@linaro.org> <20190910193408.28917-5-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 10 Sep 2019 23:39:32 +0200
Message-ID: <CAL1e-=gLPs_o0jYB-inWGgWP7yST-k7XzbYgxu110ycGvTzDkg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to elf-arch.h
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
	Laurent Vivier <laurent@vivier.eu>, peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000716a62059239bd7d"
X-TUID: vxlYiV4i5F7J

--000000000000716a62059239bd7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

10.09.2019. 21.34, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> =D1=98=D0=B5=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> This is preparatory for plugins which will want to report the
> architecture to plugins. Move the ELF_ARCH definition out of the
> loader and into its own header.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

ELF_ARCH is and has been used exclusively locally within elfload.c, and
some architectures use it in a specific way, which is perfectly legal in
the current code organization, and I have certain reservations about this
attempt to suddenly attach additional responsibility to these constants -
"reporting" to some unspecified plugin. In simpler words, it seems to me
that you are trying to use a thing for something it was not meant to.

Also, it would be better if you cc-ed corresponding architecture
submaintainers.

Yours, Aleksandar

>  bsd-user/elfload.c     |  13 +----
>  include/elf/elf-arch.h | 109 +++++++++++++++++++++++++++++++++++++++++
>  linux-user/elfload.c   |  27 ++--------
>  3 files changed, 115 insertions(+), 34 deletions(-)
>  create mode 100644 include/elf/elf-arch.h
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 321ee98b86b..adaae0e0dca 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -5,6 +5,7 @@
>  #include "qemu.h"
>  #include "disas/disas.h"
>  #include "qemu/path.h"
> +#include "elf/elf-arch.h"
>
>  #ifdef _ARCH_PPC64
>  #undef ARCH_DLINFO
> @@ -12,7 +13,6 @@
>  #undef ELF_HWCAP
>  #undef ELF_CLASS
>  #undef ELF_DATA
> -#undef ELF_ARCH
>  #endif
>
>  /* from personality.h */
> @@ -115,7 +115,6 @@ static uint32_t get_elf_hwcap(void)
>
>  #define ELF_CLASS      ELFCLASS64
>  #define ELF_DATA       ELFDATA2LSB
> -#define ELF_ARCH       EM_X86_64
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -141,7 +140,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>   */
>  #define ELF_CLASS       ELFCLASS32
>  #define ELF_DATA        ELFDATA2LSB
> -#define ELF_ARCH        EM_386
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -176,7 +174,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>  #else
>  #define ELF_DATA        ELFDATA2LSB
>  #endif
> -#define ELF_ARCH        EM_ARM
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -231,7 +228,6 @@ enum
>
>  #define ELF_CLASS   ELFCLASS64
>  #define ELF_DATA    ELFDATA2MSB
> -#define ELF_ARCH    EM_SPARCV9
>
>  #define STACK_BIAS              2047
>
> @@ -265,7 +261,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>
>  #define ELF_CLASS   ELFCLASS32
>  #define ELF_DATA    ELFDATA2MSB
> -#define ELF_ARCH    EM_SPARC
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -302,7 +297,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>  #else
>  #define ELF_DATA        ELFDATA2LSB
>  #endif
> -#define ELF_ARCH        EM_PPC
>
>  /*
>   * We need to put in some extra aux table entries to tell glibc what
> @@ -388,7 +382,6 @@ static inline void init_thread(struct target_pt_regs
*_regs, struct image_info *
>  #else
>  #define ELF_DATA        ELFDATA2LSB
>  #endif
> -#define ELF_ARCH    EM_MIPS
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -410,7 +403,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>
>  #define ELF_CLASS ELFCLASS32
>  #define ELF_DATA  ELFDATA2LSB
> -#define ELF_ARCH  EM_SH
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -432,7 +424,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>
>  #define ELF_CLASS ELFCLASS32
>  #define ELF_DATA  ELFDATA2LSB
> -#define ELF_ARCH  EM_CRIS
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -452,7 +443,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>
>  #define ELF_CLASS       ELFCLASS32
>  #define ELF_DATA        ELFDATA2MSB
> -#define ELF_ARCH        EM_68K
>
>  /* ??? Does this need to do anything?
>  #define ELF_PLAT_INIT(_r) */
> @@ -477,7 +467,6 @@ static inline void init_thread(struct target_pt_regs
*regs, struct image_info *i
>
>  #define ELF_CLASS      ELFCLASS64
>  #define ELF_DATA       ELFDATA2MSB
> -#define ELF_ARCH       EM_ALPHA
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> diff --git a/include/elf/elf-arch.h b/include/elf/elf-arch.h
> new file mode 100644
> index 00000000000..9e052543c51
> --- /dev/null
> +++ b/include/elf/elf-arch.h
> @@ -0,0 +1,109 @@
> +/*
> + * Elf Architecture Definition
> + *
> + * This is a simple expansion to define common Elf types for the
> + * various machines for the various places it's needed in the source
> + * tree.
> + *
> + * Copyright (c) 2019 Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef _ELF_ARCH_H_
> +#define _ELF_ARCH_H_
> +
> +#include "elf/elf.h"
> +
> +#ifndef NEED_CPU_H
> +#error Needs an target definition
> +#endif
> +
> +#ifdef ELF_ARCH
> +#error ELF_ARCH should only be defined once in this file
> +#endif
> +
> +#ifdef TARGET_I386
> +#ifdef TARGET_X86_64
> +#define ELF_ARCH EM_X86_64
> +#else
> +#define ELF_ARCH EM_386
> +#endif
> +#endif
> +
> +#ifdef TARGET_ARM
> +#ifndef TARGET_AARCH64
> +#define ELF_ARCH EM_ARM
> +#else
> +#define ELF_ARCH EM_AARCH64
> +#endif
> +#endif
> +
> +#ifdef TARGET_SPARC
> +#ifdef TARGET_SPARC64
> +#define ELF_ARCH EM_SPARCV9
> +#else
> +#define ELF_ARCH EM_SPARC
> +#endif
> +#endif
> +
> +#ifdef TARGET_PPC
> +#define ELF_ARCH EM_PPC
> +#endif
> +
> +#ifdef TARGET_MIPS
> +#define ELF_ARCH EM_MIPS
> +#endif
> +
> +#ifdef TARGET_MICROBLAZE
> +#define ELF_ARCH EM_MICROBLAZE
> +#endif
> +
> +#ifdef TARGET_NIOS2
> +#define ELF_ARCH EM_ALTERA_NIOS2
> +#endif
> +
> +#ifdef TARGET_OPENRISC
> +#define ELF_ARCH EM_OPENRISC
> +#endif
> +
> +#ifdef TARGET_SH4
> +#define ELF_ARCH EM_SH
> +#endif
> +
> +#ifdef TARGET_CRIS
> +#define ELF_ARCH EM_CRIS
> +#endif
> +
> +#ifdef TARGET_M68K
> +#define ELF_ARCH EM_68K
> +#endif
> +
> +#ifdef TARGET_ALPHA
> +#define ELF_ARCH EM_ALPHA
> +#endif
> +
> +#ifdef TARGET_S390X
> +#define ELF_ARCH EM_S390
> +#endif
> +
> +#ifdef TARGET_TILEGX
> +#define ELF_ARCH EM_TILEGX
> +#endif
> +
> +#ifdef TARGET_RISCV
> +#define ELF_ARCH EM_RISCV
> +#endif
> +
> +#ifdef TARGET_HPPA
> +#define ELF_ARCH EM_PARISC
> +#endif
> +
> +#ifdef TARGET_XTENSA
> +#define ELF_ARCH EM_XTENSA
> +#endif
> +
> +#endif /* _ELF_ARCH_H_ */
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 59a0d21c6f1..3ac7016a7e3 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -8,10 +8,15 @@
>  #include "qemu.h"
>  #include "disas/disas.h"
>  #include "elf/elf.h"
> +#include "elf/elf-arch.h"
>  #include "qemu/path.h"
>  #include "qemu/queue.h"
>  #include "qemu/guest-random.h"
>
> +#ifndef ELF_ARCH
> +#error something got missed
> +#endif
> +
>  #ifdef _ARCH_PPC64
>  #undef ARCH_DLINFO
>  #undef ELF_PLATFORM
> @@ -19,7 +24,6 @@
>  #undef ELF_HWCAP2
>  #undef ELF_CLASS
>  #undef ELF_DATA
> -#undef ELF_ARCH
>  #endif
>
>  #define ELF_OSABI   ELFOSABI_SYSV
> @@ -148,7 +152,6 @@ static uint32_t get_elf_hwcap(void)
>  #define ELF_START_MMAP 0x2aaaaab000ULL
>
>  #define ELF_CLASS      ELFCLASS64
> -#define ELF_ARCH       EM_X86_64
>
>  static inline void init_thread(struct target_pt_regs *regs, struct
image_info *infop)
>  {
> @@ -211,7 +214,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs, const CPUX86State *en
>   * These are used to set parameters in the core dumps.
>   */
>  #define ELF_CLASS       ELFCLASS32
> -#define ELF_ARCH        EM_386
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -273,7 +275,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs, const CPUX86State *en
>
>  #define ELF_START_MMAP 0x80000000
>
> -#define ELF_ARCH        EM_ARM
>  #define ELF_CLASS       ELFCLASS32
>
>  static inline void init_thread(struct target_pt_regs *regs,
> @@ -539,7 +540,6 @@ static const char *get_elf_platform(void)
>  /* 64 bit ARM definitions */
>  #define ELF_START_MMAP 0x80000000
>
> -#define ELF_ARCH        EM_AARCH64
>  #define ELF_CLASS       ELFCLASS64
>  #ifdef TARGET_WORDS_BIGENDIAN
>  # define ELF_PLATFORM    "aarch64_be"
> @@ -667,7 +667,6 @@ static uint32_t get_elf_hwcap(void)
>  #endif
>
>  #define ELF_CLASS   ELFCLASS64
> -#define ELF_ARCH    EM_SPARCV9
>
>  #define STACK_BIAS              2047
>
> @@ -696,7 +695,6 @@ static inline void init_thread(struct target_pt_regs
*regs,
>                      | HWCAP_SPARC_MULDIV)
>
>  #define ELF_CLASS   ELFCLASS32
> -#define ELF_ARCH    EM_SPARC
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -728,8 +726,6 @@ static inline void init_thread(struct target_pt_regs
*regs,
>
>  #endif
>
> -#define ELF_ARCH        EM_PPC
> -
>  /* Feature masks for the Aux Vector Hardware Capabilities (AT_HWCAP).
>     See arch/powerpc/include/asm/cputable.h.  */
>  enum {
> @@ -921,7 +917,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs, const CPUPPCState *en
>  #else
>  #define ELF_CLASS   ELFCLASS32
>  #endif
> -#define ELF_ARCH    EM_MIPS
>
>  #define elf_check_arch(x) ((x) =3D=3D EM_MIPS || (x) =3D=3D EM_NANOMIPS)
>
> @@ -1014,7 +1009,6 @@ static uint32_t get_elf_hwcap(void)
>  #define elf_check_arch(x) ( (x) =3D=3D EM_MICROBLAZE || (x) =3D=3D
EM_MICROBLAZE_OLD)
>
>  #define ELF_CLASS   ELFCLASS32
> -#define ELF_ARCH    EM_MICROBLAZE
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -1053,7 +1047,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs, const CPUMBState *env
>  #define elf_check_arch(x) ((x) =3D=3D EM_ALTERA_NIOS2)
>
>  #define ELF_CLASS   ELFCLASS32
> -#define ELF_ARCH    EM_ALTERA_NIOS2
>
>  static void init_thread(struct target_pt_regs *regs, struct image_info
*infop)
>  {
> @@ -1107,7 +1100,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs,
>
>  #define ELF_START_MMAP 0x08000000
>
> -#define ELF_ARCH EM_OPENRISC
>  #define ELF_CLASS ELFCLASS32
>  #define ELF_DATA  ELFDATA2MSB
>
> @@ -1146,7 +1138,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs,
>  #define ELF_START_MMAP 0x80000000
>
>  #define ELF_CLASS ELFCLASS32
> -#define ELF_ARCH  EM_SH
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -1228,7 +1219,6 @@ static uint32_t get_elf_hwcap(void)
>  #define ELF_START_MMAP 0x80000000
>
>  #define ELF_CLASS ELFCLASS32
> -#define ELF_ARCH  EM_CRIS
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -1245,7 +1235,6 @@ static inline void init_thread(struct
target_pt_regs *regs,
>  #define ELF_START_MMAP 0x80000000
>
>  #define ELF_CLASS       ELFCLASS32
> -#define ELF_ARCH        EM_68K
>
>  /* ??? Does this need to do anything?
>     #define ELF_PLAT_INIT(_r) */
> @@ -1296,7 +1285,6 @@ static void elf_core_copy_regs(target_elf_gregset_t
*regs, const CPUM68KState *e
>  #define ELF_START_MMAP (0x30000000000ULL)
>
>  #define ELF_CLASS      ELFCLASS64
> -#define ELF_ARCH       EM_ALPHA
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -1316,7 +1304,6 @@ static inline void init_thread(struct
target_pt_regs *regs,
>
>  #define ELF_CLASS      ELFCLASS64
>  #define ELF_DATA       ELFDATA2MSB
> -#define ELF_ARCH       EM_S390
>
>  #define ELF_HWCAP get_elf_hwcap()
>
> @@ -1362,7 +1349,6 @@ static inline void init_thread(struct
target_pt_regs *regs, struct image_info *i
>
>  #define ELF_CLASS   ELFCLASS64
>  #define ELF_DATA    ELFDATA2LSB
> -#define ELF_ARCH    EM_TILEGX
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> @@ -1379,7 +1365,6 @@ static inline void init_thread(struct
target_pt_regs *regs,
>  #ifdef TARGET_RISCV
>
>  #define ELF_START_MMAP 0x80000000
> -#define ELF_ARCH  EM_RISCV
>
>  #ifdef TARGET_RISCV32
>  #define ELF_CLASS ELFCLASS32
> @@ -1402,7 +1387,6 @@ static inline void init_thread(struct
target_pt_regs *regs,
>
>  #define ELF_START_MMAP  0x80000000
>  #define ELF_CLASS       ELFCLASS32
> -#define ELF_ARCH        EM_PARISC
>  #define ELF_PLATFORM    "PARISC"
>  #define STACK_GROWS_DOWN 0
>  #define STACK_ALIGNMENT  64
> @@ -1427,7 +1411,6 @@ static inline void init_thread(struct
target_pt_regs *regs,
>  #define ELF_START_MMAP 0x20000000
>
>  #define ELF_CLASS       ELFCLASS32
> -#define ELF_ARCH        EM_XTENSA
>
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
> --
> 2.20.1
>
>

--000000000000716a62059239bd7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
10.09.2019. 21.34, &quot;Alex Benn=C3=A9e&quot; &lt;<a href=3D"mailto:alex.=
bennee@linaro.org">alex.bennee@linaro.org</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; This is preparatory for plugins which will want to report the<br>
&gt; architecture to plugins. Move the ELF_ARCH definition out of the<br>
&gt; loader and into its own header.<br>
&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">ELF_ARCH is and has been used exclusively locally within elf=
load.c, and some architectures use it in a specific way, which is perfectly=
 legal in the current code organization, and I have certain reservations ab=
out this attempt to suddenly attach additional responsibility to these cons=
tants - &quot;reporting&quot; to some unspecified plugin. In simpler words,=
 it seems to me that you are trying to use a thing for something it was not=
 meant to.</p>
<p dir=3D"ltr">Also, it would be better if you cc-ed corresponding architec=
ture submaintainers.</p>
<p dir=3D"ltr">Yours, Aleksandar</p>
<p dir=3D"ltr">&gt; =C2=A0bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 13 =
+----<br>
&gt; =C2=A0include/elf/elf-arch.h | 109 +++++++++++++++++++++++++++++++++++=
++++++<br>
&gt; =C2=A0linux-user/elfload.c=C2=A0 =C2=A0|=C2=A0 27 ++--------<br>
&gt; =C2=A03 files changed, 115 insertions(+), 34 deletions(-)<br>
&gt; =C2=A0create mode 100644 include/elf/elf-arch.h<br>
&gt;<br>
&gt; diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
&gt; index 321ee98b86b..adaae0e0dca 100644<br>
&gt; --- a/bsd-user/elfload.c<br>
&gt; +++ b/bsd-user/elfload.c<br>
&gt; @@ -5,6 +5,7 @@<br>
&gt; =C2=A0#include &quot;qemu.h&quot;<br>
&gt; =C2=A0#include &quot;disas/disas.h&quot;<br>
&gt; =C2=A0#include &quot;qemu/path.h&quot;<br>
&gt; +#include &quot;elf/elf-arch.h&quot;<br>
&gt;<br>
&gt; =C2=A0#ifdef _ARCH_PPC64<br>
&gt; =C2=A0#undef ARCH_DLINFO<br>
&gt; @@ -12,7 +13,6 @@<br>
&gt; =C2=A0#undef ELF_HWCAP<br>
&gt; =C2=A0#undef ELF_CLASS<br>
&gt; =C2=A0#undef ELF_DATA<br>
&gt; -#undef ELF_ARCH<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; =C2=A0/* from personality.h */<br>
&gt; @@ -115,7 +115,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2LSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_X86_64<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -141,7 +140,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_386<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -176,7 +174,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt; =C2=A0#endif<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_ARM<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -231,7 +228,6 @@ enum<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARCV9<br>
&gt;<br>
&gt; =C2=A0#define STACK_BIAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2047<br>
&gt;<br>
&gt; @@ -265,7 +261,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARC<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -302,7 +297,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt; =C2=A0#endif<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PPC<br>
&gt;<br>
&gt; =C2=A0/*<br>
&gt; =C2=A0 * We need to put in some extra aux table entries to tell glibc =
what<br>
&gt; @@ -388,7 +382,6 @@ static inline void init_thread(struct target_pt_re=
gs *_regs, struct image_info *<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt; =C2=A0#endif<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MIPS<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -410,7 +403,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 ELFDATA2LSB<br>
&gt; -#define ELF_ARCH=C2=A0 EM_SH<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -432,7 +424,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 ELFDATA2LSB<br>
&gt; -#define ELF_ARCH=C2=A0 EM_CRIS<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -452,7 +443,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 ELFDATA2MSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_68K<br>
&gt;<br>
&gt; =C2=A0/* ??? Does this need to do anything?<br>
&gt; =C2=A0#define ELF_PLAT_INIT(_r) */<br>
&gt; @@ -477,7 +467,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2MSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_ALPHA<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; diff --git a/include/elf/elf-arch.h b/include/elf/elf-arch.h<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..9e052543c51<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/elf/elf-arch.h<br>
&gt; @@ -0,0 +1,109 @@<br>
&gt; +/*<br>
&gt; + * Elf Architecture Definition<br>
&gt; + *<br>
&gt; + * This is a simple expansion to define common Elf types for the<br>
&gt; + * various machines for the various places it&#39;s needed in the sou=
rce<br>
&gt; + * tree.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2019 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.ben=
nee@linaro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt; + *<br>
&gt; + * SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _ELF_ARCH_H_<br>
&gt; +#define _ELF_ARCH_H_<br>
&gt; +<br>
&gt; +#include &quot;elf/elf.h&quot;<br>
&gt; +<br>
&gt; +#ifndef NEED_CPU_H<br>
&gt; +#error Needs an target definition<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef ELF_ARCH<br>
&gt; +#error ELF_ARCH should only be defined once in this file<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_I386<br>
&gt; +#ifdef TARGET_X86_64<br>
&gt; +#define ELF_ARCH EM_X86_64<br>
&gt; +#else<br>
&gt; +#define ELF_ARCH EM_386<br>
&gt; +#endif<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_ARM<br>
&gt; +#ifndef TARGET_AARCH64<br>
&gt; +#define ELF_ARCH EM_ARM<br>
&gt; +#else<br>
&gt; +#define ELF_ARCH EM_AARCH64<br>
&gt; +#endif<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_SPARC<br>
&gt; +#ifdef TARGET_SPARC64<br>
&gt; +#define ELF_ARCH EM_SPARCV9<br>
&gt; +#else<br>
&gt; +#define ELF_ARCH EM_SPARC<br>
&gt; +#endif<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_PPC<br>
&gt; +#define ELF_ARCH EM_PPC<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_MIPS<br>
&gt; +#define ELF_ARCH EM_MIPS<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_MICROBLAZE<br>
&gt; +#define ELF_ARCH EM_MICROBLAZE<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_NIOS2<br>
&gt; +#define ELF_ARCH EM_ALTERA_NIOS2<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_OPENRISC<br>
&gt; +#define ELF_ARCH EM_OPENRISC<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_SH4<br>
&gt; +#define ELF_ARCH EM_SH<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_CRIS<br>
&gt; +#define ELF_ARCH EM_CRIS<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_M68K<br>
&gt; +#define ELF_ARCH EM_68K<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_ALPHA<br>
&gt; +#define ELF_ARCH EM_ALPHA<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_S390X<br>
&gt; +#define ELF_ARCH EM_S390<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_TILEGX<br>
&gt; +#define ELF_ARCH EM_TILEGX<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_RISCV<br>
&gt; +#define ELF_ARCH EM_RISCV<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_HPPA<br>
&gt; +#define ELF_ARCH EM_PARISC<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef TARGET_XTENSA<br>
&gt; +#define ELF_ARCH EM_XTENSA<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#endif /* _ELF_ARCH_H_ */<br>
&gt; diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
&gt; index 59a0d21c6f1..3ac7016a7e3 100644<br>
&gt; --- a/linux-user/elfload.c<br>
&gt; +++ b/linux-user/elfload.c<br>
&gt; @@ -8,10 +8,15 @@<br>
&gt; =C2=A0#include &quot;qemu.h&quot;<br>
&gt; =C2=A0#include &quot;disas/disas.h&quot;<br>
&gt; =C2=A0#include &quot;elf/elf.h&quot;<br>
&gt; +#include &quot;elf/elf-arch.h&quot;<br>
&gt; =C2=A0#include &quot;qemu/path.h&quot;<br>
&gt; =C2=A0#include &quot;qemu/queue.h&quot;<br>
&gt; =C2=A0#include &quot;qemu/guest-random.h&quot;<br>
&gt;<br>
&gt; +#ifndef ELF_ARCH<br>
&gt; +#error something got missed<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =C2=A0#ifdef _ARCH_PPC64<br>
&gt; =C2=A0#undef ARCH_DLINFO<br>
&gt; =C2=A0#undef ELF_PLATFORM<br>
&gt; @@ -19,7 +24,6 @@<br>
&gt; =C2=A0#undef ELF_HWCAP2<br>
&gt; =C2=A0#undef ELF_CLASS<br>
&gt; =C2=A0#undef ELF_DATA<br>
&gt; -#undef ELF_ARCH<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; =C2=A0#define ELF_OSABI=C2=A0 =C2=A0ELFOSABI_SYSV<br>
&gt; @@ -148,7 +152,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt; =C2=A0#define ELF_START_MMAP 0x2aaaaab000ULL<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_X86_64<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs, stru=
ct image_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -211,7 +214,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t *regs, const CPUX86State *en<br>
&gt; =C2=A0 * These are used to set parameters in the core dumps.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_386<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -273,7 +275,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t *regs, const CPUX86State *en<br>
&gt;<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt;<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_ARM<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; @@ -539,7 +540,6 @@ static const char *get_elf_platform(void)<br>
&gt; =C2=A0/* 64 bit ARM definitions */<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt;<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_AARCH64<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS64<br>
&gt; =C2=A0#ifdef TARGET_WORDS_BIGENDIAN<br>
&gt; =C2=A0# define ELF_PLATFORM=C2=A0 =C2=A0 &quot;aarch64_be&quot;<br>
&gt; @@ -667,7 +667,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARCV9<br>
&gt;<br>
&gt; =C2=A0#define STACK_BIAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2047<br>
&gt;<br>
&gt; @@ -696,7 +695,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| HWCAP_SPARC_MULDIV)<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_SPARC<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -728,8 +726,6 @@ static inline void init_thread(struct target_pt_re=
gs *regs,<br>
&gt;<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PPC<br>
&gt; -<br>
&gt; =C2=A0/* Feature masks for the Aux Vector Hardware Capabilities (AT_HW=
CAP).<br>
&gt; =C2=A0 =C2=A0 See arch/powerpc/include/asm/cputable.h.=C2=A0 */<br>
&gt; =C2=A0enum {<br>
&gt; @@ -921,7 +917,6 @@ static void elf_core_copy_regs(target_elf_gregset_=
t *regs, const CPUPPCState *en<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt; =C2=A0#endif<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MIPS<br>
&gt;<br>
&gt; =C2=A0#define elf_check_arch(x) ((x) =3D=3D EM_MIPS || (x) =3D=3D EM_N=
ANOMIPS)<br>
&gt;<br>
&gt; @@ -1014,7 +1009,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt; =C2=A0#define elf_check_arch(x) ( (x) =3D=3D EM_MICROBLAZE || (x) =3D=
=3D EM_MICROBLAZE_OLD)<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_MICROBLAZE<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -1053,7 +1047,6 @@ static void elf_core_copy_regs(target_elf_gregse=
t_t *regs, const CPUMBState *env<br>
&gt; =C2=A0#define elf_check_arch(x) ((x) =3D=3D EM_ALTERA_NIOS2)<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_ALTERA_NIOS2<br>
&gt;<br>
&gt; =C2=A0static void init_thread(struct target_pt_regs *regs, struct imag=
e_info *infop)<br>
&gt; =C2=A0{<br>
&gt; @@ -1107,7 +1100,6 @@ static void elf_core_copy_regs(target_elf_gregse=
t_t *regs,<br>
&gt;<br>
&gt; =C2=A0#define ELF_START_MMAP 0x08000000<br>
&gt;<br>
&gt; -#define ELF_ARCH EM_OPENRISC<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 ELFDATA2MSB<br>
&gt;<br>
&gt; @@ -1146,7 +1138,6 @@ static void elf_core_copy_regs(target_elf_gregse=
t_t *regs,<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 EM_SH<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -1228,7 +1219,6 @@ static uint32_t get_elf_hwcap(void)<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 EM_CRIS<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -1245,7 +1235,6 @@ static inline void init_thread(struct target_pt_=
regs *regs,<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_68K<br>
&gt;<br>
&gt; =C2=A0/* ??? Does this need to do anything?<br>
&gt; =C2=A0 =C2=A0 #define ELF_PLAT_INIT(_r) */<br>
&gt; @@ -1296,7 +1285,6 @@ static void elf_core_copy_regs(target_elf_gregse=
t_t *regs, const CPUM68KState *e<br>
&gt; =C2=A0#define ELF_START_MMAP (0x30000000000ULL)<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_ALPHA<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -1316,7 +1304,6 @@ static inline void init_thread(struct target_pt_=
regs *regs,<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 ELFCLASS64<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFDATA2MSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_S390<br>
&gt;<br>
&gt; =C2=A0#define ELF_HWCAP get_elf_hwcap()<br>
&gt;<br>
&gt; @@ -1362,7 +1349,6 @@ static inline void init_thread(struct target_pt_=
regs *regs, struct image_info *i<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0ELFCLASS64<br>
&gt; =C2=A0#define ELF_DATA=C2=A0 =C2=A0 ELFDATA2LSB<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 EM_TILEGX<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; @@ -1379,7 +1365,6 @@ static inline void init_thread(struct target_pt_=
regs *regs,<br>
&gt; =C2=A0#ifdef TARGET_RISCV<br>
&gt;<br>
&gt; =C2=A0#define ELF_START_MMAP 0x80000000<br>
&gt; -#define ELF_ARCH=C2=A0 EM_RISCV<br>
&gt;<br>
&gt; =C2=A0#ifdef TARGET_RISCV32<br>
&gt; =C2=A0#define ELF_CLASS ELFCLASS32<br>
&gt; @@ -1402,7 +1387,6 @@ static inline void init_thread(struct target_pt_=
regs *regs,<br>
&gt;<br>
&gt; =C2=A0#define ELF_START_MMAP=C2=A0 0x80000000<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_PARISC<br>
&gt; =C2=A0#define ELF_PLATFORM=C2=A0 =C2=A0 &quot;PARISC&quot;<br>
&gt; =C2=A0#define STACK_GROWS_DOWN 0<br>
&gt; =C2=A0#define STACK_ALIGNMENT=C2=A0 64<br>
&gt; @@ -1427,7 +1411,6 @@ static inline void init_thread(struct target_pt_=
regs *regs,<br>
&gt; =C2=A0#define ELF_START_MMAP 0x20000000<br>
&gt;<br>
&gt; =C2=A0#define ELF_CLASS=C2=A0 =C2=A0 =C2=A0 =C2=A0ELFCLASS32<br>
&gt; -#define ELF_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 EM_XTENSA<br>
&gt;<br>
&gt; =C2=A0static inline void init_thread(struct target_pt_regs *regs,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct image_info *infop)<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000716a62059239bd7d--
