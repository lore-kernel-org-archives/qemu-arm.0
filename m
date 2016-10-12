Received: by 10.80.166.35 with SMTP id d32csp536563edc;
        Wed, 12 Oct 2016 06:36:37 -0700 (PDT)
X-Received: by 10.55.10.15 with SMTP id 15mr1016681qkk.99.1476279397082;
        Wed, 12 Oct 2016 06:36:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h142si3836411qke.319.2016.10.12.06.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 06:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buJi0-0005pv-Em
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 09:36:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buJf8-0003T8-MN
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buJf2-0002Sd-SK
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:33:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1buJf2-0002SU-Iw; Wed, 12 Oct 2016 09:33:32 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F4FC635C1;
	Wed, 12 Oct 2016 13:33:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.1.163])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9CDXQkb004433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 12 Oct 2016 09:33:29 -0400
Date: Wed, 12 Oct 2016 15:33:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161012133326.cnzch6lbgeyficqe@kamzik.brq.redhat.com>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
	<1476205699-28857-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476205699-28857-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 12 Oct 2016 13:33:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] target-arm: Make page
 size a runtime setting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zCFjltHM+oWL

On Tue, Oct 11, 2016 at 06:08:18PM +0100, Peter Maydell wrote:
> Rather than defining TARGET_PAGE_BITS to always be 10,
> switch to using a value picked at runtime. This allows us
> to use 4K pages for modern ARM CPUs (and in particular all
> 64-bit CPUs) without having to drop support for the old
> ARMv5 CPUs which had 1K pages.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.c | 24 ++++++++++++++++++++++++
>  target-arm/cpu.h |  9 +++++----
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 1b9540e..c94a324 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -576,6 +576,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      ARMCPU *cpu = ARM_CPU(dev);
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env = &cpu->env;
> +    int pagebits;
>  
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -631,6 +632,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          set_feature(env, ARM_FEATURE_THUMB_DSP);
>      }
>  
> +    if (arm_feature(env, ARM_FEATURE_V7) &&
> +        !arm_feature(env, ARM_FEATURE_M) &&
> +        !arm_feature(env, ARM_FEATURE_MPU)) {
> +        /* v7VMSA drops support for the old ARMv5 tiny pages, so we
> +         * can use 4K pages.
> +         */
> +        pagebits = 12;
> +    } else {
> +        /* For CPUs which might have tiny 1K pages, or which have an
> +         * MPU and might have small region sizes, stick with 1K pages.
> +         */
> +        pagebits = 10;
> +    }
> +    if (!set_preferred_target_page_bits(pagebits)) {
> +        /* This can only ever happen for hotplugging a CPU, or if
> +         * the board code incorrectly creates a CPU which it has
> +         * promised via minimum_page_size that it will not.
> +         */
> +        error_setg(errp, "This CPU requires a smaller page size than the "
> +                   "system is using");

I'm not sure about this. IIUC, then with this it won't be possible to
create a board that sets up its cpus with the preferred target page bits
greater than the cpu's default set above, even when the cpu supports it.
For example, I may want a board that will only use AArch64 cpus with 64K
pages. In that case I'd like to set the minimum to 16 bits, but then that
would result in this error. I think we should only set the default when a
preference hasn't already been given. And, maybe we should also provide
a maximum to sanity check against? (side note: if we provide a maximum,
then we could use it in arch_dump.c for the dump info's block size,
which must be the maximum page size the cpu supports.)

Thanks,
drew

> +        return;
> +    }
> +
>      if (cpu->reset_hivecs) {
>              cpu->reset_sctlr |= (1 << 13);
>      }
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 76d824d..37d6eb3 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1766,10 +1766,11 @@ bool write_cpustate_to_list(ARMCPU *cpu);
>  #if defined(CONFIG_USER_ONLY)
>  #define TARGET_PAGE_BITS 12
>  #else
> -/* The ARM MMU allows 1k pages.  */
> -/* ??? Linux doesn't actually use these, and they're deprecated in recent
> -   architecture revisions.  Maybe a configure option to disable them.  */
> -#define TARGET_PAGE_BITS 10
> +/* ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
> + * have to support 1K tiny pages.
> + */
> +#define TARGET_PAGE_BITS_VARY
> +#define TARGET_PAGE_BITS_MIN 10
>  #endif
>  
>  #if defined(TARGET_AARCH64)
> -- 
> 2.7.4
> 
> 
