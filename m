Received: by 10.80.166.35 with SMTP id d32csp238466edc;
        Fri, 14 Oct 2016 04:59:18 -0700 (PDT)
X-Received: by 10.55.201.141 with SMTP id m13mr10719065qkl.66.1476446358354;
        Fri, 14 Oct 2016 04:59:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si1534402qkc.77.2016.10.14.04.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 04:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv18v-0000xL-Pp
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 07:59:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv18q-0000uf-WD
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 07:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv18m-0005Of-Pr
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 07:59:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bv18m-0005OK-GG; Fri, 14 Oct 2016 07:59:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E1897F7B7;
	Fri, 14 Oct 2016 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-131.ams2.redhat.com [10.36.4.131])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EBx3Qn001389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Oct 2016 07:59:05 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-2-git-send-email-eric.auger@redhat.com>
	<20161014113035.ebmsswsi632mopw4@hawk.localdomain>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4e6a3461-a3d9-d0f0-1954-b34bf542d775@redhat.com>
Date: Fri, 14 Oct 2016 13:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161014113035.ebmsswsi632mopw4@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 14 Oct 2016 11:59:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/2] ACPI: Add IORT Structure definition
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
Cc: peter.maydell@linaro.org, tn@semihalf.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	prem.mallappa@broadcom.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kafDsx3FyEM7

Hi Drew,

On 14/10/2016 13:30, Andrew Jones wrote:
> On Fri, Oct 14, 2016 at 10:54:54AM +0200, Eric Auger wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> ACPI Spec 6.0 introduces IO Remapping Table Structure. This patch
>> introduces the definitions required to describe the IO relationship
>> between the PCIe root complex and the ITS.
>>
>> This conforms to:
>> "IO Remapping Table System Software on ARM Platforms",
>> Document number: ARM DEN 0049B, October 2015.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - took into account Drew's comments:
>>   cleanup comments, remove most defines, add ACPI_IORT_NODE_HEADER_DEF
>> ---
>>  include/hw/acpi/acpi-defs.h | 68 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index 9c1b7cb..1cd1e69 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -609,4 +609,72 @@ typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
>>  /* Masks for Flags field above */
>>  #define ACPI_DMAR_INCLUDE_PCI_ALL   1
>>  
>> +/*
>> + * Input Output Remapping Table (IORT)
>> + * Conforms to "IO Remapping Table System Software on ARM Platforms",
>> + * Document number: ARM DEN 0049B, October 2015
>> + */
>> +
>> +struct AcpiIortTable {
>> +    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
>> +    uint32_t node_count;
>> +    uint32_t node_offset;
>> +    uint32_t reserved;
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortTable AcpiIortTable;
>> +
>> +/*
>> + * IORT node types
>> + */
>> +
>> +#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
>> +    uint8_t  type;          \
>> +    uint16_t length;        \
>> +    uint8_t  revision;      \
>> +    uint32_t reserved;      \
>> +    uint32_t mapping_count; \
>> +    uint32_t mapping_offset;\
> 
> Last line shouldn't have the \
OK
> 
>> +
>> +/* Values for node Type above */
>> +enum {
>> +        ACPI_IORT_NODE_ITS_GROUP = 0x00,
>> +        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
>> +        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
>> +        ACPI_IORT_NODE_SMMU = 0x03,
>> +        ACPI_IORT_NODE_SMMU_V3 = 0x04
>> +};
>> +
>> +struct AcpiIortIdMapping {
>> +    uint32_t input_base;
>> +    uint32_t id_count;
>> +    uint32_t output_base;
>> +    uint32_t output_reference;
>> +    uint32_t flags;
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>> +
>> +struct AcpiIortMemoryAccess {
>> +    uint32_t cache_coherency;
>> +    uint8_t  hints;
>> +    uint16_t reserved;
>> +    uint8_t  memory_flags;
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
>> +
>> +struct AcpiIortItsGroup {
>> +    ACPI_IORT_NODE_HEADER_DEF
>> +    uint32_t its_count;
>> +    uint32_t identifiers[0];
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>> +
>> +struct AcpiIortRC {
>> +    ACPI_IORT_NODE_HEADER_DEF
>> +    AcpiIortMemoryAccess memory_properties;
>> +    uint32_t ats_attribute;
>> +    uint32_t pci_segment_number;
> 
> I think just 'pci_segment' like in a couple other structs, is
> a descriptive enough name, i.e. _number could be dropped.
In the past Shannon told me to use the same field names as the ones in
the linux header, hence that choice.

Thanks

Eric
> 
>> +    AcpiIortIdMapping id_mapping_array[0];
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortRC AcpiIortRC;
>> +
>>  #endif
>> -- 
>> 2.5.5
>>
> 
> Thanks,
> drew 
> 
