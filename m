Received: by 10.25.0.147 with SMTP id 141csp88432lfa;
        Mon, 20 Feb 2017 08:40:08 -0800 (PST)
X-Received: by 10.55.135.1 with SMTP id j1mr22323928qkd.107.1487608808583;
        Mon, 20 Feb 2017 08:40:08 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id v66si13275916qki.84.2017.02.20.08.40.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 08:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id n13so14617923qtc.0;
        Mon, 20 Feb 2017 08:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=6aumq6kCWallsMM7iM5K7fjVOy0zN7PNz4UsN2KBjVo=;
        b=HwokVphBkW738sfQhH23AX7O4jo9B7ZpMBdLqhIfTzPFmJlPWt+cH3ysaAMaifxZIW
         SPgsqovvBiDdZLC2JGo8rd6OHPXJqUcRQIAn4qpc81cCpcYRL6+upNElxovGqG9S7QrR
         EeQ5UPj4XIZKr+8kAeF7BQhMUJpBzAZ+cPaqmn+4UQebNaha38KxoNYRhqjzhkdgol99
         7JcHzHZFgTyeSFZy3p6Zq6o1UdDS8O8uquP7Hd8/vfb5LRIRi2K/6oVqxJOTAdt/DnA2
         XZF5gAjkwh2PBrAfAEPTAEPhuA7esJZv/FhVJsLd2Leihrcic+iR6ouETrREyg/0Zq8M
         ebMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=6aumq6kCWallsMM7iM5K7fjVOy0zN7PNz4UsN2KBjVo=;
        b=aoq4vy+P2y9qaK9e5u3aLuPuMVPmHO5DD2Y6hxyxaednil1EhGbOSkvZF35k0uDwOg
         WQxiJ3Pndtr6vm0ZL1HaMkEOYSpbS7TUKDJQu/2qk+RiaMcaLlgjP2ojI2S6XQW709Ej
         9mBAN7NpjsVlIJCcryk+W2YJV80QMjvhGLwPwNRY7iB7ky8d6expIBYj9cuZcd9BlqKJ
         nfP4/pc2QCTO5edGE1mmWnOvu5TDWWISxGideMZXggIt0AdD7V88QPSKV76r8oHqhPLj
         bgRUK1f2UN2bwKrwlwnUbjfexFOvsapmzbfyoqcHyfYVd2Pdg9RIhPLf+8nS4stwOnmX
         hcWA==
X-Gm-Message-State: AMke39nHnwIlPvmGcpyvnH4qz371jtmtMaPRtMFiGut4s780zkbfJ04yCKHUajxjgO726A==
X-Received: by 10.200.2.8 with SMTP id k8mr19702930qtg.163.1487608808022;
        Mon, 20 Feb 2017 08:40:08 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id x64sm12299195qke.60.2017.02.20.08.40.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 08:40:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 08/11] armv7m: Don't put core v7M devices
 under CONFIG_STELLARIS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
 <1487604965-23220-9-git-send-email-peter.maydell@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Michael Davidsaver <mdavidsaver@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4217b13d-1dac-8a1b-a0df-0365cd9e6ec1@amsat.org>
Date: Mon, 20 Feb 2017 13:40:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uagFk0Koof4z

On 02/20/2017 12:36 PM, Peter Maydell wrote:
> The NVIC is a core v7M device that exists for all v7M CPUs;
> put it under a CONFIG_ARM_V7M rather than hiding it under
> CONFIG_STELLARIS.
>
> (We'll use CONFIG_ARM_V7M for the SysTick device too
> when we split it out of the NVIC.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/Makefile.objs           | 2 +-
>  default-configs/arm-softmmu.mak | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 8948106..adedd0d 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -24,7 +24,7 @@ obj-$(CONFIG_APIC) += apic.o apic_common.o
>  obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
> -obj-$(CONFIG_STELLARIS) += armv7m_nvic.o
> +obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
>  obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>  obj-$(CONFIG_IOAPIC) += ioapic.o
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index fdf4089..1e3bd2b 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -42,6 +42,8 @@ CONFIG_ARM11MPCORE=y
>  CONFIG_A9MPCORE=y
>  CONFIG_A15MPCORE=y
>
> +CONFIG_ARM_V7M=y
> +
>  CONFIG_ARM_GIC=y
>  CONFIG_ARM_GIC_KVM=$(CONFIG_KVM)
>  CONFIG_ARM_TIMER=y
>
