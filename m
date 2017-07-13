Received: by 10.25.44.15 with SMTP id s15csp2459620lfs;
        Thu, 13 Jul 2017 10:32:35 -0700 (PDT)
X-Received: by 10.55.56.133 with SMTP id f127mr5960746qka.122.1499967154924;
        Thu, 13 Jul 2017 10:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499967154; cv=none;
        d=google.com; s=arc-20160816;
        b=P+5+CHKqvF9bt5e5fjGleWARErDxuOayhWMIj/bJDvr6TDHa41QrwqcOKn97OFTtv3
         mNnfeg7deGpZB+Vu9XrXjGJjO9v1qY2FoCQlzsVF5vdxXjgc8TbBLiNNZlveIcZK50qh
         bmR11SNq59AeXE2SmoUvkVZH0eU0BhPK84dPrsS8PmZrt7KYcydwjwL0VJatZU5VJIzX
         csSMf5YrkykSm2qZga/cIOEfAKEfj1RP9nf91106duIUfmZdQnZuB4GZDM1lzZWAPAfU
         RR4GamCOTUycZGFCpc3fz2YGoiIqcQw51/AldqZOsvx+d6NgEz03HWhcK15hQRmLrFGF
         VNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=qwcc+5QALaQGRiWywTsstX4V/v3tU++0oZjZmrJzkDc=;
        b=0iOEYuFE1PvTQxkuVoigbWerpxRBEtiaxkG2dUTUgeEqUXrMHh0zDAKg1ROJgMFi0Z
         94o/EQSSVZwKXtQvfQzFd+Fi9IMBlmit/K+PdK7cD31W+cLNTgDJ7aL/tZRH/IY1oJwV
         o5mWE/3Ythfru2l0D2Aw3mPU5ESTCPLQJXGPHEbqYkIPDZ+ApSRTj25bGCWSE/Hpi6zG
         bVTfbCcSU1PDpUHYCXAS7QNPEPxBy3cn2zmxwdDHgJPH6yoiNhZRNaFF5LQLZ8NX8Co3
         L7nWnY2RpPNx51T2OAxmOUQQukqdyD81fC8qwTHfu4Le1bR056DOWIbVjPmtDJzuiSBp
         +HZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r71si5887548qkh.72.2017.07.13.10.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVhyZ-0005lI-S1
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:32:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:61000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVhyW-0005lA-1y
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVhyR-0003xy-Ax
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVhyQ-0003wI-Vr; Thu, 13 Jul 2017 13:32:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47ABC334597;
	Thu, 13 Jul 2017 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 47ABC334597
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 47ABC334597
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 1E65D6FA9E;
	Thu, 13 Jul 2017 17:32:16 +0000 (UTC)
Date: Thu, 13 Jul 2017 20:32:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20170713201407-mutt-send-email-mst@kernel.org>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499825297-20335-3-git-send-email-gengdongjiu@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 13 Jul 2017 17:32:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/3] ACPI: Add APEI GHES Table Generation
 support
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	zhengqiang10@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +F1TJe2VVD4L

On Wed, Jul 12, 2017 at 10:08:16AM +0800, Dongjiu Geng wrote:
> This implements APEI GHES Table by passing the error CPER info
> to the guest via a fw_cfg_blob. After a CPER info is recorded, an
> SEA(Synchronous External Abort)/SEI(SError Interrupt) exception
> will be injected into the guest OS.
> 
> Below is the table layout, the max number of error soure is 11,
> which is classified by notification type.
> 
> etc/acpi/tables                 etc/hardware_errors
> ================     ==========================================
>                      +-----------+
> +--------------+     | address   |         +-> +--------------+
> |    HEST      +     | registers |         |   | Error Status |
> + +------------+     | +---------+         |   | Data Block 0 |
> | | GHES0      | --> | |address0 | --------+   | +------------+
> | | GHES1      | --> | |address1 | ------+     | |  CPER      |
> | | GHES2      | --> | |address2 | ----+ |     | |  CPER      |
> | |  ....      | --> | | ....... |     | |     | |  CPER      |
> | | GHES10     | --> | |address10| -+  | |     | |  CPER      |
> +-+------------+     +-+---------+  |  | |     +-+------------+
>                                     |  | |
>                                     |  | +---> +--------------+
>                                     |  |       | Error Status |
>                                     |  |       | Data Block 1 |
>                                     |  |       | +------------+
>                                     |  |       | |  CPER      |
>                                     |  |       | |  CPER      |
>                                     |  |       +-+------------+
>                                     |  |
>                                     |  +-----> +--------------+
>                                     |          | Error Status |
>                                     |          | Data Block 2 |
>                                     |          | +------------+
>                                     |          | |  CPER      |
>                                     |          +-+------------+
>                                     |            ...........
>                                     +--------> +--------------+
>                                                | Error Status |
>                                                | Data Block 10|
>                                                | +------------+
>                                                | |  CPER      |
>                                                | |  CPER      |
>                                                | |  CPER      |
>                                                +-+------------+
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> thanks a lot Laszlo's review and comments: 
> 
> change since v4:
> 1. fix email threading in this series is incorrect issue
> 
> change since v3:
> 1. remove the unnecessary include for "hw/acpi/vmgenid.h" in 
>    hw/arm/virt-acpi-build.c
> 2. add conversion between LE and host-endian for the CPER record
> 3. handle the case that run out of the preallocated memory for the CPER record
> 4. change to use g_malloc0 instead of g_malloc 
> 5. change block_reqr_size name to block_rer_size
> 6. change QEMU coding style, that is, the operator is at the end of the line.
> 7. drop the ERROR_STATUS_ADDRESS_OFFSET and GAS_ADDRESS_OFFSET macros (from
>    the header file as well), and use the offsetof to replace it.
> 8. remove the init_aml_allocator() / free_aml_allocator(), calculate the
>    needed size, and push that many bytes directly to "table_data".
> 9. take an "OVMF header probe suppressor" into account
> 10.corrct HEST and CPER value assigment, for example, correct the source_id
>    for every error source, this identifier of source_id should be unique among
>    all error sources; 
> 11. create only one WRITE_POINTER command, for the base address of "etc/hardware_errors".
>    This should be done outside of the loop.The base addresses of the individual error
>    status data blocks should be calculated in ghes_update_guest(), based on the error
>    source / notification type
> 12.correct the commit message lists error sources / notification types 0 through 10 (count=11 in total). 
> 13.correct the size calculation for GHES_DATA_ADDR_FW_CFG_FILE 
> 14.range-checked the value of "notify" before using it as an array subscript
> ---
>  hw/acpi/aml-build.c      |   2 +
>  hw/acpi/hest_ghes.c      | 219 +++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c |   6 ++
>  3 files changed, 227 insertions(+)
>  create mode 100644 hw/acpi/hest_ghes.c
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index c6f2032..802b98d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1560,6 +1560,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
>      tables->table_data = g_array_new(false, true /* clear */, 1);
>      tables->tcpalog = g_array_new(false, true /* clear */, 1);
>      tables->vmgenid = g_array_new(false, true /* clear */, 1);
> +    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
>      tables->linker = bios_linker_loader_init();
>  }
>  
> @@ -1570,6 +1571,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
>      g_array_free(tables->table_data, true);
>      g_array_free(tables->tcpalog, mfre);
>      g_array_free(tables->vmgenid, mfre);
> +    g_array_free(tables->hardware_errors, mfre);
>  }
>  
>  /* Build rsdt table */
> diff --git a/hw/acpi/hest_ghes.c b/hw/acpi/hest_ghes.c
> new file mode 100644
> index 0000000..c9442b6
> --- /dev/null
> +++ b/hw/acpi/hest_ghes.c
> @@ -0,0 +1,219 @@
> +/*
> + *  APEI GHES table Generation
> + *
> + *  Copyright (C) 2017 huawei.
> + *
> + *  Author: Dongjiu Geng <gengdongjiu@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qmp-commands.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/hest_ghes.h"
> +#include "hw/nvram/fw_cfg.h"
> +#include "sysemu/sysemu.h"
> +
> +static int ghes_record_cper(uint64_t error_block_address,
> +                                    uint64_t error_physical_addr)
> +{
> +    AcpiGenericErrorStatus block;
> +    AcpiGenericErrorData *gdata;
> +    UefiCperSecMemErr *mem_err;
> +    uint64_t current_block_length;
> +    unsigned char *buffer;
> +    QemuUUID section_id_le = UEFI_CPER_SEC_PLATFORM_MEM;
> +
> +
> +    cpu_physical_memory_read(error_block_address, &block,
> +                                sizeof(AcpiGenericErrorStatus));
> +
> +    /* Get the current generic error status block length */
> +    current_block_length = sizeof(AcpiGenericErrorStatus) +
> +        le32_to_cpu(block.data_length);
> +
> +    /* If the Generic Error Status Block is NULL, update
> +     * the block header
> +     */
> +    if (!block.block_status) {
> +        block.block_status = ACPI_GEBS_UNCORRECTABLE;
> +        block.error_severity = ACPI_CPER_SEV_FATAL;
> +    }
> +
> +    block.data_length += cpu_to_le32(sizeof(AcpiGenericErrorData));
> +    block.data_length += cpu_to_le32(sizeof(UefiCperSecMemErr));
> +
> +    /* check whether it runs out of the preallocated memory */
> +    if ((le32_to_cpu(block.data_length) + sizeof(AcpiGenericErrorStatus)) >
> +       GHES_MAX_RAW_DATA_LENGTH) {
> +        return GHES_CPER_FAIL;
> +    }
> +    /* Write back the Generic Error Status Block to guest memory */
> +    cpu_physical_memory_write(error_block_address, &block,
> +                        sizeof(AcpiGenericErrorStatus));
> +
> +    /* Fill in Generic Error Data Entry */
> +    buffer = g_malloc0(sizeof(AcpiGenericErrorData) +
> +                       sizeof(UefiCperSecMemErr));
> +    memset(buffer, 0, sizeof(AcpiGenericErrorData) + sizeof(UefiCperSecMemErr));
> +    gdata = (AcpiGenericErrorData *)buffer;
> +
> +    qemu_uuid_bswap(&section_id_le);
> +    memcpy(&(gdata->section_type_le), &section_id_le,
> +                sizeof(QemuUUID));
> +    gdata->error_data_length = cpu_to_le32(sizeof(UefiCperSecMemErr));
> +
> +    mem_err = (UefiCperSecMemErr *) (gdata + 1);
> +
> +    /* In order to simplify simulation, hard code the CPER section to memory
> +     * section.
> +     */
> +
> +    /* Hard code to Multi-bit ECC error */
> +    mem_err->validation_bits |= cpu_to_le32(UEFI_CPER_MEM_VALID_ERROR_TYPE);
> +    mem_err->error_type = cpu_to_le32(UEFI_CPER_MEM_ERROR_TYPE_MULTI_ECC);
> +
> +    /* Record the physical address at which the memory error occurred */
> +    mem_err->validation_bits |= cpu_to_le32(UEFI_CPER_MEM_VALID_PA);
> +    mem_err->physical_addr = cpu_to_le32(error_physical_addr);
> +
> +    /* Write back the Generic Error Data Entry to guest memory */
> +    cpu_physical_memory_write(error_block_address + current_block_length,
> +        buffer, sizeof(AcpiGenericErrorData) + sizeof(UefiCperSecMemErr));
> +
> +    g_free(buffer);
> +    return GHES_CPER_OK;
> +}
> +
> +void ghes_build_acpi(GArray *table_data, GArray *hardware_error,
> +                                            BIOSLinker *linker)
> +{
> +    GArray *buffer;
> +    uint32_t address_registers_offset;
> +    AcpiHardwareErrorSourceTable *error_source_table;
> +    AcpiGenericHardwareErrorSource *error_source;
> +    int i;
> +    /*
> +     * The block_req_size stands for one address and one
> +     * generic error status block
> +      +---------+
> +      | address | --------+-> +---------+
> +      +---------+             |  CPER   |
> +                              |  CPER   |
> +                              |  CPER   |
> +                              |  CPER   |
> +                              |  ....   |
> +                              +---------+
> +     */
> +    int block_req_size = sizeof(uint64_t) + GHES_MAX_RAW_DATA_LENGTH;
> +
> +    /* The total size for address of data structure and
> +     * error status data block

Pls start multiple comments with /* by itself

> +     */
> +    g_array_set_size(hardware_error, GHES_ACPI_HEST_NOTIFY_RESERVED *
> +                                                block_req_size);
> +
> +    buffer = g_array_new(false, true /* clear */, 1);
> +    address_registers_offset = table_data->len +
> +        sizeof(AcpiHardwareErrorSourceTable) +
> +        offsetof(AcpiGenericHardwareErrorSource, error_status_address) +
> +        offsetof(struct AcpiGenericAddress, address);
> +
> +    /* Reserve space for HEST table size */
> +    acpi_data_push(buffer, sizeof(AcpiHardwareErrorSourceTable) +
> +                                GHES_ACPI_HEST_NOTIFY_RESERVED *
> +                                sizeof(AcpiGenericHardwareErrorSource));
> +
> +    g_array_append_vals(table_data, buffer->data, buffer->len);
> +    /* Allocate guest memory for the Data fw_cfg blob */
> +    bios_linker_loader_alloc(linker, GHES_ERRORS_FW_CFG_FILE, hardware_error,
> +                            4096, false /* page boundary, high memory */);

page boundary refers to 4096? Pls move it there, or put
before bios_linker_loader_alloc.

> +
> +    error_source_table = (AcpiHardwareErrorSourceTable *)(table_data->data
> +                        + table_data->len - buffer->len);
> +    error_source_table->error_source_count = GHES_ACPI_HEST_NOTIFY_RESERVED;
> +    error_source = (AcpiGenericHardwareErrorSource *)
> +        ((AcpiHardwareErrorSourceTable *)error_source_table + 1);

Concern with all these casts and pointer math is that it is barely readable.
We can easily overflow the array and get hard to debug heap corruption
errors.

What can I suggest?  Just add this to the array in steps. Then you will
not need all the math.

Or again, you can just add things as you init them using build_append_int_noprefix.


> +
> +    bios_linker_loader_write_pointer(linker, GHES_DATA_ADDR_FW_CFG_FILE,
> +        0, sizeof(uint64_t), GHES_ERRORS_FW_CFG_FILE,
> +        GHES_ACPI_HEST_NOTIFY_RESERVED * sizeof(uint64_t));

What does this uint64_t refer to? It's repeated everywhere.

> +
> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
> +        error_source->type = ACPI_HEST_SOURCE_GENERIC_ERROR;
> +        error_source->source_id = cpu_to_le16(i);
> +        error_source->related_source_id = 0xffff;
> +        error_source->flags = 0;
> +        error_source->enabled = 1;
> +        /* The number of error status block per Generic Hardware Error Source */

number of ... blocks ?

> +        error_source->number_of_records = 1;
> +        error_source->max_sections_per_record = 1;
> +        error_source->max_raw_data_length = GHES_MAX_RAW_DATA_LENGTH;
> +        error_source->error_status_address.space_id =
> +                                    AML_SYSTEM_MEMORY;
> +        error_source->error_status_address.bit_width = 64;
> +        error_source->error_status_address.bit_offset = 0;
> +        error_source->error_status_address.access_width = 4;
> +        error_source->notify.type = i;
> +        error_source->notify.length = sizeof(AcpiHestNotify);
> +
> +        error_source->error_status_block_length = GHES_MAX_RAW_DATA_LENGTH;
> +
> +        bios_linker_loader_add_pointer(linker,
> +            ACPI_BUILD_TABLE_FILE, address_registers_offset + i *
> +            sizeof(AcpiGenericHardwareErrorSource), sizeof(uint64_t),
> +            GHES_ERRORS_FW_CFG_FILE, i * sizeof(uint64_t));

and what's this math for?

> +
> +        error_source++;
> +    }
> +
> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
> +        bios_linker_loader_add_pointer(linker,
> +            GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i, sizeof(uint64_t),
> +            GHES_ERRORS_FW_CFG_FILE, GHES_ACPI_HEST_NOTIFY_RESERVED *
> +            sizeof(uint64_t) + i * GHES_MAX_RAW_DATA_LENGTH);
> +    }
> +
> +    build_header(linker, table_data,
> +        (void *)error_source_table, "HEST", buffer->len, 1, NULL, "GHES");

Pls indent so continuation lines are ro the right of (.

> +
> +    g_array_free(buffer, true);
> +}
> +
> +static GhesState ges;
> +void ghes_add_fw_cfg(FWCfgState *s, GArray *hardware_error)
> +{
> +
> +    size_t request_block_size = sizeof(uint64_t) + GHES_MAX_RAW_DATA_LENGTH;
> +    size_t size = GHES_ACPI_HEST_NOTIFY_RESERVED * request_block_size;
> +
> +    /* Create a read-only fw_cfg file for GHES */
> +    fw_cfg_add_file(s, GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
> +                    size);
> +    /* Create a read-write fw_cfg file for Address */
> +    fw_cfg_add_file_callback(s, GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
> +        &ges.ghes_addr_le, sizeof(ges.ghes_addr_le), false);
> +}
> +
> +bool ghes_update_guest(uint32_t notify, uint64_t physical_address)
> +{
> +    uint64_t error_block_addr;
> +
> +    if (physical_address && notify < GHES_ACPI_HEST_NOTIFY_RESERVED) {
> +        error_block_addr = ges.ghes_addr_le + notify * GHES_MAX_RAW_DATA_LENGTH;
> +        error_block_addr = le32_to_cpu(error_block_addr);
> +
> +        /* A zero value in ghes_addr means that BIOS has not yet written
> +         * the address
> +         */
> +        if (error_block_addr) {
> +            return ghes_record_cper(error_block_addr, physical_address);
> +        }
> +    }
> +
> +    return GHES_CPER_FAIL;
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0835e59..5c97016 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -45,6 +45,7 @@
>  #include "hw/arm/virt.h"
>  #include "sysemu/numa.h"
>  #include "kvm_arm.h"
> +#include "hw/acpi/hest_ghes.h"
>  
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> @@ -778,6 +779,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    ghes_build_acpi(tables_blob, tables->hardware_errors, tables->linker);
> +
>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, vms);
> @@ -890,6 +894,8 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>  
> +    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +
>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>                                                ACPI_BUILD_RSDP_FILE, 0);
>  
> -- 
> 2.10.1
