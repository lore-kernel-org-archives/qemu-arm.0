Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2729559wrx;
        Mon, 15 Apr 2019 07:14:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaCBeZ9twj30Iw3aU/Cyb0Mb7zCEkO/dUHY7Y7U7gT2NVogzz9wSIKYY4NawReT6XKfiTN
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr22101068wmd.22.1555337692187;
        Mon, 15 Apr 2019 07:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555337692; cv=none;
        d=google.com; s=arc-20160816;
        b=MXhsxMJsUikir1eblNjub6sZBUDctMrE9pHPvXV8ejlF6cAK60+Xz1tzqGF+FNn2A4
         8kE3RbsK2UZGjVJRf4s4R05AMsNPZG7/TFKDOZl8SpG40oJZiJuvMR+tiRQ+rerT0+Wz
         uw7xKyyPtJTEoRCTpJIfSatDxd2nsVxXEuwplFwiFF5qIyJl/oFe/PLIMHmTlDyxeTtn
         t31AoQJTBijYjhPrffeCxSJ79XvkjEHoOxCuSGlqzpSoz8juKEgJ3sDo23ToXuaBn7LQ
         Qq8Z+Rx/JM88/a5YZtCOW/UACxc65eO4zGT8ZNLiHdUGQwQacuNzUVQ95OreB96Ye1tR
         254A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=n0C8fhIK1UGna0kGN+8i5jLzKPVDGsGkGhxY84uJkK0=;
        b=np8kIdCUrlrtSfX2ARTl1ungBcYZ09eX/9NugaR7/s46mjFSlUq9soaRxPCIlN4UK0
         HxJ9zYJVK8PUbWmYedg8Qmr3GOpF3QkD6J/IB+onlm5WN4p9vVe+pfv1DyLqXOKl7dB+
         ubId/ofdNeT1rmFiMubNYkYsQc9Waf9rXU7IERPCt7ZYYoceJtjkJXJA3aTKZLVUFNEN
         aCHsyFVdJdnn5JEGNC5fu6cPQRevkiSmtxodXKneV1lyAIEMGRkt2TcldPehmOmRm9Co
         S9/VWCGJ+v11ZEXkYZMktK7FrI3ajsM8su9FQ4juZTnuCBC5fg5hkU19ZiAv9UHqwiap
         Cjrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si10983242wma.32.2019.04.15.07.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 07:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG2Nn-00049Z-7Q
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 10:14:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2Nc-000496-VJ
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:14:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2Nb-0002RG-Bn
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:14:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hG2Na-0002Qv-WE; Mon, 15 Apr 2019 10:14:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD851C05FBD7;
	Mon, 15 Apr 2019 14:14:36 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1896060C43;
	Mon, 15 Apr 2019 14:14:31 +0000 (UTC)
Date: Mon, 15 Apr 2019 16:14:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190415161426.668ae6f2@Igors-MacBook-Pro.local>
In-Reply-To: <20190415070307.13668-5-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-5-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 15 Apr 2019 14:14:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 4/4] hw/acpi: Extract build_mcfg to pci.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jAZUmx8RyfFl

On Mon, 15 Apr 2019 15:03:07 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> Now we have two identical build_mcfg function.
s/function./functions,/

> 
> Extract them to pci.c.
s|.*|consolidate them in acpi/pci.c|

> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

with above and Philippe's comment addressed 

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v2:
>   * put it to dedicated file pci.c
> ---
>  default-configs/arm-softmmu.mak  |  1 +
>  default-configs/i386-softmmu.mak |  1 +
>  hw/acpi/Kconfig                  |  4 +++
>  hw/acpi/Makefile.objs            |  1 +
>  hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c         | 18 +------------
>  hw/i386/acpi-build.c             | 19 ++-----------
>  include/hw/acpi/pci.h            |  5 ++++
>  8 files changed, 61 insertions(+), 34 deletions(-)
>  create mode 100644 hw/acpi/pci.c
>  create mode 100644 include/hw/acpi/pci.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 613d19a06d..8f2796e195 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -144,6 +144,7 @@ CONFIG_XIO3130=y
>  CONFIG_IOH3420=y
>  CONFIG_I82801B11=y
>  CONFIG_ACPI=y
> +CONFIG_ACPI_PCI=y
>  CONFIG_ARM_VIRT=y
>  CONFIG_SMBIOS=y
>  CONFIG_ASPEED_SOC=y
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
> index ba3fb3ff50..cd5ea391e8 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -25,3 +25,4 @@
>  CONFIG_ISAPC=y
>  CONFIG_I440FX=y
>  CONFIG_Q35=y
> +CONFIG_ACPI_PCI=y
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index eca3beed75..7265843cc3 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -23,6 +23,10 @@ config ACPI_NVDIMM
>      bool
>      depends on ACPI
>  
> +config ACPI_PCI
> +    bool
> +    depends on ACPI
> +
>  config ACPI_VMGENID
>      bool
>      default y
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index ba93c5b64a..9bb2101e3b 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -11,6 +11,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  common-obj-y += acpi_interface.o
>  common-obj-y += bios-linker-loader.o
>  common-obj-y += aml-build.o utils.o
> +common-obj-$(CONFIG_ACPI_PCI) += pci.o
>  common-obj-$(CONFIG_TPM) += tpm.o
>  
>  common-obj-$(CONFIG_IPMI) += ipmi.o
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> new file mode 100644
> index 0000000000..fa0fa30bb9
> --- /dev/null
> +++ b/hw/acpi/pci.c
> @@ -0,0 +1,46 @@
> +/*
> + * Support for generating PCI related ACPI tables and passing them to Guests
> + *
> + * Copyright (C) 2006 Fabrice Bellard
> + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> + * Copyright (C) 2013-2019 Red Hat Inc
> + * Copyright (C) 2019 Intel Corporation
> + *
> + * Author: Wei Yang <richardw.yang@linux.intel.com>
> + * Author: Michael S. Tsirkin <mst@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/pci.h"
> +#include "hw/pci/pcie_host.h"
> +
> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> +{
> +    AcpiTableMcfg *mcfg;
> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> +
> +    mcfg = acpi_data_push(table_data, len);
> +    mcfg->allocation[0].address = cpu_to_le64(info->base);
> +
> +    /* Only a single allocation so no need to play with segments */
> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> +    mcfg->allocation[0].start_bus_number = 0;
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> +
> +    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> +}
> +
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7350f207b5..e3353de9e4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -40,6 +40,7 @@
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/pci.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -545,23 +546,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }
>  
> -static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> -{
> -    AcpiTableMcfg *mcfg;
> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -
> -    mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> -
> -    /* Only a single allocation so no need to play with segments */
> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> -    mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> -
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> -}
> -
>  /* GTDT */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 7613b245cf..29980bb3f4 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -58,6 +58,7 @@
>  
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/pci.h"
>  
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -2392,22 +2393,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>                   table_data->len - srat_start, 1, NULL, NULL);
>  }
>  
> -static void
> -build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> -{
> -    AcpiTableMcfg *mcfg;
> -    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
> -
> -    mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> -    /* Only a single allocation so no need to play with segments */
> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> -    mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> -
> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> -}
> -
>  /*
>   * VT-d spec 8.1 DMA Remapping Reporting Structure
>   * (version Oct. 2014 or later)
> @@ -2677,7 +2662,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      }
>      if (acpi_get_mcfg(&mcfg)) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
> +        build_mcfg(tables_blob, tables->linker, &mcfg);
>      }
>      if (x86_iommu_get_default()) {
>          IommuType IOMMUType = x86_iommu_get_type();
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> new file mode 100644
> index 0000000000..6f94ac4926
> --- /dev/null
> +++ b/include/hw/acpi/pci.h
> @@ -0,0 +1,5 @@
> +#ifndef HW_ACPI_PCI_H
> +#define HW_ACPI_PCI_H
> +
> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
> +#endif

