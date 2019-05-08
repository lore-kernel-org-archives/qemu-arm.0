Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4705048wrh;
        Wed, 8 May 2019 04:19:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLXWkssqGPz7PKxjupJPbpfdLnJTgWrIvSGHzQJHTBmfnq0jgsl2obVUleHBv4vqMKjJxj
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr2660819wme.152.1557314346031;
        Wed, 08 May 2019 04:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314346; cv=none;
        d=google.com; s=arc-20160816;
        b=YPfW48aQhwC0DpGoyGD78AKfUqnvdZ9NMTj9hUd2EVVLZ/2xDlKch2wcIh2P95JdFB
         EHfVVk3xZrtnIMGL6p96f9mt8r561d/PmIipZ3zza01gA8USbH6vD0B8fYiBTxL2LYD6
         l0NoewZsL67SeNI/ZBLOmF6w0rwbCH41WAN41mwCgpQ0coNAWbYAzhBJQj7v9P46zKHb
         gEJ1EzBVFfQPg5q8HfeKpW9oBid7V6k6h1BGUDnoHtZjJPMvlB4xrpgSQCnsOrsbn3B0
         7kRkTvO7IN3mHsKZziKPMc6fmz6Ssbht5ioE5PIml/ukW7uCUCSv8RiVfQfMdYtKbjJT
         QUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=7wcbMivpEC1kXzOH42NIe5PKKmvVwN8V7gR7A/dWHZM=;
        b=ycafnz2JCVreq7NYNcpEU/B0rt7bpQhmJsgD9X/WQaD2pPb+jIDJf9j2mIIRrZheCe
         +JDemmdpBw5HMo1FKRKtQnEmp+fiUDuCiuYvAxT0GuzeQU37CY7OcjABuHVwaWYfqMCC
         8CBNW8wOQBLjhGWQ1uLfrEiIyYhAsSN3PdOUT6irTRrBlFCbQJs12D/tYsIrU+uXAPuQ
         FTYtuEuXGFttk/f2vT3d9A5qQOznU3I9JomS6FAsaWlVNzcqEP/gRzN1nyL1MleWonjo
         AZQZEmQCkiyQx+tjrOxkjw0oeEsPAmPl0/BVKrpxa5hMR0V0wF3Ls9HDLclKZPzBLB6w
         HrwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si1276933wmk.26.2019.05.08.04.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKbJ-0007Ub-1K
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:19:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKZv-0006fT-6l
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKZu-0003cm-1P
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:17:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKZt-0003bQ-Pf
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:17:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id 198so2761694wme.3
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7wcbMivpEC1kXzOH42NIe5PKKmvVwN8V7gR7A/dWHZM=;
	b=HJNfa/ANNiMUfimroLIC0CkTbvafAefOTsnrpHh0wcufgLCbViW98Ts7SnfSWH2piM
	pVt1BJtsJVXI+e9DGoxxtBLQo9cEb0UjC4gdolFH43BMflgXH7lSZyqFmF8OBB86uuqI
	Ht4GZezs+dhBej8G6zOzwyp+/GQWuzw8HAUDZ0VJAlc4sWYqvLl2buDjWAKXu6Alv5+D
	obxr4HtGcIsauKR7V+Utbx6xNLIsclqkfV5wvXu/9wwFvAUpWjBm0o9eT/zmJ9FTkwwJ
	YFs8qzuuqWbew+gmuTC4daRN/iJH0742MGoHNW4EAZvyLehUPn4HUHEur+D/ZAOdnIIL
	dwgg==
X-Gm-Message-State: APjAAAWX3yoti5l9Xdw/60mqYJIzG3i1GsWsfojAwcG+2QUC4OcwkMyK
	+7W6X80sjqQN53CS8bslKO+A/Q==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr2614356wmb.56.1557314256764; 
	Wed, 08 May 2019 04:17:36 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	m17sm4474087wmi.27.2019.05.08.04.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:17:36 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-12-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6b6f98cd-541d-538b-f1df-fbf215d01f52@redhat.com>
Date: Wed, 8 May 2019 13:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 11/16] hw/microblaze/zynqmp:
 Move the IPI state into the PMUSoC state
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
X-TUID: 8w2/JBnOYi+9

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> The Inter Processor Interrupt is a block part of the SoC, not the
> "machine" (talking about machine is borderline with the PMU, since
> it is embedded into the ZynqMP SoC, but currentl QEMU doesn't
> support multi-arch cores).
> 
> Move the IPI state to the SoC state, this will simplify the review
> of the next patch.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 57dc1ccd429..eba9945c19b 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -55,6 +55,7 @@ typedef struct XlnxZynqMPPMUSoCState {
>      /*< public >*/
>      MicroBlazeCPU cpu;
>      XlnxPMUIOIntc intc;
> +    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>  }  XlnxZynqMPPMUSoCState;
>  
>  
> @@ -144,7 +145,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
>      MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> -    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>      qemu_irq irq[32];
>      int i;
>  
> @@ -172,16 +172,16 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>  
>      /* Create and connect the IPI device */
>      for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> -        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
> -        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
> -        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
> +        object_initialize(&pmu->ipi[i], sizeof(XlnxZynqMPIPI),
> +                          TYPE_XLNX_ZYNQMP_IPI);
> +        qdev_set_parent_bus(DEVICE(&pmu->ipi[i]), sysbus_get_default());
>      }
>  
>      for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> -        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
> +        object_property_set_bool(OBJECT(&pmu->ipi[i]), true, "realized",
>                                   &error_abort);
> -        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
> -        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, ipi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, irq[ipi_irq[i]]);
>      }
>  
>      /* Load the kernel */
> 

Seems to be useful for debugging too, since the XlnxZynqMPIPIs'
addresses are not lost after xlnx_zynqmp_pmu_init.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
