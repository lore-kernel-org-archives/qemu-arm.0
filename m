Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp138231wro;
        Wed, 13 Mar 2019 14:36:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwH2Ho58ptRWRYqMK1xy9gTKH9AB9+F8LYjS85QYxAxIaAZRgERSZKQe870l2Edr98Dc9tv
X-Received: by 2002:a25:2388:: with SMTP id j130mr38719487ybj.103.1552512965024;
        Wed, 13 Mar 2019 14:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552512965; cv=none;
        d=google.com; s=arc-20160816;
        b=fRkuHv9AOA3O5KCcAi0+tf/k+hIlYkqhb+BQQxkg2T55jr2eEH6PmlczHqMgqoXEM1
         kgQBtAy5GvpXiraQmyzMRuOnWZ5WyeuG1RCpjJJgzT0g0KnfJA3ekloz4DLqk0KPB50H
         MA/QDop7P1ei+xTO1uE/u4SQTRFGDNNoERPnNDRbsLsV00lll39333ZMeKOvLLNeI7Lu
         9AAZw8ZVu6dCG4FyEb1uPTPHhC2h4bVki2HB+pYD01M9FcBQxc9c/M2y9haAFNKita/A
         4uv+AcyM+G7Kax1mM7F9lF19w5BmZH5mFEGhMeZ0m8IrnLzWDasUgOtW6P6anEbcVCoP
         sCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=KMOQfajTdWe9gJVIe2PxpN/i5ksE3CVRXLcJuNUlEZw=;
        b=Ej9Wmr2ScGaN5HtXSXw65ChGtcgxeulCykDig10TD623yWKHLg7z3b4s//n9KdYByT
         vv8c0d2umjcctZ7LzJ/62rOlFqKjkhaaTA4Z0wP2bBY/psGEcGGmUArGgoQ5mx43nPcA
         DRgToKFjNKZ+r53mJ/Uymc1uotSUPo0Z/+g4UIG4OfQdRH7RSmN0ulPG+pWa49/k01VK
         C1OEKndai69MfWukBRKV92oVwPjYI0WY5gdmdbVzcXL0PO5DlxUSQmn7fH38eQ6ulIqq
         ZPDo79x8ZPuN+eRksBnPQzWl2RE7mINM2nk4gXrBp3PUAT9iHNX7tFexg1xFfpSoB9LN
         QQtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Wl0EiaU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si7724468ywc.327.2019.03.13.14.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 14:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Wl0EiaU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:51264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4BXg-0007ov-ET
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 17:36:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4BXO-0007lW-3i
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 17:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4BTS-0005V6-Bm
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 17:31:43 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h4BTQ-0005SW-VW; Wed, 13 Mar 2019 17:31:41 -0400
Received: by mail-ed1-x542.google.com with SMTP id n14so2833799edv.8;
	Wed, 13 Mar 2019 14:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KMOQfajTdWe9gJVIe2PxpN/i5ksE3CVRXLcJuNUlEZw=;
	b=Wl0EiaU5eIrZ+YXvpj5NzqgP4CtLW3FmTWELz8yfqLDikgEkJGLdQJ4bBE9k/OZ+8t
	muctnvPHE8i4Fcu8Ene3Y5j9Aj0oAYdcPk4e8M57IbYMX0gE74fwgkzw5lUeyRyZGD2r
	dJqL3UC6mtqX6Hy0KlmBZlLeKvyA1nkP0EC4e4TohhypHmpaMnnVeCvFuwDgInEdPEqX
	OBYtudF2oJ37qdyXFgxT2d+5qWyeV3Kg24Poxv/+j73vpCVzUAyBRHZt3UQnxNqw5JaL
	oL7TsvN+ArLeEpzaAw+wYz+PM9gccay6yFKla6AAkXmg79FRSk7X8E6Wyju3Jp1nIcgu
	HwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KMOQfajTdWe9gJVIe2PxpN/i5ksE3CVRXLcJuNUlEZw=;
	b=SROEZbdYm5pqLMcaPWvN92T38+QOKyz7zHxExjkqrtt3ExasU/gxSUkR2zvZUlk4RN
	V/1Yb8xLIWBeN5ppCLFozzb2iL7WnZ+cjC38wFaB6LTISkac6H7Mg5KTjATDlsv0BZrX
	6wF9o/8MkRNjN4KqKb7ZgAg3bdtc7ciEWKPSiKwoi6rqdGkdYOPO+EJ81TiHObw59EB+
	7X9N7SO99+AE4cpLGRLUDwyRERQt+z45YhKRV6tisvRR31ET3ndU74uTHxa/bnZXgu+w
	ciAWgyAdJTKna7xMRhXLYvh2irC1LeIa8UYdhFADtrW6LPBm94MV2ggTk4LGzCwisRz1
	kgcQ==
X-Gm-Message-State: APjAAAXkQSXRRiKoPMGOkfzu6Bo1RQd0fO5AjoVYUVR69sTXRm8Lcr6F
	3/jZXOor70xBlv+x/bkl44Y=
X-Received: by 2002:a17:906:590c:: with SMTP id
	h12mr11561099ejq.69.1552512699287; 
	Wed, 13 Mar 2019 14:31:39 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id e1sm863826edn.22.2019.03.13.14.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 14:31:38 -0700 (PDT)
Date: Wed, 13 Mar 2019 21:31:37 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190313213137.acncaz7duosjybnf@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313170943.5384f5cf@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
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
X-TUID: F0emhQhhwde5

On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 13:33:59 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:
>> >On Wed, 13 Mar 2019 12:42:53 +0800
>> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >  
>> >> Now we have two identical build_mcfg function.
>> >> 
>> >> Extract them to aml-build.c.
>> >> 
>> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> ---
>> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
>> >>  hw/i386/acpi-build.c        | 31 +------------------------------
>> >>  include/hw/acpi/aml-build.h |  1 +
>> >>  4 files changed, 32 insertions(+), 46 deletions(-)
>> >> 
>> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> >> index 555c24f21d..58d3b8f31d 100644
>> >> --- a/hw/acpi/aml-build.c
>> >> +++ b/hw/acpi/aml-build.c  
>> >
>> >I don't like polluting aml-build.c with PCI stuff,
>> >we have a lot of PCI related code that needs generalizing
>> >lets create a new file for that, something like
>> >hw/acpi/pci.c + include/hw/acpi/pci.h
>> >  
>> >> @@ -25,6 +25,7 @@
>> >>  #include "qemu/bswap.h"
>> >>  #include "qemu/bitops.h"
>> >>  #include "sysemu/numa.h"
>> >> +#include "hw/pci/pcie_host.h"
>> >>  
>> >>  static GArray *build_alloc_array(void)
>> >>  {
>> >> @@ -1870,3 +1871,32 @@ build_hdr:
>> >>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
>> >>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>> >>  }
>> >> +
>> >> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> >> +{
>> >> +    AcpiTableMcfg *mcfg;
>> >> +    const char *sig;
>> >> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> >> +
>> >> +    mcfg = acpi_data_push(table_data, len);
>> >> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>> >> +    /* Only a single allocation so no need to play with segments */
>> >> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> >> +    mcfg->allocation[0].start_bus_number = 0;
>> >> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);  
>> >  
>> >> +    /*
>> >> +     * MCFG is used for ECAM which can be enabled or disabled by guest.
>> >> +     * To avoid table size changes (which create migration issues),
>> >> +     * always create the table even if there are no allocations,
>> >> +     * but set the signature to a reserved value in this case.
>> >> +     * ACPI spec requires OSPMs to ignore such tables.
>> >> +     */
>> >> +    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
>> >> +        /* Reserved signature: ignored by OSPM */
>> >> +        sig = "QEMU";
>> >> +    } else {
>> >> +        sig = "MCFG";
>> >> +    }  
>> >I'd leave these hack at acpi-build.c, just push it up call chain.  
>> 
>> Assign sig in acpi-build.c and pass it to build_mcfg()?
>nope, see more below
>
> 
>> >More over we don't really need it since resizeable memory region was introduced.
>> >
>> >So we need to keep table_blob size only for legacy usecase (pre resizable)
>> >and for that just padding table_blob on required size would be sufficient,
>> >there is no need to create dummy QEMU table.
>> >As for newer machines (since resizeable memory region) we don't need to
>> >do even that i.e. just skip table generation altogether if guest disabled it.
>> >  
>> 
>> I am lost at this place.
>> 
>> sig is a part of ACPI table header, you mean the sig is not necessary to
>> be set in ACPI table header?
>> 
>> "skip table generation" means remove build_header() in build_mcfg()?
>I mean do not call build_mcfg() at all when you don't have to.
>
>And when you need to keep table_blob the same size (for old machines)
>using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
>might just work as well. it's still hack but it can live in x86 specific
>acpi_build() keeping build_mcfg() generic.
>

Seems got your idea.

>As for defining what to use as criteria to decide when we need to keep
>table_blob size the same, I don't remember history of it, so I'd suggest
>to look at commit a1666142, study history of acpi_ram_update() and
>legacy_acpi_table_size to figure out since which machine type one doesn't
>have to keep table_blob size the same.
>

OK, let me study the history first.

BTW, the legacy here is hardware specification level or qemu software
design level?

-- 
Wei Yang
Help you, Help me
