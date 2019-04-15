Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2722630wrx;
        Mon, 15 Apr 2019 07:08:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfDoFGOV09SmDrazsaVVzbivxEFlyFCikoaszpaOUkLndOmxh4is4v8NbtwY8MpWDFt/Ah
X-Received: by 2002:a1c:d106:: with SMTP id i6mr21318062wmg.134.1555337330176;
        Mon, 15 Apr 2019 07:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555337330; cv=none;
        d=google.com; s=arc-20160816;
        b=HfIP0CzibOK+DAB6o0joUY5AZprkg3icd2KrThKbFawZ7N/T+Q935lAjaWXnr9CB83
         8Lght5wqdfYcSIBUghoVtzVz6VKuAoPJs4zwaK527aSDnff0hy33UdMRIQbRuMjodmcM
         xC4s4UbC6b7jNIq3ZvLQ8EvDLfQADn5qYxG5LAnrOKInjXvW06qkZa/oz7ZDhuFYakss
         8UImcKihwKl421hNKjFBwhkpRX7WgslvWGGoa7b7FKpHIYtqpGiTU2fbzmPAvHEGKqvj
         RiRcms5N1GisEfkquyJswia6jhK9ve1LdM89oMaPxVfeWvq6FZZBrOs5AYmIBZu7Hr2k
         gjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=lvbCo60tjHI11A3DU4gpM+oYYLC6EiN1P9uA6+zRDQk=;
        b=rfHEjaXcVmkMtn4DrcqFyRryd5drR1euDn8o5D3m8j4IjQ+4nhlen8r2U8qH0cNhPX
         6TH4EuWMBNJ3vFiOq15OSJbZcH9XAf2zeEVwr5mzkhXBb4ldpwJukox0r/Bq/7i5wdmb
         6Sf/YI5UJ7lvGaX9bcpxEYnZMb2HJc+K9PUVgy7QGBkGC0eKeCT+0Efl+8/rSqKqD6uj
         aXROJKSTg3LDAH3DGpr5ThBbIO8AvLKqnLPsCwI4BqK3/pj9YigRDcZRe5RUxzUCxR9z
         aFHBKctwqMX9quqcku+pUWMCRzg4Gm7nh2wqrRtRub8mJVjiFNic9d4v29CMvpDKys1W
         e9+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si32923629wrw.367.2019.04.15.07.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 07:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG2Hx-0002Ci-8y
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 10:08:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2Hp-0002CZ-Dm
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hG2Ho-0006F3-EE
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 10:08:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hG2Ho-0006EM-1Z; Mon, 15 Apr 2019 10:08:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96C2E307D963;
	Mon, 15 Apr 2019 14:08:37 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4881D60260;
	Mon, 15 Apr 2019 14:08:31 +0000 (UTC)
Date: Mon, 15 Apr 2019 16:08:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190415160824.60c32a70@Igors-MacBook-Pro.local>
In-Reply-To: <20190415070307.13668-4-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 15 Apr 2019 14:08:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/virt-acpi-build: pass
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
	qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwN+tMwRsmrB

On Mon, 15 Apr 2019 15:03:06 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> To build MCFG, two information is necessary:
> 
>     * bus number
>     * base address
> 
> Abstract these two information to AcpiMcfgInfo so that build_mcfg and
> build_mcfg_q35 will have the same declaration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> 
> ---
> v2:
>   * for arm platform, construct a AcpiMcfgInfo directly
> ---
>  hw/arm/virt-acpi-build.c    | 17 ++++++++++-------
>  hw/i386/acpi-build.c        |  5 -----
>  include/hw/acpi/aml-build.h |  5 +++++
>  3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e09e7eff8d..7350f207b5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -546,21 +546,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>  
>  static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
>      AcpiTableMcfg *mcfg;
> -    const MemMapEntry *memmap = vms->memmap;
> -    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
> +    mcfg->allocation[0].address = cpu_to_le64(info->base);
>  
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number =
> -        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>  
>      build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
> @@ -801,7 +798,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_gtdt(tables_blob, tables->linker, vms);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, vms);
> +    {
> +        AcpiMcfgInfo mcfg = {
> +           .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
> +           .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f0d27bffd6..7613b245cf 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -86,11 +86,6 @@
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
> -typedef struct AcpiMcfgInfo {
> -    uint64_t base;
> -    uint32_t size;
> -} AcpiMcfgInfo;
> -
>  typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1a563ad756..22dd593068 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -223,6 +223,11 @@ struct AcpiBuildTables {
>      BIOSLinker *linker;
>  } AcpiBuildTables;
>  
> +typedef struct AcpiMcfgInfo {
> +    uint64_t base;
> +    uint32_t size;
> +} AcpiMcfgInfo;

this one should go to new acpi/pci.h

> +
>  /**
>   * init_aml_allocator:
>   *

