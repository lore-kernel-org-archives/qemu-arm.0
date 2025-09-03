Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4320CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmuE-0004pR-FU; Wed, 03 Sep 2025 08:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmuD-0004oL-RD
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:48:05 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmuC-0000BO-9Z
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:48:05 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61ed9e63056so1088116a12.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756903682; x=1757508482; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHgaZwe20OB2RTNBClXsk7/P1c0TMf7hbNDsoPb8Wd8=;
 b=eNm6uR05HRLqSHsf06VvIqjbhLiBG9VYx6HxiVit7bEHzp/p3+ulFZOg5CQm6PkD/O
 +kdV+nXWVLEWR1tyQGCFBAmmRpQlvYp9EDY8vYsCYIXahN4dHi6QwPoffn2lm7zlrsy0
 6xRxqCtDH1TI7BO+2vFR8B9sGJTWxNBOo6Ig7jwBrQa+xYzqypEe7lwCNyNI/Tw9V5On
 G1VcRWf+bARTwxFruKqMXuK3k6aZkTXQ3qY/iFwSXnp/upbBUFP6mpnrp1qWllxuHt0t
 eeu4Ed79kLK3jfxoGyfjBVbuOr0X4RambFUMf7/64x/BcvI/s0bKSDgDC7Ow42iDbjFy
 B94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903682; x=1757508482;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHgaZwe20OB2RTNBClXsk7/P1c0TMf7hbNDsoPb8Wd8=;
 b=iWv1Z1tnLxKfU3ke6R/AspLag/8WrmfH3cd+9UDbKDFUnxqRuG4CrnztDPrCwMYkDh
 eC1Fz/doTTRierg780y+rO0hiHISGu2hT/GYCxsfXhsEODncC3tUOc7AL+zdS3gsDIid
 5eYgANOfgXYrT5rGXUoBJP9CyslY5swCzR2AMCXYu26fuCpgReMtgRSk5TKkkCfcRsyq
 jv2TziLe5rDi6Kx1Bob0KfunbqOc8bao27RS//K0M4TZAY11+WdX9pBnWnX48OvKEVWS
 EyIyq2IudFa7jO3iO2Mh9CIb+w3Oy4wgRcHJWGyYlyOBAiV/7FtZH703IA0lMmrMLYgg
 kEZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGYpwDwZJryod69blBOTSIr4GnO7zPJN4T0ZllEmsZCPqLmitYiGetyY6+KAmlDe+b7BH5Fyjccg==@nongnu.org
X-Gm-Message-State: AOJu0YyW+z45pHrnBB/LcuMO959uX9FJFwS5Y48FbJZpZqsEC6AbIShZ
 LUrpKI/IwEIEOmGuoacTsDprGqcnsBA0ETm2DjsHmIGNisGBKxMWfF/Mh68LG0zua8BCZWASiPh
 EaaKgMgQ=
X-Gm-Gg: ASbGncuHgqP9gzyaI7xwvYxalu64oru2tmQchD6GANL2mcTUAFAXCKlSE4vktx9Nxz8
 K05vs9eLnGOX+9dOc4zmVt51Hph78oSnbPa5KOusUExcrntUnhQ2xjpw9zBlXIZDp+LSR8W3Din
 nGz/zdzFrK7OlghNKUjPiFARD2GjlKIysRhr2enqQgOXm8u9tCqPyNRAHo9KoQm2/dhnC6rqOGq
 0ENWR5mhOQTD7xqjfL0ui1c1IGQ3Ow/GgTZw7lY/tkC5KHWHgsaJmFycViaM1xewlJDtY/IGCQR
 5E6f0I15IlunFLYPCAGi1AFCDjWoNAoX1Txa8A37voF4U2lu4LRYMtkFReOY9gxQfT0hT9C3AMF
 /fplolOCod/eMw4h0lvxSalPMdN7aGaq3b+RBkC79YDGqoxaoSzfVU/gNR7uJQjt9yqBTS0c=
X-Google-Smtp-Source: AGHT+IGeKUC5JYfdVaeQ4bCb0WZIKWTm2cj0TQNEGnpnUJk17W8bCFTRPpcirfn308Hq0A/xy6Gndw==
X-Received: by 2002:a05:6402:270e:b0:617:b28c:e134 with SMTP id
 4fb4d7f45d1cf-61d260cc308mr14393716a12.0.1756903682187; 
 Wed, 03 Sep 2025 05:48:02 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc214bacsm12257696a12.16.2025.09.03.05.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:48:01 -0700 (PDT)
Message-ID: <a7eb6a3c-09a5-448b-a27a-812b6dee03fd@linaro.org>
Date: Wed, 3 Sep 2025 14:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] target/arm/hvf: Keep calling hv_vcpu_run() in loop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-19-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 40 +++++++++++++++++++++-------------------
>   1 file changed, 21 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0cfe3066c23..b60efdc1769 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2141,30 +2141,32 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
>       int ret;
>       hv_return_t r;
>   
> -    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
> -        hvf_inject_interrupts(cpu)) {
> -        return EXCP_INTERRUPT;
> -    }
> -
>       if (cpu->halted) {
>           return EXCP_HLT;
>       }
>   
> -    flush_cpu_state(cpu);
> +    do {
> +        if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
> +            hvf_inject_interrupts(cpu)) {
> +            return EXCP_INTERRUPT;
> +        }
>   
> -    bql_unlock();
> -    r = hv_vcpu_run(cpu->accel->fd);
> -    bql_lock();
> -    switch (r) {
> -    case HV_SUCCESS:
> -        ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
> -        break;
> -    case HV_ILLEGAL_GUEST_STATE:
> -        trace_hvf_illegal_guest_state();
> -        /* fall through */
> -    default:
> -        g_assert_not_reached();
> -    }
> +        flush_cpu_state(cpu);
> +
> +        bql_unlock();
> +        r = hv_vcpu_run(cpu->accel->fd);
> +        bql_lock();
> +        switch (r) {
> +        case HV_SUCCESS:
> +            ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
> +            break;
> +        case HV_ILLEGAL_GUEST_STATE:
> +            trace_hvf_illegal_guest_state();
> +            /* fall through */
> +        default:
> +            g_assert_not_reached();
> +        }
> +    } while (ret == 0);
>   
>       return ret;
>   }
r~


