Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2386180wrt;
        Mon, 18 Mar 2019 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwL/E6za8Pm5fnSkQUPJWtqoxR6DzUUMoQ4SV01krC/TdUKBcKMvilCU5f9KpRf01fUmzEQ
X-Received: by 2002:adf:b3d1:: with SMTP id x17mr12307756wrd.15.1552917089879;
        Mon, 18 Mar 2019 06:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552917089; cv=none;
        d=google.com; s=arc-20160816;
        b=a/3vIU4pCVO9llE4nUfXTOEt0yTBizBRUcomzEN6BFV666/SFKM1yCtUxcD+gbRXa8
         LFT1+db6eYgtG15hlniQlpR2leRxMXbc8j1ge7rWWdVhbcbvXn5Ht8yDQxBvF8z2oQ+q
         mOC1hZ7Rsr0GddoybyJlfXDa42lFBHBM13l6wNDg8RCS+Tgw2XfAFwRTCKZ8EiT67N5p
         +UXW8lEyg5TejV0rr0IHeugJ6X1LA/ZuGhNYpZvq3tlQh6cTVJp+ayPPV4McCHAWWPzC
         7nk7Wj4IPhy+X97pLzKbYO4ZMrhMig8oh7uOARCNFLI568qh4yKo53d0V+8+f5ox1Cm2
         Si2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=BRRNbfcgOub72qswz+Zql3eVhNFC3sgguJKEbsKdZ4k=;
        b=sxISWNU5FhG411C5Fh8R+/Q1yjM/Sn71J5ey4lqB6QfjuJmnIvsl3zlAfdqC9zE9Zi
         3ATla8o7kXTf8MnZx4MyMaEDgy1c+BuSuTlLRKlKMVKrZpMtR70mUh4jGOp5VrG2DOCr
         v9/sMuigXWjrL+bNGLYvGKjLrln6O/wfHQ9Mt5WTSWBhSzMCB2w2IOB7NGgN0PEGbeWs
         r7Ob2rytnP6NRzpDeRKz4/nr4gZia790m3mnrmO6Ck1aWcL/cTiQ4aM2QvP+wVQfUpKv
         EitR3EbWmD4Q63iUVWGYyVk0Ri5xsvXc1fjXiJxCbrzHba1MiIM4USO+xUkTEkqCU8NC
         6qqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HKgPBVWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si6201537wmh.201.2019.03.18.06.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 06:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HKgPBVWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:41978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5sfo-0004pw-TD
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 09:51:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h5sfa-0004on-Dq
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 09:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h5sfY-0008V6-Rv
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 09:51:14 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38906)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h5sfV-0008SH-F4; Mon, 18 Mar 2019 09:51:09 -0400
Received: by mail-ed1-x541.google.com with SMTP id e10so9678403edy.5;
	Mon, 18 Mar 2019 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BRRNbfcgOub72qswz+Zql3eVhNFC3sgguJKEbsKdZ4k=;
	b=HKgPBVWxoe7XWgQdowFsSAouckvfD+An9I28dsmQi+gw0Csf7O2AYQ5pvsRoedOO1l
	JeBVhU+vMbby9a1zqPQbXFdjex0/HdnEvh/IM/hSQge4zg19ZXakZkVBFLLdlPnwzChi
	kcRL3BJ1WX4kBMZTz5R0EVRZkEOvPJgnpthXT4Jz67UAuDRYNM22slLl2hSkaGSUugmX
	3ovyRZ4Ua3WVphLOPQVVZfG6wS0Q8E6SvGS6qMVeZf9u4f1oyL4RguZos7CgCot0MS1F
	1nzR0PYRz3p9N4S+NpGQvtDyKo1lVn5MLqBnzYxW2Cl8kS0RP3kdGOdgmDNcU6NvmBUL
	Eh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BRRNbfcgOub72qswz+Zql3eVhNFC3sgguJKEbsKdZ4k=;
	b=FXeBi0ZeCcnrBuczYGeZYD6THxhl1mEKglzRpoHeylUfICqXMkjuZaxYcH02osbI2J
	Dl3nYOU6kwDCSe6UAeKNs4AGoAqnhVAxPh16OsecG7gSqvkReXOlPUYVuUI0pctZlP62
	hAVH4Qxg7BmtLoNyG/ZsNJW+Zk0l7dlgBSgNd/yG/QzNpFj8LGzaWnRyRslorzIKcDKn
	L5IezO6MFGBxEbRIRt8lkoCVIHl7G1qxapCaphWs0M9S361jGLu2hVRe5+itSMqHMWX3
	ETZUrRw0CfYxjkFYSVefmOX3iriWieDKwFGAZ8g1Ap55t5xScdFlTJIJx0RVuCwusKky
	zgaw==
X-Gm-Message-State: APjAAAWyEzLj+eUP1goTAmGk/VjFqoR0qfBV2CBVv1mUA6q4hnjgW5aQ
	b4fL2xGDzg1/HOoedR959Xw=
X-Received: by 2002:a17:906:5a09:: with SMTP id
	p9mr11117944ejq.46.1552917067709; 
	Mon, 18 Mar 2019 06:51:07 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	c12sm3313714edt.31.2019.03.18.06.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 06:51:06 -0700 (PDT)
Date: Mon, 18 Mar 2019 13:51:06 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190318135106.33gm254w54ev2lgn@master>
References: <20190315004432.3445-1-richardw.yang@linux.intel.com>
	<20190318133912.1c67a304@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190318133912.1c67a304@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] hw/acpi: extract
 acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 277U3WZm+fOB

On Mon, Mar 18, 2019 at 01:39:12PM +0100, Igor Mammedov wrote:
>On Fri, 15 Mar 2019 08:44:32 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>in subject: s/extract/generalize/
>
>> arm and i386 has almost the same function acpi_add_rom_blob(), except
>> giving different FWCfgCallback function.
>> 
>> This patch extract acpi_add_rom_blob() to utils.c by passing
>             s/extract/moves/
>
>> FWCfgCallback to it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>otherwise patch looks fine to me,
>but checkpatch complains about comment style so that needs to be fixed as well

Yes, I see the warning from checkpatch.

>
>> 
>> ---
>> v3:
>>   * put acpi_add_rom_blob() to hw/acpi/utils.c
>> v2:
>>   * remove unused header in original source file
>> ---
>>  hw/acpi/Makefile.objs    |  2 +-
>>  hw/acpi/utils.c          | 35 +++++++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
>>  hw/i386/acpi-build.c     | 26 ++++++++++----------------
>>  include/hw/acpi/utils.h  |  9 +++++++++
>>  5 files changed, 65 insertions(+), 33 deletions(-)
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
>> index 0000000000..ab0e064a0e
>> --- /dev/null
>> +++ b/hw/acpi/utils.c
>> @@ -0,0 +1,35 @@
>> +/* Utilities for generating ACPI tables and passing them to Guests

The warning is to this line.  I thought this is a special case :-)

Will fix it in next version.

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
>> +#include <glib/gprintf.h>
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/utils.h"
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
>> +
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size);
>> +#endif
>

-- 
Wei Yang
Help you, Help me
