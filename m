Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7DFCF45C1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 18:35:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfMky-0005N0-Ph; Mon, 12 Jan 2026 13:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vfMiL-0003rg-I7
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 13:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vfMiJ-0003yO-Rh
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 13:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768242747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KIf4utul7OBEPrpbSYrYMxo2rKquWIJTt0+kwliNsZU=;
 b=XVk6nKkc7yH6TfvlSTj6xnbsrCF6F6iHW3a+RUm1MZ77P7yLbOCsTQ3x0IYrzvQOPbueP+
 GpRixElj/DJ0OxBzdiyEffr5vSEjag6E33R22a8/Jt1Wwp5kRLM+okpMy/+NUFf2wz3hWZ
 G70LL52JJ5xK76l4NCXcnen9YUvweRc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-Q6209NKqMeSdWv8vxf4qqQ-1; Mon, 12 Jan 2026 13:31:41 -0500
X-MC-Unique: Q6209NKqMeSdWv8vxf4qqQ-1
X-Mimecast-MFC-AGG-ID: Q6209NKqMeSdWv8vxf4qqQ_1768242700
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4325cc15176so3440363f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 10:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768242700; x=1768847500;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KIf4utul7OBEPrpbSYrYMxo2rKquWIJTt0+kwliNsZU=;
 b=erbWkRNxF9po+73j7clcqTYIljoQB/6Ht+sgUf14Ul4ccphbAzFx81Wmm+0QbyDI0O
 AgvTMdTGDr4KF/5bJu1a8cfInVqITgnQSArhM4LA0boiV3cYORnbcc6uamkGvuIjcss8
 f/s7rJ89499y+B+Q0Kvi2Jv0/e+e495ct76PsDsDbaUeP+gjGGMYN55dilMcAMDESoO6
 NZ60IYVz6uYWs1fxjMYYH9rtyz+T+zt9wxg5aHHrEFErhApXf0SPgbxIudwmzVr3N8ko
 TCk/F1+8qSohYY5HScEOqlmW2qMJ5uAusgNlCIkhidkDq4st8c0BOMKiHRdGzEC9i8Zh
 504w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIXeHBOWTSaeWresbIffyyv+WoYRl4dPraJWqXb4PN/TQONk2s+51eBsn+gQLUz0ylBG/3mvBwdA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7qnA5xhRsBYwC/pw9JmZXTZQFwQltDE0zE2ObvQg0wmfhtF6f
 4BxhoAPYE7c7yeJcOAhJSxD/LDl/Hb53rS7j6CsZYBI1oHPl4uNgd7jehLy54rgsoHmR8r7f37O
 xBKrip/BaddnG219JYCGLZqPctHMGmZqOD2DbAJw0bQsUN7edWfqdhQ==
X-Gm-Gg: AY/fxX6BN94YJifixqFkM5wNNvioHA/cffZmvK883hzaQZdQMIv0px1gmN4mmMuDdY5
 cn9jU9McERnKvfIM6Pu8laRdpLDvozITWT6W1hhGGAQ7aGWTER6HSqhMm7ou5Az7EzjZBVVi8x6
 hsMuPMkhIXJbAdAQiKmmRnpHfLrphvi+jozpgx769NAdkWyfyPKOgA3Ctz5EWPIuqeNRIrPN4zI
 Vap8JdPHbGuw1oGyew8Vx/aNg+cBGaDqfyhr1If9YdfIAIeBHp8RMHlyB3S3hqSOccd1eOs4ie5
 vGDkx+rdu5sXVSrN7gOJo2hILGYvw+qMz18ywAfcKfrP1AbFQA2jJkkxE4WwzY3AT9H9kAfgezY
 WWZphIpB7oSNNbRRnui6nM0fy/AavZdma25sZePoeAbQKHM50
X-Received: by 2002:a05:6000:24c6:b0:430:f182:788f with SMTP id
 ffacd0b85a97d-432c377c603mr20498898f8f.21.1768242700077; 
 Mon, 12 Jan 2026 10:31:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8rL0RzWTfKHdZV5HtqDuUQqoOixrSvnhnAFqA8/rX0e4WUowk/Icfp0ZV4KXiBrnXEsNn7Q==
X-Received: by 2002:a05:6000:24c6:b0:430:f182:788f with SMTP id
 ffacd0b85a97d-432c377c603mr20498853f8f.21.1768242699550; 
 Mon, 12 Jan 2026 10:31:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm41337542f8f.13.2026.01.12.10.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 10:31:38 -0800 (PST)
Message-ID: <cdc371ba-d347-44f9-ab38-1f60f8f88ad6@redhat.com>
Date: Mon, 12 Jan 2026 19:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/vfio/region: Create dmabuf for PCI BAR per region
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex@shazbot.org" <alex@shazbot.org>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251222135357.143339-1-skolothumtho@nvidia.com>
 <20251222135357.143339-4-skolothumtho@nvidia.com>
 <d043f6e1-8fa4-4215-95ed-7570ae002e11@intel.com>
 <CH3PR12MB75485C401917E76FF22E0122AB85A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <d40cc8da-4003-4a40-b0de-32c79cbe6faa@redhat.com>
 <CH3PR12MB75482D2914436617438F2522AB81A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CH3PR12MB75482D2914436617438F2522AB81A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: izpc7hnfDXNAmjPMq4mkjUQsyg7gNgMdvhOa3b1Eflg_1768242700
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On 1/12/26 17:16, Shameer Kolothum wrote:
> Hi Cédric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: 09 January 2026 17:05
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; Duan, Zhenzhong
>> <zhenzhong.duan@intel.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org
>> Cc: eric.auger@redhat.com; alex@shazbot.org; cohuck@redhat.com;
>> mst@redhat.com; Nicolin Chen <nicolinc@nvidia.com>; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH 3/3] hw/vfio/region: Create dmabuf for PCI BAR per
>> region
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 1/8/26 12:04, Shameer Kolothum wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>>>> Sent: 08 January 2026 09:41
>>>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org;
>>>> qemu-devel@nongnu.org
>>>> Cc: eric.auger@redhat.com; alex@shazbot.org; clg@redhat.com;
>>>> cohuck@redhat.com; mst@redhat.com; Nicolin Chen
>>>> <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
>>>> <mochs@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>; Krishnakant
>>>> Jaju <kjaju@nvidia.com>
>>>> Subject: Re: [PATCH 3/3] hw/vfio/region: Create dmabuf for PCI BAR
>>>> per region
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 12/22/2025 9:53 PM, Shameer Kolothum wrote:
>>>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>>>
>>>>> Linux now provides a VFIO dmabuf exporter to expose PCI BAR memory
>>>>> for P2P use cases. Create a dmabuf for each mapped BAR region after
>>>>> the mmap is set up, and store the returned fd in the region’s RAMBlock.
>>>>> This allows QEMU to pass the fd to dma_map_file(), enabling iommufd
>>>>> to import the dmabuf and map the BAR correctly in the host IOMMU
>>>>> page
>>>> table.
>>>>>
>>>>> If the kernel lacks support or dmabuf setup fails, QEMU skips the
>>>>> setup and continues with normal mmap handling.
>>>>>
>>>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>>>> ---
>>>>>     hw/vfio/region.c     | 57
>>>> +++++++++++++++++++++++++++++++++++++++++++-
>>>>>     hw/vfio/trace-events |  1 +
>>>>>     2 files changed, 57 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/vfio/region.c b/hw/vfio/region.c index
>>>>> b165ab0b93..6949f6779c 100644
>>>>> --- a/hw/vfio/region.c
>>>>> +++ b/hw/vfio/region.c
>>>>> @@ -29,6 +29,7 @@
>>>>>     #include "qemu/error-report.h"
>>>>>     #include "qemu/units.h"
>>>>>     #include "monitor/monitor.h"
>>>>> +#include "system/ramblock.h"
>>>>>     #include "vfio-helpers.h"
>>>>>
>>>>>     /*
>>>>> @@ -238,13 +239,52 @@ static void vfio_subregion_unmap(VFIORegion
>>>> *region, int index)
>>>>>         region->mmaps[index].mmap = NULL;
>>>>>     }
>>>>>
>>>>> +static int vfio_region_create_dma_buf(VFIORegion *region) {
>>>>> +    g_autofree struct vfio_device_feature *feature = NULL;
>>>>> +    VFIODevice *vbasedev = region->vbasedev;
>>>>> +    struct vfio_device_feature_dma_buf *dma_buf;
>>>>> +    size_t total_size;
>>>>> +    int i, ret;
>>>>> +
>>>>> +    g_assert(region->nr_mmaps);
>>>>> +
>>>>> +    total_size = sizeof(*feature) + sizeof(*dma_buf) +
>>>>> +                 sizeof(struct vfio_region_dma_range) * region->nr_mmaps;
>>>>> +    feature = g_malloc0(total_size);
>>>>> +    *feature = (struct vfio_device_feature) {
>>>>> +        .argsz = total_size,
>>>>> +        .flags = VFIO_DEVICE_FEATURE_GET |
>>>> VFIO_DEVICE_FEATURE_DMA_BUF,
>>>>> +    };
>>>>> +
>>>>> +    dma_buf = (void *)feature->data;
>>>>> +    *dma_buf = (struct vfio_device_feature_dma_buf) {
>>>>> +        .region_index = region->nr,
>>>>> +        .open_flags = O_RDWR,
>>>>> +        .nr_ranges = region->nr_mmaps,
>>>>> +    };
>>>>> +
>>>>> +    for (i = 0; i < region->nr_mmaps; i++) {
>>>>> +        dma_buf->dma_ranges[i].offset = region->mmaps[i].offset;
>>>>> +        dma_buf->dma_ranges[i].length = region->mmaps[i].size;
>>>>> +    }
>>>>> +
>>>>> +    ret = vbasedev->io_ops->device_feature(vbasedev, feature);
>>>>
>>>> vbasedev->io_ops->device_feature may be NULL for other backend like
>>>> vbasedev->vfio-
>>>> user.
>>>
>>> Ah..Ok. I will add a check.
>>
>> Could you please add a global routine :
>>
>>     int vfio_device_get_feature(VFIODevice *vbasedev, struct
>> vfio_device_feature *feature)
> 
> Ok.
> 
>>
>>
>>>
>>>>
>>>>> +    for (i = 0; i < region->nr_mmaps; i++) {
>>>>> +        trace_vfio_region_dmabuf(region->vbasedev->name, ret, region->nr,
>>>>> +                                 region->mem->name, region->mmaps[i].offset,
>>>>> +                                 region->mmaps[i].size);
>>>>> +    }
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>     int vfio_region_mmap(VFIORegion *region)
>>>>>     {
>>>>>         int i, ret, prot = 0;
>>>>>         char *name;
>>>>>         int fd;
>>>>>
>>>>> -    if (!region->mem) {
>>>>> +    if (!region->mem || !region->nr_mmaps) {
>>>>
>>>> Just curious, when will above check return true?
>>> I think `!region->mem` covers cases where no MemoryRegion was created
>>> (e.g. zero sized regions).  And nr_mmaps checks regions with mmap
>>> support exists (VFIO_REGION_INFO_FLAG_MMAP/ _CAP_SPARSE_MMAP).
>>>
>>>>
>>>>>             return 0;
>>>>>         }
>>>>>
>>>>> @@ -305,6 +345,21 @@ int vfio_region_mmap(VFIORegion *region)
>>>>>                                    region->mmaps[i].size - 1);
>>>>>         }
>>>>>
>>>>> +    ret = vfio_region_create_dma_buf(region);
>>>>> +    if (ret < 0) {
>>>>> +        if (ret == -ENOTTY) {
>>>>> +            warn_report_once("VFIO dmabuf not supported in kernel");
>>>>> +        } else {
>>>>> +            error_report("%s: failed to create dmabuf: %s",
>>>>> +                         memory_region_name(region->mem),
>>>>> + strerror(errno));
>>
>> Shouldn't we return 'ret' in this case ?
> 
> That would result in:
> 
> Failed to mmap 0018:06:00.0 BAR 0. Performance may be slow
> 
> Not sure that error msg is correct in this context. 

Agree. It would be a step backwards from the current situation.

> If we don't return 'ret' here
> vfio_container_dma_map() will eventually report the warning:
> 
> qemu-system-aarch64: warning: vfio_container_dma_map(0xaaaaff67ad40, 0x58000000000, 0xb90000, 0xffff64000000) = -14 (Bad address)
> 0018:06:00.0: PCI peer-to-peer transactions on BARs are not supported.
> qemu-system-aarch64: warning: IOMMU_IOAS_MAP failed: Bad address, PCI BAR?

Yes that's what we have today.
  
> I think the above is good enough for this. Please let me know.

Given that, with this change, QEMU will now always request a
DMABUF fd, the question is to what extent a failure should
be considered critical.

Would there be reasons to fail to realize the vfio-pci device
and stop the machine ?

Thanks,

C.


