Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2470735njc;
        Mon, 18 Nov 2024 02:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdB6C86TWCpnOHePnMazxMlf/GWWWZMiNXEaKbBXsRAiYrWzPZfZ38uIuykcTNXLCPW24iZc1koqzXDw==@linaro.org
X-Google-Smtp-Source: AGHT+IG6chQBFl7zedtBh8RVvWeq+h9D3gjxUCreI4QZ1Kw5qeJur9Ktl7RxnuQI/dZteFka580Z
X-Received: by 2002:a05:620a:3729:b0:7b1:44f1:cb6c with SMTP id af79cd13be357-7b3622c9913mr1498742385a.12.1731924186147;
        Mon, 18 Nov 2024 02:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731924186; cv=none;
        d=google.com; s=arc-20240605;
        b=CkNhpCIMsdPvHQknSgnjyyMbnXX1purdrhr3KZkTxQtqLrRqy99lHQqKvZQQBTzYDu
         kd9rMBvO5iiL0VLG4vxXoxWdE6S1N+xEBUScEjjPo68M/3lB6cOWFqtESabIrYQ7otJo
         xL/hgzVkHjeYR3AUX5kWn63YAUxeyfGjsh/IBNBWnpnJeplBkURdWDaMsy7UGy/Mvj0X
         3jz8l5ptcVZGxo1AE+U4WN2W/3ifOUsxCgBrNVGkhGYdDWrwmXJPesMwKU67OL4l46dG
         iz1YLVkYYbdHhkj3OX/UxQiHM6OZJ8oS3mkCJvjast9b76a3dJOv99WeyIzkCTckYfM4
         kzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8+cHbmttZqXAaMqsoD4PN/ATDMDNlBpVDagaXg0yE3A=;
        fh=OY3d99T+trD9CdH7R6DaVgObfjllgY0CKW4qcVRgRcM=;
        b=R+P109S4a/2tkfh9v74MRn5aAycfggfJb+RbZYEryIjjNJhGJ1goSBBl0ANpxGA+/P
         2JuSKDDrI+eGMcRzJYUgrmhq7BgpCLZ809C659LcZ33NPaOBQExvWo2wm4nFunjTsEvt
         rgR1yXcYJANkM1pIjfurFaB1m1TDiyAWblU6gFPViMoV/8mWCRUA9jlmBt8F6r4CrVxF
         5I/VGhDku/Xp4rPICvbfuBz9r2mddhRADlYv7HlMxa9qo1k1DEOFYCF2LXXaXhCz8qpZ
         Ar/wtAXSn7+cqcfyBhF/Q/SiTptZYwdHUYKrdUEg2FLRd7GalfCF55O7AeE1/UYJ5qIL
         devg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bRg5MmxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca863d3si998305185a.415.2024.11.18.02.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 02:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bRg5MmxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCyas-0000ue-Do; Mon, 18 Nov 2024 05:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tCyaD-0000qL-DS
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tCyaA-0006cy-SE
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731924128;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+cHbmttZqXAaMqsoD4PN/ATDMDNlBpVDagaXg0yE3A=;
 b=bRg5MmxQAI9eA0Zr2uFIt5vt1sykjqsLWYvTeDyE34bA8SJTR/Xk7ovHHdVcqXAaYUb4t4
 3KvSM5IhgecZmTJfBRWQCy8KPdCSx/FJP6CpBBXzSyzlTtmmACA1niRY0LsLY29KWvT8Ee
 cW7jcB1X33bcCMupK6qOzDG3lcW7N08=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-6ejWcPWGOGGuDCJd6OnD-g-1; Mon, 18 Nov 2024 05:02:05 -0500
X-MC-Unique: 6ejWcPWGOGGuDCJd6OnD-g-1
X-Mimecast-MFC-AGG-ID: 6ejWcPWGOGGuDCJd6OnD-g
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7181285c746so2143773a34.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 02:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731924125; x=1732528925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+cHbmttZqXAaMqsoD4PN/ATDMDNlBpVDagaXg0yE3A=;
 b=umeQ4Sle2G4uwt2vvr3H3pXgAMheJxYCWeyoUQm9tSNpbHG0yE31zij9jQ6pVZySWb
 va5SaCXL2zAsH6RkqAtXVjj/dXZ/oE1dz5G135IzkpHHQLCoMpvkZ/lUKcjcVDw4FSRC
 nJ9tbGcKbRm4eReVmSm8FEyTSE8dorCnei503H4wjN0C+ala38MYZjErMu5kG3R95cgt
 +puZ6hac2BrUX8cqOpwsgJhSgMorz7XVQeRHTeNd1roPL+KZ4fIPTqruUzsr7YuU3EZ/
 TyfwjCPaRzbrOL5WeRX/jBsRVpah5Hg4XEu3QvoWT58hiEB/yCBMlvbii3pHxLGR4Ttf
 2Wjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU9Oy4EKSYjF25enaYr8OMneoKYv7xPKCQq+g0IRPwX/Whlsl8tfWXkvQNa1Trcx3u1Z/KqApd4w==@nongnu.org
X-Gm-Message-State: AOJu0YwfGfr96XmSpNxmL0QvMyaaX4ReCTb37ZsbhTCq1l/6R3m0IlNJ
 +y3Pfr2NIZGAdsP/AyT+vqrJ9vCEFG9JhTekK5Jn3mNAYi245X+s45XtPykCzlo5TkvZpJ+tQJ8
 Fv2wncZe8cNK99ZmYPEJpOQ5Ilfvjx6LTez3aIpn7knngQj1cBw==
X-Received: by 2002:a05:6830:6582:b0:718:5bed:3596 with SMTP id
 46e09a7af769-71a77987cfbmr7810992a34.15.1731924124816; 
 Mon, 18 Nov 2024 02:02:04 -0800 (PST)
X-Received: by 2002:a05:6830:6582:b0:718:5bed:3596 with SMTP id
 46e09a7af769-71a77987cfbmr7810970a34.15.1731924124445; 
 Mon, 18 Nov 2024 02:02:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4635a9f23besm56046481cf.30.2024.11.18.02.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 02:02:03 -0800 (PST)
Message-ID: <1dcea5ca-806f-4f51-8b13-faf5d62eb086@redhat.com>
Date: Mon, 18 Nov 2024 11:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] hw/arm/virt-acpi-build: Build IORT with multiple
 SMMU nodes
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-5-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20241108125242.60136-5-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BU-WghadqX38dEFRC2bttrWd2nS8zQlI8PlNK3VFbZ4_1731924125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SCnNWTmDPLUy

Hi Shameer,

On 11/8/24 13:52, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Now that we can have multiple user-creatable smmuv3-nested
> devices, each associated with different pci buses, update
> IORT ID mappings accordingly.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++----------
>  include/hw/arm/virt.h    |  6 ++++++
>  2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e10cad86dd..ec4cdfb2d7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -276,8 +276,10 @@ static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i, nb_nodes, rc_mapping_count;
> -    size_t node_size, smmu_offset = 0;
> +    size_t node_size, *smmu_offset;
>      AcpiIortIdMapping *idmap;
> +    hwaddr base;
> +    int irq, num_smmus = 0;
>      uint32_t id = 0;
>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> @@ -287,7 +289,21 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Table 2 The IORT */
>      acpi_table_begin(&table, table_data);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (vms->smmu_nested_count) {
> +        irq = vms->irqmap[VIRT_SMMU_NESTED] + ARM_SPI_BASE;
> +        base = vms->memmap[VIRT_SMMU_NESTED].base;
> +        num_smmus = vms->smmu_nested_count;
> +    } else if (virt_has_smmuv3(vms)) {
> +        irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +        base = vms->memmap[VIRT_SMMU].base;
> +        num_smmus = 1;
> +    }
> +
> +    smmu_offset = g_new0(size_t, num_smmus);
> +    nb_nodes = 2; /* RC, ITS */
> +    nb_nodes += num_smmus; /* SMMU nodes */
> +
> +    if (virt_has_smmuv3(vms)) {
>          AcpiIortIdMapping next_range = {0};
>  
>          object_child_foreach_recursive(object_get_root(),
> @@ -317,10 +333,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              g_array_append_val(its_idmaps, next_range);
>          }
>  
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>          rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
>      } else {
> -        nb_nodes = 2; /* RC, ITS */
>          rc_mapping_count = 1;
>      }
>      /* Number of IORT Nodes */
> @@ -342,10 +356,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* GIC ITS Identifier Array */
>      build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    for (i = 0; i < num_smmus; i++) {
> +        smmu_offset[i] = table_data->len - table.table_offset;
>  
I would have expected changes in the smmu idmap has well. If a given
SMMU instance now protects a given bus hierarchy shouldn't it be
reflected in a differentiated SMMU idmap for each of them (RID subset of
SMMU->pci-bus mapping to a specific IORT SMMU node)? How is it done
currently?

Thanks

Eric
> -        smmu_offset = table_data->len - table.table_offset;
>          /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> @@ -356,7 +369,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Reference to ID Array */
>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>          /* Base address */
> -        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
> +        build_append_int_noprefix(table_data, base + (i * SMMU_IO_LEN), 8);
>          /* Flags */
>          build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> @@ -367,6 +380,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
>          build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
>          build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
> +        irq += NUM_SMMU_IRQS;
>          build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>          build_append_int_noprefix(table_data, 0, 4);
> @@ -405,7 +419,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, 0, 3); /* Reserved */
>  
>      /* Output Reference */
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (virt_has_smmuv3(vms)) {
>          AcpiIortIdMapping *range;
>  
>          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
> @@ -413,7 +427,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>              /* output IORT node is the smmuv3 node */
>              build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, smmu_offset);
> +                                  range->id_count, smmu_offset[i]);
>          }
>  
>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 50e47a4ef3..304ab134ae 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -219,4 +219,10 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>              vms->highmem_redists) ? 2 : 1;
>  }
>  
> +static inline bool virt_has_smmuv3(const VirtMachineState *vms)
> +{
> +    return vms->iommu == VIRT_IOMMU_SMMUV3 ||
> +           vms->iommu == VIRT_IOMMU_SMMUV3_NESTED;
> +}
> +
>  #endif /* QEMU_ARM_VIRT_H */

