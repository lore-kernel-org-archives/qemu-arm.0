Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BE0D39010
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 12:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgMoI-0001J6-CS; Thu, 15 Jan 2026 07:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vgMoD-0001IJ-Be
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 07:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vgMoB-0004Sy-Er
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 07:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768481438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BP99YxluBwKWHvA9aN2BGaFlGsKHddnJpaTNJAdtx2A=;
 b=ZCm7iRAIa4Yqb+vf/qo2xJH3ulxX3KTV4o6nsC1drr43RWSS4TlHReh/g6X0qqtKY2iRTQ
 9j8R5L2pAXnjH4fYe1FkwaSz1UWENfOMbrsKG3AsaFM4jCsiwrFpq6zMzIv6sWfCVWNbRz
 I0UNhmpTldf181smZAZzKDCNwLj4UIk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-IofHlsocOXWltMZCdnEYDQ-1; Thu, 15 Jan 2026 07:50:37 -0500
X-MC-Unique: IofHlsocOXWltMZCdnEYDQ-1
X-Mimecast-MFC-AGG-ID: IofHlsocOXWltMZCdnEYDQ_1768481436
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779ecc3cc8so5209655e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 04:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768481436; x=1769086236;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BP99YxluBwKWHvA9aN2BGaFlGsKHddnJpaTNJAdtx2A=;
 b=Qrce81tC9h9AvLYDFhJMGVzte4TteWZf/s5nHJvv1Bqm7vyu2KrsbOAN9EMEpFG8mA
 jHAQU+BQS0dXNa5bMNc01BPAinGJmVV0dTyi13SIFAaInDX+muy+fH4xAG5luiAnjvCP
 pj6cteGl7tiVe4UpuYX+m7LBx14nh2o8sc91ld2WRZmLjEbyYrkf8323y58xpQYIx/PR
 nzS4O5CJHIjkICwJp+caBilOKndzGzYT2xx2jjQNzbX9drnvWieC0GRitiggNK4jxvTB
 jBJjhyRTw9a7fe8NA6oea4aW/2BPKBXK/R5AUiuz51pnIgl4ymvDgPA1OSZsD7Ik/Yav
 RtLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkee5bJODFG4yTV3eY3sXJnpu3WeH/Ukrh+pDylImwle/COvXti4dgmbftjedUZwC6K/kw0VeBCg==@nongnu.org
X-Gm-Message-State: AOJu0YyFXgWyx4hJpcWbZnzfR8JTT3mDUNSkH9DkD6rSR9HCVtP94p0I
 qgW+ErtHQizqERUhQULokVeepSgUICVH33KqkyBYPpRrz0fqIHr6DjF/8rq8+QYZL+GGe9bQ4Yo
 IZHivqNvD6X7qJMUnTlZlGG9tLn8XixVY9dqj+5hLbktftwWllU4NkA==
X-Gm-Gg: AY/fxX56Ga1amvQYL86IY3ua/6gqm2Ok75UF9hn43G3ZKfEmXMTzQ+NV6vxFuL2FGZZ
 lYqh9XPxrzo/FZhXNUCMqSmRfYNABM+x8/MKeUCyNiPLEjLWLFW6f/ehQHc2plrBtGGF+0ioZ4x
 k84Udy8L0YUudfYE/GMHXA1yppLvlCbyR7iCRExme/JAUeW119qDuSmgcWYdXjSDwbRIBVhbpuB
 356S7JeFo0KmeqiG4DxKP141CZ9NpOKRqEj91rlw2IoHtvCCZRyumW9Uf1I1tpsqCX8rJQwCphN
 aKjFtELFfSHxyygNUw0tLjmACnztO/lEFSN9zf8Rg6Utn86cGZlq/gkvQ2AFdWRNuXMNIx29mTi
 2d2cx0qQpnzuYp9HV1POJvMc2FDPBOfaM2hD9ZxECQLbeQ7Ut
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-47ee712ac96mr44337545e9.31.1768481435636; 
 Thu, 15 Jan 2026 04:50:35 -0800 (PST)
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-47ee712ac96mr44337035e9.31.1768481435187; 
 Thu, 15 Jan 2026 04:50:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee97b2bebsm23190505e9.18.2026.01.15.04.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 04:50:34 -0800 (PST)
Message-ID: <13a2c58b-e0c8-40cf-a3e1-6f8ac3d0540e@redhat.com>
Date: Thu, 15 Jan 2026 13:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hw/vfio/region: Create dmabuf for PCI BAR per
 region
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, alex@shazbot.org, cohuck@redhat.com,
 mst@redhat.com, nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com,
 jgg@nvidia.com, kjaju@nvidia.com
References: <20260113113754.1189-1-skolothumtho@nvidia.com>
 <20260113113754.1189-5-skolothumtho@nvidia.com>
 <2fc6c3fe-68d9-47b9-9336-8086b372eb9d@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <2fc6c3fe-68d9-47b9-9336-8086b372eb9d@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RVaBEt2RS9WxEYPmbQLcWpnJlahTRjcp8dUdCBg8prc_1768481436
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/14/26 10:16, Duan, Zhenzhong wrote:
> 
> On 1/13/2026 7:37 PM, Shameer Kolothum wrote:
>> From: Nicolin Chen <nicolinc@nvidia.com>
>>
>> Linux now provides a VFIO dmabuf exporter to expose PCI BAR memory for P2P
>> use cases. Create a dmabuf for each mapped BAR region after the mmap is set
>> up, and store the returned fd in the region’s RAMBlock. This allows QEMU to
>> pass the fd to dma_map_file(), enabling iommufd to import the dmabuf and map
>> the BAR correctly in the host IOMMU page table.
>>
>> If the kernel lacks support or dmabuf setup fails, QEMU skips the setup
>> and continues with normal mmap handling.
>>
>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>   hw/vfio/region.c     | 69 +++++++++++++++++++++++++++++++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   2 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/region.c b/hw/vfio/region.c
>> index ca75ab1be4..8476a54dda 100644
>> --- a/hw/vfio/region.c
>> +++ b/hw/vfio/region.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/error-report.h"
>>   #include "qemu/units.h"
>>   #include "monitor/monitor.h"
>> +#include "system/ramblock.h"
>>   #include "vfio-helpers.h"
>>   /*
>> @@ -238,13 +239,53 @@ static void vfio_subregion_unmap(VFIORegion *region, int index)
>>       region->mmaps[index].mmap = NULL;
>>   }
>> +static int vfio_region_create_dma_buf(VFIORegion *region)
>> +{
>> +    g_autofree struct vfio_device_feature *feature = NULL;
>> +    VFIODevice *vbasedev = region->vbasedev;
>> +    struct vfio_device_feature_dma_buf *dma_buf;
>> +    size_t total_size;
>> +    int i, ret;
>> +
>> +    g_assert(region->nr_mmaps);
> 
> It's redundant as you have the check in vfio_region_mmap(), it's trivial.
> 
>> +
>> +    total_size = sizeof(*feature) + sizeof(*dma_buf) +
>> +                 sizeof(struct vfio_region_dma_range) * region->nr_mmaps;
>> +    feature = g_malloc0(total_size);
>> +    *feature = (struct vfio_device_feature) {
>> +        .argsz = total_size,
>> +        .flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_BUF,
>> +    };
>> +
>> +    dma_buf = (void *)feature->data;
>> +    *dma_buf = (struct vfio_device_feature_dma_buf) {
>> +        .region_index = region->nr,
>> +        .open_flags = O_RDWR,
>> +        .nr_ranges = region->nr_mmaps,
>> +    };
>> +
>> +    for (i = 0; i < region->nr_mmaps; i++) {
>> +        dma_buf->dma_ranges[i].offset = region->mmaps[i].offset;
>> +        dma_buf->dma_ranges[i].length = region->mmaps[i].size;
>> +    }
>> +
>> +    ret = vfio_device_get_feature(vbasedev, feature);
>> +    for (i = 0; i < region->nr_mmaps; i++) {
>> +        trace_vfio_region_dmabuf(region->vbasedev->name, ret, region->nr,
>> +                                 memory_region_name(region->mem),
>> +                                 region->mmaps[i].offset,
>> +                                 region->mmaps[i].size);
>> +    }
>> +    return ret;
>> +}
>> +
>>   int vfio_region_mmap(VFIORegion *region)
>>   {
>>       int i, ret, prot = 0;
>>       char *name;
>>       int fd;
>> -    if (!region->mem) {
>> +    if (!region->mem || !region->nr_mmaps) {
>>           return 0;
>>       }
>> @@ -305,6 +346,32 @@ int vfio_region_mmap(VFIORegion *region)
>>                                  region->mmaps[i].size - 1);
>>       }
>> +    ret = vfio_region_create_dma_buf(region);
>> +    if (ret < 0) {
>> +        if (ret == -ENOTTY) {
>> +            warn_report_once("VFIO dma-buf not supported in kernel: "
>> +                             "PCI BAR IOMMU mappings may fail");
>> +        } else {
>> +            error_report("%s: failed to create dma-buf (%s): "
>> +                         "PCI BAR IOMMU mappings may fail",
>> +                         memory_region_name(region->mem), strerror(errno));
>> +        }
>> +        /*
>> +         * Return success as VFIO region mmap succeeded and dmabuf is optional.
>> +         * P2P DMA or exposing device memory use cases will not be supported.
>> +         */
>> +        return 0;
>> +    }
>> +
>> +    /* Assign the dmabuf fd to associated RAMBlock */
>> +    for (i = 0; i < region->nr_mmaps; i++) {
>> +        MemoryRegion *mr = &region->mmaps[i].mem;
>> +        RAMBlock *ram_block = mr->ram_block;
>> +
>> +        ram_block->fd = ret;
>> +        ram_block->fd_offset = region->mmaps[i].offset;
>> +    }
>> +
> 
> If you have next respin, maybe cleaner to move above dmabuf related code into
> 
> vfio_region_create_dma_buf().

I agree. Can you please respin a v3 Shameer ?

Thanks,

C.


> Anyway LGTM,
> 
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> 
>>       return 0;
>>   no_mmap:
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 1e895448cd..592a0349d4 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -117,6 +117,7 @@ vfio_device_put(int fd) "close vdev->fd=%d"
>>   vfio_region_write(const char *name, int index, uint64_t addr, uint64_t data, unsigned size) " (%s:region%d+0x%"PRIx64", 0x%"PRIx64 ", %d)"
>>   vfio_region_read(char *name, int index, uint64_t addr, unsigned size, uint64_t data) " (%s:region%d+0x%"PRIx64", %d) = 0x%"PRIx64
>>   vfio_region_setup(const char *dev, int index, const char *name, unsigned long flags, unsigned long offset, unsigned long size) "Device %s, region %d \"%s\", flags: 0x%lx, offset: 0x%lx, size: 0x%lx"
>> +vfio_region_dmabuf(const char *dev, int fd, int index,  const char *name, unsigned long offset, unsigned long size) "Device %s, dmabuf fd %d region %d \"%s\", offset: 0x%lx, size: 0x%lx"
>>   vfio_region_mmap_fault(const char *name, int index, unsigned long offset, unsigned long size, int fault) "Region %s mmaps[%d], [0x%lx - 0x%lx], fault: %d"
>>   vfio_region_mmap(const char *name, unsigned long offset, unsigned long end) "Region %s [0x%lx - 0x%lx]"
>>   vfio_region_exit(const char *name, int index) "Device %s, region %d"
> 


