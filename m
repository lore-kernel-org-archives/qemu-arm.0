Received: by 10.223.172.38 with SMTP id v35csp5890643wrc;
        Mon, 11 Sep 2017 11:05:03 -0700 (PDT)
X-Received: by 10.55.21.5 with SMTP id f5mr12117084qkh.335.1505153103335;
        Mon, 11 Sep 2017 11:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153103; cv=none;
        d=google.com; s=arc-20160816;
        b=mBD59TIO07cq9wkNIEUC6YxipXnVjRHZcPxM8NDpZcFGovi2pnccCdYsEiSJDsbc7L
         bMeq8fdTXxVNkAYWrnZq6rGXlbUpIL9mMZ8H4TehdhToOSswWe5aBfvPwSPiej1JFzCl
         T28/1mNpH/RxfS4USD+UrdUmaKUzU/DuTpz9/0kmG+iM5I0ukCgD6yl1TVDEuD5WiXhv
         WgeSq51sNEwDPVhXz+S8opZnnGuQAeYYfCENM7aPx/4Vf7OgStROewv2ag65MdxUFN1b
         SFvdE/aGb755vYeZh6dZ2GafmGnouX5UM8HdE0G618CrHAdGWwH849wZ6UeD8gl70Mme
         hU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/EehFnzkTBjkhVlUxUr9imryRQUlcnU/YP0/xaq4VUI=;
        b=hSc772d5BBVnN8542ZzdYDlfgWbFOHHggbeBiuAy9ExbMTAjuDSNmAXh+h632pUTz4
         Kk8y/7KxpTB6pOhRN/MYhoSCRa0Y5yrX5xr95+olRxNMBgOjXy1HO8FUz+8PQKDS3Ojq
         Vuy7iTBbzO4g5dfJJ8kHryqBvEvIOPAC1lzuMCYh5KXTq9wwmUEA3erD657yZ8j+O8gy
         Y/c0nBBDpOO6hNddzKnTJNuJweVP+kHImyENpzvodiLImRtlic5LKLfL0BZCOeuKE94c
         CuiEWgk+tKVC8FuRQ4GG/Wwjy9BEorHg7lCQo5LJ6ecltgVho24WftSbqETi9W0AM8fy
         NC+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=A5Es/U57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si9729751qkg.545.2017.09.11.11.05.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=A5Es/U57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drT4v-0005rG-2B
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSbU-0003c0-Jx
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 13:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSbT-0001C9-IB
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 13:34:36 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:37867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSbM-00019L-E6; Mon, 11 Sep 2017 13:34:28 -0400
Received: by mail-wm0-x244.google.com with SMTP id f4so7409066wmh.4;
	Mon, 11 Sep 2017 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/EehFnzkTBjkhVlUxUr9imryRQUlcnU/YP0/xaq4VUI=;
	b=A5Es/U57xJky+iEls9wS965N1dyVtA3NBiNsMqXDjW677iU9Eh0Cwz7AQ24N7JVqpr
	DCp/BzM4YJQCV//9xhoEx0uLI/nHXrSoao/qp/FzPUSwzeVUC/e0DIkfa8R2lSV70k0L
	RlWGlauTrynqo/nApE6IaZsQ4LzUgfunT0cQiLswV3a36LcdyL8GkyChMLLy1CyC1KYU
	VYNl869s7eJpFs3Dw3GGvp1n6jQpJWznrxg5sqUiHts+09YvWx8BYS10ZH2MjpuQJkyp
	VXbUamY377w/tut2CaPLbYyO/3qB/cOlB5WGmQvLK94mFxAexb5IBzN9eqv2F43X+wwT
	i6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/EehFnzkTBjkhVlUxUr9imryRQUlcnU/YP0/xaq4VUI=;
	b=ALzzvlC1NKm4ysCnKcvbcdtG8hLrEWqh2JIZZ4yXPPKbJFsOJIOoHXFjlIhJF5iHwY
	EEKEeBtyKcbVca9vlKJnmJYKTDW7QTbyCWbaVWhS2WMCG4Vs1rzc/sA7pKDzWB6Nc4k5
	CA6V0ptwXcrc259GmrZ7H7XS6F6hzslMnZxQTECr5R4NrrB144Xwl/kIdnzyfUGAZDGS
	p1IM4fvYFt9yM8Fc/Ulz2KJp1Pmepwxw33Kik+O7awkmy9TGTC7CxglMj2rOeFiWkyi6
	KcwmwciX8MQoZLkWb2j6d4V4Bfpwt+e26Q7oZk+1A+o8VoEBl/d+T5OLaOBLVkbBTE3G
	rQeg==
X-Gm-Message-State: AHPjjUiC1VLF9UhmT9uAlswcJmfyZWbooMoP6/61KR/2AHDLDtA9O/Gl
	DYGtvdWOOMXziLS1iXbmGlBhqYY07q2Asosi2Em4Lw==
X-Google-Smtp-Source: AOwi7QBGebM0TFOf/KNJsn5kcDK0tKwoNlku/07Dtuh1NZgA2I1HGdbSMLU0MBI5HniHNFtBYjcAmtG79j20hR8tSLI=
X-Received: by 10.28.130.130 with SMTP id e124mr7918021wmd.75.1505151267276;
	Mon, 11 Sep 2017 10:34:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:33:56 -0700 (PDT)
In-Reply-To: <1505137930-13255-3-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:33:56 -0700
Message-ID: <CAKmqyKNr-tJg4uLny4QAT3oBSC_sC0dZjFBOzsG0HJ=b7cknHA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PATCH 2/7] target/arm: Clear exclusive monitor on
 v7M reset, exception entry/exit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xKxPbNH0Ru1q

On Mon, Sep 11, 2017 at 6:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> For M profile we must clear the exclusive monitor on reset, exception
> entry and exception exit.  We weren't doing any of these things; fix
> this bug.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/cpu.c       |  6 ++++++
>  target/arm/helper.c    |  2 ++
>  target/arm/op_helper.c |  2 +-
>  4 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 5d7f24c..a315354 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -444,6 +444,16 @@ void arm_handle_psci_call(ARMCPU *cpu);
>  #endif
>
>  /**
> + * arm_clear_exclusive: clear the exclusive monitor
> + * @env: CPU env
> + * Clear the CPU's exclusive monitor, like the guest CLREX instruction.
> + */
> +static inline void arm_clear_exclusive(CPUARMState *env)
> +{
> +    env->exclusive_addr = -1;
> +}
> +
> +/**
>   * ARMMMUFaultInfo: Information describing an ARM MMU Fault
>   * @s2addr: Address that caused a fault at stage 2
>   * @stage2: True if we faulted at stage 2
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a1acce3..412e94c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -235,6 +235,12 @@ static void arm_cpu_reset(CPUState *s)
>          env->regs[15] = 0xFFFF0000;
>      }
>
> +    /* M profile requires that reset clears the exclusive monitor;
> +     * A profile does not, but clearing it makes more sense than having it
> +     * set with an exclusive access on address zero.
> +     */
> +    arm_clear_exclusive(env);
> +
>      env->vfp.xregs[ARM_VFP_FPEXC] = 0;
>  #endif
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 329e517..668e367 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6175,6 +6175,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
>
>      armv7m_nvic_acknowledge_irq(env->nvic);
>      switch_v7m_sp(env, 0);
> +    arm_clear_exclusive(env);
>      /* Clear IT bits */
>      env->condexec_bits = 0;
>      env->regs[14] = lr;
> @@ -6354,6 +6355,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>      }
>
>      /* Otherwise, we have a successful exception exit. */
> +    arm_clear_exclusive(env);
>      qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
>  }
>
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index d1bca46..6a60464 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -1022,7 +1022,7 @@ void HELPER(exception_return)(CPUARMState *env)
>
>      aarch64_save_sp(env, cur_el);
>
> -    env->exclusive_addr = -1;
> +    arm_clear_exclusive(env);
>
>      /* We must squash the PSTATE.SS bit to zero unless both of the
>       * following hold:
> --
> 2.7.4
>
>
