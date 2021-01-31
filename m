Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2682361lfo;
        Sun, 31 Jan 2021 06:21:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkbgWRFktSr3OhaHiJNp5CYNSDj6JXH2uRDV6A3vIfz7UR67z5z6ESjRMolMcLG5N96qZV
X-Received: by 2002:a5d:68c6:: with SMTP id p6mr13773258wrw.332.1612102871429;
        Sun, 31 Jan 2021 06:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612102871; cv=none;
        d=google.com; s=arc-20160816;
        b=DBjFEi9k9DhckWasZXO48RaB9AGeXzZK05i5Z0HHvDbB/0wB0ypMP08CS+A0bnTHFb
         zS7bwpL4AIdY+7zCMdcaGiw0k8gNg24yxtGYTvS8UIYtBQS3xm5w+DwKQbW9dmYZrEdG
         77x8j5VrlapNMDD4x70kWkK0KLqNj5sVbxQVFZ7DCorDxYK93LsBeqkG7FNi5NJaHDiY
         YL0URGWLF0dtgYFYqY6PXiMMwwMsRP6vYt8LvX54JXITxFwOi5r9AlZs6WGl8OiqmN2p
         SnifYTv9N4T5JECcb+wr8xFLJ9rn3vj+OH5jzZ765wtmcn0/qmeZPxB18uzxIiY7PdXs
         pg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NVplo/80cub9LG2ljKxjtIcU/iFpujCC8ro65ZZ04wg=;
        b=awhl1/hqtm991nBYnNLxzpb+F+VKzUESzkP6EbfrNOHgmW0OmctpjIhT3ZIA9lFl3I
         B5IeDxzAidWN6TWpgriSkoxIRuwnxjg6CM/QlWtZ+/y88Id5jPk5VeQiROziTRbKFPwF
         AkOyfab5eEDktk52XmuixV7Ex5WbvHj/xMsiu8r9a1Sk1GI8d2fyHsPxmqYrnmzsm38y
         QojTCgIBJtCpbzRteWMK5Cv4swuGfLqjO7hgeSQeN27kTLXRzlrgKUMECcsqxgvIhJIV
         nqtpdiQRLIHOnRSwSpUnh38lRBSP0/5cqHsfrr93LyQ+U9V4WtiRSOIiydWcq62CgPZa
         xOlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id g6si12614609wrx.193.2021.01.31.06.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jan 2021 06:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 01E3FB159;
	Sun, 31 Jan 2021 14:21:11 +0000 (UTC)
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
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
 <20210131115022.242570-4-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7798c062-b657-336d-ee51-e24465c5bd2c@suse.de>
Date: Sun, 31 Jan 2021 15:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Q2I4V0HrAfcp

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

Looks good to me

Acked-by: Claudio Fontana <cfontana@suse.de>
