Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1574719wrs;
        Wed, 13 Mar 2019 05:12:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytfmm8mWXVmvDsWjoH4CkPeaU/YTD7vfxFExFaIlIV3RZgQ7AAyXjX97JK0OajOeAHmW++
X-Received: by 2002:a81:7402:: with SMTP id p2mr18221668ywc.493.1552479155839;
        Wed, 13 Mar 2019 05:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552479155; cv=none;
        d=google.com; s=arc-20160816;
        b=ez0JcyHe7DMg8utWh6tYT1gOeQtnU8nMqRAWFIWvKFx/+kxd16dYqFpICD7f/7d299
         W7Mhf/gEpsCD3+/lNS06vPBuQnqtxkO4hl/qVeQieB4pb0DaTU1k+JcVdsSXUIsANYZ8
         fdRrXqrd0yAuuWzSCzZUUeBrf6lj0opndfNc6oIdvDD+nLN1vHOzD7dE/8j79HIfSIS2
         yloky6VWazOeozbSogKeplvXoQHnMzXu8L9Q3VmZHQbGxf3A9ydTRxPyItHXFVQ/R1c7
         iwK46ZiZcV+t/ZK0fX1EIOqAC8A035fRKPXas5kPBHjtThMsYvSMsaqFVPd+KSuwO51E
         Udjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=XoCjbd1w83x36joi4+KvUzYAyFlbCI3viGLRhI//Qfg=;
        b=crR/nFuMtPZoh4XrFr1sAkEveatEatnqdwjOjYYQQKVmOIduqUR5u70lIjxP4bR3vu
         TsRwGCoGTlPhLpEsHkeM9LNMywsT4+IwtHTVkzb1yXwtpABVDeTjOmLEjEM6TmWoI7vF
         +/Laj6iB/29FmVd0X3J/S3InYhlGKi4R3sP4mfEwrPYa/52CE6vXGmku4u5JrQ6ivoMw
         h3nqKJ331JfAiajPbHnC34q0vgkIKCmWUhp8oP5Dlon1+r8Y53FfiX65a7C2ZFaKpT0e
         fIyHOqRRiaLqI91IAVoGGHT0ki9iSTlf1sVp4VI9aWx5K5FnnNdCXsJRILEjdZT8QVMi
         xtUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f133si6719720ywa.267.2019.03.13.05.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 05:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h42kN-0003zH-7p
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 08:12:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42Z9-0002wh-A5
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h42Z3-0005io-JR
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 08:00:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h42Z2-0005fH-QQ; Wed, 13 Mar 2019 08:00:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34955C02491B;
	Wed, 13 Mar 2019 12:00:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 385251001E6F;
	Wed, 13 Mar 2019 12:00:24 +0000 (UTC)
Date: Wed, 13 Mar 2019 13:00:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190313130022.34105087@redhat.com>
In-Reply-To: <20190313044253.31988-2-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Mar 2019 12:00:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt-acpi-build: use
 acpi_get_mcfg() to calculate bus number
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
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: anQNs1kLDbbd

On Wed, 13 Mar 2019 12:42:51 +0800
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
> ---
>  hw/arm/virt-acpi-build.c    | 28 ++++++++++++++++++++--------
>  hw/i386/acpi-build.c        |  5 -----
>  include/hw/acpi/aml-build.h |  5 +++++
>  3 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 57679a89bf..7713c2d809 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -545,23 +545,32 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>  }
>  
> -static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>  {
> -    AcpiTableMcfg *mcfg;
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
>      const MemMapEntry *memmap = vms->memmap;
>      int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
> +
> +    mcfg->mcfg_base = memmap[ecam_id].base;
> +    mcfg->mcfg_size = memmap[ecam_id].size;
> +
> +    return true;
> +}
> +
> +static void
> +build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> +{
> +    AcpiTableMcfg *mcfg;
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>      int mcfg_start = table_data->len;
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
> +    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
>  
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number =
> -        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>  
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>                   "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> @@ -779,6 +788,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
> +    AcpiMcfgInfo mcfg;
>      GArray *tables_blob = tables->table_data;
>  
>      table_offsets = g_array_new(false, true /* clear */,
> @@ -802,8 +812,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> -    acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, vms);
> +    if ( acpi_get_mcfg(&mcfg)) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_mcfg(tables_blob, tables->linker, &mcfg);
> +    }

acpi_get_mcfg used only once and always true so one doesn't need condition
I'd go for simpler:

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e4885b..a28e04c249 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -803,8 +803,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_gtdt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_mcfg(tables_blob, tables->linker, vms);
-
+    {
+        const AcpiTableMcfg mcfg = {
+           .mcfg_base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base;
+           .mcfg_size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size;
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg);
+    }
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);

and get rid of acpi_get_mcfg() helper function

>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9ecc96dcc7..c5b1c3be99 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -86,11 +86,6 @@
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
> -typedef struct AcpiMcfgInfo {
> -    uint64_t mcfg_base;
> -    uint32_t mcfg_size;
> -} AcpiMcfgInfo;
> -
>  typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1a563ad756..b63b85d67c 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -223,6 +223,11 @@ struct AcpiBuildTables {
>      BIOSLinker *linker;
>  } AcpiBuildTables;
>  
> +typedef struct AcpiMcfgInfo {
> +    uint64_t mcfg_base;
> +    uint32_t mcfg_size;
mcfg_ prefix in fields probably isn't necessary.

> +} AcpiMcfgInfo;
> +
>  /**
>   * init_aml_allocator:
>   *

