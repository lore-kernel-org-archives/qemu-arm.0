Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6045154wrt;
        Wed, 3 Oct 2018 01:59:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61023aqjJH0KfyGys+phtSof/ljlOdVQYZg+9loFmIrSK4eQ4InJvkOSi18fYI9J8RqUDtW
X-Received: by 2002:ac8:427:: with SMTP id v39-v6mr351444qtg.59.1538557155565;
        Wed, 03 Oct 2018 01:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538557155; cv=none;
        d=google.com; s=arc-20160816;
        b=ggKP2Iunj2h4TLOtd/hGAyjyduOjPWShG48wZURzg0f0UHNwSLAOf5WqNaHe01+Wc1
         1ifMc4O6DTSbrSJJwjfFOiArATgdluyz6YQvmQHjQYG5TevVmDPaANfH3I/aEBUIeElq
         eHMaqN80OkR/HnqVXOhljlP3TG0fUbeVDUPKPGBvhil4G19FeDkWB4dUE/FLUmnBMPsH
         vmehFM+Ulcyj2x3qlQ/zRSTlIS9i9BER1RAWIVZXjz8dNAgWyVTG2QWXoNETE6wNDQ+H
         MiRXCZgrLIC3n9aQBTbMnNTDozm/D081EkMVQqdhlT6WKjB/tjWKR+XIZvSgLw4nnwBC
         l5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=jfjhkVOf+Fe2LW5cggELWPXjqaQJXkv8u9+93gxA/iU=;
        b=VNBFRD05B074jsYGC7hwdAmtIn08/uNefcmOCZjNcyWdrEi9qaueyW2dsZJH0XPMPa
         Vi8pP/im7iANenIGkmnUoKRNeeXq7YwANthXHg8XXYgmEUrT/vlRTcJUfY+lk6JpLiE8
         bOoUMTm6DSq5S7x229Bu9NXA3JXrPnkJcEBCe3acNZD9KYt7q4DFw14WlmEN2OMKdQh7
         F4Y5sXM38NaWCUN1C+lfoAthKSsdiNkcgv7EIyNMLjAeS9oTroLCQTOo6+ahLh3vK/Ig
         ob3zjFOpBZoU1WE1o/uzzYCghJlppqI1MSqh73m7dFfomJ4B6gOlOQyQ24n3I5jrK7SA
         yaYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q92-v6si447069qtd.372.2018.10.03.01.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 01:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7czz-0002rd-4I
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 04:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7czp-0002r4-69
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7czl-00045p-Ud
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:59:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7czl-00045Y-Mn
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:59:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id w5-v6so5200909wrt.2
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 01:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jfjhkVOf+Fe2LW5cggELWPXjqaQJXkv8u9+93gxA/iU=;
	b=ktXLqJ+NgMbtGtFTMoWJbqCInuuL4es3+BBLbPQJSWKLmYlmbtQt4jm1vEpm+1wiaL
	MMUkdpyP3nXvaXxcTIeOrkFX7WPyn8NoWmpgbheqUsjmWZLSWb/7c/oU4AxxfRr5cmUM
	vIpyM1ani1QvfK1l1M2tbuYllbBTz67Mk9r/AAcifPrfaKTBeTqsaPa6sCRP6wjP/vov
	6I063e8Naeq+Zvrn0CUogSw04yykzmvkGAlRdg5HMmwK8ER4lTvQ6Hnkjt4yWBoDY6ZO
	j5T8dg+d8SIkDFvDOYjr+Kdw2Yny6zr7dcAx4sUrFNkRUODM1LUs1p/AnaGr8ugYsmc8
	ymJQ==
X-Gm-Message-State: ABuFfohjsfdM55YnY0e/n3zE/RzZsJYKp85uiF+dw9luXTh2hmnD8Pmi
	4qomPEyFrndmowSvDStC8+COqA==
X-Received: by 2002:adf:90a2:: with SMTP id i31-v6mr437824wri.77.1538557140663;
	Wed, 03 Oct 2018 01:59:00 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	o7-v6sm863169wma.17.2018.10.03.01.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 01:58:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d5e8f2bd-1bed-d628-38d7-732d6d48caf4@redhat.com>
Date: Wed, 3 Oct 2018 10:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/13] target/arm: Add v8M stack
 checks on exception entry
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDEXgahNfb/6

On 02/10/2018 18:35, Peter Maydell wrote:
> Add checks for breaches of the v8M stack limit when the
> stack pointer is decremented to push the exception frame
> for exception entry.
> 
> Note that the exception-entry case is unique in that the
> stack pointer is updated to be the limit value if the limit
> is hit (per rule R_ZLZG).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/helper.c | 54 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ef8c244fb84..a10dff01a90 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6839,6 +6839,8 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>      uint32_t frameptr;
>      ARMMMUIdx mmu_idx;
>      bool stacked_ok;
> +    uint32_t limit;
> +    bool want_psp;
>  
>      if (dotailchain) {
>          bool mode = lr & R_V7M_EXCRET_MODE_MASK;
> @@ -6848,12 +6850,34 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>          mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv);
>          frame_sp_p = get_v7m_sp_ptr(env, M_REG_S, mode,
>                                      lr & R_V7M_EXCRET_SPSEL_MASK);
> +        want_psp = mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
> +        if (want_psp) {
> +            limit = env->v7m.psplim[M_REG_S];
> +        } else {
> +            limit = env->v7m.msplim[M_REG_S];
> +        }
>      } else {
>          mmu_idx = core_to_arm_mmu_idx(env, cpu_mmu_index(env, false));
>          frame_sp_p = &env->regs[13];
> +        limit = v7m_sp_limit(env);
>      }
>  
>      frameptr = *frame_sp_p - 0x28;
> +    if (frameptr < limit) {
> +        /*
> +         * Stack limit failure: set SP to the limit value, and generate
> +         * STKOF UsageFault. Stack pushes below the limit must not be
> +         * performed. It is IMPDEF whether pushes above the limit are
> +         * performed; we choose not to.
> +         */
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...STKOF during callee-saves register stacking\n");
> +        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
> +        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
> +                                env->v7m.secure);
> +        *frame_sp_p = limit;
> +        return true;
> +    }
>  
>      /* Write as much of the stack frame as we can. A write failure may
>       * cause us to pend a derived exception.
> @@ -6877,10 +6901,7 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>          v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx,
>                          ignore_faults);
>  
> -    /* Update SP regardless of whether any of the stack accesses failed.
> -     * When we implement v8M stack limit checking then this attempt to
> -     * update SP might also fail and result in a derived exception.
> -     */
> +    /* Update SP regardless of whether any of the stack accesses failed. */
>      *frame_sp_p = frameptr;
>  
>      return !stacked_ok;
> @@ -7028,6 +7049,26 @@ static bool v7m_push_stack(ARMCPU *cpu)
>  
>      frameptr -= 0x20;
>  
> +    if (arm_feature(env, ARM_FEATURE_V8)) {
> +        uint32_t limit = v7m_sp_limit(env);
> +
> +        if (frameptr < limit) {
> +            /*
> +             * Stack limit failure: set SP to the limit value, and generate
> +             * STKOF UsageFault. Stack pushes below the limit must not be
> +             * performed. It is IMPDEF whether pushes above the limit are
> +             * performed; we choose not to.
> +             */
> +            qemu_log_mask(CPU_LOG_INT,
> +                          "...STKOF during stacking\n");
> +            env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
> +            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
> +                                    env->v7m.secure);
> +            env->regs[13] = limit;
> +            return true;
> +        }
> +    }
> +
>      /* Write as much of the stack frame as we can. If we fail a stack
>       * write this will result in a derived exception being pended
>       * (which may be taken in preference to the one we started with
> @@ -7043,10 +7084,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
>          v7m_stack_write(cpu, frameptr + 24, env->regs[15], mmu_idx, false) &&
>          v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, false);
>  
> -    /* Update SP regardless of whether any of the stack accesses failed.
> -     * When we implement v8M stack limit checking then this attempt to
> -     * update SP might also fail and result in a derived exception.
> -     */
> +    /* Update SP regardless of whether any of the stack accesses failed. */
>      env->regs[13] = frameptr;
>  
>      return !stacked_ok;
> 
