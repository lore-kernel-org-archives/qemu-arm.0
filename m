Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp490822ejv;
        Fri, 12 Apr 2024 04:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbfWNWDxsuPvLsbO++7cufe4UR9olvAZWI8Br9wr+MEkG+WbRZ8MFefFkPPTwY7LjQlqGzIaH8Yp7lvXJ5UKcmB2b9gQKY
X-Google-Smtp-Source: AGHT+IGWT285WTUN0A6C9o7KWwIHue4pEBPR/cdcJteNJYzb1Rb6axP0eQwWUtRfXVTZZ4OT/LcX
X-Received: by 2002:a0c:fe67:0:b0:699:1f50:706 with SMTP id b7-20020a0cfe67000000b006991f500706mr2221874qvv.20.1712920298434;
        Fri, 12 Apr 2024 04:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712920298; cv=none;
        d=google.com; s=arc-20160816;
        b=MqFo2xDg83J2JlUdaQN3FDubkjP4y8D5JzRbTypr5MiAP4PG9qo4j73J3CvBUom9uX
         SUvjnVueL8swj1swp4qz8mFMatUxDQTzKfPiwMLUg8b8jjmtRfYtAzs7PUqL5rvtLD0q
         Dg6bhzsk4RllISk+v5ViAVvIqg1BpLuPJww/xdlbhtZ2I01N5FKfsdwiAnSqHWl7tNqt
         mzkpdlaHAZbI1iY/SfaTfHoctWd75z0tpV7zkXtefklDO1T43ocD9z/ygL99oSVW2NH3
         t4rFlPbnfIWtTicY/S3AySR5HzPD1ATOxFSyW+DOiWm0bIPo8pVsJRGXevUI17OtUDOy
         TuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+zUgwDxL6Jh9gS602LQ1TWUHMO/rEs6zICIYwLbAqg8=;
        fh=Kg0/Me3tpVJtH9/d0rYnDSoW4orhjxoGURIkdNPqa+k=;
        b=ZpSP2+agoBdTY9aQL2l34EYJ/rLsaiCLbH7sQ7YeTW5OOfrpN3E68pLdKc3ksN7+Ea
         T+a6byGnUQz6DjwJbHhNE2Pi2uOfV8+XQ9miQ8wWzTk0Qlzv60Rr1LcRsuEpXa1XK/xg
         wMSJZXWg1KSZtjaYq1niQ9kGJppOo8oOxeLFoqQmHs4YVLgaPRRiKMN5xOAgx2cI6Jof
         9e5934gx8ltnlb4HWj2sIKNM/MiYIjfrGJgyvCrneK7CiVpr4Dyv9qmaUUPRF//c2Yyy
         CSo032KeXujt4uD40/4T4wdVEyLSETHnK40l1HGtCg2JxzjMZvvjc62fNisRPxVG+0Ga
         pcOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ip84Lzd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz16-20020ad45890000000b0069b1a67026bsi3382102qvb.177.2024.04.12.04.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 04:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ip84Lzd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvEo5-0001RQ-27; Fri, 12 Apr 2024 07:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rvEo3-0001QD-FL
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 07:10:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rvEo0-00069i-8f
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 07:10:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso507726f8f.1
 for <qemu-arm@nongnu.org>; Fri, 12 Apr 2024 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712920250; x=1713525050; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zUgwDxL6Jh9gS602LQ1TWUHMO/rEs6zICIYwLbAqg8=;
 b=Ip84Lzd/CnljmSD+28oECUk0P6YtEwG8M4aJ54TkLX1FpJINjhjLsV3/f1laUaA6Zg
 Q9DpujKir3mWdNI/1ls6DuGyYfwvI7Ch2FZOHUDqBLK7afTkVjS927Yx0IKiNSFbnMyU
 5brO/3MfC6DUCXHEHvoq8/TXuguPoF5TheQjf4+Avpbr3dpCI5G30nPlJP+rOHC3xVBD
 wT/hZKyuONq0SAV+lJ0X6vtYRZo695RO5QnhbvNKmuOpLazdJabz7yrmp7HKyGBQuaYc
 HrvWeBu8j9PjC7KnTvzqfZktYe/OQl0m4YiwJSbtV9hFC6S+VrJ+pcxYsBHapKPwwJZZ
 s47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712920250; x=1713525050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zUgwDxL6Jh9gS602LQ1TWUHMO/rEs6zICIYwLbAqg8=;
 b=ifUK36G82xn8uI9FP5otLKnFCUfc8nvIspDVHZJ+2v95tU/zX7DohdAFxjrHuEwG69
 dVbPgNUiGr8FCaz2HZ6a/Y6ZmPwa2EzIL1t8u/BiapdodneyrDxZWjrKKChLpVR9eDth
 mjgivl1SvZu+DXCKNLwjyK8u4vzxMJ6mt3n8eHccrkegjkD43Hv8AkmRaV/6xCSpzfJR
 uxdXCeI19YE3zVuxhd/uRopYnDP/fzrd4ae9fKq949MeoCHc/3n36zHfH6RDgQSy86M+
 WHSQCHB7Bn7Zx3zyx7FzI9xptOQVpzM5EnUIqXETfRxktIG7AirNGpZDfi5BQW4HMfTm
 VrhQ==
X-Gm-Message-State: AOJu0Ywb362wcxrkmooYAdchO2gMh7XSkAtT4DheVElZhTLcfMntuob3
 Ts3biATifGjJp3+WfhtSjwaCuP89V4Xh63lgEWnRJdkdx/wypyLdcLqMsZVTrlM=
X-Received: by 2002:adf:ec42:0:b0:343:ebd4:b9f0 with SMTP id
 w2-20020adfec42000000b00343ebd4b9f0mr1452496wrn.32.1712920250538; 
 Fri, 12 Apr 2024 04:10:50 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 cs5-20020a056000088500b00343a0e2375esm4036374wrb.27.2024.04.12.04.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 04:10:50 -0700 (PDT)
Message-ID: <35ea1f53-5c7a-45e8-9fa1-0df8fc7a0cba@linaro.org>
Date: Fri, 12 Apr 2024 13:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw: Fix problem with the A*MPCORE switches in the
 Kconfig files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240412062042.105174-1-thuth@redhat.com>
 <20240412062042.105174-2-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240412062042.105174-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3k3AenWbp5BI

On 12/4/24 08:20, Thomas Huth wrote:
> A9MPCORE, ARM11MPCORE and A15MPCORE are defined twice, once in
> hw/cpu/Kconfig and once in hw/arm/Kconfig. This is only possible
> by accident, since hw/cpu/Kconfig is never included from hw/Kconfig.
> Fix it by declaring the switches only in hw/cpu/Kconfig (since the
> related files reside in the hw/cpu/ folder) and by making sure that
> the file hw/cpu/Kconfig is now properly included from hw/Kconfig.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/Kconfig     |  1 +
>   hw/arm/Kconfig | 15 ---------------
>   hw/cpu/Kconfig | 12 +++++++++---
>   3 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 2c00936c28..9567cc475d 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -48,6 +48,7 @@ source watchdog/Kconfig
>   
>   # arch Kconfig
>   source arm/Kconfig
> +source cpu/Kconfig
>   source alpha/Kconfig
>   source avr/Kconfig
>   source cris/Kconfig
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 893a7bff66..d97015c45c 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -678,21 +678,6 @@ config ZAURUS
>       select NAND
>       select ECC
>   
> -config A9MPCORE
> -    bool
> -    select A9_GTIMER
> -    select A9SCU       # snoop control unit
> -    select ARM_GIC
> -    select ARM_MPTIMER
> -
> -config A15MPCORE
> -    bool
> -    select ARM_GIC
> -
> -config ARM11MPCORE
> -    bool
> -    select ARM11SCU
> -
>   config ARMSSE
>       bool
>       select ARM_V7M
> diff --git a/hw/cpu/Kconfig b/hw/cpu/Kconfig
> index 1767d028ac..f776e884cd 100644
> --- a/hw/cpu/Kconfig
> +++ b/hw/cpu/Kconfig
> @@ -1,8 +1,14 @@
> -config ARM11MPCORE
> -    bool
> -
>   config A9MPCORE
>       bool
> +    select A9_GTIMER
> +    select A9SCU       # snoop control unit
> +    select ARM_GIC
> +    select ARM_MPTIMER
>   
>   config A15MPCORE
>       bool
> +    select ARM_GIC
> +
> +config ARM11MPCORE
> +    bool
> +    select ARM11SCU

I thought 
https://lore.kernel.org/qemu-devel/20231212162935.42910-6-philmd@linaro.org/
  was already merged :/ I'll look at what is missing and respin.
