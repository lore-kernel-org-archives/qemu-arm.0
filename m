Received: by 10.223.134.117 with SMTP id 50csp11447871wrw;
        Tue, 2 Jan 2018 18:21:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBouzGitCDC9HZHDhC9aSU2h0ZFYLTmmm2v/87iLW3BXtlc/fvbvKiao0GO6W7mTNtzIDzzr1
X-Received: by 10.98.5.196 with SMTP id 187mr34008pff.66.1514946095618;
        Tue, 02 Jan 2018 18:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514946095; cv=none;
        d=google.com; s=arc-20160816;
        b=TODsiIccP0lBt6mUfhd3+RrUyPh/rdcKXXsUmQcJXvF7MkIV2ihBr51fhZ3DAwfjjF
         tq8jwiWgn0yBjEAU95L6g24VDacCqt7wdnNpFPE7ThT9N+yMfkeEHcCYRyq2AoJSKaRw
         dG9mYpJUS7rtvjso5g1xBy7sS+nFeZ/1s04X/Dha+glrY/OtGOaO8pGgbbcFsaPZWA1i
         1lRUY3ICr8me6nENxDXbVgZRarKOtnNPIfjO8mC+CdV3kECNdKhA5VrGPOEqVyp9cjIv
         xDH3ah/GKwrsQbh1FYXH/QDseHbC0L38xEfPjfyeo6gIrinHSoC6IMzjHcOKrhisGMWu
         aYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=2Jgw0JG9sz2Lp4R4PlrUWi5mptkseFXs/xQXuKc6WQ4=;
        b=hU95UBUzk9M7IbHYiGfOqKdPycNAv4ujesvyhWJhKQLXIDfFh50OEb/ZClkSjDuFvj
         7MsNUHQDUnps6sQ5P38lWkuY4X1tCOYh7xl+VJ6LiD1XMD3DvkVf+uua975lZApJ01FF
         WeLSAbQ+7s7TggAkAePArir9Cqp1S9+GRv2FTgSYGIYhT9SP+XTaXIYnoKPklnd1iifA
         RfXX/QXaFPcaA8m9m6PpH7Z/pEdR/MCV9UQAWAhRoCDJypm8FlhPnvxmtu6g2y0c1XaJ
         Hk+v4wn5uN1c5ol6eE+cOvCvMlw0dFGZ0MBWUPzFzlQBTBAl2H7jMZw4Zqx6HZvnzw0F
         36sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u12si7268pgq.520.2018.01.02.18.21.35;
        Tue, 02 Jan 2018 18:21:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751211AbeACCVc (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 2 Jan 2018 21:21:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3662 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751158AbeACCVa (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 Jan 2018 21:21:30 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 99E305DB98B14;
        Wed,  3 Jan 2018 10:21:17 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.361.1; Wed, 3 Jan 2018
 10:21:10 +0800
Subject: Re: [PATCH v14 2/9] ACPI: Add APEI GHES table generation and CPER
 record support
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-3-git-send-email-gengdongjiu@huawei.com>
 <20171228151809.10495a90@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
Date:   Wed, 3 Jan 2018 10:21:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228151809.10495a90@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Owrfu439ewcy

Hi Igor,
   sorry for my late response due to new year holiday.

On 2017/12/28 22:18, Igor Mammedov wrote:
> On Thu, 28 Dec 2017 13:54:11 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
>> This implements APEI GHES Table generation and record CPER in
>> runtime via fw_cfg blobs.Now we only support two types of GHESv2,
>> which are GPIO-Signal and ARMv8 SEA. Afterwards, we can extend the
>> supported type if needed. For the CPER section type, currently it
> s/type/types/
Ok

> 
>> is memory section because kernel manly wants userspace to handle
> s/manly/mainly/
Ok

> 
>> the memory errors. 
> 
>> In order to simulation, we hard code the error
>> type to Multi-bit ECC.
> Not sure what this is about, care to elaborate?

please see Memory Error Record in [1], in which the "Memory Error Type" field is used to describe the
error type, such as  Multi-bit ECC or Parity Error etc. Because KVM or host does not pass the memory
error type to Qemu, so Qemu does not know what is the error type for the memory section. Hence we let QEMU simulate
the error type to Multi-bit ECC.

[1]:
UEFI Spec 2.6 Errata A:

"N.2.5 Memory Error Section"
-----------------+---------------+--------------+-------------------------------------------+
        Mnemonic |   Byte Offset |  Byte Length |        Description                        |
-----------------+---------------+--------------+-------------------------------------------+
        ........ |  ............ |  .........   |        ...........                        |
-----------------+---------------+--------------+-------------------------------------------+
Memory Error Type|     72        |       1      |Identifies the type of error that occurred:|
		 |		 |		| 0 – Unknown                              |
		 |		 |		| 1 – No error                             |
		 |		 |		| 2 – Single-bit ECC                       |
		 |		 |		| 3 – Multi-bit ECC                        |
		 |		 |		| 4 – Single-symbol ChipKill ECC           |
		 |		 |		| 5 – Multi-symbol ChipKill ECC            |
		 |		 |		| 6 – Master abort			    |
		 |		 |		| 7 – Target abort			    |
		 |		 |		| 8 – Parity Error			    |
		 |		 |		| 9 – Watchdog timeout			    |
		 |		 |		| 10 – Invalid address			    |
		 |		 |		| 11 – Mirror Broken			    |
		 |		 |		| 12 – Memory Sparing			    |
		 |		 |		| 13 - Scrub corrected error		    |
		 |		 |		| 14 - Scrub uncorrected error		    |
		 |		 |		| 15 - Physical Memory Map-out event	    |
		 |		 |		| All other values reserved.		    |
-----------------+---------------+--------------+-------------------------------------------+
        ........ |  ............ |  .........   |        ...........                        |
-----------------+---------------+--------------+-------------------------------------------+
> 
> 
>> For GHESv2 error source, the OSPM must acknowledges the error via
>> Read ACK register. So user space must check the ACK value before
>> recording a new CPER to avoid read-write race condition.
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> The basic solution is suggested by Laszlo in [1]
>> [1]: https://lkml.org/lkml/2017/3/29/342
> 
> 
> patch is too big, it would be better if it were split in several parts.
Ok, I will split it.

> 
>> ---
>>  hw/acpi/aml-build.c         |   2 +
>>  hw/acpi/hest_ghes.c         | 390 ++++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c    |   8 +
>>  include/hw/acpi/aml-build.h |   1 +
>>  include/hw/acpi/hest_ghes.h |  82 ++++++++++
>>  5 files changed, 483 insertions(+)
>>  create mode 100644 hw/acpi/hest_ghes.c
>>  create mode 100644 include/hw/acpi/hest_ghes.h
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 36a6cc4..6849e5f 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1561,6 +1561,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
>>      tables->table_data = g_array_new(false, true /* clear */, 1);
>>      tables->tcpalog = g_array_new(false, true /* clear */, 1);
>>      tables->vmgenid = g_array_new(false, true /* clear */, 1);
>> +    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
>>      tables->linker = bios_linker_loader_init();
>>  }
>>  
>> @@ -1571,6 +1572,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>>      g_array_free(tables->table_data, true);
>>      g_array_free(tables->tcpalog, mfre);
>>      g_array_free(tables->vmgenid, mfre);
>> +    g_array_free(tables->hardware_errors, mfre);
>>  }
>>  
>>  /* Build rsdt table */
>> diff --git a/hw/acpi/hest_ghes.c b/hw/acpi/hest_ghes.c
>> new file mode 100644
>> index 0000000..86ec99e
>> --- /dev/null
>> +++ b/hw/acpi/hest_ghes.c
>> @@ -0,0 +1,390 @@
>> +/* Support for generating APEI tables and record CPER for Guests
>> + *
>> + * Copyright (C) 2017 HuaWei Corporation.
>> + *
>> + * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
>> +#include "hw/acpi/acpi.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/hest_ghes.h"
>> +#include "hw/nvram/fw_cfg.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/error-report.h"
>> +
>> +/* Generic Address Structure (GAS)
>> + * ACPI 2.0/3.0: 5.2.3.1 Generic Address Structure
>> + * 2.0 compat note:
>> + *    @access_width must be 0, see ACPI 2.0:Table 5-1
>> + */
>> +static void build_append_gas(GArray *table, AmlRegionSpace as,
>> +                      uint8_t bit_width, uint8_t bit_offset,
>> +                      uint8_t access_width, uint64_t address)
>> +{
>> +    build_append_int_noprefix(table, as, 1);
>> +    build_append_int_noprefix(table, bit_width, 1);
>> +    build_append_int_noprefix(table, bit_offset, 1);
>> +    build_append_int_noprefix(table, access_width, 1);
>> +    build_append_int_noprefix(table, address, 8);
>> +}
> all build_append_foo() primitives should go into aml-build.c
> you can reuse take following patches for build_append_gas() from my github repo
> https://github.com/imammedo/qemu/commit/ff35b4ae1ec286f5f11830d504467f5ad243995b
> https://github.com/imammedo/qemu/commit/3d2fd6d13a3ea298d2ee814835495ce6241d085c

Ok, got it, thanks Igor's comments.

> 
> 
>> +/* Hardware Error Notification
>> + * ACPI 4.0: 17.3.2.7 Hardware Error Notification
>> + */
>> +static void build_append_notify(GArray *table, const uint8_t type,
>> +                                uint8_t length)
>> +{
>> +        build_append_int_noprefix(table, type, 1); /* type */
>> +        build_append_int_noprefix(table, length, 1);
>> +        build_append_int_noprefix(table, 0, 26);
>> +}
> split all build_append_foo() into separate patches /a patch per function/,
> 
> probably for GHES related primitives it would be better use 'ghes'
> domain prefix in function names, like
> 
>   s/build_append_notify/build_append_ghes_notify/
> 
> the same applies to other build_append_foo() below
sure, thanks Igor's good suggestion.

> 
> 
>> +/* Generic Error Status Block
>> + * ACPI 4.0: 17.3.2.6.1 Generic Error Data
>> + */
>> +static void build_append_gesb_header(GArray *table, uint32_t block_status,
>> +                      uint32_t raw_data_offset, uint32_t raw_data_length,
>> +                      uint32_t data_length, uint32_t error_severity)
>> +{
>> +    build_append_int_noprefix(table, block_status, 4);
>> +    build_append_int_noprefix(table, raw_data_offset, 4);
>> +    build_append_int_noprefix(table, raw_data_length, 4);
>> +    build_append_int_noprefix(table, data_length, 4);
>> +    build_append_int_noprefix(table, error_severity, 4);
>> +}
>> +
>> +/* Generic Error Data Entry
>> + * ACPI 4.0: 17.3.2.6.1 Generic Error Data
>> + */
>> +static void build_append_gede_header(GArray *table, const char *section_type,
>> +                      const uint32_t error_severity, const uint16_t revision,
>> +                      const uint32_t error_data_length)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 16; i++) {
>> +        build_append_int_noprefix(table, section_type[i], 1);
>> +    }
>> +
>> +    build_append_int_noprefix(table, error_severity, 4);
>> +    build_append_int_noprefix(table, revision, 2);
>> +    build_append_int_noprefix(table, 0, 2);
>> +    build_append_int_noprefix(table, error_data_length, 4);
>> +    build_append_int_noprefix(table, 0, 44);
>> +}
>> +
>> +/* Memory section CPER record */
> comment missing reference to related spec item
Ok, thanks for the reminder.

> 
>> +static void build_append_mem_cper(GArray *table, uint64_t error_physical_addr)
>> +{
>> +    /*
>> +     * Memory Error Record
>> +     */
>> +    build_append_int_noprefix(table,
>> +                 (1UL << 14) | /* Type Valid */
>> +                 (1UL << 1) /* Physical Address Valid */,
>> +                 8);
>> +    /* Memory error status information */
>> +    build_append_int_noprefix(table, 0, 8);
>> +    /* The physical address at which the memory error occurred */
>> +    build_append_int_noprefix(table, error_physical_addr, 8);
>> +    build_append_int_noprefix(table, 0, 48);
>> +    /* Hard code to Multi-bit ECC error */
>> +    build_append_int_noprefix(table, 3 /* Multi-bit ECC */, 1);
>> +    build_append_int_noprefix(table, 0, 7);
>> +}
>> +
>> +static int ghes_record_mem_error(uint64_t error_block_address,
>> +                                    uint64_t error_physical_addr)
> probably function should be part of 9/9 patch, as the others that's called
> only from ghes_record_errors().
> 
> i.e. split this patch into acpi tables generation and actual error generation patches.
Ok, thanks Igor's good suggestion and review comments.

> 
>> +{
>> +    GArray *block;
>> +    uint64_t current_block_length;
>> +    uint32_t data_length;
>> +    /* Memory section */
>> +    char mem_section_id_le[] = {0x14, 0x11, 0xBC, 0xA5, 0x64, 0x6F, 0xDE,
>> +                                0x4E, 0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C,
>> +                                0x83, 0xB1};
>> +
>> +    block = g_array_new(false, true /* clear */, 1);
>> +
>> +    /* Read the current length in bytes of the generic error data */
>> +    cpu_physical_memory_read(error_block_address +
>> +        offsetof(AcpiGenericErrorStatus, data_length), &data_length, 4);
>> +
>> +    /* The current whole length in bytes of the generic error status block */
>> +    current_block_length = sizeof(AcpiGenericErrorStatus) + data_length;
> missing le32_to_cpu() here
> 
> also check other sites where you call cpu_physical_memory_foo()
> 
> it would be good to have a 'make check' test case included in this series,
> then when you can spot these errors during test on BE host, before posting patches.
Ok, sure, thanks.


> 
>> +
>> +    /* Add a new generic error data entry*/
>> +    data_length += GHES_DATA_LENGTH;
>> +    data_length += GHES_CPER_LENGTH;
>> +
>> +    /* Check whether it will run out of the preallocated memory if adding a new
>> +     * generic error data entry
>> +     */
>> +    if ((data_length + sizeof(AcpiGenericErrorStatus)) > GHES_MAX_RAW_DATA_LENGTH) {
>> +        error_report("Record CPER out of boundary!!!");
>> +        return GHES_CPER_FAIL;
> you return values here and from ghes_record_errors() but not actually
> handle them, so it's rather pointless thing to do,
> more over it's called on nofail path so one should either abort on error o ignore it
yes, it should, thanks for the point out. I will make it abort if it is failed.

> 
>> +    }
>> +    /* Build the new generic error status block header */
>> +    build_append_gesb_header(block, cpu_to_le32(ACPI_GEBS_UNCORRECTABLE), 0, 0,
>> +        cpu_to_le32(data_length), cpu_to_le32(ACPI_CPER_SEV_RECOVERABLE));
>> +
>> +    /* Write back above generic error status block header to guest memory */
>> +    cpu_physical_memory_write(error_block_address, block->data,
>> +                              block->len);
>> +
>> +    /* Build the generic error data entries */
>> +
>> +    data_length = block->len;
>> +    /* Build the new generic error data entry header */
>> +    build_append_gede_header(block, mem_section_id_le,
>> +                    cpu_to_le32(ACPI_CPER_SEV_RECOVERABLE), cpu_to_le32(0x300),
>> +                    cpu_to_le32(80)/* the total size of Memory Error Record */);
>> +
>> +    /* Build the memory section CPER */
>> +    build_append_mem_cper(block, error_physical_addr);
>> +
>> +    /* Write back above whole new generic error data entry to guest memory */
>> +    cpu_physical_memory_write(error_block_address + current_block_length,
>> +                    block->data + data_length, block->len - data_length);
>> +
>> +    g_array_free(block, true);
>> +
>> +    return GHES_CPER_OK;
>> +}
> [...]
> 
> I'll try to make another round of review on this once patch is split
Ok, thanks in advance.

> 
> .
> 
