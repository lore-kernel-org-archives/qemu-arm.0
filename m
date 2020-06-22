Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2931354lfm;
        Mon, 22 Jun 2020 00:17:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA2beBs+QSoVaP4eEG0GZEi4BKIqfhIlO8Qy71zCbkHQonHZEnFhtRPjNMhE4uVLPJQT9L
X-Received: by 2002:a05:651c:3cd:: with SMTP id f13mr8281292ljp.151.1592810248797;
        Mon, 22 Jun 2020 00:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592810248; cv=none;
        d=google.com; s=arc-20160816;
        b=zHmpAFVufIuFQkFuuf2Tta9rOXfuRV5kymDzOAY6KZkQtU89oo6sVLeC963fZLFWHS
         dWm/FWaHTUoZxUqvmg51fVFU4OCc1o6byN6ByEAbyr3Xaq2uYJe91CkezQJhIW4O48e1
         r0mWyKKSnOGDdbJX3x9C7FEc8J2EchoO3FX/bQ7ogPFCMZj5JMfrkz5sacPY1YawGzzs
         37s00YSqi83jnsdS4F8HBlUaQ8lnpzsebhgN+retj/XmVqD5lAZhF5aQc5FmMgJmJln8
         k34G/YHAKYWauKK47Npq01Wpvwkqpkc5Xd6ZvStooCty2763b0DLnOHfkujadAEOC2dQ
         V08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NFsoYweUg6Gw/KBarKyXriXFXkdQh70pA9JMCBH/upQ=;
        b=l8esFYw1EIXRLjFZjJFgLonn3EOfP0QP+IRoHJPA46yo84bor1/C6nBxCtcLdEOusZ
         dlhHB+ef6eVFMCO/WMGOraDNlbmQq2pNcVNsB6oRFd5P4eLRuSiTmjNpgDHQ+egCeAqa
         F1Zr4VYrEFY44E0FLoOvBVFI5c8cpB4C/gJaUqlsZxgDAaPgg+/0BPHXzxAMYoc0E6QJ
         hbT3JfMaBAMK7UXRnUgLS+10XR0KwrxMssFlfn1MW61eK3RCl8lPnQnDWQG44nAXUY0W
         5V3RZRfuEVbhyJ/fCnge1vMsv/8QL2PExNGWMm1V0A8UHyJuc1G5RKFUsdL7QnxUVh4w
         oepA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.84 as permitted sender) smtp.mailfrom=dovgaluk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <dovgaluk@ispras.ru>
Received: from mail.ispras.ru (mail.ispras.ru. [83.149.199.84])
        by mx.google.com with ESMTPS id o10si9827040ljg.99.2020.06.22.00.17.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 00:17:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.84 as permitted sender) client-ip=83.149.199.84;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.84 as permitted sender) smtp.mailfrom=dovgaluk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from [192.168.0.183] (unknown [62.118.151.149])
	by mail.ispras.ru (Postfix) with ESMTPSA id B2EEB40A632F;
	Mon, 22 Jun 2020 07:17:27 +0000 (UTC)
Subject: Re: [PATCH] target/arm: Remove unnecessary gen_io_end() calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
From: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
Date: Mon, 22 Jun 2020 10:17:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619170324.12093-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Ns0I1I+IEeVv

On 19.06.2020 20:03, Peter Maydell wrote:
> Since commit ba3e7926691ed3 it has been unnecessary for target code
> to call gen_io_end() after an IO instruction in icount mode; it is
> sufficient to call gen_io_start() before it and to force the end of
> the TB.
> 
> Many now-unnecessary calls to gen_io_end() were removed in commit
> 9e9b10c6491153b, but some were missed or accidentally added later.
> Remove unneeded calls from the arm target:
> 
>   * the call in the handling of exception-return-via-LDM is
>     unnecessary, and the code is already forcing end-of-TB
>   * the call in the VFP access check code is more complicated:
>     we weren't ending the TB, so we need to add the code to
>     force that by setting DISAS_UPDATE
>   * the doc comment for ARM_CP_IO doesn't need to mention
>     gen_io_end() any more
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

> ---
>   target/arm/cpu.h               | 2 +-
>   target/arm/translate-vfp.inc.c | 7 +++----
>   target/arm/translate.c         | 3 ---
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 677584e5da0..cf66b8c7fb0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2334,7 +2334,7 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
>    * migration or KVM state synchronization. (Typically this is for "registers"
>    * which are actually used as instructions for cache maintenance and so on.)
>    * IO indicates that this register does I/O and therefore its accesses
> - * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
> + * need to be marked with gen_io_start() and also end the TB. In particular,
>    * registers which implement clocks or timers require this.
>    * RAISES_EXC is for when the read or write hook might raise an exception;
>    * the generated code will synchronize the CPU state before calling the hook
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
> index e1a90175983..bf31b186578 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -119,15 +119,14 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
>           if (s->v7m_lspact) {
>               /*
>                * Lazy state saving affects external memory and also the NVIC,
> -             * so we must mark it as an IO operation for icount.
> +             * so we must mark it as an IO operation for icount (and cause
> +             * this to be the last insn in the TB).
>                */
>               if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> +                s->base.is_jmp = DISAS_UPDATE;
>                   gen_io_start();
>               }
>               gen_helper_v7m_preserve_fp_state(cpu_env);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_io_end();
> -            }
>               /*
>                * If the preserve_fp_state helper doesn't throw an exception
>                * then it will clear LSPACT; we don't need to repeat this for
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 6d18892adee..2677eaeb1e1 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8824,9 +8824,6 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
>               gen_io_start();
>           }
>           gen_helper_cpsr_write_eret(cpu_env, tmp);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_end();
> -        }
>           tcg_temp_free_i32(tmp);
>           /* Must exit loop to check un-masked IRQs */
>           s->base.is_jmp = DISAS_EXIT;
> 

