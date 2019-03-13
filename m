Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1661239wrs;
        Wed, 13 Mar 2019 06:35:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRFSBDCJpdZA9+C0Z/PrsjanPNBqlsjJW/Ko9t7nl1ZITePZ02QCsIqaye7DgfXp1s7U15
X-Received: by 2002:a0d:ef42:: with SMTP id y63mr21055105ywe.26.1552484137114;
        Wed, 13 Mar 2019 06:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552484137; cv=none;
        d=google.com; s=arc-20160816;
        b=zJXWjT0ZJQNCm7dV4CADoyeJong3FyEwC7LW43koh1VLnrMSdh+++ssj1m2xfY1hPH
         LX/CaS0txSkiAoo9NmExnDLzMPTg0mokKvT1L8IwdCvM8FhclekZM0PMdoerSWCxndae
         YMrN3YSy8lrUqfvn6i9Dox80XqAS+zEwSH5EjyEBKD0x6dZWx3aZGTM52d9uV32qlpb4
         Huovkayu7Rj2jTaB0pdbKxPEouVY6IJbM2vrE5hhM0OsnA52HhVErIzZBnpWcWuVtxMN
         k/tQifvMS8Q1Yi7PevjawAADPC5K2kvXfTz626BUYKdnDh+eYdFTk4uUs9XboWQ0akYy
         JuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=g7NN5KGGm+rDMLIuE5xieGldkXQ3jZWBOD1dBDhbc/s=;
        b=1GLYEkDTqaPKriwT/1CQqOLm9HhdX3vfjHoaPZe7svrX+diEpxLlY9ccTCr17LP4Lm
         A0kteJdmcRXE4/2ptAJ69GhbkLeeqMyFPngIDgZBomBOrwAyg/+oH+g1OuWss2fPJywE
         V2slMPZXI8ApfQrbaN1zqVkFcMzR5qe9T/yUUB8BhaCK2jSe38Pf/X3xtT22yd0ype5U
         DRoPDifCQo6ki3zXdYDf/7u3CIiaZwBMVbo+GEpHgmXft3e6rRNcdsL4ZqZoazvvuURx
         0w5rwT6Z49ouMrd15BS1I8Cjh2aN4xkh6EhUOK4E8J1pZ3zAtJoC4Q7up4O4S7MrKCQe
         nvng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gtl8dzuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b134si6577496yba.51.2019.03.13.06.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gtl8dzuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h442i-0000wZ-GU
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:35:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h441D-0000RK-Pc
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h441C-0005Ry-IW
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 09:34:03 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:41246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h441C-0005RN-74; Wed, 13 Mar 2019 09:34:02 -0400
Received: by mail-ed1-x541.google.com with SMTP id n14so1518028edv.8;
	Wed, 13 Mar 2019 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=g7NN5KGGm+rDMLIuE5xieGldkXQ3jZWBOD1dBDhbc/s=;
	b=gtl8dzuo9sZvKadpY5xTGRmGkGqP0rug/H0Uv5TJU9DI4ORVLTz532lghyKqH1E20S
	9tzgzRZ6cpQ+CAqMXcYFWj85Cu7lF9P7H4hx6/1hc7OXBJ+xFmL+HUorINZ5F8soBqaO
	LMPZ+PmcDfFtFQdQPxdNXRnMtaPxXy5+oKCBUp77N6OVFGNl3nHftPDoPagj3JEglYWp
	H8OF0qe7OcRpf4YmXtgFnxHngu3AZeRYeWnkrshfwDcyC7qFw6NUOw4YNIM8IYeqnBci
	8XbmkzFFYyUR/TXPkdmohOjvNhPqSiH5vvXPWGDyG223AYNOquP5VJEmU7waHABEIq50
	GkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g7NN5KGGm+rDMLIuE5xieGldkXQ3jZWBOD1dBDhbc/s=;
	b=rjzGYIdrnTpLQhqbztUevtuPB5JZXvIXqgsMtp4ixNTX+VBGeuzi5o9VJrj10+WYkk
	kst0WEJe/hvYwRvMTk8iY6pogf/Aj78DXVLcDkrtHjn71IOVm7TXT+y8CDECdFdKkBfX
	OHIOaDw7dOJQOeOuB+xKM5zPxUNDWHvW/+29sOk6d+Yya0zFOwS3O6vKlTVlZsnmQORO
	B08aa1iwRjsArsX1YONijtMB6VHlHjLBsHACiAQtpGXg6jsuro8s20mT+oJAP2P39sZk
	vOXSjMKGC24YPdnQElaTOF6A3EpIDA1b5W1+Jxfod0sC2EaoI8lJrGk1BqspVHDdxBV5
	UEnQ==
X-Gm-Message-State: APjAAAXIXslRUKslLZE+7WptD47hBAOVL1ghKFKVkz7vcyeUDkFf7jq7
	QiZ1thkL5ENHlmvbCqa8MSey3hMx
X-Received: by 2002:a17:906:2daa:: with SMTP id
	g10mr6922122eji.82.1552484040827; 
	Wed, 13 Mar 2019 06:34:00 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id x3sm593856ede.25.2019.03.13.06.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 06:34:00 -0700 (PDT)
Date: Wed, 13 Mar 2019 13:33:59 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190313133359.h2njohyijgvkcbtv@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313132300.3f56a5ca@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VWUjdktGsL0+

On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 12:42:53 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> Now we have two identical build_mcfg function.
>> 
>> Extract them to aml-build.c.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c    | 16 ----------------
>>  hw/i386/acpi-build.c        | 31 +------------------------------
>>  include/hw/acpi/aml-build.h |  1 +
>>  4 files changed, 32 insertions(+), 46 deletions(-)
>> 
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 555c24f21d..58d3b8f31d 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>
>I don't like polluting aml-build.c with PCI stuff,
>we have a lot of PCI related code that needs generalizing
>lets create a new file for that, something like
>hw/acpi/pci.c + include/hw/acpi/pci.h
>
>> @@ -25,6 +25,7 @@
>>  #include "qemu/bswap.h"
>>  #include "qemu/bitops.h"
>>  #include "sysemu/numa.h"
>> +#include "hw/pci/pcie_host.h"
>>  
>>  static GArray *build_alloc_array(void)
>>  {
>> @@ -1870,3 +1871,32 @@ build_hdr:
>>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
>>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>>  }
>> +
>> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> +{
>> +    AcpiTableMcfg *mcfg;
>> +    const char *sig;
>> +    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> +
>> +    mcfg = acpi_data_push(table_data, len);
>> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>> +    /* Only a single allocation so no need to play with segments */
>> +    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> +    mcfg->allocation[0].start_bus_number = 0;
>> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>
>> +    /*
>> +     * MCFG is used for ECAM which can be enabled or disabled by guest.
>> +     * To avoid table size changes (which create migration issues),
>> +     * always create the table even if there are no allocations,
>> +     * but set the signature to a reserved value in this case.
>> +     * ACPI spec requires OSPMs to ignore such tables.
>> +     */
>> +    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
>> +        /* Reserved signature: ignored by OSPM */
>> +        sig = "QEMU";
>> +    } else {
>> +        sig = "MCFG";
>> +    }
>I'd leave these hack at acpi-build.c, just push it up call chain.

Assign sig in acpi-build.c and pass it to build_mcfg()?

>More over we don't really need it since resizeable memory region was introduced.
>
>So we need to keep table_blob size only for legacy usecase (pre resizable)
>and for that just padding table_blob on required size would be sufficient,
>there is no need to create dummy QEMU table.
>As for newer machines (since resizeable memory region) we don't need to
>do even that i.e. just skip table generation altogether if guest disabled it.
>

I am lost at this place.

sig is a part of ACPI table header, you mean the sig is not necessary to
be set in ACPI table header?

"skip table generation" means remove build_header() in build_mcfg()?

>> +    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
>> +}
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index ae7858a79a..92d8fccb00 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -557,22 +557,6 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>>      return true;
>>  }
>>  
>> -static void
>> -build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> -{
>> -    AcpiTableMcfg *mcfg;
>> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> -
>> -    mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>> -    /* Only a single allocation so no need to play with segments */
>> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> -    mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>> -
>> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>> -}
>> -
>>  /* GTDT */
>>  static void
>>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index c5b1c3be99..b537a39d42 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2392,35 +2392,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>                   table_data->len - srat_start, 1, NULL, NULL);
>>  }
>>  
>> -static void
>> -build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>> -{
>> -    AcpiTableMcfg *mcfg;
>> -    const char *sig;
>> -    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
>> -
>> -    mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>> -    /* Only a single allocation so no need to play with segments */
>> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> -    mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>> -
>> -    /* MCFG is used for ECAM which can be enabled or disabled by guest.
>> -     * To avoid table size changes (which create migration issues),
>> -     * always create the table even if there are no allocations,
>> -     * but set the signature to a reserved value in this case.
>> -     * ACPI spec requires OSPMs to ignore such tables.
>> -     */
>> -    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
>> -        /* Reserved signature: ignored by OSPM */
>> -        sig = "QEMU";
>> -    } else {
>> -        sig = "MCFG";
>> -    }
>> -    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
>> -}
>> -
>>  /*
>>   * VT-d spec 8.1 DMA Remapping Reporting Structure
>>   * (version Oct. 2014 or later)
>> @@ -2687,7 +2658,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>      }
>>      if (acpi_get_mcfg(&mcfg)) {
>>          acpi_add_table(table_offsets, tables_blob);
>> -        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
>> +        build_mcfg(tables_blob, tables->linker, &mcfg);
>>      }
>>      if (x86_iommu_get_default()) {
>>          IommuType IOMMUType = x86_iommu_get_type();
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index b63b85d67c..8f2ea3679f 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -423,4 +423,5 @@ void build_slit(GArray *table_data, BIOSLinker *linker);
>>  
>>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                  const char *oem_id, const char *oem_table_id);
>> +void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
>>  #endif
>

-- 
Wei Yang
Help you, Help me
