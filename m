Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp431835wrx;
        Thu, 18 Apr 2019 02:43:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmIgFqGJDrFr+fD7LAJXBxqH9mXOv3fdR0nlzPL3ZC0S79phNPMoqGpHNTZgQ0/uysUnEC
X-Received: by 2002:a1c:6342:: with SMTP id x63mr2394654wmb.58.1555580603279;
        Thu, 18 Apr 2019 02:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555580603; cv=none;
        d=google.com; s=arc-20160816;
        b=s04WVy/k3GKZBtWmWe1QQEkjwuU6oYKzgtjYKeQX11L3U7/n8sERFQn0rC17iCnNCh
         H3FtFlkKMKptpJHOg2IztHVzQIwntVvo3rttUPeYD/WSV2lxGcDq0HvcTtqdCv4nuRq0
         wH+yl1/zPXOVgVSNdblC2E5BXx8PhDVP13T3gzD+4u4WS/uyVM5KdN5NDZkZa6dE38IF
         il45Wa130A9oTfaLsv8nMpvIP14Bg43wwOntKOpMRCopiMusnuImPE6knIEVIY+Dh+go
         KalCrFr85EIksny8HjYpRWgAyzvazPhrBzmhlegZAVZDCIJw+bxyNpfz88b5B0xoVi6J
         CAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=i8fsM2pocJS3CBTCYXSSqtT03aG7zyt/JRyXWAP0mcU=;
        b=IsbTGIubSeJWHpv4x8bfURSG5/dePYNeGoSz4vBanEV2UEzsW6sm3c16pxoCw8HCa6
         5O3IyH34LzK64T5TXpZnVbYgcjApcy6H8rdjn285efKSm94qRblEmN5pKqWtHjWSHL1l
         KjUltDysCbwu1PXkanhpejvBtlXM+iYT4xgMaZhPia9QYmxfzwaeCjB7u8eClD8DPzgM
         9d61VTkF3UvvzoiWNPURR+quDS+jAnahJ+2ZLrmSxn9EXX8InVvh6KG2DDWZPPz/CqNZ
         7mCDNJrHAjBvwkWPqPc3CTtUlUlL+IAzteqdRAVVzn/i1LFTx0Ku7aOKZvQ2QkxJBZ5C
         BI7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si1145105wmh.112.2019.04.18.02.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 02:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hH3Zi-0007W0-Af
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 05:43:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hH3Yz-00079z-AT
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 05:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hH3Yy-0006XC-1u
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 05:42:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hH3Yx-0006Wa-QK; Thu, 18 Apr 2019 05:42:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CF923001C90;
	Thu, 18 Apr 2019 09:42:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71A98608C7;
	Thu, 18 Apr 2019 09:42:25 +0000 (UTC)
Date: Thu, 18 Apr 2019 11:42:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190418114224.5e1ea137@redhat.com>
In-Reply-To: <20190417014038.26018-5-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
	<20190417014038.26018-5-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Apr 2019 09:42:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 4/6] hw/arm/virt-acpi-build: pass
 AcpiMcfgInfo to build_mcfg()
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
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: do6TXmD7+uIS

On Wed, 17 Apr 2019 09:40:36 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> To build MCFG, two information is necessary:
>=20
>     * bus number
>     * base address
>=20
> Abstract these two information to AcpiMcfgInfo so that build_mcfg and
> build_mcfg_q35 will have the same declaration.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> ---
> v3:
>   * move AcpiMcfgInfo to pci.h
> v2:
>   * for arm platform, construct a AcpiMcfgInfo directly
> ---
>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
>  hw/i386/acpi-build.c     |  6 +-----
>  include/hw/acpi/pci.h    | 33 +++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 12 deletions(-)
>  create mode 100644 include/hw/acpi/pci.h
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e09e7eff8d..ebddcde596 100644
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
> @@ -546,21 +547,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, =
VirtMachineState *vms)
>  }
> =20
>  static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
>      AcpiTableMcfg *mcfg;
> -    const MemMapEntry *memmap =3D vms->memmap;
> -    int ecam_id =3D VIRT_ECAM_ID(vms->highmem_ecam);
>      int len =3D sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> =20
>      mcfg =3D acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address =3D cpu_to_le64(memmap[ecam_id].base);
> +    mcfg->allocation[0].address =3D cpu_to_le64(info->base);
> =20
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment =3D cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number =3D 0;
> -    mcfg->allocation[0].end_bus_number =3D
> -        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
> +    mcfg->allocation[0].end_bus_number =3D PCIE_MMCFG_BUS(info->size - 1=
);
> =20
>      build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL,=
 NULL);
>  }
> @@ -801,7 +799,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuil=
dTables *tables)
>      build_gtdt(tables_blob, tables->linker, vms);
> =20
>      acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, vms);
> +    {
> +        AcpiMcfgInfo mcfg =3D {
> +           .base =3D vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
> +           .size =3D vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg);
> +    }
> =20
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f0d27bffd6..c2de7f4b01 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -58,6 +58,7 @@
> =20
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/pci.h"
> =20
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -86,11 +87,6 @@
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
> =20
> -typedef struct AcpiMcfgInfo {
> -    uint64_t base;
> -    uint32_t size;
> -} AcpiMcfgInfo;
> -
>  typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> new file mode 100644
> index 0000000000..124af7d32a
> --- /dev/null
> +++ b/include/hw/acpi/pci.h
> @@ -0,0 +1,33 @@
> +/*
> + * Support for generating PCI related ACPI tables and passing them to Gu=
ests
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
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef HW_ACPI_PCI_H
> +#define HW_ACPI_PCI_H
> +
> +typedef struct AcpiMcfgInfo {
> +    uint64_t base;
> +    uint32_t size;
> +} AcpiMcfgInfo;
> +
> +#endif

