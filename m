Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4578766wrx;
        Mon, 25 Mar 2019 19:46:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgAR5z0L0Zk/vB4i6m1KbCbYADURYLIHLG1s9onQGqG0SqWDBndHIJ0iYxRlj/1YfMDJtS
X-Received: by 2002:a0d:eb82:: with SMTP id u124mr23311839ywe.434.1553568414906;
        Mon, 25 Mar 2019 19:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553568414; cv=none;
        d=google.com; s=arc-20160816;
        b=INUSG+KxYnnWW3qchSg5Re2ZP8kzLLnrlUs/XoJF89tAfyGU4mDvGS0N9+aNFcqv49
         /bCKW68c91XbekWZJYrYpZ3mSUTQgjabkIdF5MsBTzlfBjYn/6XjZsKm0BdLvgz0WuEV
         tKJRVN00et6dCnhChYolxdA+ObNplpmperkCgBBV9H/icWNp/aHr8Q6cTUVwtapzKxSf
         IWEvvCi6mgob6QVYBN/g6cElsSVo0NdenMY0w+iBATUywilubd1jWHfV/Ih+DRjAKIPC
         L5bQGIw/o5m2wHv8+/iu5LR5c3dVeKLCpyTw7V87/DaZZBfKnHuMQSMp/5PtfU8Z4lI/
         olaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=nGLBsZPrIyDQXT2IS1sjRqIZoQ/d+SpEpZv3iDZX1Qk=;
        b=Xgs48TXeyXiMQxyTxR6f3L9f63eK+uAQt8yPCK4JiUHNfb2szd6VKAi4t0O1TCSR6d
         bNRPirT/F8w8VkYGtnogMrO8Ns/KgW3x4loQeZRwCbmpKY/AHjbERf100JR1pnCq/4e6
         yKtqFGbgGshx5NtLOV/WGtG7T26Fq2SxJ94Nj+g9FNcs9qZZflosC8cTG9wbhaOv5oCY
         Lp1nM9Okb05GTK78gE4kJza2LEJ68VQTnuJ6tRNeLBrMQ6DRndJvVvfiapcOYOEjN94q
         cm2VjRAIADlHGPyGEyMRz/NAg49wF6rEJ82rIkZJ0kFIU647GzvieNB4ZbaT1zx39Sxx
         J8pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si9963643ywh.362.2019.03.25.19.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 19:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:51640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8c74-0003Fz-8Z
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 22:46:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h8c6j-0002vx-RK
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 22:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h8bwM-0000Tj-Op
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 22:35:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:24372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h8bwM-0000Mi-Bd; Mon, 25 Mar 2019 22:35:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2019 19:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; d="scan'208";a="134732470"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2019 19:35:46 -0700
Date: Tue, 26 Mar 2019 10:35:25 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190326023525.GA27038@richard>
References: <20190325055910.15449-1-richardw.yang@linux.intel.com>
	<20190325105504.171400e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190325105504.171400e2@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-arm] [PATCH v5] hw/acpi: extract acpi_add_rom_blob()
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZdP7/YmCSLY

On Mon, Mar 25, 2019 at 10:55:04AM +0100, Igor Mammedov wrote:
>On Mon, 25 Mar 2019 13:59:10 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> arm and i386 has almost the same function acpi_add_rom_blob(), except
>> giving different FWCfgCallback function.
>> 
>> This patch moves acpi_add_rom_blob() to utils.c by passing
>> FWCfgCallback to it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> 
>> ---
>> v5:
>>   * remove unnecessary header glib/gprintf.h
>>   * rearrange include header to make it more suitable
>> v4:
>>   * extract -> moves
>>   * adjust comment in source to make checkpatch happy
>> v3:
>>   * put acpi_add_rom_blob() to hw/acpi/utils.c
>> v2:
>>   * remove unused header in original source file
>> ---
>>  hw/acpi/Makefile.objs    |  2 +-
>>  hw/acpi/utils.c          | 36 ++++++++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
>>  hw/i386/acpi-build.c     | 26 ++++++++++----------------
>>  include/hw/acpi/utils.h  |  9 +++++++++
>>  5 files changed, 66 insertions(+), 33 deletions(-)
>>  create mode 100644 hw/acpi/utils.c
>>  create mode 100644 include/hw/acpi/utils.h
>> 
>> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
>> index 2d46e3789a..ba93c5b64a 100644
>> --- a/hw/acpi/Makefile.objs
>> +++ b/hw/acpi/Makefile.objs
>> @@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>>  
>>  common-obj-y += acpi_interface.o
>>  common-obj-y += bios-linker-loader.o
>> -common-obj-y += aml-build.o
>> +common-obj-y += aml-build.o utils.o
>>  common-obj-$(CONFIG_TPM) += tpm.o
>>  
>>  common-obj-$(CONFIG_IPMI) += ipmi.o
>> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
>> new file mode 100644
>> index 0000000000..7a890cca06
>> --- /dev/null
>> +++ b/hw/acpi/utils.c
>> @@ -0,0 +1,36 @@
>> +/*
>> + * Utilities for generating ACPI tables and passing them to Guests
>> + *
>> + * Copyright (C) 2019 Intel Corporation
>> + * Copyright (C) 2019 Red Hat Inc
>> + *
>> + * Author: Wei Yang <richardw.yang@linux.intel.com>
>> + * Author: Igor Mammedov <imammedo@redhat.com>
>
>>From history it looks like Michael was an original author and
>then Shanon copied approach for ARM.
>So put Michael instead of me.

Sure, thanks

>
>with that fixed up
>
>Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> +
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> +
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/utils.h"
>> +#include "hw/loader.h"
>> +
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size)
>> +{
>> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>> +                        name, update, opaque, NULL, true);
>> +}
>> +
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 57679a89bf..a846f74a14 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -37,9 +37,9 @@
>>  #include "hw/acpi/acpi.h"
>>  #include "hw/nvram/fw_cfg.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>> -#include "hw/loader.h"
>>  #include "hw/hw.h"
>>  #include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/utils.h"
>>  #include "hw/pci/pcie_host.h"
>>  #include "hw/pci/pci.h"
>>  #include "hw/arm/virt.h"
>> @@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
>>      build_state->patched = false;
>>  }
>>  
>> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>> -                                       GArray *blob, const char *name,
>> -                                       uint64_t max_size)
>> -{
>> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>> -                        name, virt_acpi_build_update, build_state, NULL, true);
>> -}
>> -
>>  static const VMStateDescription vmstate_virt_acpi_build = {
>>      .name = "virt_acpi_build",
>>      .version_id = 1,
>> @@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
>>      virt_acpi_build(vms, &tables);
>>  
>>      /* Now expose it all to Guest */
>> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
>> -                                               ACPI_BUILD_TABLE_FILE,
>> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
>> +    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
>> +                                              build_state, tables.table_data,
>> +                                              ACPI_BUILD_TABLE_FILE,
>> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>>      assert(build_state->table_mr != NULL);
>>  
>>      build_state->linker_mr =
>> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
>> -                          "etc/table-loader", 0);
>> +        acpi_add_rom_blob(virt_acpi_build_update, build_state,
>> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
>>  
>>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>>                      acpi_data_len(tables.tcpalog));
>>  
>> -    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>> -                                              ACPI_BUILD_RSDP_FILE, 0);
>> +    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
>> +                                             build_state, tables.rsdp,
>> +                                             ACPI_BUILD_RSDP_FILE, 0);
>>  
>>      qemu_register_reset(virt_acpi_build_reset, build_state);
>>      virt_acpi_build_reset(build_state);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 416da318ae..b17d4a711d 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -37,7 +37,6 @@
>>  #include "hw/acpi/cpu.h"
>>  #include "hw/nvram/fw_cfg.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>> -#include "hw/loader.h"
>>  #include "hw/isa/isa.h"
>>  #include "hw/block/fdc.h"
>>  #include "hw/acpi/memory_hotplug.h"
>> @@ -58,6 +57,7 @@
>>  #include "hw/i386/x86-iommu.h"
>>  
>>  #include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/utils.h"
>>  
>>  #include "qom/qom-qobject.h"
>>  #include "hw/i386/amd_iommu.h"
>> @@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
>>      build_state->patched = 0;
>>  }
>>  
>> -static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>> -                                       GArray *blob, const char *name,
>> -                                       uint64_t max_size)
>> -{
>> -    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>> -                        name, acpi_build_update, build_state, NULL, true);
>> -}
>> -
>>  static const VMStateDescription vmstate_acpi_build = {
>>      .name = "acpi_build",
>>      .version_id = 1,
>> @@ -2891,14 +2883,15 @@ void acpi_setup(void)
>>      acpi_build(&tables, MACHINE(pcms));
>>  
>>      /* Now expose it all to Guest */
>> -    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
>> -                                               ACPI_BUILD_TABLE_FILE,
>> -                                               ACPI_BUILD_TABLE_MAX_SIZE);
>> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
>> +                                              build_state, tables.table_data,
>> +                                              ACPI_BUILD_TABLE_FILE,
>> +                                              ACPI_BUILD_TABLE_MAX_SIZE);
>>      assert(build_state->table_mr != NULL);
>>  
>>      build_state->linker_mr =
>> -        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
>> -                          "etc/table-loader", 0);
>> +        acpi_add_rom_blob(acpi_build_update, build_state,
>> +                          tables.linker->cmd_blob, "etc/table-loader", 0);
>>  
>>      fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
>> @@ -2935,8 +2928,9 @@ void acpi_setup(void)
>>          build_state->rsdp_mr = NULL;
>>      } else {
>>          build_state->rsdp = NULL;
>> -        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>> -                                                  ACPI_BUILD_RSDP_FILE, 0);
>> +        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
>> +                                                 build_state, tables.rsdp,
>> +                                                 ACPI_BUILD_RSDP_FILE, 0);
>>      }
>>  
>>      qemu_register_reset(acpi_build_reset, build_state);
>> diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
>> new file mode 100644
>> index 0000000000..140b4de603
>> --- /dev/null
>> +++ b/include/hw/acpi/utils.h
>> @@ -0,0 +1,9 @@
>> +#ifndef HW_ACPI_UTILS_H
>> +#define HW_ACPI_UTILS_H
>> +
>> +#include "hw/nvram/fw_cfg.h"
>> +
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size);
>> +#endif

-- 
Wei Yang
Help you, Help me
