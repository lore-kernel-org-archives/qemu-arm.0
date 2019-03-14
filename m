Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp614454wro;
        Thu, 14 Mar 2019 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfviQ3yqDEU2n5wbVQQ5Lq7+QqvCwzYxnBn0xm4/yBc37xkKjLSKN/jFtZy+fP9EG6BsbA
X-Received: by 2002:a0d:e105:: with SMTP id k5mr36789208ywe.196.1552555807540;
        Thu, 14 Mar 2019 02:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552555807; cv=none;
        d=google.com; s=arc-20160816;
        b=YYAATTIuvr/e+wdd6vfTQ1SFZ0fDz2SYdJ2HjTNKI09r31+Zbqvh866diDORsE9gHU
         VYE/DMVQw4aJLmsX5TV2uNJAMpDxjW/1ROhRD8ot0OpbIY5YfL/vbXMOSJU3CgsAlU/J
         D52NdhRRoUfZjDSAbWmCt7Gxa9fbZxzvumQeqvFEtxLqYa2db3Lp6fEjx4SpYpkWw0H3
         gNSHSK3quy00D2MxiYIWNkFeysGFUViNliFhAcg6X8mDTx8aurD6JVXx7/XREdouGR7w
         iyDKJuOW379b1Q+iDaD4fwJkZCexImk8pfC42Wlkv8/m3XdOzOfCVNZiT92cJWxgvsZP
         KChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cZWEXlu9OUu4pu2JRtlmDv3uPqDKWE74hjI/i+ommEY=;
        b=Onwz7D18msUxTmxn52ODS9MPlNSJwNYV450qqK+qu2BVFwqCXxdV+tDwZozmPeafUe
         mvrUENjtDFL1MBeChPrU/sYllVqKQNCHUVC9HvmIauHQFVYOPqPnuQzP2IbSVyp7DrhQ
         NJzlDvVCGC+QhJYAZD91uujDDyNjpc2lQ3ooX3z4J0J4zM82i4nq/Pk8oG68bzjRcWpR
         JM5pNI3revByJQ2VZEgPNx+nGR8fP5dSQ8AmOY17YxzXgbK1b9UsQQznRlaEdCNXkdLe
         FVdDEsGJ5XE9HFh2GwUAl/4QweKRzbjJQVS1bWB2u1C5j879Y0mQ9Hpkwu365IcF/M7A
         XXSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si6478757ybq.293.2019.03.14.02.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Mgg-0004CB-Kt
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:30:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4Mg9-00043U-KI
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4Mc5-0007uf-Js
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:25:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h4Mc5-0007uE-9f; Thu, 14 Mar 2019 05:25:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52848307ACE2;
	Thu, 14 Mar 2019 09:25:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59C305DD84;
	Thu, 14 Mar 2019 09:25:16 +0000 (UTC)
Date: Thu, 14 Mar 2019 10:25:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190314102514.1a5459ca@redhat.com>
In-Reply-To: <20190314073836.19874-1-richardw.yang@linux.intel.com>
References: <20190314073836.19874-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 14 Mar 2019 09:25:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] hw/acpi: extract acpi_add_rom_blob()
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
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4zrIipLw5wju

On Thu, 14 Mar 2019 15:38:36 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> arm and i386 has almost the same function acpi_add_rom_blob(), except
> giving different FWCfgCallback function.
> 
> This patch extract acpi_add_rom_blob() to aml-build.c by passing
> FWCfgCallback to it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> 
> ---
> v2:
>   * remove unused header in original source file
> ---
>  hw/acpi/aml-build.c         |  8 ++++++++
>  hw/arm/virt-acpi-build.c    | 25 +++++++++----------------
>  hw/i386/acpi-build.c        | 25 +++++++++----------------
>  include/hw/acpi/aml-build.h |  4 ++++
>  4 files changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 555c24f21d..ed427f8310 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
I'd like to keep aml-build.c clean from not spec related code,
Lets create a separate source file for QEMU specific code, something like
hw/acpi/utils.(h|c)

otherwise patch looks fine to me


> @@ -1559,6 +1559,14 @@ void *acpi_data_push(GArray *table_data, unsigned size)
>      return table_data->data + off;
>  }
>  
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size)
> +{
> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> +                        name, update, opaque, NULL, true);
> +}
> +
>  unsigned acpi_data_len(GArray *table)
>  {
>      assert(g_array_get_element_size(table) == 1);
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 57679a89bf..f7fd0cf06a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -37,7 +37,6 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> -#include "hw/loader.h"
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pcie_host.h"
> @@ -881,14 +880,6 @@ static void virt_acpi_build_reset(void *build_opaque)
>      build_state->patched = false;
>  }
>  
> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> -                                       GArray *blob, const char *name,
> -                                       uint64_t max_size)
> -{
> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> -                        name, virt_acpi_build_update, build_state, NULL, true);
> -}
> -
>  static const VMStateDescription vmstate_virt_acpi_build = {
>      .name = "virt_acpi_build",
>      .version_id = 1,
> @@ -920,20 +911,22 @@ void virt_acpi_setup(VirtMachineState *vms)
>      virt_acpi_build(vms, &tables);
>  
>      /* Now expose it all to Guest */
> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> -                                               ACPI_BUILD_TABLE_FILE,
> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
> +    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE,
> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>      assert(build_state->table_mr != NULL);
>  
>      build_state->linker_mr =
> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> -                          "etc/table-loader", 0);
> +        acpi_add_rom_blob(virt_acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
>  
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> -    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> -                                              ACPI_BUILD_RSDP_FILE, 0);
> +    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                             build_state, tables.rsdp,
> +                                             ACPI_BUILD_RSDP_FILE, 0);
>  
>      qemu_register_reset(virt_acpi_build_reset, build_state);
>      virt_acpi_build_reset(build_state);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 416da318ae..bc6e4b1f01 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -37,7 +37,6 @@
>  #include "hw/acpi/cpu.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> -#include "hw/loader.h"
>  #include "hw/isa/isa.h"
>  #include "hw/block/fdc.h"
>  #include "hw/acpi/memory_hotplug.h"
> @@ -2842,14 +2841,6 @@ static void acpi_build_reset(void *build_opaque)
>      build_state->patched = 0;
>  }
>  
> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
> -                                       GArray *blob, const char *name,
> -                                       uint64_t max_size)
> -{
> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> -                        name, acpi_build_update, build_state, NULL, true);
> -}
> -
>  static const VMStateDescription vmstate_acpi_build = {
>      .name = "acpi_build",
>      .version_id = 1,
> @@ -2891,14 +2882,15 @@ void acpi_setup(void)
>      acpi_build(&tables, MACHINE(pcms));
>  
>      /* Now expose it all to Guest */
> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
> -                                               ACPI_BUILD_TABLE_FILE,
> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE,
> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>      assert(build_state->table_mr != NULL);
>  
>      build_state->linker_mr =
> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
> -                          "etc/table-loader", 0);
> +        acpi_add_rom_blob(acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
>  
>      fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> @@ -2935,8 +2927,9 @@ void acpi_setup(void)
>          build_state->rsdp_mr = NULL;
>      } else {
>          build_state->rsdp = NULL;
> -        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
> -                                                  ACPI_BUILD_RSDP_FILE, 0);
> +        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> +                                                 build_state, tables.rsdp,
> +                                                 ACPI_BUILD_RSDP_FILE, 0);
>      }
>  
>      qemu_register_reset(acpi_build_reset, build_state);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1a563ad756..4945aeef5b 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>  
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/loader.h"
>  
>  /* Reserve RAM space for tables: add another order of magnitude. */
>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
> @@ -383,6 +384,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
>               const char *oem_id, const char *oem_table_id);
>  void *acpi_data_push(GArray *table_data, unsigned size);
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size);
>  unsigned acpi_data_len(GArray *table);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
>  void acpi_build_tables_init(AcpiBuildTables *tables);

