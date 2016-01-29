Received: by 10.25.159.19 with SMTP id i19csp1050262lfe;
        Fri, 29 Jan 2016 08:46:57 -0800 (PST)
X-Received: by 10.25.206.143 with SMTP id e137mr3708762lfg.97.1454086017764;
        Fri, 29 Jan 2016 08:46:57 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x242.google.com (mail-lb0-x242.google.com. [2a00:1450:4010:c04::242])
        by mx.google.com with ESMTPS id jm10si8526686lbc.26.2016.01.29.08.46.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:46:57 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::242 as permitted sender) client-ip=2a00:1450:4010:c04::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::242 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x242.google.com with SMTP id bc4so3591973lbc.0;
        Fri, 29 Jan 2016 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=dOIBop/N0k5vfqGfLx7q5svRCYxpnHXY6CMmE1+zxBE=;
        b=pZBIqn2Ly01DcKudsjGj/hTM95NyvKyqw2JY9Eybw86YZBY8qiGP8C7BvMx4GPGYsO
         MVNzoCjChkVHwiyI0oX3U1/UNRSrP/KPjGkQbKld1kk659nD6zk+80UEFC+dn4RaIO7Q
         QZdOPDnKrIqTx2KHBHjkkX/PaYG9vJJn6oerJX8qSdQxfXuHSzIjMz+pCPL7RLw/KCeJ
         swcxpKWTMv3t1sLGjBDTFFnA1lLbAw4ksRYqPT1YLKWuuOF7K756Rtdvl1bh/caQrKEz
         A8lb64FVhBrU1ND/Rtr0iOxb5y/t/FMnZ35Ze/F9gsPagTfsHkdxgq3BJ3h2TvoGPVvp
         +Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dOIBop/N0k5vfqGfLx7q5svRCYxpnHXY6CMmE1+zxBE=;
        b=DBk+1doqut9Mh8m6ZR0sr0KbZigH+qkGIJl3p9tt14nwZtGQJHYlwLQbgOt4OCJVwf
         AIeA5JwfEy00K1tyxftzVZVU/Xi/yIDOIK2KZM98V6wciXxz2On6A/wlC9lUtLHrmjfY
         jaqahaWOCaPnZ8dzWd4NrFq2Vn5yuuwWztUPk3lQO/sI5T8EkoH8XHEpmvCOI0c6CGPR
         Qr3lgq1c7eRN6zPYMzfaNowRkMY4287RUnVCoUqPt1AvOVwZCjSWyAEJKCAQuPnMyHWs
         zfFQLS58sM5ke6/Tb6eE51yaW82YKcG7kfBZvInvusNCk+fsTLpPysVuvMBahF1MIHIc
         otJA==
X-Gm-Message-State: AG10YOQVZDi2j4XmVi/fXC7YZm09ilv6yIxZnSR8pM5ku6KnPT0qmWdaUZBwlW6fztiglQ==
X-Received: by 10.112.135.39 with SMTP id pp7mr2987138lbb.43.1454086015864;
        Fri, 29 Jan 2016 08:46:55 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id kv3sm2190625lbc.39.2016.01.29.08.46.54
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:46:55 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 4/8] target-arm: Pull semihosting handling
 out to arm_cpu_do_interrupt()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-5-git-send-email-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB977E.6040300@gmail.com>
Date: Fri, 29 Jan 2016 19:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: Iw+grPmMkxoz

On 14.01.2016 21:34, Peter Maydell wrote:
> Handling of semihosting calls should depend on the register width
> of the calling code, not on that of any higher exception level,
> so we need to identify and handle semihosting calls before we
> decide whether to deliver the exception as an entry to AArch32
> or AArch64. (EXCP_SEMIHOST is also an "internal exception" so
> it has no target exception level in the first place.)
>
> This will allow AArch32 EL1 code to use semihosting calls when
> running under an AArch64 EL3.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 120 +++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 81 insertions(+), 39 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 962bb3c..d37c82c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5754,27 +5754,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>              offset = 4;
>          break;
>      case EXCP_SWI:
> -        if (semihosting_enabled()) {
> -            /* Check for semihosting interrupt.  */
> -            if (env->thumb) {
> -                mask = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
> -                    & 0xff;
> -            } else {
> -                mask = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
> -                    & 0xffffff;
> -            }
> -            /* Only intercept calls from privileged modes, to provide some
> -               semblance of security.  */
> -            if (((mask == 0x123456 && !env->thumb)
> -                    || (mask == 0xab && env->thumb))
> -                  && (env->uncached_cpsr & CPSR_M) != ARM_CPU_MODE_USR) {
> -                qemu_log_mask(CPU_LOG_INT,
> -                              "...handling as semihosting call 0x%x\n",
> -                              env->regs[0]);
> -                env->regs[0] = do_arm_semihosting(env);
> -                return;
> -            }
> -        }
>          new_mode = ARM_CPU_MODE_SVC;
>          addr = 0x08;
>          mask = CPSR_I;
> @@ -5782,19 +5761,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>          offset = 0;
>          break;
>      case EXCP_BKPT:
> -        /* See if this is a semihosting syscall.  */
> -        if (env->thumb && semihosting_enabled()) {
> -            mask = arm_lduw_code(env, env->regs[15], env->bswap_code) & 0xff;
> -            if (mask == 0xab
> -                  && (env->uncached_cpsr & CPSR_M) != ARM_CPU_MODE_USR) {
> -                env->regs[15] += 2;
> -                qemu_log_mask(CPU_LOG_INT,
> -                              "...handling as semihosting call 0x%x\n",
> -                              env->regs[0]);
> -                env->regs[0] = do_arm_semihosting(env);
> -                return;
> -            }
> -        }
>          env->exception.fsr = 2;
>          /* Fall through to prefetch abort.  */
>      case EXCP_PREFETCH_ABORT:
> @@ -5970,6 +5936,78 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>                    new_el, env->pc, pstate_read(env));
>  }
>  
> +static inline bool check_for_semihosting(CPUState *cs)
> +{
> +    /* Check whether this exception is a semihosting call; if so
> +     * then handle it and return true; otherwise return false.
> +     */
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    if (is_a64(env)) {
> +        if (cs->exception_index == EXCP_SEMIHOST) {
> +            /* This is always the 64-bit semihosting exception.
> +             * The "is this usermode" and "is semihosting enabled"
> +             * checks have been done at translate time.
> +             */
> +            qemu_log_mask(CPU_LOG_INT,
> +                          "...handling as semihosting call 0x%" PRIx64 "\n",
> +                          env->xregs[0]);
> +            env->xregs[0] = do_arm_semihosting(env);
> +            return true;
> +        }
> +        return false;
> +    } else {
> +        uint32_t imm;
> +
> +        /* Only intercept calls from privileged modes, to provide some
> +         * semblance of security.
> +         */
> +        if (!semihosting_enabled() ||
> +            ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR)) {
> +            return false;
> +        }
> +
> +        switch (cs->exception_index) {
> +        case EXCP_SWI:
> +            /* Check for semihosting interrupt.  */
> +            if (env->thumb) {
> +                imm = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
> +                    & 0xff;
> +                if (imm == 0xab) {
> +                    break;
> +                }
> +            } else {
> +                imm = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
> +                    & 0xffffff;
> +                if (imm == 0x123456) {
> +                    break;
> +                }
> +            }
> +            return false;
> +        case EXCP_BKPT:
> +            /* See if this is a semihosting syscall.  */
> +            if (env->thumb) {
> +                imm = arm_lduw_code(env, env->regs[15], env->bswap_code)
> +                    & 0xff;
> +                if (imm == 0xab) {
> +                    env->regs[15] += 2;
> +                    break;
> +                }
> +            }
> +            return false;
> +        default:
> +            return false;
> +        }
> +
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...handling as semihosting call 0x%x\n",
> +                      env->regs[0]);
> +        env->regs[0] = do_arm_semihosting(env);
> +        return true;
> +    }
> +}
> +
>  /* Handle a CPU exception for A and R profile CPUs.
>   * Do any appropriate logging, handle PSCI calls, and then hand off
>   * to the AArch64-entry or AArch32-entry function depending on the
> @@ -5999,12 +6037,16 @@ void arm_cpu_do_interrupt(CPUState *cs)
>          return;
>      }
>  
> -    /* Temporary special case for EXCP_SEMIHOST, which is used only
> -     * for 64-bit semihosting calls -- as this is an internal exception
> -     * it has no specified target level and arm_el_is_aa64() would
> -     * assert because new_el could be 0.
> +    /* Semihosting semantics depend on the register width of the
> +     * code that caused the exception, not the target exception level,
> +     * so must be handled here.
>       */
> -    if (cs->exception_index == EXCP_SEMIHOST || arm_el_is_aa64(env, new_el)) {
> +    if (check_for_semihosting(cs)) {
> +        return;
> +    }
> +
> +    assert(!excp_is_internal(cs->exception_index));
> +    if (arm_el_is_aa64(env, new_el)) {
>          arm_cpu_do_interrupt_aarch64(cs);
>      } else {
>          arm_cpu_do_interrupt_aarch32(cs);
