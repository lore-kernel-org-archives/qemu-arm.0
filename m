Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1627814ejo;
        Wed, 13 Dec 2023 05:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6zvVgvIe4mxSUHiuHn4P0UgLm9K41zYuj2PDUx72hfqbHAhMSJUEX6C+kifG2YaAmvSul
X-Received: by 2002:a5d:6151:0:b0:333:491a:3c78 with SMTP id y17-20020a5d6151000000b00333491a3c78mr4126334wrt.120.1702475144699;
        Wed, 13 Dec 2023 05:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702475144; cv=none;
        d=google.com; s=arc-20160816;
        b=JMYK+ABbY/af2Ourpb+8JNMcnTtbXs3nr8JabP00t6ZZumA1N1dEh8n3AcCGfSJKeh
         +AKs8mSAtC0gmrXeVm8sCEebqluDJTxYKQeamkJBXXOnPp1SjiTlZT5Zm+n3JI9fFgGY
         T9uJoM4hmi8mviCB9qzvfE+MdVH72QKcC6maD6xBsj49EO973B7lK3EDE5JC7UqGA8UF
         vDr2K7XsL9+HKmWl3W13y72TGgFxzTJAdMRBifV41rcBwImaLRIAQWyRcLIg3wZgLNdS
         jjQTJ7CDqYZUOsZuvZf+mbSZaAZVTPx6LjyRwTdPUQo4sbQn7j7DwoHKNoFFaY73FvmQ
         S1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=RQNtx23A0xZ6yY84siI0xv3MruEvbwc7elg0gTVjf1g=;
        fh=o10zyVK66X51tNdIFplzvrHxYc7syMY284yQE2oTVqs=;
        b=Xez4lTmZmJAF933xsMTS0zqH8YScOgAe7XOBLCh3OHb38xT7xOOEstKAQHSXXIJh80
         QM4adsQLzMEzVyF9V0PDu3zyQ3zzgwcITuUROGFpTShleDjgx66j1rwAzaNPdxCnjOVw
         zsjRua531fT1a0sxGvkBYwjFonuOrlib1eJ/YJ1E1K96GNU+Eh6+jdCSEiLLMwzpT7k2
         NUqONp6Q9hp31i8Or8Hmn+BvLZyL2pMJLR3EKjSfjjP5FLUQQ0pcPJXmJ5yHoE6sRL1P
         AKsHUGtrGnFjJkpxj9Wtjx0v0BW+35sso29U5wQIwFJeKXQEYeW468n9m8pvSJ9t4eVN
         9P7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=TQX2UyhM;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id n15-20020a5d400f000000b003332dceca5dsi6211533wrp.1074.2023.12.13.05.45.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 05:45:44 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=TQX2UyhM;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RQNtx23A0xZ6yY84siI0xv3MruEvbwc7elg0gTVjf1g=; b=TQX2UyhM66VRgwWelyHyiqcBWo
	erepDb7g+bRr/LxftvSJJfVkp01PlG+fU6vMak8oA45KgGnOdFQnBhZofR1Ho01cu7CdBX0AQ6ozl
	1oKlp1NxnLT3PyiPfK4gN8txaBqnmhE6S2c8NHhkNwUZeFmRCAmxZhGMB95t5VNEk4zM=;
Date: Wed, 13 Dec 2023 14:45:34 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, 
	Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 16/23] exec: Move [b]tswapl() declarations to
 'exec/user/tswap-target.h'
Message-ID: <vp7ww4t42h2da6pwozr6l4kgsrhslrrlncirb2jnd42mrj2p6c@aua4egifp56j>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-17-philmd@linaro.org>
X-TUID: R1q/x0je6+Hl

On 12/12/23, Philippe Mathieu-Daudé wrote:
> tswapl() and bswaptls() are target-dependent and only used
> by user emulation. Move their definitions to a new header:
> "exec/user/tswap-target.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  bsd-user/freebsd/target_os_elf.h   |  1 +
>  bsd-user/freebsd/target_os_stack.h |  1 +
>  bsd-user/netbsd/target_os_elf.h    |  1 +
>  bsd-user/openbsd/target_os_elf.h   |  1 +
>  include/exec/cpu-all.h             |  8 --------
>  include/exec/user/abitypes.h       |  1 +
>  include/exec/user/tswap-target.h   | 22 ++++++++++++++++++++++
>  bsd-user/signal.c                  |  1 +
>  bsd-user/strace.c                  |  1 +
>  linux-user/elfload.c               |  1 +
>  linux-user/i386/signal.c           |  1 +
>  linux-user/ppc/signal.c            |  1 +
>  12 files changed, 32 insertions(+), 8 deletions(-)
>  create mode 100644 include/exec/user/tswap-target.h
> 
> diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
> index 9df17d56d8..27d8ce036c 100644
> --- a/bsd-user/freebsd/target_os_elf.h
> +++ b/bsd-user/freebsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  #define bsd_get_ncpu() 1 /* until we pull in bsd-proc.[hc] */
>  
> diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
> index d15fc3263f..6125208182 100644
> --- a/bsd-user/freebsd/target_os_stack.h
> +++ b/bsd-user/freebsd/target_os_stack.h
> @@ -23,6 +23,7 @@
>  #include <sys/param.h>
>  #include "target_arch_sigtramp.h"
>  #include "qemu/guest-random.h"
> +#include "exec/user/tswap-target.h"
>  
>  /*
>   * The initial FreeBSD stack is as follows:
> diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
> index 2f3cb20871..23b422bfce 100644
> --- a/bsd-user/netbsd/target_os_elf.h
> +++ b/bsd-user/netbsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* this flag is uneffective under linux too, should be deleted */
>  #ifndef MAP_DENYWRITE
> diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
> index 6dca9c5a85..fc1dfa2e49 100644
> --- a/bsd-user/openbsd/target_os_elf.h
> +++ b/bsd-user/openbsd/target_os_elf.h
> @@ -22,6 +22,7 @@
>  
>  #include "target_arch_elf.h"
>  #include "elf.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* this flag is uneffective under linux too, should be deleted */
>  #ifndef MAP_DENYWRITE
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index b042d94892..95af418920 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -36,14 +36,6 @@
>  #define BSWAP_NEEDED
>  #endif
>  
> -#if TARGET_LONG_SIZE == 4
> -#define tswapl(s) tswap32(s)
> -#define bswaptls(s) bswap32s(s)
> -#else
> -#define tswapl(s) tswap64(s)
> -#define bswaptls(s) bswap64s(s)
> -#endif
> -
>  /* Target-endianness CPU memory access functions. These fit into the
>   * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
>   */
> diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
> index 6178453d94..ed10d5fe7e 100644
> --- a/include/exec/user/abitypes.h
> +++ b/include/exec/user/abitypes.h
> @@ -2,6 +2,7 @@
>  #define EXEC_USER_ABITYPES_H
>  
>  #include "cpu.h"
> +#include "exec/user/tswap-target.h"
>  
>  #ifdef TARGET_ABI32
>  #define TARGET_ABI_BITS 32
> diff --git a/include/exec/user/tswap-target.h b/include/exec/user/tswap-target.h
> new file mode 100644
> index 0000000000..ff302436fe
> --- /dev/null
> +++ b/include/exec/user/tswap-target.h
> @@ -0,0 +1,22 @@
> +/*
> + * target-specific swap() definitions
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +#ifndef EXEC_USER_TSWAP_H
> +#define EXEC_USER_TSWAP_H
> +
> +#include "exec/cpu-defs.h"
> +#include "exec/tswap.h"
> +
> +#if TARGET_LONG_SIZE == 4
> +#define tswapl(s) tswap32(s)
> +#define bswaptls(s) bswap32s(s)
> +#else
> +#define tswapl(s) tswap64(s)
> +#define bswaptls(s) bswap64s(s)
> +#endif
> +
> +#endif
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ca31470772..7b2d25230a 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  #include "gdbstub/user.h"
>  #include "signal-common.h"
>  #include "trace.h"
> diff --git a/bsd-user/strace.c b/bsd-user/strace.c
> index 96499751eb..a1b738e63c 100644
> --- a/bsd-user/strace.c
> +++ b/bsd-user/strace.c
> @@ -22,6 +22,7 @@
>  #include <sys/ioccom.h>
>  
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  
>  #include "os-strace.h"  /* OS dependent strace print functions */
>  
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index cf9e74468b..debea5c355 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -6,6 +6,7 @@
>  #include <sys/shm.h>
>  
>  #include "qemu.h"
> +#include "exec/user/tswap-target.h"
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "loader.h"
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index bc5d45302e..eea1fa68c9 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -21,6 +21,7 @@
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "linux-user/trace.h"
> +#include "exec/user/tswap-target.h"
>  
>  /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
>  
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 7e7302823b..988b59a916 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -21,6 +21,7 @@
>  #include "user-internals.h"
>  #include "signal-common.h"
>  #include "linux-user/trace.h"
> +#include "exec/user/tswap-target.h"
>  #include "vdso-asmoffset.h"
>  
>  /* See arch/powerpc/include/asm/ucontext.h.  Only used for 32-bit PPC;
> -- 
> 2.41.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>
