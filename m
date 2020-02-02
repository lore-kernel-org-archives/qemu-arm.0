Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2842463lfp;
        Sun, 2 Feb 2020 04:45:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf/sU8EuC3kq5/jQd/Mq1xmazuLHqiMWkguoGDBggmb6HBqWwm4NkRIt6hQugUQiFnUB6F
X-Received: by 2002:ac8:7501:: with SMTP id u1mr19604721qtq.149.1580647505220;
        Sun, 02 Feb 2020 04:45:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580647505; cv=none;
        d=google.com; s=arc-20160816;
        b=otZfrZuXkPqJIsw1J3rpnTVd9l9NPNdLQOgK1FWVXix1cR4iP2dEj/Yh3ZlwGb+nt0
         V8WfcBfxIwnSNhg16hUmU8S6LptvnA9cBMAQtaYUIq4GlkjIXN6JP2xvkd11VSPF16fj
         0neG8hEV+yhOLb9wi2KbVvlBM7HnRLN3upnbO61uby0nmPO95JkOfHqS/1ajYh26AuRo
         NLD6CLHWU7DPm//+645Z/tM//lbBJqIR0o/byDQ4SN1hTjABxRteaDwuFRvhhPNHAbZt
         TpckbwOEP6jdTnLDkpZhYvXqdqUssNNVAgSzzVZlv2msQcm1/wlLoHo4IqcJgxHdZTfW
         pqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=VC9YQaQfID+O2MRdbcjvH6jHFtsU0McJQTPJxZWr4xg=;
        b=tS32EXcfhUQzmXdxjm79xhDDSPSuoCwlPzhzqJdkSFXZfPGOASsOE8DlpZOjOxPt8K
         AHJZXcM7qvw3CfnBvbzXDicGTcD9ZpaiJoW7YQp436rsrx2rD+OsfY4ZpJmgZW3kqOSn
         qaK0Q4VHf91Lahoh2tr1KalJV+RYnAPh8tT5kxbHzsezHTYv5QPjyIt0aKrFph1hR787
         sjZu5EZaY0jOS6dOCEXckAX2qoGuvkwvD6co/DV8v2Tss9hkBFLHE98xdDjTgYyAGI27
         beBOd26ZHf6ABO4J6QJVDY3lHmlziaV5k79mdI6uFjWj/BkNzhtZVAuNyS4xhWJlz/ht
         dk3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si10705426qki.1.2020.02.02.04.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 04:45:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyEca-0005A5-LV
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 07:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1iyEcT-00059x-6I
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 07:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1iyEcR-0006k7-ME
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 07:44:57 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:44612 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1iyEcR-0006fq-4J; Sun, 02 Feb 2020 07:44:55 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4A0BD4F90B04E2EBA13E;
 Sun,  2 Feb 2020 20:44:43 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sun, 2 Feb 2020
 20:44:37 +0800
Subject: Re: [PATCH v22 5/9] ACPI: Record the Generic Error Status Block
 address
To: Igor Mammedov <imammedo@redhat.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-6-git-send-email-gengdongjiu@huawei.com>
 <20200128154110.04baa5bc@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <02a78eff-865c-b9e0-6d5f-d4caa4daa98d@huawei.com>
Date: Sun, 2 Feb 2020 20:44:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20200128154110.04baa5bc@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, linuxarm@huawei.com, shannon.zhaosl@gmail.com,
 zhengxiang9@huawei.com, qemu-arm@nongnu.org, james.morse@arm.com,
 xuwei5@huawei.com, jonathan.cameron@huawei.com, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kpvQE1Tw1kUj

sorry for the late response due to Chinese new year

On 2020/1/28 22:41, Igor Mammedov wrote:
> On Wed, 8 Jan 2020 19:32:19 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
> in addition to comments of others:
> 
>> Record the GHEB address via fw_cfg file, when recording
>> a error to CPER, it will use this address to find out
>> Generic Error Data Entries and write the error.
>>
>> Make the HEST GHES to a GED device.
> 
> It's hard to parse this even kno
> Pls rephrase/make commit message more verbose,
> so it would describe why and what patch is supposed to do
Ok, thanks for the comments.

> 
> 
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  hw/acpi/generic_event_device.c         | 15 ++++++++++++++-
>>  hw/acpi/ghes.c                         | 16 ++++++++++++++++
>>  hw/arm/virt-acpi-build.c               | 13 ++++++++++++-
>>  include/hw/acpi/generic_event_device.h |  2 ++
>>  include/hw/acpi/ghes.h                 |  6 ++++++
>>  5 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>> index 9cee90c..9bf37e4 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -234,12 +234,25 @@ static const VMStateDescription vmstate_ged_state = {
>>      }
>>  };
>>  
>> +static const VMStateDescription vmstate_ghes_state = {
>> +    .name = "acpi-ghes-state",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields      = (VMStateField[]) {
>> +        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static const VMStateDescription vmstate_acpi_ged = {
>>      .name = "acpi-ged",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>>      .fields = (VMStateField[]) {
>> -        VMSTATE_STRUCT(ged_state, AcpiGedState, 1, vmstate_ged_state, GEDState),
>> +        VMSTATE_STRUCT(ged_state, AcpiGedState, 1,
>> +                       vmstate_ged_state, GEDState),
>> +        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
>> +                       vmstate_ghes_state, AcpiGhesState),
>>          VMSTATE_END_OF_LIST(),
>>      },
>>      .subsections = (const VMStateDescription * []) {
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 9d37798..68f4abf 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -23,6 +23,7 @@
>>  #include "hw/acpi/acpi.h"
>>  #include "hw/acpi/ghes.h"
>>  #include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/generic_event_device.h"
>>  #include "hw/nvram/fw_cfg.h"
>>  #include "sysemu/sysemu.h"
>>  #include "qemu/error-report.h"
>> @@ -208,3 +209,18 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>>      build_header(linker, table_data, (void *)(table_data->data + hest_start),
>>          "HEST", table_data->len - hest_start, 1, NULL, "");
>>  }
>> +
>> +void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>> +                            GArray *hardware_error)
> 
> not aligned properly

will modify it.

> 
>> +{
>> +    size_t size = 2 * sizeof(uint64_t) + ACPI_GHES_MAX_RAW_DATA_LENGTH;
>> +    size_t request_block_size = ACPI_GHES_ERROR_SOURCE_COUNT * size;
>> +
>> +    /* Create a read-only fw_cfg file for GHES */
>> +    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
>> +                    request_block_size);
>> +
>> +    /* Create a read-write fw_cfg file for Address */
>> +    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
>> +        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
>> +}
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 837bbf9..c8aa94d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -797,6 +797,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      unsigned dsdt, xsdt;
>>      GArray *tables_blob = tables->table_data;
>>      MachineState *ms = MACHINE(vms);
>> +    AcpiGedState *acpi_ged_state;
>>  
>>      table_offsets = g_array_new(false, true /* clear */,
>>                                          sizeof(uint32_t));
>> @@ -831,7 +832,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>  
>> -    if (vms->ras) {
>> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>> +                                                       NULL));
>> +    if (acpi_ged_state &&  vms->ras) {
> 
> there is vms->acpi_dev which is GED, so you don't need to look it up
> 
> suggest:
   Thanks for the suggestion.

>  if (ras) {
>     assert(ged)
      assert(vms->acpi_dev), right?

>     do other fun stuff ...
>  }

> 
>>          acpi_add_table(table_offsets, tables_blob);
>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>          acpi_build_hest(tables_blob, tables->hardware_errors,
>> @@ -925,6 +928,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>>  {
>>      AcpiBuildTables tables;
>>      AcpiBuildState *build_state;
>> +    AcpiGedState *acpi_ged_state;
>>  
>>      if (!vms->fw_cfg) {
>>          trace_virt_acpi_setup();
>> @@ -955,6 +959,13 @@ void virt_acpi_setup(VirtMachineState *vms)
>>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>>                      acpi_data_len(tables.tcpalog));
>>  
>> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>> +                                                       NULL));
>> +    if (acpi_ged_state && vms->ras) {
> 
> ditto

Ok.

> 
>> +        acpi_ghes_add_fw_cfg(&acpi_ged_state->ghes_state,
>> +                             vms->fw_cfg, tables.hardware_errors);
>> +    }
>> +
>>      build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
>>                                               build_state, tables.rsdp,
>>                                               ACPI_BUILD_RSDP_FILE, 0);
>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>> index d157eac..037d2b5 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -61,6 +61,7 @@
>>  
>>  #include "hw/sysbus.h"
>>  #include "hw/acpi/memory_hotplug.h"
>> +#include "hw/acpi/ghes.h"
>>  
>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>  
>> @@ -95,6 +96,7 @@ typedef struct AcpiGedState {
>>      GEDState ged_state;
>>      uint32_t ged_event_bitmap;
>>      qemu_irq irq;
>> +    AcpiGhesState ghes_state;
>>  } AcpiGedState;
>>  
>>  void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
>> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
>> index 09a7f86..a6761e6 100644
>> --- a/include/hw/acpi/ghes.h
>> +++ b/include/hw/acpi/ghes.h
>> @@ -60,7 +60,13 @@ enum {
>>      ACPI_HEST_SRC_ID_RESERVED,
>>  };
>>  
>> +typedef struct AcpiGhesState {
>> +    uint64_t ghes_addr_le;
>> +} AcpiGhesState;
>> +
>>  void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
>>  void acpi_build_hest(GArray *table_data, GArray *hardware_error,
>>                            BIOSLinker *linker);
>> +void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>> +                          GArray *hardware_errors);
>>  #endif
> 
> .
> 

