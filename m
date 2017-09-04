Received: by 10.223.188.70 with SMTP id a6csp3936173wrh;
        Mon, 4 Sep 2017 00:32:38 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6kccgipxPM+QHGSY4X3Y3t3YN1e83owqR9iZ4WXS52Q11aPSh6maNIcMCi5EIygbZeTVoI
X-Received: by 10.55.166.194 with SMTP id p185mr13446338qke.247.1504510358644;
        Mon, 04 Sep 2017 00:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504510358; cv=none;
        d=google.com; s=arc-20160816;
        b=KPKLBB2eJY5tIEraCeLC7M+DLbIQJQ7BXB4SPTvxsGh55Nzt8Q9AS+YK0/RqRDwWbg
         EUw8apyZgfRIf/sHcKAOhg/2DwUL6IGF6bkGGzcIoIXqTzm0IN9eBuv2SbP3h74MxxAb
         L1ZGcG+frvOtRIm6tAn6hFNDY5wmlN4XFG19iFJNPX9LtBeSkW+xALqtuJPUYNxFgc/r
         QCpbIlyaWWsj9KI/B8ntcyyC2Su97szUwSzN2YJgF4T8f92wCA4XtXUzCQCTXzSXqt/d
         X05kuKx5pH8S9bODCzYZco6/GD1lbTDoHd5murp153Fc8cLm5GQe6ndPhuF5BKBsEplI
         X8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=G1Aw8IQJdvyRQ61Ca8ipeX/QO5PgAUsp4kR6qCsERhY=;
        b=pRGN+6SYt4NCmLADu4PIGJ2pY2TfQoJsEGFOYnIZf0Q/DvSAHW5B1Epry/kytJjMs/
         XtJ3wlJvCC8jGxYOT0AykPmxy1Z7SWAo1OMv64ooOQZpKK2+VaNv2CBBVwYY5ej654NE
         uDCiAGc9E1PzO+rnv/VLqa2N2jG0YI9ZyenagUPi1G2UukYUENdZt9X8xcJOUb0+7S8F
         rMyWIHFPrT1EY/KG84VuSDiclR0OlkVKX4qYAzjTdIN5k7tg5kOJpcOs8m62w1xJxhZA
         kLZZdVi0fVO35T1T2tMDqWrcJYLOHQxbMoqOdWlxZZEgbfW1N78M04TOhxxzzYnTT+5v
         Se6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si5954799qtg.301.2017.09.04.00.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Sep 2017 00:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dols4-00037H-EH
	for alex.bennee@linaro.org; Mon, 04 Sep 2017 03:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dols0-00036f-1l
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 03:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dolrw-0001lo-PP
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 03:32:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26153)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dolrw-0001ks-Fj; Mon, 04 Sep 2017 03:32:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39CC8806A1;
	Mon,  4 Sep 2017 07:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 39CC8806A1
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D46387E235;
	Mon,  4 Sep 2017 07:32:25 +0000 (UTC)
Date: Mon, 4 Sep 2017 09:32:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20170904093224.62b43efb@nial.brq.redhat.com>
In-Reply-To: <241130c59df31aebaf4f23b5f151b6b5c91f36fa.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
	<241130c59df31aebaf4f23b5f151b6b5c91f36fa.1504293917.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Sep 2017 07:32:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/6] xlnx-zynqmp-pmu: Add the
 CPU and memory
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
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JDc/uOPZC1mZ

On Fri, 1 Sep 2017 14:00:37 -0700
Alistair Francis <alistair.francis@xilinx.com> wrote:

> Connect the MicroBlaze CPU and the ROM and RAM memory regions.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
>  hw/microblaze/xlnx-zynqmp-pmu.c | 65 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index fc3c8b236f..33584cfa4d 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -18,8 +18,11 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> +#include "exec/address-spaces.h"
>  #include "hw/boards.h"
> +#include "hw/qdev-properties.h"
>  #include "cpu.h"
> +#include "boot.h"
>  
>  /* Define the PMU device */
>  
> @@ -27,21 +30,51 @@
>  #define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
>                                            TYPE_XLNX_ZYNQMP_PMU)
>  
> +#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
> +#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
> +#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
> +
>  typedef struct XlnxZynqMPPMUState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
>      /*< public >*/
> +    MicroBlazeCPU cpu;
>  }  XlnxZynqMPPMUState;
>  
>  static void xlnx_zynqmp_pmu_init(Object *obj)
>  {
> +    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
>  
> +    object_initialize(&s->cpu, sizeof(s->cpu),
> +                      TYPE_MICROBLAZE_CPU);
> +    object_property_add_child(obj, "pmu-cpu[*]", OBJECT(&s->cpu),
                                              ^^^ why do you use this syntax here?

> +                              &error_abort);
>  }
>  
>  static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
>  {
> -
> +    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
> +
> +    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                             "base-vectors", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
> +                             &error_abort);
> +    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &error_fatal);
I'd replace error_fatal here with errp

>  }
>  
>  static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
> @@ -70,7 +103,35 @@ type_init(xlnx_zynqmp_pmu_register_types)
>  
>  static void xlnx_zcu102_pmu_init(MachineState *machine)
>  {
> -
> +    XlnxZynqMPPMUState *pmu = g_new0(XlnxZynqMPPMUState, 1);
> +    MemoryRegion *address_space_mem = get_system_memory();
> +    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
> +    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> +
> +    /* Create the ROM */
> +    memory_region_init_rom(pmu_rom, NULL, "xlnx-zcu102-pmu.rom",
> +                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
> +                                pmu_rom);
> +
> +    /* Create the RAM */
> +    memory_region_init_ram(pmu_ram, NULL, "xlnx-zcu102-pmu.ram",
> +                           machine->ram_size, &error_fatal);
> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                                pmu_ram);
> +
> +    /* Create the PMU device */
> +    object_initialize(pmu, sizeof(XlnxZynqMPPMUState), TYPE_XLNX_ZYNQMP_PMU);
> +    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
> +                              &error_abort);
> +    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
> +
> +    /* Load the kernel */
> +    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +                           machine->ram_size,
> +                           machine->kernel_filename,
> +                           machine->dtb,
> +                           NULL);
>  }
>  
>  static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)

