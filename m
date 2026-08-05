Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5501BC55822
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 08:50:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrXKB-0006MQ-T8; Wed, 05 Aug 2026 04:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wrXKA-0006Lj-Sr
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 04:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wrXK8-0004sL-UY
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 04:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785919803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xrTpFnCOgHugVOumnPruMFBzE1cNvbotDDZNtycymHA=;
 b=XXuhXpyBfKQkYj3/FqFcpzBuojZ2bpPj6xvrU/HeXXKg76pCVqAlpWlJgbnHKKhgB5/dVg
 86L3SeBbDc6FN4UsWX+fGFMAdRCEQQUVJhu9+PzekqZjeNU5xO/BLHr5zka6+YEVy1m4qp
 kFMpJ6YQZn0mywJC1sbesLPLE+o5ODM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-6on941kIPwCEa2qcWb_eHQ-1; Wed, 05 Aug 2026 04:49:51 -0400
X-MC-Unique: 6on941kIPwCEa2qcWb_eHQ-1
X-Mimecast-MFC-AGG-ID: 6on941kIPwCEa2qcWb_eHQ_1785919791
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f6d70223dso426217f8f.1
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 01:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785919790; x=1786524590;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xrTpFnCOgHugVOumnPruMFBzE1cNvbotDDZNtycymHA=;
 b=NosTR0pVI9T9cyrQczlaFHjroY/V/eeeLRd61P0e7SfjAYrWq1FRNA7u3A0cBAPO8X
 ZjsKqIL9BwyIrzq8GWF069EYmlTZQdYGGySQF4LoYsLMtYj34YMn5W4rMg4CbK7s+qSr
 K0jgLwXLOtZCRl4pmhNDGLapAAS4P0WozpuXF75/q7E2/OVfAo8MsOo7JZTEoXsLGbrR
 +GF7xbg3iFm4wby8T6EUC5Qj7pWeR96Wea60G2T8nqOo/SBG388yRObVS58te08wCNq6
 Uc+YYAXaKymqLr4Gu/mBRCZ5tG7+46rJcvy3iiV4M380HaPVsCZyq+ReP3Be1s1r/ozD
 3zTA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8qbt8QJkixmmYa2HnUoACH9VfljsG8TUYB3pJlmlLf91gfK3zmwkIOHjOgZwymEHBQwk+UdrPpg==@nongnu.org
X-Gm-Message-State: AOJu0Yz7FmalqEzmeH93Q0z5F7sUwCkTISt5nzQwkK6PaI7WaLfEZ3+l
 6jEAWTbWRtpe4pTI7a9mkKwSYHMJ2ltgbX/I0747Oc5kPVavHq/SyDXvNu8/fTvfNHQ/jm+zU1Z
 Tojf5B1e7h/szFA6HXCJ9/EVPrg2+TyisQeZtfLllCKABGBY1w5YnBWwiG8y3AQ==
X-Gm-Gg: AR+sD13X0zQKNTc6XNJAkiRhWaSdaKGcokXzV3oCDG4ZJ7DQrsio7pRXcGyHjiO6jLj
 uPmax5WojlBV+pxSkfI/55VcS3Cg8dhnKl3YyQFjBEsGF3JkTpS7GEPK/QZHlhnwo/pi573byi5
 cybRgdcYNtjuiEsmeXKvv0kxIdhviOzFFNenjS2s2gYbmBaAVeU+9j+ybLrLclPmdNad/RznpfK
 zj2W6/2ldmos9Rjlx2af+laP/c+iekH8JEnJtZeBFCiEqrSSCHTUa6uZt8YPtgdjn35uZhbzVgh
 R/qWJZnc8YLH91IgC1mOJ54jjsTgWuQ4UwtD2cKmoGOVPyXnTKKbmH3AMxl3UDSVdrRiu8MX5Ez
 aHCKvIfOZF6AaXByhkvsS7e+9WNQpBFQZgclPkJs=
X-Received: by 2002:a05:600c:c043:b0:495:7a5a:d96c with SMTP id
 5b1f17b1804b1-4994e7d89cfmr41721055e9.18.1785919790616; 
 Wed, 05 Aug 2026 01:49:50 -0700 (PDT)
X-Received: by 2002:a05:600c:c043:b0:495:7a5a:d96c with SMTP id
 5b1f17b1804b1-4994e7d89cfmr41720555e9.18.1785919790223; 
 Wed, 05 Aug 2026 01:49:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfcc737sm65327825e9.1.2026.08.05.01.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:49:49 -0700 (PDT)
Message-ID: <5a71ad53-5c4e-4a06-8d31-59b1329d20bc@redhat.com>
Date: Wed, 5 Aug 2026 10:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hw/vfio/region: Create dmabuf for PCI BAR per
 region
To: Gavin Shan <gshan@redhat.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, alex@shazbot.org, cohuck@redhat.com,
 mst@redhat.com, nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 vivek.kasireddy@intel.com, kjaju@nvidia.com, meshetty@redhat.com
References: <20260121114111.34045-1-skolothumtho@nvidia.com>
 <20260121114111.34045-4-skolothumtho@nvidia.com>
 <aa45597c-aed8-49a0-b9bd-3c637c154ee5@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <aa45597c-aed8-49a0-b9bd-3c637c154ee5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qyuNm8XEX08zS_4XfyqV35Qb96NNp7sCqEs92FMibHk_1785919791
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.795,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/5/26 03:09, Gavin Shan wrote:
> Hi Nicolin and Shameer,
> 
> On 1/21/26 9:41 PM, Shameer Kolothum wrote:
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
>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>   hw/vfio/region.c     | 65 +++++++++++++++++++++++++++++++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/region.c b/hw/vfio/region.c
>> index ca75ab1be4..ab39d77574 100644
>> --- a/hw/vfio/region.c
>> +++ b/hw/vfio/region.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/error-report.h"
>>   #include "qemu/units.h"
>>   #include "monitor/monitor.h"
>> +#include "system/ramblock.h"
>>   #include "vfio-helpers.h"
>>   /*
>> @@ -238,13 +239,71 @@ static void vfio_subregion_unmap(VFIORegion *region, int index)
>>       region->mmaps[index].mmap = NULL;
>>   }
>> +static bool vfio_region_create_dma_buf(VFIORegion *region, Error **errp)
>> +{
>> +    g_autofree struct vfio_device_feature *feature = NULL;
>> +    VFIODevice *vbasedev = region->vbasedev;
>> +    struct vfio_device_feature_dma_buf *dma_buf;
>> +    size_t total_size;
>> +    int i, ret;
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
> 
> Shall we check if @offset and @size is aligned to PAGE_SIZE? If they're not,
> I guess we need to skip populating DMA buffer instead of preventing the
> device from being passed through to the guest.
> 
> Meghana <meshetty@redhat.com> runs into issue when passing through an NVMe
> card. The only memory BAR on the NVMe card is 16K, which is not aligned to
> 64KB (host page size).
> 
>    -device vfio-pci,id=nvme,host=0004:01:00.0,addr=0x2.0x1,bus=pcie.0
> 
>    host$ sh vfio.sh
>    QEMU 10.1.0 monitor - type 'help' for more information
>    (qemu) qemu-kvm: -device vfio-pci,id=nvme,host=0004:01:00.0,addr=0x2.0x1,bus=pcie.0: \
>                     0004:01:00.0 BAR 0: failed to create dma-buf: PCI BAR IOMMU  mappings may fail: Invalid argument

To avoid confusion, the reported error message was slightly
improved in :

   https://lore.kernel.org/qemu-devel/20260721170518.4160785-3-clg@redhat.com/

Thanks,

C.


