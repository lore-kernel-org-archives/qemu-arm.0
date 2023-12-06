Received: by 2002:a05:7022:4195:b0:70:a3b7:dfe7 with SMTP id i21csp2997550dli;
        Wed, 6 Dec 2023 08:56:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQtTZjfrXLQMLVdX+2ALdFRiWvWzeQS03kImVu/0yOrQMioHZJs1mojp3ZAbXZ+k6ls5eD
X-Received: by 2002:a05:6870:7a18:b0:1fa:ef56:70e9 with SMTP id hf24-20020a0568707a1800b001faef5670e9mr1310647oab.26.1701881810071;
        Wed, 06 Dec 2023 08:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701881810; cv=none;
        d=google.com; s=arc-20160816;
        b=fv21zYPzER0mJy16nJ4eU5kKmENdNDf0H3mzH5DStZ5bawjGux0X+0iNh7eCg9EHBr
         V6Frb4V/dEXKwLEXQCikNXqxPUdPbs54MPqsn2p1dKFn/djPTVpBRrI8rmQjeAAGWc0j
         //drEoGrmb2+4N1ZnrnGFaNfwxpjw8t06TVxORM+3PWdPlP3T8Jfq33qtZ7qVQqNoTQw
         PDkWGjXPvErq/b29hPH1ObCB/I2789sGLvC8HJ/zjCQyB82ZmRTNqIWYa1OIFOxndfUD
         cpd2OboI/Dooo2xlDc9pgIwFWXrCInvxVca7ZuLGga6nB09fPOzPd/X170hEpCf9hSFi
         ECUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0XpGf3XU2uzIbfwuzx3Kh1lAURm8G/x83dw3KBm3PcU=;
        fh=nHXCxAu9yzvsZfHVth69sEU95KCk0t//YoILpnfCoG4=;
        b=B0nn7z3PsYSWvks+pKLzwDsqFY3tM6oJWIwOlb81wVq+gmKYS5kh2DXvkcFSvNLbKW
         o78O66V+d4FAbG3kjDAdHcTwmkHicuRU3QmdZ25zXt/yPzMkmhEEYdgjkqeXvoI29Qds
         B9ncT0iwmjRxeoeBPAX6o6TubRFfNMSimb0sxahqQMOoaLihX5S6YcsjSEk0v/ArvV8E
         WX7x0kD2VzMHnTfVZaY6k80Qlm21itIQlPxBvJNekcKJOVg5nhQg1OuHQJ/aIrBPF7KK
         miLHX0Ei10v6avHNdWo7vhX5lkRaNSEPL/c0v4rZsbyB1VXw7laDpmuKp1iEVHYvbVW/
         5dMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YF5gQuHB;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.93 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.93])
        by mx.google.com with ESMTPS id d3-20020a0ce703000000b0067a9779cc1fsi282416qvn.366.2023.12.06.08.56.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.93 as permitted sender) client-ip=192.55.52.93;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YF5gQuHB;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.93 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701881809; x=1733417809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKRjgHaEJWXCNvOaNv7NW1iG2Gx8MCRVSiENZF8b5oI=;
  b=YF5gQuHBsIi1JfIfUPjPLCjszRgLNfyN645gvkN5yUxN0wcRVeCi3TpU
   3OEn/IsGBY2zFjl1/CSKOsdae1vGgtqtcyO8J50nIx/Bsgq23ZpFA0L7U
   wUW5gBWMWjYxx3lwlOTQoLz+PUDjF6uGgp9jzyeeVsxJnQzQmAPTqEDXH
   BOG+btVZRV4rUTdCXQLKIMJhE6oMjqnfLOBdGwumSHUNYEE0ECP6JJ4WD
   jr9R2pwU4zHpVA7SCkNSziCqnUwauDkwB27MLdDJVNw+/3ELE7YgQMgwF
   vI5XDp9rHxGRptiQg7zcf5j+yggH2/ykG8TptyBfuJpHqLnzCN3oxaw4y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391259272"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="391259272"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 08:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018628339"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1018628339"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 08:56:35 -0800
Date: Thu, 7 Dec 2023 01:08:55 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	mst@redhat.com, will@kernel.org, gshan@redhat.com,
	rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, linuxarm@huawei.com
Subject: Re: [PATCH V7 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <ZXCqp32ggIFvUweu@intel.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
 <20231113201236.30668-4-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113201236.30668-4-salil.mehta@huawei.com>
X-TUID: ZPNEBL9PqjXB

Hi Salil,

On Mon, Nov 13, 2023 at 08:12:31PM +0000, Salil Mehta via wrote:
> Date: Mon, 13 Nov 2023 20:12:31 +0000
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH V7 3/8] hw/acpi: Update ACPI GED framework to support vCPU
>  Hotplug
> X-Mailer: git-send-email 2.8.3
> 

[snip]

> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);

I find this cpu_hotplug_hw_init() can still cause qtest errors on x86
platforms as you mentioned in v6: https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-820f4a254607@opnsrc.net/T/#m108f102b2fe92b7dd7218f2f942f7b233a9d6af3

IIUC, microvm machine has its own 'possible_cpus_arch_ids' and that is
inherited from its parent x86 machine.

The above error is because device-introspect-test sets the none-machine:

# starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-3094820.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-3094820.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -nodefaults -machine none -accel qtest

So what about just checking mc->possible_cpu_arch_ids instead of an
assert in cpu_hotplug_hw_init()?

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4b24a2500361..303f1f1f57bc 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -221,7 +221,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     const CPUArchIdList *id_list;
     int i;

-    assert(mc->possible_cpu_arch_ids);
+    if (!mc->possible_cpu_arch_ids) {
+        return;
+    }
+
     id_list = mc->possible_cpu_arch_ids(machine);
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);

This check seems to be acceptable in the general code path? Not all machines
have possible_cpu_arch_ids, after all.

Thanks,
Zhao

>  }
>  
>  static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ba84ce0214..90fc41cbb8 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -60,6 +60,7 @@
>  #define HW_ACPI_GENERIC_EVENT_DEVICE_H
>  
>  #include "hw/sysbus.h"
> +#include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/ghes.h"
>  #include "qom/object.h"
> @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> @@ -106,6 +108,8 @@ struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
> -- 
> 2.34.1
> 
> 
