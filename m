Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp392342lfg;
        Fri, 9 Jul 2021 00:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6wIOeEoLZQL4gxD19QzffbhqSE3rKHfuz+0RXC+0JJXncK5euL2hjkFKImCFcqCeQxi4S
X-Received: by 2002:a17:907:720f:: with SMTP id dr15mr29315635ejc.266.1625814741711;
        Fri, 09 Jul 2021 00:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625814741; cv=none;
        d=google.com; s=arc-20160816;
        b=XCDZ84wn+Vn4cgWyh7PPunMYGoFXsKf5qgcC6F9/a6UCV1IZVyIEX3M7TTqRFjkJKu
         WRm+ip/tzpaZ0PyjisHdEUYNYx8mZCF5S+bUwD4wirXPcmGZIBs4dRSSosM/rIDOW/T6
         RXUj1hzlTmNUXddPPYIwegwItlmRXYUqEHhrJjZ4yaKOcIrUrMv/O0yI7ayaP1twKCiB
         LHfWvsfo1Pf4PZFSTaWdXEjdRJ4T5YAIbBOgJ1XlGWDXk7iOZhRL7ganL5nCZ1gMmCUv
         MENxQxof6Bc4szU0NbhBRljWb9OuNUhrAQN+YM2keXJxTUvYTrbUd9wSWpGiBFrwhcc9
         VTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TVLDCpQmhTVAhZY6S3+ycBNBGec7yyC9GyRvVEB5GmY=;
        b=NHL07iqu2BJRbkbpR/6PQn5BGxOWZwrh5IWD27NjfWX7/wAbpAl/HqMIyqbT1VpAyb
         U3ese4zJufe6IFlpRIWK1aOycqr7AA6IdsUmygTCskIxUVYS7LfUPL2IOKGtizpcA3+9
         gJGotYj7l7me3sk0fxBMPUURteY9eVIpgP2vUpy5aJv6/EBxMIxDS7YRRlcYuY1MqQPC
         HjaKjo2PyCUQzm6C2X8PoSEfddfgO27VKsziT+w14I5/D3V8NhFPgyzd/PCbVbxT6EsQ
         tDjDxnC1ZeQ1299lIqVhcER9KpTU4r3oBTbFjzWi88gLFhmIJnIHyQeRWQ6O9+hRJTEt
         qv2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O72m5Y1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22si6191898ejc.505.2021.07.09.00.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 00:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O72m5Y1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1kgO-00022v-HC
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 03:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kg7-000208-OV
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 03:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kg4-0005xA-A0
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 03:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVLDCpQmhTVAhZY6S3+ycBNBGec7yyC9GyRvVEB5GmY=;
 b=O72m5Y1Wza9e+3Fl1p3VtVeZ9P2IHR0PMNCef8eo7NZ1InOiT2JwjQX4qDCcJJuTy4Hy3W
 YyKw0d/vDKOQnbsa7/B9Xljc8c1Ck7wVviOBIbx3N3JyE8Np6Gu4n/qgRw7HkvSC8TgzT1
 Dx/6m1HuiJ86mabgQicMMM7+7KwUrqA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-wzuKzLRhNGWIOH4x293b-A-1; Fri, 09 Jul 2021 03:11:57 -0400
X-MC-Unique: wzuKzLRhNGWIOH4x293b-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso2119166wrr.18
 for <qemu-arm@nongnu.org>; Fri, 09 Jul 2021 00:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TVLDCpQmhTVAhZY6S3+ycBNBGec7yyC9GyRvVEB5GmY=;
 b=dHmeOt8NbWdRuSmeqVTaxqumDBllRBjR/ChtzmLk6pC49lab+//SZ4IzurvM53Aeeg
 oeemmkTw+7uUg6RHBELOcxMLj6Gfkl6IfG+2aKBq4zG53ThhGj+NH54++DOqk6wadf+B
 bZEZWOBZtcrIx29v28E9BkZbmD2AX97NN3zwm6lfalY8FHkwQeiWQSkIbTZX/78z1zkU
 hGjesJp9wskhlwsxCGflfEc9/igHFpG4LCELz2nuXEAg3fM/uH0ClmRuT0oa0+GbI+kd
 1eb5Sz67kjCEtxpGsGouIM3tzUJdxusFhETs5XQ4E+YC1WPOK6NF8UIDDuONwOnrn19W
 GEag==
X-Gm-Message-State: AOAM532hP9i8Brv2EzQbLNr5XO8Gy9yE4m3N1+pobNh7lPBOhPHX+u/r
 QvDOCdDheZjJvm8AmsQBgb54bkc/ZEcVU9m4a+9E0eTsKYlHrIFgZkv2BIHr13xmaeJT5kdBq3O
 Y/jf+P99y0znL
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr40013793wrr.302.1625814716729; 
 Fri, 09 Jul 2021 00:11:56 -0700 (PDT)
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr40013778wrr.302.1625814716570; 
 Fri, 09 Jul 2021 00:11:56 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id b16sm4451699wrs.51.2021.07.09.00.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:11:56 -0700 (PDT)
Date: Fri, 9 Jul 2021 03:11:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 29/35] acpi: arm/virt: convert build_iort() to endian
 agnostic build_append_FOO() API
Message-ID: <20210709031104-mutt-send-email-mst@kernel.org>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-30-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-30-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Me7dZbJX0Rli

On Thu, Jul 08, 2021 at 11:46:11AM -0400, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

BTW is this actually a bugfix? Worth adding a Fixes tag maybe.

> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org

I think these get dropped on git-am then not sure this is what you wanted.

> ---
>  include/hw/acpi/acpi-defs.h |  71 ------------------
>  hw/arm/virt-acpi-build.c    | 143 +++++++++++++++++++-----------------
>  2 files changed, 77 insertions(+), 137 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 195f90caf6..6f2f08a9de 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -188,75 +188,4 @@ struct AcpiGenericTimerTable {
>  } QEMU_PACKED;
>  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>  
> -/*
> - * IORT node types
> - */
> -
> -#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
> -    uint8_t  type;          \
> -    uint16_t length;        \
> -    uint8_t  revision;      \
> -    uint32_t reserved;      \
> -    uint32_t mapping_count; \
> -    uint32_t mapping_offset;
> -
> -/* Values for node Type above */
> -enum {
> -        ACPI_IORT_NODE_ITS_GROUP = 0x00,
> -        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
> -        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
> -        ACPI_IORT_NODE_SMMU = 0x03,
> -        ACPI_IORT_NODE_SMMU_V3 = 0x04
> -};
> -
> -struct AcpiIortIdMapping {
> -    uint32_t input_base;
> -    uint32_t id_count;
> -    uint32_t output_base;
> -    uint32_t output_reference;
> -    uint32_t flags;
> -} QEMU_PACKED;
> -typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> -
> -struct AcpiIortMemoryAccess {
> -    uint32_t cache_coherency;
> -    uint8_t  hints;
> -    uint16_t reserved;
> -    uint8_t  memory_flags;
> -} QEMU_PACKED;
> -typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
> -
> -struct AcpiIortItsGroup {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    uint32_t its_count;
> -    uint32_t identifiers[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> -
> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> -
> -struct AcpiIortSmmu3 {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    uint64_t base_address;
> -    uint32_t flags;
> -    uint32_t reserved2;
> -    uint64_t vatos_address;
> -    uint32_t model;
> -    uint32_t event_gsiv;
> -    uint32_t pri_gsiv;
> -    uint32_t gerr_gsiv;
> -    uint32_t sync_gsiv;
> -    AcpiIortIdMapping id_mapping_array[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> -
> -struct AcpiIortRC {
> -    ACPI_IORT_NODE_HEADER_DEF
> -    AcpiIortMemoryAccess memory_properties;
> -    uint32_t ats_attribute;
> -    uint32_t pci_segment_number;
> -    AcpiIortIdMapping id_mapping_array[];
> -} QEMU_PACKED;
> -typedef struct AcpiIortRC AcpiIortRC;
> -
>  #endif
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ac5e07e43c..b88ea4b70a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -239,6 +239,21 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  }
>  #endif
>  
> +#define ID_MAPPING_ENTRY_SIZE 20
> +#define SMMU_V3_ENTRY_SIZE 60
> +#define ROOT_COMPLEX_ENTRY_SIZE 32
> +#define IORT_NODE_OFFSET 48
> +
> +static void build_iort_id_mapping(GArray *table_data, uint32_t out_ref)
> +{
> +    /* Identity RID mapping covering the whole input RID range */
> +    build_append_int_noprefix(table_data, 0, 4); /* Input base */
> +    build_append_int_noprefix(table_data, 0xFFFF, 4); /* Number of IDs */
> +    build_append_int_noprefix(table_data, 0, 4); /* Output base */
> +    build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -247,92 +262,88 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int nb_nodes;
> -    AcpiIortIdMapping *idmap;
> -    AcpiIortItsGroup *its;
> -    AcpiIortSmmu3 *smmu;
> -    size_t node_size, iort_node_offset = 48, smmu_offset = 0;
> -    AcpiIortRC *rc;
> +    size_t node_size, smmu_offset = 0;
>      AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> -    } else {
> -        nb_nodes = 2; /* RC, ITS */
> -    }
> -
>      /* Table 2 The IORT */
>      acpi_init_table(&table, table_data);
>      /* Number of IORT Nodes */
> -    build_append_int_noprefix(table_data, nb_nodes, 4);
> +    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +        build_append_int_noprefix(table_data, 3 /* RC, ITS, SMMUv3 */, 4);
> +    } else {
> +        build_append_int_noprefix(table_data, 2 /* RC, ITS */, 4);
> +    }
>      /* Offset to Array of IORT Nodes */
> -    build_append_int_noprefix(table_data, iort_node_offset, 4);
> +    build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
> -    /* ITS group node */
> -    node_size =  sizeof(*its) + sizeof(uint32_t);
> -    its = acpi_data_push(table_data, node_size);
> -
> -    its->type = ACPI_IORT_NODE_ITS_GROUP;
> -    its->length = cpu_to_le16(node_size);
> -    its->its_count = cpu_to_le32(1);
> -    its->identifiers[0] = 0; /* MADT translation_id */
> +    /* 3.1.1.3 ITS group node */
> +    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
> +    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
> +    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> +    /* GIC ITS Identifier Array */
> +    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>  
> -        /* SMMUv3 node */
> -        smmu_offset = iort_node_offset + node_size;
> -        node_size = sizeof(*smmu) + sizeof(*idmap);
> -        smmu = acpi_data_push(table_data, node_size);
> -
> -        smmu->type = ACPI_IORT_NODE_SMMU_V3;
> -        smmu->length = cpu_to_le16(node_size);
> -        smmu->mapping_count = cpu_to_le32(1);
> -        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
> -        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> -        smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
> -        smmu->event_gsiv = cpu_to_le32(irq);
> -        smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
> -
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &smmu->id_mapping_array[0];
> -        idmap->input_base = 0;
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = 0;
> -        /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        smmu_offset = table_data->len - table.table_offset;
> +        /* 3.1.1.2 SMMUv3 */
> +        build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
> +        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> +        build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +        build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
> +        /* Reference to ID Array */
> +        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
> +        /* Base address */
> +        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
> +        /* Flags */
> +        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
> +        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
> +        /* Model */
> +        build_append_int_noprefix(table_data, 0 /* Generic SMMU-v3 */, 4);
> +        build_append_int_noprefix(table_data, irq, 4); /* Event */
> +        build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
> +        build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
> +        build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
> +
> +        build_iort_id_mapping(table_data, IORT_NODE_OFFSET);
>      }
>  
> -    /* Root Complex Node */
> -    node_size = sizeof(*rc) + sizeof(*idmap);
> -    rc = acpi_data_push(table_data, node_size);
> -
> -    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
> -    rc->length = cpu_to_le16(node_size);
> -    rc->mapping_count = cpu_to_le32(1);
> -    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
> -
> +    /* Table 16 Root Complex Node */
> +    build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
> +    node_size =  ROOT_COMPLEX_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> +    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
> +    /* Reference to ID Array */
> +    build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
>      /* fully coherent device */
> -    rc->memory_properties.cache_coherency = cpu_to_le32(1);
> -    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
> -    rc->pci_segment_number = 0; /* MCFG pci_segment */
> -
> -    /* Identity RID mapping covering the whole input RID range */
> -    idmap = &rc->id_mapping_array[0];
> -    idmap->input_base = 0;
> -    idmap->id_count = cpu_to_le32(0xFFFF);
> -    idmap->output_base = 0;
> -
> +    build_append_int_noprefix(table_data,
> +        1 | /* CCA: Cache Coherent Attribute, The device is fully coherent */
> +        (3ULL << 7 * 8) /* MAF: Memory Access Flags, CCA = CPM = DCAS = 1 */,
> +        8);
> +    build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
> +    /* MCFG pci_segment */
> +    build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
> +
> +    /* Output Reference */
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          /* output IORT node is the smmuv3 node */
> -        idmap->output_reference = cpu_to_le32(smmu_offset);
> +        build_iort_id_mapping(table_data, smmu_offset);
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        build_iort_id_mapping(table_data, IORT_NODE_OFFSET);
>      }
>  
>      acpi_table_composed(linker, &table);
> -- 
> 2.27.0

