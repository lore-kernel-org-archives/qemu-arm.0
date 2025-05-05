Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2294411njj;
        Mon, 5 May 2025 01:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZl4Kz9v1mcrQO6pDeQJV7pfZPs6FJ29sQPIeTHsm9e9p5vQMky2BIs5bVMSh7pHE8WqMMG4z131i+/g==@linaro.org
X-Google-Smtp-Source: AGHT+IELb1BYsN3vvOfFGs6BKCIOosgxmQqc8uduEkg2jJuJLhlAT0R6XHvcEG8A9uibDgMSaOkP
X-Received: by 2002:ad4:5965:0:b0:6f4:cfb3:9df9 with SMTP id 6a1803df08f44-6f528cfec45mr105005016d6.33.1746434414294;
        Mon, 05 May 2025 01:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746434414; cv=none;
        d=google.com; s=arc-20240605;
        b=LfUGwKiLsVYErhXGydUiyZh3dCM6nq+K1LUtGvJSIavjt1pC1meojSwoucJIOvn1F1
         asDvtOBelZ1kGHcCdYoUA8qJDgB7slwAIG/+BmqAplzYrfyta8Yuzioqv1sNrQr9QTtX
         x1qe0/Lj/GAoQQCQuZBSDn0UnPu+BpIe+jikN49wCohcCqbLLSyahG1sQzSNJIA5NgBP
         rZJKOJAM+k8fSfJEZ9Djy8pZNnT72ZRD0RZChDqP1XEub1h/LWnL0JS6zCh9DfI4S2QG
         JPCVOiBRkRI3UUgLCa75lXlbjEC4AcZjbFj/6zCaV+NApx1XNFdDTD8t7Uju3azXz8MN
         QxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rNC3a8wufALK2gIw+McmUkj11UtincI3qbyJG5UAn4M=;
        fh=j1Es5K6Js+29SbxRtCr6OKSy81SjidZ3F9WmCxulDXM=;
        b=ktw05TPwqqapL7TJG8roBzjHMmkytXjW6xq0hFDFvmIlAF4+PrifUqPao0DZdpbPrB
         mqNi9Gg6NCz/Z4/N44sgXQFPQLKi0zoB0sB3ZoLTIa3CSHh4gCgNaM7eLa7QLhUz2jLt
         +BzBonCiWJakxj4nITzj05N9Od79Unauj5oPjB02kUtwj583RgetDtojuJ26h4Wusnjh
         QnRH7p7dw3CA4mBhnqK/T2GUcv7RvZTmkEkL9LpXZjrEeTuCIpIQZ46BV3P8dTE02TT4
         pnYlEoei7NAiVSeoqKne58aVLD9zrhS/sOC/KMg04QjgIlbKuWDg1mp92iYnL2OMKNIn
         NlEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=islt+iPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4775d8si83136776d6.167.2025.05.05.01.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 01:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=islt+iPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrMe-0006vr-He; Mon, 05 May 2025 04:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBrMb-0006vH-N2
 for qemu-arm@nongnu.org; Mon, 05 May 2025 04:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBrMZ-0001pg-EG
 for qemu-arm@nongnu.org; Mon, 05 May 2025 04:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746434386;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNC3a8wufALK2gIw+McmUkj11UtincI3qbyJG5UAn4M=;
 b=islt+iPamVWCMDV+NJ2UJ7FHiFuXkHMxRmzotd7zcdqt8YWk6Lk4TGrElyMXbdWItdUlZm
 lEeTEUJe7oTOHPaibxnLxv5aRXldU0DhjYW+ec8lMEF0mGmQh3Zol5vam94QJjvL9ToNA9
 TKz5oi+Q7KxMIAx09Bck1Hxe4th2upQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-s2mLfCT1MKmvOf4bd1-8Eg-1; Mon, 05 May 2025 04:39:44 -0400
X-MC-Unique: s2mLfCT1MKmvOf4bd1-8Eg-1
X-Mimecast-MFC-AGG-ID: s2mLfCT1MKmvOf4bd1-8Eg_1746434384
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39d9243b1c2so1033463f8f.2
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 01:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746434384; x=1747039184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rNC3a8wufALK2gIw+McmUkj11UtincI3qbyJG5UAn4M=;
 b=h9jRt//OLBFn0WuyHor3SdpJF3BDS+nm3BrZ9dcnNVfq9Q1wHavjuPQ6OnAdC98wsp
 p8mUwHSow/9HUZbo9TuhsBpGmm2RF50QMjCyeLd3pDvRfp0iEOwdiXKyWIulQeeUzRrj
 TAx0I+gG8JJWWjp/jS1fzONOPk1pRvHyhXtv6mKBmzIo8mT+nW+WRpwDbhqkEAt9d+m1
 1tNz3M7KmL5rdxlp2022YNRvYoxVGDZlcz88etuTn9CQpN1hAboffZTTUAwNJH9yxtvk
 HilVA7uwPzCiiwHLQtZNsFUZbRLhaKhwg+piidgiylQpBhDW7wpCNw9l3/8WFhVnGV1j
 +pAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhzIeL6z0MlFd/3x3xECRJCH3p/b4FvC9WdhpYbYJvbSfbu5RsEFOYyLE6USRRZiSz8XlUSi+Q2A==@nongnu.org
X-Gm-Message-State: AOJu0YxVU3nZLjFVL2z6jj1TprZ9prMZfRc9SWIJONNThqmBLj474Was
 cVZhi37XQB0TMykxcS+vRzqShEYHHxBv89az+Mjbl26uZeX7SEB6fVYlM2HxjpHdICl2aO4bVqD
 NLRclZYkIhgIO3rHZSMJzPgHnJASZ4dBoBlklFbpAESSFDOoCbg==
X-Gm-Gg: ASbGncuJYUIrTPczQHwHtgxPu5V/BdlZhibqNBDtect7umTJ01gmMi9MrYZm34p6UG2
 qirRnYOC8qfYTdIvrPdYS37ExjSscrfElJolqXn3tkRJMZ5mdjGv4CegI3UOd26gIWSbN4I2w2Y
 1zdoJgQjVR0/k/sRRuVrGElkuTOejsszAplulYYwAbKT00pVLHp64moJGj85Ujn+ZDvQa3WyZdl
 XI2UeZQGq7AkJcM9QiFfJ2Eq9Ua+KbTrCOz0ELXafm4dcLUn4J+HHh93X8uhgSVdRDGi/BC6250
 RllcpzwlWXfITFKpop0elQYBB8m3spwj+7PwMGuPT/37LJHSl9odlCbdvQ8=
X-Received: by 2002:adf:b1d5:0:b0:3a0:a09b:7c3b with SMTP id
 ffacd0b85a97d-3a0a09b7f7cmr3246087f8f.0.1746434383694; 
 Mon, 05 May 2025 01:39:43 -0700 (PDT)
X-Received: by 2002:adf:b1d5:0:b0:3a0:a09b:7c3b with SMTP id
 ffacd0b85a97d-3a0a09b7f7cmr3246071f8f.0.1746434383259; 
 Mon, 05 May 2025 01:39:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7ba1sm9818544f8f.50.2025.05.05.01.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 01:39:42 -0700 (PDT)
Message-ID: <a6268f0a-00e1-43da-a9da-a22e4fc7f601@redhat.com>
Date: Mon, 5 May 2025 10:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-3-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250502102707.110516-3-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mPGWNVaGeC-ZB5SiliNDIXa3vb5w27bUzVx-pRPmias_1746434384
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 4bTftjp/KzSV

Hi Shameer,

On 5/2/25 12:27 PM, Shameer Kolothum wrote:
> With the soon to be introduced user-creatable SMMUv3 devices for
> virt, it is possible to have multiple SMMUv3 devices associated
> with different PCIe root complexes.
>
> Update IORT nodes accordingly.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 162 +++++++++++++++++++++++++++++++--------
I would recommend to split that patch. I think you can first introduce
the new struct and adapting the exicting code for the "legacy
instantiation mode" and then have a saparet patch for handling user
created instances. It will be easier to review.

At some point in the series you shall check the user is not attempting
to use legacy mode and user creatable mode concurrently. I don't know if
it is done yet.
>  hw/arm/virt.c            |   1 +
>  include/hw/arm/virt.h    |   1 +
>  3 files changed, 131 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e178..3ce70f8fa9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/arm/smmuv3.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -266,6 +267,75 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +struct SMMUv3Device {
> +    int irq;
> +    hwaddr base;
> +    GArray *smmu_idmaps;
> +    size_t offset;
> +};
> +typedef struct SMMUv3Device SMMUv3Device;
> +
> +static int smmuv3_dev_idmap_compare(gconstpointer a, gconstpointer b)
> +{
> +    SMMUv3Device *sdev_a = (SMMUv3Device *)a;
> +    SMMUv3Device *sdev_b = (SMMUv3Device *)b;
> +    AcpiIortIdMapping *map_a = &g_array_index(sdev_a->smmu_idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    AcpiIortIdMapping *map_b = &g_array_index(sdev_b->smmu_idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    return map_a->input_base - map_b->input_base;
> +}
> +
> +static void
> +get_smmuv3_legacy_dev(VirtMachineState *vms, GArray * smmuv3_devices)
> +{
> +    SMMUv3Device sdev;
> +
> +    sdev.smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_host_bridges, sdev.smmu_idmaps);
> +    sdev.base = vms->memmap[VIRT_SMMU].base;
> +    sdev.irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    g_array_append_val(smmuv3_devices, sdev);
> +}
> +
> +static int get_smmuv3_devices(Object *obj, void *opaque)
> +{
> +    PCIBus *bus;
> +    SMMUv3Device sdev;
> +    SysBusDevice *sbdev;
> +    int min_bus, max_bus;
> +    AcpiIortIdMapping idmap;
> +    PlatformBusDevice *pbus;
> +    GArray *sdev_blob = opaque;
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
> +
> +    if (!object_dynamic_cast(obj, TYPE_ARM_SMMUV3)) {
> +        return 0;
> +    }
> +
> +    bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
> +    if (!bus || pci_bus_bypass_iommu(bus)) {
can't we simply prevent a user creatable SMMU to be attached to

pci_bus_bypass_iommu(bus) ?

> +        return 0;
> +    }
> +
> +    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    sbdev = SYS_BUS_DEVICE(obj);
> +    sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    sdev.base += vms->memmap[VIRT_PLATFORM_BUS].base;
> +    sdev.irq = platform_bus_get_irqn(pbus, sbdev, 0);
> +    sdev.irq += vms->irqmap[VIRT_PLATFORM_BUS];
> +    sdev.irq += ARM_SPI_BASE;
> +
> +    pci_bus_range(bus, &min_bus, &max_bus);
> +    sdev.smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    idmap.input_base = min_bus << 8,
> +    idmap.id_count = (max_bus - min_bus + 1) << 8,
> +    g_array_append_val(sdev.smmu_idmaps, idmap);
> +    g_array_append_val(sdev_blob, sdev);
> +    return 0;
> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -274,11 +344,11 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int i, nb_nodes, rc_mapping_count;
> -    size_t node_size, smmu_offset = 0;
> -    AcpiIortIdMapping *idmap;
> +    int i, j, nb_nodes, rc_mapping_count;
> +    size_t node_size;
> +    int num_smmus = 0;
>      uint32_t id = 0;
> -    GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    GArray *smmuv3_devices = g_array_new(false, true, sizeof(SMMUv3Device));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>  
>      AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
> @@ -286,28 +356,46 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Table 2 The IORT */
>      acpi_table_begin(&table, table_data);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        AcpiIortIdMapping next_range = {0};
> -
> +    nb_nodes = 2; /* RC, ITS */
> +    if (vms->legacy_smmuv3_present) {
> +        get_smmuv3_legacy_dev(vms, smmuv3_devices);
> +        /*
> +         * There will be only one legacy SMMUv3 as it is a machine wide one.
> +         * And since it covers all the PCIe RCs in the machine, may have
> +         * multiple SMMUv3 idmaps. Sort it by input_base.
> +         */
> +        SMMUv3Device *s = &g_array_index(smmuv3_devices, SMMUv3Device, 0);
> +        g_array_sort(s->smmu_idmaps, iort_idmap_compare);
> +    } else {
>          object_child_foreach_recursive(object_get_root(),
> -                                       iort_host_bridges, smmu_idmaps);
> -
> -        /* Sort the smmu idmap by input_base */
> -        g_array_sort(smmu_idmaps, iort_idmap_compare);
> +                                       get_smmuv3_devices, smmuv3_devices);
> +        /* Sort the smmuv3 devices(if any) by smmu idmap input_base */
> +        g_array_sort(smmuv3_devices, smmuv3_dev_idmap_compare);
> +    }
>  
> +    num_smmus = smmuv3_devices->len;
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
extra line needed
> +            SMMUv3Device *s = &g_array_index(smmuv3_devices, SMMUv3Device, i);
> +
> +            for (j = 0; j < s->smmu_idmaps->len; j++) {
> +                idmap = &g_array_index(s->smmu_idmaps, AcpiIortIdMapping, j);
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
> @@ -316,10 +404,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> @@ -341,10 +428,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* GIC ITS Identifier Array */
>      build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    for (i = 0; i < num_smmus; i++) {
> +        SMMUv3Device *s = &g_array_index(smmuv3_devices, SMMUv3Device, i);
> +        int irq = s->irq;
>  
> -        smmu_offset = table_data->len - table.table_offset;
> +        s->offset = table_data->len - table.table_offset;
>          /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> @@ -355,7 +443,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Reference to ID Array */
>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>          /* Base address */
> -        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
> +        build_append_int_noprefix(table_data, s->base, 8);
>          /* Flags */
>          build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> @@ -404,15 +492,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> +            SMMUv3Device *s = &g_array_index(smmuv3_devices, SMMUv3Device, i);
> +
> +            for (j = 0; j < s->smmu_idmaps->len; j++) {
> +                range = &g_array_index(s->smmu_idmaps, AcpiIortIdMapping, j);
> +                /* output IORT node is the smmuv3 node */
> +                build_iort_id_mapping(table_data, range->input_base,
> +                                      range->id_count, s->offset);
> +            }
>          }
>  
>          /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> @@ -428,8 +520,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_table_end(linker, &table);
> -    g_array_free(smmu_idmaps, true);
>      g_array_free(its_idmaps, true);
> +    for (i = 0; i < num_smmus; i++) {
> +        SMMUv3Device *s = &g_array_index(smmuv3_devices, SMMUv3Device, i);
> +        g_array_free(s->smmu_idmaps, true);
> +    }
> +    g_array_free(smmuv3_devices, true);
>  }
>  
>  /*
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3bae4e374f..dd355f4454 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1620,6 +1620,7 @@ static void create_pcie(VirtMachineState *vms)
>              create_smmu(vms, vms->bus);
>              qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
>                                     0x0, vms->iommu_phandle, 0x0, 0x10000);
> +            vms->legacy_smmuv3_present = true;
>              break;
>          default:
>              g_assert_not_reached();
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c8e94e6aed..2e2867c906 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -180,6 +180,7 @@ struct VirtMachineState {
>      char *oem_id;
>      char *oem_table_id;
>      bool ns_el2_virt_timer_irq;
> +    bool legacy_smmuv3_present;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
Eric

