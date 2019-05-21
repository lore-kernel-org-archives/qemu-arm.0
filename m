Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1036867wrg;
        Mon, 20 May 2019 23:21:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDpSmpMRIzx2UfIeYNsUIb2UQjrwLGY9NeIq/KhJFa0vCzuboUt+LRn6M7J9TerFI6tZ/o
X-Received: by 2002:aa7:cb44:: with SMTP id w4mr80972527edt.233.1558419672168;
        Mon, 20 May 2019 23:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558419672; cv=none;
        d=google.com; s=arc-20160816;
        b=UeRQ7Rk/A6D/wz66lg+58fSyIaqesCutLTL/quRzC+MbHmE1lIIpqvTDrwYVzF62Qe
         SxBqXIYBXltyW7kEa05MeWaANkQ0+vEpTxxBGZN+lCuDpszhCUXMuGRA78GwDNDHwkXy
         +5VupQrvq1uMci5r+AsYrMMaJ3pgdZPmNMTQg5lQRbpWSVtlSfnXLoWKEKY6VnSYHG6m
         idCgzhcsXAYQLlqN4TQFcTbitR8gEMDnnBi2CedVmKvH2umRj1AdsBZzI6VKrW5lPBzY
         I8pCpK1qojfbLUYG6vRTI7qEPmfZ0QecU+FbGyknAEp15ZlM+MNgCkktrkSq+vHZVcIh
         jZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=Tbo6LgMe4RhMZKewfXEdAQa8Y+Ynu1numESpjV4F+70=;
        b=Bb7/WzLbZbmVXyjXL4PCDG5c7pay2g1TIbocEW/DeOfZCUvTwRSLQGL8FBVwdIf/Ol
         fOGHEM8jklnB/NWNyCLllzXletBfJIDDnnwVbsY1uAsOUZBUEMx0DZrXyoHTF26NJYR4
         WZDosYIEiYieL8U1wYT8EGNF4tUMFZsrW9uYwUvbbnJoMMJSzIrURND34gujSARrddlW
         X/yhWGUTVGSJpICJdkVLWvXJkSUbGtw/34wxY1KbZ7/zJeUXqzys/Re3exqis+7MWphk
         vkkQFk+0Osida3uKNdox3Lzk+8FzKCfCU/UpyPIGNTnbFmuY2LcRCj7lC15hdpExoXQn
         nGOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g51si14508690edb.426.2019.05.20.23.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 23:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:47195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSy99-0004FQ-8P
	for alex.bennee@linaro.org; Tue, 21 May 2019 02:21:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSy8w-00049b-DH
	for qemu-arm@nongnu.org; Tue, 21 May 2019 02:20:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSy8v-0002UX-Aj
	for qemu-arm@nongnu.org; Tue, 21 May 2019 02:20:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:6641)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSy8v-0002Tz-2U; Tue, 21 May 2019 02:20:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 23:20:55 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2019 23:20:53 -0700
Date: Tue, 21 May 2019 14:20:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190521062023.GB3589@richard>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-3-richardw.yang@linux.intel.com>
	<20190520234407-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520234407-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-arm] [PATCH v5 2/2] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a0OVpFsOG99X

On Mon, May 20, 2019 at 11:44:28PM -0400, Michael S. Tsirkin wrote:
>On Tue, May 21, 2019 at 11:32:49AM +0800, Wei Yang wrote:
>> build_append_foo() API doesn't need explicit endianness conversions
>> which eliminates a source of errors and it makes build_mcfg() look like
>> declarative definition of MCFG table in ACPI spec, which makes it easy
>> to review.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> 
>> ---
>> v5:
>>    * miss the reserved[8] of MCFG in last version, add it back
>>    * drop SOBs and make sure bios-tables-test all OK
>> ---
>>  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
>>  include/hw/acpi/acpi-defs.h | 18 ------------------
>>  2 files changed, 23 insertions(+), 30 deletions(-)
>> 
>> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
>> index fa0fa30bb9..49df7b7d54 100644
>> --- a/hw/acpi/pci.c
>> +++ b/hw/acpi/pci.c
>> @@ -30,17 +30,28 @@
>>  
>>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>>  {
>> -    AcpiTableMcfg *mcfg;
>> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> -
>> -    mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
>> -
>> -    /* Only a single allocation so no need to play with segments */
>> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> -    mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>> -
>> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>> +    int mcfg_start = table_data->len;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    /*
>> +     * PCI Firmware Specification, Revision 3.0
>> +     * 4.1.2 MCFG Table Description.
>> +     */
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0, 8);
>
>below is in fact
>	Memory Mapped Enhanced Configuration Space Base Address Allocation Structure
>
>maybe document this?
>

Sure. Let me add this.

>> +    /* Base address, processor-relative */
>> +    build_append_int_noprefix(table_data, info->base, 8);
>> +    /* PCI segment group number */
>> +    build_append_int_noprefix(table_data, 0, 2);
>> +    /* Starting PCI Bus number */
>> +    build_append_int_noprefix(table_data, 0, 1);
>> +    /* Final PCI Bus number */
>> +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0, 4);
>> +
>> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>> +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
>>  }
>>  
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index f9aa4bd398..57a3f58b0c 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
>>  
>>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>>  
>> -/* PCI fw r3.0 MCFG table. */
>> -/* Subtable */
>> -struct AcpiMcfgAllocation {
>> -    uint64_t address;                /* Base address, processor-relative */
>> -    uint16_t pci_segment;            /* PCI segment group number */
>> -    uint8_t start_bus_number;       /* Starting PCI Bus number */
>> -    uint8_t end_bus_number;         /* Final PCI Bus number */
>> -    uint32_t reserved;
>> -} QEMU_PACKED;
>> -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
>> -
>> -struct AcpiTableMcfg {
>> -    ACPI_TABLE_HEADER_DEF;
>> -    uint8_t reserved[8];
>> -    AcpiMcfgAllocation allocation[0];
>> -} QEMU_PACKED;
>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
>> -
>>  /*
>>   * TCPA Description Table
>>   *
>> -- 
>> 2.19.1

-- 
Wei Yang
Help you, Help me
