Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4707090wrh;
        Wed, 8 May 2019 04:21:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz00QIlPWET6RnyTG5hbZXerw+Zs/4SOTj7UhZT1yPnZHzaeAeNd+viA0kw+dow+gMJAZhp
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr2638111wmb.85.1557314486134;
        Wed, 08 May 2019 04:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314486; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9J+8Epyq/VMcP44pxlS60Raq/FQHUlo7dVvXzAMPUWOpZVN/O627u86MnPnA+K7zB
         7hWlptU8HA+hovzN9QorkJ/LVizSX1lt3xWHmmoIQ2Mdm5DVqXZsb3TCa+z7rH+tFLI5
         WFBgt2Tt6XDno3cVOKrIU+2+uMY3Q9owumtyEPhH3gux5PdSdDTisf0xffV3cfE5irvF
         SR5i9kruf+2uPj6sGIdus3qZEOoYoYQob1FV5EKuSu1/F2REkITA+vyWkHOK/rWkjsvW
         f62yr+g+ygVimQT8oc4fzFvDexJTumluhOarTpMQmWi2Dfbgs0y8Tz1YG8IG49xPSxkd
         u7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WgjG8i5+LA2TwuCrkX70oV5zkyuOUwJA8CNz2jBTcBQ=;
        b=dj9YiLh+nXawKa22hXgbws41hsD9tzSOt3GKO4sI/Rb1z9j/KSZfDrJkOF/TkMc0tR
         rgON3h2pwIpGfT+V1QxctL7hjQGou069cb9/KqBDm70DKvpdnMNhmrj1MpYCsi62QhQ/
         BNA9z1DI4shYLUIJucpx0TfJ8wxNMdRUxGnVR9ZmIpxY9paZLf4Gudj7wC/1Ays4YEvP
         sQCdQml+QEJYf3iKqsJRN2GmVTpRNc48mnHlRp2Wot2aUDWMRJuzIV3Rh9/bkldHRE2O
         UdDXlOw++CDPxERLJ5Y3mZSb5pSSThRd/HZ5AEijMDePFXDroGLy00gVypXjQC6nsu4+
         5exw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si1321150wmh.166.2019.05.08.04.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKdZ-00019r-3Z
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:21:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKaU-000737-RR
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKaT-000449-Bp
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:18:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKaT-00043X-2n
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:18:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id w12so13228018wrp.2
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WgjG8i5+LA2TwuCrkX70oV5zkyuOUwJA8CNz2jBTcBQ=;
	b=osmWB5W6NFrS/iHt1uHYiSQHfRf401jsBv9nBX93dQQCaEk78Kwts8wZExMN65x8ee
	TgM+JCs3R4TgweksInC/YNcad2P9jl1GyuYUhdLLKyRJxqykw5DHsZNBdErsQ7w7GRdI
	FLmF6ONae6Nge20wGfFundeYBvB5UsDI5kyGnzCozsIosx1w6zD6Z6TDxI73jYYmXaXI
	9IGXrwfGj+Y/tJ3p/uoeiXlt2Q2eBGCC57//l4d/wmWVVDCOwws7pP+Enz4m4exPHVuM
	r8htgpzr4C9HBTDDaDktP6QOwc4Wrzq4QNjhhQmyZSDA4azoAmkRO2ERvoBuGDcgKwUr
	kIqw==
X-Gm-Message-State: APjAAAXZpOAXCb5idWRMxmwY8LYjUxQswB6dflxyRbKHeOxKxqIOCUqi
	iJT2St0W+yW95ylI1R+EYsoDaQ==
X-Received: by 2002:a5d:420a:: with SMTP id n10mr7441278wrq.325.1557314292008; 
	Wed, 08 May 2019 04:18:12 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	o16sm24343400wro.63.2019.05.08.04.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:18:11 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-13-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3eb47444-d64d-ddfe-a9e2-59f54de76f87@redhat.com>
Date: Wed, 8 May 2019 13:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/16] hw/microblaze/zynqmp:
 Let the SoC manage the IPI devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MRq9S7MdtdCo

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> The Inter Processor Interrupt is a block part of the SoC, not the
> "machine" (See Zynq UltraScale+ Device TRM UG1085, "Platform
> Management Unit", Power Domains and Islands).
> 
> Move the IPI management from the machine to the SoC.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 36 +++++++++++++++------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index eba9945c19b..20e973edf5f 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -68,6 +68,13 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>  
>      sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
>                            TYPE_XLNX_PMU_IO_INTC);
> +
> +    /* Create the IPI device */
> +    for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> +        object_initialize(&s->ipi[i], sizeof(XlnxZynqMPIPI),
> +                          TYPE_XLNX_ZYNQMP_IPI);
> +        qdev_set_parent_bus(DEVICE(&s->ipi[i]), sysbus_get_default());
> +    }
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
> @@ -113,6 +120,15 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
>                         qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
> +
> +    /* Connect the IPI device */
> +    for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> +        object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized",
> +                                 &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0,
> +                           qdev_get_gpio_in(DEVICE(&s->intc), ipi_irq[i]));
> +    }
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
> @@ -145,8 +161,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
>      MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> -    qemu_irq irq[32];
> -    int i;
>  
>      /* Create the ROM */
>      memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
> @@ -166,24 +180,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>                                &error_abort);
>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
>  
> -    for (i = 0; i < 32; i++) {
> -        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
> -    }
> -
> -    /* Create and connect the IPI device */
> -    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> -        object_initialize(&pmu->ipi[i], sizeof(XlnxZynqMPIPI),
> -                          TYPE_XLNX_ZYNQMP_IPI);
> -        qdev_set_parent_bus(DEVICE(&pmu->ipi[i]), sysbus_get_default());
> -    }
> -
> -    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> -        object_property_set_bool(OBJECT(&pmu->ipi[i]), true, "realized",
> -                                 &error_abort);
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, ipi_addr[i]);
> -        sysbus_connect_irq(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, irq[ipi_irq[i]]);
> -    }
> -
>      /* Load the kernel */
>      microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
>                             machine->ram_size,
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
