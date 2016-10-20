Received: by 10.80.166.35 with SMTP id d32csp950471edc;
        Thu, 20 Oct 2016 10:28:41 -0700 (PDT)
X-Received: by 10.25.141.19 with SMTP id p19mr1602684lfd.56.1476984521305;
        Thu, 20 Oct 2016 10:28:41 -0700 (PDT)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id y133si1093132lfc.134.2016.10.20.10.28.40;
        Thu, 20 Oct 2016 10:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id u9KHSdWr001048;
	Thu, 20 Oct 2016 18:28:39 +0100 (BST)
Subject: Re: [kvm-unit-tests PATCH v3 07/10] arm/arm64: add initial gicv3
 support
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com, qemu-devel@nongnu.org,
   qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
 <1468587641-7300-8-git-send-email-drjones@redhat.com>
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
   wei@redhat.com
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <0b1de847-a402-b816-a01d-c4bdcd248e75@arm.com>
Date: Thu, 20 Oct 2016 18:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1468587641-7300-8-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: gbSjZqJ9Mk9V

Hi Drew,

On 15/07/16 14:00, Andrew Jones wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> ---
> v2: configure irqs as NS GRP1
> ---
>  lib/arm/asm/arch_gicv3.h   | 184 ++++++++++++++++++++++++++
>  lib/arm/asm/gic-v3.h       | 321 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/arm/asm/gic.h          |   1 +
>  lib/arm/gic.c              |  73 +++++++++++
>  lib/arm64/asm/arch_gicv3.h | 169 ++++++++++++++++++++++++
>  lib/arm64/asm/gic-v3.h     |   1 +
>  lib/arm64/asm/sysreg.h     |  44 +++++++
>  7 files changed, 793 insertions(+)
>  create mode 100644 lib/arm/asm/arch_gicv3.h
>  create mode 100644 lib/arm/asm/gic-v3.h
>  create mode 100644 lib/arm64/asm/arch_gicv3.h
>  create mode 100644 lib/arm64/asm/gic-v3.h
>  create mode 100644 lib/arm64/asm/sysreg.h
> 
> diff --git a/lib/arm/asm/arch_gicv3.h b/lib/arm/asm/arch_gicv3.h
> new file mode 100644
> index 0000000000000..d529a7eb62807
> --- /dev/null
> +++ b/lib/arm/asm/arch_gicv3.h
> @@ -0,0 +1,184 @@
> +/*
> + * All ripped off from arch/arm/include/asm/arch_gicv3.h

So I was wondering if - from a test suite's perspective - it's really
clever to pull in copies of Linux headers here.
First it's really a lot of text we pull in while not using most of it
(at least now). Also they keep changing (4.9-rc1 saw so me changes, for
instance). So do we update them?

But more importantly those headers are also used in the emulation code,
so we would just copy any bugs or typos and would probably not detect
them here. IIRC there was a fix for a bitmask lately.
It's probably fine to copy the register offsets, but anything that
defines Linux specific things like default priorities or more complex
macros should be avoided, I think. This just makes kvm-unit-test copying
Linux behaviour.

Maybe we stick to the Linux naming, but pull in only the fields as we
need them? This would both limit the amount of lines being merged, as
would simplify the review effort (and quality), as people would just
need to look at a very limited number of defines, allowing them to
actually check it against the specification?

I gave this a try and could reduce the header files significantly.
Please let me know if you need any bits from this effort to be shared.

> + *
> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +#ifndef _ASMARM_ARCH_GICV3_H_
> +#define _ASMARM_ARCH_GICV3_H_
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <libcflat.h>
> +#include <asm/barrier.h>
> +#include <asm/io.h>
> +
> +#define __stringify xstr
> +
> +
> +#define __ACCESS_CP15(CRn, Op1, CRm, Op2)	p15, Op1, %0, CRn, CRm, Op2
> +#define __ACCESS_CP15_64(Op1, CRm)		p15, Op1, %Q0, %R0, CRm
> +
> +#define ICC_EOIR1			__ACCESS_CP15(c12, 0, c12, 1)
> +#define ICC_DIR				__ACCESS_CP15(c12, 0, c11, 1)
> +#define ICC_IAR1			__ACCESS_CP15(c12, 0, c12, 0)
> +#define ICC_SGI1R			__ACCESS_CP15_64(0, c12)
> +#define ICC_PMR				__ACCESS_CP15(c4, 0, c6, 0)
> +#define ICC_CTLR			__ACCESS_CP15(c12, 0, c12, 4)
> +#define ICC_SRE				__ACCESS_CP15(c12, 0, c12, 5)
> +#define ICC_IGRPEN1			__ACCESS_CP15(c12, 0, c12, 7)
> +
> +#define ICC_HSRE			__ACCESS_CP15(c12, 4, c9, 5)
> +
> +#define ICH_VSEIR			__ACCESS_CP15(c12, 4, c9, 4)
> +#define ICH_HCR				__ACCESS_CP15(c12, 4, c11, 0)
> +#define ICH_VTR				__ACCESS_CP15(c12, 4, c11, 1)
> +#define ICH_MISR			__ACCESS_CP15(c12, 4, c11, 2)
> +#define ICH_EISR			__ACCESS_CP15(c12, 4, c11, 3)
> +#define ICH_ELSR			__ACCESS_CP15(c12, 4, c11, 5)
> +#define ICH_VMCR			__ACCESS_CP15(c12, 4, c11, 7)
> +
> +#define __LR0(x)			__ACCESS_CP15(c12, 4, c12, x)
> +#define __LR8(x)			__ACCESS_CP15(c12, 4, c13, x)

So for instance we clearly don't need those defines (the list registers
being hypervisor only).

> +
> +#define ICH_LR0				__LR0(0)
> +#define ICH_LR1				__LR0(1)
> +#define ICH_LR2				__LR0(2)
> +#define ICH_LR3				__LR0(3)
> +#define ICH_LR4				__LR0(4)
> +#define ICH_LR5				__LR0(5)
> +#define ICH_LR6				__LR0(6)
> +#define ICH_LR7				__LR0(7)
> +#define ICH_LR8				__LR8(0)
> +#define ICH_LR9				__LR8(1)
> +#define ICH_LR10			__LR8(2)
> +#define ICH_LR11			__LR8(3)
> +#define ICH_LR12			__LR8(4)
> +#define ICH_LR13			__LR8(5)
> +#define ICH_LR14			__LR8(6)
> +#define ICH_LR15			__LR8(7)
> +
> +/* LR top half */
> +#define __LRC0(x)			__ACCESS_CP15(c12, 4, c14, x)
> +#define __LRC8(x)			__ACCESS_CP15(c12, 4, c15, x)
> +
> +#define ICH_LRC0			__LRC0(0)
> +#define ICH_LRC1			__LRC0(1)
> +#define ICH_LRC2			__LRC0(2)
> +#define ICH_LRC3			__LRC0(3)
> +#define ICH_LRC4			__LRC0(4)
> +#define ICH_LRC5			__LRC0(5)
> +#define ICH_LRC6			__LRC0(6)
> +#define ICH_LRC7			__LRC0(7)
> +#define ICH_LRC8			__LRC8(0)
> +#define ICH_LRC9			__LRC8(1)
> +#define ICH_LRC10			__LRC8(2)
> +#define ICH_LRC11			__LRC8(3)
> +#define ICH_LRC12			__LRC8(4)
> +#define ICH_LRC13			__LRC8(5)
> +#define ICH_LRC14			__LRC8(6)
> +#define ICH_LRC15			__LRC8(7)

....
> +
> +/*
> + * Cavium ThunderX erratum 23154
> + *
> + * The gicv3 of ThunderX requires a modified version for reading the
> + * IAR status to ensure data synchronization (access to icc_iar1_el1
> + * is not sync'ed before and after).
> + */
> +static inline u64 gicv3_read_iar_cavium_thunderx(void)

Are we looking at including those errata workarounds?
I think this may be needed if we want to run tests on those machines,
but may open up a can of worms....

Cheers,
Andre.


> +{
> +	u64 irqstat;
> +
> +	asm volatile(
> +		"nop;nop;nop;nop\n\t"
> +		"nop;nop;nop;nop\n\t"
> +		"mrs_s %0, " __stringify(ICC_IAR1_EL1) "\n\t"
> +		"nop;nop;nop;nop"
> +		: "=r" (irqstat));
> +	mb();
> +
> +	return irqstat;
> +}
> +
