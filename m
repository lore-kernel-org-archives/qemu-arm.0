Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1841434wre;
        Sat, 2 Jun 2018 09:16:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL49BjU8FldMT76Mrwsq/0ghxxmHqjJIsN2gvKgvLBgbGpVkgc5Gw9g3zyYcoqPBiLyy5zy
X-Received: by 2002:a0c:c602:: with SMTP id v2-v6mr14366914qvi.11.1527956191690;
        Sat, 02 Jun 2018 09:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527956191; cv=none;
        d=google.com; s=arc-20160816;
        b=YKwbZbx+u5wutA0xmLi3nfovEBgyNblR6eMK1ZkrpVXXVs3Rt7nJc3XrU55O8mfIyL
         1H7b4QM10vm3LZF4b/2OxDJZhikeLgxKvqnXh8BCmjBx8XuTMxoudy+LvZaEVOpTruiq
         GsEdIeaTZl/t4DnhOY9PKsrLDCi5LNZI4MffmuyezmvByt04QS5l4g+XHaNA+F3B657w
         RlPx+f8gsRzdeTPSsqDOGDxC6leNQahXmhqZZKn0reqIRnPWTxgxJ3k6Fv2ByABLsa+o
         VLVzi32c6rAFWwVB9NR8fvRHfIM3NEsi70ZHkPMHHSkJiYMq590gj3v5pP1L/5FovRrh
         +Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7TKGGskKaq42aHHLs6WoyfvM4I7n0Qq+8kjXMvu6cDY=;
        b=GQU4mQ/DWuE9UqgMqlEN+78dLN/u6KJkO2Hmv38kpo/Trg07xqXH/IecEz5Jc/K5m6
         R7n3fYb7mkhnUSSHs71T5X569ykye0MSQ8mj6RttfwyaWKB8HegesQT+zTVMIgO7gWNg
         vU6i71Fq4zj+vBO5nZiIGdM8chPFhaFVO+WZ1vCzhfwNXGoA5OoG9CGtytBkv7rpt51F
         WyQf0FthatRpOjYKk9Cjji8WsS3oea5N9WkzS/PJvU53NboPDgtRvRl8nq3L3YbRzBwg
         XDZF2MZE0wl+R21c8B2PilKsNWtsWEAaKsKnr10NQmH7452xO6ze8Sb3PuLRQTjl+0aY
         dOMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jcNsMZZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5-v6si2528123qtf.238.2018.06.02.09.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 09:16:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jcNsMZZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fP9Ch-0003hs-5x
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 12:16:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fP9CY-0003hK-Ii
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fP9CX-0001TH-FA
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:16:22 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:39304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fP9CX-0001SJ-9T
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 12:16:21 -0400
Received: by mail-ot0-x241.google.com with SMTP id l12-v6so32776842oth.6
	for <qemu-arm@nongnu.org>; Sat, 02 Jun 2018 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7TKGGskKaq42aHHLs6WoyfvM4I7n0Qq+8kjXMvu6cDY=;
	b=jcNsMZZIr9REDKSYmAsmKoo1KPO+n4IW4EbKI+oU/WsbqjRlfflVc7WCjDUwOtAdsb
	Zd8t2tNBGLm+H0dkt1nEtyzbVAXRNqnlqSrKpmMwN+DvDEUyPRzgItGzAvaoR9lInX3t
	16HahcyIcSWa/KO9JdWkAYIC8KxTHgqiTRE/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7TKGGskKaq42aHHLs6WoyfvM4I7n0Qq+8kjXMvu6cDY=;
	b=Zu6o/FWL+30Ea8q7qnfsFTFrMvKP9igMuJVbkp7dY1YFAWvpFphVF32FcvwONR8TD7
	huiWOUW2ZZEwzSqY4U7l8h1Ab0iC/JCSdrWKn5CeXBoNkLB3S2PiaDH4igSH4pB6Syn1
	kOSWOtWwY4ffUx0sjV7TYLZi0nk9RckxnKezwk6dQlfYpLS4Vn9D7TsAT8SltMVxVX4M
	dYhkig4Lag1qpEEiO8pwTEXKyEdbZq2JDFi1XbDQMWNdipQlwgko+u9UtXCENn53VnsS
	gl2uCKZhDtDj/8K70Vpry+vtY4l2bQDpDVYeuX+G+PU2/WYmGdodt3wm1PAmqHLzIjL7
	MM7Q==
X-Gm-Message-State: ALKqPwcm3T2hZyg2ulT7LRSFxAG1ECfZrXa/vCdvoGB7pMX5/amDnQqk
	qyg9Qhs2Xa4mY7W5vcw7FQru6q9XAxBroZVdppFE4Q==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr10989233otd.210.1527956180468; 
	Sat, 02 Jun 2018 09:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 09:16:00 -0700 (PDT)
In-Reply-To: <20180602141446.29982-3-stefanha@redhat.com>
References: <20180602141446.29982-1-stefanha@redhat.com>
	<20180602141446.29982-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jun 2018 17:16:00 +0100
Message-ID: <CAFEAcA9cnV6fyc4AMO--jvvycrHPdy1Syvrqxy3J=OyM3cqGpg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [RFC 2/2] arm: add ARMv6-M device container
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Doc6gJvlhVC

On 2 June 2018 at 15:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Introduce armv6m_init() and the glue code needed to wire together an
> ARMv6-M ARMCPU with memory and the NVIC.
>
> The "microbit" board needs to use a Cortex M0 CPU instead of a Cortex
> M3.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/Makefile.objs            |   1 +
>  hw/intc/Makefile.objs           |   2 +-
>  hw/timer/Makefile.objs          |   2 +-
>  include/hw/arm/arm.h            |  16 +++
>  include/hw/arm/armv6m.h         |  49 ++++++++
>  hw/arm/armv6m.c                 | 190 ++++++++++++++++++++++++++++++++
>  hw/arm/nrf51_soc.c              |   5 +-
>  default-configs/arm-softmmu.mak |   2 +
>  8 files changed, 262 insertions(+), 5 deletions(-)
>  create mode 100644 include/hw/arm/armv6m.h
>  create mode 100644 hw/arm/armv6m.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index cecbe41086..5fb135791d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -17,6 +17,7 @@ obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
>
>  obj-$(CONFIG_ARM_V7M) += armv7m.o
> +obj-$(CONFIG_ARM_V6M) += armv6m.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210.o
>  obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>  obj-$(CONFIG_DIGIC) += digic.o
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 0e9963f5ee..dbfb7195db 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -26,7 +26,7 @@ obj-$(CONFIG_APIC) += apic.o apic_common.o
>  obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
>  obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
> -obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o
> +obj-$(call lor,$(CONFIG_ARM_V7M),$(CONFIG_ARM_V6M)) += armv7m_nvic.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
>  obj-$(CONFIG_GRLIB) += grlib_irqmp.o
>  obj-$(CONFIG_IOAPIC) += ioapic.o
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 8b27a4b7ef..03d98a7871 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -1,6 +1,6 @@
>  common-obj-$(CONFIG_ARM_TIMER) += arm_timer.o
>  common-obj-$(CONFIG_ARM_MPTIMER) += arm_mptimer.o
> -common-obj-$(CONFIG_ARM_V7M) += armv7m_systick.o
> +common-obj-$(call lor,$(CONFIG_ARM_V7M),$(CONFIG_ARM_V6M)) += armv7m_systick.o
>  common-obj-$(CONFIG_A9_GTIMER) += a9gtimer.o
>  common-obj-$(CONFIG_CADENCE) += cadence_ttc.o
>  common-obj-$(CONFIG_DS1338) += ds1338.o
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 70fa2287e2..a0eaf52ae6 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -23,6 +23,22 @@ typedef enum {
>      ARM_ENDIANNESS_BE32,
>  } arm_endianness;
>
> +/**
> + * armv6m_init:
> + * @system_memory: System memory region
> + * @mem_size: RAM size, in bytes
> + * @num_irq: number of interrupt pins
> + * @kernel_filename: path to kernel image
> + * @cpu_type: an ARMv6-M CPU implementation
> + *
> + * Initializes CPU and memory for an ARMv6-M based board.
> + *
> + * Returns: ARMV6M device containing CPU and NVIC.
> + */
> +DeviceState *armv6m_init(MemoryRegion *system_memory, int mem_size,
> +                         int num_irq, const char *kernel_filename,
> +                         const char *cpu_type);

I just submitted a patchset that removes armv7m_init(), so
please don't add one for armv6m.


> --- /dev/null
> +++ b/hw/arm/armv6m.c
> @@ -0,0 +1,190 @@
> +/*
> + * ARMV6M System emulation.
> + *
> + * Copyright (C) 2018 Red Hat, Inc.
> + *
> + * Based on hw/arm/armv7m.c (written by Paul Brook),
> + * Copyright (c) 2006-2007 CodeSourcery.
> + *
> + * This code is licensed under the GPL.
> + */

There's a lot of code duplication here with the armv7m object;
can't we avoid that? What (if anything) needs to be done
differently from armv7m/armv8m (which both share the same
code)? Can we handle it by parameterizing or a shared base
class or something instead?

(This code will break if the "check we actually have an
NVIC for M profile cores" patchset I sent the other day
is applied, because changes made there to armv7m would
need to be propagated across to this copied code. It would
be nice not to have to change multiple places for that
sort of thing.)

thanks
-- PMM
