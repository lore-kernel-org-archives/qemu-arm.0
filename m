Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp118488njc;
        Thu, 5 Jun 2025 02:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW02z7ryJQbW+V8tQUzu3c+/KN39GK0o2HUcadBrds6+F8Yi5H2LI7tpUuDZ+BRb8vgHrMol1W6BHjI+A==@linaro.org
X-Google-Smtp-Source: AGHT+IGyGAfDfXawg4Fo/Fm2nn+6tqYRueyHuNo8nr4zvTBAb1CEHr75PqzKMj7Dq22ID0mCkCTv
X-Received: by 2002:a05:622a:1e16:b0:476:95dd:521c with SMTP id d75a77b69052e-4a5a58b43a3mr84022861cf.45.1749116407622;
        Thu, 05 Jun 2025 02:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749116407; cv=none;
        d=google.com; s=arc-20240605;
        b=EZ5Txn89o8I7xLZ/kvfSgL2tMkkEZxyv/+ISEW+3c3hk9GtlAd4SD516PR6QzVtrVb
         O7RjHTujEqSW2vRBtEZCNKHghSUe0FhhERnon9ut0/8gd1hqtQEOhDKyrXBaNLqEPXXi
         zHrXxhkqwWUOWJrPZPLeU1BqwBpIzsoxAp64WdhyEtyrwAfvxkq+XJ1CmIV6U/CnDEzJ
         78oJG+y2gwjwOSvqYFbIflpLQFA1ZLunHdqhvp8qgMaCX/ZL1arCcyUcalMK5l3Ku3m4
         EC9plEt0bk61aSUXL++3VdQ9u5bJzGRmwPXSy1kv54C4mTFxyX/HJNSJ3HvprEqvWWwk
         7Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NNc10oa4HDAejizmpkusYadxkjVid0FD1Qzlu73P6dE=;
        fh=qMOlyR3seUjIy74MCwds1Gk0NkrVPpwBpIrC3QP3460=;
        b=cYJ6B7kXgB8mu0y7PejYw/l9sVB+fY6pXomAy0O0z6rKmxyHp35ow5TOsbMiASxDT7
         dxQWscWas8mu8ZulcQq8LWh0YwyX6AKl6PJSC/8ErQ3WeBDOlzQYiFKBYhGZUNo2gbuu
         4Gcuawx79ls5JL04twi17BO8zOZJJ8NiPCKDMe43IsQT/BK2mEKrPexBR2qNW2lCtHDm
         lKY5VqcI+35b7Nm21hdu0c6m4Xzr4tuICcVzNzc6PKGDygcERLej5D9Ebvq3a69rIsUG
         ljib9m1eIK9jpx7XFzFKMSXN8Ccdvyabd3/MP1Najq/usdXVaMAtTIKx3eri7jXTmMed
         hIRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HRQOfX2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435a272a3si183204681cf.412.2025.06.05.02.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 02:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HRQOfX2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN74b-0000xw-Lm; Thu, 05 Jun 2025 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN74X-0000wz-GP
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN74T-00066h-N0
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749116375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNc10oa4HDAejizmpkusYadxkjVid0FD1Qzlu73P6dE=;
 b=HRQOfX2bj7U+mbLyunxYRjC+hmD/1f6rna2CjYq5O7ckZyNtHKXwDfJtzOjk1C+f49IBJr
 IYA3LuXjdpNPYvvgqOC0YeWhtvvLrLEy+yRJFhJIzEk1Jcahj2c/ys9fvldV0bcPj0FW+1
 V/JKm+qohAGZYLjLdMzMY8exIUbV7EY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-SLXo2VZ1Mx2qKKDNfesd1g-1; Thu, 05 Jun 2025 05:39:34 -0400
X-MC-Unique: SLXo2VZ1Mx2qKKDNfesd1g-1
X-Mimecast-MFC-AGG-ID: SLXo2VZ1Mx2qKKDNfesd1g_1749116373
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f55ea44dso346976f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749116373; x=1749721173;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NNc10oa4HDAejizmpkusYadxkjVid0FD1Qzlu73P6dE=;
 b=dHeGXFR7L8Vcu5PEGuusrGV8TsPyGBOHAOuEX+HFozq8xoAAh+XVCmVf3+N2+s4VGJ
 FYM7uhRrEF88sT1iY/6vDB+6ji1AQH3qiBNYf7xnFHAmAT6Jxoe0ca5mzYTd+xgdDsMm
 E4Uj0SepwYXo316HGNBTEipBKh1vC9kBoam9b0PwY7hG6MNPTyG08ydddPcdQiA3/d6m
 hHgUH6ktWJ9JxpwWvP8GF2dyUx1JSsAdZK4gqUeQE0KwL9ZuJWPmcU7R66icR95CzEgD
 OdfbGNczlg3NupYkc8ZpJlWawgdSpgmRoHijQZPLIqsmEAjCJ8DJU/4GMRuxQmCpqX96
 b+ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAZ+E3a9pZ1WYyg9nYB02v7NK04Poac0q86ebeYXOQO7XrhsaV3EK3MfohVTxl43E1pIiEpDfcFg==@nongnu.org
X-Gm-Message-State: AOJu0YwdMUa2Ozy8iANskUKBQK7s3yQ+l4Clqda6D3yqLq/pNSAEjgEM
 lAoy5saJhB+uUSKDq8begNdOkE8NLg4nPrsRtwd2tavoNZrh44H3FHtDf9t1Uq1NNWFh6YtH6iR
 QuIU4UX+ffGx8aJE0IF1QDulB9l8yWMc0EH3cA4weTK2s5mTLsDgWdw==
X-Gm-Gg: ASbGncvAWklTt+RPx+RCZ58JuX3WAbl3dbTo4IFgK3DbkeRkUsuYEmEC0K5yqI4V4pr
 WxAwzzDcdu1fecN2JWF34dimnA2mvEVcMaNfcyuoSgv86GwfdL2BDZIEzJsiga+OWMUIP524RPv
 v1v+6cOWhf34tIFqNjdmLwfHaxJau/V8B9rdZYWw8qDArFKAOfrGUa6rCww0sLTtFzAKXO+Bgpj
 EZMwWQwy8CZqm0JmSw3/xI2FQNK0LTp6NSVSBkYph2ZT+Lods7UlZ0eH1Ywt05b+yr1EmDG/eJJ
 8/u99j0gx2rngN1sJY/brXX+Zkz7WvZXY+nbvjzjFAeGo9jSJI+ADYi05Z4=
X-Received: by 2002:a05:6000:2085:b0:3a4:dfaa:df8d with SMTP id
 ffacd0b85a97d-3a51d8f9fa2mr5281797f8f.9.1749116373180; 
 Thu, 05 Jun 2025 02:39:33 -0700 (PDT)
X-Received: by 2002:a05:6000:2085:b0:3a4:dfaa:df8d with SMTP id
 ffacd0b85a97d-3a51d8f9fa2mr5281772f8f.9.1749116372726; 
 Thu, 05 Jun 2025 02:39:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b871sm24388642f8f.13.2025.06.05.02.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 02:39:31 -0700 (PDT)
Message-ID: <5a08ba9d-4a47-49d1-9390-c19539a97939@redhat.com>
Date: Thu, 5 Jun 2025 11:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] hw/arm/virt-acpi-build: Re-arrange SMMUv3 IORT
 build
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-3-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250602154110.48392-3-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c9Ju8Iy6j18-KbM52Gm827kij1LG5Z6TJWNgeigj-Q0_1749116373
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zw8+BgJjvO9o

Hi Shameer,

On 6/2/25 5:41 PM, Shameer Kolothum wrote:
> Introduces a new struct AcpiIortSMMUv3Dev to hold all the information
> required for SMMUv3 IORT node and use that for populating the node.
>
> The current machine wide SMMUv3 is named as legacy SMMUv3 as we will
> soon add support for user-creatable SMMUv3 devices. These changes will
> be useful to have common code paths when we add that support.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 112 +++++++++++++++++++++++++++------------
>  hw/arm/virt.c            |   1 +
>  include/hw/arm/virt.h    |   1 +
>  3 files changed, 80 insertions(+), 34 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7e8e0f0298..bd26853ef6 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -266,6 +266,28 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +struct AcpiIortSMMUv3Dev {
> +    int irq;
> +    hwaddr base;
> +    GArray *idmaps;
> +    size_t offset;
I would suggest to comment at least the offset field which is not obvious
> +};
> +typedef struct AcpiIortSMMUv3Dev AcpiIortSMMUv3Dev;
> +
> +static void
> +get_smmuv3_legacy_dev(VirtMachineState *vms, void *opaque)
> +{
> +    GArray *sdev_blob = opaque;
I don't get why we use an opaque pointer here.
> +    AcpiIortSMMUv3Dev sdev;
> +
> +    sdev.idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_host_bridges, sdev.idmaps);
> +    sdev.base = vms->memmap[VIRT_SMMU].base;
> +    sdev.irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    g_array_append_val(sdev_blob, sdev);
So if I understand correctly this helper populate an AcpiIortSMMUv3Dev
object with the legacy iommu info and add it in the array of
AcpiIortSMMUv3Dev. The name of the helper does not really reflect what
it does and generally get is associated with a put. I would suggest to
rename. I see that afterwards you call

sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, 0);
to retrieve the first element and then sort the ipmap array.

Why can't you do all that stuff in the helper?

> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -274,11 +296,12 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int i, nb_nodes, rc_mapping_count;
> -    size_t node_size, smmu_offset = 0;
> -    AcpiIortIdMapping *idmap;
> +    int i, j, nb_nodes, rc_mapping_count;
> +    AcpiIortSMMUv3Dev *sdev;
> +    size_t node_size;
> +    int num_smmus = 0;
>      uint32_t id = 0;
> -    GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    GArray *smmuv3_devs = g_array_new(false, true, sizeof(AcpiIortSMMUv3Dev));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>  
>      AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
> @@ -286,28 +309,41 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Table 2 The IORT */
>      acpi_table_begin(&table, table_data);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        AcpiIortIdMapping next_range = {0};
> -
> -        object_child_foreach_recursive(object_get_root(),
> -                                       iort_host_bridges, smmu_idmaps);
> -
> -        /* Sort the smmu idmap by input_base */
> -        g_array_sort(smmu_idmaps, iort_idmap_compare);
> +    nb_nodes = 2; /* RC, ITS */
> +    if (vms->legacy_smmuv3_present) {
> +        get_smmuv3_legacy_dev(vms, smmuv3_devs);
> +        /*
> +         * There will be only one legacy SMMUv3 as it is a machine wide one.
> +         * And since it covers all the PCIe RCs in the machine, may have
> +         * multiple SMMUv3 idmaps. Sort it by input_base.
> +         */
> +        sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, 0);
> +        g_array_sort(sdev->idmaps, iort_idmap_compare);
> +    }
>  
> +    num_smmus = smmuv3_devs->len;
> +    if (num_smmus) {
> +        AcpiIortIdMapping next_range = {0};
> +        int smmu_map_cnt = 0;
>          /*
>           * Split the whole RIDs by mapping from RC to SMMU,
>           * build the ID mapping from RC to ITS directly.
>           */
> -        for (i = 0; i < smmu_idmaps->len; i++) {
> -            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -
> -            if (next_range.input_base < idmap->input_base) {
> -                next_range.id_count = idmap->input_base - next_range.input_base;
> -                g_array_append_val(its_idmaps, next_range);
> +        for (i = 0; i < num_smmus; i++) {
> +            AcpiIortIdMapping *idmap;
could belong to the inner block

Otherwise looks good to me

Cheers

Eric
> +            sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, i);
> +
> +            for (j = 0; j < sdev->idmaps->len; j++) {
> +                idmap = &g_array_index(sdev->idmaps, AcpiIortIdMapping, j);
> +
> +                if (next_range.input_base < idmap->input_base) {
> +                    next_range.id_count = idmap->input_base -
> +                                          next_range.input_base;
> +                    g_array_append_val(its_idmaps, next_range);
> +                }
> +                next_range.input_base = idmap->input_base + idmap->id_count;
> +                smmu_map_cnt++;
>              }
> -
> -            next_range.input_base = idmap->input_base + idmap->id_count;
>          }
>  
>          /* Append the last RC -> ITS ID mapping */
> @@ -316,10 +352,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              g_array_append_val(its_idmaps, next_range);
>          }
>  
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> -        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
> +        nb_nodes += num_smmus;
> +        rc_mapping_count = smmu_map_cnt + its_idmaps->len;
>      } else {
> -        nb_nodes = 2; /* RC, ITS */
>          rc_mapping_count = 1;
>      }
>      /* Number of IORT Nodes */
> @@ -341,10 +376,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* GIC ITS Identifier Array */
>      build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    for (i = 0; i < num_smmus; i++) {
> +        sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, i);
> +        int irq = sdev->irq;
>  
> -        smmu_offset = table_data->len - table.table_offset;
> +        sdev->offset = table_data->len - table.table_offset;
>          /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> @@ -355,7 +391,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Reference to ID Array */
>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>          /* Base address */
> -        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
> +        build_append_int_noprefix(table_data, sdev->base, 8);
>          /* Flags */
>          build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> @@ -404,15 +440,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, 0, 3); /* Reserved */
>  
>      /* Output Reference */
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +    if (num_smmus) {
>          AcpiIortIdMapping *range;
>  
>          /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
> -        for (i = 0; i < smmu_idmaps->len; i++) {
> -            range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -            /* output IORT node is the smmuv3 node */
> -            build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, smmu_offset);
> +        for (i = 0; i < num_smmus; i++) {
> +            sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, i);
> +
> +            for (j = 0; j < sdev->idmaps->len; j++) {
> +                range = &g_array_index(sdev->idmaps, AcpiIortIdMapping, j);
> +                /* output IORT node is the smmuv3 node */
> +                build_iort_id_mapping(table_data, range->input_base,
> +                                      range->id_count, sdev->offset);
> +            }
>          }
>  
>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> @@ -428,8 +468,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_table_end(linker, &table);
> -    g_array_free(smmu_idmaps, true);
>      g_array_free(its_idmaps, true);
> +    for (i = 0; i < num_smmus; i++) {
> +        sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, i);
> +        g_array_free(sdev->idmaps, true);
> +    }
> +    g_array_free(smmuv3_devs, true);
>  }
>  
>  /*
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a6cd085a3..73bd2bd5f2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1614,6 +1614,7 @@ static void create_pcie(VirtMachineState *vms)
>              create_smmu(vms, vms->bus);
>              qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
>                                     0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            vms->legacy_smmuv3_present = true;
>              break;
>          default:
>              g_assert_not_reached();
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a1b0f53d2..8b1404b5f6 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -174,6 +174,7 @@ struct VirtMachineState {
>      char *oem_id;
>      char *oem_table_id;
>      bool ns_el2_virt_timer_irq;
> +    bool legacy_smmuv3_present;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

