Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id js10sm63017242wjb.19.2016.12.13.08.41.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Dec 2016 08:41:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0EF4E3E0C52;
	Tue, 13 Dec 2016 16:41:57 +0000 (GMT)
References: <20161208175030.12269-1-drjones@redhat.com> <20161208175030.12269-4-drjones@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.1.90.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com, eric.auger@redhat.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some delay routines
In-reply-to: <20161208175030.12269-4-drjones@redhat.com>
Date: Tue, 13 Dec 2016 16:41:57 +0000
Message-ID: <8760mnu6ga.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 3PGAyaMK+y4q


Andrew Jones <drjones@redhat.com> writes:

> Allow a thread to wait some specified amount of time. Can
> specify in cycles, usecs, and msecs.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> ---
> v8: rewrote basing on new sysreg framework. Also decided delay
>     functions warrant their own files (delay.[ch])
> ---
>  arm/Makefile.common       |  1 +
>  lib/arm/asm/delay.h       | 14 ++++++++++++++
>  lib/arm/asm/processor.h   | 15 +++++++++++++++
>  lib/arm64/asm/delay.h     |  1 +
>  lib/arm64/asm/processor.h | 12 ++++++++++++
>  lib/arm/delay.c           | 29 +++++++++++++++++++++++++++++
>  6 files changed, 72 insertions(+)
>  create mode 100644 lib/arm/asm/delay.h
>  create mode 100644 lib/arm64/asm/delay.h
>  create mode 100644 lib/arm/delay.c
>
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index b2c0fc8a2fdc..89fe3f69eb44 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -48,6 +48,7 @@ cflatobjs += lib/arm/mmu.o
>  cflatobjs += lib/arm/bitops.o
>  cflatobjs += lib/arm/psci.o
>  cflatobjs += lib/arm/smp.o
> +cflatobjs += lib/arm/delay.o
>
>  libeabi = lib/arm/libeabi.a
>  eabiobjs = lib/arm/eabi_compat.o
> diff --git a/lib/arm/asm/delay.h b/lib/arm/asm/delay.h
> new file mode 100644
> index 000000000000..2436b28c77ae
> --- /dev/null
> +++ b/lib/arm/asm/delay.h
> @@ -0,0 +1,14 @@
> +#ifndef _ASMARM_DELAY_H_
> +#define _ASMARM_DELAY_H_
> +/*
> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +#include <libcflat.h>
> +
> +extern void delay(u64 cycles);
> +extern void udelay(unsigned long usecs);
> +extern void mdelay(unsigned long msecs);
> +
> +#endif /* _ASMARM_DELAY_H_ */
> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> index 6b0d36b87817..857bdd96a3cc 100644
> --- a/lib/arm/asm/processor.h
> +++ b/lib/arm/asm/processor.h
> @@ -7,6 +7,7 @@
>   */
>  #include <asm/ptrace.h>
>  #include <asm/sysreg.h>
> +#include <asm/barrier.h>

Hmm this fails to apply cleanly to master and doesn't build as sysreg.h
isn't in my tree. What happened to it?

>
>  enum vector {
>  	EXCPTN_RST,
> @@ -51,4 +52,18 @@ extern int mpidr_to_cpu(uint64_t mpidr);
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
>
> +#define CNTVCT		__ACCESS_CP15_64(1, c14)
> +#define CNTFRQ		__ACCESS_CP15(c14, 0, c0, 0)
> +
> +static inline u64 get_cntvct(void)
> +{
> +	isb();
> +	return read_sysreg(CNTVCT);
> +}
> +
> +static inline u32 get_cntfrq(void)
> +{
> +	return read_sysreg(CNTFRQ);
> +}
> +
>  #endif /* _ASMARM_PROCESSOR_H_ */
> diff --git a/lib/arm64/asm/delay.h b/lib/arm64/asm/delay.h
> new file mode 100644
> index 000000000000..288e4b3fe610
> --- /dev/null
> +++ b/lib/arm64/asm/delay.h
> @@ -0,0 +1 @@
> +#include "../../arm/asm/delay.h"
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 48abf2c9e358..0898d89f9761 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -20,6 +20,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/esr.h>
>  #include <asm/sysreg.h>
> +#include <asm/barrier.h>
>
>  enum vector {
>  	EL1T_SYNC,
> @@ -83,5 +84,16 @@ extern int mpidr_to_cpu(uint64_t mpidr);
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
>
> +static inline u64 get_cntvct(void)
> +{
> +	isb();
> +	return read_sysreg(cntvct_el0);
> +}
> +
> +static inline u32 get_cntfrq(void)
> +{
> +	return read_sysreg(cntfrq_el0);
> +}
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* _ASMARM64_PROCESSOR_H_ */
> diff --git a/lib/arm/delay.c b/lib/arm/delay.c
> new file mode 100644
> index 000000000000..fa65e2dc9e35
> --- /dev/null
> +++ b/lib/arm/delay.c
> @@ -0,0 +1,29 @@
> +/*
> + * Delay loops
> + *
> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +#include <libcflat.h>
> +#include <asm/processor.h>
> +#include <asm/barrier.h>
> +
> +void delay(u64 cycles)
> +{
> +	u64 start = get_cntvct();
> +
> +	while ((get_cntvct() - start) < cycles)
> +		cpu_relax();
> +}
> +
> +void udelay(unsigned long usec)
> +{
> +	delay((u64)usec * get_cntfrq() / 1000000);
> +}
> +
> +void mdelay(unsigned long msecs)
> +{
> +	while (msecs--)
> +		udelay(1000);
> +}


--
Alex Bennée
