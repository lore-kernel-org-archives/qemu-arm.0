Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2383038njc;
        Tue, 17 Jun 2025 02:21:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpKk6pUs0cS7CEOAKtL7Xs30V5rALhcxKMEsG/SUoX/r5zujCFP+r/tU/eT11J7W1VemsjddVwj24kmA==@linaro.org
X-Google-Smtp-Source: AGHT+IF0sG/cR6V2Y1V6yXNsdoEvsCk1Vrx+8PyBLDHT/+OoEN5PZ6T2hM2hYdX78cfmWW3EQzyU
X-Received: by 2002:a05:622a:348:b0:4a5:a96d:6071 with SMTP id d75a77b69052e-4a73c61c10dmr213497961cf.38.1750152114462;
        Tue, 17 Jun 2025 02:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750152114; cv=none;
        d=google.com; s=arc-20240605;
        b=DB6cKGfX8IzAB2dHeBOJQRSQr9pEIG0kPXjLba1KbjmU5wtE/MtE7dmvNHep6ib7N/
         4fRLQMWcshQLfe3MB7MrN/UD95QCtcWw6D+Ud5XsUzV9CAQUOhOzzDmZtJ/8U/ENCk1y
         M3jTztt+sUqp0VmX2rvEHTgun45QrRhBb9uxbN8W2FjtK/HYjOrLKtV3DsZu5xGQeQm5
         S/4J9RDFm/Z1EHD6a9QPrcMTcNMudhedrESU/S0g9lZ1CXr0Y/gyr0+rakPV7p4oNvcd
         Rj1gdIUss3oKcQGnVnT6nZJDuz254TFxrYB532ZShgsqZZpYEkjpYwWDhAI/CGApLakr
         IzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R5yKjCNNeruAZkNxjeuEKEwe7iq4DANTcQ4xdjlOPdo=;
        fh=rQB8t3nWzoNA4weWqh9UuTFSDGDxUVKJNgIxXVus2NM=;
        b=XWqzzSZQStOAS6bfyl+yaU7Kuy1yZ04zRckb8K1Sq0woIpnRW25cuolY/VybVg66c6
         FcW2zI2zCVzkeywZjx7RqeLkVbU55h1kgSEvoJ25ZUC1O78SMI7H4gqKyXlDZJsRb0h/
         aHwCEp8lHRkUVJbQYqbGBczXbhTwLTOEnSGvtSUKBxpqcZvka3XsmaBsrkRa3P1Ccxu+
         eq8BJr1M7o3cb867RbLaq9Fz1umt+mHTWnO1ChSyh3c2AqgX8KWo7WJAcbboKsVLcYP9
         zrroW7ufW/ksvRGaWf8A+Wg9U9TY1EhiXlD3rpkr1yjV1rK0usMokuB8QVDMAZSnzmWI
         DKug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bh1biS6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d961si113559231cf.222.2025.06.17.02.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 02:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bh1biS6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRSVo-00027q-LK; Tue, 17 Jun 2025 05:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRSVm-00027Y-6u
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 05:21:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRSVi-0006QT-Mn
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 05:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750152095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5yKjCNNeruAZkNxjeuEKEwe7iq4DANTcQ4xdjlOPdo=;
 b=bh1biS6B5ctuzUHcHVHL7Y7TeX5x6+XqUVG1j1Pz2I3DFM5zT7NbG7jvX8b8VSrZtKjqCt
 E+zzxQTokEr5TTxeW6fgxrf7TgNRB4vFmPhSIZB7p1hXiJMtsdZUFAmNSVQmt/PjmONorS
 77aQ4++2OiaTmvoV0mqyON1TuQ2bLPE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-ESZJeAJqOmaa5ezojW7jtg-1; Tue, 17 Jun 2025 05:21:33 -0400
X-MC-Unique: ESZJeAJqOmaa5ezojW7jtg-1
X-Mimecast-MFC-AGG-ID: ESZJeAJqOmaa5ezojW7jtg_1750152092
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a37a0d1005so3290876f8f.3
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 02:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750152092; x=1750756892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5yKjCNNeruAZkNxjeuEKEwe7iq4DANTcQ4xdjlOPdo=;
 b=DvfJ79O90bmYwCjXWdAMxSEuORqi3vDCgYWktsy5j+blg/25cfwOAikq3PFgqWvbnI
 l3sSDY7+HYfodP/i8WyyOHcjH0ZWJGd9PCuXJiZGOnud96vWDO9HbhLT4IDwQ2fOLBUI
 LKRyVwrWkbwE4NHF1LTpoMZg5OcuS2avFs3VeXS3mJUkfgMh+5BIiMt87INP+2/3Gzom
 VMzLdzP4gkelJnzEHsY+SKGXPU0cxOfxA7ORN7+hBAcuASdKcVqVZWkPddEVAua6QbLT
 htqceXXFK1CeDyUZpJDFLLguqw0+WiWEnsYWGVqq6AY88DC88dza+xU4FqnKsLjbj3Hn
 4CQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0QPq5CwjfFWzFnyp98TMT69kp99ov5rhxzQWqYdkcW9avN9KeGU/UHP00kjxtbYSrnahw6JF0ag==@nongnu.org
X-Gm-Message-State: AOJu0Yy75z8gnXhTJpRqjGq09ATEpMcgSaYgT4Kud2ZNkkOdcZ1CwaQX
 WXXEiMtuK/UkbP2fz4U4YGPOPozmxKhCUQ6HXI9dWYUq9tlaKBUjugvZlhSeFjeztMAJCL2Q6L+
 DtOQP4z8cZkbQZDoPvVFih0ZrJ+rBZIhDJV3/QfSkeX/2Lc6TXZ897A==
X-Gm-Gg: ASbGncsx8OzS6YRiP9/vzr7LQcjcCtHJgosmi49cpsQBwLB6yVTNma3MF6lDJ+TWZCy
 PlETNSPGNFDmMvt8RqAfV24N4uCdq4a2aoGScWOfIZBnFJtoXuyWV/5E3mWf7h5Mqc45LdR5Rqf
 HD/yXUyVJUPJlqGWkrGquVDVLqqW80ChR2qdv+b3vCXYNvXG1y8XEE1L++ZdO6rJ1HilcLbrqC2
 Dnklslw72u5faoAMmc1wm9zxcePitA6WTzhdtvhwmx96nZZwDAn+WBKjY/EJpncyknfR3tqh0+s
 Vt3ZKxYn+FKkM3VAZebG8SOZkqtzCk9f2K4WVub/EFV7XdSr2hg5199dtoL3+duRfgaebA==
X-Received: by 2002:a05:6000:290b:b0:3a5:2e84:cc7b with SMTP id
 ffacd0b85a97d-3a57238b7f2mr9736418f8f.11.1750152092347; 
 Tue, 17 Jun 2025 02:21:32 -0700 (PDT)
X-Received: by 2002:a05:6000:290b:b0:3a5:2e84:cc7b with SMTP id
 ffacd0b85a97d-3a57238b7f2mr9736377f8f.11.1750152091931; 
 Tue, 17 Jun 2025 02:21:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b5c372sm13081068f8f.89.2025.06.17.02.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:21:31 -0700 (PDT)
Message-ID: <096d67cf-d5ba-4041-8919-3e47a9cd10eb@redhat.com>
Date: Tue, 17 Jun 2025 11:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-4-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250613144449.60156-4-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzXB5znJVtdhL-Vt-oMFIu5MCmIF9p2tePix799mdyI_1750152092
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
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
X-TUID: OVxmuIAsB85M

Hi Shameer,

On 6/13/25 4:44 PM, Shameer Kolothum wrote:
> With the soon to be introduced user-creatable SMMUv3 devices for
> virt, it is possible to have multiple SMMUv3 devices associated
> with different PCIe root complexes.
>
> Update IORT nodes accordingly.
>
> An example IORT Id mappings for a Qemu virt machine with two
> PCIe Root Complexes each assocaited with a SMMUv3 will
> be something like below,
>
>   -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
>   -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1
>   ...
>
>   +--------------------+           +--------------------+
>   |   Root Complex 0   |           |   Root Complex 1   |
>   |                    |           |                    |
>   |  Requestor IDs     |           |  Requestor IDs     |
>   |  0x0000 - 0x00FF   |           |  0x0100 - 0x01FF   |
>   +---------+----------+           +---------+----------+
>             |                               |
>             |                               |
>             |       Stream ID Mapping       |
>             v                               v
>   +--------------------+          +--------------------+
>   |    SMMUv3 Node 0   |          |    SMMUv3 Node 1   |
>   |                    |          |                    |
>   | Stream IDs 0x0000- |          | Stream IDs 0x0100- |
>   | 0x00FF mapped from |          | 0x01FF mapped from |
>   | RC0 Requestor IDs  |          | RC1 Requestor IDs  |
>   +--------------------+          +--------------------+
>             |                                |
>             |                                |
>             +----------------+---------------+
>                              |
>                              |Device ID Mapping
>                              v
>               +----------------------------+
>               |       ITS Node 0           |
>               |                            |
>               | Device IDs:                |
>               | 0x0000 - 0x00FF (from RC0) |
>               | 0x0100 - 0x01FF (from RC1) |
>               | 0x0200 - 0xFFFF (No SMMU)  |
>               +----------------------------+
>
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d39506179a..72b79100ce 100644
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
> @@ -296,6 +297,58 @@ populate_smmuv3_legacy_dev(GArray *sdev_blob)
>      g_array_append_val(sdev_blob, sdev);
>  }
>  
> +static int smmuv3_dev_idmap_compare(gconstpointer a, gconstpointer b)
> +{
> +    AcpiIortSMMUv3Dev *sdev_a = (AcpiIortSMMUv3Dev *)a;
> +    AcpiIortSMMUv3Dev *sdev_b = (AcpiIortSMMUv3Dev *)b;
> +    AcpiIortIdMapping *map_a = &g_array_index(sdev_a->idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    AcpiIortIdMapping *map_b = &g_array_index(sdev_b->idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    return map_a->input_base - map_b->input_base;
> +}
> +
> +static int iort_smmuv3_devices(Object *obj, void *opaque)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
> +    GArray *sdev_blob = opaque;
> +    AcpiIortIdMapping idmap;
> +    PlatformBusDevice *pbus;
> +    AcpiIortSMMUv3Dev sdev;
> +    int min_bus, max_bus;
> +    SysBusDevice *sbdev;
> +    PCIBus *bus;
> +
> +    if (!object_dynamic_cast(obj, TYPE_ARM_SMMUV3)) {
> +        return 0;
> +    }
> +
> +    bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
> +    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    sbdev = SYS_BUS_DEVICE(obj);
> +    sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    sdev.base += vms->memmap[VIRT_PLATFORM_BUS].base;
> +    sdev.irq = platform_bus_get_irqn(pbus, sbdev, 0);
> +    sdev.irq += vms->irqmap[VIRT_PLATFORM_BUS];
> +    sdev.irq += ARM_SPI_BASE;
> +
> +    pci_bus_range(bus, &min_bus, &max_bus);
> +    sdev.idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    idmap.input_base = min_bus << 8,
> +    idmap.id_count = (max_bus - min_bus + 1) << 8,
> +    g_array_append_val(sdev.idmaps, idmap);
> +    g_array_append_val(sdev_blob, sdev);
> +    return 0;
> +}
> +
> +static void populate_smmuv3_dev(GArray *sdev_blob)
> +{
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_smmuv3_devices, sdev_blob);
> +    /* Sort the smmuv3 devices(if any) by smmu idmap input_base */
> +    g_array_sort(sdev_blob, smmuv3_dev_idmap_compare);
> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -320,6 +373,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      nb_nodes = 2; /* RC, ITS */
>      if (vms->legacy_smmuv3_present) {
>          populate_smmuv3_legacy_dev(smmuv3_devs);
> +    } else {
> +        populate_smmuv3_dev(smmuv3_devs);
>      }
>  
>      num_smmus = smmuv3_devs->len;
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

