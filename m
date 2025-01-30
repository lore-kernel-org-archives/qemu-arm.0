Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp59660njb;
        Thu, 30 Jan 2025 07:13:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdtz+BJuzFSncwh14kfyObIj3LO2UwNliQduAOvREea849QRoPvp1leFuVejeiZAsF2nBazJ7+Vd9fPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFoc0bZ+3k2XTLgG241Un4NcrSF59MmopCNB3FXQ0HxraUgYJxAMTNRTY7J5Pn+Jf/ZhOSQ
X-Received: by 2002:a05:620a:608a:b0:7b1:4a48:56bb with SMTP id af79cd13be357-7bffcd9b597mr1314637885a.56.1738250030540;
        Thu, 30 Jan 2025 07:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738250030; cv=none;
        d=google.com; s=arc-20240605;
        b=URvCQjiaVWRgR0xRPfFFjw4To3EnKIbovNt6AXk5HEs+yOuRF5kMR9b6cjPJ0pP8PC
         sOkJb2sdXZJHUPiNvqdvb+hzHYLEVdBKwzB3ur8a/Gw0JLOEbg0KORkn9ELRnkgnM+R7
         0DotkuJLgGCX5cfqB8UBKCcdniVKMiR0Hf2vYioU75w7YNSDlmH5xMU6JAgfnnp4eOVP
         +PuhBakhtbjNVbI5IulPoHfzvQ6Yx1B9dZYRk66QP/860poEauNwHDFG06oQMBjWfKLw
         MXX7l9ikI8hqBg7M3YhBA7+q8Po+pCu+2MNQVieQnp2ljCW6E/isWKIyK5YHwkfSNAsl
         eEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=T/kh5b4rrkrI5dLqPfTiLhWF+qCPu8O0OYyDYUila/Q=;
        fh=4nnppSSUJHwKwMCxi1uhEUiaj5zhRARrkUmu9DN50M4=;
        b=UpH3Yswg4KJQx2xvXACPtseA8oxGgPUCMQbzqYxCKQORmtewXa1x0lgsAigIebiU9j
         w5N2GPIEaqCnxJOfZrV2/C3ZPULsiWdnpRvix7tUMWvGaOFyoQIqNEGCV0vbuCI0tRS+
         Wo/IjPNLSnzz1HKf+WrDRoE3TVGYyZTsDK6eOM681Zt2yauVcFwu7Ltf2KYk1nnmQJG0
         mdmuNGLdItnA2AmR8z1gcctk7u8PjySY2LNh7cibPkEQqO6+vxM5Rxocms+pZ/4rOsR7
         zfhbe4UIsiEQ28KkAJFs66bK6KP520chTC9UKBHKp7/r33XNk1GX2PCdkXUc1SOs1rcx
         3Acw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrT5BfED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8d6ee8si200333685a.174.2025.01.30.07.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 07:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lrT5BfED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdWEe-0001jA-0b; Thu, 30 Jan 2025 10:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdWEb-0001iq-V1
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 10:13:37 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdWEZ-0007Iz-Uc
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 10:13:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso571997f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 07:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738250012; x=1738854812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T/kh5b4rrkrI5dLqPfTiLhWF+qCPu8O0OYyDYUila/Q=;
 b=lrT5BfED63WkU67RAaAilmR2xFZY9X//Vqj2FxTHo0I84xsnhGX6J1NVi9kY4cVoTD
 hNGVUDlV+39SK6XEQXlQ4UVoWjhGxLnyyXoCvWpOfBmHoKwkDku/QoamHfdNzeu63VTg
 9TVxWfjObkEx2wSf2S5yDz0tSAnhFdJRODh8hFyQA4XYNJq/xjIovqx8n5ymbUM+PEG3
 U2z3bsB9Vb5dAfV8UgVkxSeA3CkXjlGebkutKjVzo/fQpqq5VBfrrcUQPqpywJEoJg86
 Zk9MH5K6yKPajZGq5W+bc57Y2BXK0LLjEN9tbmdOa9IcyAmRz6yxxcqQR/ABue+WcGWj
 +GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738250012; x=1738854812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T/kh5b4rrkrI5dLqPfTiLhWF+qCPu8O0OYyDYUila/Q=;
 b=JzdVJDpZVihntjPgzlhaYfzCYifMfj96RsTUKsUsvv7a+eInyNdOo2SmxZKp5T/9l2
 tQSl0vjW94Pi/gqVnTlrUZSng3YEk1aeL2zs/yafXBueUxcO/gEvRtSvvCcDagY3meKM
 xlsAQ7T4XA+luDvt7DmJbL9RVvney+hnM4KJCPfet0otBjY8SzpUCwGlPJnD/NORsclU
 417EaagVpOE+dBPRgYENGhDnhO6fwvvZOee2c3gg1ICTgCHn83BxMoYQyOXoCTttS2IX
 pH5dcb5YUW3fkkOlB+PUxiTeQQ3aNedECDH1/DnuceJqQgfON2FgaLOAjrswCafMQfYL
 I48A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE34eBvLMDQkc99xLSPc00b9XVLPVHxoBA5SCi/WfI6NE+1NQ5DlGw8lCOwFG9zOQv/ZcaTkU9iw==@nongnu.org
X-Gm-Message-State: AOJu0YzqOXrHctX5bnPs8lzgkrRi65xWO8G1yxSakllyWQx7Pym66NX4
 Wbb1+f0LC9kVEN7ftprSjN31cfAG5Cndpbzp/lq9ippqHakqaFKyZg2XjotUB00=
X-Gm-Gg: ASbGncu0+NF/I0sWHT0yhPYbFDdoL50H/HyCxFkiC+qEYKUP9dRuRNqYzul/xEtYgQQ
 DCiDdww8E5DwWMreiv8je44vSdMA5Le3jz8IDkWAWYcdHZRA7CaVbF1BBOn3GpIpL1JDr8YM0xC
 TSUs2s9MuU0cm5GAJyibCSGmhvOQXZaRr6jxDI+iW3MUUsQQxX63UsEGTEqDAppZyYY1JTMOLf3
 vj/Lq6DvWz8E+Sib+afEHA9uqk3+wWVMelFv+gICq46TGLkPeX5yaxLdBH15/t/cgbES6A+lML8
 IwcbJaQ6QCtJ9laIEx8x7MeshBml8GjsTG4spEr6/g6BV4KIk40hdtr2vjI=
X-Received: by 2002:a05:6000:1565:b0:386:366d:5d03 with SMTP id
 ffacd0b85a97d-38c5195ff67mr8515638f8f.16.1738250012491; 
 Thu, 30 Jan 2025 07:13:32 -0800 (PST)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b59f6sm2277356f8f.69.2025.01.30.07.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:13:31 -0800 (PST)
Message-ID: <ffafbec0-db25-478b-8eba-39162f9bce0d@linaro.org>
Date: Thu, 30 Jan 2025 16:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] aspeed/soc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
 <20240604054438.3424349-14-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240604054438.3424349-14-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XERoTg4GXyZM

Hi Jamin,

On 4/6/24 07:44, Jamin Lin wrote:
> Initial definitions for a simple machine using an AST2700 SOC (Cortex-a35 CPU).
> 
> AST2700 SOC and its interrupt controller are too complex to handle
> in the common Aspeed SoC framework. We introduce a new ast2700
> class with instance_init and realize handlers.
> 
> AST2700 is a 64 bits quad core cpus and support 8 watchdog.
> Update maximum ASPEED_CPUS_NUM to 4 and ASPEED_WDTS_NUM to 8.
> In addition, update AspeedSocState to support scuio, sli, sliio and intc.
> 
> Add TYPE_ASPEED27X0_SOC machine type.
> 
> The SDMC controller is unlocked at SPL stage.
> At present, only supports to emulate booting
> start from u-boot stage. Set SDMC controller
> unlocked by default.
> 
> In INTC, each interrupt of INT 128 to INT 136 combines 32 interrupts.
> It connect GICINT IRQ GPIO-OUTPUT pins to GIC device with irq 128 to 136.
> And, if a device irq is 128 to 136, its irq GPIO-OUTPUT pin is connected to
> GICINT or-gates instead of GIC device.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c     | 563 ++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build          |   1 +
>   include/hw/arm/aspeed_soc.h |  28 +-
>   3 files changed, 590 insertions(+), 2 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast27x0.c


> +static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
> +{
> +    Aspeed27x0SoCState *a = ASPEED27X0_SOC(dev);
> +    AspeedSoCState *s = ASPEED_SOC(dev);
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    SysBusDevice *gicbusdev;
> +    DeviceState *gicdev;
> +    QList *redist_region_count;
> +    int i;
> +
> +    gicbusdev = SYS_BUS_DEVICE(&a->gic);
> +    gicdev = DEVICE(&a->gic);
> +    qdev_prop_set_uint32(gicdev, "revision", 3);
> +    qdev_prop_set_uint32(gicdev, "num-cpu", sc->num_cpus);
> +    qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ);
> +
> +    redist_region_count = qlist_new();
> +    qlist_append_int(redist_region_count, sc->num_cpus);
> +    qdev_prop_set_array(gicdev, "redist-region-count", redist_region_count);
> +
> +    if (!sysbus_realize(gicbusdev, errp)) {
> +        return false;
> +    }
> +    sysbus_mmio_map(gicbusdev, 0, sc->memmap[ASPEED_GIC_DIST]);
> +    sysbus_mmio_map(gicbusdev, 1, sc->memmap[ASPEED_GIC_REDIST]);
> +
> +    for (i = 0; i < sc->num_cpus; i++) {
> +        DeviceState *cpudev = DEVICE(&a->cpu[i]);
> +        int NUM_IRQS = 256, ARCH_GIC_MAINT_IRQ = 9, VIRTUAL_PMU_IRQ = 7;
> +        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> +
> +        const int timer_irq[] = {
> +            [GTIMER_PHYS] = 14,
> +            [GTIMER_VIRT] = 11,
> +            [GTIMER_HYP]  = 10,
> +            [GTIMER_SEC]  = 13,
> +        };
> +        int j;
> +
> +        for (j = 0; j < ARRAY_SIZE(timer_irq); j++) {
> +            qdev_connect_gpio_out(cpudev, j,
> +                    qdev_get_gpio_in(gicdev, ppibase + timer_irq[j]));
> +        }
> +
> +        qemu_irq irq = qdev_get_gpio_in(gicdev,
> +                                        ppibase + ARCH_GIC_MAINT_IRQ);
> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
> +                                    0, irq);
> +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> +                qdev_get_gpio_in(gicdev, ppibase + VIRTUAL_PMU_IRQ));
> +
> +        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(gicbusdev, i + sc->num_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(gicbusdev, i + 2 * sc->num_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(gicbusdev, i + 3 * sc->num_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));

Your patch was merged around the same time Jinjie added NMI support (see
commit b36a32ead1 "target/arm: Add support for Non-maskable Interrupt").

Should we add them now?

> +    }
> +
> +    return true;
> +}
