Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2895516ejc;
        Thu, 28 Sep 2023 16:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbNgXLXc9pCeGXy/0TLgiBOtUBd2HfVLArWdKewpIMTc6iw1a36V4dQ6coUOC4hUeoCu5V
X-Received: by 2002:a05:6512:2355:b0:4fe:3724:fdb6 with SMTP id p21-20020a056512235500b004fe3724fdb6mr2186125lfu.30.1695944643484;
        Thu, 28 Sep 2023 16:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695944643; cv=none;
        d=google.com; s=arc-20160816;
        b=fHLCYh1kzhu2BnxVSFoe8uEbSJV0SZmbfPdRKKcbEdfww7ajw8FRdEkc2Bl+pNlbJR
         hcCF2dxaWB9ZOvfOHW2HTOR6+kO3fqgrvPsosfoguk9eaJO9OYaCwqsU7BSRzT4Y/w2l
         0KAJuEwk70YX2l7ZZ4bIq0oshjLYGunlGaY+IntbpEq2Rdb3pO41BJGMNrT1kd41JUuS
         8SWyUC3xmnAElrDmhmc49TwL+AKesVa2RHMGHKnMg1n7h+Z/ukTTGnTgdqL3WxkKWFtL
         MTNUGX+0GhpYLhcpOkf3CeMPeyGsd3O64WBY4fknGWml5M20scTUOG65n3ha2dVcsWCP
         UyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AuwLTdg1sfZ1K7ruViCiCHKBdoLfvHZLC2UTKKQmN0Y=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=ksG7Iau3N5dRwU7KJGTiLmoT7xVt7HP98F4DO58FpF5fuGURxfWFAG9td6n1rWLT6J
         wXRSyGN5T/swvDxeNiMf3xYvn5JY7DiHazXRLstlK04aIFLmrRquLzw+hLoVxnyf0LZ1
         7t2n4SSezBzMGvq6q2RLFHZeSkVk0dPEw77mooGFuTNo5phaJwvI3SvAtAcRvKe1P3ZG
         2Et/D+v0qw0LwEG1eS2pEl4qBhjF9KTGRIGWD8Al2ACSvmWdUzV7KpNjcuKCQraBtH8U
         cv3RJ5MeOosXyzQSTzriWVq935WqdFBsmz2bgTDyf45meHSsSlyTEsetqIF/hGVImYfP
         8xSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkA+eaRs;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j6-20020a056512398600b005047ed97c94si3022240lfu.616.2023.09.28.16.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkA+eaRs;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695944642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuwLTdg1sfZ1K7ruViCiCHKBdoLfvHZLC2UTKKQmN0Y=;
	b=NkA+eaRsAHFGKJlbPToE9Vv5CdnJo7l/9CrnRrqYs3Rmxf4Ymij7V3HV1tLRynkvjjEPKE
	PImjX7qpTF0UgH89QkuJPan5xuc2pOklDR3DCfzgSEv59GziqghbTCwOeL5I8LtRTW80hw
	tjmATOzyKQ9uZBPy9i7XpST+Bw88btc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-0YAzTiG0Oy-jsEf_e4D0-Q-1; Thu, 28 Sep 2023 19:43:58 -0400
X-MC-Unique: 0YAzTiG0Oy-jsEf_e4D0-Q-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-27731a63481so14609560a91.2
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944637; x=1696549437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuwLTdg1sfZ1K7ruViCiCHKBdoLfvHZLC2UTKKQmN0Y=;
        b=lfsS8nMAv7G4YyHbsmI0opjGVeWhPLz3hkITvFcRsYzYtsidGtHUpXnFG8Gv8JtCEP
         VLYIwIoSAevn+KyRQhVOByKFefHgNYynFR0ytRN1Kf3UMcloCGpn29IKj8j1Y0MJwRCm
         3nMi1koOWDe6KRFrlFgtWhZF2PmNbuVSii4ex5fqd04LCDIPvZocQN57RcqyXNaXTkr8
         0obpLD7pz/ZXOAyhgdmKzS3YrQG41ARi3PUvYSSunCkXEgABlzLxWbBdu1xMK6ZkbuDs
         r7WXF2uTpFyZOihbLevzIRboAcNt4vb7b9sXzXzfBTtCKX6//la3ryk6DE0Ju9vbwsU6
         RKYw==
X-Gm-Message-State: AOJu0YxeA8i9qD9Xj9vSJwoLPU+9hHG0hclwZbmlCfeitv+YEBffl7AF
	XrN0T37hUJ8wLmDqkuypxR4LPwhb4IVXUmeJeRwLSaWcFo9mJbUDD9r18v7VC6Y5pYopLHC/zIF
	3fbl1lPUVUK7TpsZb
X-Received: by 2002:a17:90b:1d04:b0:269:85d:2aef with SMTP id on4-20020a17090b1d0400b00269085d2aefmr2595722pjb.20.1695944636917;
        Thu, 28 Sep 2023 16:43:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1d04:b0:269:85d:2aef with SMTP id on4-20020a17090b1d0400b00269085d2aefmr2595704pjb.20.1695944636531;
        Thu, 28 Sep 2023 16:43:56 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a498c00b0026b3ed37ddcsm102607pjh.32.2023.09.28.16.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:43:55 -0700 (PDT)
Message-ID: <eb1ac571-7844-55e6-15e7-3dd7df21366b@redhat.com>
Date: Fri, 29 Sep 2023 09:43:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 21/37] hw/arm: MADT Tbl change to size the guest
 with possible vCPUs
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
 <20230926100436.28284-22-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-22-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: JhVFenlZFf3D

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Changes required during building of MADT Table by QEMU to accomodate disabled
> possible vCPUs. This info shall be used by the guest kernel to size up its
> resources during boot time. This pre-sizing of the guest kernel done on
> possible vCPUs will facilitate hotplug of the disabled vCPUs.
> 
> This change also caters ACPI MADT GIC CPU Interface flag related changes
> recently introduced in the UEFI ACPI 6.5 Specification which allows deferred
> virtual CPU online'ing in the Guest Kernel.
> 
> Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++------
>   1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d27df5030e..cbccd2ca2d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -700,6 +700,29 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
>       build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
>   }
>   
> +static uint32_t virt_acpi_get_gicc_flags(CPUState *cpu)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> +
> +    /* can only exist in 'enabled' state */
> +    if (!mc->has_hotpluggable_cpus) {
> +        return 1;
> +    }
> +
> +    /*
> +     * ARM GIC CPU Interface can be 'online-capable' or 'enabled' at boot
> +     * We MUST set 'online-capable' Bit for all hotpluggable CPUs except the
                                        ^^^
                                        bit
> +     * first/boot CPU. Cold-booted CPUs without 'Id' can also be unplugged.
> +     * Though as-of-now this is only used as a debugging feature.
> +     *
> +     *   UEFI ACPI Specification 6.5
> +     *   Section: 5.2.12.14. GIC CPU Interface (GICC) Structure
> +     *   Table:   5.37 GICC CPU Interface Flags
> +     *   Link: https://uefi.org/specs/ACPI/6.5
> +     */
> +    return cpu && !cpu->cpu_index ? 1 : (1 << 3);
> +}
> +

I don't understand how a cold-booted CPU can be hot removed if it doesn't
have a ID? Besides, how cpu->cpu_index is zero for the first cold-booted
CPU?

>   static void
>   build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
> @@ -726,12 +749,13 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       build_append_int_noprefix(table_data, vms->gic_version, 1);
>       build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
>   
> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> -        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> +    for (i = 0; i < MACHINE(vms)->smp.max_cpus; i++) {
> +        CPUState *cpu = qemu_get_possible_cpu(i);
>           uint64_t physical_base_address = 0, gich = 0, gicv = 0;
>           uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
> -        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
> -                                             PPI(VIRTUAL_PMU_IRQ) : 0;
> +        uint32_t pmu_interrupt = vms->pmu ? PPI(VIRTUAL_PMU_IRQ) : 0;
> +        uint32_t flags = virt_acpi_get_gicc_flags(cpu);
> +        uint64_t mpidr = qemu_get_cpu_archid(i);
>   

qemu_get_cpu_archid() can be dropped since it's called for once. MPIDR
can be fetched from ms->possible_cpus->cpus[i].arch_id, which has been
initialized pre-hand.

>           if (vms->gic_version == VIRT_GIC_VERSION_2) {
>               physical_base_address = memmap[VIRT_GIC_CPU].base;
> @@ -746,7 +770,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
>           build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
>           /* Flags */
> -        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
> +        build_append_int_noprefix(table_data, flags, 4);
>           /* Parking Protocol Version */
>           build_append_int_noprefix(table_data, 0, 4);
>           /* Performance Interrupt GSIV */
> @@ -760,7 +784,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           build_append_int_noprefix(table_data, vgic_interrupt, 4);
>           build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
>           /* MPIDR */
> -        build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
> +        build_append_int_noprefix(table_data, mpidr, 8);
>           /* Processor Power Efficiency Class */
>           build_append_int_noprefix(table_data, 0, 1);
>           /* Reserved */

Thanks,
Gavin
