Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2687041lfo;
        Sun, 31 Jan 2021 06:29:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuyYgNtqOBZlNBek/mAUfWuhp/YrK7GilXs/V0fdfdBknXW3fFuj+BelGj0/ls5Xuoofi4
X-Received: by 2002:a5d:6045:: with SMTP id j5mr13623744wrt.365.1612103393706;
        Sun, 31 Jan 2021 06:29:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612103393; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCJPJ1uLvF1jfJBLjASPfhSAf2y9UDtt2yBeHYqydLmj12eDOmtvADS48wxT9XWfRL
         aYOk5QIeMks7/dIUgY9D53VVKEMcb11JV6HxCgauswuVelqsMXsWzBimm7UfVKl+NVcR
         AZpaMSH4GZ6eJxY7d+nfD/5KouSik5VSfq2PILJVakiaC8TT7TAvhygYCxwFUm3NsTmY
         IM2qhXKxMDGKdRFiynB68bYE3ptOuRVEubamym2HVmaED+Bdt6hhQHtF0rfXc1fPPJJk
         yQfGhsMSl2q59tc3+5xiGiJsIZQ1L472aERWnGbIXxRFyDUIaW8qEOeVCKI21GqjbTCH
         Q/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vTLGWMQdlemyeo90FwjoHx6Yb4JC6kUU7xAn4DJpJYs=;
        b=JwKQWvRTg21VnuDsFpzXUwhSO+9itXGPMieedNf6KLEIQs6c1vEj1PrO6EifvMdFZB
         8krbG9Efu/CvVY1jfBQ+JhRnxU0thfs6UKRxhkVCHS8w+s8jBsn0j1WXpjdsfvv5m2tX
         9ylySxW8FmFmI+TYjEj+mZVEJ7z0u0iw2Rk/tsva21OzoPn/a3+urmSKijq24XarL9Wv
         nOQWqg2nXWKxNri5eAZXSUIfD7Wxg4Bx3T8fvRlxMUSNVw57p/IB3TLDzFRnC8kkBaov
         jLMl7pSWW9Xx+7uftQBVVK7hNmxGjcH4RQPLUqP78z2sZr6qPMNY2C0WbUzn1hE+mU8R
         eopQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id r1si12397046wrs.348.2021.01.31.06.29.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jan 2021 06:29:53 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 473A1AD29;
	Sun, 31 Jan 2021 14:29:53 +0000 (UTC)
Subject: Re: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-7-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <66aa95e5-8849-ca1f-9413-be17dea61179@suse.de>
Date: Sun, 31 Jan 2021 15:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1LcSh83uBWqT

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> Beside, KVM only supports A-profile, thus won't be able to run
> R-profile cpus.
> 
> Only enable the following ARMv7 R-Profile CPUs when TCG is available:
> 
>   - Cortex-R5
>   - Cortex-R5F
> 
> The following machine is no more built when TCG is disabled:
> 
>   - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/aarch64-softmmu.mak | 1 -
>  hw/arm/Kconfig                              | 2 ++
>  target/arm/Kconfig                          | 4 ++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
> index 958b1e08e40..a4202f56817 100644
> --- a/default-configs/devices/aarch64-softmmu.mak
> +++ b/default-configs/devices/aarch64-softmmu.mak
> @@ -3,6 +3,5 @@
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
>  
> -CONFIG_XLNX_ZYNQMP_ARM=y
>  CONFIG_XLNX_VERSAL=y
>  CONFIG_SBSA_REF=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6c4bce4d637..4baf1f97694 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -360,8 +360,10 @@ config STM32F405_SOC
>  
>  config XLNX_ZYNQMP_ARM
>      bool
> +    default y if TCG && ARM
>      select AHCI
>      select ARM_GIC
> +    select ARM_V7R
>      select CADENCE
>      select DDC
>      select DPCD
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index fbb7bba9018..4dc96c46520 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -18,6 +18,10 @@ config ARM_V6
>      bool
>      depends on TCG && ARM
>  
> +config ARM_V7R
> +    bool
> +    depends on TCG && ARM
> +
>  config ARM_V7M
>      bool
>      select PTIMER
> 

Acked-by: Claudio Fontana <cfontana@suse.de>
