Received: by 10.25.150.194 with SMTP id y185csp2546889lfd;
        Wed, 23 Nov 2016 04:57:29 -0800 (PST)
X-Received: by 10.237.35.181 with SMTP id j50mr2723582qtc.138.1479905849109;
        Wed, 23 Nov 2016 04:57:29 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n66si19286361qkf.289.2016.11.23.04.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Nov 2016 04:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D58FEC04B94B;
	Wed, 23 Nov 2016 12:57:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uANCvMkS022055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 23 Nov 2016 07:57:25 -0500
Date: Wed, 23 Nov 2016 13:57:22 +0100
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v6 10/11] arm/arm64: gicv3:
 add an IPI test
Message-ID: <20161123125722.aiekkmxsecl2pu72@kamzik.brq.redhat.com>
References: <1479157719-31021-1-git-send-email-drjones@redhat.com>
 <1479157719-31021-11-git-send-email-drjones@redhat.com>
 <87635f19-cbe5-a432-f2f9-47844ff9e7f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87635f19-cbe5-a432-f2f9-47844ff9e7f4@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 23 Nov 2016 12:57:28 +0000 (UTC)
X-TUID: DBpjcqTN0AJM

On Wed, Nov 23, 2016 at 12:05:42PM +0100, Auger Eric wrote:
> Hi Drew,
> 
> On 14/11/2016 22:08, Andrew Jones wrote:
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > 
> > ---
> > v6: move most gicv2/gicv3 wrappers to common code [Alex]
> > v5:
> >  - fix copy+paste error in gicv3_write_eoir [drew]
> >  - use modern register names [Andre]
> > v4:
> >  - heavily comment gicv3_ipi_send_tlist() [Eric]
> >  - changes needed for gicv2 iar/irqstat fix to other patch
> > v2:
> >  - use IRM for gicv3 broadcast
> > ---
> >  arm/gic.c                  |  97 +++++++++++++++++++++++++-----
> >  arm/unittests.cfg          |   6 ++
> >  lib/arm/asm/arch_gicv3.h   |  23 +++++++
> >  lib/arm/asm/gic-v3.h       |  10 +++-
> >  lib/arm/asm/gic.h          |  60 +++++++++++++++++++
> >  lib/arm/gic.c              | 145 ++++++++++++++++++++++++++++++++++++++++++---
> >  lib/arm64/asm/arch_gicv3.h |  22 +++++++
> >  7 files changed, 338 insertions(+), 25 deletions(-)
> > 
> > diff --git a/arm/gic.c b/arm/gic.c
> > index b42c2b1ca1e1..d954a3775c26 100644
> > --- a/arm/gic.c
> > +++ b/arm/gic.c
> > @@ -3,6 +3,8 @@
> >   *
> >   * GICv2
> >   *   + test sending/receiving IPIs
> > + * GICv3
> > + *   + test sending/receiving IPIs
> >   *
> >   * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
> >   *
> > @@ -16,7 +18,15 @@
> >  #include <asm/barrier.h>
> >  #include <asm/io.h>
> >  
> > -static int gic_version;
> > +struct gic {
> > +	struct {
> > +		void (*send_self)(void);
> > +		void (*send_tlist)(cpumask_t *mask, int irq);
> > +		void (*send_broadcast)(void);
> > +	} ipi;
> > +};
> what is the rationale behind not putting this into common_ops?

I added gic_ipi_send(cpu, irq) to common_ops, which I think will
satisfy most users (it certainly covers send_self easily enough).
gicv3_ipi_send_tlist is also available for gicv3 users. The rest
are trivial, so I didn't want to "clutter" common ops with them.

Keep in mind that this struct is for the unit test, and so it
may choose to define ops with less general uses and/or interfaces.
I.e. in all cases above the irq used is stored in a global variable.
common_ops would want that to be a parameter.

> > +
> > +static struct gic *gic;
> >  static int acked[NR_CPUS], spurious[NR_CPUS];
> >  static cpumask_t ready;
> >  
> > @@ -83,11 +93,11 @@ static void check_spurious(void)
> >  
> >  static void ipi_handler(struct pt_regs *regs __unused)
> >  {
> > -	u32 irqstat = readl(gicv2_cpu_base() + GICC_IAR);
> > -	u32 irqnr = irqstat & GICC_IAR_INT_ID_MASK;
> > +	u32 irqstat = gic_read_iar();
> > +	u32 irqnr = gic_iar_irqnr(irqstat);
> >  
> >  	if (irqnr != GICC_INT_SPURIOUS) {
> > -		writel(irqstat, gicv2_cpu_base() + GICC_EOIR);
> > +		gic_write_eoir(irqstat);
> >  		smp_rmb(); /* pairs with wmb in ipi_test functions */
> >  		++acked[smp_processor_id()];
> >  		smp_wmb(); /* pairs with rmb in check_acked */
> > @@ -97,6 +107,38 @@ static void ipi_handler(struct pt_regs *regs __unused)
> >  	}
> >  }
> >  
> > +static void gicv2_ipi_send_self(void)
> > +{
> > +	writel(2 << 24, gicv2_dist_base() + GICD_SGIR);
> > +}
> > +
> > +static void gicv2_ipi_send_tlist(cpumask_t *mask, int irq __unused)
> > +{
> > +	u8 tlist = (u8)cpumask_bits(mask)[0];
> > +
> > +	writel(tlist << 16, gicv2_dist_base() + GICD_SGIR);
> > +}
> > +
> > +static void gicv2_ipi_send_broadcast(void)
> > +{
> > +	writel(1 << 24, gicv2_dist_base() + GICD_SGIR);
> > +}
> > +
> > +static void gicv3_ipi_send_self(void)
> > +{
> > +	cpumask_t mask;
> > +
> > +	cpumask_clear(&mask);
> > +	cpumask_set_cpu(smp_processor_id(), &mask);
> > +	gicv3_ipi_send_tlist(&mask, 0);
> > +}
> > +
> > +static void gicv3_ipi_send_broadcast(void)
> > +{
> > +	gicv3_write_sgi1r(1ULL << 40);
> > +	isb();
> > +}
> > +
> >  static void ipi_test_self(void)
> >  {
> >  	cpumask_t mask;
> > @@ -106,7 +148,7 @@ static void ipi_test_self(void)
> >  	smp_wmb();
> >  	cpumask_clear(&mask);
> >  	cpumask_set_cpu(0, &mask);
> > -	writel(2 << 24, gicv2_dist_base() + GICD_SGIR);
> > +	gic->ipi.send_self();
> >  	check_acked(&mask);
> >  	report_prefix_pop();
> >  }
> > @@ -114,14 +156,15 @@ static void ipi_test_self(void)
> >  static void ipi_test_smp(void)
> >  {
> >  	cpumask_t mask;
> > -	unsigned long tlist;
> > +	int i;
> >  
> >  	report_prefix_push("target-list");
> >  	memset(acked, 0, sizeof(acked));
> >  	smp_wmb();
> > -	tlist = cpumask_bits(&cpu_present_mask)[0] & 0xaa;
> > -	cpumask_bits(&mask)[0] = tlist;
> > -	writel((u8)tlist << 16, gicv2_dist_base() + GICD_SGIR);
> > +	cpumask_copy(&mask, &cpu_present_mask);
> > +	for (i = 0; i < nr_cpus; i += 2)
> > +		cpumask_clear_cpu(i, &mask);
> > +	gic->ipi.send_tlist(&mask, 0);
> >  	check_acked(&mask);
> >  	report_prefix_pop();
> >  
> > @@ -130,14 +173,14 @@ static void ipi_test_smp(void)
> >  	smp_wmb();
> >  	cpumask_copy(&mask, &cpu_present_mask);
> >  	cpumask_clear_cpu(0, &mask);
> > -	writel(1 << 24, gicv2_dist_base() + GICD_SGIR);
> > +	gic->ipi.send_broadcast();
> >  	check_acked(&mask);
> >  	report_prefix_pop();
> >  }
> >  
> >  static void ipi_enable(void)
> >  {
> > -	gicv2_enable_defaults();
> > +	gic_enable_defaults();
> >  #ifdef __arm__
> >  	install_exception_handler(EXCPTN_IRQ, ipi_handler);
> >  #else
> > @@ -154,18 +197,42 @@ static void ipi_recv(void)
> >  		wfi();
> >  }
> >  
> > +static struct gic gicv2 = {
> > +	.ipi = {
> > +		.send_self = gicv2_ipi_send_self,
> > +		.send_tlist = gicv2_ipi_send_tlist,
> > +		.send_broadcast = gicv2_ipi_send_broadcast,
> > +	},
> > +};
> > +
> > +static struct gic gicv3 = {
> > +	.ipi = {
> > +		.send_self = gicv3_ipi_send_self,
> > +		.send_tlist = gicv3_ipi_send_tlist,
> > +		.send_broadcast = gicv3_ipi_send_broadcast,
> > +	},
> > +};
> > +
> >  int main(int argc, char **argv)
> >  {
> >  	char pfx[8];
> >  	int cpu;
> >  
> > -	gic_version = gic_init();
> > -	if (!gic_version)
> > -		report_abort("No gic present!");
> > +	if (!gic_init())
> > +		report_abort("No supported gic present!");
> >  
> > -	snprintf(pfx, sizeof(pfx), "gicv%d", gic_version);
> > +	snprintf(pfx, sizeof(pfx), "gicv%d", gic_version());
> >  	report_prefix_push(pfx);
> >  
> > +	switch (gic_version()) {
> > +	case 2:
> > +		gic = &gicv2;
> > +		break;
> > +	case 3:
> > +		gic = &gicv3;
> > +		break;
> > +	}
> > +
> >  	if (argc < 2) {
> >  
> >  		report_prefix_push("ipi");
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index e631c35e2bbb..c7392c747f98 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -66,3 +66,9 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'ipi'
> >  groups = gic
> > +
> > +[gicv3-ipi]
> > +file = gic.flat
> > +smp = $MAX_SMP
> > +extra_params = -machine gic-version=3 -append 'ipi'
> > +groups = gic
> > diff --git a/lib/arm/asm/arch_gicv3.h b/lib/arm/asm/arch_gicv3.h
> > index 276577452a14..b47cd2e0090b 100644
> > --- a/lib/arm/asm/arch_gicv3.h
> > +++ b/lib/arm/asm/arch_gicv3.h
> > @@ -16,10 +16,28 @@
> >  #define __stringify xstr
> >  
> >  #define __ACCESS_CP15(CRn, Op1, CRm, Op2)	p15, Op1, %0, CRn, CRm, Op2
> > +#define __ACCESS_CP15_64(Op1, CRm)		p15, Op1, %Q0, %R0, CRm
> >  
> > +#define ICC_EOIR1			__ACCESS_CP15(c12, 0, c12, 1)
> > +#define ICC_IAR1			__ACCESS_CP15(c12, 0, c12, 0)
> > +#define ICC_SGI1R			__ACCESS_CP15_64(0, c12)
> >  #define ICC_PMR				__ACCESS_CP15(c4, 0, c6, 0)
> >  #define ICC_IGRPEN1			__ACCESS_CP15(c12, 0, c12, 7)
> >  
> > +static inline void gicv3_write_eoir(u32 irq)
> > +{
> > +	asm volatile("mcr " __stringify(ICC_EOIR1) : : "r" (irq));
> > +	isb();
> > +}
> > +
> > +static inline u32 gicv3_read_iar(void)
> > +{
> > +	u32 irqstat;
> > +	asm volatile("mrc " __stringify(ICC_IAR1) : "=r" (irqstat));
> > +	dsb(sy);
> > +	return irqstat;
> > +}
> > +
> >  static inline void gicv3_write_pmr(u32 val)
> >  {
> >  	asm volatile("mcr " __stringify(ICC_PMR) : : "r" (val));
> > @@ -31,6 +49,11 @@ static inline void gicv3_write_grpen1(u32 val)
> >  	isb();
> >  }
> >  
> > +static inline void gicv3_write_sgi1r(u64 val)
> > +{
> > +	asm volatile("mcrr " __stringify(ICC_SGI1R) : : "r" (val));
> > +}
> > +
> >  /*
> >   * We may access GICR_TYPER and GITS_TYPER by reading both the TYPER
> >   * offset and the following offset (+ 4) and then combining them to
> > diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
> > index 73ade4681d21..43f9ffce56de 100644
> > --- a/lib/arm/asm/gic-v3.h
> > +++ b/lib/arm/asm/gic-v3.h
> > @@ -33,12 +33,19 @@
> >  #define GICR_ISENABLER0			GICD_ISENABLER
> >  #define GICR_IPRIORITYR0		GICD_IPRIORITYR
> >  
> > +#define ICC_SGI1R_AFFINITY_1_SHIFT	16
> > +#define ICC_SGI1R_AFFINITY_2_SHIFT	32
> > +#define ICC_SGI1R_AFFINITY_3_SHIFT	48
> > +#define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
> > +	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level ## _SHIFT)
> > +
> >  #include <asm/arch_gicv3.h>
> >  
> >  #ifndef __ASSEMBLY__
> >  #include <asm/setup.h>
> > -#include <asm/smp.h>
> >  #include <asm/processor.h>
> > +#include <asm/cpumask.h>
> > +#include <asm/smp.h>
> >  #include <asm/io.h>
> >  
> >  struct gicv3_data {
> > @@ -55,6 +62,7 @@ extern struct gicv3_data gicv3_data;
> >  extern int gicv3_init(void);
> >  extern void gicv3_enable_defaults(void);
> >  extern void gicv3_set_redist_base(size_t stride);
> > +extern void gicv3_ipi_send_tlist(cpumask_t *mask, int irq);
> >  
> >  static inline void gicv3_do_wait_for_rwp(void *base)
> >  {
> > diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
> > index 21511997f2a9..c2267b6b3937 100644
> > --- a/lib/arm/asm/gic.h
> > +++ b/lib/arm/asm/gic.h
> > @@ -42,5 +42,65 @@
> >   */
> >  extern int gic_init(void);
> >  
> > +/*
> > + * gic_common_ops collects some functions that we provide unit
> > + * tests that don't care which gic version they're using.
> nit: wording?

How about

 gic_common_ops collects useful functions for unit tests which
 aren't concerned with the gic version they're using.

> > + */
> > +struct gic_common_ops {
> > +	int gic_version;
> > +	u32 (*read_iar)(void);
> > +	u32 (*iar_irqnr)(u32 iar);
> > +	void (*write_eoir)(u32 irqstat);
> > +	void (*ipi_send)(int cpu, int irq);
> what is the rationale behind not putting enable_defaults here?

Hmm, I don't have a great rationale for that. I was thinking that
'enable_defaults' was a strange op, that 'enable' would be more
appropriate, but I didn't want to set .enable to enable_defaults,
as that may compel unit test writers to use it when they should
instead write their own.

Adding an 'enable_defaults' op makes more sense though... I'll
change this.

> 
> lib/arm/gic.c becomes bigger and bigger. Woudn't it make sense to have
> separate lib/arm/gic-v2/v3.c and arm/gic.c only call generic ops?

I agree with the split.

> 
> Typically ipi functions could go in lib

We have the one, gic_ipi_send(cpu, irq). I could also add a
gic_ipi_send_all(irq), as that may also be useful.

Or... I see my struct gic_common_ops is similar to Linux's
struct irq_chip. irq_chip has ipi_send_single and ipi_send_mask,
so I could copy those choices, and even names.

Thanks,
drew
