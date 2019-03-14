Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp618597wro;
        Thu, 14 Mar 2019 02:35:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyf9NnJ6/ARba3dVmlD80iFstpe/4cszWOvoYBTVE3ArRf2CtmgscHVeiObh+wXelDPASAG
X-Received: by 2002:a81:a7ca:: with SMTP id e193mr4722342ywh.410.1552556121502;
        Thu, 14 Mar 2019 02:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552556121; cv=none;
        d=google.com; s=arc-20160816;
        b=NRCc7s1MrZEXp+IguzVKrk8ccE2x3z7c1kSYdHMfomhjkcFZEAI2Cdo9gJkNc0rWjh
         X2Zb0QLueRoxE33IDPZJd/VKVPq8lD8DyPU/UC9bAPpR3DP/EePvXPEkCS2c673JENLa
         J3ZnsMqp2SahwW8lAPYTS9T3f69GvKYjD+6DYIntfnkQdc7+1YHOobjhyxwzI99snE9i
         j34NmT/qqx3bA+9Xwl4QV7vDQia9ichKYxXLDIU39MoAt9u95UqzgtpvMtDwxFqqXs0l
         nw8BfxLqVGyYv6j9uldKlbzxd17VLEgSecDBUQsY9/AJGPIswxjYZTSdaiBsPjaRdbM/
         XVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=+fP0hJjzivHpq7K6E+jNLd87ulErCt6g+L/OOT/aDkY=;
        b=nezi1L6mmr8RjHuMeoOIQydnz+pEKYmAfyW2Y7uPn/ck0PFxfK31EttZD98x+3oFYS
         PqhVFT7AIHdh5rzvxeGIb3MQX1TAMoVN+ky1hpWhQ98i9QfP+tnqLC9jXjhtLr7rP1ei
         CLkFB5htsxp/l3HmyZcnpJweCGr2x705B2Iijblp0qWYIFlyXBXDQqpDuy+g2lwnvI1D
         xUZ7VU8RmspBAPr1xS1/DMcQDyjRNQlxRoDhcmV59+A9cAWyUsos9oONdDe0js5hQBh3
         hIVL5ZBi3C07P5+/JE7CPryoTBEoq/tlf4bk3WN1J5Amurhn3X4bHUPR8OWFX6/KlYD9
         H+rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si8325362ywu.63.2019.03.14.02.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Mlk-0007X2-TZ
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:35:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4Mgb-00043U-Up
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 05:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4MVa-0003vH-2K
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 05:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h4MVY-0003u8-Lj; Thu, 14 Mar 2019 05:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 902BDC058CAD;
	Thu, 14 Mar 2019 09:18:35 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D003C4C4;
	Thu, 14 Mar 2019 09:18:31 +0000 (UTC)
Date: Thu, 14 Mar 2019 10:18:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20190314101830.6e10d4d5@redhat.com>
In-Reply-To: <20190313213137.acncaz7duosjybnf@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190313213137.acncaz7duosjybnf@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 14 Mar 2019 09:18:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract build_mcfg
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AH93S8ENZCN5

On Wed, 13 Mar 2019 21:31:37 +0000
Wei Yang <richard.weiyang@gmail.com> wrote:

> On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
> >On Wed, 13 Mar 2019 13:33:59 +0000
> >Wei Yang <richard.weiyang@gmail.com> wrote:
> >  
> >> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:  
> >> >On Wed, 13 Mar 2019 12:42:53 +0800
> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >> >    
> >> >> Now we have two identical build_mcfg function.
> >> >> 
> >> >> Extract them to aml-build.c.
> >> >> 
> >> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >> >> ---
> >> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
> >> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
> >> >>  hw/i386/acpi-build.c        | 31 +------------------------------
> >> >>  include/hw/acpi/aml-build.h |  1 +
> >> >>  4 files changed, 32 insertions(+), 46 deletions(-)
> >> >> 
> >> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> >> index 555c24f21d..58d3b8f31d 100644
> >> >> --- a/hw/acpi/aml-build.c
> >> >> +++ b/hw/acpi/aml-build.c    
> >> >
> >> >I don't like polluting aml-build.c with PCI stuff,
> >> >we have a lot of PCI related code that needs generalizing
> >> >lets create a new file for that, something like
> >> >hw/acpi/pci.c + include/hw/acpi/pci.h
> >> >    
> >> >> @@ -25,6 +25,7 @@
> >> >>  #include "qemu/bswap.h"
> >> >>  #include "qemu/bitops.h"
> >> >>  #include "sysemu/numa.h"
> >> >> +#include "hw/pci/pcie_host.h"
> >> >>  
> >> >>  static GArray *build_alloc_array(void)
> >> >>  {
> >> >> @@ -1870,3 +1871,32 @@ build_hdr:
> >> >>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> >> >>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> >> >>  }
> >> >> +
> >> >> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> >> >> +{
> >> >> +    AcpiTableMcfg *mcfg;
> >> >> +    const char *sig;
> >> >> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> >> >> +
> >> >> +    mcfg = acpi_data_push(table_data, len);
> >> >> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> >> >> +    /* Only a single allocation so no need to play with segments */
> >> >> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> >> >> +    mcfg->allocation[0].start_bus_number = 0;
> >> >> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);    
> >> >    
> >> >> +    /*
> >> >> +     * MCFG is used for ECAM which can be enabled or disabled by guest.
> >> >> +     * To avoid table size changes (which create migration issues),
> >> >> +     * always create the table even if there are no allocations,
> >> >> +     * but set the signature to a reserved value in this case.
> >> >> +     * ACPI spec requires OSPMs to ignore such tables.
> >> >> +     */
> >> >> +    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> >> >> +        /* Reserved signature: ignored by OSPM */
> >> >> +        sig = "QEMU";
> >> >> +    } else {
> >> >> +        sig = "MCFG";
> >> >> +    }    
> >> >I'd leave these hack at acpi-build.c, just push it up call chain.    
> >> 
> >> Assign sig in acpi-build.c and pass it to build_mcfg()?  
> >nope, see more below
> >
> >   
> >> >More over we don't really need it since resizeable memory region was introduced.
> >> >
> >> >So we need to keep table_blob size only for legacy usecase (pre resizable)
> >> >and for that just padding table_blob on required size would be sufficient,
> >> >there is no need to create dummy QEMU table.
> >> >As for newer machines (since resizeable memory region) we don't need to
> >> >do even that i.e. just skip table generation altogether if guest disabled it.
> >> >    
> >> 
> >> I am lost at this place.
> >> 
> >> sig is a part of ACPI table header, you mean the sig is not necessary to
> >> be set in ACPI table header?
> >> 
> >> "skip table generation" means remove build_header() in build_mcfg()?  
> >I mean do not call build_mcfg() at all when you don't have to.
> >
> >And when you need to keep table_blob the same size (for old machines)
> >using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
> >might just work as well. it's still hack but it can live in x86 specific
> >acpi_build() keeping build_mcfg() generic.
> >  
> 
> Seems got your idea.
> 
> >As for defining what to use as criteria to decide when we need to keep
> >table_blob size the same, I don't remember history of it, so I'd suggest
> >to look at commit a1666142, study history of acpi_ram_update() and
> >legacy_acpi_table_size to figure out since which machine type one doesn't
> >have to keep table_blob size the same.
> >  
> 
> OK, let me study the history first.
> 
> BTW, the legacy here is hardware specification level or qemu software
> design level?
it's QEMU only, you need to find a version of QEMU (machine type)
which didn't have re-sizable MemoryRegion and the next version most likely
would have a knob somewhere in machine class definition saying that we don't
care about sizes anymore or care about sizes only for previous machine types.
