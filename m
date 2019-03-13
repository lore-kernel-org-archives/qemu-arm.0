Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1653960wrs;
        Wed, 13 Mar 2019 06:29:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/lTBiaxZLvAjToNNaBGUW1jQSFk3R1BpyzmtCMfArZc7MyiXvYS012756HzbAOLrcRDcY
X-Received: by 2002:a81:7ad7:: with SMTP id v206mr19425967ywc.342.1552483782973;
        Wed, 13 Mar 2019 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552483782; cv=none;
        d=google.com; s=arc-20160816;
        b=GO6fU9+Lr9sM8IbIzb0cazLKfbzi3q9dvkwKmKgKSvHYcfcAxHn/KSkGLjwjv2p27K
         KMWp56kaw0Aiz4PACk8tvGf90EHBY/2XyEEtjjDdvZYQqk/3GEpfeKPcFHZNa7xKBwc2
         v4Mayekt+i3COJvr/P3LG6JA+m4SvnQgcFtyHovjDfNv/6stqNql5l2qXtEHrmj7csXb
         8HYTMXqKRlPln0StilME6J39uDvRBMx3j9MxwZATgqf7mMkdjdTpd+UBGBtwDQU8PkUm
         URcSCoErf6hcurfQ0E+xgtSRfxqC6hinzm8Fg9gzbTj0KkmRVNThFFHH7054FytsbvA8
         oZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=I1kF3bJmDMi/UvfzM9n0IxL4PkOw1qCuNm5XjC241mM=;
        b=XCfl/kpUtN+R172ufeOldaJ+8YarL3S305r3iCQS7MlaABwOk6nFNos02a9XrsXksv
         vXDO4Z0DUMZz++AwNPSNcQpYoH75sarMwzpjW7HAjAAEXjUu89LwuOxI+xMLDRATMqqo
         ZISmqA8KwDr+kqGO4s039bKEUGmAz1KozKA/Qq30BK4S1dQ+iuloUDrTQURnlF1yks9R
         ZxrvugH7bSBM7qeWV69GVcNF1n9WzrJ/zjNaPajwo3WrQGPVDAhsbg/R3PypA4mRAn85
         cfiKZ60+s8PfgI5VDeJCX5aJACw8LJAls24ebbjbB0v/spFI/SpgjSAkoyvHIqR8zxOL
         DyVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q6m+Z5Gy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124si6777377ywf.460.2019.03.13.06.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q6m+Z5Gy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h43x0-00059U-70
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:29:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h43wT-00054P-Hw
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h43u0-0001z5-HV
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:26:39 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:42010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h43u0-0001yU-0M; Wed, 13 Mar 2019 09:26:36 -0400
Received: by mail-ed1-x542.google.com with SMTP id j89so1494949edb.9;
	Wed, 13 Mar 2019 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I1kF3bJmDMi/UvfzM9n0IxL4PkOw1qCuNm5XjC241mM=;
	b=Q6m+Z5Gye4usX9b3jljD1trtMpxaOiGHn04gL9+P7j7lU3cRGok4P+CKFNkQyL9Fe7
	jxAVLzmM5pYFKwftCY/CDpj6E2mI+gDY5dyPBRaJX/MJ6NQLGshRJ8ZFDKePBmgmAKeA
	/uieh98dwgzSmDG8UEUakOm8hF5K4TTVCNaauSyoSHtBI9c6weFQpSrSdZsyjBc/euss
	E+fXPKSF4bLZPaMcDzXPdl9kUBcsp10TsfkM9F/lji598cOZ/p8Hv3nts4MYiU/qlQu8
	ObC5nD+5RG54eXRHg9ZHAfa4zpZ4s1bW1huTZySkc53o5da18OI76zNORFGMwL8exfb7
	u3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I1kF3bJmDMi/UvfzM9n0IxL4PkOw1qCuNm5XjC241mM=;
	b=oQERodD98J7UAnqhf+HWnN/+FddzJAlmYh5VJVborySVR26lbkjWKFsscTLd4kAKcW
	q5KXrRSAFgLYo4Q4NKPZrm91nc0TmTYVVGhXlY62nurkwo1l0Y17Gjp3uLRgj0F2I/rR
	ObjNjc9vfY06inFS5YLk3NQSrCkx1G1cNhgwFqmsQOwDTjp3xLmMunbGFvlLrWypi9R0
	qUHflc0B3sJy7+ZF6e2TAmp/d+rp25aPalNT0w70K7XVB6FE9kXCA76kKxvxXKc/7ZQo
	w0sl+JMaoSU9u95Cyf6G6Xw2POl8hCnTKEcNtQPaIJ8ALAA7KQvpl8dQWAazPWZZB8IZ
	n1Wg==
X-Gm-Message-State: APjAAAUkptUslGylFLoodUlHGPwVjQ/+nh69yS4m49jYiPlLUtScHgnr
	Erxk/NwomM4q6/2nDZ/IHm0=
X-Received: by 2002:a17:906:c406:: with SMTP id
	u6mr28827344ejz.95.1552483593508; 
	Wed, 13 Mar 2019 06:26:33 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id z39sm586101edc.96.2019.03.13.06.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 06:26:32 -0700 (PDT)
Date: Wed, 13 Mar 2019 13:26:32 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190313132632.5as5r6ljuc27vdab@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-2-richardw.yang@linux.intel.com>
	<20190313130022.34105087@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313130022.34105087@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [RFC PATCH 1/3] hw/arm/virt-acpi-build: use
 acpi_get_mcfg() to calculate bus number
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tH/1zQaRwB3l

On Wed, Mar 13, 2019 at 01:00:22PM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 12:42:51 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> To build MCFG, two information is necessary:
>> 
>>     * bus number
>>     * base address
>> 
>> Abstract these two information to AcpiMcfgInfo so that build_mcfg and
>> build_mcfg_q35 will have the same declaration.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/arm/virt-acpi-build.c    | 28 ++++++++++++++++++++--------
>>  hw/i386/acpi-build.c        |  5 -----
>>  include/hw/acpi/aml-build.h |  5 +++++
>>  3 files changed, 25 insertions(+), 13 deletions(-)
>> 
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 57679a89bf..7713c2d809 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -545,23 +545,32 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>>  }
>>  
>> -static void
>> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> +static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>>  {
>> -    AcpiTableMcfg *mcfg;
>> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
>>      const MemMapEntry *memmap = vms->memmap;
>>      int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>> +
>> +    mcfg->mcfg_base = memmap[ecam_id].base;
>> +    mcfg->mcfg_size = memmap[ecam_id].size;
>> +
>> +    return true;
>> +}
>> +
>> +static void
>> +build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> +{
>> +    AcpiTableMcfg *mcfg;
>>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>>      int mcfg_start = table_data->len;
>>  
>>      mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
>> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>>  
>>      /* Only a single allocation so no need to play with segments */
>>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>>      mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number =
>> -        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
>> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>>  
>>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>>                   "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>> @@ -779,6 +788,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>      GArray *table_offsets;
>>      unsigned dsdt, xsdt;
>> +    AcpiMcfgInfo mcfg;
>>      GArray *tables_blob = tables->table_data;
>>  
>>      table_offsets = g_array_new(false, true /* clear */,
>> @@ -802,8 +812,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_gtdt(tables_blob, tables->linker, vms);
>>  
>> -    acpi_add_table(table_offsets, tables_blob);
>> -    build_mcfg(tables_blob, tables->linker, vms);
>> +    if ( acpi_get_mcfg(&mcfg)) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_mcfg(tables_blob, tables->linker, &mcfg);
>> +    }
>
>acpi_get_mcfg used only once and always true so one doesn't need condition
>I'd go for simpler:
>
>diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>index d7e2e4885b..a28e04c249 100644
>--- a/hw/arm/virt-acpi-build.c
>+++ b/hw/arm/virt-acpi-build.c
>@@ -803,8 +803,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>     build_gtdt(tables_blob, tables->linker, vms);
> 
>     acpi_add_table(table_offsets, tables_blob);
>-    build_mcfg(tables_blob, tables->linker, vms);
>-
>+    {
>+        const AcpiTableMcfg mcfg = {
>+           .mcfg_base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base;
>+           .mcfg_size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size;
>+        };
>+        build_mcfg(tables_blob, tables->linker, &mcfg);
>+    }
>     acpi_add_table(table_offsets, tables_blob);
>     build_spcr(tables_blob, tables->linker, vms);
>
>and get rid of acpi_get_mcfg() helper function
>

That's reasonable.

>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 9ecc96dcc7..c5b1c3be99 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -86,11 +86,6 @@
>>  /* Default IOAPIC ID */
>>  #define ACPI_BUILD_IOAPIC_ID 0x0
>>  
>> -typedef struct AcpiMcfgInfo {
>> -    uint64_t mcfg_base;
>> -    uint32_t mcfg_size;
>> -} AcpiMcfgInfo;
>> -
>>  typedef struct AcpiPmInfo {
>>      bool s3_disabled;
>>      bool s4_disabled;
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 1a563ad756..b63b85d67c 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -223,6 +223,11 @@ struct AcpiBuildTables {
>>      BIOSLinker *linker;
>>  } AcpiBuildTables;
>>  
>> +typedef struct AcpiMcfgInfo {
>> +    uint64_t mcfg_base;
>> +    uint32_t mcfg_size;
>mcfg_ prefix in fields probably isn't necessary.
>

Hmm... I may split this to another patch to address.

>> +} AcpiMcfgInfo;
>> +
>>  /**
>>   * init_aml_allocator:
>>   *
>

-- 
Wei Yang
Help you, Help me
