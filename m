Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2503891njc;
        Mon, 4 Nov 2024 16:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVB3EnprlAkLBqe9MfC20KxwYk9pTIspoiMrJ49e+sk/DWmFeggSDWp1XudvKtyjTqr5rfnObTJYpuMA==@linaro.org
X-Google-Smtp-Source: AGHT+IGPxSqDJQwHWOlEh4rVnlvkZlRfQXXPpZjQQMafUo0tg1Yz06o3MmjkELYp0OG9iRCXQWBN
X-Received: by 2002:a05:6214:5b01:b0:6cb:5273:7265 with SMTP id 6a1803df08f44-6d351ac5f17mr288376426d6.20.1730766812276;
        Mon, 04 Nov 2024 16:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730766812; cv=none;
        d=google.com; s=arc-20240605;
        b=PSLMeNirR2T26bdt/vc2ttrMgECRZ3VIxDgTRVsdK8fn1fmwg6eBYViNPuIm65dS/9
         HzEzhdff++2dDskb2tdccrnMiA0SJ7sK1pg/jKv7LeLQAwt8C0tuhXM4pbFrw6zRWyuj
         qF2ucDU2jZdKlmUbX8/gK+YndSQNQz3+Y3jFNmASZL3JfIDuFvyvUS6vg77Nh+/+TRgT
         ynE16o/0edujr8lBGsoW2sK/5PmQ2Vw1aQRJEbvnDX3cs+envgDeCKNbzml73q4A7E7y
         WYhfhMbWEP4I1yQHaxFO1fcd0fhDfZu0if+eF46yvptdmuXXXjQV32hgoqN5aj2lC79X
         8NTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R8xFmH8UJN8b0VX2UnKbE8j74yN2twaQ/6rPHnaBTwk=;
        fh=2QpUj8ktA2R6KDhzpBzfnLbymxgZOoIgEtPRgtFgeNE=;
        b=cnTmwo8CM6Hpvnymvp+ThDXrcpKw4pCWJqxzYdqtKn8nttdEyR2VeQJH1GLap3PQ4p
         TjbScVNtUytqPc5IcRsjb4Dc+ywThBcGBpBft60YRjLsJWF9HWBANsG9UST0qmS8YSvk
         vhzffb3ouJaqR8VQ/4dZs+2nl4mHvbrUEkeY2PvKcHk45fIG4vdu51vTGnV24Ay7ImCh
         072p5XaYFwFz2QAiozr37XxhCGXw+lITr440rcYDjLCp5whF8mh3pzIBDH10jS/pRGl6
         n1pxHbjxAU0vSSiYu5xzxy70BaVhc7FA0AnIN0TCIX3fZkOraQrV0H4A9hYeUl7VKB/A
         i39w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aPEGY7/d";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541ad081si119102366d6.507.2024.11.04.16.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 16:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aPEGY7/d";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730766811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8xFmH8UJN8b0VX2UnKbE8j74yN2twaQ/6rPHnaBTwk=;
	b=aPEGY7/d4nrBRj/gx/gmBgRoi2xj3tuSYQqQEkZw/J2aQ3xh3cDr4uqcTStHY/sRMfJNem
	mdJZ6zfel8Sj5XPB/zv5WMsiHjjMsfRkYmwixLFSgfVGLOeBsvhkt/PS4Dsdenu9jNGwgG
	fC7PIxrICQLuFBb7w56jXwHGDjYy4fM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-J7F3UXmKO5KU1q75OVzMXA-1; Mon, 04 Nov 2024 19:33:28 -0500
X-MC-Unique: J7F3UXmKO5KU1q75OVzMXA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-211151bcf46so40279785ad.1
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 16:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730766808; x=1731371608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8xFmH8UJN8b0VX2UnKbE8j74yN2twaQ/6rPHnaBTwk=;
        b=bY/rOQ4YqJExz1yoCILl4OcLpBIm2RLytvch1pIrPXIvmxiW2oLwaBb/ghmrkkjPcd
         v7ONwTqoLrJqTiMqOadKGLVY0SNS/H9T8ZPij44WKTCR3kz/WXG49e4vtL9fCWkPOozS
         uWnQJ0TP4elY/UmoaDaYeUdsK0Yg9vZJLTzbx7zXGf3DNRKXEzvQm9xcW9CrupdSfiuW
         jqykJThNOl7wW9RQmeSGoLxjtrUAwyCK6qVWuHcnUhuuKlke1N7FRYZKvS0THPc3GeLQ
         yuPNllvGC787LGRwkWXfB8ZkhW/VW7fQm4A3X2r3GePfrECb4lmjTm6U1v3TA3Iob2Ho
         QXrw==
X-Forwarded-Encrypted: i=1; AJvYcCUv7e2WHj7GPEXBYMQAMVDd+RKWoMryEN7g4UWrVU2bXQXyHhR/h4/Uw1YfAZkcv9xuoxzeZn5NoIIVsg==@linaro.org
X-Gm-Message-State: AOJu0YytCLd09+9MkJSCv7Bzkx6zAog7wIp1jAEWEuPTbCCC8GnAbGYC
	60QwxKlsUbwT4vyyiSulNWnA90QlIZBB4IW2lt8rNOlJTr3WOVjcfliejCO/5jDmbaaDWe+hXXw
	Kp78yD0qxxC9bkkZKoCm/MbAURfxMrOFawNjQH0ZzW7N3r0WW/mbQ3A==
X-Received: by 2002:a17:902:ecc5:b0:20e:552c:53ee with SMTP id d9443c01a7336-21103b04ec4mr242140065ad.24.1730766807739;
        Mon, 04 Nov 2024 16:33:27 -0800 (PST)
X-Received: by 2002:a17:902:ecc5:b0:20e:552c:53ee with SMTP id d9443c01a7336-21103b04ec4mr242139715ad.24.1730766807293;
        Mon, 04 Nov 2024 16:33:27 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c1608sm66684265ad.228.2024.11.04.16.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 16:33:26 -0800 (PST)
Message-ID: <1ad74261-c8db-4689-a7a9-83cd95d126b2@redhat.com>
Date: Tue, 5 Nov 2024 10:33:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Cc: jonathan.cameron@huawei.com, alex.bennee@linaro.org, imammedo@redhat.com,
 pbonzini@redhat.com, maz@kernel.org, will@kernel.org,
 oliver.upton@linux.dev, jean-philippe@linaro.org, lpieralisi@kernel.org,
 david@redhat.com, philmd@linaro.org, andrew.jones@linux.dev,
 eric.auger@redhat.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com,
 gustavo.romero@linaro.org
References: <20241103152455.202462-1-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241103152455.202462-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: zHr4b9LE7cVx

On 11/4/24 1:24 AM, Salil Mehta wrote:
> Extract common GIC and CPU interrupt wiring code to improve code
> readability and modularity, supporting reuse in future patch sets. This
> refactor is benign and introduces *no* functional changes.
> 
> Note: This patch has been isolated from a larger patch set to facilitate
> early merging and reduce the complexity of the original set, as it
> operates independently. All original tags and author contributions are
> retained.
> 
> [!] Please note, this is a purely cosmetic change. No functional change.
> 
> Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> [4/05/2024: Issue with total number of PPI available during create GIC]
> Suggested-by: Miguel Luis <miguel.luis@oracle.com>
> [5/05/2024: Fix the total number of PPIs available as per ARM BSA to avoid overflow]
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 108 ++++++++++++++++++++++++++++----------------------
>   1 file changed, 60 insertions(+), 48 deletions(-)
> 

With the following nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a0d3bef875..d6892b0266 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -761,6 +761,65 @@ static bool gicv3_nmi_present(VirtMachineState *vms)
>              (vms->gic_version != VIRT_GIC_VERSION_2);
>   }
>   
> +/*
> + * Mapping from the output timer irq lines from the CPU to the GIC PPI inputs
> + * we use for the virt board.
> + */
> +const int timer_irq[] = {
> +    [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
> +    [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
> +    [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
> +    [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
> +    [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
> +};
> +

'static' is needed at least since it's a file-scoped array.

> +static void wire_gic_cpu_irqs(VirtMachineState *vms, CPUState *cs)
> +{
> +    SysBusDevice *gicbusdev = SYS_BUS_DEVICE(vms->gic);
> +    unsigned int smp_cpus = MACHINE(vms)->smp.cpus;
> +    DeviceState *cpudev = DEVICE(cs);
> +    int i = CPU(cs)->cpu_index;
> +    int intidbase, irqn;
> +
> +    intidbase = NUM_IRQS + i * GIC_INTERNAL;
> +

The function name wire_gic_cpu_irqs() looks not standard enough. How about to
rename it to virt_set_cpu_irqs(), or virt_connect_cpu_irqs() since we already
had virt_set_cpu_properties()? The subject and changelog need to be adjusted
accordingly.

Lets make some of the variant's names a bit meaningful, and CPU() isn't needed
since @cs is already CPUState?

     int index = cs->cpu_index;
     int n, intidbase = NUM_IRQS + i * GIC_INTERNAL;

> +    for (irqn = 0; irqn < ARRAY_SIZE(timer_irq); irqn++) {
> +        qdev_connect_gpio_out(cpudev, irqn,
> +                              qdev_get_gpio_in(vms->gic,
> +                                               intidbase + timer_irq[irqn]));
> +    }
> +
> +
> +    if (vms->gic_version != VIRT_GIC_VERSION_2) {
> +        qemu_irq irq = qdev_get_gpio_in(vms->gic,
> +                                        intidbase + ARCH_GIC_MAINT_IRQ);
> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
> +                                    0, irq);
> +    } else if (vms->virt) {
> +        qemu_irq irq = qdev_get_gpio_in(vms->gic,
> +                                        intidbase + ARCH_GIC_MAINT_IRQ);
> +        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
> +    }
> +
> +    qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> +                                qdev_get_gpio_in(vms->gic, intidbase
> +                                                  + VIRTUAL_PMU_IRQ));
> +
> +    sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +    sysbus_connect_irq(gicbusdev, i + smp_cpus,
> +                       qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +    sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> +                       qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +    sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> +                       qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +    if (vms->gic_version != VIRT_GIC_VERSION_2) {
> +        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
> +        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
> +    }
> +}
> +
>   static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>   {
>       MachineState *ms = MACHINE(vms);
> @@ -862,54 +921,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>        * CPU's inputs.
>        */
>       for (i = 0; i < smp_cpus; i++) {
> -        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
> -        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
> -        /* Mapping from the output timer irq lines from the CPU to the
> -         * GIC PPI inputs we use for the virt board.
> -         */
> -        const int timer_irq[] = {
> -            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
> -            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
> -            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
> -            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
> -            [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
> -        };
> -
> -        for (unsigned irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> -            qdev_connect_gpio_out(cpudev, irq,
> -                                  qdev_get_gpio_in(vms->gic,
> -                                                   intidbase + timer_irq[irq]));
> -        }
> -
> -        if (vms->gic_version != VIRT_GIC_VERSION_2) {
> -            qemu_irq irq = qdev_get_gpio_in(vms->gic,
> -                                            intidbase + ARCH_GIC_MAINT_IRQ);
> -            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
> -                                        0, irq);
> -        } else if (vms->virt) {
> -            qemu_irq irq = qdev_get_gpio_in(vms->gic,
> -                                            intidbase + ARCH_GIC_MAINT_IRQ);
> -            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
> -        }
> -
> -        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> -                                    qdev_get_gpio_in(vms->gic, intidbase
> -                                                     + VIRTUAL_PMU_IRQ));
> -
> -        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> -        sysbus_connect_irq(gicbusdev, i + smp_cpus,
> -                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> -        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> -                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> -        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> -                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> -
> -        if (vms->gic_version != VIRT_GIC_VERSION_2) {
> -            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
> -                               qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
> -            sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
> -                               qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
> -        }
> +        wire_gic_cpu_irqs(vms, qemu_get_cpu(i));
>       }
>   
>       fdt_add_gic_node(vms);

Thanks,
Gavin
