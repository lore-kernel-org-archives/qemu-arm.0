Received: by 10.25.27.66 with SMTP id b63csp1613067lfb;
        Mon, 6 Jun 2016 10:48:36 -0700 (PDT)
X-Received: by 10.200.35.4 with SMTP id a4mr17257669qta.17.1465235316754;
        Mon, 06 Jun 2016 10:48:36 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c3si5275082qkg.226.2016.06.06.10.48.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 10:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2DD88E25B;
	Mon,  6 Jun 2016 17:48:35 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u56HmVkY011230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jun 2016 13:48:33 -0400
Date: Mon, 6 Jun 2016 19:48:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, christoffer.dall@linaro.org,
        marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 04/10] arm/arm64: add some delay
 routines
Message-ID: <20160606174830.oxpsi3rh4duj6l7z@hawk.localdomain>
References: <1465064165-14885-5-git-send-email-drjones@redhat.com>
 <87vb1mgqs9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87vb1mgqs9.fsf@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 06 Jun 2016 17:48:35 +0000 (UTC)
X-TUID: hXaWnQJbOm4D

On Mon, Jun 06, 2016 at 06:39:50PM +0100, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Allow a thread to wait some specified amount of time. Can
> > specify in cycles, usecs, and msecs.
> 
> I wonder if delay() and mdelay() can be in common code with just the
> freq and count getting functions in specific code? I guess that would
> need a lib/arm-generic/ or some such?

I'll think about that.

> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks,
drew

> 
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  lib/arm/asm/processor.h   | 19 +++++++++++++++++++
> >  lib/arm/processor.c       | 15 +++++++++++++++
> >  lib/arm64/asm/processor.h | 19 +++++++++++++++++++
> >  lib/arm64/processor.c     | 15 +++++++++++++++
> >  4 files changed, 68 insertions(+)
> >
> > diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> > index d2048f5f5f7e6..afc903ca7d4ab 100644
> > --- a/lib/arm/asm/processor.h
> > +++ b/lib/arm/asm/processor.h
> > @@ -5,7 +5,9 @@
> >   *
> >   * This work is licensed under the terms of the GNU LGPL, version 2.
> >   */
> > +#include <libcflat.h>
> >  #include <asm/ptrace.h>
> > +#include <asm/barrier.h>
> >
> >  enum vector {
> >  	EXCPTN_RST,
> > @@ -51,4 +53,21 @@ extern int mpidr_to_cpu(unsigned long mpidr);
> >  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
> >  extern bool is_user(void);
> >
> > +static inline u64 get_cntvct(void)
> > +{
> > +	u64 vct;
> > +	isb();
> > +	asm volatile("mrrc p15, 1, %Q0, %R0, c14" : "=r" (vct));
> > +	return vct;
> > +}
> > +
> > +extern void delay(u64 cycles);
> > +extern void udelay(unsigned long usecs);
> > +
> > +static inline void mdelay(unsigned long msecs)
> > +{
> > +	while (msecs--)
> > +		udelay(1000);
> > +}
> > +
> >  #endif /* _ASMARM_PROCESSOR_H_ */
> > diff --git a/lib/arm/processor.c b/lib/arm/processor.c
> > index 54fdb87ef0196..c2ee360df6884 100644
> > --- a/lib/arm/processor.c
> > +++ b/lib/arm/processor.c
> > @@ -9,6 +9,7 @@
> >  #include <asm/ptrace.h>
> >  #include <asm/processor.h>
> >  #include <asm/thread_info.h>
> > +#include <asm/barrier.h>
> >
> >  static const char *processor_modes[] = {
> >  	"USER_26", "FIQ_26" , "IRQ_26" , "SVC_26" ,
> > @@ -141,3 +142,17 @@ bool is_user(void)
> >  {
> >  	return current_thread_info()->flags & TIF_USER_MODE;
> >  }
> > +
> > +void delay(u64 cycles)
> > +{
> > +	u64 start = get_cntvct();
> > +	while ((get_cntvct() - start) < cycles)
> > +		cpu_relax();
> > +}
> > +
> > +void udelay(unsigned long usec)
> > +{
> > +	unsigned int frq;
> > +	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
> > +	delay((u64)usec * frq / 1000000);
> > +}
> > diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> > index 7e448dc81a6aa..94f7ce35b65c1 100644
> > --- a/lib/arm64/asm/processor.h
> > +++ b/lib/arm64/asm/processor.h
> > @@ -17,8 +17,10 @@
> >  #define SCTLR_EL1_M	(1 << 0)
> >
> >  #ifndef __ASSEMBLY__
> > +#include <libcflat.h>
> >  #include <asm/ptrace.h>
> >  #include <asm/esr.h>
> > +#include <asm/barrier.h>
> >
> >  enum vector {
> >  	EL1T_SYNC,
> > @@ -89,5 +91,22 @@ extern int mpidr_to_cpu(unsigned long mpidr);
> >  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
> >  extern bool is_user(void);
> >
> > +static inline u64 get_cntvct(void)
> > +{
> > +	u64 vct;
> > +	isb();
> > +	asm volatile("mrs %0, cntvct_el0" : "=r" (vct));
> > +	return vct;
> > +}
> > +
> > +extern void delay(u64 cycles);
> > +extern void udelay(unsigned long usecs);
> > +
> > +static inline void mdelay(unsigned long msecs)
> > +{
> > +	while (msecs--)
> > +		udelay(1000);
> > +}
> > +
> >  #endif /* !__ASSEMBLY__ */
> >  #endif /* _ASMARM64_PROCESSOR_H_ */
> > diff --git a/lib/arm64/processor.c b/lib/arm64/processor.c
> > index deeab4ec9c8ac..50fa835c6f1e3 100644
> > --- a/lib/arm64/processor.c
> > +++ b/lib/arm64/processor.c
> > @@ -9,6 +9,7 @@
> >  #include <asm/ptrace.h>
> >  #include <asm/processor.h>
> >  #include <asm/thread_info.h>
> > +#include <asm/barrier.h>
> >
> >  static const char *vector_names[] = {
> >  	"el1t_sync",
> > @@ -253,3 +254,17 @@ bool is_user(void)
> >  {
> >  	return current_thread_info()->flags & TIF_USER_MODE;
> >  }
> > +
> > +void delay(u64 cycles)
> > +{
> > +	u64 start = get_cntvct();
> > +	while ((get_cntvct() - start) < cycles)
> > +		cpu_relax();
> > +}
> > +
> > +void udelay(unsigned long usec)
> > +{
> > +	unsigned int frq;
> > +	asm volatile("mrs %0, cntfrq_el0" : "=r" (frq));
> > +	delay((u64)usec * frq / 1000000);
> > +}
> 
> 
> --
> Alex Bennée
> --
> To unsubscribe from this list: send the line "unsubscribe kvm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
