Received: by 10.25.159.19 with SMTP id i19csp2603342lfe;
        Tue, 19 Jan 2016 08:47:57 -0800 (PST)
X-Received: by 10.202.44.79 with SMTP id s76mr21280150ois.123.1453222077340;
        Tue, 19 Jan 2016 08:47:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com. [2607:f8b0:4003:c01::241])
        by mx.google.com with ESMTPS id y7si1539130obs.66.2016.01.19.08.47.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2016 08:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::241 as permitted sender) client-ip=2607:f8b0:4003:c01::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x241.google.com with SMTP id tr5so41815487obc.2;
        Tue, 19 Jan 2016 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=yROJjUHG4BUTv1a5e+WnIxjdFozUU0AQmhYx8GYRoqg=;
        b=aESPVjZB0CexbMGidfb6XBwyIw7nOozZPhTqQEzyJyQ5E67WO/pfeRR36s3i2LfWsB
         IVO6VimZVpQZuybAzPGCx/xBwkm+WjAz0wEPP8Zr63OTMwxvvdlnJdTR+/btSSJ/vE0r
         l7AXC24udFz8hx5mYeKyLXUpARQZXDI2ZT1p7tEfRIgGxpyaJnLYER+Ptu9DS86X1yxq
         4D8J8B2FIe8Shhp28R7epukPzayCqXKdHLm/hmqdn1mbNCgjUmLU/Li+pNuT2flC4fUh
         IBUH9eFZ7vLev51lNut+SIbxeh6yTDy8GFYSsiy5eOXXskQ/xqkNISW8vVP9O1XDz+xT
         3UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=yROJjUHG4BUTv1a5e+WnIxjdFozUU0AQmhYx8GYRoqg=;
        b=Slnkuu5kgv9vxbiru25JCERmfQQOdjfB1GF1rLiG44b/Jr6EYI7iF6KRIuRUQcI1x6
         1pbgvtsZSyAQp/UdhMjSNOFhqNC2H7a23BRFj1IHmmQz3viasQbHwqT9fVlKKAZtPNrE
         ITAlgqnqNnUIYYUnYqR47nhFks3Byfxf0FGz3K1Eei/avNdNsudUlA5YdFJf/tioO+Es
         4Sumt0mcDelgB/80XhEpwxy82zsGM4VhKxJ6fVie3DICVP4I1hAZAnjYp4yYfAtK2fF+
         s85U1viOVyB3P4BqG2C4VnGXonSjHlSGkDb4d8M9s5nVrXmPtbZrVYe5Rd2RUNTBEKzj
         jQ6g==
X-Gm-Message-State: AG10YOTNfoncM8pUxGj3ksaBTrz/XeIWQd9pmfMenViTyQbc98+EUzjCZqL8/9jQjNIcbw==
X-Received: by 10.60.62.97 with SMTP id x1mr10798163oer.74.1453222076828;
        Tue, 19 Jan 2016 08:47:56 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id w6sm15875086obx.9.2016.01.19.08.47.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:47:56 -0800 (PST)
Date: Tue, 19 Jan 2016 17:47:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 6/8] target-arm: Handle exception return from AArch64 to
 non-EL0 AArch32
Message-ID: <20160119164752.GP29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: pQsztPVljl+/

On Thu, Jan 14, 2016 at 06:34:09PM +0000, Peter Maydell wrote:
> Remove the assumptions that the AArch64 exception return code was
> making about a return to AArch32 always being a return to EL0.
> This includes pulling out the illegal-SPSR checks so we can apply
> them for return to 32 bit as well as return to 64-bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/op_helper.c | 80 +++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 21 deletions(-)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index e42d287..38d46d8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -640,12 +640,51 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>      }
>  }
>  
> +static int el_from_spsr(uint32_t spsr)
> +{
> +    /* Return the exception level that this SPSR is requesting a return to,
> +     * or -1 if it is invalid (an illegal return)
> +     */
> +    if (spsr & PSTATE_nRW) {
> +        switch (spsr & CPSR_M) {
> +        case ARM_CPU_MODE_USR:
> +            return 0;
> +        case ARM_CPU_MODE_HYP:
> +            return 2;
> +        case ARM_CPU_MODE_FIQ:
> +        case ARM_CPU_MODE_IRQ:
> +        case ARM_CPU_MODE_SVC:
> +        case ARM_CPU_MODE_ABT:
> +        case ARM_CPU_MODE_UND:
> +        case ARM_CPU_MODE_SYS:
> +            return 1;
> +        case ARM_CPU_MODE_MON:
> +            /* Returning to Mon from AArch64 is never possible,
> +             * so this is an illegal return.
> +             */
> +        default:
> +            return -1;
> +        }
> +    } else {
> +        if (extract32(spsr, 1, 1)) {
> +            /* Return with reserved M[1] bit set */
> +            return -1;
> +        }
> +        if (extract32(spsr, 0, 4) == 1) {
> +            /* return to EL0 with M[0] bit set */
> +            return -1;
> +        }
> +        return extract32(spsr, 2, 2);
> +    }
> +}
> +
>  void HELPER(exception_return)(CPUARMState *env)
>  {
>      int cur_el = arm_current_el(env);
>      unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
>      uint32_t spsr = env->banked_spsr[spsr_idx];
>      int new_el;
> +    bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
>  
>      aarch64_save_sp(env, cur_el);
>  
> @@ -662,35 +701,34 @@ void HELPER(exception_return)(CPUARMState *env)
>          spsr &= ~PSTATE_SS;
>      }
>  
> -    if (spsr & PSTATE_nRW) {
> -        /* TODO: We currently assume EL1/2/3 are running in AArch64.  */
> +    new_el = el_from_spsr(spsr);
> +    if (new_el == -1) {
> +        goto illegal_return;
> +    }
> +    if (new_el > cur_el
> +        || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
> +        /* Disallow return to an EL which is unimplemented or higher
> +         * than the current one.
> +         */
> +        goto illegal_return;
> +    }
> +
> +    if (new_el != 0 && arm_el_is_aa64(env, new_el) != return_to_aa64) {
> +        /* Return to an EL which is configured for a different register width */
> +        goto illegal_return;
> +    }
> +
> +    if (!return_to_aa64) {
>          env->aarch64 = 0;
> -        new_el = 0;
> -        env->uncached_cpsr = 0x10;
> +        env->uncached_cpsr = spsr & CPSR_M;
>          cpsr_write(env, spsr, ~0);
>          if (!arm_singlestep_active(env)) {
>              env->uncached_cpsr &= ~PSTATE_SS;
>          }
>          aarch64_sync_64_to_32(env);
>  
> -        env->regs[15] = env->elr_el[1] & ~0x1;
> +        env->regs[15] = env->elr_el[cur_el] & ~0x1;
>      } else {
> -        new_el = extract32(spsr, 2, 2);
> -        if (new_el > cur_el
> -            || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
> -            /* Disallow return to an EL which is unimplemented or higher
> -             * than the current one.
> -             */
> -            goto illegal_return;
> -        }
> -        if (extract32(spsr, 1, 1)) {
> -            /* Return with reserved M[1] bit set */
> -            goto illegal_return;
> -        }
> -        if (new_el == 0 && (spsr & PSTATE_SP)) {
> -            /* Return to EL0 with M[0] bit set */
> -            goto illegal_return;
> -        }
>          env->aarch64 = 1;
>          pstate_write(env, spsr);
>          if (!arm_singlestep_active(env)) {
> -- 
> 1.9.1
> 
