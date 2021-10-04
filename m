Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4021747lfp;
        Mon, 4 Oct 2021 09:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsAHdrWdN4wixaIUBOuHWtbqGSKOLch5zKp3BNvDeqbAHkwnbbuoWH/jhDEwyjmTg4pf92
X-Received: by 2002:a02:a1d7:: with SMTP id o23mr7530764jah.116.1633365084320;
        Mon, 04 Oct 2021 09:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633365084; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ/sOFoVgsfZ3AXl2jdlHgwDXOkGv+mPT6Zla7m+RHolDn1px+fJEDBU3P5gyVQWaW
         HI+Am4ngZb4p147radmefqbJ6Cx5lBj7SkTXRLyhbIDKdV4qowzs1Gh2mcSQbdaElBK7
         NMhzFCIZZbkuO9nuSG0iI7rdp2lWHzP3gTPnObaBGiLQ9t8uxyjNs4nCUz2bCwN2oj5O
         6LYdlmLh9GiYBwbN2lEdupz7ZCpbdWVsGzYOWJdB8f3jeBtWMenC1TUwkVXmAKek6icJ
         U3WICEXsTqHeYKFjuj7ZMoV1YVA6sZBFk5F2VMJAUgMa1nVjYiUmTbSRW7Z5bDM7FKzQ
         J/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=URrI89PgVhsbykJWWAlr3OQ6rKobPnMh9xrqLxPOAhc=;
        b=TJKjmrOr1gdHworJEJUqwG6l+s8wDh5cDcBB5qUUr4evleD6S/1N1BRes7+eXiopAK
         AejkeEBpzbB1l59oqPhs+fUpiZmhN6VtP6NIpAHmvhm15wNTPudQDt8qWKBCvP5iWC5o
         l+7RBZ1/1+0puBbHbtwpCWBsXyFjtWIl+FDTwShc2raK+b+Gbpg05kirnZS8McFVXey0
         n9eXB22GXL2kS8xoSb3dcfya9mLrW/dBjcVumTuFl0E2BIMofXZ77WlkM42ddSH/PqZZ
         T5+kYb97PV/weafVtBDYSW7IsycLSzHaQN7n0n4onyuIYKhOM/CKp9eELM3RS1a2KFq8
         1k3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WiN594DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si15738340ild.46.2021.10.04.09.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 09:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WiN594DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXQs7-0005dh-Fi
	for alex.bennee@linaro.org; Mon, 04 Oct 2021 12:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXQr5-0005aN-IO
 for qemu-arm@nongnu.org; Mon, 04 Oct 2021 12:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXQr1-0005BR-6Q
 for qemu-arm@nongnu.org; Mon, 04 Oct 2021 12:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633365012;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URrI89PgVhsbykJWWAlr3OQ6rKobPnMh9xrqLxPOAhc=;
 b=WiN594DPVe4h4iAdiCUGv7Kf8JyY4KEhGAXz7kAMyIkevPKEBT9CXqC7s3mihXCWE8wev2
 pR969XCUb2h7AkgQd7TcJntPJl54kY9VuJZ8Ur6uu7cGpNnminniEaEOJo4pzVCpaiQxzH
 4BOzTs2g4BUz5HUVT4WQmV2dYvX9oCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-pljXfuxeNQmYT4lmVbX3Xg-1; Mon, 04 Oct 2021 12:30:10 -0400
X-MC-Unique: pljXfuxeNQmYT4lmVbX3Xg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso10174830wmp.6
 for <qemu-arm@nongnu.org>; Mon, 04 Oct 2021 09:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=URrI89PgVhsbykJWWAlr3OQ6rKobPnMh9xrqLxPOAhc=;
 b=jZDvLO1f7mNTxwwfVROgYxFZ/0amdk7tpEMn6NpCIkznmeEvY+8DV4UzTe/5Uv32le
 b6IvOZTwAHLk0uWcZkV4zEXx0Fb9RGqATHR/Pnf8YA5CudT7Fn+4H3AoCPdXr6eYWAV6
 de5S0uqNCRn1ewpYuiW2+2g8g2FMI19KqL2qylZA7diCP6WBNHA80fGAqUjQsoq5rz22
 UeuEe8qthshOGj3py/a2NSRC4N2Aw+7ir4aarIgsmdlzTtjD+vDksrXgVBHLsQUniEOg
 TcIjXCGsfmhso005vpbZ1M1ybKBD+6fkh5vQKuH9EaYIxZ9PaVM5MrIR+aHZHKyIq7V9
 Z8AA==
X-Gm-Message-State: AOAM5330cyOaBQGesf8e487ImmRXiI600tygsFJq7cWuki6yGn/sXY6Z
 cNQ5wTt8Jqa6vV4w+aSCmW+uBWw3k64m8lAVOO5B+Kwbx70AZzVFmDlVFg7RdvdD8prUZKY9EWu
 432SxG3yB0hax
X-Received: by 2002:adf:f94b:: with SMTP id q11mr15178451wrr.365.1633365008837; 
 Mon, 04 Oct 2021 09:30:08 -0700 (PDT)
X-Received: by 2002:adf:f94b:: with SMTP id q11mr15178404wrr.365.1633365008430; 
 Mon, 04 Oct 2021 09:30:08 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t11sm14781426wrz.65.2021.10.04.09.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 09:30:07 -0700 (PDT)
Subject: Re: [RFC] hw/arm/virt-acpi-build: Add IORT RMR regions to handle MSI
 nested binding
To: eric.auger.pro@gmail.com, imammedo@redhat.com,
 shameerali.kolothum.thodi@huawei.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
References: <20210928174432.80601-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <29a4a1f2-746a-2431-8cc9-fe47d602a1a5@redhat.com>
Date: Mon, 4 Oct 2021 18:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210928174432.80601-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qLmqjexgp06v

Hi,

On 9/28/21 7:44 PM, Eric Auger wrote:
> To handle SMMUv3 nested stage support it is practical to
> expose the guest with reserved memory regions (RMRs)
> covering the IOVAs used by the host kernel to map
> physical MSI doorbells.
>
> Those IOVAs belong to [0x8000000, 0x8100000] matching
> MSI_IOVA_BASE and MSI_IOVA_LENGTH definitions in kernel
> arm-smmu-v3 driver. This is the window used to allocate
> IOVAs matching physical MSI doorbells.
>
> With those RMRs, the guest is forced to use a flat mapping
> for this range. Hence the assigned device is programmed
> with one IOVA from this range. Stage 1, owned by the guest
> has a flat mapping for this IOVA. Stage2, owned by the VMM
> then enforces a mapping from this IOVA to the physical
> MSI doorbell.
>
> At IORT table level, due to the single mapping flag being
> set on the ID mapping, 256 IORT RMR nodes need to be
> created per bus. This looks awkward from a specification
> and implementation point of view.
>
> This may also produce a warning at execution time:
> qemu-system-aarch64: warning: ACPI table size 114709 exceeds
> 65536 bytes, migration may not work
> (here with 5 pcie root ports, ie. 256 * 6 = 1536 RMR nodes!).
>
> The creation of those RMR nodes only is relevant if nested
> stage SMMU is in use, along with VFIO. As VFIO devices can be
> hotplugged, all RMRs need to be created in advance. Hence
> the patch introduces a new arm virt "nested-smmuv3" iommu type.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> ---
>
> Instead of introducing a new IOMMU type, we could introduce
> an array of qdev_prop_reserved_region(s).
>
> Guest can parse the IORT RMR nodes with Shammer's series:
> [PATCH v7 0/9] ACPI/IORT: Support for IORT RMR node

While further testing the SMMUv3 nested stage use case I noticed we miss
a _DSM in the
the ACPI device object of the PCIe host bridge (function 5). This DSM
shall return 0 to indicate the OS must honour the PCI config the FW set
at boot time. Otherwise, the RMRs are not taken into account in

[PATCH v7 9/9] iommu/dma: Reserve any RMR regions associated with a dev
(https://www.spinics.net/lists/linux-acpi/msg102492.html)

if (!host->preserve_config)
+			return;

So this patch is not sufficient for enabling the whole use case

Thanks

Eric

>
> The patch applies on Igor's v4 series [1]+ IORT E.b upgrade [2]
> [1] [PATCH v4 00/35] acpi: refactor error prone build_header()
>     and packed structures usage in ACPI tables
> [2] [PATCH 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table
>     up to revision E.b
> ---
>  include/hw/arm/virt.h    |  7 ++++
>  hw/arm/virt-acpi-build.c | 75 +++++++++++++++++++++++++++++++++-------
>  hw/arm/virt.c            |  7 +++-
>  3 files changed, 76 insertions(+), 13 deletions(-)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index b461b8d261..f2f8aee219 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -99,6 +99,7 @@ enum {
>  typedef enum VirtIOMMUType {
>      VIRT_IOMMU_NONE,
>      VIRT_IOMMU_SMMUV3,
> +    VIRT_IOMMU_NESTED_SMMUV3,
>      VIRT_IOMMU_VIRTIO,
>  } VirtIOMMUType;
>  
> @@ -190,4 +191,10 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>      return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
>  }
>  
> +static inline bool virt_has_smmuv3(const VirtMachineState *vms)
> +{
> +    return vms->iommu == VIRT_IOMMU_SMMUV3 ||
> +           vms->iommu == VIRT_IOMMU_NESTED_SMMUV3;
> +}
> +
>  #endif /* QEMU_ARM_VIRT_H */
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ce9311ac19..79842dea4c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -245,16 +245,16 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
> -static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
> -                                  uint32_t id_count, uint32_t out_ref)
> +static void
> +build_iort_id_mapping(GArray *table_data, uint32_t input_base,
> +                      uint32_t id_count, uint32_t out_ref, uint32_t flags)
>  {
>      /* Table 4 ID mapping format */
>      build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>      build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>      build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>      build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> -    /* Flags */
> -    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);
> +    build_append_int_noprefix(table_data, flags, 4); /* Flags */
>  }
>  
>  struct AcpiIortIdMapping {
> @@ -296,6 +296,49 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +static void
> +build_iort_rmr_node(GArray *table_data, GArray *smmu_idmaps, int smmu_offset) {
> +    AcpiIortIdMapping *range;
> +    int i, j;
> +
> +    for (i = 0; i < smmu_idmaps->len; i++) {
> +        range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> +        for (j = 0; j < range->id_count; j++) {
> +            int bdf = range->input_base + j;
> +
> +            /* Table 18 Reserved Memory Range Node */
> +
> +            build_append_int_noprefix(table_data, 6 /* RMR */, 1); /* Type */
> +            /* Length */
> +            build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE + 20, 2);
> +            build_append_int_noprefix(table_data, 3, 1); /* Revision */
> +            build_append_int_noprefix(table_data, i * j + 3, 4); /* Identifier */
> +            /* Number of ID mappings */
> +            build_append_int_noprefix(table_data, 1, 4);
> +            /* Reference to ID Array */
> +            build_append_int_noprefix(table_data, 28, 4);
> +
> +            /* RMR specific data */
> +
> +            /* Flags */
> +            build_append_int_noprefix(table_data, 0 /* Disallow remapping */, 4);
> +            /* Number of Memory Range Descriptors */
> +            build_append_int_noprefix(table_data, 1 , 4);
> +            /* Reference to Memory Range Descriptors */
> +            build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE, 4);
> +            build_iort_id_mapping(table_data, bdf, 1, smmu_offset, 1);
> +
> +            /* Table 19 Memory Range Descriptor */
> +
> +            /* Physical Range offset */
> +            build_append_int_noprefix(table_data, 0x8000000, 8);
> +            /* Physical Range length */
> +            build_append_int_noprefix(table_data, 0x100000, 8);
> +            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        }
> +    }
> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -316,12 +359,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Table 2 The IORT */
>      acpi_table_begin(&table, table_data);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (virt_has_smmuv3(vms)) {
>          AcpiIortIdMapping next_range = {0};
>  
>          object_child_foreach_recursive(object_get_root(),
>                                         iort_host_bridges, smmu_idmaps);
>  
> +        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> +
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
>  
> @@ -338,6 +383,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              }
>  
>              next_range.input_base = idmap->input_base + idmap->id_count;
> +            if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
> +                nb_nodes += idmap->id_count;
> +            }
>          }
>  
>          /* Append the last RC -> ITS ID mapping */
> @@ -346,7 +394,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              g_array_append_val(its_idmaps, next_range);
>          }
>  
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>          rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
>      } else {
>          nb_nodes = 2; /* RC, ITS */
> @@ -371,7 +418,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* GIC ITS Identifier Array */
>      build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (virt_has_smmuv3(vms)) {
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>  
>          smmu_offset = table_data->len - table.table_offset;
> @@ -401,7 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, 0, 4);
>  
>          /* output IORT node is the ITS group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET, 0);
>      }
>  
>      /* Table 17 Root Complex Node */
> @@ -434,7 +481,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, 0, 3); /* Reserved */
>  
>      /* Output Reference */
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (virt_has_smmuv3(vms)) {
>          AcpiIortIdMapping *range;
>  
>          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
> @@ -442,7 +489,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>              /* output IORT node is the smmuv3 node */
>              build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, smmu_offset);
> +                                  range->id_count, smmu_offset, 0);
>          }
>  
>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> @@ -450,11 +497,15 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>              /* output IORT node is the ITS group node (the first node) */
>              build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, iort_node_offset);
> +                                  range->id_count, iort_node_offset, 0);
>          }
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
> +        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET, 0);
> +    }
> +
> +    if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
> +        build_iort_rmr_node(table_data, smmu_idmaps, smmu_offset);
>      }
>  
>      acpi_table_end(linker, &table);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1d59f0e59f..f538611f4e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1251,7 +1251,7 @@ static void create_smmu(const VirtMachineState *vms,
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
>  
> -    if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
> +    if (!virt_has_smmuv3(vms) || !vms->iommu_phandle) {
>          return;
>      }
>  
> @@ -1441,6 +1441,7 @@ static void create_pcie(VirtMachineState *vms)
>  
>          switch (vms->iommu) {
>          case VIRT_IOMMU_SMMUV3:
> +        case VIRT_IOMMU_NESTED_SMMUV3:
>              create_smmu(vms, vms->bus);
>              qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
>                                     0x0, vms->iommu_phandle, 0x0, 0x10000);
> @@ -2314,6 +2315,8 @@ static char *virt_get_iommu(Object *obj, Error **errp)
>          return g_strdup("none");
>      case VIRT_IOMMU_SMMUV3:
>          return g_strdup("smmuv3");
> +    case VIRT_IOMMU_NESTED_SMMUV3:
> +        return g_strdup("nested-smmuv3");
>      default:
>          g_assert_not_reached();
>      }
> @@ -2325,6 +2328,8 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>  
>      if (!strcmp(value, "smmuv3")) {
>          vms->iommu = VIRT_IOMMU_SMMUV3;
> +    } else if (!strcmp(value, "nested-smmuv3")) {
> +        vms->iommu = VIRT_IOMMU_NESTED_SMMUV3;
>      } else if (!strcmp(value, "none")) {
>          vms->iommu = VIRT_IOMMU_NONE;
>      } else {

