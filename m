Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp129039eja;
        Wed, 1 Nov 2023 20:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnCqZ3MzfZ4IqXV2HrTf4BWfIbOjco+UDVF+/pWSI456KFR3XeyMMPLGS4wMbIXQ+GXnbd
X-Received: by 2002:ac8:7f52:0:b0:418:1ca9:8678 with SMTP id g18-20020ac87f52000000b004181ca98678mr6191569qtk.1.1698897151476;
        Wed, 01 Nov 2023 20:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698897151; cv=none;
        d=google.com; s=arc-20160816;
        b=SO/6zK9L2fyd2kqb1p7qun7qj6YyCJAp//3k0uHrRxVRFIwSAeSwmKpbL+5jS7N1v2
         f8PdTsIBvtTfKFzD5tF0AdzCodHCAvxjzPYtT53sen1pc408k6X4B97A2S3jPrOt/c5l
         urHQbIt3/aT+IgGLkAGMNmeW7vdXrBWpWhtvApWlJL3uLZidxSYj7ER3cdy3OEMLQrFa
         YuSS3D+FIj/egm6wEteiNupTPZ1qPM+pSdQyWc9YPplc56o8ZRi+A7OkJXyK7KvfE9bN
         54TT7dxVLeL/tcAoaR6R8ljYBrmdbntGBHwW53wbkzE5+su4t9wgZWWwbJeIxjIF9Z/d
         UrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+2/XRj9MYKZjFBqZHc65yh16J9gYiRksWMp9E9BJ1rE=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=BmxuP14l6AMF2cw/yY/6usPwlhohVLeOQ6NWKAFA3U5F8eDChX9HTVicYJc2VOrkJe
         n50YZDVrlHkpGGR+S9m6cHU0Ae1AJDiYvqJ0ezTCsLB4f03MMohwTLzOFeaHUENrBGMn
         5fUaLK42d33mJEB5/iE8MB93Kv74jPo6d+R7aoKNXbb56QvYlFwl23onjTEmPVPM5Q9S
         7YqawD1mdV19wvOuLe2KoFhIlWNpirXuQ+a12veF6tIOu9g67mhqXfEpRq2Al+dXAw7P
         jsONEzgHB4nZYXlXVVA1vW3UdKnRe8iGQIhSmbwsXavaVrRovcsoN+CZuA08imJhcWdr
         scBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg93KCMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23-20020a05622a181700b004181b434f3esi3832443qtc.147.2023.11.01.20.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 20:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg93KCMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyOkr-0004r8-MF; Wed, 01 Nov 2023 23:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOkq-0004qo-QZ
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:52:24 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOkn-0007xZ-NS
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:52:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-577fff1cae6so390145a12.1
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698897140; x=1699501940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+2/XRj9MYKZjFBqZHc65yh16J9gYiRksWMp9E9BJ1rE=;
 b=Pg93KCMKC4CMVtZVmgVNcpTnJ6wiEfA8B2XVASY636jDk1Lj2m0JD17oY88gekKAid
 Z66IoNDXq8dPtdI/vE+i3DnPOUbRR25zVtQj+kf9fDNVRC4i4BeJuoBGkBrEyLIwzH4l
 h3osD415qCR5dLj7JaE6vV6+eJh28c0HodTIuHqrCM4we125vs4HkhoGUuc/79wxWUXY
 eHtHMcpkq5L0U9N8Y4SwZ+IUvncVEqwPCs5gtgv1I3/cqVfxfzk/xYV3ZAWU1Xgf3HfD
 lUlDX20izLlivSnD6pnsQhUXZllEu/UCrcVbvFo1vyWQTkz6AWIdXsEF519RMSaV0UjA
 ktNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698897140; x=1699501940;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2/XRj9MYKZjFBqZHc65yh16J9gYiRksWMp9E9BJ1rE=;
 b=NIUECmMV1kMRBsQnXzROTkexdS1YXVqdB8mpAdjGBp2btWVJhQUuz1fYUAhZJPGCzi
 GFynyU/qfTeygccn0YnJCKPBhrRDLXjeim93Du5NzPt75Fz8LIbm2MLVbQfak62qGee1
 V5CCf+f0j35LCuQKnScT52NW+Fi8GcqCztwDqebvGbh5LTdZ+L5qJeTM+FZUNN6alcwk
 bZ9UXeJCH5aa1AWjqUTsOIwkULqf5oVIpvLAJBP7+wTaKYUZv+LrK32zn4t0vWJvVS6A
 ZS1TmgvoqKKcwHwLlw6A3YqIOnwtLXCCoIFvUEjRTOFqfqViUqY+LaM4ifw/F6jtYJaD
 znhw==
X-Gm-Message-State: AOJu0YyTzmWLgba5kY8/u/k+RFN3hoIK6a2Ap0HmD5WkJsU89Y9bKQss
 t3TK2YhgkBU5moIlaDUCNYQNWw==
X-Received: by 2002:a17:90a:df06:b0:280:23e1:e4dd with SMTP id
 gp6-20020a17090adf0600b0028023e1e4ddmr10578315pjb.17.1698897140011; 
 Wed, 01 Nov 2023 20:52:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ie10-20020a17090b400a00b0027ced921e80sm1452963pjb.38.2023.11.01.20.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 20:52:19 -0700 (PDT)
Message-ID: <1c2e53fb-4133-498c-8d96-b0cdc21b51cd@linaro.org>
Date: Wed, 1 Nov 2023 20:52:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/33] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-4-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rDXiOTTz83P+

On 11/1/23 17:24, Gavin Shan wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> For all targets, the CPU class returned from CPUClass::class_by_name()
> and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
> compatible. Lets apply the check in cpu_class_by_name() for once,
> instead of having the check in CPUClass::class_by_name() for individual
> target. In order to make CPU_RESOLVING_TYPE visible to cpu_class_by_name(),
> the helper has to be moved to cpu-target.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>   cpu-target.c           | 15 +++++++++++++++
>   hw/core/cpu-common.c   | 14 --------------
>   target/arm/cpu.c       |  4 +---
>   target/avr/cpu.c       |  8 +-------
>   target/cris/cpu.c      |  4 +---
>   target/hexagon/cpu.c   |  4 +---
>   target/loongarch/cpu.c |  8 +-------
>   target/m68k/cpu.c      |  4 +---
>   target/openrisc/cpu.c  |  4 +---
>   target/riscv/cpu.c     |  4 +---
>   target/tricore/cpu.c   |  4 +---
>   target/xtensa/cpu.c    |  4 +---
>   12 files changed, 25 insertions(+), 52 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 79363ae370..876b498233 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -250,6 +250,21 @@ void cpu_exec_initfn(CPUState *cpu)
>   #endif
>   }
>   
> +ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
> +{
> +    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> +    ObjectClass *oc;
> +
> +    assert(cpu_model && cc->class_by_name);
> +    oc = cc->class_by_name(cpu_model);
> +    if (oc && !object_class_is_abstract(oc) &&
> +        object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE)) {
> +        return oc;
> +    }
> +
> +    return NULL;
> +}
> +
>   const char *parse_cpu_option(const char *cpu_option)
>   {
>       ObjectClass *oc;
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index bca0323e9f..1024de53bb 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -147,20 +147,6 @@ static bool cpu_common_has_work(CPUState *cs)
>       return false;
>   }
>   
> -ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
> -{
> -    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> -    ObjectClass *oc;
> -
> -    assert(cpu_model && cc->class_by_name);
> -    oc = cc->class_by_name(cpu_model);
> -    if (oc && !object_class_is_abstract(oc)) {
> -        return oc;
> -    }
> -
> -    return NULL;
> -}

This move is unnecessary: typename == CPU_RESOLVING_TYPE.

Indeed, since you've grabbed class_by_name from CPUClass, it is completely logical that 
that's the base class against which we should verify.


r~
