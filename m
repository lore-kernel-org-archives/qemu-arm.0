Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp746082wro;
        Thu, 14 Mar 2019 04:54:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymp8ICSx2QAae+2WElvJA35nZTdTRMoh7T6PnZOcKMYmbOXMABF7M/HhXZ12smRv9mv+ip
X-Received: by 2002:a81:5d55:: with SMTP id r82mr36737399ywb.213.1552564496313;
        Thu, 14 Mar 2019 04:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552564496; cv=none;
        d=google.com; s=arc-20160816;
        b=WERHz832ijZ2uhG7oMAIf6Ld4RBJ8zk2b1p+KiG30VdPnbpK7il2J93D0nnFHaFu6q
         OfxZgWj4Y4KPcCQ1Xp8JsfsVnN6A685RlN0dipuNKD3G4IIAthRH71lHPdvvPNUJEMJC
         SRq5tVkVE3gvQBHLSCmdkZgk6DiJBHS+lLzuNcbO34mkZ2lcMm7kqzadVWf6n7fxCFQq
         UR9xPFozqDv42RNLP3v+PLHDBV1HNPbnWJx4bbtF8lJeGYgaJas8pWauJxpLKyugxrY6
         6XBaIMCmHQWpotkeSKPTfrrMRjCgwjjWXUK/0CZgg2q1HvoSYV4bGBjab9czVhrjw8uq
         MkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=pMDhj56cul8ZEaobcb4ARXE6mLrQQpCIm/4gjab4UNc=;
        b=wT9g2COcrmt118G4OcuN0pN1xjejW7qU1aJEnwrP6sLTEDk2Su1LCioe/3DyGJPBo7
         F3uHFwfiDPtzth5BajB9zvFlf/qOz71D5aBv8s0311er8q1+oW8JsG0geuJoQma5m/O0
         brUbyRUzlwk8BJq1/QFsUEbATI9x3Xz7uMTQOUETshP6L0FwAuyioeWBa/z2LK1ir7QX
         KPOi7BoBwr5z2q874dgZvZXLh+nnj42BEkfaqGXffMfJyjiTXcS23cQwXD8a8y742z1l
         PQmbS/5RN5zEuwvLdRriZv5xf59rN2KzOVcTySx3ItJK2Y0u4nbT7b0TAiVy3Z9tN6Iq
         CIrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z8Vev/Fz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q125si8673337ywd.414.2019.03.14.04.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 04:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z8Vev/Fz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:34914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Owp-00069b-Oo
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 07:54:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4OwZ-00066y-Ji
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4OwY-0006gZ-IT
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:54:39 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:46854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h4OwU-0006cz-SJ; Thu, 14 Mar 2019 07:54:35 -0400
Received: by mail-ed1-x544.google.com with SMTP id n17so4325713edt.13;
	Thu, 14 Mar 2019 04:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pMDhj56cul8ZEaobcb4ARXE6mLrQQpCIm/4gjab4UNc=;
	b=Z8Vev/Fzs8WAfzsxuLk16qBrLgxpiSL75c8QcpwV9R4gKqdiq9IQE0SzxUeBogXgv3
	pPSUCptXEPQxasqYPNHdTMvHzd+7gnwC7ZZJTvYSyNBofHihwzpYvlr6KFjK83gxsOrU
	y9vYVNmv51di6XVnVrq5iBEh7L3vaGBWdZYcZ6LihezHmma9cCSWfg6QtGGIsQUKhAnY
	e3EYZcAwbrtX9VoGD9xVEtsfjXdBTZqqqGZjY+KPqPrC5H7VAJ+RSHFLN2DY5Nz457PD
	GBOu/XvSSazZ9ME3pIShVmlWxT9IiMZJ7lZJwQhjN8o0F73SQ0/XenyDRnrHS+1DyAR8
	SSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pMDhj56cul8ZEaobcb4ARXE6mLrQQpCIm/4gjab4UNc=;
	b=E+8rT7BXyStjtGwB6a8Ao7HL5RBjrDIloIo3EV9FQOl1Oa5ziw9XuhbjaWQSV1RSc6
	189PC6jkoA6E/kiGer+VHkbgBESjTsHXTAQo7JseEH/Y+1Yfy8Takqtbzao3wb24sFvA
	Ofg+CkuTVUArwKOqVmNJErfbRTwJT1ePjYPcAOFTSOReDFl5JN8B18mh9W0fotjGwSX2
	J1l1XtAsYV5qwsSnV5oefO1dyb03r7p84bONuL79OgysrhK8UQJPEcwxPblEQeldwtMg
	MBdXFY+9yu50FRALKXcEEaaCLGcUrYgw+MhhypHW3+1EgObvZQ0u/HOdRI/utPpiCf2X
	htYw==
X-Gm-Message-State: APjAAAW3rTahR6BGaZjlTD97lmWuMi0deZTopjQ9wj+cBbERbucwgEec
	yXS/N+oCt+n++vrSzFm6bHM=
X-Received: by 2002:a17:906:288d:: with SMTP id
	o13mr33123748ejd.66.1552564473257; 
	Thu, 14 Mar 2019 04:54:33 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	b46sm1415833edd.18.2019.03.14.04.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 04:54:32 -0700 (PDT)
Date: Thu, 14 Mar 2019 11:54:31 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190314115431.zila6x374tjfq3mv@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190313213137.acncaz7duosjybnf@master>
	<20190314101830.6e10d4d5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190314101830.6e10d4d5@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejiEoEmCEk1A

On Thu, Mar 14, 2019 at 10:18:30AM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 21:31:37 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
>> >On Wed, 13 Mar 2019 13:33:59 +0000
>> >Wei Yang <richard.weiyang@gmail.com> wrote:
>> >  
>> >> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:  
>> >> >On Wed, 13 Mar 2019 12:42:53 +0800
>> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >> >    
>> >> >> Now we have two identical build_mcfg function.
>> >> >> 
>> >> >> Extract them to aml-build.c.
>> >> >> 
>> >> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> >> ---
>> >> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>> >> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
>> >> >>  hw/i386/acpi-build.c        | 31 +------------------------------
>> >> >>  include/hw/acpi/aml-build.h |  1 +
>> >> >>  4 files changed, 32 insertions(+), 46 deletions(-)
>> >> >> 
>> >> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> >> >> index 555c24f21d..58d3b8f31d 100644
>> >> >> --- a/hw/acpi/aml-build.c
>> >> >> +++ b/hw/acpi/aml-build.c    
>> >> >
>> >> >I don't like polluting aml-build.c with PCI stuff,
>> >> >we have a lot of PCI related code that needs generalizing
>> >> >lets create a new file for that, something like
>> >> >hw/acpi/pci.c + include/hw/acpi/pci.h
>> >> >    
>> >> >> @@ -25,6 +25,7 @@
>> >> >>  #include "qemu/bswap.h"
>> >> >>  #include "qemu/bitops.h"
>> >> >>  #include "sysemu/numa.h"
>> >> >> +#include "hw/pci/pcie_host.h"
>> >> >>  
>> >> >>  static GArray *build_alloc_array(void)
>> >> >>  {
>> >> >> @@ -1870,3 +1871,32 @@ build_hdr:
>> >> >>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
>> >> >>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>> >> >>  }
>> >> >> +
>> >> >> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> >> >> +{
>> >> >> +    AcpiTableMcfg *mcfg;
>> >> >> +    const char *sig;
>> >> >> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> >> >> +
>> >> >> +    mcfg = acpi_data_push(table_data, len);
>> >> >> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>> >> >> +    /* Only a single allocation so no need to play with segments */
>> >> >> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> >> >> +    mcfg->allocation[0].start_bus_number = 0;
>> >> >> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);    
>> >> >    
>> >> >> +    /*
>> >> >> +     * MCFG is used for ECAM which can be enabled or disabled by guest.
>> >> >> +     * To avoid table size changes (which create migration issues),
>> >> >> +     * always create the table even if there are no allocations,
>> >> >> +     * but set the signature to a reserved value in this case.
>> >> >> +     * ACPI spec requires OSPMs to ignore such tables.
>> >> >> +     */
>> >> >> +    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
>> >> >> +        /* Reserved signature: ignored by OSPM */
>> >> >> +        sig = "QEMU";
>> >> >> +    } else {
>> >> >> +        sig = "MCFG";
>> >> >> +    }    
>> >> >I'd leave these hack at acpi-build.c, just push it up call chain.    
>> >> 
>> >> Assign sig in acpi-build.c and pass it to build_mcfg()?  
>> >nope, see more below
>> >
>> >   
>> >> >More over we don't really need it since resizeable memory region was introduced.
>> >> >
>> >> >So we need to keep table_blob size only for legacy usecase (pre resizable)
>> >> >and for that just padding table_blob on required size would be sufficient,
>> >> >there is no need to create dummy QEMU table.
>> >> >As for newer machines (since resizeable memory region) we don't need to
>> >> >do even that i.e. just skip table generation altogether if guest disabled it.
>> >> >    
>> >> 
>> >> I am lost at this place.
>> >> 
>> >> sig is a part of ACPI table header, you mean the sig is not necessary to
>> >> be set in ACPI table header?
>> >> 
>> >> "skip table generation" means remove build_header() in build_mcfg()?  
>> >I mean do not call build_mcfg() at all when you don't have to.
>> >
>> >And when you need to keep table_blob the same size (for old machines)
>> >using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
>> >might just work as well. it's still hack but it can live in x86 specific
>> >acpi_build() keeping build_mcfg() generic.
>> >  
>> 
>> Seems got your idea.
>> 
>> >As for defining what to use as criteria to decide when we need to keep
>> >table_blob size the same, I don't remember history of it, so I'd suggest
>> >to look at commit a1666142, study history of acpi_ram_update() and
>> >legacy_acpi_table_size to figure out since which machine type one doesn't
>> >have to keep table_blob size the same.
>> >  
>> 
>> OK, let me study the history first.
>> 
>> BTW, the legacy here is hardware specification level or qemu software
>> design level?
>it's QEMU only, you need to find a version of QEMU (machine type)
>which didn't have re-sizable MemoryRegion and the next version most likely
>would have a knob somewhere in machine class definition saying that we don't
>care about sizes anymore or care about sizes only for previous machine types.

Ok, let me find when we introduced re-sizable MemoryRegion.

Seems I still have some uncertain concepts. Let me discover it one by
one :-)

-- 
Wei Yang
Help you, Help me
