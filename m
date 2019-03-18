Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2321868wrt;
        Mon, 18 Mar 2019 05:48:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhVruCVF/K35C8accfn4x6IBHlIlatOPzIJyIYto2YZo1l/zCssQq+4f4jYtfGwKeX1Pqw
X-Received: by 2002:a5d:5292:: with SMTP id c18mr12736814wrv.251.1552913316204;
        Mon, 18 Mar 2019 05:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552913316; cv=none;
        d=google.com; s=arc-20160816;
        b=QKoSjL1R4ytBIrFciJwzOY19FGWSm4LSiZGw1bS0nTO5a22KfDVLYJVSbg2CLmagV4
         BjBH7o9MO31nntg1zA0WiHhMhTneHWR6exnFtKAOdyX+versXD6Wd2xwcupLYUyBdRam
         A/lLZuumy2BgN/51iNx7dqLvzU1964hrJsc7YCabg8bOQR6EFqcrhrejoTKUUlGMmHad
         DvuBljlfGTKcR+FaZMwBVYDq6A/IGJapnpS122bLfwcQKq8pkKj6VbJC6mQ5BBYtJuQk
         pEclZgnWCshGY2ELszYnlZtL6sdEXOU3uLap+1SKaQjYOfIgagcTX/HuZLpLCv9ZWs70
         QPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=wldpgApnlO6Udc0AFMx+FfiLXyACUq11kORCR8M+SM4=;
        b=MoAhir/283o/VRS0sW3IUvElKw8eVdC4NwkwALLTqXO1gjsVaqWksdzetuZSYIfen7
         suPflLUQi4C/YEM7B+tu5KkPq1Hx/3jni/jinT0WKplX5cBV2fTbVq0RMJ5WrOGCbcRq
         ExoaQH4q1fXGEC9s8zYtnSF4d8tXXnNoqn7HxCz5KOmoH6NQekDOf4HIJeex5Eo/3uQC
         ec5/2QcQFp7JWACovY0eu/iXvp9flEkIoMrQABP55PZ/jY2HlVTXgdDZJ3QXpeQVAAVH
         BL997fbcEOhUa1ZkC95gwDhm7jtDT44ZYkPdb6vqTYvBjw5rVlpJWc13zputdumHqJ3x
         9L1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si6405222wru.399.2019.03.18.05.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 05:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5rgx-0002jr-5A
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 08:48:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5rfl-0002Tu-PJ
	for qemu-devel@nongnu.org; Mon, 18 Mar 2019 08:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5rY5-00086D-M3
	for qemu-devel@nongnu.org; Mon, 18 Mar 2019 08:39:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h5rXz-00082u-5R; Mon, 18 Mar 2019 08:39:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 592243082AED;
	Mon, 18 Mar 2019 12:39:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA63B1001DCF;
	Mon, 18 Mar 2019 12:39:13 +0000 (UTC)
Date: Mon, 18 Mar 2019 13:39:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190318133912.1c67a304@redhat.com>
In-Reply-To: <20190315004432.3445-1-richardw.yang@linux.intel.com>
References: <20190315004432.3445-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 18 Mar 2019 12:39:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hI1fHf6PWh0

On Fri, 15 Mar 2019 08:44:32 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

in subject: s/extract/generalize/

> arm and i386 has almost the same function acpi_add_rom_blob(), except
> giving different FWCfgCallback function.
> 
> This patch extract acpi_add_rom_blob() to utils.c by passing
             s/extract/moves/

> FWCfgCallback to it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

otherwise patch looks fine to me,
but checkpatch complains about comment style so that needs to be fixed as well

> 
> ---
> v3:
>   * put acpi_add_rom_blob() to hw/acpi/utils.c
> v2:
>   * remove unused header in original source file
> ---
>  hw/acpi/Makefile.objs    |  2 +-
>  hw/acpi/utils.c          | 35 +++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
>  hw/i386/acpi-build.c     | 26 ++++++++++----------------
>  include/hw/acpi/utils.h  |  9 +++++++++
>  5 files changed, 65 insertions(+), 33 deletions(-)
>  create mode 100644 hw/acpi/utils.c
>  create mode 100644 include/hw/acpi/utils.h
> 
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 2d46e3789a..ba93c5b64a 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  
>  common-obj-y += acpi_interface.o
>  common-obj-y += bios-linker-loader.o
> -common-obj-y += aml-build.o
> +common-obj-y += aml-build.o utils.o
>  common-obj-$(CONFIG_TPM) += tpm.o
>  
>  common-obj-$(CONFIG_IPMI) += ipmi.o
> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> new file mode 100644
> index 0000000000..ab0e064a0e
> --- /dev/null
> +++ b/hw/acpi/utils.c
> @@ -0,0 +1,35 @@
> +/* Utilities for generating ACPI tables and passing them to Guests
> + *
> + * Copyright (C) 2019 Intel Corporation
> + * Copyright (C) 2019 Red Hat Inc
> + *
> + * Author: Wei Yang <richardw.yang@linux.intel.com>
> + * Author: Igor Mammedov <imammedo@redhat.com>
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
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib/gprintf.h>
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
> +
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size)
> +{
> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> +                        name, update, opaque, NULL, true);
> +}
> +
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 57679a89bf..a846f74a14 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -37,9 +37,9 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> -#include "hw/loader.h"
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
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
> @@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
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
> index 416da318ae..b17d4a711d 100644
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
> @@ -58,6 +57,7 @@
>  #include "hw/i386/x86-iommu.h"
>  
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
>  
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
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
> @@ -2891,14 +2883,15 @@ void acpi_setup(void)
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
> @@ -2935,8 +2928,9 @@ void acpi_setup(void)
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
> diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
> new file mode 100644
> index 0000000000..5212113b7d
> --- /dev/null
> +++ b/include/hw/acpi/utils.h
> @@ -0,0 +1,9 @@
> +#ifndef HW_ACPI_UTILS_H
> +#define HW_ACPI_UTILS_H
> +
> +#include "hw/loader.h"
> +
> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
> +                                GArray *blob, const char *name,
> +                                uint64_t max_size);
> +#endif

