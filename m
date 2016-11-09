Received: by 10.25.150.194 with SMTP id y185csp289243lfd;
        Wed, 9 Nov 2016 06:43:20 -0800 (PST)
X-Received: by 10.194.248.233 with SMTP id yp9mr15249624wjc.228.1478702600268;
        Wed, 09 Nov 2016 06:43:20 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id f84si577077wmi.127.2016.11.09.06.43.20;
        Wed, 09 Nov 2016 06:43:20 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uA9EhJWr009707;
	Wed, 9 Nov 2016 14:43:19 GMT
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v4 09/11] arm/arm64: add
 initial gicv3 support
To: Andrew Jones <drjones@redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-10-git-send-email-drjones@redhat.com>
 <c58f7b92-cd37-ebfd-59b8-71c87032b197@arm.com>
 <20161109130815.6gploizgpmfdmmbw@kamzik.brq.redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
   qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
   eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
   christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <b4fcac1f-2cc5-09c3-0cab-71f5aaa3e7e1@arm.com>
Date: Wed, 9 Nov 2016 14:43:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109130815.6gploizgpmfdmmbw@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 9axWykibEduQ

Hi,

On 09/11/16 13:08, Andrew Jones wrote:
> On Wed, Nov 09, 2016 at 12:35:48PM +0000, Andre Przywara wrote:
> [...]
>>> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
>>> new file mode 100644
>>> index 000000000000..03321f8c860f
>>> --- /dev/null
>>> +++ b/lib/arm/asm/gic-v3.h
>>> @@ -0,0 +1,92 @@
>>> +/*
>>> + * All GIC* defines are lifted from include/linux/irqchip/arm-gic-v3.h
>>> + *
>>> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU LGPL, version 2.
>>> + */
>>> +#ifndef _ASMARM_GIC_V3_H_
>>> +#define _ASMARM_GIC_V3_H_
>>> +
>>> +#ifndef _ASMARM_GIC_H_
>>> +#error Do not directly include <asm/gic-v3.h>. Include <asm/gic.h>
>>> +#endif
>>> +
>>> +#define GICD_CTLR			0x0000
>>> +#define GICD_TYPER			0x0004
>>
>> So if we share the distributor register definition with GICv2, these
>> shouldn't be here, but in gic.h.
>> But this is the right naming scheme we should use (instead of GIC_DIST_xxx).
>>
>> Now this gets interesting with your wish to both share the definitions
>> for the GICv2 and GICv3 distributors, but also stick to the names the
>> kernel uses (because they differ between the two) ;-)
>> So now you loose the greppability for either GIC_DIST_CTR or GICD_TYPER,
>> for instance.
> 
> Well, we just have the same offset with two names (giving us two
> symbols to grep). I put them here, vs. asm/gic.h, because the kernel
> only uses theses symbols for gicv3. Now, nothing stops a unit test
> from using them with gicv2 tests, though, because unit tests include
> gic.h, which includes both gic-v2.h and gic-v3.h, and thus it gets
> both. I know, it's sounding messy... Shouldn't we post some churn to
> the kernel? :-)

Well, on top of that the distributor registers are slightly different
(check CTLR and TYPER, for instance). So it's churn plus a stretch, I
guess Marc won't like that.

So if greppability is important, should we revert to separate
definitions in separate header files then, like in v3?
I don't think we actually share _code_ between the two GIC revisions, do we?

> Note, I tried to only add defines to asm/gic.h that are actually
> shared in the kernel between v2 and v3, e.g. GIC_DIST_ENABLE_SET.

Huh? GICv3 uses GICD_ISENABLER for that register.

> Actually, GIC_DIST_CTRL and GIC_DIST_CTR may be the only exceptions
> we have so far.

Note that it's GIC_DIST_CTLR (L and R swapped), one reason more to dump
_CTR ;-)

>>
>>> +#define GICD_IGROUPR			0x0080
>>> +
>>> +#define GICD_CTLR_RWP			(1U << 31)
>>> +#define GICD_CTLR_ARE_NS		(1U << 4)
>>> +#define GICD_CTLR_ENABLE_G1A		(1U << 1)
>>> +#define GICD_CTLR_ENABLE_G1		(1U << 0)
>>> +
>>> +#define GICR_TYPER			0x0008
>>> +#define GICR_IGROUPR0			GICD_IGROUPR
>>> +#define GICR_TYPER_LAST			(1U << 4)
>>> +
>>> +
>>> +#include <asm/arch_gicv3.h>
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +#include <asm/setup.h>
>>> +#include <asm/smp.h>
>>> +#include <asm/processor.h>
>>> +#include <asm/io.h>
>>> +
>>> +struct gicv3_data {
>>> +	void *dist_base;
>>> +	void *redist_base[NR_CPUS];
>>> +	unsigned int irq_nr;
>>> +};
>>> +extern struct gicv3_data gicv3_data;
>>> +
>>> +#define gicv3_dist_base()		(gicv3_data.dist_base)
>>> +#define gicv3_redist_base()		(gicv3_data.redist_base[smp_processor_id()])
>>> +#define gicv3_sgi_base()		(gicv3_data.redist_base[smp_processor_id()] + SZ_64K)
>>> +
>>> +extern int gicv3_init(void);
>>> +extern void gicv3_enable_defaults(void);
>>> +
>>> +static inline void gicv3_do_wait_for_rwp(void *base)
>>> +{
>>> +	int count = 100000;	/* 1s */
>>> +
>>> +	while (readl(base + GICD_CTLR) & GICD_CTLR_RWP) {
>>> +		if (!--count) {
>>> +			printf("GICv3: RWP timeout!\n");
>>> +			abort();
>>> +		}
>>> +		cpu_relax();
>>> +		udelay(10);
>>> +	};
>>> +}
>>> +
>>> +static inline void gicv3_dist_wait_for_rwp(void)
>>> +{
>>> +	gicv3_do_wait_for_rwp(gicv3_dist_base());
>>> +}
>>> +
>>> +static inline void gicv3_redist_wait_for_rwp(void)
>>> +{
>>> +	gicv3_do_wait_for_rwp(gicv3_redist_base());
>>> +}
>>> +
>>> +static inline u32 mpidr_compress(u64 mpidr)
>>> +{
>>> +	u64 compressed = mpidr & MPIDR_HWID_BITMASK;
>>> +
>>> +	compressed = (((compressed >> 32) & 0xff) << 24) | compressed;
>>> +	return compressed;
>>> +}
>>> +
>>> +static inline u64 mpidr_uncompress(u32 compressed)
>>> +{
>>> +	u64 mpidr = ((u64)compressed >> 24) << 32;
>>> +
>>> +	mpidr |= compressed & MPIDR_HWID_BITMASK;
>>> +	return mpidr;
>>> +}
>>> +
>>> +#endif /* !__ASSEMBLY__ */
>>> +#endif /* _ASMARM_GIC_V3_H_ */
>>> diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
>>> index 328e078a9ae1..4897bc592cdd 100644
>>> --- a/lib/arm/asm/gic.h
>>> +++ b/lib/arm/asm/gic.h
>>> @@ -7,6 +7,7 @@
>>>  #define _ASMARM_GIC_H_
>>>  
>>>  #include <asm/gic-v2.h>
>>> +#include <asm/gic-v3.h>
>>>  
>>>  #define GIC_CPU_CTRL			0x00
>>>  #define GIC_CPU_PRIMASK			0x04
>>> diff --git a/lib/arm/gic.c b/lib/arm/gic.c
>>> index 91d78c9a0cc2..af58a11ea13e 100644
>>> --- a/lib/arm/gic.c
>>> +++ b/lib/arm/gic.c
>>> @@ -8,9 +8,11 @@
>>>  #include <asm/io.h>
>>>  
>>>  struct gicv2_data gicv2_data;
>>> +struct gicv3_data gicv3_data;
>>>  
>>>  /*
>>>   * Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
>>> + * Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>>   */
>>>  static bool
>>>  gic_get_dt_bases(const char *compatible, void **base1, void **base2)
>>> @@ -48,10 +50,18 @@ int gicv2_init(void)
>>>  			&gicv2_data.dist_base, &gicv2_data.cpu_base);
>>>  }
>>>  
>>> +int gicv3_init(void)
>>> +{
>>> +	return gic_get_dt_bases("arm,gic-v3", &gicv3_data.dist_base,
>>> +			&gicv3_data.redist_base[0]);
>>> +}
>>> +
>>>  int gic_init(void)
>>>  {
>>>  	if (gicv2_init())
>>>  		return 2;
>>> +	else if (gicv3_init())
>>> +		return 3;
>>>  	return 0;
>>>  }
>>>  
>>> @@ -73,3 +83,49 @@ void gicv2_enable_defaults(void)
>>>  	writel(GICC_INT_PRI_THRESHOLD, cpu_base + GIC_CPU_PRIMASK);
>>>  	writel(GICC_ENABLE, cpu_base + GIC_CPU_CTRL);
>>>  }
>>> +
>>> +void gicv3_set_redist_base(void)
>>> +{
>>> +	u32 aff = mpidr_compress(get_mpidr());
>>> +	void *ptr = gicv3_data.redist_base[0];
>>> +	u64 typer;
>>> +
>>> +	do {
>>> +		typer = gicv3_read_typer(ptr + GICR_TYPER);
>>> +		if ((typer >> 32) == aff) {
>>> +			gicv3_redist_base() = ptr;
>>> +			return;
>>> +		}
>>> +		ptr += SZ_64K * 2; /* skip RD_base and SGI_base */
>>> +	} while (!(typer & GICR_TYPER_LAST));
>>> +	assert(0);
>>> +}
>>> +
>>> +void gicv3_enable_defaults(void)
>>> +{
>>> +	void *dist = gicv3_dist_base();
>>> +	void *sgi_base;
>>> +	unsigned int i;
>>> +
>>> +	gicv3_data.irq_nr = GICD_TYPER_IRQS(readl(dist + GICD_TYPER));
>>> +	if (gicv3_data.irq_nr > 1020)
>>> +		gicv3_data.irq_nr = 1020;
>>> +
>>> +	writel(GICD_CTLR_ARE_NS | GICD_CTLR_ENABLE_G1A | GICD_CTLR_ENABLE_G1,
>>> +	       dist + GICD_CTLR);
>>> +	gicv3_dist_wait_for_rwp();
>>> +
>>> +	if (!gicv3_redist_base())
>>> +		gicv3_set_redist_base();
>>> +	sgi_base = gicv3_sgi_base();
>>> +
>>> +	writel(~0, sgi_base + GICR_IGROUPR0);
>>
>> This is mixing redist setup with distributor setup. Is it that what you
>> meant with:
>> " - simplify enable by not caring if we reinit the distributor [drew]"?
> 
> Yes, but, TBH, I wasn't sure I could get away with it. I tested and it
> worked, and I figured you'd yell at me if I was wrong :-)
> 
>>
>> Also if you set the group for the SGIs, you should set it for SPIs as
>> well (like the kernel does). This was done in v3 of the series.
> 
> OK, I was also simplifying by removing everything and then adding stuff
> back until it worked :-) I can certainly add this back for completeness
> though.

So you did need IGROUP0?

Actually the VGIC implements a single security state, where those
registers are supposed to be RAZ/WI, if I get the spec correctly.
And KVM implements them as RAO/WI, both for GICR_IGROUPR0 and GICD_IGROUPRn.
But the kernel sets both of them up (because it drives real hardware),
so I'd trust Marc's wisdom more here ;-)
If we don't need this GROUPR setup for proper functionality, we could
move it from the generic setup into an actual test.

>> What about you finish the per-CPU setup first, then bail out with:
>>
>> if (smp_processor_id() != 0)
>> 	return;
>>
>> and then do the distributor setup (only on the first core).
> 
> Sure, if it's necessary. I actually like not having to worry about
> a particular core or a particular order/number of times this enable
> gets called. Does it hurt to just do it each time?

Shouldn't really, so we could let it stay in there until someone
complains ...

Cheers,
Andre.
