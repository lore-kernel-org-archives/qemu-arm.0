Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d1sm2480633wrb.62.2017.02.28.06.06.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 06:06:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 81A8E3E0092;
	Tue, 28 Feb 2017 14:06:42 +0000 (GMT)
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-9-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Alistair Francis <alistair23@gmail.com>, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 08/11] armv7m: Don't put core v7M devices under CONFIG_STELLARIS
In-reply-to: <1487604965-23220-9-git-send-email-peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 14:06:42 +0000
Message-ID: <87bmtm2yvh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: fgtcT2Oy8z5O


Peter Maydell <peter.maydell@linaro.org> writes:

> The NVIC is a core v7M device that exists for all v7M CPUs;
> put it under a CONFIG_ARM_V7M rather than hiding it under
> CONFIG_STELLARIS.
>
> (We'll use CONFIG_ARM_V7M for the SysTick device too
> when we split it out of the NVIC.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

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


--
Alex Bennée
