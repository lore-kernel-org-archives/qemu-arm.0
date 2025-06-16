Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1769645njc;
        Mon, 16 Jun 2025 03:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVA5wmvNGC7bUbk4DS7iaqe7jBeOp/Dr8KW9MdGy9ic13Yw1umwulaiNAMCta3/nIJnMIARQrDRidKc7A==@linaro.org
X-Google-Smtp-Source: AGHT+IH59PhLSyP2fGDwmq2r8robUpGc8fkXqTkCBUWfzRUSIUzrwluvK3R7Ue969ek9lET64PP7
X-Received: by 2002:a05:622a:1a9d:b0:494:75f7:b0fa with SMTP id d75a77b69052e-4a73c61709amr153950001cf.41.1750071383034;
        Mon, 16 Jun 2025 03:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750071383; cv=none;
        d=google.com; s=arc-20240605;
        b=GvztNoFYLtKz/j6JXqKmSBUN5mjFKYJ2qbt2my7e/vM09m0F7vbyzfAZrATkRkLvYG
         7w6mnTo5PQ9sHWZgXaghr3t2l22CFnRU6s+WbxeOQtqbcbZL0kVhq7A2mjsdiE2aFx4S
         Z6lldLcTGqCbvsxas/NO7v00Kz5unAOa5sLL2lHfcSelACwfbbzLu+OdnW+58wCbllRS
         gi2sp1yeccQF7oDZCEp1AqraNo63vZsye2tPRKvh4ql1YCBr8Ai3O1d45e73bvH/ScD2
         dGZjIJK/0oWkDBERK9mbVZ5+z3d1mf8CdhrbTr0+etzZ6kzCfNf4g12NWQM7B54GPghL
         4mYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=Ufh/8wQmKSG8PkjYVH+/NrDz4Rjmg9gGPPIOYxYnYwI=;
        fh=aA8gsM5QP8IJIk1ptJlCXNxyLIMaAhKHt/Cf0Wq9DRk=;
        b=O4knbUFPHdqWsJDEvjiTxRymi0o74giqMcVuMRYeVWlGMbOrsVCo3FAsSyNs48cX19
         oHWHTSeYqrSyjtIXn3QDz4eYKilHM/KdZWet19JDW07GE5XxbRn8tI41n8Xp5bpIbdRa
         UbT3gJXt7kjB2WVvWkv6HcVyak3TgFDRuP41uILmeCQf+o9h+QlDvN4nInSZuOcbRH+R
         Et+EI8z9a2q91as2HMidodgAx6mA4i+aNZtvwQ4SKm509zVMPwJC5wLDsvj9m7+7ZLxG
         3UTg4plTuE4Zmk27Vuk10zsdvAMGZSPa9Pfd48xXPWlO7UzXr8Q0YhBA8t4kkm5k1tEX
         lVSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b92ffsi100712561cf.72.2025.06.16.03.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 03:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR7V4-0000u6-N2; Mon, 16 Jun 2025 06:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7Uy-0000tg-Gj; Mon, 16 Jun 2025 06:55:32 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7Uv-0001Wf-A5; Mon, 16 Jun 2025 06:55:32 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLRj333jLz6M53N;
 Mon, 16 Jun 2025 18:54:47 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 76DE61402F5;
 Mon, 16 Jun 2025 18:55:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 12:55:18 +0200
Date: Mon, 16 Jun 2025 11:55:16 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 3/7] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
Message-ID: <20250616115502.000030d5@huawei.com>
In-Reply-To: <20250613144449.60156-4-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DrpDm+ez0ujS

On Fri, 13 Jun 2025 15:44:45 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

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
Seems fine to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Other than needs a bios table test :)

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


