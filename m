Received: by 10.25.159.19 with SMTP id i19csp1049622lfe;
        Fri, 29 Jan 2016 08:45:33 -0800 (PST)
X-Received: by 10.25.154.20 with SMTP id c20mr3082161lfe.79.1454085933303;
        Fri, 29 Jan 2016 08:45:33 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x244.google.com (mail-lb0-x244.google.com. [2a00:1450:4010:c04::244])
        by mx.google.com with ESMTPS id jn4si8504577lbc.203.2016.01.29.08.45.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:45:33 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::244 as permitted sender) client-ip=2a00:1450:4010:c04::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::244 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x244.google.com with SMTP id zr1so557735lbb.3;
        Fri, 29 Jan 2016 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=aDJf7NdECQVEG+6vinxmyq9pJsHKWLlkLcJVwOR43J4=;
        b=xWN7mcYsb2OGv7L1DdfEnmEMlOyFV5zOxeRsYPQYMpMsvcNYpSxW7ihaaBVjWeIAAE
         03+K1a8nkdv5A9JBwmFvzb7M3owfjQ0Gf1NapvueGzqPrTWsGopLkf7Zyx8cQQIZGYlj
         VbR4sJgVGBHktSKEUl8cMb4CPbCXaLuP7MLXCf0XGH7m8Avuy5UaSyEvN6AbhhupwHvM
         5C08VcgldljT1ZpkOIeEt+z2nikEVM+AgXlYVJ4xArQlRNe9J3uBHCKq44+KhanxdSE1
         j3KDJk5/pM5YMK2o/HkbWrBX9NRRyU6kVUDgBy4x/HVxpM0K+I72nDCJyc0sfGHu7go8
         0SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=aDJf7NdECQVEG+6vinxmyq9pJsHKWLlkLcJVwOR43J4=;
        b=PQ1ZjaOnfZzjwjl70FUrOEwKlIzJcM0JikzudmVjS16jlgC0cguDz/NLXc9wElkxbe
         KaSEscN8cMQlxH4EZgeN2YeQ1cfFoAiLROWQLGMFUrPoUUto9wrCkpqYudWsmU5DFCPr
         qkubzo586iuahxP469DMhHn0lTBmPyMtDpP3YD74rgWgZdh3JYwyO7oA5IStdQqA1OgT
         uZWPCwbQD3Bk1nWpTgHjYQRHg3uemGiDEislCiwdDGPpZpD4pqG/0y4lGtArHFiGPOqs
         so5Ti1hivYHdhB80dDRnZ/jcouoc7ynwW9Ze9AynTO5Ij9YtRPtZIQnmcMNtMcTBWHjA
         9SRg==
X-Gm-Message-State: AG10YOQ6A1BJpUpGCAZO7LejiXLKWp/UqHqePB5aMlZSmymdOhnpBlkU6i4R9tyBJiJEwA==
X-Received: by 10.112.135.131 with SMTP id ps3mr3666019lbb.68.1454085932995;
        Fri, 29 Jan 2016 08:45:32 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id ne8sm2211947lbc.21.2016.01.29.08.45.31
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:45:31 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 1/8] target-arm: Properly support EL2 and EL3
 in arm_el_is_aa64()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB972A.5010007@gmail.com>
Date: Fri, 29 Jan 2016 19:45:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 0hbpyzWpbyve

On 14.01.2016 21:34, Peter Maydell wrote:
> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
> as appropriate to determine the register width of lower exception
> levels.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 5f81342..b8b3364 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -969,18 +969,33 @@ static inline bool arm_is_secure(CPUARMState *env)
>  /* Return true if the specified exception level is running in AArch64 state. */
>  static inline bool arm_el_is_aa64(CPUARMState *env, int el)
>  {
> -    /* We don't currently support EL2, and this isn't valid for EL0
> -     * (if we're in EL0, is_a64() is what you want, and if we're not in EL0
> -     * then the state of EL0 isn't well defined.)
> +    /* This isn't valid for EL0 (if we're in EL0, is_a64() is what you want,
> +     * and if we're not in EL0 then the state of EL0 isn't well defined.)
>       */
> -    assert(el == 1 || el == 3);
> +    assert(el >= 1 && el <= 3);
> +    bool aa64 = arm_feature(env, ARM_FEATURE_AARCH64);
>  
> -    /* AArch64-capable CPUs always run with EL1 in AArch64 mode. This
> -     * is a QEMU-imposed simplification which we may wish to change later.
> -     * If we in future support EL2 and/or EL3, then the state of lower
> -     * exception levels is controlled by the HCR.RW and SCR.RW bits.
> +    /* The highest exception level is always at the maximum supported
> +     * register width, and then lower levels have a register width controlled
> +     * by bits in the SCR or HCR registers.
>       */
> -    return arm_feature(env, ARM_FEATURE_AARCH64);
> +    if (el == 3) {
> +        return aa64;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
> +    }
> +
> +    if (el == 2) {
> +        return aa64;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL2) && !arm_is_secure_below_el3(env)) {
> +        aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
> +    }
> +
> +    return aa64;
>  }
>  
>  /* Function for determing whether guest cp register reads and writes should
