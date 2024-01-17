Received: by 2002:a17:906:cd06:b0:a2e:1324:ea5c with SMTP id oz6csp24602ejb;
        Wed, 17 Jan 2024 13:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa7NKH9OeprmbmEwvBqoVBDU3P3tnHUMVg9EuFUfLh/Ab0abimh6GIvRbH84/1zr524lZ4
X-Received: by 2002:a05:600c:31a9:b0:40e:5a80:6177 with SMTP id s41-20020a05600c31a900b0040e5a806177mr4759698wmp.69.1705527974139;
        Wed, 17 Jan 2024 13:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705527974; cv=none;
        d=google.com; s=arc-20160816;
        b=yFiBiT3PG7UIPEliNh6kCI1O/qDaymlFbNEopuXDeqGS2FGSZukeQsCN/SJ2+TobIh
         iDc0wkHujad+s9z7HyKzO6uDFPsVKwykR5SyqvNdGUdT8FE2Tz/szqHdJVTjImgLy6GK
         +1tMUyEKaoKBiBG1xmVaqNNXXExVai6d+aYH01L/iSNFow4XpFsSxI8NvlWqClGvuYdd
         r3LYVEJb2snWsatnltjUu3oNGAvzAzGwK9AJvXAtxfti0J0Bm0bh8mhFbTQrPPiFq83W
         Yksh0Pq/iWyI3oyQBYaL8KyGrYWTRxmQsSgTKg4lxmbwZhSwK6UmmOy23GD01ITmXaeg
         evnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=S4QiS8kHF64ziopB+qlWeOlegZro8Dnas4Xn8CqGa50=;
        fh=fml60s1Gm2l4HdzJqyaca6OMt3sjJvy33LKgv0VhBYs=;
        b=smjnOzbSLFtodNuoCBAoqvfaMTyaHnC08dJ8c1mAQarSOn5tVwYIezduwllynsB8Yi
         /Tu6PJ2yPmGeai+8DeR4VRhV8CZEp/biZsVFB5ItH4yistQpzAJeWlmUnYiGDbhX4w8A
         RA3k3gZQDKPcFg2womURcmU7uOUc2l6TOtqgglPMiMd321vt+OIwacW1hLgWO/AP0PNV
         fjUV4fV3cDUereU9QAPmstu9BCHFTl5kx169tglQJdYEQ7KCIod1MlMtnuLSmW/FqlcH
         RnkZaMHSn0aDpVGJ2UCGKVXhBJKa3lVUhq7fW+Pn9MVYL6ZG6UBl6ZVQpmuN7wfWilD+
         PrxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id h11-20020adfa4cb000000b003374dcaa1e3si1336232wrb.346.2024.01.17.13.46.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jan 2024 13:46:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TFfXH5MNVz6K5Xl;
	Thu, 18 Jan 2024 05:43:59 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D3934140519;
	Thu, 18 Jan 2024 05:46:12 +0800 (CST)
Received: from localhost (10.48.153.213) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Jan
 2024 21:46:11 +0000
Date: Wed, 17 Jan 2024 21:46:08 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta via <qemu-devel@nongnu.org>
CC: Salil Mehta <salil.mehta@huawei.com>, <qemu-arm@nongnu.org>,
	<maz@kernel.org>, <jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: Re: [PATCH RFC V2 19/37] hw/acpi: ACPI/AML Changes to reflect the
 correct _STA.{PRES, ENA} Bits to Guest
Message-ID: <20240117214608.00007d1b@Huawei.com>
In-Reply-To: <20230926100436.28284-20-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
	<20230926100436.28284-20-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.153.213]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: dxciUR4MsR58

On Tue, 26 Sep 2023 11:04:18 +0100
Salil Mehta via <qemu-devel@nongnu.org> wrote:

> ACPI AML changes to properly reflect the _STA.PRES and _STA.ENA Bits to the
> guest during initialzation, when CPUs are hotplugged and after CPUs are
> hot-unplugged.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Hi Salil,

Just brought up a qemu on qemu test setup again to poke
the kernel series and hopefully resolve a few questions there.
Ran into a trivial problem in which the kernel was trying and
failing to attach an ACPI handler before these were hotplugged.
Came down to the kernel code now treating functional in _STA as
meaning can be enumerated and effectively
ignoring all the other bits.

Requires a change to the value presented by default...
See below.  Fix may well be completely wrong even though it works ;)

Thanks,

Jonathan

> ---
>  hw/acpi/cpu.c                  | 49 +++++++++++++++++++++++++++++++---
>  hw/acpi/generic_event_device.c | 11 ++++++++
>  include/hw/acpi/cpu.h          |  2 ++
>  3 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 232720992d..e1299696d3 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>      cdev = &cpu_st->devs[cpu_st->selector];
>      switch (addr) {
>      case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
> -        val |= cdev->cpu ? 1 : 0;
> +        val |= cdev->is_enabled ? 1 : 0;
>          val |= cdev->is_inserting ? 2 : 0;
>          val |= cdev->is_removing  ? 4 : 0;
>          val |= cdev->fw_remove  ? 16 : 0;
> +        val |= cdev->is_present ? 32 : 0;
>          trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>          break;
>      case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -228,7 +229,21 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>          struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
>          if (qemu_present_cpu(cpu)) {
>              state->devs[i].cpu = cpu;
> +            state->devs[i].is_present = true;
> +        } else {
> +            if (qemu_persistent_cpu(cpu)) {
> +                state->devs[i].is_present = true;
> +            } else {
> +                state->devs[i].is_present = false;
> +            }
>          }
> +
> +        if (qemu_enabled_cpu(cpu)) {
> +            state->devs[i].is_enabled = true;
> +        } else {
> +            state->devs[i].is_enabled = false;
> +        }
> +
>          state->devs[i].arch_id = id_list->cpus[i].arch_id;
>      }
>      memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
> @@ -261,6 +276,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  
>      cdev->cpu = CPU(dev);
> +    cdev->is_present = true;
> +    cdev->is_enabled = true;
>      if (dev->hotplugged) {
>          cdev->is_inserting = true;
>          acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
> @@ -292,6 +309,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
>          return;
>      }
>  
> +    cdev->is_enabled = false;
> +    if (!qemu_persistent_cpu(CPU(dev))) {
> +        cdev->is_present = false;
> +    }
> +
>      cdev->cpu = NULL;
>  }
>  
> @@ -302,6 +324,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
>      .fields      = (VMStateField[]) {
>          VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
>          VMSTATE_BOOL(is_removing, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_present, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
>          VMSTATE_UINT32(ost_event, AcpiCpuStatus),
>          VMSTATE_UINT32(ost_status, AcpiCpuStatus),
>          VMSTATE_END_OF_LIST()
> @@ -339,6 +363,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_REMOVE_EVENT  "CRMV"
>  #define CPU_EJECT_EVENT   "CEJ0"
>  #define CPU_FW_EJECT_EVENT "CEJF"
> +#define CPU_PRESENT       "CPRS"
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                      hwaddr base_addr,
> @@ -399,7 +424,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>          /* tell firmware to do device eject, write only */
>          aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(3));
> +        /* 1 if present, read only */
> +        aml_append(field, aml_named_field(CPU_PRESENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>          aml_append(field, aml_named_field(CPU_COMMAND, 8));
>          aml_append(cpu_ctrl_dev, field);
>  
> @@ -429,6 +456,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
>          Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
>          Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
> +        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
>          Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
>          Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
>          Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
> @@ -457,13 +485,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          {
>              Aml *idx = aml_arg(0);
>              Aml *sta = aml_local(0);
> +            Aml *ifctx2;
> +            Aml *else_ctx;
>  
>              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>              aml_append(method, aml_store(idx, cpu_selector));
>              aml_append(method, aml_store(zero, sta));
> -            ifctx = aml_if(aml_equal(is_enabled, one));
> +            ifctx = aml_if(aml_equal(is_present, one));
>              {
> -                aml_append(ifctx, aml_store(aml_int(0xF), sta));
> +                ifctx2 = aml_if(aml_equal(is_enabled, one));
> +                {
> +                    /* cpu is present and enabled */
> +                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
> +                }
> +                aml_append(ifctx, ifctx2);
> +                else_ctx = aml_else();
> +                {
> +                    /* cpu is present but disabled */
> +                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
For the current kernel patches, functional should not be set. So this should
be something like 0x5.

> +                }
> +                aml_append(ifctx, else_ctx);
>              }
>              aml_append(method, ifctx);
>              aml_append(method, aml_release(ctrl_lock));
