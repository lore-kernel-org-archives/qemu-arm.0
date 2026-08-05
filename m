Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712C3C55174
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 09:44:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrYAO-0001LW-GT; Wed, 05 Aug 2026 05:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wrYAN-0001Ko-3N
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 05:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wrYAK-000605-Ff
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 05:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785923038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDRfQ6FHRf0AI4uPzcH0rlV8Tc1HNEKuNCiM2LqGEKI=;
 b=ZnC5oLvFaNSdXgsmgnkrla1i2NnYSEv0LDDgqQbtQTy/afD3MjgGEbeQ7rLbHuveSIjXNk
 Pi3JCzF+WcGglnEhR5H38FOjjJj4X+F1j3I64r7FlDHboo9mX1kP1xOhoZyzd30cPpN5na
 lHJHlVJt0bR2wrKbk2ON2lnvif/mTG4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-wuTV4zL6NrizQT3mPYCzSQ-1; Wed, 05 Aug 2026 05:43:57 -0400
X-MC-Unique: wuTV4zL6NrizQT3mPYCzSQ-1
X-Mimecast-MFC-AGG-ID: wuTV4zL6NrizQT3mPYCzSQ_1785923036
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-84865f326efso1042105b3a.0
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 02:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785923036; x=1786527836;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YDRfQ6FHRf0AI4uPzcH0rlV8Tc1HNEKuNCiM2LqGEKI=;
 b=KruGVv48JuZ8Q0BvaLKvk8mDuYfesz92np3ASzVBKtE6c2t/DRqrQMw+FoiDfbCTLc
 HU1KSgvWwmVUOxNIB2ROL45gqIAPbWNeZ07EOMX6BRihrXcBaxAIg8OtnPDI7rfp7BUO
 6A4jEw8GQEm25FYCSEWsEfiUAg+0uNz9+XRD6fGSl5kUI+7wIsn7Hsnq71cyFOrnb3gP
 g0RBWh/kChDAI8FDVqjKFgGrGlyDl3t97jeoUNqRF2LCn3vUsbsX1hRZ62DNNjF88KXy
 R1kqV04SjViIffC9OFFwZz1YyybB5tdN+VWYbnYGRiT7qlve/eZfh6/f/B4ni+Y4QP8Y
 dCfg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGP3Vyo8phuR3G4GQdwJn2OqmeCGDI4D23xLEEoW27zlZdv/r98QaS3sw88e1dcEYu/wXs9pzE2w==@nongnu.org
X-Gm-Message-State: AOJu0YxQlEljKHW2SV1vmhzF1tybK72eN1nArGM+PUALHa7JXYc9ny8d
 f1GKjOQHd+317hdkMRPdGv/attW/LfKBZvUQB/KQO/zIZ5AtDTi6FYUfmp4qt/jcbLo1imuTg34
 qldQSFkZuCFZ6eMWBtCw8bpIIz8z+zkwg+LL8LcGdoBY/XVgNFu+y+A==
X-Gm-Gg: AR+sD13ST6GbmCVmdW72QuxnznLThT8gL8MGX8Hjx0mCwXIZpw6dahpCdwKNawM2PcD
 Q3bJcrPlXxNfd9PQt9PK+LLgy2DsebMrl8yoMH+pwqAwiGHNgvn1C0D9adTIA5PuAyw8VYrW1qy
 a4dXRv3MRsXjboJq4c8LgNOaTJNraCVCgW7N7rl1fx2707KcgZOgtlDbCbv2xmdkTaCkTYjiUXE
 e+6XqVYa2UTdkLgMxncpFo+zmoVEKWG87RtinK8PyxJf7E7wLc0VPCdIKG4oNEtmqouqVX3YhHL
 8v9DtJrzoViUX3dIveHFcePKxGfWUqhKKllA5DWWrYaBvyS5v4UIoVlf56F438vGuExfRljxyBI
 lpfMmzIv8MdYQB6BVxh39o3PKDw2Y24FVay69mdNCvA0=
X-Received: by 2002:a05:6a00:1310:b0:848:8027:cac with SMTP id
 d2e1a72fcca58-84f2e04d03fmr5745413b3a.23.1785923035851; 
 Wed, 05 Aug 2026 02:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1310:b0:848:8027:cac with SMTP id
 d2e1a72fcca58-84f2e04d03fmr5745363b3a.23.1785923035353; 
 Wed, 05 Aug 2026 02:43:55 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe707ecf6bsm1148967a12.10.2026.08.05.02.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:43:54 -0700 (PDT)
Message-ID: <3f5e7f55-e387-4fe0-b9da-28f305beee85@redhat.com>
Date: Wed, 5 Aug 2026 19:43:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hw/vfio/region: Create dmabuf for PCI BAR per
 region
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex@shazbot.org" <alex@shazbot.org>, "clg@redhat.com" <clg@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>,
 "meshetty@redhat.com" <meshetty@redhat.com>
References: <20260121114111.34045-1-skolothumtho@nvidia.com>
 <20260121114111.34045-4-skolothumtho@nvidia.com>
 <aa45597c-aed8-49a0-b9bd-3c637c154ee5@redhat.com>
 <SJ0PR12MB86148329F85C2A4A22D0C67FABD32@SJ0PR12MB8614.namprd12.prod.outlook.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <SJ0PR12MB86148329F85C2A4A22D0C67FABD32@SJ0PR12MB8614.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JL6wrZn6pLknMGJA10CENjkTgiyzj-5Qiq4BbPPS8RA_1785923036
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.795,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 8/5/26 6:33 PM, Shameer Kolothum Thodi wrote:
> Hi Gavin,
> 
>> -----Original Message-----
>> From: Gavin Shan <gshan@redhat.com>
>> Sent: 05 August 2026 02:10
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: eric.auger@redhat.com; alex@shazbot.org; clg@redhat.com;
>> cohuck@redhat.com; mst@redhat.com; Nicolin Chen <nicolinc@nvidia.com>;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> Jason Gunthorpe <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhenzhong.duan@intel.com; vivek.kasireddy@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; meshetty@redhat.com
>> Subject: Re: [PATCH v4 3/3] hw/vfio/region: Create dmabuf for PCI BAR per
>> region
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Nicolin and Shameer,
>>
>> On 1/21/26 9:41 PM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Linux now provides a VFIO dmabuf exporter to expose PCI BAR memory for
>> P2P
>>> use cases. Create a dmabuf for each mapped BAR region after the mmap is
>> set
>>> up, and store the returned fd in the region’s RAMBlock. This allows QEMU to
>>> pass the fd to dma_map_file(), enabling iommufd to import the dmabuf and
>> map
>>> the BAR correctly in the host IOMMU page table.
>>>
>>> If the kernel lacks support or dmabuf setup fails, QEMU skips the setup
>>> and continues with normal mmap handling.
>>>
>>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>    hw/vfio/region.c     | 65
>> +++++++++++++++++++++++++++++++++++++++++++-
>>>    hw/vfio/trace-events |  1 +
>>>    2 files changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/region.c b/hw/vfio/region.c
>>> index ca75ab1be4..ab39d77574 100644
>>> --- a/hw/vfio/region.c
>>> +++ b/hw/vfio/region.c
>>> @@ -29,6 +29,7 @@
>>>    #include "qemu/error-report.h"
>>>    #include "qemu/units.h"
>>>    #include "monitor/monitor.h"
>>> +#include "system/ramblock.h"
>>>    #include "vfio-helpers.h"
>>>
>>>    /*
>>> @@ -238,13 +239,71 @@ static void vfio_subregion_unmap(VFIORegion
>> *region, int index)
>>>        region->mmaps[index].mmap = NULL;
>>>    }
>>>
>>> +static bool vfio_region_create_dma_buf(VFIORegion *region, Error **errp)
>>> +{
>>> +    g_autofree struct vfio_device_feature *feature = NULL;
>>> +    VFIODevice *vbasedev = region->vbasedev;
>>> +    struct vfio_device_feature_dma_buf *dma_buf;
>>> +    size_t total_size;
>>> +    int i, ret;
>>> +
>>> +    total_size = sizeof(*feature) + sizeof(*dma_buf) +
>>> +                 sizeof(struct vfio_region_dma_range) * region->nr_mmaps;
>>> +    feature = g_malloc0(total_size);
>>> +    *feature = (struct vfio_device_feature) {
>>> +        .argsz = total_size,
>>> +        .flags = VFIO_DEVICE_FEATURE_GET |
>> VFIO_DEVICE_FEATURE_DMA_BUF,
>>> +    };
>>> +
>>> +    dma_buf = (void *)feature->data;
>>> +    *dma_buf = (struct vfio_device_feature_dma_buf) {
>>> +        .region_index = region->nr,
>>> +        .open_flags = O_RDWR,
>>> +        .nr_ranges = region->nr_mmaps,
>>> +    };
>>> +
>>> +    for (i = 0; i < region->nr_mmaps; i++) {
>>> +        dma_buf->dma_ranges[i].offset = region->mmaps[i].offset;
>>> +        dma_buf->dma_ranges[i].length = region->mmaps[i].size;
>>> +    }
>>> +
>>
>> Shall we check if @offset and @size is aligned to PAGE_SIZE? If they're not,
>> I guess we need to skip populating DMA buffer instead of preventing the
>> device from being passed through to the guest.
> 
> Hmm..does it prevent passthrough in this case? The intention was not to do that.
> vfio_region_mmap() returns 0 irrespective of dma-buf outcome.
> 
> If the concern was the usage of  error_report_err() as does in patch,
> 
> +    if (!vfio_region_create_dma_buf(region, &local_err)) {
> +        error_report_err(local_err);
> +    }
> 
> this is now updated to warn_report_err_once() by commit:
> 
> 4b2e6505d59b: vfio/region: Clarify dma-buf failure messages
> 
> Or may be I am missing your actual concern here. Please let me know.
> 
> Thanks,
> Shameer
> 

You're correct. I overlooked that @err returned from vfio_region_create_dma_buf()
isn't propagated and stopping the NVMe card from being passed to the guest.

Question: Since @err returned from vfio_region_create_dma_buf() is just used as the
warning message storage, it's more reasonable to use warn_report_once(), replacing
error_setg_errno() in vfio_region_create_dma_buf(). With this, the argument @errp
and the boolean return value of the function can be dropped. I didn't check the
history why we need the argument @errp for vfio_region_create_dma_buf().

> 
>>
>> Meghana <meshetty@redhat.com> runs into issue when passing through an
>> NVMe
>> card. The only memory BAR on the NVMe card is 16K, which is not aligned to
>> 64KB (host page size).
>>
>>     -device vfio-pci,id=nvme,host=0004:01:00.0,addr=0x2.0x1,bus=pcie.0
>>
>>     host$ sh vfio.sh
>>     QEMU 10.1.0 monitor - type 'help' for more information
>>     (qemu) qemu-kvm: -device vfio-
>> pci,id=nvme,host=0004:01:00.0,addr=0x2.0x1,bus=pcie.0: \
>>                      0004:01:00.0 BAR 0: failed to create dma-buf: PCI BAR IOMMU
>> mappings may fail: Invalid argument
>>
>>     host$ lspci -vvvs 0004:01:00.0 | grep Region.*Memory
>>     Region 0: Memory at 620040010000 (64-bit, non-prefetchable) [size=16K]
>>
>>     host kernel
>>     ===========
>>     vfio_device_fops_unl_ioctl
>>       vfio_ioctl_device_feature
>>         vfio_pci_core_ioctl_feature
>>           vfio_pci_core_feature_dma_buf
>>             validate_dmabuf_input          // Return -EINVAL for !PAGE_ALIGNED(len)
>>
>>
>>> +    ret = vfio_device_get_feature(vbasedev, feature);
>>> +    if (ret < 0) {
>>> +        if (ret == -ENOTTY) {
>>> +            warn_report_once("VFIO dma-buf not supported in kernel: "
>>> +                             "PCI BAR IOMMU mappings may fail");
>>> +            return true;
>>> +        }
>>> +        /* P2P DMA or exposing device memory use cases are not supported.
>> */
>>> +        error_setg_errno(errp, -ret, "%s: failed to create dma-buf: "
>>> +                         "PCI BAR IOMMU mappings may fail",
>>> +                         memory_region_name(region->mem));
>>> +        return false;
>>> +    }
>>> +
>>> +    /* Assign the dmabuf fd to associated RAMBlock */
>>> +    for (i = 0; i < region->nr_mmaps; i++) {
>>> +        MemoryRegion *mr = &region->mmaps[i].mem;
>>> +        RAMBlock *ram_block = mr->ram_block;
>>> +
>>> +        ram_block->fd = ret;
>>> +        ram_block->fd_offset = region->mmaps[i].offset;
>>> +        trace_vfio_region_dmabuf(region->vbasedev->name, ret, region->nr,
>>> +                                 memory_region_name(region->mem),
>>> +                                 region->mmaps[i].offset,
>>> +                                 region->mmaps[i].size);
>>> +    }
>>> +    return true;
>>> +}
>>> +
>>>    int vfio_region_mmap(VFIORegion *region)
>>>    {
>>>        int i, ret, prot = 0;
>>> +    Error *local_err = NULL;
>>>        char *name;
>>>        int fd;
>>>
>>> -    if (!region->mem) {
>>> +    if (!region->mem || !region->nr_mmaps) {
>>>            return 0;
>>>        }
>>>
>>> @@ -305,6 +364,10 @@ int vfio_region_mmap(VFIORegion *region)
>>>                                   region->mmaps[i].size - 1);
>>>        }
>>>
>>> +    if (!vfio_region_create_dma_buf(region, &local_err)) {
>>> +        error_report_err(local_err);
>>> +    }
>>> +
>>>        return 0;
>>>
>>>    no_mmap:
>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>> index 180e3d526b..466695507b 100644
>>> --- a/hw/vfio/trace-events
>>> +++ b/hw/vfio/trace-events
>>> @@ -118,6 +118,7 @@ vfio_device_put(int fd) "close vdev->fd=%d"
>>>    vfio_region_write(const char *name, int index, uint64_t addr, uint64_t
>> data, unsigned size) " (%s:region%d+0x%"PRIx64", 0x%"PRIx64 ", %d)"
>>>    vfio_region_read(char *name, int index, uint64_t addr, unsigned size,
>> uint64_t data) " (%s:region%d+0x%"PRIx64", %d) = 0x%"PRIx64
>>>    vfio_region_setup(const char *dev, int index, const char *name, unsigned
>> long flags, unsigned long offset, unsigned long size) "Device %s, region %d
>> \"%s\", flags: 0x%lx, offset: 0x%lx, size: 0x%lx"
>>> +vfio_region_dmabuf(const char *dev, int fd, int index,  const char *name,
>> unsigned long offset, unsigned long size) "Device %s, dmabuf fd %d region %d
>> \"%s\", offset: 0x%lx, size: 0x%lx"
>>>    vfio_region_mmap_fault(const char *name, int index, unsigned long offset,
>> unsigned long size, int fault) "Region %s mmaps[%d], [0x%lx - 0x%lx], fault:
>> %d"
>>>    vfio_region_mmap(const char *name, unsigned long offset, unsigned long
>> end) "Region %s [0x%lx - 0x%lx]"
>>>    vfio_region_exit(const char *name, int index) "Device %s, region %d"
>>

Thanks,
Gavin


