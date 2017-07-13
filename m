Received: by 10.25.44.15 with SMTP id s15csp2078034lfs;
        Thu, 13 Jul 2017 05:05:39 -0700 (PDT)
X-Received: by 10.233.237.132 with SMTP id c126mr4414256qkg.215.1499947539741;
        Thu, 13 Jul 2017 05:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499947539; cv=none;
        d=google.com; s=arc-20160816;
        b=NMjG26tnZG/tv8W/KbT85XpeX6ahzkw/gHifmzZc4nfpsKMDn+mmlvRkE2P8CdBVvH
         puyOBPw6DTxwVBIWLGrBV8Xr+1SNnxpM+B0lUbojkvJANsM2pfSIVlX7WmbFtgaq4Uxk
         mKlNtB4iK4CFDzsDGXxpztQapFrmabhy/szPsSgosTLyVKlcD1dIXDnOosSh/Od0J3Du
         s3yw/tHHM/9hLWXcCdIIYF++zQEdHZzGq/X2urEgmKW6NgYY13aLm4YOq8Ixks8VJklL
         kEsLHKhXDKxa6C7P5eW6trGRiClVHZYwYIM5L7lOZEg385HM4IOpCEdlF486/dbDc4h8
         ToQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=4RUhh/Xm80eCfH3d2Y1G7uJUX10Ztn7Tq7sLJMT7ioA=;
        b=lTsr6kgSVu0oU96QpC9H6Ssr8jjYTkMvBhXbuAZMiq55pW47nwKZeqDKLABLb2rHya
         giu1JKrMY9nbaOORow1AC1/55/KKZVSDOY5n472WH0lNHT7uAJvbxz1vnaBuf9Dbupzm
         Bf4whMojW0nKu9v9pqA6x4tkXlpbziRIer3ET4IFzQtMk+1jnF2qpEMfooGHa+x5z4BZ
         rsCVp0HZbnO444+4AF1YrpFWi/0NQK88iGxz88mL70KSHGKXwx/u2eXPogh2JsfiU5/v
         xcA2FAhGL08DHLO5qDRoxx4FJjnoZ1z6QHdbEjVvDxTV8ldmK0+eHuyRIyLApbBIOhDL
         8l2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s39si4853027qte.87.2017.07.13.05.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 05:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVcrs-0002Zu-0B
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 08:05:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVcrc-0002PU-WB
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVcrZ-0004Ho-MJ
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:05:00 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dVcrY-0004BI-AT; Thu, 13 Jul 2017 08:04:57 -0400
Received: from 172.30.72.54 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AQZ17582; Thu, 13 Jul 2017 20:01:23 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Thu, 13 Jul 2017
	20:01:15 +0800
To: Laszlo Ersek <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>, 
	<famz@redhat.com>, <qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<james.morse@arm.com>, <zhengqiang10@huawei.com>,
	<huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
	Gaozhihui <zhihui.gao@huawei.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
Date: Thu, 13 Jul 2017 20:00:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.59676115.002A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b80903ea5934f136513a00e45c5cabfd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI
 structures and macros
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9VbshRfEEft

Laszlo,
  Thank you for your review and comments.


On 2017/7/13 18:33, Laszlo Ersek wrote:
> On 07/12/17 04:08, Dongjiu Geng wrote:
>> (1) Add related APEI/HEST table structures and  macros, these
>>     definition refer to ACPI 6.1 and UEFI 2.6 spec.
>> (2) Add generic error status block and CPER memory section
>>     definition, user space only handle memory section errors.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> This patch looks generally good to me; let me comment on the code
> organization:
> 
> (a) Please make the subject less generic. For example,
> 
>   ACPI: add APEI/HEST/CPER structures and macros
  Ok, got it.

> 
>> ---
>> thanks Laszlo and Michael's review:
>>
>> chnage since v4:
>> (1) fix email threading in this series is incorrect issue
>>
>> change since v3:
>> (1) separate the original one patch into three patches: one is new
>>     ACPI structures and macros, another is C source file to generate ACPI HEST
>>     table and dynamically record CPER ,final patch is the change about Makefile
>>     and configuration
>> (2) add comments about where the ACPI structures and macros come from, for example,
>>     they come from the UEFI Spec 2.6, "xxxxxxxxxxxx"; ACPI 6.1 spec, 
>>     "xxxxxxxxxxxxxx".
>> (3) correct the macros name, for emaple, prefix some macro names with
>>     "UEFI_".
>> (4) remove the uuid_le struct and use the QemuUUID in the include/qemu/uuid.h"
>> (5) remove the duplicate ACPI address space, because it already defined in 
>>     the "include/hw/acpi/aml-build.h"
>> (6) remove the acpi_generic_address structure because same definition exists in the 
>>     AcpiGenericAddress.
>> (7) rename the struct acpi_hest_notify to AcpiHestNotifyType
>> (8) rename the struct acpi_hest_types to AcpiHestSourceType
>> (9) rename enum constants AcpiHestSourceType to ACPI_HEST_SOURCE_xxx from
>>      ACPI_HEST_TYPE_xxx
>> (10) remove the NOT_USED{3,4,5} enum constants in the AcpiHestSourceType.
>> (11) add missed QEMU_PACKED for the struct definition.
>> (12) remove the defnition of AcpiGenericErrorData, and rename the
>>      AcpiGenericErrorDataV300 to AcpiGenericErrorData.
>> (13) use the QemuUUID type for the "section_type" field AcpiGenericErrorData, and rename it
>>      to section_type_le.
>> (14) moving type AcpiGenericErrorSeverity above AcpiGenericErrorData and
>>      AcpiGenericErrorDataV300, and remarking on the "error_severity" fields
>>      that they take their values from AcpiGenericErrorSeverity
>> (15) remove the wrongly call to BERT(Boot Error Record Table)
>> (16) add comments for the struction member, for example, pint out that
>>      the block_status member in the AcpiGenericErrorStatus is a bitmask
>>      composed of ACPI_GEBS_xxx macros
>> (17) remove the hardware error source notification type list, and rename
>>      the MAX_ERROR_SOURCE_COUNT_V6 to ACPI_HEST_NOTIFY_RESERVED.
>> (18) remove the physical_addr member of GhesErrorState
>> (19) change the "uint64_t ghes_addr_le[8]" in GhesErrorState to uint64_t ghes_addr_le
>> (20) change the second parameter to "error_physical_addr" in the ghes_update_guest
>>      API statement
>> ---
>>  include/hw/acpi/acpi-defs.h | 194 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/acpi/aml-build.h |   1 +
>>  include/hw/acpi/hest_ghes.h |  47 +++++++++++
>>  include/qemu/uuid.h         |  11 +++
>>  4 files changed, 253 insertions(+)
>>  create mode 100644 include/hw/acpi/hest_ghes.h
>>
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index 4cc3630..0756339 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -15,6 +15,7 @@
>>  #ifndef QEMU_ACPI_DEFS_H
>>  #define QEMU_ACPI_DEFS_H
>>  
>> +#include "qemu/uuid.h"
> 
> (b) This is what I first thought upon seeing this:
> 
> 'I don't think this should be included here. You don't use UUID_BE or
> UEFI_CPER_SEC_PLATFORM_MEM anywhere in this patch. So whatever uses
> those macros can include "qemu/uuid.h" directly.'
> 
> However, after all, I think this #include is OK here, with a
> modification lower down.
> 
>>  enum {
>>      ACPI_FADT_F_WBINVD,
>>      ACPI_FADT_F_WBINVD_FLUSH,
>> @@ -295,6 +296,44 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
>>  #define ACPI_APIC_GENERIC_TRANSLATOR    15
>>  #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
>>  
>> +/* UEFI Spec 2.6, "N.2.5 Memory Error Section */
>> +#define UEFI_CPER_MEM_VALID_ERROR_STATUS     0x0001
>> +#define UEFI_CPER_MEM_VALID_PA               0x0002
>> +#define UEFI_CPER_MEM_VALID_PA_MASK          0x0004
>> +#define UEFI_CPER_MEM_VALID_NODE             0x0008
>> +#define UEFI_CPER_MEM_VALID_CARD             0x0010
>> +#define UEFI_CPER_MEM_VALID_MODULE           0x0020
>> +#define UEFI_CPER_MEM_VALID_BANK             0x0040
>> +#define UEFI_CPER_MEM_VALID_DEVICE           0x0080
>> +#define UEFI_CPER_MEM_VALID_ROW              0x0100
>> +#define UEFI_CPER_MEM_VALID_COLUMN           0x0200
>> +#define UEFI_CPER_MEM_VALID_BIT_POSITION     0x0400
>> +#define UEFI_CPER_MEM_VALID_REQUESTOR        0x0800
>> +#define UEFI_CPER_MEM_VALID_RESPONDER        0x1000
>> +#define UEFI_CPER_MEM_VALID_TARGET           0x2000
>> +#define UEFI_CPER_MEM_VALID_ERROR_TYPE       0x4000
>> +#define UEFI_CPER_MEM_VALID_RANK_NUMBER      0x8000
>> +#define UEFI_CPER_MEM_VALID_CARD_HANDLE      0x10000
>> +#define UEFI_CPER_MEM_VALID_MODULE_HANDLE    0x20000
>> +#define UEFI_CPER_MEM_ERROR_TYPE_MULTI_ECC   3
>> +
>> +/* This is from the ACPI 6.1 spec, "18.3.2.9 Hardware Error Notification" */
>> +
>> +enum AcpiHestNotifyType {
>> +    ACPI_HEST_NOTIFY_POLLED = 0,
>> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
>> +    ACPI_HEST_NOTIFY_LOCAL = 2,
>> +    ACPI_HEST_NOTIFY_SCI = 3,
>> +    ACPI_HEST_NOTIFY_NMI = 4,
>> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
>> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
>> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
>> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
>> +    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1 */
>> +    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1 */
>> +    ACPI_HEST_NOTIFY_RESERVED = 11  /* 11 and greater are reserved */
>> +};
>> +
>>  /*
>>   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
>>   */
>> @@ -475,6 +514,161 @@ struct AcpiSystemResourceAffinityTable
>>  } QEMU_PACKED;
>>  typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
>>  
>> +/* Hardware Error Notification, this is from the ACPI 6.1
>> + * spec, "18.3.2.9 Hardware Error Notification"
>> + */
>> +struct AcpiHestNotify {
>> +    uint8_t type;
>> +    uint8_t length;
>> +    uint16_t config_write_enable;
>> +    uint32_t poll_interval;
>> +    uint32_t vector;
>> +    uint32_t polling_threshold_value;
>> +    uint32_t polling_threshold_window;
>> +    uint32_t error_threshold_value;
>> +    uint32_t error_threshold_window;
>> +} QEMU_PACKED;
>> +typedef struct AcpiHestNotify AcpiHestNotify;
>> +
>> +/* These are from ACPI 6.1, sections "18.3.2.1 IA-32 Architecture Machine
>> + * Check Exception" through "18.3.2.8 Generic Hardware Error Source version 2".
>> + */
>> +enum AcpiHestSourceType {
>> +    ACPI_HEST_SOURCE_IA32_CHECK = 0,
>> +    ACPI_HEST_SOURCE_IA32_CORRECTED_CHECK = 1,
>> +    ACPI_HEST_SOURCE_IA32_NMI = 2,
>> +    ACPI_HEST_SOURCE_AER_ROOT_PORT = 6,
>> +    ACPI_HEST_SOURCE_AER_ENDPOINT = 7,
>> +    ACPI_HEST_SOURCE_AER_BRIDGE = 8,
>> +    ACPI_HEST_SOURCE_GENERIC_ERROR = 9,
>> +    ACPI_HEST_SOURCE_GENERIC_ERROR_V2 = 10,
>> +    ACPI_HEST_SOURCE_RESERVED = 11    /* 11 and greater are reserved */
>> +};
>> +
>> +/* Block Status bitmasks from ACPI 6.1, "18.3.2.7.1 Generic Error Data" */
>> +#define ACPI_GEBS_UNCORRECTABLE             (1)
>> +#define ACPI_GEBS_CORRECTABLE               (1 << 1)
>> +#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE    (1 << 2)
>> +#define ACPI_GEBS_MULTIPLE_CORRECTABLE      (1 << 3)
>> +/* 10 bits, error count */
>> +#define ACPI_GEBS_ERROR_ENTRY_COUNT         (0x3FF << 4)
>> +
>> +/* Generic Hardware Error Source Structure, refer to ACPI 6.1
>> + * "18.3.2.7 Generic Hardware Error Source". in this struct the
>> + * "type" field has to be ACPI_HEST_SOURCE_GENERIC_ERROR
>> + */
>> +
>> +struct AcpiGenericHardwareErrorSource {
>> +    uint16_t type;
>> +    uint16_t source_id;
>> +    uint16_t related_source_id;
>> +    uint8_t flags;
>> +    uint8_t enabled;
>> +    uint32_t number_of_records;
>> +    uint32_t max_sections_per_record;
>> +    uint32_t max_raw_data_length;
>> +    struct AcpiGenericAddress error_status_address;
>> +    struct AcpiHestNotify notify;
>> +    uint32_t error_status_block_length;
>> +} QEMU_PACKED;
>> +typedef struct AcpiGenericHardwareErrorSource AcpiGenericHardwareErrorSource;
>> +
>> +/* Generic Hardware Error Source, version 2, ACPI 6.1, "18.3.2.8 Generic
>> + * Hardware Error Source version 2", in this struct the "type" field has to
>> + * be ACPI_HEST_SOURCE_GENERIC_ERROR_V2
>> + */
>> +struct AcpiGenericHardwareErrorSourceV2 {
>> +    uint16_t type;
>> +    uint16_t source_id;
>> +    uint16_t related_source_id;
>> +    uint8_t flags;
>> +    uint8_t enabled;
>> +    uint32_t number_of_records;
>> +    uint32_t max_sections_per_record;
>> +    uint32_t max_raw_data_length;
>> +    struct AcpiGenericAddress error_status_address;
>> +    struct AcpiHestNotify notify;
>> +    uint32_t error_status_block_length;
>> +    struct AcpiGenericAddress read_ack_register;
>> +    uint64_t read_ack_preserve;
>> +    uint64_t read_ack_write;
>> +} QEMU_PACKED;
>> +typedef struct AcpiGenericHardwareErrorSourceV2
>> +            AcpiGenericHardwareErrorSourceV2;
>> +
>> +/* Generic Error Status block, this is from ACPI 6.1,
>> + * "18.3.2.7.1 Generic Error Data"
>> + */
>> +struct AcpiGenericErrorStatus {
>> +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
>> +    uint32_t block_status;
>> +    uint32_t raw_data_offset;
>> +    uint32_t raw_data_length;
>> +    uint32_t data_length;
>> +    uint32_t error_severity;
>> +} QEMU_PACKED;
>> +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;
>> +
>> +enum AcpiGenericErrorSeverity {
>> +    ACPI_CPER_SEV_RECOVERABLE,
>> +    ACPI_CPER_SEV_FATAL,
>> +    ACPI_CPER_SEV_CORRECTED,
>> +    ACPI_CPER_SEV_NONE,
>> +};
>> +
>> +/* Generic Error Data entry, revision number is 0x0300,
>> + * ACPI 6.1, "18.3.2.7.1 Generic Error Data"
>> + */
>> +struct AcpiGenericErrorData {
>> +    QemuUUID section_type_le;
>> +    /* The "error_severity" fields that they take their
>> +     * values from AcpiGenericErrorSeverity
>> +     */
>> +    uint32_t error_severity;
>> +    uint16_t revision;
>> +    uint8_t validation_bits;
>> +    uint8_t flags;
>> +    uint32_t error_data_length;
>> +    uint8_t fru_id[16];
>> +    uint8_t fru_text[20];
>> +    uint64_t time_stamp;
>> +} QEMU_PACKED;
>> +typedef struct AcpiGenericErrorData AcpiGenericErrorData;
>> +
>> +/* This is from UEFI 2.6, "N.2.5 Memory Error Section" */
>> +struct UefiCperSecMemErr {
>> +    uint64_t    validation_bits;
>> +    uint64_t    error_status;
>> +    uint64_t    physical_addr;
>> +    uint64_t    physical_addr_mask;
>> +    uint16_t    node;
>> +    uint16_t    card;
>> +    uint16_t    module;
>> +    uint16_t    bank;
>> +    uint16_t    device;
>> +    uint16_t    row;
>> +    uint16_t    column;
>> +    uint16_t    bit_pos;
>> +    uint64_t    requestor_id;
>> +    uint64_t    responder_id;
>> +    uint64_t    target_id;
>> +    uint8_t     error_type;
>> +    uint8_t     reserved;
>> +    uint16_t    rank;
>> +    uint16_t    mem_array_handle;   /* card handle in UEFI 2.4 */
>> +    uint16_t    mem_dev_handle;     /* module handle in UEFI 2.4 */
>> +} QEMU_PACKED;
>> +typedef struct UefiCperSecMemErr UefiCperSecMemErr;
>> +
>> +/*
>> + * HEST Description Table
>> + */
>> +struct AcpiHardwareErrorSourceTable {
>> +    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
>> +    uint32_t           error_source_count;
>> +} QEMU_PACKED;
>> +typedef struct AcpiHardwareErrorSourceTable AcpiHardwareErrorSourceTable;
>> +
>>  #define ACPI_SRAT_PROCESSOR_APIC     0
>>  #define ACPI_SRAT_MEMORY             1
>>  #define ACPI_SRAT_PROCESSOR_x2APIC   2
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 00c21f1..c1d15b3 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -211,6 +211,7 @@ struct AcpiBuildTables {
>>      GArray *rsdp;
>>      GArray *tcpalog;
>>      GArray *vmgenid;
>> +    GArray *hardware_errors;
>>      BIOSLinker *linker;
>>  } AcpiBuildTables;
>>  
> 
> (c) I think that this hunk belongs with the implementation (patch #2),
> not with the ACPI struct / macro introduction patch.
   yes, the "aml-build.h" and "hest_ghes.h" modification is about the HEST/GHES generation
   and CPER record, it should be remove to (patch #2). I will change it.

> 
>> diff --git a/include/hw/acpi/hest_ghes.h b/include/hw/acpi/hest_ghes.h
>> new file mode 100644
>> index 0000000..0772756
>> --- /dev/null
>> +++ b/include/hw/acpi/hest_ghes.h
>> @@ -0,0 +1,47 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> +
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * Authors:
>> + *   Dongjiu Geng <gengdongjiu@huawei.com>
>> + *
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef ACPI_GHES_H
>> +#define ACPI_GHES_H
>> +
>> +#include "hw/acpi/bios-linker-loader.h"
>> +
>> +#define GHES_ERRORS_FW_CFG_FILE      "etc/hardware_errors"
>> +#define GHES_DATA_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
>> +
>> +#define GHES_GAS_ADDRESS_OFFSET              4
>> +#define GHES_ERROR_STATUS_ADDRESS_OFFSET     20
>> +#define GHES_NOTIFICATION_STRUCTURE          32
>> +
>> +#define GHES_CPER_OK   1
>> +#define GHES_CPER_FAIL 0
>> +
>> +#define GHES_ACPI_HEST_NOTIFY_RESERVED           11
>> +/* The max size in Bytes for one error block */
>> +#define GHES_MAX_RAW_DATA_LENGTH                 0x1000
>> +
>> +
>> +typedef struct GhesState {
>> +    uint64_t ghes_addr_le;
>> +} GhesState;
>> +
>> +void ghes_build_acpi(GArray *table_data, GArray *hardware_error,
>> +                            BIOSLinker *linker);
>> +void ghes_add_fw_cfg(FWCfgState *s, GArray *hardware_errors);
>> +bool ghes_update_guest(uint32_t notify, uint64_t error_physical_addr);
>> +#endif
> 
> (d) same comment as (c)
 got it.

> 
>> diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
>> index afe4840..99c4041 100644
>> --- a/include/qemu/uuid.h
>> +++ b/include/qemu/uuid.h
>> @@ -44,6 +44,17 @@ typedef struct {
>>  
>>  #define UUID_NONE "00000000-0000-0000-0000-000000000000"
>>  
>> +#define UUID_BE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)        \
>> +{{{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
>> +   ((b) >> 8) & 0xff, (b) & 0xff,                   \
>> +    ((c) >> 8) & 0xff, (c) & 0xff,                    \
>> +    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) } } }
>> +
>> +/* Platform Memory, this is from UEFI 2.6 N.2.2 Section Descriptor */
>> +#define UEFI_CPER_SEC_PLATFORM_MEM                   \
>> +    UUID_BE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>> +    0xED, 0x7C, 0x83, 0xB1)
>> +
>>  void qemu_uuid_generate(QemuUUID *out);
>>  
>>  int qemu_uuid_is_null(const QemuUUID *uu);
>>
> 
> (e) I think the addition of UUID_BE should be split out to a separate
> patch; it adds a general facility. It should likely be the very first
> patch in the series.
  Ok.

> 
> (f) While I think it is justified to have UUID_BE() in "qemu/uuid.h", I
> think UEFI_CPER_SEC_PLATFORM_MEM is too specific to have here.
> 
> If UEFI_CPER_SEC_PLATFORM_MEM were *not* a standardized UUID, I would
> suggest moving it to the implementation ("include/hw/acpi/hest_ghes.h"
> -- which in turn should be moved to patch #2, see my remark (d)), *plus*
> I would suggest eliminating the new #include from "acpi-defs.h", see my
> remark (b).
  understand your idea.

> 
> However, given that this UUID *is* standard, I suggest keeping the (b)
> #include as you currently propose, and to move the definition of
> UEFI_CPER_SEC_PLATFORM_MEM to "acpi-defs.h".
  I agree with you.

> 
> I vaguely recall that Michael commented on this previously, but I don't
> remember what he said. Michael, are you OK with my suggestion?
   Laszlo, I pasted Michael's comments here, as shown below. Michael said the definition
should use build_append_int_noprefix to add data. but I think it may not good, becuase
the section "UEFI_CPER_SEC_PLATFORM_MEM" is runtime recorded as CPER, not a ACPI/HEST
table member, so it is not generated when system boot up. On the other hand,UEFI_CPER_SEC_PLATFORM_MEM
definition is from UEFI spec 2.6, N.2.2 Section Descriptor: {0xA5BC1114, 0x6F64, 0x4EDE, {0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C, 0x83, 0xB1}}.
if use  build_append_int_noprefix to add, may confuse others.

-----------------------------------------------------------------
-----------------------------------------------------------------
There's no reason to define these messy one-time use macros.
They just make it hard to look things up in the spec.


You can use build_append_int_noprefix to add data of
any length in LE format.
-----------------------------------------------------------------
-----------------------------------------------------------------

Hi  Michael,
  what is your suggestion about it? do you agree with Laszlo?


> 
> Thanks
> Laszlo
> 
> .
> 

