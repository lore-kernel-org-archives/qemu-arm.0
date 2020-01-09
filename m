Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2139157lff;
        Thu, 9 Jan 2020 05:37:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHCa+BFVZVAtefmPQQRP/rsJaH7gNt6PZEHAj228mJfvhbYqJ79nAKetf+SHqa2J/dsJ1U
X-Received: by 2002:ac8:4289:: with SMTP id o9mr7992025qtl.277.1578577041997;
        Thu, 09 Jan 2020 05:37:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578577041; cv=none;
        d=google.com; s=arc-20160816;
        b=xbtPxmrXVcjc2EaParuTAj07TrmCTmJjeI4RXisPxXj4hQ/FVKPP+tLecg0ZIjhHs7
         bFI1g7mFy8mk/KWVapbHRpyCOCZ8nkT4i56oyPyuXOyVITCYqX3Xj48XswELRuDquHna
         IXJilu+KF29z2uKPDwWZF630wf3p+NxtcAdBpfeNnyfEiABcE8XQkK11zhr33TmUQqIm
         k3ref6iAOpNM1vG6GVnLImVrZQw29dNTBrBMncNFvVMyO3GEw6g3ihp9vrYQq/tLLH7b
         8sfy3nzgtVCrYTpTr968ok223grPHGEtLqYDNNNmi94YsRaPq6kMixfFf4SQ7d88eBhK
         JKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VOr5YHRPuqfDb76uMcEJq7i9UJQUhw4nfFiHTQNaQtY=;
        b=pdObpkks67XuCk0jOCzfCsFUeACnVAfvgRY8NiXLbhpbi3rsN3jEWloPH39v22Y/qV
         aiOhAXV/3dDl82K82F8oI7wTvy7HhOqdSKAzzSvOtxbigdOdmd0pD2gEizYppy1ZlNgq
         9ikKsGvt5mkmhpiTd+SKxsoKNim4iJE7Reg77CGiGuzNRiQyrxpVVCLEIStJLKfE2g1a
         X1AQxK5wslAmNxGKQIu3vvPwzMAXXc6Q/kygP2R+88tBscs00715BANRInw9Z/D4sUnk
         UsTKr4rJlMnkDgUx1v6VBQRmW9gLF8+2FoEl1H4o8aLPtUBbPzsoav5GvK0wB6MzmJ3X
         wPfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wrt0UcyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si505363qtu.162.2020.01.09.05.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 05:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wrt0UcyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipY01-0001eq-CJ
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 08:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipXxA-0005Wv-5f
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 08:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipXx8-00046X-Du
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 08:34:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34117
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipXx7-0003tG-64
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 08:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578576859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOr5YHRPuqfDb76uMcEJq7i9UJQUhw4nfFiHTQNaQtY=;
 b=Wrt0UcyGCZ1LPATy71gv/H13c0Lva/yarPuDx7bLlNQBBUkweAobqMQCciVwwHLM6Jfwb+
 3p9eh37LBE9n74tNoSdQ/XCIAlCNjr/Hzd4576F1NrYBrdAIK12ii9f4sxOcmjQpen5lrq
 kB6fzmOISYnTs/vssqLu8G7qzvWEwP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-JzOxIUmePFOt0Ws7RPDSkA-1; Thu, 09 Jan 2020 08:34:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE703107ACC4;
 Thu,  9 Jan 2020 13:34:16 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31E4C60CD3;
 Thu,  9 Jan 2020 13:34:05 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 19/20] pc: Add support for virtio-iommu-pci
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-20-eric.auger@redhat.com>
 <20200109065832-mutt-send-email-mst@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <81f6b369-a9e1-611b-e961-18e7801e3bcd@redhat.com>
Date: Thu, 9 Jan 2020 14:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200109065832-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: JzOxIUmePFOt0Ws7RPDSkA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, quintela@redhat.com, jean-philippe.brucker@arm.com,
 qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K5xK5YIphUTx

Hi Michael,

On 1/9/20 1:02 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 22, 2019 at 07:29:42PM +0100, Eric Auger wrote:
>> The virtio-iommu-pci is instantiated through the -device QEMU
>> option. However if instantiated it also requires an IORT ACPI table
>> to describe the ID mappings between the root complex and the iommu.
>>
>> This patch adds the generation of the IORT table if the
>> virtio-iommu-pci device is instantiated.
>>
>> We also declare the [0xfee00000 - 0xfeefffff] MSI reserved region
>> so that it gets bypassed by the IOMMU.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> So I'd like us to use virtio config space in preference to ACPI.
> 
> Guest bits for that are not ready yet, but I think it's
> better to wait than maintaining both ACPI and config space forever
> later.
> 
> Could you send a smaller patchset without pci/acpi bits for now?

Yes I am about to send v12.

Indeed I hope the DT integration in ARM virt can land in 5.0. All the
kernel dependencies are resolved and it complies with the voted spec.

Then I will push the non DT integration when Jean's series get
stabilized and spec updated.

Thanks

Eric
> 
>> ---
>>  hw/i386/acpi-build.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>>  hw/i386/pc.c         | 15 ++++++++-
>>  include/hw/i386/pc.h |  2 ++
>>  3 files changed, 88 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 12ff55fcfb..f09cabdcae 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2744,6 +2744,72 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>>      return true;
>>  }
>>  
>> +static inline void
>> +fill_iort_idmap(AcpiIortIdMapping *idmap, int i,
>> +                uint32_t input_base, uint32_t id_count,
>> +                uint32_t output_base, uint32_t output_reference)
>> +{
>> +    idmap[i].input_base = cpu_to_le32(input_base);
>> +    idmap[i].id_count = cpu_to_le32(id_count);
>> +    idmap[i].output_base = cpu_to_le32(output_base);
>> +    idmap[i].output_reference = cpu_to_le32(output_reference);
>> +}
>> +
>> +static void
>> +build_iort(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
>> +{
>> +    size_t iommu_node_size, rc_node_size, iommu_node_offset;
>> +    int iort_start = table_data->len;
>> +    AcpiIortPVIommuPCI *iommu;
>> +    AcpiIortIdMapping *idmap;
>> +    AcpiIortTable *iort;
>> +    size_t iort_length;
>> +    AcpiIortRC *rc;
>> +
>> +    iort = acpi_data_push(table_data, sizeof(*iort));
>> +    iort_length = sizeof(*iort);
>> +    iort->node_count = cpu_to_le32(2);
>> +
>> +    /* virtio-iommu node */
>> +
>> +    iommu_node_offset = sizeof(*iort);
>> +    iort->node_offset = cpu_to_le32(iommu_node_offset);
>> +    iommu_node_size = sizeof(*iommu);
>> +    iort_length += iommu_node_offset;
>> +    iommu = acpi_data_push(table_data, iommu_node_size);
>> +    iommu->type = ACPI_IORT_NODE_PARAVIRT;
>> +    iommu->length = cpu_to_le16(iommu_node_size);
>> +    iommu->mapping_count = 0;
>> +    iommu->devid = cpu_to_le32(pcms->virtio_iommu_bdf);
>> +    iommu->model = cpu_to_le32(ACPI_IORT_NODE_PV_VIRTIO_IOMMU_PCI);
>> +
>> +    /* Root Complex Node */
>> +    rc_node_size = sizeof(*rc) + 2 * sizeof(*idmap);
>> +    iort_length += rc_node_size;
>> +    rc = acpi_data_push(table_data, rc_node_size);
>> +
>> +    rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>> +    rc->length = cpu_to_le16(rc_node_size);
>> +    rc->mapping_count = cpu_to_le32(2);
>> +    rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>> +
>> +    /* fully coherent device */
>> +    rc->memory_properties.cache_coherency = cpu_to_le32(1);
>> +    rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>> +    rc->pci_segment_number = 0; /* MCFG pci_segment */
>> +    fill_iort_idmap(rc->id_mapping_array, 0, 0, pcms->virtio_iommu_bdf, 0,
>> +                    iommu_node_offset);
>> +    fill_iort_idmap(rc->id_mapping_array, 1, pcms->virtio_iommu_bdf + 1,
>> +                    0xFFFF - pcms->virtio_iommu_bdf,
>> +                    pcms->virtio_iommu_bdf + 1, iommu_node_offset);
>> +
>> +    iort = (AcpiIortTable *)(table_data->data + iort_start);
>> +    iort->length = cpu_to_le32(iort_length);
>> +
>> +    build_header(linker, table_data, (void *)(table_data->data + iort_start),
>> +                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
>> +}
>> +
>>  static
>>  void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>  {
>> @@ -2835,6 +2901,12 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>              build_slit(tables_blob, tables->linker, machine);
>>          }
>>      }
>> +
>> +    if (pcms->virtio_iommu) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_iort(tables_blob, tables->linker, pcms);
>> +    }
>> +
>>      if (acpi_get_mcfg(&mcfg)) {
>>          acpi_add_table(table_offsets, tables_blob);
>>          build_mcfg(tables_blob, tables->linker, &mcfg);
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index ac08e63604..af984ee041 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -84,6 +84,7 @@
>>  #include "hw/net/ne2000-isa.h"
>>  #include "standard-headers/asm-x86/bootparam.h"
>>  #include "hw/virtio/virtio-pmem-pci.h"
>> +#include "hw/virtio/virtio-iommu.h"
>>  #include "hw/mem/memory-device.h"
>>  #include "sysemu/replay.h"
>>  #include "qapi/qmp/qerror.h"
>> @@ -1940,6 +1941,11 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>          pc_cpu_pre_plug(hotplug_dev, dev, errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI)) {
>>          pc_virtio_pmem_pci_pre_plug(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
>> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>> +        qdev_prop_set_string(dev, "reserved-regions[0]",
>> +                             "0xfee00000, 0xfeefffff, 1");
>>      }
>>  }
>>  
>> @@ -1952,6 +1958,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>          pc_cpu_plug(hotplug_dev, dev, errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI)) {
>>          pc_virtio_pmem_pci_plug(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), "virtio-iommu-pci")) {
>> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
>> +        PCIDevice *pdev = PCI_DEVICE(dev);
>> +
>> +        pcms->virtio_iommu = true;
>> +        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>>      }
>>  }
>>  
>> @@ -1990,7 +2002,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>>  {
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI)) {
>> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>> +        object_dynamic_cast(OBJECT(dev), "virtio-iommu-pci")) {
>>          return HOTPLUG_HANDLER(machine);
>>      }
>>  
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 1f86eba3f9..221b4c6ef9 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -49,6 +49,8 @@ struct PCMachineState {
>>      bool smbus_enabled;
>>      bool sata_enabled;
>>      bool pit_enabled;
>> +    bool virtio_iommu;
>> +    uint16_t virtio_iommu_bdf;
>>  
>>      /* NUMA information: */
>>      uint64_t numa_nodes;
>> -- 
>> 2.20.1
> 

