Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp132670wrx;
        Thu, 21 Mar 2019 17:29:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzd9NImW4Don3A0ZKaOMMTKPr7ZJWcc+SH+VTMZqhrkJV5MiOEx2aHlVOx1e18kS2z/mQp1
X-Received: by 2002:a5d:5281:: with SMTP id c1mr4443405wrv.83.1553214549077;
        Thu, 21 Mar 2019 17:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553214549; cv=none;
        d=google.com; s=arc-20160816;
        b=07DcIU0+GX7pMbKKXf0Y+AMHlFQDBCR4o8Wlhde8m6BFkHAHmv4/dMlLnu85oijJd6
         dVOZgrboLG9ztAyDERNZlUccbdmvuECwj8qwcalrm1rR7XKU8z31QO1SeManrUU9fOUA
         vosZz2akR24X9kVHjFDb6bD7/nEjyVe5o46drtazHvvzQu6uEYlWEJBSeaGcj+/qALhf
         i64qLGMdU+HtdTTI7G1H18k2Qq37uU+XAP+iXqYMXP66VLXGjrt3uJKKbsZ+D3o3aA5N
         GaAMtBmRAx2k2aoG/jgfTbIBGfCvtDbuGKRJN0N1/i2Axx9fGAjfv6ZG3VjSal8Rayaq
         LBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=xW+9NFmUrHOU9D+a2E2Nx1jF0FiSTQHtCniSTNIS40g=;
        b=zWRh80P5GE3gaBfbEQon2a0BUC3SxxYSqPxf7Pcb4VCvQ3XamnxT0h0z8K+djJAV+I
         aOz85J/RDhhgoALzJ8A+bUTDqGTT595MPQf7XPZq9OQ+/OOc0BiMiMDqDzwY1dMAOel5
         wNqWOWXt2NQxWeQuZYhw8fXbTshup95zphG99OmgDijY6Gq5UeFFcdvv37mBEdVDRk0v
         ZXR2yQUMFs8uoCKlKo9A1ula9kruWAjNjQAFevptdvmtfPUP0kocphNW0jQyzRuLEhrm
         rJars5eb6Yxm3w5h42ZB0RDcy2dKnGqCDQwyBDLcnsT8bwtnYH09Qqp0LZGIk+BEZ8P0
         ppCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si4175404wrm.433.2019.03.21.17.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 17:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:48599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h783X-0003Lw-VO
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 20:29:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h782m-00036o-SA
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 20:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h77vg-0000wO-Kn
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 20:21:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:30284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h77ve-0000n6-Bs; Thu, 21 Mar 2019 20:20:58 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2019 17:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,254,1549958400"; d="scan'208";a="154005449"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2019 17:20:49 -0700
Date: Fri, 22 Mar 2019 08:20:27 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190322002027.GA21574@richard>
References: <20190321002153.24049-1-richardw.yang@linux.intel.com>
	<20190321145042.07217056@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190321145042.07217056@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [PATCH v4] hw/acpi: extract acpi_add_rom_blob()
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7I6JonHm/47m

On Thu, Mar 21, 2019 at 02:50:42PM +0100, Igor Mammedov wrote:
>On Thu, 21 Mar 2019 08:21:53 +0800
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
>> index 0000000000..9747996c8c
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
>
>> +#include <glib/gprintf.h>
>is it necessary?
>

Will remove this.

>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/utils.h"
>
>
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
>> index 0000000000..5212113b7d
>> --- /dev/null
>> +++ b/include/hw/acpi/utils.h
>> @@ -0,0 +1,9 @@
>> +#ifndef HW_ACPI_UTILS_H
>> +#define HW_ACPI_UTILS_H
>> +
>> +#include "hw/loader.h"
>
>why loader.h and not fw_cfg.h?
>

Which fw_cfg.h? There is only two fw_cfg.h in qemu.

$ find . -name fw_cfg.h
./include/hw/nvram/fw_cfg.h
./tests/libqos/fw_cfg.h

Replace hw/loader.h with hw/nvram/fw_cfg.h will fail.

Do get your point here.

>> +
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size);
>> +#endif

-- 
Wei Yang
Help you, Help me
