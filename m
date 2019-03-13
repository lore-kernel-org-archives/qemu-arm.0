Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1824220wrs;
        Wed, 13 Mar 2019 09:10:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBx11rBh224ew5SfAyL/P+bgGofKHGgkvxc2eeUBxEXkqjkLQXnhzQuu6NtxYzj7FTsFo0
X-Received: by 2002:a81:5b84:: with SMTP id p126mr34455789ywb.215.1552493403823;
        Wed, 13 Mar 2019 09:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552493403; cv=none;
        d=google.com; s=arc-20160816;
        b=r6ejka2HH/fta62QTgeZdEewEJ/seL50OOlw4USsDhIQHcTbPr1g+VEzkU97lvQUpD
         /0RTT0WTKkLM62jnB7NKGj7K4ejIOkvmvlK8zBmnFUsxbCDCGBixHrgcRBPR4ZjFq0et
         Lg4roEiQgrWQQAdzIAHtiLY94LTAiwpGNW4aYx78gtrXjvXhxLsU6zYhtiWrZG3LgGH2
         MdGW0Q5e1GPMyyuR/OhzOwk+VLBVEMDkQOoQkAKhXT8Rj+9vaQsLVZgwNuY1LIgrllfu
         L1IHHJWYv9NcyhXpnC63C2F00xHGIxQ7mTrVtBbt46H1GRkCMS7TpghoTSGWzOErRgVO
         sjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=IiQxNxHFUto5Na+6M2KWJYk/clOSYyeBCSLi5DbXjzU=;
        b=mFkdzsx0VULWHg5sNY9O+Szy564jK+PgDMmVmqKnxYkd0aObbLsSKjDudw8//g8UlH
         USf9Orr2j4WEh4RjrTB1MhQLMSUlK1wSK3I+D90rwPqBd1SPki2lyrB5PgwOxjZgChdG
         FicN0JcC4azPZWdPHS2GjiEiD4mCDlviWWXW8T5kVmd3ThdQKvz5NgyNUrpSLBHzuyIJ
         vv7HyacjQz5XIoGxjPYKDNvXefzdKikWkzjyBSb2UzwEPY8BHo+qBjmWB0DfC5zPekKP
         x1xWqVcyMU2yIgWNZ52e4UV5OV1bqVLAJG66pnn39Fm7eS8PFu3XE87Ysp4cV1LTDsQf
         FBxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si4393575ybk.146.2019.03.13.09.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 09:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h46SA-0001FU-99
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 12:10:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h46S1-0001F3-KC
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h46Rz-0005v6-Uc
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:09:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h46Rz-0005tK-Fa; Wed, 13 Mar 2019 12:09:51 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32D55F3FD8;
	Wed, 13 Mar 2019 16:09:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88E9F282CA;
	Wed, 13 Mar 2019 16:09:45 +0000 (UTC)
Date: Wed, 13 Mar 2019 17:09:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20190313170943.5384f5cf@redhat.com>
In-Reply-To: <20190313133359.h2njohyijgvkcbtv@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 13 Mar 2019 16:09:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract
 build_mcfg
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOygjCgl67p4

On Wed, 13 Mar 2019 13:33:59 +0000
Wei Yang <richard.weiyang@gmail.com> wrote:

> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:
> >On Wed, 13 Mar 2019 12:42:53 +0800
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >  
> >> Now we have two identical build_mcfg function.
> >> 
> >> Extract them to aml-build.c.
> >> 
> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >> ---
> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
> >>  hw/i386/acpi-build.c        | 31 +------------------------------
> >>  include/hw/acpi/aml-build.h |  1 +
> >>  4 files changed, 32 insertions(+), 46 deletions(-)
> >> 
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index 555c24f21d..58d3b8f31d 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c  
> >
> >I don't like polluting aml-build.c with PCI stuff,
> >we have a lot of PCI related code that needs generalizing
> >lets create a new file for that, something like
> >hw/acpi/pci.c + include/hw/acpi/pci.h
> >  
> >> @@ -25,6 +25,7 @@
> >>  #include "qemu/bswap.h"
> >>  #include "qemu/bitops.h"
> >>  #include "sysemu/numa.h"
> >> +#include "hw/pci/pcie_host.h"
> >>  
> >>  static GArray *build_alloc_array(void)
> >>  {
> >> @@ -1870,3 +1871,32 @@ build_hdr:
> >>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> >>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> >>  }
> >> +
> >> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> >> +{
> >> +    AcpiTableMcfg *mcfg;
> >> +    const char *sig;
> >> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> >> +
> >> +    mcfg = acpi_data_push(table_data, len);
> >> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> >> +    /* Only a single allocation so no need to play with segments */
> >> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> >> +    mcfg->allocation[0].start_bus_number = 0;
> >> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);  
> >  
> >> +    /*
> >> +     * MCFG is used for ECAM which can be enabled or disabled by guest.
> >> +     * To avoid table size changes (which create migration issues),
> >> +     * always create the table even if there are no allocations,
> >> +     * but set the signature to a reserved value in this case.
> >> +     * ACPI spec requires OSPMs to ignore such tables.
> >> +     */
> >> +    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> >> +        /* Reserved signature: ignored by OSPM */
> >> +        sig = "QEMU";
> >> +    } else {
> >> +        sig = "MCFG";
> >> +    }  
> >I'd leave these hack at acpi-build.c, just push it up call chain.  
> 
> Assign sig in acpi-build.c and pass it to build_mcfg()?
nope, see more below

 
> >More over we don't really need it since resizeable memory region was introduced.
> >
> >So we need to keep table_blob size only for legacy usecase (pre resizable)
> >and for that just padding table_blob on required size would be sufficient,
> >there is no need to create dummy QEMU table.
> >As for newer machines (since resizeable memory region) we don't need to
> >do even that i.e. just skip table generation altogether if guest disabled it.
> >  
> 
> I am lost at this place.
> 
> sig is a part of ACPI table header, you mean the sig is not necessary to
> be set in ACPI table header?
> 
> "skip table generation" means remove build_header() in build_mcfg()?
I mean do not call build_mcfg() at all when you don't have to.

And when you need to keep table_blob the same size (for old machines)
using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
might just work as well. it's still hack but it can live in x86 specific
acpi_build() keeping build_mcfg() generic.

As for defining what to use as criteria to decide when we need to keep
table_blob size the same, I don't remember history of it, so I'd suggest
to look at commit a1666142, study history of acpi_ram_update() and
legacy_acpi_table_size to figure out since which machine type one doesn't
have to keep table_blob size the same.


> 
> >> +    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
> >> +}
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index ae7858a79a..92d8fccb00 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -557,22 +557,6 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
> >>      return true;
> >>  }
> >>  
> >> -static void
> >> -build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> >> -{
> >> -    AcpiTableMcfg *mcfg;
> >> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> >> -
> >> -    mcfg = acpi_data_push(table_data, len);
> >> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> >> -    /* Only a single allocation so no need to play with segments */
> >> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> >> -    mcfg->allocation[0].start_bus_number = 0;
> >> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
> >> -
> >> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> >> -}
> >> -
> >>  /* GTDT */
> >>  static void
> >>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index c5b1c3be99..b537a39d42 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -2392,35 +2392,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
> >>                   table_data->len - srat_start, 1, NULL, NULL);
> >>  }
> >>  
> >> -static void
> >> -build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> >> -{
> >> -    AcpiTableMcfg *mcfg;
> >> -    const char *sig;
> >> -    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
> >> -
> >> -    mcfg = acpi_data_push(table_data, len);
> >> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> >> -    /* Only a single allocation so no need to play with segments */
> >> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> >> -    mcfg->allocation[0].start_bus_number = 0;
> >> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
> >> -
> >> -    /* MCFG is used for ECAM which can be enabled or disabled by guest.
> >> -     * To avoid table size changes (which create migration issues),
> >> -     * always create the table even if there are no allocations,
> >> -     * but set the signature to a reserved value in this case.
> >> -     * ACPI spec requires OSPMs to ignore such tables.
> >> -     */
> >> -    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> >> -        /* Reserved signature: ignored by OSPM */
> >> -        sig = "QEMU";
> >> -    } else {
> >> -        sig = "MCFG";
> >> -    }
> >> -    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
> >> -}
> >> -
> >>  /*
> >>   * VT-d spec 8.1 DMA Remapping Reporting Structure
> >>   * (version Oct. 2014 or later)
> >> @@ -2687,7 +2658,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >>      }
> >>      if (acpi_get_mcfg(&mcfg)) {
> >>          acpi_add_table(table_offsets, tables_blob);
> >> -        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
> >> +        build_mcfg(tables_blob, tables->linker, &mcfg);
> >>      }
> >>      if (x86_iommu_get_default()) {
> >>          IommuType IOMMUType = x86_iommu_get_type();
> >> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> >> index b63b85d67c..8f2ea3679f 100644
> >> --- a/include/hw/acpi/aml-build.h
> >> +++ b/include/hw/acpi/aml-build.h
> >> @@ -423,4 +423,5 @@ void build_slit(GArray *table_data, BIOSLinker *linker);
> >>  
> >>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >>                  const char *oem_id, const char *oem_table_id);
> >> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
> >>  #endif  
> >  
> 

