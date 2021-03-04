Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6169543lfg;
        Thu, 4 Mar 2021 03:55:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEWLt5dpfCYNVyxQKx9QFM4uK3GHLH/fwkfV/2U0rjlWDMMnO37ZEusgTrt9XVNvcibUkk
X-Received: by 2002:a1c:c906:: with SMTP id f6mr3503445wmb.128.1614858918100;
        Thu, 04 Mar 2021 03:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614858918; cv=none;
        d=google.com; s=arc-20160816;
        b=SctB9G/OwBCBpxVCsutPYqyTgPA9lxURPudXoCOjfa0CDuUNRbK38rjX8VzpKjUfyU
         +oqEV52plvUterK8XXCMNcnc2x+PnzeSsywEumS/eLjpcF5MAcdNaQ9ZzEmTHuW4DZBs
         2Q4chH2Kd4+Gi2Q31ZH/JTBbtFBk/cT861dv2Wi4vndy4pwAnV/foyMBWj/gtPic4zBN
         26ZiUzu8zQF7U6+l5amAvTKrOe2j7e053i9dy6cX4VeK3xPvUQ7AMfr/2L9U1IR9zHVO
         9O6I+Icx/vhnO7lrJ6uOwPNGb52P64UOJ89rOyMXEAaGu6q5OLsQNh1+dq0RtWH4wq0z
         V/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=QeydolrIwplExhVlZ2qdGjD6x1p1uHnVLLaihHi3OVM=;
        b=YOuSV3EJYydcELsC/I4OM5t4euoDG1f2oxNBLL2H6gHjaIh7Ycpd7XQa6Y40wDTizq
         GQKkQ8g4+bjQhsfczFg4cWB0lnwsyABJleyiGnV/PdcR3HX2nOK0nRYpWutuwjnPhlDG
         25iHNtLS7Jjo3tuYyHrs3qKirpV/kVlVXW+32etd4yRrH65hRC9z+Klrsak1aHmdphH7
         4spNf4Kl0dpa+MBE9J8zleAbjjPrjfmFUoFV/Ljj2RSgN/0HHsuz7ypTtlgSCXxSQBA7
         oSKvwJdwFcp7gCDywuiBIbniydN1JPuGN1g5hjMbASlIZlWR5urUUmSCIn0Eeq/7zuuH
         iVYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id o12si2850018wrc.168.2021.03.04.03.55.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 37A87AF87;
	Thu,  4 Mar 2021 11:55:17 +0000 (UTC)
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-4-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1f571396-c225-0372-12f2-1a366ad181c7@suse.de>
Date: Thu, 4 Mar 2021 12:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UuEU0ZWg1Omc

Hi,

I am trying to take these patches,
in the hope that they help with some of the test issues I am having with the kvm-only build,

but they fail with:

target/arm/Kconfig: does not exist in index

so I guess I need the "target/arm/Kconfig" series right, how can I find that one?

Thanks,

Claudio



On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> Only enable the following ARMv4 CPUs when TCG is available:
> 
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
> 
> The following machines are no more built when TCG is disabled:
> 
>   - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>   - sx1                  Siemens SX1 (OMAP310) V2
>   - sx1-v1               Siemens SX1 (OMAP310) V1
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/Kconfig                          | 4 ++++
>  target/arm/Kconfig                      | 4 ++++
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0824e9be795..6ae964c14fd 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
>  CONFIG_FSL_IMX31=y
>  CONFIG_MUSICPAL=y
>  CONFIG_MUSCA=y
> -CONFIG_CHEETAH=y
> -CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
>  CONFIG_REALVIEW=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f3ecb73a3d8..f2957b33bee 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -31,6 +31,8 @@ config ARM_VIRT
>  
>  config CHEETAH
>      bool
> +    default y if TCG && ARM
> +    select ARM_V4
>      select OMAP
>      select TSC210X
>  
> @@ -249,6 +251,8 @@ config COLLIE
>  
>  config SX1
>      bool
> +    default y if TCG && ARM
> +    select ARM_V4
>      select OMAP
>  
>  config VERSATILE
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index ae89d05c7e5..811e1e81652 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -6,6 +6,10 @@ config AARCH64
>      bool
>      select ARM
>  
> +config ARM_V4
> +    bool
> +    depends on TCG && ARM
> +
>  config ARM_V7M
>      bool
>      select PTIMER
> 
