Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp275549ejb;
        Mon, 9 Oct 2023 23:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlDfOVQLFT9uFiA614eom+7A0D0eAq763vjwZ5OmPHqAeWwZ0NhnAXgKpNbSHw8uGClXwf
X-Received: by 2002:a67:fe94:0:b0:452:dae8:df05 with SMTP id b20-20020a67fe94000000b00452dae8df05mr16849151vsr.9.1696920417983;
        Mon, 09 Oct 2023 23:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696920417; cv=none;
        d=google.com; s=arc-20160816;
        b=n9SogjLDZ44Sm6N0F2HFKe8Tfg9nmgU2hxWK55AOMePYvjaxnNgQ+FL3/tF0A5frar
         1SQgMRIAIT6xIuzMxEwJQ6H4iqs/gjxmbrY4ffI13FXm5vqxcOnCv6GWnfe1r2Gx0Y0l
         aY1N1uMTSdZzZX9xMECupAwrWR0Cz9V3J7dkkLgrsuSuzXLHz3TrCdyrBNgJYgY1YFIR
         tGFHT1/WzsxjlkFNldCB7mJO/kpry5unB5GFlbsRpkiy/tWy67JG1UM9awuww59Xt7CA
         96ohWd2PzcUTVNoFLqj8z/giAdgDr2DOjcoGvZex31IlJlKTBLEeCpHXay7rJlcrrCYd
         Mn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tSEF2R7FcrUdJ1Ey0+Y2ay8NczyGf+w6MNePPZbfwA8=;
        fh=+vtg+gEXqlE0J9WYfrU6i+RPcQlqu509lDEs4JwdiQg=;
        b=sO9yQIzDX7MjuAJKZ1D/VbPjTzG7REQ41hD2TlSwbcBHLYgRaig1QUyHkyqTLuQiqu
         SrnncjMCJebidZ2T7aBqyg+FXO0iue3yDzCOvd4Av0BKQw6DPhvzcOsF8fVRfKk8uQp+
         0DPNHKeEpPh0he0Z2rJbaAxcp7uYPUsuaom9VuyRdHUp5PiK217qYZxSPFqaDDTj8ZHE
         AgpZo3TWhtYhFSb/o3mvioqC7VG8efUSf1vq/CX2KpVpgxF/Mj32RV+8KSSwCdndciMY
         N24aMnuz+uzoOHCG1ryzI2TitMtKg5/LidCOpDuNnGhgn1Z1W+QR1k09hbbiFkJ69zNV
         xvnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=am4CDBzT;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j12-20020a0c9ccc000000b00646f2d31709si6964770qvf.178.2023.10.09.23.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 23:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=am4CDBzT;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696920417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSEF2R7FcrUdJ1Ey0+Y2ay8NczyGf+w6MNePPZbfwA8=;
	b=am4CDBzTYzvQuU9RhoVoc15uaoAti0CkCMNIqMiyGWEMxuG4lvY9bwvCaD35Fhn9FO1CMV
	1ZpKUlDAIU/jGCjcWBcYF/FVRgA/f89VtMVOLNBN7wFlqICog9cipc5PbCr8QeW5gm6zxc
	LE86KxAmOSZ0V3ST/QH7T6Gp2zVB8ew=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Fx0nBsrzNmqC9ck4WTrG9A-1; Tue, 10 Oct 2023 02:46:56 -0400
X-MC-Unique: Fx0nBsrzNmqC9ck4WTrG9A-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-279368235c4so2016796a91.0
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 23:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696920415; x=1697525215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSEF2R7FcrUdJ1Ey0+Y2ay8NczyGf+w6MNePPZbfwA8=;
        b=ECRP9xTLn8OtxGemcvEIaS8TCUyvuk7cydJVwTiy+sIjuqIHt5fvZsNKsgotBZ4lfI
         S1eWsz1wz51d8Jc5d4TqLfmjHmoOYC2dFQflQqq/N/kL+E7oy0JNf3FbwjzBFT3P8J40
         1EHGw6S1/JQjXZoZ5GCR2PyDXBcJz3kyXUVJGu4WlHk8M9GfM7CFstpnNwBBbbrNHzHp
         HRNRrHh4504NSzcduellcsmISwbUwc5b2YM2qY1Bcmn7pJuEL5PdY3M70qyIYIvYT3yc
         UlW/qyKPW3c0u1856HypA/y51kPYg+pGpCTJccMG5fjg8JYSXsfunf4qWZILaB56j7Oj
         m0Ig==
X-Gm-Message-State: AOJu0Yyl/ILrtZeY7XrkweZH9G3J9M1Ha5e7/s0Eg+tM9k9Mk/7c+7uo
	jlHJULXGoBfetQKJiAzVopll2pLBFyxY4+iqyAcOgXeBnMN8wKC76jO9IN2DOhmgmhUviV1+KGn
	Afq2cjoioSlsIvKAp
X-Received: by 2002:a05:6a00:2e92:b0:692:b3d4:e6c3 with SMTP id fd18-20020a056a002e9200b00692b3d4e6c3mr18875539pfb.0.1696920414893;
        Mon, 09 Oct 2023 23:46:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e92:b0:692:b3d4:e6c3 with SMTP id fd18-20020a056a002e9200b00692b3d4e6c3mr18875502pfb.0.1696920414475;
        Mon, 09 Oct 2023 23:46:54 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b00690bd3c0723sm7658466pfd.99.2023.10.09.23.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 23:46:53 -0700 (PDT)
Message-ID: <3632ee24-47f7-ae68-8790-26eb2cf9950b@redhat.com>
Date: Tue, 10 Oct 2023 14:46:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC V2 03/37] hw/arm/virt: Move setting of common CPU
 properties in a function
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, gshan@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-4-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230926100436.28284-4-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: q2aq4SZgJqoM



On 9/26/23 18:04, Salil Mehta via wrote:
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

Hi Salil,

This patch seems break the code, the virt_cpu_set_properties() function 
being defined but not used in this patch, so those original code in the 
machvirt_init() just not work.

We should use this function in the machvirt_init().

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

Besides, if this patch is just factor out the code, we could move the 
check psci_conduit to later patch, and keep this patch clean.

Thanks,
Shaoqin

> +
> +out:
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +    }
> +    return;
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

-- 
Shaoqin
