Received: by 10.223.197.9 with SMTP id q9csp4607544wrf;
        Tue, 17 Oct 2017 06:33:31 -0700 (PDT)
X-Received: by 10.55.197.152 with SMTP id k24mr6862211qkl.178.1508247211042;
        Tue, 17 Oct 2017 06:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508247211; cv=none;
        d=google.com; s=arc-20160816;
        b=1G31KSiACjutnli/dSuwdI++hSpx/wiZiFmOsi6bEoOGEzK8BorD7gEDlpgaVDxUmc
         5tZyC/+NjIooeKRhcpIUd0zlaRy6cHYulyMdtn6xI3TAw/njQIongxiwnIKVb1e+B8Ie
         kBNuuxcnILafuS4lJ3XJfdOn5MX0xxm22RKPYSP5sOWabNJ+6c1kJlZ5axZZze4EUm/w
         HBqPNNjGmAPW/GAe3w91wsFV2k1CcNq1xOlkWxRk6nYKhH2CLLbSNjNz+i+OtH9Wslh5
         KBAo28EtVcjXv39pBqP+GceDsu4KKeDZTS9OorYqKBBsVzc6mcHnB0gu1ReB34BsqvWI
         NHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xloYk0lkO0XuAIXPr05ztWKEYs0nQc1mdur8OHV4UH0=;
        b=aAS5+R+dbB0DwQUJXES4cx23GRYQJQ3JEJ+aRl1ovE47sAnhmryTIsjyGHv5DZNSRU
         kYsFXMbDNGW1EsikRQjB10fc11YQs2q0/bUU53wiSvN3v7H2d+Tbrndr6dF2+ImQx5hp
         ix2bg2kwi5Xr+qSvRIpIbDxEEaZ0jtJ/LJ87MtB/jA7hj5pNKL1wRmPqi170Zyt/qbRn
         uYzvtYxOG65oA9bW4bq1CkBB3bGCDhVLopI5onvxlROycaSkQVFRRJORIjWFZtl69fJF
         ytmpIchlrRz081KC0DAPEI042WsdxVL74NF4NIY6Afg2Sm+Jb04LPtvsUUg77K8eX5aL
         daPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bYJhRVRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o26si4340505qtb.303.2017.10.17.06.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 06:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bYJhRVRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Rzs-0006LJ-Ld
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 09:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Rsu-0000Ng-R5
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 09:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4Rst-0007pc-Hk
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 09:26:16 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:55655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4Rst-0007p2-8n
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 09:26:15 -0400
Received: by mail-wr0-x229.google.com with SMTP id 22so1672927wrb.12
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xloYk0lkO0XuAIXPr05ztWKEYs0nQc1mdur8OHV4UH0=;
	b=bYJhRVRfiRS8Aojs3JRuFpzDTBsng7v5ZkogbB9BoSZNrsoSHql7WqB71t2r+CfHLU
	X6bJKTAJ+pb0VFfb0hC8po/zhqF4DK+WcCJLNde6AFGyssSFLB6bojpcMKVk1lfnnxNE
	iWYxlP4L2Fy1UKp7afxptFON1HO18sNsb97eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xloYk0lkO0XuAIXPr05ztWKEYs0nQc1mdur8OHV4UH0=;
	b=dWSM3f6+SHZH92GLxtgKmjaM097fkyL06nEDY9FbPlJpDZFDsNUcIHrmkoOBQQnODc
	ZeAxVCKFbb8zpHThvuRSUN5j9QZXY8rKqQJpHiiUotquXrD6RrjGMXmTAgNcYTRWyqns
	jwFHFme0vsYbOWq8hVFJxGQF6h/n7pxjpIdFQ8Gdjk0YtdJ+Tb83dcBnKmMdmZwJhizJ
	sgYcxW1375qUZI6EDPlGAk7lsdpj7cx+z0T6ZGTPNUSESkRJIQ1c4BJlwdPfurkb7MSB
	WY1TDOGu9MlOUXWaiT0HIW+WdO+HkH1XXnLHtNyEu1E/67KLvAMcv/h+6honoV6TZ3xx
	E0SQ==
X-Gm-Message-State: AMCzsaVvkpcV8O06l3nlUdGWa45T2iJQAXJkNbDTxeLNyv6q0VbUOj1G
	EGNK9uBmzMOabqCJ+Z8M6Q6vbWhwK6GtHwitvX7B9A==
X-Google-Smtp-Source: ABhQp+QUCnuzsB3xAiPNx8GLK+Clilr+H797VtUrTMDdbUj2C5bZcMhTaIcHxFZ3q/x+SL5HXjWv+jzZAEeX19QqiJI=
X-Received: by 10.223.197.19 with SMTP id q19mr4038782wrf.272.1508246773955;
	Tue, 17 Oct 2017 06:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 06:25:53 -0700 (PDT)
In-Reply-To: <1506737310-21880-4-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-4-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 14:25:53 +0100
Message-ID: <CAFEAcA-0_dD0aXM5kmDbhKC5zX2woeX4G_BJemr8EgbhGBbdFA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [PATCH 03/13] target/arm: Reorganize PMCCNTR read,
 write, sync
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dHERyIHp2k/j

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. This also moves the calls to get the
> clock inside the 'if' statement so they are not executed if not needed.

It is duplicate code, yes, but I also find it a bit confusing,
because it's the same code doing two different operations:

(1) if (as is usual when the counter is running) c15_ccnt
contains a delta between the clock ticks and the register
value, pmccntr_sync() sets c15_ccnt to the current
guest-visible register value

(2) if c15_ccnt contains a guest-visible register value
and the clock is running, pmccntr_sync() sets c15_ccnt
to the ticks-to-value delta

and we use this in a couple of places like:
   pmccntr_sync();
   do stuff that operates on the guest register values,
     or maybe turns off the counter, etc;
   pmccntr_sync();

But that's wrong really -- we'll slightly lose time because
the nanosecond clock advances between the two calls
to qemu_clock_get_ns(). (It only works at all because
it happens that f(x) = C - x  is a self-inverse function.)
It's also a confusing API because it looks like something
you only need to call once but actually in most cases
you need to call it twice, before and after whatever it
is you're doing with the counter.

So I think we should refactor this so that we have a
pair of functions, something like:
    uint64_t clocknow = pmccntr_op_start(env);
    /* Now c15_ccnt is the guest visible value, and
     * we can do things like change PMCRD, enable bits, etc
     */
    [...]
    /* convert c15_ccnt back to the clock-to-value delta,
     * passing it the tick count we used when we did the
     * delta-to-value conversion earlier.
     */
    pmccntr_op_finish(env, clocknow);

(clocknow here should be the output of the muldiv64(),
not the divided-by-64 version.)

Some more specific review comments below, though the
suggested refactoring above might render some of them moot.


> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 55 ++++++++++++++++-------------------------------------
>  1 file changed, 16 insertions(+), 39 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 40c9273..ecf8c55 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -973,17 +973,18 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
>
>  void pmccntr_sync(CPUARMState *env)
>  {
> -    uint64_t temp_ticks;
> +    if (arm_ccnt_enabled(env) &&
> +          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {

This seems to be adding an extra condition that the commit
message doesn't mention.

> +        uint64_t temp_ticks;
>
> -    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> +        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>
> -    if (env->cp15.c9_pmcr & PMCRD) {
> -        /* Increment once every 64 processor clock cycles */
> -        temp_ticks /= 64;
> -    }
> +        if (env->cp15.c9_pmcr & PMCRD) {
> +            /* Increment once every 64 processor clock cycles */
> +            temp_ticks /= 64;
> +        }
>
> -    if (arm_ccnt_enabled(env)) {
>          env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
>      }
>  }
> @@ -1007,21 +1008,11 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>
>  static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> -    uint64_t total_ticks;
> -
> -    if (!arm_ccnt_enabled(env)) {
> -        /* Counter is disabled, do not change value */
> -        return env->cp15.c15_ccnt;
> -    }
> -
> -    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -
> -    if (env->cp15.c9_pmcr & PMCRD) {
> -        /* Increment once every 64 processor clock cycles */
> -        total_ticks /= 64;
> -    }
> -    return total_ticks - env->cp15.c15_ccnt;
> +    uint64_t ret;
> +    pmccntr_sync(env);
> +    ret = env->cp15.c15_ccnt;
> +    pmccntr_sync(env);
> +    return ret;

This change means that as a result of this refactoring we
now do the 'sync' operations (muldiv etc) twice, whereas
previously we did them only once.

>  }
>
>  static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -1038,22 +1029,8 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                          uint64_t value)
>  {
> -    uint64_t total_ticks;
> -
> -    if (!arm_ccnt_enabled(env)) {
> -        /* Counter is disabled, set the absolute value */
> -        env->cp15.c15_ccnt = value;
> -        return;
> -    }
> -
> -    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> -
> -    if (env->cp15.c9_pmcr & PMCRD) {
> -        /* Increment once every 64 processor clock cycles */
> -        total_ticks /= 64;
> -    }
> -    env->cp15.c15_ccnt = total_ticks - value;
> +    env->cp15.c15_ccnt = value;
> +    pmccntr_sync(env);
>  }

thanks
-- PMM
