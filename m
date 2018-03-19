Received: by 10.28.91.67 with SMTP id p64csp2733468wmb;
        Mon, 19 Mar 2018 08:22:38 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtleQZ9zO5vC9zWcnBD1SJB+KlPfbKt7PKlxYGmKB9wARNENweNyiuOshuXKcJ4GVwJ3fcT
X-Received: by 2002:a25:bc8d:: with SMTP id e13-v6mr7310820ybk.273.1521472958691;
        Mon, 19 Mar 2018 08:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521472958; cv=none;
        d=google.com; s=arc-20160816;
        b=tw8Pnj9ZyViQ12X5ZkXZlOoVea+c74+bmuiuHkUhD+E8xWAnkiKjfUPcVmeJWsBGDN
         YfZMwpCTH14L8awH2ILH3euSrAUwQEnh9eCIJwC1lNvOnCU2gmqK0VX5Wy9fu4YdpYm8
         xKdv1xRzXC9D7kAYwfPcOTYZsvwKUXJp/1AqKabGDyjA2WRN+12eWbpdz1Rqd0G31ECA
         lnzOnhVEHBioI+CnP5ZIaHanH34cFkwrBMXaUHoWZvtoV7wndpxGHSM3AlSx3ZfV9ptl
         v97JOIo8SuczsEcbTzFY7Z+HN6+/Eje9FtF0wahED76XcDQtcugUxLuucNVI4340cdBw
         nZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=qj1eg28bu8plPDeZu1MYKmnwIJlt9jX/tW1FUG8W/nk=;
        b=swOuCkB1pv5WfAYnURlT1u9Q41gr3E2kMuKRzu2fN7eZ/FRo2WiCeP9o6Pbaf8LX6I
         76a5yD6Im/3dcOdNT0efK5t67lLftAJQPejcMKLyDYzcMpWKsYnH61i4aaGxdTO5xE3k
         64D4zB5ywFf/iPIOZh5kF1zJyOJNSS/dxt2Nzlehxcawy0/fqCRB1YeucuH+18TGKY1w
         /Ur6cn/c1fvi7glHY7q6QN8JYSL6E+addjFYeHRHmTav1CrFeiuWg2HsE/ZrWJTowvhe
         Wt1jvMRNIM0H+KITLQHF46cFCrktaBNDl+O3LUpqdG9CgQ8E59mYdRpvtUNrTSXU1W84
         dCfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si253003qta.266.2018.03.19.08.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 08:22:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exwcQ-0002dL-7P
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 11:22:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exwbF-00021g-Lv
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exwbB-0008Cr-1I
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:21:25 -0400
Received: from [45.249.212.35] (port=55307 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1exwbA-00089r-54; Mon, 19 Mar 2018 11:21:20 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 318E0BC2DC7B9;
	Mon, 19 Mar 2018 22:34:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Mon, 19 Mar 2018
	22:33:59 +0800
Message-ID: <5AAFCA19.7020507@huawei.com>
Date: Mon, 19 Mar 2018 22:32:57 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
	<eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>	<1518893216-9983-14-git-send-email-eric.auger@redhat.com>
	<CAFEAcA810AsyBgCJ2vSKcxqRYKGZgJ3RLEqmJt_c5aa9j9t_Kw@mail.gmail.com>
In-Reply-To: <CAFEAcA810AsyBgCJ2vSKcxqRYKGZgJ3RLEqmJt_c5aa9j9t_Kw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 13/14]
 hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU
	Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, Shannon
	Zhao <shannon.zhaosl@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>, Christoffer
	Dall <christoffer.dall@linaro.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMKzQOzhlFHO



On 2018/3/12 20:48, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch builds the smmuv3 node in the ACPI IORT table.
>>
>> The RID space of the root complex, which spans 0x0-0x10000
>> maps to streamid space 0x0-0x10000 in smmuv3, which in turn
>> maps to deviceid space 0x0-0x10000 in the ITS group.
>>
>> The guest must feature the IOMMU probe deferral series
>> (https://lkml.org/lkml/2017/4/10/214) which fixes streamid
>> multiple lookup. This bug is not related to the SMMU emulation.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - integrate into the existing IORT table made up of ITS, RC nodes
>> - take into account vms->smmu
>> - match linux actbl2.h acpi_iort_smmu_v3 field names
>> ---
>>  hw/arm/virt-acpi-build.c    | 56 +++++++++++++++++++++++++++++++++++++++------
>>  include/hw/acpi/acpi-defs.h | 15 ++++++++++++
>>  2 files changed, 64 insertions(+), 7 deletions(-)
> 
> Since ACPI is definitely not my area of expertise, I've cc'd
> Shannon on this patch. Shannon, could you take a look at it, please?
> 
Sure.

>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f7fa795..4b5ad91 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -393,19 +393,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>>  }
>>
>>  static void
>> -build_iort(GArray *table_data, BIOSLinker *linker)
>> +build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>  {
>> -    int iort_start = table_data->len;
>> +    int nb_nodes, iort_start = table_data->len;
>>      AcpiIortIdMapping *idmap;
>>      AcpiIortItsGroup *its;
>>      AcpiIortTable *iort;
>> -    size_t node_size, iort_length;
>> +    AcpiIortSmmu3 *smmu;
>> +    size_t node_size, iort_length, smmu_offset = 0;
>>      AcpiIortRC *rc;
>>
>>      iort = acpi_data_push(table_data, sizeof(*iort));
>>
>> +    if (vms->iommu) {
use if (vms->iommu == VIRT_IOMMU_SMMUV3) ? in case we support other
types of SMMU.

>> +        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>> +    } else {
>> +        nb_nodes = 2; /* RC, ITS */
>> +    }
>> +
>>      iort_length = sizeof(*iort);
>> -    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
>> +    iort->node_count = cpu_to_le32(nb_nodes);
>>      iort->node_offset = cpu_to_le32(sizeof(*iort));
>>
>>      /* ITS group node */
>> @@ -418,6 +425,35 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>>      its->its_count = cpu_to_le32(1);
>>      its->identifiers[0] = 0; /* MADT translation_id */
>>
>> +    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>> +        int irq =  vms->irqmap[VIRT_SMMU];
>> +
>> +        /* SMMUv3 node */
>> +        smmu_offset = cpu_to_le32(iort->node_offset + node_size);
no need cpu_to_le32 here.
Otherwise: Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>

>> +        node_size = sizeof(*smmu) + sizeof(*idmap);
>> +        iort_length += node_size;
>> +        smmu = acpi_data_push(table_data, node_size);
>> +
>> +
>> +        smmu->type = ACPI_IORT_NODE_SMMU_V3;
>> +        smmu->length = cpu_to_le16(node_size);
>> +        smmu->mapping_count = cpu_to_le32(1);
>> +        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>> +        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>> +        smmu->event_gsiv = cpu_to_le32(irq);
>> +        smmu->pri_gsiv = cpu_to_le32(irq + 1);
>> +        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>> +        smmu->sync_gsiv = cpu_to_le32(irq + 3);
>> +
>> +        /* Identity RID mapping covering the whole input RID range */
>> +        idmap = &smmu->id_mapping_array[0];
>> +        idmap->input_base = 0;
>> +        idmap->id_count = cpu_to_le32(0xFFFF);
>> +        idmap->output_base = 0;
>> +        /* output IORT node is the ITS group node (the first node) */
>> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
>> +    }
>> +
>>      /* Root Complex Node */
>>      node_size = sizeof(*rc) + sizeof(*idmap);
>>      iort_length += node_size;
>> @@ -438,8 +474,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>>      idmap->input_base = 0;
>>      idmap->id_count = cpu_to_le32(0xFFFF);
>>      idmap->output_base = 0;
>> -    /* output IORT node is the ITS group node (the first node) */
>> -    idmap->output_reference = cpu_to_le32(iort->node_offset);
>> +
>> +    if (vms->iommu) {
>> +        /* output IORT node is the smmuv3 node */
>> +        idmap->output_reference = cpu_to_le32(smmu_offset);
>> +    } else {
>> +        /* output IORT node is the ITS group node (the first node) */
>> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
>> +    }
>>
>>      iort->length = cpu_to_le32(iort_length);
>>
>> @@ -786,7 +828,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>
>>      if (its_class_name() && !vmc->no_its) {
>>          acpi_add_table(table_offsets, tables_blob);
>> -        build_iort(tables_blob, tables->linker);
>> +        build_iort(tables_blob, tables->linker, vms);
>>      }
>>
>>      /* XSDT is pointed to by RSDP */
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index 80c8099..068ce28 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -700,6 +700,21 @@ struct AcpiIortItsGroup {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>
>> +struct AcpiIortSmmu3 {
>> +    ACPI_IORT_NODE_HEADER_DEF
>> +    uint64_t base_address;
>> +    uint32_t flags;
>> +    uint32_t reserved2;
>> +    uint64_t vatos_address;
>> +    uint32_t model;
>> +    uint32_t event_gsiv;
>> +    uint32_t pri_gsiv;
>> +    uint32_t gerr_gsiv;
>> +    uint32_t sync_gsiv;
>> +    AcpiIortIdMapping id_mapping_array[0];
>> +} QEMU_PACKED;
>> +typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>> +
>>  struct AcpiIortRC {
>>      ACPI_IORT_NODE_HEADER_DEF
>>      AcpiIortMemoryAccess memory_properties;
>> --
>> 2.5.5
>>
> 
> thanks
> -- PMM
> 
> 
> .
> 

-- 
Shannon

