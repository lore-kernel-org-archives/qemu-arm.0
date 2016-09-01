Received: by 10.25.87.130 with SMTP id l124csp96337lfb;
        Thu, 1 Sep 2016 03:19:23 -0700 (PDT)
X-Received: by 10.237.42.197 with SMTP id t63mr16847463qtd.84.1472725162964;
        Thu, 01 Sep 2016 03:19:22 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g33si3674860qte.45.2016.09.01.03.19.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2016 03:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04529C04D2A9;
	Thu,  1 Sep 2016 10:19:22 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-216.ams2.redhat.com [10.36.5.216])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u81AJHS7017306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Sep 2016 06:19:19 -0400
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v3 04/10] arm/arm64: add some
 delay routines
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
 <1468587641-7300-5-git-send-email-drjones@redhat.com>
Cc: marc.zyngier@arm.com, wei@redhat.com, christoffer.dall@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <db74d021-d3c8-0ecf-7707-3c0567b82e3b@redhat.com>
Date: Thu, 1 Sep 2016 12:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468587641-7300-5-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 01 Sep 2016 10:19:22 +0000 (UTC)
X-TUID: jgpz6maqcYuB

Hi Drew,

On 15/07/2016 15:00, Andrew Jones wrote:
> Allow a thread to wait some specified amount of time. Can
> specify in cycles, usecs, and msecs.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/arm/asm/processor.h   | 19 +++++++++++++++++++
>  lib/arm/processor.c       | 15 +++++++++++++++
>  lib/arm64/asm/processor.h | 19 +++++++++++++++++++
>  lib/arm64/processor.c     | 15 +++++++++++++++
>  4 files changed, 68 insertions(+)
> 
> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> index d2048f5f5f7e6..afc903ca7d4ab 100644
> --- a/lib/arm/asm/processor.h
> +++ b/lib/arm/asm/processor.h
> @@ -5,7 +5,9 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
> +#include <libcflat.h>
>  #include <asm/ptrace.h>
> +#include <asm/barrier.h>
>  
>  enum vector {
>  	EXCPTN_RST,
> @@ -51,4 +53,21 @@ extern int mpidr_to_cpu(unsigned long mpidr);
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
>  
> +static inline u64 get_cntvct(void)
> +{
> +	u64 vct;
> +	isb();
> +	asm volatile("mrrc p15, 1, %Q0, %R0, c14" : "=r" (vct));
> +	return vct;
> +}
> +
> +extern void delay(u64 cycles);
> +extern void udelay(unsigned long usecs);
> +
> +static inline void mdelay(unsigned long msecs)
> +{
> +	while (msecs--)
> +		udelay(1000);
> +}
> +
>  #endif /* _ASMARM_PROCESSOR_H_ */
> diff --git a/lib/arm/processor.c b/lib/arm/processor.c
> index 54fdb87ef0196..c2ee360df6884 100644
> --- a/lib/arm/processor.c
> +++ b/lib/arm/processor.c
> @@ -9,6 +9,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/processor.h>
>  #include <asm/thread_info.h>
> +#include <asm/barrier.h>
>  
>  static const char *processor_modes[] = {
>  	"USER_26", "FIQ_26" , "IRQ_26" , "SVC_26" ,
> @@ -141,3 +142,17 @@ bool is_user(void)
>  {
>  	return current_thread_info()->flags & TIF_USER_MODE;
>  }
> +
> +void delay(u64 cycles)
> +{
> +	u64 start = get_cntvct();
> +	while ((get_cntvct() - start) < cycles)
> +		cpu_relax();
> +}
> +
> +void udelay(unsigned long usec)
> +{
> +	unsigned int frq;
> +	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
> +	delay((u64)usec * frq / 1000000);
> +}
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 7e448dc81a6aa..94f7ce35b65c1 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -17,8 +17,10 @@
>  #define SCTLR_EL1_M	(1 << 0)
>  
>  #ifndef __ASSEMBLY__
> +#include <libcflat.h>
>  #include <asm/ptrace.h>
>  #include <asm/esr.h>
> +#include <asm/barrier.h>
>  
>  enum vector {
>  	EL1T_SYNC,
> @@ -89,5 +91,22 @@ extern int mpidr_to_cpu(unsigned long mpidr);
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
>  
> +static inline u64 get_cntvct(void)
> +{
> +	u64 vct;
> +	isb();
> +	asm volatile("mrs %0, cntvct_el0" : "=r" (vct));
> +	return vct;
> +}
> +
> +extern void delay(u64 cycles);
> +extern void udelay(unsigned long usecs);
> +
> +static inline void mdelay(unsigned long msecs)
> +{
> +	while (msecs--)
> +		udelay(1000);
> +}
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* _ASMARM64_PROCESSOR_H_ */
> diff --git a/lib/arm64/processor.c b/lib/arm64/processor.c
> index deeab4ec9c8ac..50fa835c6f1e3 100644
> --- a/lib/arm64/processor.c
> +++ b/lib/arm64/processor.c
> @@ -9,6 +9,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/processor.h>
>  #include <asm/thread_info.h>
> +#include <asm/barrier.h>
>  
>  static const char *vector_names[] = {
>  	"el1t_sync",
> @@ -253,3 +254,17 @@ bool is_user(void)
>  {
>  	return current_thread_info()->flags & TIF_USER_MODE;
>  }
> +
> +void delay(u64 cycles)
> +{
> +	u64 start = get_cntvct();
> +	while ((get_cntvct() - start) < cycles)
> +		cpu_relax();
> +}
> +
> +void udelay(unsigned long usec)
> +{
> +	unsigned int frq;
> +	asm volatile("mrs %0, cntfrq_el0" : "=r" (frq));
> +	delay((u64)usec * frq / 1000000);
> +}
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
