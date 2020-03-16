Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp511286lfe;
        Mon, 16 Mar 2020 13:17:42 -0700 (PDT)
X-Received: by 2002:a62:7d11:: with SMTP id y17mr1350910pfc.127.1584389862638;
        Mon, 16 Mar 2020 13:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389862; cv=none;
        d=google.com; s=arc-20160816;
        b=AVaFZMpk8/s9WGoI50M7SXXE1yXuFT5GnEx+d+bbKR6dT4sxMTLCU5mWXqXRYh83HE
         tke5AoZkDz31l7N7QYG+7hpZCeb+jPxpCLvphicWpsgXl2iB5y3Jac/mV6+6vqs5qB+d
         Dzqs1An7jf74pJwc1Rg8kbKUcWE58i6Q+6PKDcnLcNY7VWvoxvQaYBZTooNgDD1PvFVX
         3N/wh6tDGcYPVm4qc3R6YR+6r9T2/paEvjPox837UCNKQ3YgaJU7hMpSWXfyzvn9JqkJ
         ipuCrrOMGi5/l3AojyEbv5L9d6W1DdiqB4m2MWRoM0QqykBcHe9DIMl170FXJlN5Uzie
         BsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2yW7S1n3gr0Wmk0qZ8ztP7NorwmiXCsES5nj7/m/l2s=;
        b=ema+7Ps2bbV/GoGw9zOfHmiHXka3QzblUYpOAU1H5kAoT4uRV/JMGEjFzJzValb3Qz
         oHY1a8ane3ryBgNpK6Fq6YTzv/TjbgMrK87qS3kvLtsEXuQhzElgqbghhc+p+mpHBUor
         kMaOUEgcC6hvLj41Hwaw86jwewK2zz835uiVm/D2ieA08Bp5D5xC01Cp1V3Jv7F/RBsL
         5J1FHSd5bQrd3t0rYxKaxk+CLtQ17eBhg6jahB0OZmttZERFmg4P5H4kUZLRR1aEoQb5
         ghICC9tgumLB42JuYanIPkZwAkGUMoAqNP3f4wCcerg09E5CK2xOLvZbYE0ceCaycvfb
         hwqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOL79TOm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j4sor949424pjn.18.2020.03.16.13.17.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOL79TOm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2yW7S1n3gr0Wmk0qZ8ztP7NorwmiXCsES5nj7/m/l2s=;
        b=lOL79TOmLAhOOPelKaD2VIxJ8azSNOLBXgkxGer1aFJdDHP1Q15mIaKCKsAgieJfCz
         iIsEJkPjvaqmZEBsjzvL2OfIMhCplUv5MXEUi2QHyfxqNMcNyDUnbUlgZMcu/zB81WtH
         gRPCUc9FTR/GDj9vkyF+6dJ36N5oG9FH4E9MiIECxl+I+Pysp0cAa/7hTZjJTOJSvfzD
         rve3rydC76PoRy2zpe7yIq+aTMVo1jrxNDx4FlH5ctnoM0x+4GcHTYqoXUVrdl6Reelu
         DUiHA7eEtnUl8ivnyP9PPFykGKHZQD4J8Qd3cdyT0+2oRf05TyfA9ktCteVYvHQAPHwv
         l0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2yW7S1n3gr0Wmk0qZ8ztP7NorwmiXCsES5nj7/m/l2s=;
        b=Xpk3arzbzsYNLE9sKWxC/Y9zuWTvK43saGGWoNf8usUbM1CpImR2gB6cr9dmy/2Tq0
         HJPi9hoZE2DFLrL7WssL8f7m+6nSn7MF23oLfGhr81uUjyNDEoHhlujBb96IR+xyk/tX
         CD0FyCrT3WzNQaktbAR6iRn0aSPZbSleDQDIR6X8Qev9t4vR+YEcoKD39yqj1W915oGE
         3E2kd7TiaHjltIn6YJRkAF8Fwh8Ht4zVepHADpKvwTw2LnHrEp37A5IMs9yavDjaZbIj
         MFHkyCPBQNdDXm9TUwBuTXYWYrbW6RJMG/TVFsAL9cKgWEAeZzrMjVd33Xt0NTZwrOGB
         gtRA==
X-Gm-Message-State: ANhLgQ1NzHpX7sRDq4rRMslSk31A7GZnwdEJ3KVj1HjXx+NQRWUTjjfg
	L/tfjpP6KshNvuJ8PulwNjv+RaxVwu4SJA==
X-Google-Smtp-Source: ADFU+vth/TIZRKQ+ne19YZSby2Ty7zpQb7LvvexFS2GGoAPSTqzbmzzEvmtJN4ay/ktxRf/Mc3hJDw==
X-Received: by 2002:a17:90a:e384:: with SMTP id b4mr1234622pjz.89.1584389862018;
        Mon, 16 Mar 2020 13:17:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id gc16sm593969pjb.8.2020.03.16.13.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:17:41 -0700 (PDT)
Subject: Re: [PATCH v3 05/19] target/arm: Restrict Virtualization Host
 Extensions instructions to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9cff4a7a-e404-fcc4-eb04-fdbc48ceb7c2@linaro.org>
Date: Mon, 16 Mar 2020 13:17:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RA6YOjJNiOFq

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> Under KVM the ARMv8.1-VHE instruction will trap.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/helper.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

What happened to the uses of these functions?


r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a5280c091b..ce6778283d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2897,16 +2897,6 @@ static void gt_virt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      gt_ctl_write(env, ri, GTIMER_VIRT, value);
>  }
>  
> -static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
> -                              uint64_t value)
> -{
> -    ARMCPU *cpu = env_archcpu(env);
> -
> -    trace_arm_gt_cntvoff_write(value);
> -    raw_write(env, ri, value);
> -    gt_recalc_timer(cpu, GTIMER_VIRT);
> -}
> -
>  static uint64_t gt_virt_redir_cval_read(CPUARMState *env,
>                                          const ARMCPRegInfo *ri)
>  {
> @@ -2949,6 +2939,17 @@ static void gt_virt_redir_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      gt_ctl_write(env, ri, timeridx, value);
>  }
>  
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
> +static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    trace_arm_gt_cntvoff_write(value);
> +    raw_write(env, ri, value);
> +    gt_recalc_timer(cpu, GTIMER_VIRT);
> +}
> +
>  static void gt_hyp_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
>      gt_timer_reset(env, ri, GTIMER_HYP);
> @@ -2976,6 +2977,7 @@ static void gt_hyp_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      gt_ctl_write(env, ri, GTIMER_HYP, value);
>  }
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>  
>  static void gt_sec_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> 
