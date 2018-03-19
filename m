Received: by 10.28.91.67 with SMTP id p64csp3048374wmb;
        Mon, 19 Mar 2018 13:51:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuJ8R/vGXRO6R+McDctx4wz6w6vM4o0M3AxuuyM6SVx9Qnszm9CeFocwLKFl5mgalXGN0AC
X-Received: by 10.55.77.77 with SMTP id a74mr18840905qkb.239.1521492668035;
        Mon, 19 Mar 2018 13:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521492668; cv=none;
        d=google.com; s=arc-20160816;
        b=Gcvu4/U4ZjsGknRl+59po3Kl21O+/Kbv9vTJvr0LG+pTMkHgzx+Q51tuH3QMo4I6j5
         raq4QIfUC7DFO4yL239f25c/Gex8GxAECg+DCN5Xewltfwt+7lYizK1zFjHsqtJR1oQ5
         4r4kppsLdKpGt41E84b/Cr1Tw3J66v9n+aveiPF75665BwYGIpmk0oFA7oivltJcGcb2
         u26I/IL0Ti6PrpD61GjzuYqJudS8YRXQ52th5GDB1H8Z7pci8LezV1pisKhAo3v3nRPw
         tsrhOJX8Ma/XIlzRLgXnBwFKZsBesMwzoeTKD2WIfTJ4j+K4cAHwMFxQ477Lc8+cVb5N
         Onew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=nVQlnt1Ud5scyJP4nRDQAzThmZANwj6qTFEvi8uQYZM=;
        b=OZPZgA72sTSlzgy+Vn3o37z0wHeX2n09J3qiy8KMpZUidkwXOmUxGYy0GJDPqg5qUQ
         41eeffdgvsAgKQIDXgvQy+7OWGoi+M+moWe/8enJwM/+5j1IMnAwz4g0X82voJUEmwMZ
         OUi3PmXB9x5GKUnuFHQ7uDASmQw5sAEXd6nqN9E4DSHlY4OhdEcagoEYioe/DC62mUlL
         Wqu4Bcp7p2MtAHwg99cHPv347h9PrQxyLwAY1Oy+5Gz3AIz8WbBdAlhpOyDdOMTvZY11
         ILTzlva9yq2Mg9C2sWiQELiOvspI3qAcHH1YaH44N8a6bunnV3aTNfaIGf5XypRDHLy1
         TUMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si993148qkd.34.2018.03.19.13.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 13:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey1kJ-0008BH-BR
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 16:51:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ey1k2-00087b-Uv
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ey1k1-0003Jl-66
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:50:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41004 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ey1k1-0003JR-1m; Mon, 19 Mar 2018 16:50:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7522E7705E;
	Mon, 19 Mar 2018 20:50:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC0E111F3DB;
	Mon, 19 Mar 2018 20:50:36 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-14-git-send-email-eric.auger@redhat.com>
	<CAFEAcA810AsyBgCJ2vSKcxqRYKGZgJ3RLEqmJt_c5aa9j9t_Kw@mail.gmail.com>
	<5AAFCA19.7020507@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2908cad5-ffb8-29bd-0f10-a7600622429a@redhat.com>
Date: Mon, 19 Mar 2018 21:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5AAFCA19.7020507@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 19 Mar 2018 20:50:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 19 Mar 2018 20:50:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8SWtNzY7K92S

Hi Shannon,

On 19/03/18 15:32, Shannon Zhao wrote:
> 
> 
> On 2018/3/12 20:48, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>>
>>> This patch builds the smmuv3 node in the ACPI IORT table.
>>>
>>> The RID space of the root complex, which spans 0x0-0x10000
>>> maps to streamid space 0x0-0x10000 in smmuv3, which in turn
>>> maps to deviceid space 0x0-0x10000 in the ITS group.
>>>
>>> The guest must feature the IOMMU probe deferral series
>>> (https://lkml.org/lkml/2017/4/10/214) which fixes streamid
>>> multiple lookup. This bug is not related to the SMMU emulation.
>>>
>>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>> v2 -> v3:
>>> - integrate into the existing IORT table made up of ITS, RC nodes
>>> - take into account vms->smmu
>>> - match linux actbl2.h acpi_iort_smmu_v3 field names
>>> ---
>>>  hw/arm/virt-acpi-build.c    | 56 +++++++++++++++++++++++++++++++++++++++------
>>>  include/hw/acpi/acpi-defs.h | 15 ++++++++++++
>>>  2 files changed, 64 insertions(+), 7 deletions(-)
>>
>> Since ACPI is definitely not my area of expertise, I've cc'd
>> Shannon on this patch. Shannon, could you take a look at it, please?
>>
> Sure.
> 
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index f7fa795..4b5ad91 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -393,19 +393,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>>>  }
>>>
>>>  static void
>>> -build_iort(GArray *table_data, BIOSLinker *linker)
>>> +build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>  {
>>> -    int iort_start = table_data->len;
>>> +    int nb_nodes, iort_start = table_data->len;
>>>      AcpiIortIdMapping *idmap;
>>>      AcpiIortItsGroup *its;
>>>      AcpiIortTable *iort;
>>> -    size_t node_size, iort_length;
>>> +    AcpiIortSmmu3 *smmu;
>>> +    size_t node_size, iort_length, smmu_offset = 0;
>>>      AcpiIortRC *rc;
>>>
>>>      iort = acpi_data_push(table_data, sizeof(*iort));
>>>
>>> +    if (vms->iommu) {
> use if (vms->iommu == VIRT_IOMMU_SMMUV3) ? in case we support other
> types of SMMU.
OK
> 
>>> +        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>>> +    } else {
>>> +        nb_nodes = 2; /* RC, ITS */
>>> +    }
>>> +
>>>      iort_length = sizeof(*iort);
>>> -    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
>>> +    iort->node_count = cpu_to_le32(nb_nodes);
>>>      iort->node_offset = cpu_to_le32(sizeof(*iort));
>>>
>>>      /* ITS group node */
>>> @@ -418,6 +425,35 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>>>      its->its_count = cpu_to_le32(1);
>>>      its->identifiers[0] = 0; /* MADT translation_id */
>>>
>>> +    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>> +        int irq =  vms->irqmap[VIRT_SMMU];
>>> +
>>> +        /* SMMUv3 node */
>>> +        smmu_offset = cpu_to_le32(iort->node_offset + node_size);
> no need cpu_to_le32 here.
> Otherwise: Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>

OK. Thank you for the review!

Thanks

Eric
> 
>>> +        node_size = sizeof(*smmu) + sizeof(*idmap);
>>> +        iort_length += node_size;
>>> +        smmu = acpi_data_push(table_data, node_size);
>>> +
>>> +
>>> +        smmu->type = ACPI_IORT_NODE_SMMU_V3;
>>> +        smmu->length = cpu_to_le16(node_size);
>>> +        smmu->mapping_count = cpu_to_le32(1);
>>> +        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>> +        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>>> +        smmu->event_gsiv = cpu_to_le32(irq);
>>> +        smmu->pri_gsiv = cpu_to_le32(irq + 1);
>>> +        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>>> +        smmu->sync_gsiv = cpu_to_le32(irq + 3);
>>> +
>>> +        /* Identity RID mapping covering the whole input RID range */
>>> +        idmap = &smmu->id_mapping_array[0];
>>> +        idmap->input_base = 0;
>>> +        idmap->id_count = cpu_to_le32(0xFFFF);
>>> +        idmap->output_base = 0;
>>> +        /* output IORT node is the ITS group node (the first node) */
>>> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
>>> +    }
>>> +
>>>      /* Root Complex Node */
>>>      node_size = sizeof(*rc) + sizeof(*idmap);
>>>      iort_length += node_size;
>>> @@ -438,8 +474,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>>>      idmap->input_base = 0;
>>>      idmap->id_count = cpu_to_le32(0xFFFF);
>>>      idmap->output_base = 0;
>>> -    /* output IORT node is the ITS group node (the first node) */
>>> -    idmap->output_reference = cpu_to_le32(iort->node_offset);
>>> +
>>> +    if (vms->iommu) {
>>> +        /* output IORT node is the smmuv3 node */
>>> +        idmap->output_reference = cpu_to_le32(smmu_offset);
>>> +    } else {
>>> +        /* output IORT node is the ITS group node (the first node) */
>>> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
>>> +    }
>>>
>>>      iort->length = cpu_to_le32(iort_length);
>>>
>>> @@ -786,7 +828,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>
>>>      if (its_class_name() && !vmc->no_its) {
>>>          acpi_add_table(table_offsets, tables_blob);
>>> -        build_iort(tables_blob, tables->linker);
>>> +        build_iort(tables_blob, tables->linker, vms);
>>>      }
>>>
>>>      /* XSDT is pointed to by RSDP */
>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>> index 80c8099..068ce28 100644
>>> --- a/include/hw/acpi/acpi-defs.h
>>> +++ b/include/hw/acpi/acpi-defs.h
>>> @@ -700,6 +700,21 @@ struct AcpiIortItsGroup {
>>>  } QEMU_PACKED;
>>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>>
>>> +struct AcpiIortSmmu3 {
>>> +    ACPI_IORT_NODE_HEADER_DEF
>>> +    uint64_t base_address;
>>> +    uint32_t flags;
>>> +    uint32_t reserved2;
>>> +    uint64_t vatos_address;
>>> +    uint32_t model;
>>> +    uint32_t event_gsiv;
>>> +    uint32_t pri_gsiv;
>>> +    uint32_t gerr_gsiv;
>>> +    uint32_t sync_gsiv;
>>> +    AcpiIortIdMapping id_mapping_array[0];
>>> +} QEMU_PACKED;
>>> +typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>>> +
>>>  struct AcpiIortRC {
>>>      ACPI_IORT_NODE_HEADER_DEF
>>>      AcpiIortMemoryAccess memory_properties;
>>> --
>>> 2.5.5
>>>
>>
>> thanks
>> -- PMM
>>
>>
>> .
>>
> 
