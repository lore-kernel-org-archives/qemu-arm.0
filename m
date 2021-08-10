Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1180327lff;
        Tue, 10 Aug 2021 03:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgPqB621ypylE20/xvQD6keqBtsbdlxbe9BK15R0uEyJazl+HeFigIN2g6H375relEBdCo
X-Received: by 2002:a25:2e42:: with SMTP id b2mr21996803ybn.28.1628591159070;
        Tue, 10 Aug 2021 03:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628591159; cv=none;
        d=google.com; s=arc-20160816;
        b=Fg0pzLJSU/3N6kSKiyq1THGvqfvWvpxgua6NtDhfIGH5YaqHhMSu53yVBhuKr7L1WK
         0P4NieCowI6Aq82CUDBPWz+XhOtQZP2HHrSkFrVtwkbt0+b/axdn46GGiwYX1TBeCk2K
         vqqWTxPW1sSdoMn5bScvs5mkm7gkCujarj1DTZp5omLRQ04OnPbOz8AAaigNJZ4PfGC1
         0KZoFwE1yF3oEiVPWyZc7EAdUtkOTSQWotwQTVcQFEX6lBvtFY0z2mEa31fELC9uYPz+
         oVCY/7ArTwTpDTnWemW1db9P4NN7VPfa6jz5W4B4vyv8lJsqLcNwhIC1EID/x0Jh+drG
         Rn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=se8UufezbiNhi/HXpKOiqIZWcIL1AGz2k4KVQQNr9rw=;
        b=b7b+bM40JoFiZWCylUTS0/2hDWbu4P48GAfE39SNnR/Ah43yvFOzwTpuM1vPYa2NyZ
         MDXAWmEj/Y2UGWwvbg3v6ByYw5RLg1rLmr87G40TPpih2OBdHe26YzdgO55A+Mik7eBm
         nJAvSHzkyJm9UJ5ob4itNmlP+DR/AZOSvgNxiuAO9fcmo1xqCMDvGlpKvru5mC1ZMt+U
         HGfkGnIHS9dNDF37O+8ltMq+YZ4fUN9pbiwzQfy4PAuuvnujPP7Q2lJNA8Eqrse0SuFJ
         9xPKKViBxqPDcHtLU0soRbevlsFE9OggJTohFTwCvzS7/FrVK8Vf5mAc8ZGLk/m71mBg
         +qmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DUDZls2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si20107913ybn.109.2021.08.10.03.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 03:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DUDZls2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDOxK-0004cC-94
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 06:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDOwj-0004Yb-O0
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 06:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDOwe-0002g0-CO
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 06:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628591112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=se8UufezbiNhi/HXpKOiqIZWcIL1AGz2k4KVQQNr9rw=;
 b=DUDZls2N0ot5pyN1IdfcAmv8CqRglOzIBa3WwYp9tfB14LrXwRbdRLHnAVMQIfQLQ5ckUi
 tcwjQ1x6ELz0G9vbw2CpmnuDu/pyE8pO9loyZ4SMQRw9d9X4DIHrKMqOBSQbGNZBQDRior
 0+mhyJUJooPf9qlnP7tk/EcQEs0j1zE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-SRB0xOlxPpGV6b4DGtMGcg-1; Tue, 10 Aug 2021 06:25:11 -0400
X-MC-Unique: SRB0xOlxPpGV6b4DGtMGcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 21-20020a05600c0255b02902571fa93802so535287wmj.1
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 03:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=se8UufezbiNhi/HXpKOiqIZWcIL1AGz2k4KVQQNr9rw=;
 b=ueBkWhlXSKAukwycOYWYPmA7Ao3R2RMSG4bPeqt8ck+TXEJ3fcTx3khweam35lE8Cd
 j/I8l/iqtKCw8dw2/eWoFWU7ghboR2c464LMPiSbVCekdPqORyzoqRWffzhLv1EQytOn
 JyqqYr4I2GKxc6AsIqLjmKXrNmTrsjvf7ERG11i6UiCRSOLtopQeKasn4QpTdCKEgJjr
 8k48buivk335YZg/W/0eLmZtU9mdvnwok8mNeJmWGLehxxPHukR5r0ebgRKa4wcdeUxt
 M1Tv7u+RmlwbuYYox0/xHQ5cAz+B4htL4B7Ik6/Ry1Wr5PRm78lKwwPi+RNoSuViSE/i
 EhFw==
X-Gm-Message-State: AOAM530aSGLMDXCdJ2bo2YJCYHFnkHix+SmvuDbxCfKbxs0gehyTQfQh
 QeW82pMa9sYIjIQPzD34Pjg9b6QCA+Ye1kHtPi+wIuG/g/PCFTa94jSnyC7XelBG8sN0r16C79o
 650VaCNCCmTvr
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr3921699wmz.98.1628591109925; 
 Tue, 10 Aug 2021 03:25:09 -0700 (PDT)
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr3921662wmz.98.1628591109553; 
 Tue, 10 Aug 2021 03:25:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p4sm10576662wrq.81.2021.08.10.03.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 03:25:09 -0700 (PDT)
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Ard Biesheuvel <ardb@kernel.org>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
Date: Tue, 10 Aug 2021 12:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Masters <jcm@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Al Stone <ahs3@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cEIYY+o2mp+H

Hello Ard,
On 8/10/21 11:36 AM, Ard Biesheuvel wrote:
> On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrote:
>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
>> this latter allows to describe one or more debug ports.
>>
>> Generate an DBG2 table featuring a single debug port, the PL011.
>>
>> The DBG2 specification can be found at:
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>>
> Have the legal issues around this table been resolved in the mean
> time?
I don't know exactly what they are. Adding Al and Jon in the loop they
have more information about this.
How did you resolve the issue for EDK2
(DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c)?
>  Also, any clue why this table is mandatory to begin with? The
> SBBR has been very trigger happy lately with making things mandatory
> that aren't truly required from a functional perspective.
It seems there are kernel FW test suites that check all mandated tables
are available and they currently fail for ARM virt.
Indeed from a function pov, I don't know much about its usage on ARM.

Maybe the SBBR spec should not flag the DBG2 as mandatory and test
suites shall be updated. I think this should be clarified at ARM then,
all the more so if there are legal issues as its spec is owned by Microsoft?

Thanks

Eric
>
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> Tested by comparing the content with the table generated
>> by EDK2 along with the SBSA-REF machine (code generated by
>> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
>>
>> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
>> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
>> dword access. Also the name exposed by acpica tools is different:
>> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
>> ---
>>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
>>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
>>  2 files changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 037cc1fd82..35f27b41df 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                   vms->oem_table_id);
>>  }
>>
>> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
>> +
>> +/* DBG2 */
>> +static void
>> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> +{
>> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
>> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
>> +    struct AcpiGenericAddress *base_address;
>> +    int dbg2_start = table_data->len;
>> +    AcpiDbg2Device *dbg2dev;
>> +    char name[] = "COM0";
>> +    AcpiDbg2Table *dbg2;
>> +    uint32_t *addr_size;
>> +    uint8_t *namespace;
>> +
>> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
>> +    dbg2->info_offset = sizeof *dbg2;
>> +    dbg2->info_count = 1;
>> +
>> +    /* debug device info structure */
>> +
>> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
>> +
>> +    dbg2dev->revision = 0;
>> +    namespace_length = sizeof name;
>> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
>> +                      4 + namespace_length;
>> +    dbg2dev->register_count = 1;
>> +
>> +    addr_offset = sizeof *dbg2dev;
>> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
>> +    namespace_offset = addrsize_offset + 4;
>> +
>> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
>> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
>> +    dbg2dev->oem_data_length = cpu_to_le16(0);
>> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
>> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
>> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
>> +
>> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
>> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
>> +
>> +    /*
>> +     * variable length content:
>> +     * BaseAddressRegister[1]
>> +     * AddressSize[1]
>> +     * NamespaceString[1]
>> +     */
>> +
>> +    base_address = acpi_data_push(table_data,
>> +                                  sizeof(struct AcpiGenericAddress));
>> +
>> +    base_address->space_id = AML_SYSTEM_MEMORY;
>> +    base_address->bit_width = 8;
>> +    base_address->bit_offset = 0;
>> +    base_address->access_width = 1;
>> +    base_address->address = cpu_to_le64(uart_memmap->base);
>> +
>> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
>> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
>> +
>> +    namespace = acpi_data_push(table_data, namespace_length);
>> +    memcpy(namespace, name, namespace_length);
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + dbg2_start), "DBG2",
>> +                 table_data->len - dbg2_start, 3, vms->oem_id,
>> +                 vms->oem_table_id);
>> +}
>> +
>>  /* MADT */
>>  static void
>>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      dsdt = tables_blob->len;
>>      build_dsdt(tables_blob, tables->linker, vms);
>>
>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>
>> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_dbg2(tables_blob, tables->linker, vms);
>> +
>>      if (vms->ras) {
>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>          acpi_add_table(table_offsets, tables_blob);
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index cf9f44299c..bdb2ebed2c 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -618,4 +618,54 @@ struct AcpiIortRC {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortRC AcpiIortRC;
>>
>> +/* DBG2 */
>> +
>> +/* Types for port_type field above */
>> +
>> +#define ACPI_DBG2_SERIAL_PORT       0x8000
>> +#define ACPI_DBG2_1394_PORT         0x8001
>> +#define ACPI_DBG2_USB_PORT          0x8002
>> +#define ACPI_DBG2_NET_PORT          0x8003
>> +
>> +/* Subtypes for port_subtype field above */
>> +
>> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
>> +#define ACPI_DBG2_16550_SUBSET      0x0001
>> +#define ACPI_DBG2_ARM_PL011         0x0003
>> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
>> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
>> +#define ACPI_DBG2_ARM_DCC           0x000F
>> +#define ACPI_DBG2_BCM2835           0x0010
>> +
>> +#define ACPI_DBG2_1394_STANDARD     0x0000
>> +
>> +#define ACPI_DBG2_USB_XHCI          0x0000
>> +#define ACPI_DBG2_USB_EHCI          0x0001
>> +
>> +/* Debug Device Information Subtable */
>> +
>> +struct AcpiDbg2Device {
>> +    uint8_t  revision;
>> +    uint16_t length;
>> +    uint8_t  register_count; /* Number of base_address registers */
>> +    uint16_t namepath_length;
>> +    uint16_t namepath_offset;
>> +    uint16_t oem_data_length;
>> +    uint16_t oem_data_offset;
>> +    uint16_t port_type;
>> +    uint16_t port_subtype;
>> +    uint8_t  reserved[2];
>> +    uint16_t base_address_offset;
>> +    uint16_t address_size_offset;
>> +}  QEMU_PACKED;
>> +typedef struct AcpiDbg2Device AcpiDbg2Device;
>> +
>> +struct AcpiDbg2Table {
>> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
>> +    uint32_t info_offset; /* offset to the first debug struct */
>> +    uint32_t info_count;  /* number of debug device info struct entries */
>> +    uint8_t  dbg2_device_info[];
>> +} QEMU_PACKED;
>> +typedef struct AcpiDbg2Table AcpiDbg2Table;
>> +
>>  #endif
>> --
>> 2.26.3
>>

