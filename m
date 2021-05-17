Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1028099lfm;
        Mon, 17 May 2021 00:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz48m1CsH4MXGSTun0hd5BmZHP5mn7WGqvzNTwECOL9NsFtczcQAYLW0cn2rfPYBCNjZbpS
X-Received: by 2002:a17:906:46d1:: with SMTP id k17mr17128002ejs.77.1621237401081;
        Mon, 17 May 2021 00:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621237401; cv=none;
        d=google.com; s=arc-20160816;
        b=TTA1ZokG2VwJla+j9B2gOdyBM1Ts7XtK2Mu2KNsm3fle1CjM6uekcxSITaQ16XQL2g
         Q9Rui5M8bP7QTp1bVcTXBrXz25Q56yHEqDBytBeYegOy+VxxzCGzllyZ1aml461J6pFp
         MVTM69b8ZIvpluZEbnKevKPqTzYKzC79eiQVb135eARIbBCP00n6Bu7CQE/fXSkdWdNr
         IHgUcqDsdrZOgx0Wj9CuLAMt2xJ5RgL2xCR2LuPYaXXWshYMp6TmdZ6vsJdrgRl1GIJt
         na71sQy1WVE2Xw43Gf3C/XcRqSlK0DIghfROEv1fXmIo0J565CT4GvwR6sgxMIx/aaCQ
         AIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=M0uXeDRCv9guuXdWaW+0zNr9l3n576Pn3CPlPXmUdms=;
        b=ZfkFfrsfiZytl/9H162xXtCpE0z29Heyc1L3mhYdJHhxUhRCvv1aDp2d5cqv8jSsrp
         yqwjvOAgSbRazl4Q0d4aTibFamWL7LrjTHxO9Xs/29PB+8b/FbjkaJh6+rinTAARFoEz
         fW86AcgG0n1k4eikK6mFKSEHWSn3pg/ywAkWAmWxUdREYZPmz2R1pio6ef/LzO7bzXkb
         Ka9lDVBtiH03/V3tZ8uScsolRhWh1/NdySqLwj+Wh8Uiqfbn7APULv/n6gS4NzhYN6gv
         XErNSb36dsiYO4hFYxNAwh7o7MfsRUmOt/PtrVG3V1kSmFR/KKlHQ0mcyaUhqLr5QO2d
         NjMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LZEt/22j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si5260110edx.252.2021.05.17.00.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 00:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LZEt/22j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liXuK-00046o-44
	for alex.bennee@linaro.org; Mon, 17 May 2021 03:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXu7-00045h-6p
 for qemu-arm@nongnu.org; Mon, 17 May 2021 03:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXu3-0004QD-N7
 for qemu-arm@nongnu.org; Mon, 17 May 2021 03:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621237382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0uXeDRCv9guuXdWaW+0zNr9l3n576Pn3CPlPXmUdms=;
 b=LZEt/22jY4N5tk+QRJzLQYa0p4wJpERVmAwwZNw4AtKhdqmehW6FhfNkL3WRCgKqP5kZfI
 BaRUHPtQkJveRuIgSs3XKgiZ3LpkwKXrqlDdBacWWNOXgzbKyxoO/rIEAMx4ZLoQap0ZUw
 KPy8cK2XgJXg15wmDE7I7EnIVC+tUqE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324--bfZzvHZMreIoYVSw3gUvg-1; Mon, 17 May 2021 03:43:00 -0400
X-MC-Unique: -bfZzvHZMreIoYVSw3gUvg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w1-20020aa7da410000b029038d323eeee3so1353768eds.8
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 00:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0uXeDRCv9guuXdWaW+0zNr9l3n576Pn3CPlPXmUdms=;
 b=DOTm3pTvZAb+OO+i5COGaz43WFvqQ4KW0x65NoOcxbIF/ALDIQSUWd5Q3bHYGNERK5
 PeNkxJs8cfR7vpH22i7jtuFIuTQPqSnvdhtLuhFrbbDZnkdOqb5vThU4xLKVSyBS8j2V
 gmf2vdlCQp9fP7fPqcsPg8x+aKKHlZiAyVPGj6hcvSkIu/IhwYl061sGSbwa894zQ7Gu
 HtxuB7zghs/vsxqtTA92s0qHfTsxcuJ3ATiOKQRxWOAfnr0Jysd8O9M6GddViOoUew3x
 G+Ow8OdSc92MIZJnS+DvMwLwZqEr9HB3LSRqNeZ+g2VWLVc1kIasei1wY2HlO3eVytl5
 elSw==
X-Gm-Message-State: AOAM532ocKEo4922Tj5+8ZoCGQaWYX4zmDI7y5V5dql6KBAOMEnOKGVS
 YxezmXKTe2Qtg8BL/lyVyucrORw34HGKuHinBZ016rGDvtETOaXyYo/gY9ukjUc+1J3rKrfl9GY
 j5JWEx4yUQ9NA
X-Received: by 2002:a17:907:77c7:: with SMTP id
 kz7mr4484133ejc.54.1621237378942; 
 Mon, 17 May 2021 00:42:58 -0700 (PDT)
X-Received: by 2002:a17:907:77c7:: with SMTP id
 kz7mr4484105ejc.54.1621237378753; 
 Mon, 17 May 2021 00:42:58 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id a6sm3430523ejv.4.2021.05.17.00.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:42:58 -0700 (PDT)
Date: Mon, 17 May 2021 09:42:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Message-ID: <20210517074256.xjqwejbi4mfsvug2@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLR4g4PoVNUr

On Sun, May 16, 2021 at 06:28:57PM +0800, Yanan Wang wrote:
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. So we create gicc nodes in MADT for possible cpus and then
> ensure only the present CPUs are marked ENABLED. Furthermore, it
> also needed if we are going to support CPU hotplug in the future.
> 
> Co-developed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a2d8e87616..4d64aeb865 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const int *irqmap = vms->irqmap;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(MACHINE(vms));
> +    bool pmu;
>      int i;
>  
>      acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> @@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> +    for (i = 0; i < possible_cpus->len; i++) {
>          AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                             sizeof(*gicc));
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>  
> +        /*
> +         * PMU should have been either implemented for all CPUs or not,
> +         * so we only get information from the first CPU, which could
> +         * represent the others.
> +         */
> +        if (i == 0) {
> +            pmu = arm_feature(&armcpu->env, ARM_FEATURE_PMU);
> +        }
> +        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) == pmu);

This doesn't belong in this patch. The commit message doesn't even mention
it. Also, I don't think we should do this here at all. If we want to
ensure that all cpus have a pmu when one does, then that should be done
somewhere like machvirt_init(), not in ACPI generation code which doesn't
even run for non-ACPI VMs.

> +
>          gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
>          gicc->length = sizeof(*gicc);
>          if (vms->gic_version == 2) {
> @@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>          }
>          gicc->cpu_interface_number = cpu_to_le32(i);
> -        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
> +        gicc->arm_mpidr = cpu_to_le64(possible_cpus->cpus[i].arch_id);

Hmm, I think we may have a problem. I don't think there's any guarantee
that possible_cpus->cpus[i].arch_id == armcpu->mp_affinity, because
arch_id comes from virt_cpu_mp_affinity(), which is arm_cpu_mp_affinity,
but with a variable cluster size, however mp_affinity comes from
arm_cpu_mp_affinity with a set cluster size. Also, when KVM is used,
then all bets are off as to what mp_affinity is.

We need to add some code that ensures arch_id == mp_affinity, and, for
now, we should stick with mp_affinity, since, at least when KVM is used,
that's the correct one.

>          gicc->uid = cpu_to_le32(i);
> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>  
> -        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> +        /*
> +         * ACPI spec says that LAPIC entry for non present CPU may be

Why are we talking about LAPICs in a GICC generator?

> +         * omitted from MADT or it must be marked as disabled. Here we
> +         * choose to also keep the disabled ones in MADT.
> +         */
> +        if (possible_cpus->cpus[i].cpu != NULL) {
> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        }
> +
> +        if (pmu) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
>          if (vms->virt) {
> -- 
> 2.19.1
>

Thanks,
drew 

