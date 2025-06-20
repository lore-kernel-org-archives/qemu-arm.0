Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp763734njc;
        Fri, 20 Jun 2025 02:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0H8QiPIh+7yxl00MAzRezF4kmddBUCRMKtiVwCg6QZzUktPSGbIYTxBaK9726IKIBDf9ujl5Al/A0Gg==@linaro.org
X-Google-Smtp-Source: AGHT+IHVEL6yrZUA4aa+TtmQcSyclqobrw9+QjqjCg+61rcCuU8tuNofglCRD7Q/gywHkMaZueZf
X-Received: by 2002:a05:6000:2b11:b0:3a4:e75f:53f5 with SMTP id ffacd0b85a97d-3a6d13071c6mr1391484f8f.35.1750412142431;
        Fri, 20 Jun 2025 02:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750412142; cv=none;
        d=google.com; s=arc-20240605;
        b=JxScc5LNIkDT9P4bVknTim9ZmSnOozb3r2UM/vji6XvlZXLKRQp5mjkibJSDZ/J0LI
         a4tgJ0S4LqzmCsXkwk0BHZJsbMiyMnFN2bbwFwpSyN/GRm9HqVjeAMYMTU3riKtQRnN/
         xDkIMJ6aWq9FgJH1qTnJ1S4I9WxkvgXdueB2apqrBo35aZyoysNWwbgo2HlxEugT07T1
         HXb2f9Ly3bu5uQumulqg1mfywldPGIpirtUTWOCUTqwPKuQpNFDQ1LufDouzZkT2UGnO
         oGp33wJBuDYOdQSTq7fiL+mouLH51qgQQil8VEaCi0F+ZxRZerW1DIha2HBtLuJoSz/J
         iOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Rwlay1ErLvl3dLEARVwBxbqZ07pfd/B4HlwcR9oPcBA=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=lhogTbdYrlrMiEEpNZsUcHMzh07uLujGRxz5YbS0FZzZB1BSwPw0Ws6u4ioF4rkN8/
         0I9n1DXP73wP4USgI+Ma8Llfx9uJQu03ffoCAhZVsvtvIpNjz9xTGmpgVJVyB7jFv1lH
         ZuLuXPNdFUru2JcCGZX9ZywrxSgkzgMMWHUFnDrT3yqQoIDeHOqxMdSUPU9vR/FF2mst
         d0JqlVQ2JFdtUF5iRq6EIC2BlnrmfmIgoD3E07bjwX8Pl0zw/gjdiImtVrdfNKplDAON
         BW7/Yt/mM5cCKwI/oqwMtSb9tlK9GyD7Nl/48U8b9DD4qcmBbXwvNJ5APAvqdIFGEOnE
         Ipcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d128e121si1012717f8f.633.2025.06.20.02.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsfQ3wZTz6L64B;
	Fri, 20 Jun 2025 17:30:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 98A8C140446;
	Fri, 20 Jun 2025 17:35:40 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:35:40 +0200
Date: Fri, 20 Jun 2025 10:35:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
Message-ID: <20250620103538.000021c1@huawei.com>
In-Reply-To: <20250616094903.885753-18-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-18-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: cEtdRmP7zxEo

On Mon, 16 Jun 2025 11:46:46 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
> - use cihp_state->use_acpi_hotplug_bridge

pcihp_state

Takes a bit of searching to find the various bits of the
same support on x86 but this seems to match up.
Exactly when things are built does vary but not I think
in a way that matters.  e.g. I think on x86 the
EDSM stuff is built whether or not we have pcihp enabled
whereas here you've made it conditional on using acpi
hp.  Perhaps a tiny bit more description on that would be
useful if you do a v4?

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> ---
>  include/hw/acpi/pcihp.h  |  2 ++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
>  hw/arm/virt.c            |  2 ++
>  hw/arm/Kconfig           |  2 ++
>  5 files changed, 29 insertions(+)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 5506a58862..9ff548650b 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -38,6 +38,8 @@
>  #define ACPI_PCIHP_SEJ_BASE 0x8
>  #define ACPI_PCIHP_BNMR_BASE 0x10
>  
> +#define ACPI_PCIHP_SIZE 0x0018
> +
>  typedef struct AcpiPciHpPciStatus {
>      uint32_t up;
>      uint32_t down;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a1b0f53d2..0ed2e6b732 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -79,6 +79,7 @@ enum {
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
>      VIRT_PVTIME,
> +    VIRT_ACPI_PCIHP,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7547c8d3b..a2e58288f8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -34,6 +34,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
> @@ -809,6 +810,8 @@ static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
>      Aml *scope, *dsdt;
>      MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
> @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
> +
> +        aml_append(pci0_scope, aml_pci_edsm());
> +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
> +                               memmap[VIRT_ACPI_PCIHP].base);
> +        build_append_pcihp_resources(pci0_scope,
> +                                     memmap[VIRT_ACPI_PCIHP].base,
> +                                     memmap[VIRT_ACPI_PCIHP].size);
> +
> +        /* Scan all PCI buses. Generate tables to support hotplug. */
> +        build_append_pci_bus_devices(pci0_scope, vms->bus);
> +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
> +            build_append_pcihp_slots(pci0_scope, vms->bus);
> +        }
> +        build_append_notification_callback(pci0_scope, vms->bus);
> +        aml_append(dsdt, pci0_scope);
> +    }
> +
>      /* copy AML table into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>  
