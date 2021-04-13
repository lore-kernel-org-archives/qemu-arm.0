Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4797381lfr;
        Tue, 13 Apr 2021 05:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymOe1lxVK3I7G2TJHvxXBPhZ4sIJbRhgjeI7wYtPgPWBxgvU8D3zEacFclBIoeRHBTVZQF
X-Received: by 2002:a05:6512:3106:: with SMTP id n6mr19128811lfb.209.1618315299236;
        Tue, 13 Apr 2021 05:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618315299; cv=none;
        d=google.com; s=arc-20160816;
        b=RAX769prF4SdSGnK4qN1VvNIQ9uEoyQCgpfL6nG4Jh4jAMfFrAk+ZegxH2b13hWxH1
         j4ulBESKw96fjHD+dvlqVXNY2VzRzWxY6S/xcPEUmadB8t96jng/zb0jGF9Ng9Noo3IK
         Yj80ZAPh2Fnezos3ETWlt0Re3lUrmHkdaO+dLlrsi4Q82lIv2TNQGDAeE4SHztz9n+Oo
         hw5vyZzY1SZ9gwEObnETt2QxXXY2YNc/5XJHevPh3JOxzmOlRAZ0x9hBcLSpA9x6qGNj
         Cjdzpgx0hE8dXPzthx0hhDt2wmKxLdtPERb9af3ENHd+Onwec5PAqLA9V7DX4WJ74IMI
         2YKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to;
        bh=ceWvzBdVMMmjpISxiMz0eW1LG3h/XZ4VuPJq2kKdCaI=;
        b=RJSA+h0rT83Ui8timW9xOazHTkeWwXieLgYyulq3DTNJQbt9MSPvhNzGXrWjZHpz9V
         tbk+JK35+nY9wlaIsVAliXWVw5VTnWTGCPi63sXMVZtlsyUPJwDETpx22IbyoXWhJiUS
         bdY5+87hEBC4/6eiD7xxnc/S9F2Uq2c5r3k+oq87NwIu1uXyXSw7kJ95KcET8GO1HJj0
         +KDATNB8VpPNlobEX83nFV/UcIStL28bFMddvUF/CaExkQ61Gx/GKWoQ7isLwiDKVUCW
         g6yEkgInDbXCBT8XWy8+tcyWw6SuY+UoKs5WVecCE7S0S8e14xAragFosYM6ot7JRYZg
         ex3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si15332171ljh.299.2021.04.13.05.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 05:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWHjd-0003uy-Sp
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 08:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lWHiq-0003rD-IY; Tue, 13 Apr 2021 08:00:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lWHil-0000a1-25; Tue, 13 Apr 2021 08:00:47 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKPHT3B5cznZ80;
 Tue, 13 Apr 2021 19:57:41 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 20:00:26 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-5-git-send-email-wangxingang5@huawei.com>
 <ee78ca19-d73d-7c99-38b5-4140e2a9e1b7@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH RFC RESEND v2 4/6] hw/arm/virt-acpi-build: Add explicit
 idmap info in IORT table
Message-ID: <b16bcb84-5fd2-8ee6-9d96-c36f94326132@huawei.com>
Date: Tue, 13 Apr 2021 20:00:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ee78ca19-d73d-7c99-38b5-4140e2a9e1b7@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sY7byT6DkSkN

Hi Eric,

On 2021/4/13 17:03, Auger Eric wrote:
> Hi Xingang,
> 
> On 3/25/21 8:22 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> The idmap of smmuv3 and root complex covers the whole RID space for now,
>> this patch add explicit idmap info according to root bus number range.
>> This add smmuv3 idmap for certain bus which has enabled the iommu property.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 103 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 81 insertions(+), 22 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f5a2b2d4cb..5491036c86 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -44,6 +44,7 @@
>>   #include "hw/acpi/tpm.h"
>>   #include "hw/pci/pcie_host.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bus.h"
>>   #include "hw/pci-host/gpex.h"
>>   #include "hw/arm/virt.h"
>>   #include "hw/mem/nvdimm.h"
>> @@ -237,6 +238,41 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>       aml_append(scope, dev);
>>   }
>>   
>> +typedef
>> +struct AcpiIortMapping {
>> +    AcpiIortIdMapping idmap;
>> +    bool iommu;
>> +} AcpiIortMapping;
>> +
>> +/* For all PCI host bridges, walk and insert DMAR scope */
> this comment should rather be in the caller
> also DMAR is not the ARM vocable.
> 
> I would add the comment for this function:
> build the ID mapping for aa given PCI host bridge

Thanks, I will fix the comment.

>> +static int
>> +iort_host_bridges(Object *obj, void *opaque)
>> +{
>> +    GArray *map_blob = opaque;
>> +    AcpiIortMapping map;
>> +    AcpiIortIdMapping *idmap = &map.idmap;
>> +    int bus_num, max_bus;
>> +
>> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
>> +
>> +        if (bus) {
>> +            bus_num = pci_bus_num(bus);
>> +            max_bus = pci_root_bus_max_bus(bus);
>> +
>> +            idmap->input_base = cpu_to_le32(bus_num << 8);
>> +            idmap->id_count = cpu_to_le32((max_bus - bus_num + 1) << 8);
>> +            idmap->output_base = cpu_to_le32(bus_num << 8);
>> +            idmap->flags = cpu_to_le32(0);
>> +
>> +            map.iommu = pci_root_bus_has_iommu(bus);
> if iommu is not set, we don't need to populate the idmap and we may even
> directly continue, ie. not add the element the map_bap_blob, no?
Thanks, if we leave the whole range when iommu is not set, this indeed 
should be dropped in map_blob.
>> +            g_array_append_val(map_blob, map);
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void
>>   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>   {
>> @@ -247,6 +283,21 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       AcpiIortSmmu3 *smmu;
>>       size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>>       AcpiIortRC *rc;
>> +    int smmu_mapping_count;
>> +    GArray *map_blob = g_array_new(false, true, sizeof(AcpiIortMapping));
>> +    AcpiIortMapping *map;
>> +
>> +    /* pci_for_each_bus(vms->bus, insert_map, map_blob); */
> comment to be removed
Done.
>> +    object_child_foreach_recursive(object_get_root(),
>> +                                   iort_host_bridges, map_blob);
>> +
>> +    smmu_mapping_count = 0;
>> +    for (int i = 0; i < map_blob->len; i++) {
>> +        map = &g_array_index(map_blob, AcpiIortMapping, i);
>> +        if (map->iommu) {
>> +            smmu_mapping_count++;
>> +        }
>> +    }
>>   
>>       iort = acpi_data_push(table_data, sizeof(*iort));
>>   
>> @@ -280,13 +331,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>   
>>           /* SMMUv3 node */
>>           smmu_offset = iort_node_offset + node_size;
>> -        node_size = sizeof(*smmu) + sizeof(*idmap);
>> +        node_size = sizeof(*smmu) + sizeof(*idmap) * smmu_mapping_count;
>>           iort_length += node_size;
>>           smmu = acpi_data_push(table_data, node_size);
>>   
>>           smmu->type = ACPI_IORT_NODE_SMMU_V3;
>>           smmu->length = cpu_to_le16(node_size);
>> -        smmu->mapping_count = cpu_to_le32(1);
>> +        smmu->mapping_count = cpu_to_le32(smmu_mapping_count);
>>           smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>           smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>>           smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>> @@ -295,23 +346,28 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>>           smmu->sync_gsiv = cpu_to_le32(irq + 3);
>>   
>> -        /* Identity RID mapping covering the whole input RID range */
>> -        idmap = &smmu->id_mapping_array[0];
>> -        idmap->input_base = 0;
>> -        idmap->id_count = cpu_to_le32(0xFFFF);
>> -        idmap->output_base = 0;
>> -        /* output IORT node is the ITS group node (the first node) */
>> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
>> +        for (int i = 0, j = 0; i < map_blob->len; i++) {
>> +            map = &g_array_index(map_blob, AcpiIortMapping, i);
>> +
>> +            if (!map->iommu) {
>> +                continue;
>> +            }
>> +
>> +            idmap = &smmu->id_mapping_array[j++];
>> +            *idmap = map->idmap;
>> +            /* output IORT node is the ITS group node (the first node) */
>> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
>> +        }
>>       }
>>   
>>       /* Root Complex Node */
>> -    node_size = sizeof(*rc) + sizeof(*idmap);
>> +    node_size = sizeof(*rc) + sizeof(*idmap) * map_blob->len;
>>       iort_length += node_size;
>>       rc = acpi_data_push(table_data, node_size);
>>   
>>       rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>>       rc->length = cpu_to_le16(node_size);
>> -    rc->mapping_count = cpu_to_le32(1);
>> +    rc->mapping_count = cpu_to_le32(map_blob->len);
>>       rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>>   
>>       /* fully coherent device */
>> @@ -319,20 +375,23 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>>       rc->pci_segment_number = 0; /* MCFG pci_segment */
>>   
>> -    /* Identity RID mapping covering the whole input RID range */
>> -    idmap = &rc->id_mapping_array[0];
>> -    idmap->input_base = 0;
>> -    idmap->id_count = cpu_to_le32(0xFFFF);
>> -    idmap->output_base = 0;
>> +    for (int i = 0; i < map_blob->len; i++) {
>> +        map = &g_array_index(map_blob, AcpiIortMapping, i);
>> +        idmap = &rc->id_mapping_array[i];
>>   
>> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>> -        /* output IORT node is the smmuv3 node */
>> -        idmap->output_reference = cpu_to_le32(smmu_offset);
>> -    } else {
>> -        /* output IORT node is the ITS group node (the first node) */
>> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
>> +        *idmap = map->idmap;
> We we descibe the link between SMMU SID and ITS deviceids, shouldn't we
> leave the whole range? Even if an RID is not translated, it may use MSIs?
Thanks, I did not take into account of this situation, I will fix this.
>> +
>> +        if (vms->iommu == VIRT_IOMMU_SMMUV3 && map->iommu) {
>> +            /* output IORT node is the smmuv3 node */
>> +            idmap->output_reference = cpu_to_le32(smmu_offset);
>> +        } else {
>> +            /* output IORT node is the ITS group node (the first node) */
>> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
> is that case we have a direct mapping between RC and ITS (no
> instantiated SMMU). Shouldn't the whole RID range being used in that case?
> 
> Thanks
> 
> Eric

Thanks, I will change the idmap strategy to cover the whole RID range.
>> +        }
>>       }
>>   
>> +    g_array_free(map_blob, true);
>> +
>>       /*
>>        * Update the pointer address in case table_data->data moves during above
>>        * acpi_data_push operations.
>>
> 
> .
> 

Xingang

.
