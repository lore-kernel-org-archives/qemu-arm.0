Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2891944ejc;
        Thu, 28 Sep 2023 16:34:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNS+Dk6uDGWWYYqNafVtDnYJp4PrdDHVWkqiRiiivMKy6Ip1S01qLg+NJTPteuqiebGgE5
X-Received: by 2002:a19:6756:0:b0:4fa:da4f:636f with SMTP id e22-20020a196756000000b004fada4f636fmr2034968lfj.32.1695944052331;
        Thu, 28 Sep 2023 16:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695944052; cv=none;
        d=google.com; s=arc-20160816;
        b=lYsyZAqVeRr0fM6kGnGuj2Spm0H0DUkXCnXwmLuv1RfFTm/92gpTZUwGxlCiPpPYPo
         cX3K5vHiC8/lPy6VVxV0Dsbq2Wdg4skJz7Yz5xsKMABe0FPjhMR0rcW/FekobweCPMRx
         BfDu1pT/jPlInxpDDIdPd+r6AdnZSWEPeDcOJlcoL35pzDnxdM83hT107PsZLyDygWlB
         IUurdBvcgC5I4TuCtG0a8/fYjUkjmHgGLkrP2AA9zE6gNNhOhacDHiDezcqeDCF9PN+x
         8CtXExBLDcC9WthTqHpPS2WO3GdaGz/19p1GXbk94NANSK8gO+o0y0ZtPT8LcaejNI12
         bcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IyB3XhNBWFH99+8p7dXiNnDLYytBKkMjAr/ZP18O6rY=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=DQX/JeBgsfbm9foTw+/jCoJxd6TcN1bVX2x9yCMfNF0TINtH8KjMVvptMd82TvHqCv
         PioasYuTdTs+jPaeTGnVXpz+cQLOtPmZTGZPqZi5/OLhXF8MjsfgXweJdJteTVb2RECL
         79Vg8ozgVTD/AJSwYy6Ztz2jAGmgsrOSeeJzwmJcLMJ3FPSGBLVX+VpfQJwGuEKkNnih
         oFlTF975Sgm52pFchVCgjZZrd05QEaQ8Oegl4jMqq+itPl03kgHSIbEASerX6+hbYH4m
         G/uIZzSo18/IEpRX+xTTTJw+/ZuyTNEK5dwUwww1fn9s56XVtG68jFzMwAb0jyl6oAlp
         Ghxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnRsini4;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id eo7-20020a056512480700b005041335fa3csi7089410lfb.505.2023.09.28.16.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnRsini4;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695944047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IyB3XhNBWFH99+8p7dXiNnDLYytBKkMjAr/ZP18O6rY=;
	b=DnRsini4YDhE2rhjgKuKU9qJzR+bHN0u3cg+wb9TNLYBJU7ZzIlj6FHQyJ3aNB1ecMxK8G
	a3NlUZtYOM8OsP0OwNkFkRvXvJMpAGxediAT6pz/VRn7iTWcdstPuLx6vL1vlox5doRpkV
	J4SSZLp4uMU70awhAGV2a/hM4f4Zyj4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-UE9JCC1SOGy4UPMRB1iaEg-1; Thu, 28 Sep 2023 19:34:05 -0400
X-MC-Unique: UE9JCC1SOGy4UPMRB1iaEg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-27763f1abc8so8738792a91.3
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944044; x=1696548844;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyB3XhNBWFH99+8p7dXiNnDLYytBKkMjAr/ZP18O6rY=;
        b=tliCP3ZEzCiVKRDVBcp0cwypgXEuNmCOjka97kh2H5os1b4lv4rNDxwEnWbn1gBMa8
         C3OmjSUKXuQ/dvGLNn22TB9dejn8+xZ3lc8pWKhDWHiCUSVNW732jWSq6CkH2B65i9j7
         acZi/Wc5KqPpC0PCun9VLPfgqPqm2rtNU8ZWY9T+WfrxKbP8JXIrbL45HbSdzgtnAU5s
         zjhmkkq0iw0AykXtWmBsKNFxrXrRZ3y5U+KyOqwNbb6Cper0Ysmn87gIQ2FaIbYLgJUP
         Pa6+ZU3Oo6P3O0S7m1/4ELyttKeONIbm7SsZTatYav5QAY5KuNXHXgDSct83+zHoc8ja
         kNtQ==
X-Gm-Message-State: AOJu0YxjAGgNWpqSNaDGoZ9nFRve35PcY/YT+xOLtIexmHnYSIhv+56d
	lsGMpymw+QoImnfrmL4mWxOSQcKoXbpQMFjA2Mt5Lm5O3+XO6mr6U1n00EBxVg3kT18KZIXJEAy
	1PCGHB7hZulCOu3Eg
X-Received: by 2002:a17:90a:f691:b0:26b:2538:d717 with SMTP id cl17-20020a17090af69100b0026b2538d717mr2613955pjb.25.1695944044050;
        Thu, 28 Sep 2023 16:34:04 -0700 (PDT)
X-Received: by 2002:a17:90a:f691:b0:26b:2538:d717 with SMTP id cl17-20020a17090af69100b0026b2538d717mr2613920pjb.25.1695944043704;
        Thu, 28 Sep 2023 16:34:03 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id gw9-20020a17090b0a4900b00267ee71f463sm1073056pjb.0.2023.09.28.16.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:34:03 -0700 (PDT)
Message-ID: <da5e5609-1883-8650-c7d8-6868c7b74f1c@redhat.com>
Date: Fri, 29 Sep 2023 09:33:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 19/37] hw/acpi: ACPI/AML Changes to reflect the
 correct _STA.{PRES,ENA} Bits to Guest
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-20-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-20-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: I73hg22nIQqm

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI AML changes to properly reflect the _STA.PRES and _STA.ENA Bits to the
> guest during initialzation, when CPUs are hotplugged and after CPUs are
> hot-unplugged.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c                  | 49 +++++++++++++++++++++++++++++++---
>   hw/acpi/generic_event_device.c | 11 ++++++++
>   include/hw/acpi/cpu.h          |  2 ++
>   3 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 232720992d..e1299696d3 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>       cdev = &cpu_st->devs[cpu_st->selector];
>       switch (addr) {
>       case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
> -        val |= cdev->cpu ? 1 : 0;
> +        val |= cdev->is_enabled ? 1 : 0;
>           val |= cdev->is_inserting ? 2 : 0;
>           val |= cdev->is_removing  ? 4 : 0;
>           val |= cdev->fw_remove  ? 16 : 0;
> +        val |= cdev->is_present ? 32 : 0;
>           trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>           break;

The vCPU states are synchronized to what we had. It means we're maintaining two set
vCPU states, one for board level and another set for vCPU hotplug here. They look
duplicate to each other. However, it will need too much code changes to combine
them.

>       case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -228,7 +229,21 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>           struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
>           if (qemu_present_cpu(cpu)) {
>               state->devs[i].cpu = cpu;
> +            state->devs[i].is_present = true;
> +        } else {
> +            if (qemu_persistent_cpu(cpu)) {
> +                state->devs[i].is_present = true;
> +            } else {
> +                state->devs[i].is_present = false;
> +            }
>           }

state->devs[i].is_present = qemu_persistent_cpu(cpu);

> +
> +        if (qemu_enabled_cpu(cpu)) {
> +            state->devs[i].is_enabled = true;
> +        } else {
> +            state->devs[i].is_enabled = false;
> +        }
> +

state->dev[i].is_enabled = qemu_enabled_cpu(cpu);

>           state->devs[i].arch_id = id_list->cpus[i].arch_id;
>       }
>       memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
> @@ -261,6 +276,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>       }
>   
>       cdev->cpu = CPU(dev);
> +    cdev->is_present = true;
> +    cdev->is_enabled = true;
>       if (dev->hotplugged) {
>           cdev->is_inserting = true;
>           acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
> @@ -292,6 +309,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
>           return;
>       }
>   
> +    cdev->is_enabled = false;
> +    if (!qemu_persistent_cpu(CPU(dev))) {
> +        cdev->is_present = false;
> +    }
> +
>       cdev->cpu = NULL;
>   }
>   
> @@ -302,6 +324,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
>       .fields      = (VMStateField[]) {
>           VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
>           VMSTATE_BOOL(is_removing, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_present, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
>           VMSTATE_UINT32(ost_event, AcpiCpuStatus),
>           VMSTATE_UINT32(ost_status, AcpiCpuStatus),
>           VMSTATE_END_OF_LIST()
> @@ -339,6 +363,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>   #define CPU_REMOVE_EVENT  "CRMV"
>   #define CPU_EJECT_EVENT   "CEJ0"
>   #define CPU_FW_EJECT_EVENT "CEJF"
> +#define CPU_PRESENT       "CPRS"
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                       hwaddr base_addr,
> @@ -399,7 +424,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>           /* tell firmware to do device eject, write only */
>           aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(3));
> +        /* 1 if present, read only */
> +        aml_append(field, aml_named_field(CPU_PRESENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>           aml_append(field, aml_named_field(CPU_COMMAND, 8));
>           aml_append(cpu_ctrl_dev, field);
>   
> @@ -429,6 +456,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
>           Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
>           Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
> +        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
>           Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
>           Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
>           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
> @@ -457,13 +485,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           {
>               Aml *idx = aml_arg(0);
>               Aml *sta = aml_local(0);
> +            Aml *ifctx2;
> +            Aml *else_ctx;
>   
>               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>               aml_append(method, aml_store(idx, cpu_selector));
>               aml_append(method, aml_store(zero, sta));
> -            ifctx = aml_if(aml_equal(is_enabled, one));
> +            ifctx = aml_if(aml_equal(is_present, one));
>               {
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
> +                }
> +                aml_append(ifctx, else_ctx);
>               }
>               aml_append(method, ifctx);
>               aml_append(method, aml_release(ctrl_lock));
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index d2fa1d0e4a..b84602b238 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -319,6 +319,16 @@ static const VMStateDescription vmstate_memhp_state = {
>       }
>   };
>   
> +static const VMStateDescription vmstate_cpuhp_state = {
> +    .name = "acpi-ged/cpuhp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_CPU_HOTPLUG(cpuhp_state, AcpiGedState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static const VMStateDescription vmstate_ged_state = {
>       .name = "acpi-ged-state",
>       .version_id = 1,
> @@ -367,6 +377,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>       },
>       .subsections = (const VMStateDescription * []) {
>           &vmstate_memhp_state,
> +        &vmstate_cpuhp_state,
>           &vmstate_ghes_state,
>           NULL
>       }
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index b87ebfdf4b..786a30d6d4 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -22,6 +22,8 @@ typedef struct AcpiCpuStatus {
>       uint64_t arch_id;
>       bool is_inserting;
>       bool is_removing;
> +    bool is_present;
> +    bool is_enabled;
>       bool fw_remove;
>       uint32_t ost_event;
>       uint32_t ost_status;

Thanks,
Gavin
