Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp749439wro;
        Thu, 14 Mar 2019 04:58:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbytEnU4vG9s9DNo4xlNgG9BPpzK9SI6pLti/f+qrj9zYhNB/8L04WO/WTkdjH6vHQiyol
X-Received: by 2002:a81:3dc8:: with SMTP id k191mr38270119ywa.139.1552564720501;
        Thu, 14 Mar 2019 04:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552564720; cv=none;
        d=google.com; s=arc-20160816;
        b=rKjTd9A+yW0KYA315F/6NIhwW3OIgmRlOntFiCoLtqxbGHvjvzcfZ9PylJicSLHfjm
         DP6BCh96qHiccZgBO/T1GkHX1gOqLGQrjHaph39PBiwW2z2tU8P/C+4IxyYQsNI+ojJ0
         A2ZumOonxNC2//YyR8RfEt+cC0m0xlRdJvYdOQI3VkjYn5wGkTv8Q3iagL0JCaUJxH/O
         eWS9qpfJh/cU99SsYyXAqeUK6MJM26Mqd9E+Ag3r3spDDH1x/QcbW2sNmeDME+e2LjAj
         pEEJwzFiOYZcQp43wqvPzynbJkmSO/qyoKTmP7tsCZElYCQluYJ53iU0ok/tDiJpg4kn
         LYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=txWQ51C0Rl6WzXtnab1D8OqfrR/IkXJBwpWqSxtaOA8=;
        b=uuJPNIlTDkgdrzXR9n9sE/UUd8aKj1QizQErK+aygNqbak7u3B5MZKQSTOgRzdyq85
         HCUcy2H3CjdAlPnHNB5IgJQb4J76WBsM03N3KbgoOXcXTL5C+36ZJUHK/vDVXqyxGV36
         miJivcM6LgBmTIveKQgMCFBozmAaT9wSkVAmwBqcQgWwymp14Np5ptzaSmlzdpoLgc/4
         vBHzZ7qaNkjzFDxiG54NJ58+moIABjgaHOJtRE+lXDAoqjZ0oS4xPl/30U0haIXOcolj
         CjzlTbyjiD4vEVOk5T0IP31JG41WxefBzkAFDoqfrM6Z0tZuOQSL8AJjtCqwQFN5s+Cb
         oQ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y5cwlizg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x128si8539296ybc.185.2019.03.14.04.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 04:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y5cwlizg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:34977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4P0S-0000NB-1J
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 07:58:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4Oxz-0007Ls-N4
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 07:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h4Oxy-00089D-Fs
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 07:56:07 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h4Oxy-00087k-4G; Thu, 14 Mar 2019 07:56:06 -0400
Received: by mail-ed1-x541.google.com with SMTP id e4so4375853edi.3;
	Thu, 14 Mar 2019 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=txWQ51C0Rl6WzXtnab1D8OqfrR/IkXJBwpWqSxtaOA8=;
	b=Y5cwlizg5IOAHtVCHa4NEqqlaBMFDzx1tqfTXjgr0D+7ukTZBaHy0wAr5k2oyAzIpQ
	wFoDhvFvSfAj37EZKHgy7g7NL7iVsjYzORVPs733qP7w4NFVBQ+F/kf70B39/d7SFIdO
	60nOheMb/3M6BgNoSs7hIbqyh65Z2PUHHiz0+uScD86afYpOuWf76mOTd50cYnkmW6TG
	saNO7wW5Ub1h33Q9/L9LEO3u2oK90NyJqWVzbX/tQaIodk7sOqoQiLih1dkoDRXcXj2I
	tdgb2q/BOz8WvJ4+vzeiGTMCxQITW1tc60VjowrV7c7t+/hJw+sRdRy2+ac3pBA7Xkt7
	s15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=txWQ51C0Rl6WzXtnab1D8OqfrR/IkXJBwpWqSxtaOA8=;
	b=MYK2CLnSgXMSbaoA3g0vHeRxHTuHHYX52kCqZ3Y865ZzMFeQ7EKrpDq4Dqy3vzM2vc
	cQ8Sf6vbpCTOC+61cJ8ei5yjVM+7KM6/LbBEwanSiNjiuB4DG9XZ5CuODV9rKvUj0ThR
	h7cr6NARcTmoGVFiQIR3nnfi6lh0IX4XeZO/zrZ4/lgpZIimLcn4F2gzumEf1Z5qPrli
	gnRNgIgT1o4t+Yecq5/AoS/TDCmKNcYTKHAZrvZKU4WASMVFa96TowvIenr2Zt3HCAQw
	TboMl6hiL9tVbscq2MTj/9CL6nlFwrK1QKKxyY19C5bmSueyyKSf2kUD/UrthhxgpCf6
	/nAg==
X-Gm-Message-State: APjAAAWOaKAeY4HG5bI+YRaqWSul+3CxsjgW1EFMa4QO0CssRuMsS4dp
	a88uBlkRQGp62YGmZNtNygk=
X-Received: by 2002:a50:9863:: with SMTP id h32mr11547133edb.291.1552564564762;
	Thu, 14 Mar 2019 04:56:04 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id f20sm351716edd.26.2019.03.14.04.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 04:56:03 -0700 (PDT)
Date: Thu, 14 Mar 2019 11:56:02 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190314115602.5qm3pdfj7kc7izoc@master>
References: <20190314073836.19874-1-richardw.yang@linux.intel.com>
	<20190314102514.1a5459ca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190314102514.1a5459ca@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v2] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRlQXp5SF6FP

On Thu, Mar 14, 2019 at 10:25:14AM +0100, Igor Mammedov wrote:
>On Thu, 14 Mar 2019 15:38:36 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> arm and i386 has almost the same function acpi_add_rom_blob(), except
>> giving different FWCfgCallback function.
>> 
>> This patch extract acpi_add_rom_blob() to aml-build.c by passing
>> FWCfgCallback to it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> 
>> ---
>> v2:
>>   * remove unused header in original source file
>> ---
>>  hw/acpi/aml-build.c         |  8 ++++++++
>>  hw/arm/virt-acpi-build.c    | 25 +++++++++----------------
>>  hw/i386/acpi-build.c        | 25 +++++++++----------------
>>  include/hw/acpi/aml-build.h |  4 ++++
>>  4 files changed, 30 insertions(+), 32 deletions(-)
>> 
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 555c24f21d..ed427f8310 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>I'd like to keep aml-build.c clean from not spec related code,
>Lets create a separate source file for QEMU specific code, something like
>hw/acpi/utils.(h|c)
>
>otherwise patch looks fine to me
>

Reasonable, thanks for this comment.

>
>> @@ -1559,6 +1559,14 @@ void *acpi_data_push(GArray *table_data, unsigned size)
>>      return table_data->data + off;
>>  }
>>  
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size)
>> +{
>> +    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>> +                        name, update, opaque, NULL, true);
>> +}
>> +
>>  unsigned acpi_data_len(GArray *table)
>>  {
>>      assert(g_array_get_element_size(table) == 1);
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 57679a89bf..f7fd0cf06a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -37,7 +37,6 @@
>>  #include "hw/acpi/acpi.h"
>>  #include "hw/nvram/fw_cfg.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>> -#include "hw/loader.h"
>>  #include "hw/hw.h"
>>  #include "hw/acpi/aml-build.h"
>>  #include "hw/pci/pcie_host.h"
>> @@ -881,14 +880,6 @@ static void virt_acpi_build_reset(void *build_opaque)
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
>> @@ -920,20 +911,22 @@ void virt_acpi_setup(VirtMachineState *vms)
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
>> index 416da318ae..bc6e4b1f01 100644
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
>> @@ -2842,14 +2841,6 @@ static void acpi_build_reset(void *build_opaque)
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
>> @@ -2891,14 +2882,15 @@ void acpi_setup(void)
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
>> @@ -2935,8 +2927,9 @@ void acpi_setup(void)
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
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 1a563ad756..4945aeef5b 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -3,6 +3,7 @@
>>  
>>  #include "hw/acpi/acpi-defs.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>> +#include "hw/loader.h"
>>  
>>  /* Reserve RAM space for tables: add another order of magnitude. */
>>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
>> @@ -383,6 +384,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
>>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
>>               const char *oem_id, const char *oem_table_id);
>>  void *acpi_data_push(GArray *table_data, unsigned size);
>> +MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>> +                                GArray *blob, const char *name,
>> +                                uint64_t max_size);
>>  unsigned acpi_data_len(GArray *table);
>>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
>>  void acpi_build_tables_init(AcpiBuildTables *tables);
>

-- 
Wei Yang
Help you, Help me
