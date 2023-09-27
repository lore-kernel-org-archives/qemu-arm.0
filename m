Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1599804ejc;
        Tue, 26 Sep 2023 22:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECQo5d04uLGSh4ayWOTavPeu7RGTgZAMkJLa2nW7ozcQIrubE91ICbrKfEelxzFsQzxQhL
X-Received: by 2002:a17:906:9a:b0:9a2:28dc:4168 with SMTP id 26-20020a170906009a00b009a228dc4168mr677269ejc.61.1695791810512;
        Tue, 26 Sep 2023 22:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695791810; cv=none;
        d=google.com; s=arc-20160816;
        b=wg6uaMx/igN00bsPO5MS6P0ffJiXm30SkezIy/CDIn+zVeUslzw76bzWyR7nI5mNzW
         UBcBKkIIwu6uC2ueSIxJ2Cy9A29Zb6tcAjQjN475zRebq8b28iX6GsecozFbgJnARXmm
         8WLpu73yckv1JVCq/8EtWEc+hp/f4Lh27CgPkFfhyZxFG4fDGfftukjD2DDongxhbHXw
         wdi+iZQZz/uIDS2E9vRB3iRdrf7CIbY4ULck+i09QsY4tPZl8FGCQKuaQUqUP9urdgvS
         a3MEImKru1Tdh1q13KFMyotPkfNRBDcpd8kTLmXfH00rTJgdJyPQO6LKu0bOgYjmcgLt
         qCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T9gst6RwcXqh0Bu3NaQqSeNqWv5R+lCaxt8OMV4Jpc0=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=yFU2B0PfK/UhzZlJpQRw+/JDWJZkN2Xfe0AhxmBo70uqNQW9rz2wiBsEr0Wl+ZN3uN
         AWdip4zGCGwKB2I2R56gmBVPEAh3f8uFwPOslbnhtCegMafVT6q8lgULM139xgCFDyuU
         SHq4cSRtSIAfjJ3RBsdqo8QtXS3LB7k373qjkJoeDn97ksi3NKySKz5zKEZIGP9nxjse
         rf9qeptTzdMrmdzH0oPhO3HpkLFEX7te8D1fv5EaRALDqou9JiHEThFFfHQ9SnLOC6wy
         TPXT2O/2jHhmBpkyYPb5MFBKddX8xJpPFhm4SPbL06TMqOhr+z6oxND3sF+82BLa3NNl
         CjQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DAWLCFT4;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gj21-20020a170906e11500b009a1975a366csi12216030ejb.978.2023.09.26.22.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DAWLCFT4;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695791809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9gst6RwcXqh0Bu3NaQqSeNqWv5R+lCaxt8OMV4Jpc0=;
	b=DAWLCFT4IBy8U1WPiQiC/jT0pWdSTPRpzODMRNCL9FSedba0Fphkkw/FoaAo2TJRHNqdqA
	/Qzub9oz65jovAgmnYak07QyKwMIWdZ5zRkyHU2G4jL+8c4Tm5vQ3ysqEva2TMXEusZ1kh
	4/Km217uWOsFTg5dC8Ab6zMO0m8pr6U=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444--iKo9MPUPXG2RgUEPzJPFQ-1; Wed, 27 Sep 2023 01:16:47 -0400
X-MC-Unique: -iKo9MPUPXG2RgUEPzJPFQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-690c5242f89so11728031b3a.2
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 22:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695791806; x=1696396606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9gst6RwcXqh0Bu3NaQqSeNqWv5R+lCaxt8OMV4Jpc0=;
        b=Nhmk++l/79XTUiulIoc3vUF2SJFFoIt2gOvwbDfPMq3TsQX0f9lpZ4UkWHefi4703I
         41BethmxTbUtbhifi0xUediqODSftNEi6TXmu/3ImGfyg1t8Z0tpWYkLAAQIeEsWVgAA
         RL5uHGyFcQ31DpfHDVroE/M+NtLQe9u0jF0J0xb0e5Z7cl+bSuY0j+93z9mW2XCwm+NI
         EHGHzltTH4rZvikuBftgQXMU8oKgbTaBxAuZHIWzIGXxVolAsmSmc76qcpalBNnRheqK
         LRSJ07zIFnjicmlaeV+vYE04vjM7jqJzWGQ+KTNQokvJLWxerFIgOFoBHf7m+d5psG3X
         jvHg==
X-Gm-Message-State: AOJu0Yw7PUOtEM4zNYZhKoatJDgOJr1lrbMXS2M0UZVW6jDFFr6ZC5+0
	n6v85KFAPj70IndIH8aM0K8skT+9PfqhPnYYEMNerrzxpp7JxHneq+upjWbcoCCgVFEk0TVSNOO
	BJ/h0dNC3gRJ7EAk2
X-Received: by 2002:a05:6a00:1a13:b0:690:41a1:9b67 with SMTP id g19-20020a056a001a1300b0069041a19b67mr1144222pfv.9.1695791806015;
        Tue, 26 Sep 2023 22:16:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a13:b0:690:41a1:9b67 with SMTP id g19-20020a056a001a1300b0069041a19b67mr1144200pfv.9.1695791805652;
        Tue, 26 Sep 2023 22:16:45 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id x23-20020aa793b7000000b00690204b5a8csm11221897pff.12.2023.09.26.22.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 22:16:44 -0700 (PDT)
Message-ID: <c987543c-c05d-31cf-5cfa-e703d4b90d8f@redhat.com>
Date: Wed, 27 Sep 2023 15:16:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 03/37] hw/arm/virt: Move setting of common CPU
 properties in a function
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
 <20230926100436.28284-4-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9f1MwHkf8UKI

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Factor out CPU properties code common for {hot,cold}-plugged CPUs. This allows
> code reuse.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c         | 220 ++++++++++++++++++++++++++----------------
>   include/hw/arm/virt.h |   4 +
>   2 files changed, 140 insertions(+), 84 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 57fe97c242..0eb6bf5a18 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2018,16 +2018,130 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>       }
>   }
>   
> +static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,
> +                                    Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    VirtMachineState *vms = VIRT_MACHINE(ms);
> +    Error *local_err = NULL;
> +    VirtMachineClass *vmc;
> +
> +    vmc = VIRT_MACHINE_GET_CLASS(ms);
> +
> +    /* now, set the cpu object property values */
> +    numa_cpu_pre_plug(cpu_slot, DEVICE(cpuobj), &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    object_property_set_int(cpuobj, "mp-affinity", cpu_slot->arch_id, NULL);
> +
> +    if (!vms->secure) {
> +        object_property_set_bool(cpuobj, "has_el3", false, NULL);
> +    }
> +
> +    if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
> +        object_property_set_bool(cpuobj, "has_el2", false, NULL);
> +    }
> +
> +    if (vmc->kvm_no_adjvtime &&
> +        object_property_find(cpuobj, "kvm-no-adjvtime")) {
> +        object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
> +    }
> +
> +    if (vmc->no_kvm_steal_time &&
> +        object_property_find(cpuobj, "kvm-steal-time")) {
> +        object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
> +    }
> +
> +    if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
> +        object_property_set_bool(cpuobj, "pmu", false, NULL);
> +    }
> +
> +    if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
> +        object_property_set_bool(cpuobj, "lpa2", false, NULL);
> +    }
> +
> +    if (object_property_find(cpuobj, "reset-cbar")) {
> +        object_property_set_int(cpuobj, "reset-cbar",
> +                                vms->memmap[VIRT_CPUPERIPHS].base,
> +                                &local_err);
> +        if (local_err) {
> +            goto out;
> +        }
> +    }
> +
> +    /* link already initialized {secure,tag}-memory regions to this cpu */
> +    object_property_set_link(cpuobj, "memory", OBJECT(vms->sysmem), &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    if (vms->secure) {
> +        object_property_set_link(cpuobj, "secure-memory",
> +                                 OBJECT(vms->secure_sysmem), &local_err);
> +        if (local_err) {
> +            goto out;
> +        }
> +    }
> +
> +    if (vms->mte) {
> +        if (!object_property_find(cpuobj, "tag-memory")) {
> +            error_setg(&local_err, "MTE requested, but not supported "
> +                       "by the guest CPU");
> +            if (local_err) {
> +                goto out;
> +            }
> +        }
> +
> +        object_property_set_link(cpuobj, "tag-memory", OBJECT(vms->tag_sysmem),
> +                                 &local_err);
> +        if (local_err) {
> +            goto out;
> +        }
> +
> +        if (vms->secure) {
> +            object_property_set_link(cpuobj, "secure-tag-memory",
> +                                     OBJECT(vms->secure_tag_sysmem),
> +                                     &local_err);
> +            if (local_err) {
> +                goto out;
> +            }
> +        }
> +    }
> +
> +    /*
> +     * RFC: Question: this must only be called for the hotplugged cpus. For the
> +     * cold booted secondary cpus this is being taken care in arm_load_kernel()
> +     * in boot.c. Perhaps we should remove that code now?
> +     */
> +    if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
> +        object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
> +                                NULL);
> +
> +        /* Secondary CPUs start in PSCI powered-down state */
> +        if (CPU(cpuobj)->cpu_index > 0) {
> +            object_property_set_bool(cpuobj, "start-powered-off", true, NULL);
> +        }
> +    }
> +
> +out:
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +    }
> +    return;
        ^^^^^^

It's not needed obviously :)

> +}
> +
>   static void machvirt_init(MachineState *machine)
>   {
>       VirtMachineState *vms = VIRT_MACHINE(machine);
>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>       const CPUArchIdList *possible_cpus;
> -    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *secure_tag_sysmem = NULL;
>       MemoryRegion *secure_sysmem = NULL;
>       MemoryRegion *tag_sysmem = NULL;
> -    MemoryRegion *secure_tag_sysmem = NULL;
> +    MemoryRegion *sysmem;
>       int n, virt_max_cpus;
>       bool firmware_loaded;
>       bool aarch64 = true;
> @@ -2071,6 +2185,8 @@ static void machvirt_init(MachineState *machine)
>        */
>       finalize_gic_version(vms);
>   
> +    sysmem = vms->sysmem = get_system_memory();
> +
>       if (vms->secure) {
>           /*
>            * The Secure view of the world is the same as the NonSecure,
> @@ -2078,7 +2194,7 @@ static void machvirt_init(MachineState *machine)
>            * containing the system memory at low priority; any secure-only
>            * devices go in at higher priority and take precedence.
>            */
> -        secure_sysmem = g_new(MemoryRegion, 1);
> +        secure_sysmem = vms->secure_sysmem = g_new(MemoryRegion, 1);
>           memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
>                              UINT64_MAX);
>           memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
> @@ -2151,6 +2267,23 @@ static void machvirt_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    if (vms->mte) {
> +        /* Create the memory region only once, but link to all cpus later */
> +        tag_sysmem = vms->tag_sysmem = g_new(MemoryRegion, 1);
> +        memory_region_init(tag_sysmem, OBJECT(machine),
> +                           "tag-memory", UINT64_MAX / 32);
> +
> +        if (vms->secure) {
> +            secure_tag_sysmem = vms->secure_tag_sysmem = g_new(MemoryRegion, 1);
> +            memory_region_init(secure_tag_sysmem, OBJECT(machine),
> +                               "secure-tag-memory", UINT64_MAX / 32);
> +
> +            /* As with ram, secure-tag takes precedence over tag.  */
> +            memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
> +                                                tag_sysmem, -1);
> +        }
> +    }
> +
>       create_fdt(vms);
>   
>       assert(possible_cpus->len == max_cpus);
> @@ -2163,15 +2296,10 @@ static void machvirt_init(MachineState *machine)
>           }
>   
>           cpuobj = object_new(possible_cpus->cpus[n].type);
> -        object_property_set_int(cpuobj, "mp-affinity",
> -                                possible_cpus->cpus[n].arch_id, NULL);
>   
>           cs = CPU(cpuobj);
>           cs->cpu_index = n;
>   
> -        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
> -                          &error_fatal);
> -
>           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
>           object_property_set_int(cpuobj, "socket-id",
>                                   virt_get_socket_id(machine, n), NULL);
> @@ -2182,82 +2310,6 @@ static void machvirt_init(MachineState *machine)
>           object_property_set_int(cpuobj, "thread-id",
>                                   virt_get_thread_id(machine, n), NULL);
>   
> -        if (!vms->secure) {
> -            object_property_set_bool(cpuobj, "has_el3", false, NULL);
> -        }
> -
> -        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
> -            object_property_set_bool(cpuobj, "has_el2", false, NULL);
> -        }
> -
> -        if (vmc->kvm_no_adjvtime &&
> -            object_property_find(cpuobj, "kvm-no-adjvtime")) {
> -            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
> -        }
> -
> -        if (vmc->no_kvm_steal_time &&
> -            object_property_find(cpuobj, "kvm-steal-time")) {
> -            object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
> -        }
> -
> -        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
> -            object_property_set_bool(cpuobj, "pmu", false, NULL);
> -        }
> -
> -        if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
> -            object_property_set_bool(cpuobj, "lpa2", false, NULL);
> -        }
> -
> -        if (object_property_find(cpuobj, "reset-cbar")) {
> -            object_property_set_int(cpuobj, "reset-cbar",
> -                                    vms->memmap[VIRT_CPUPERIPHS].base,
> -                                    &error_abort);
> -        }
> -
> -        object_property_set_link(cpuobj, "memory", OBJECT(sysmem),
> -                                 &error_abort);
> -        if (vms->secure) {
> -            object_property_set_link(cpuobj, "secure-memory",
> -                                     OBJECT(secure_sysmem), &error_abort);
> -        }
> -
> -        if (vms->mte) {
> -            /* Create the memory region only once, but link to all cpus. */
> -            if (!tag_sysmem) {
> -                /*
> -                 * The property exists only if MemTag is supported.
> -                 * If it is, we must allocate the ram to back that up.
> -                 */
> -                if (!object_property_find(cpuobj, "tag-memory")) {
> -                    error_report("MTE requested, but not supported "
> -                                 "by the guest CPU");
> -                    exit(1);
> -                }
> -
> -                tag_sysmem = g_new(MemoryRegion, 1);
> -                memory_region_init(tag_sysmem, OBJECT(machine),
> -                                   "tag-memory", UINT64_MAX / 32);
> -
> -                if (vms->secure) {
> -                    secure_tag_sysmem = g_new(MemoryRegion, 1);
> -                    memory_region_init(secure_tag_sysmem, OBJECT(machine),
> -                                       "secure-tag-memory", UINT64_MAX / 32);
> -
> -                    /* As with ram, secure-tag takes precedence over tag.  */
> -                    memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
> -                                                        tag_sysmem, -1);
> -                }
> -            }
> -
> -            object_property_set_link(cpuobj, "tag-memory", OBJECT(tag_sysmem),
> -                                     &error_abort);
> -            if (vms->secure) {
> -                object_property_set_link(cpuobj, "secure-tag-memory",
> -                                         OBJECT(secure_tag_sysmem),
> -                                         &error_abort);
> -            }
> -        }
> -
>           qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
>           object_unref(cpuobj);
>       }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index e1ddbea96b..13163adb07 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -148,6 +148,10 @@ struct VirtMachineState {
>       DeviceState *platform_bus_dev;
>       FWCfgState *fw_cfg;
>       PFlashCFI01 *flash[2];
> +    MemoryRegion *sysmem;
> +    MemoryRegion *secure_sysmem;
> +    MemoryRegion *tag_sysmem;
> +    MemoryRegion *secure_tag_sysmem;
>       bool secure;
>       bool highmem;
>       bool highmem_compact;

Thanks,
Gavin
