Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2650102wrx;
        Mon, 15 Apr 2019 06:02:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6RTy5ERB7L/i+AZfVvuH4O1zti4ahZsszzN9a3sv4OVZvbpUkx0SAxsY4Hr4R4SD/dEPD
X-Received: by 2002:a1c:f504:: with SMTP id t4mr20984945wmh.121.1555333352955;
        Mon, 15 Apr 2019 06:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555333352; cv=none;
        d=google.com; s=arc-20160816;
        b=Fn140ei3B75MmQrYE1fG3SFgEyGeZQuISqa3+WAhU3lu6ChVS5b4cO1tSeams9eS7q
         wgL000Oo3L5vv+tU21nA4yzrt2g5nX12As4LjVrrTUierT6Ba/0pxNZUUsD5Z7GFkX4I
         TIVQSH1Iuhuos2BMS9MZnxsjIJFnXJRz7cDq3/tazd4Dq+eOOaaEsJMJUBD0W6j4fYVf
         +ij7d8IbmirPW5hDZg9I/xzSiFuSyr3KOZYrtD84aiqSKlElDySV72Ok/8yfiqy2lkxQ
         wHpvNOoGOUGECTLWyQc2/QRAFJkfCdpLwr7tLD71CuJdAD2vVhtojdBg7mgri7aQa+1H
         0OfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=f+K/ZMgkXu/IPYFi+S1fSWx9y2VfYqeNzr0su2sA+O0=;
        b=tYXoGj2m2juWTq29kBcxSxwrVEuZd8GJH8ml9OX7yMRBjbJ6QpYwNEdvMJ+ap+slOt
         w5/UnIgYPaQwI5/07sq8mSNMnBDKsvlHe56qKzQaFhOADBP0b5RPTaYKuDtro88poHKA
         yVpxnIj2g0lnjDHm9nMLxApSejcssviZp48ZeaQNWkgfXlxDYzpAS8VAF2toPG9H8U/q
         fzf9V4Xj33v//z0lwlWMzAAO35zPRCCAddh39hJH8dSz+PZ+B+plki9he8I7eLZYL/58
         UVejgrGPEOOoN9LNechpRybynbIDTOlm1Rb4K7K6LxJ50VWMzm6QkYlU9qIsp6JNdRAs
         VqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g130si10887237wmf.140.2019.04.15.06.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 06:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG1Fn-00043W-W0
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 09:02:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1FT-00041I-C1
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 09:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1FL-0004Rz-Kd
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 09:02:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46842)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hG1FJ-0003ro-HP
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 09:02:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id t17so21789372wrw.13
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 06:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=f+K/ZMgkXu/IPYFi+S1fSWx9y2VfYqeNzr0su2sA+O0=;
	b=Z3Fa5dDKgO/2oYbKX6UzVkKkk0CIst9CExo6eYfW306qfwSdwkhhKnNTRvQCUs8GE3
	ZVyxWc83P8D1+lxkazhdLmBaidcqGQ5at61DgldYS9mrjs0LN8Y+0AgkguGrk9rOhLSJ
	rK7SMepHzcQSX8Rd/68NCPHdIpx1WRge9x0RK8flxdhfKCrNezEUG7QadXON/NUKRExD
	IE+KmJ/Kh1ktAbQTQtuAmjRhWiLYAibnwcn/mRXkrVyqYTL/i8nven0UxJNoW21L85lo
	i36lPFUnYRYELM+SqHwICMAoL7zu05D8OodiowQC80euq2ZPkq0EJQxy0v0DxUpPxzrL
	exBQ==
X-Gm-Message-State: APjAAAV8qr/NOD2yk1tO9ceDT4HKOzKLRdbOUScKBuW9Opv1ptucHZu+
	Ge1VkyU8bZNxnoEmKGy9hTzYZg==
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr7848997wrm.124.1555333290920; 
	Mon, 15 Apr 2019 06:01:30 -0700 (PDT)
Received: from [10.1.5.6] (206.red-80-28-210.staticip.rima-tde.net.
	[80.28.210.206]) by smtp.gmail.com with ESMTPSA id
	i18sm44663131wrm.7.2019.04.15.06.01.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 06:01:29 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-5-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c791df00-77fb-81b4-d351-58cf8fead676@redhat.com>
Date: Mon, 15 Apr 2019 15:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415070307.13668-5-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/4] hw/acpi: Extract
 build_mcfg to pci.c
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhaosl@gmail.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gY2YX9wCPeS

Hi Wei,

On 4/15/19 9:03 AM, Wei Yang wrote:
> Now we have two identical build_mcfg function.
> 
> Extract them to pci.c.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
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

Here you correctly added the copyright boilerplate, ...

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

But here you missed it :(

> +
> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
> +#endif
> 

With the same copyright notice in the header:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.
