Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp185719ejr;
        Tue, 10 Oct 2023 07:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXdEkn6hoGYaThZ0vW5CfJmqfZhkxst7Dg9U9j2fQ0I92VOjf2YacZjny63UJhvBMSSytU
X-Received: by 2002:a05:6871:d94:b0:1e9:6ee5:925c with SMTP id vi20-20020a0568710d9400b001e96ee5925cmr1258058oab.52.1696948636030;
        Tue, 10 Oct 2023 07:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696948636; cv=none;
        d=google.com; s=arc-20160816;
        b=m7YN/oxQkUePimUuBLtoOCYDLnHkA2mpLvFxRgTCmp5iFo7l6svi9LdCVKyE6rz/54
         8GyrElFJD+/GYF8iQwohVpiku/mccTYv95oi0jrjfRwALtyzQF8v8atyeeWQNPdh3Ift
         0GPPMm1z6cuxPSmR+389o6Orr6OIhh1Mf6hHp5LOH+4L9DBFIuqIgzHDgb2A/MKj7tnZ
         sKExCFDDYHHhTdPXXkEyvcCLcbvkcPkL6e5GN/ho9MpeIl6wRHWZdYqDyPPeWfZZ9lBb
         wV8BcFaodfL3g8bwc/sgjtKJQyPDSrD8YEiQUtQgMBJGzDCplnKHfg0QXeEicLObjwVM
         neqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bvIcsGUODUn43cCRf5oDlejFHDPXTpLdVGk+xJdfoZ0=;
        fh=gVmgt05lYC9Kq3vZqToIEPbr8DFcTYootz8XWxc6lQg=;
        b=SBft7ykCUu5ASBukhb9RWg/jHUJcdWfyfFU9Ce5aj1dbDhrn0niMT+ypEz4+aGLDPW
         q6XL9bz/uzkYBkrjLJNhuJbpRhC7JeVNtkQm3ZTVhh697sYP74+ieqXsKvrxa25tECk9
         TI0cKmY+4NTJtVCfvBgW8VAPecMJzDKNpgF6Tr4oGJZLm2hBfhmzaV2DLWGaSX8G0Frc
         Z9Xptu0hu+HL64sRSQLXnvH5Pp2EquZKPQCuOpkeDItwPz9Vo6E1nY/RK4X71aQWOUMD
         XXP5BmqxyOGRTK2oW+P4WJ+gM7JZgsUavVFeFNAW8nW7ItfpWFns89TTDxsBBGemGV3P
         eOPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QR74J6P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac85856000000b0041975c9a4c3si7835173qth.89.2023.10.10.07.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 07:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QR74J6P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqDqy-0002Oe-0k; Tue, 10 Oct 2023 10:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqDqv-0002OH-Ab
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 10:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqDqt-0002AU-GU
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 10:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696948610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvIcsGUODUn43cCRf5oDlejFHDPXTpLdVGk+xJdfoZ0=;
 b=QR74J6P2/+NRi1E31t0cdz5i4rxKjNzOGQ/owYSZfSlEYLRxFOfyjJrsxIsMkOTkqitX2U
 7RDzv5j02fZC+1fELHwX9POAq25YvM14YOBedg6/g4IZOyB8CtW4qdEysBQWKSzFot2XCd
 iDd3xEE4S6hnR/rXrfQtAMr3gq6MUx4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-6yd1zkdpORSxL-76OFHdxA-1; Tue, 10 Oct 2023 10:36:44 -0400
X-MC-Unique: 6yd1zkdpORSxL-76OFHdxA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-65afa60d118so69209536d6.0
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696948604; x=1697553404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvIcsGUODUn43cCRf5oDlejFHDPXTpLdVGk+xJdfoZ0=;
 b=kbK/GT3QwJ78tpq0K2vaym9QsCkpXEa2o7ZjiMcroN3ey3CugPZn4XUzcdYK57rjaY
 fgQ5kxm2YGqX5Qy0WTVIFLmiOCsJ3gDYTcRygLLzx01GVixmW5eN9OBEb7MzxU2/C1FG
 wGWvgqv1BIVSqZ+Y/y54sv50+fa3E87QXLXDGLk/7vQrixysfo/q4KlkELIAsSUaob7n
 0VucOzkrHXtoKbyo2KmhkA/Qd5t1LFjUpWMGm9jYqy9DbylequEZoILzhNngccFwMEEa
 F9Ek5GlrzI75HppsjU9gfwKGHDykx82KscIXnSyiThYiHvu7fx8b/iQ2g4NDkWfs8qN/
 2ROQ==
X-Gm-Message-State: AOJu0YwV6Eqh7lJ2AdbBIPymRFlEl/OxeW3HKgs82hz8qqOLMWV6FLmm
 Bu3s7fOGvewcjbZYeSJquNbJJCJrxIrUYM/Y+kaOfdgIbyh2CXuJKOmeJTynkNjC5tl1XdQ+RXH
 kumi6c/6SJpwV
X-Received: by 2002:a0c:f14b:0:b0:65a:fcd1:1d8c with SMTP id
 y11-20020a0cf14b000000b0065afcd11d8cmr17901857qvl.61.1696948603872; 
 Tue, 10 Oct 2023 07:36:43 -0700 (PDT)
X-Received: by 2002:a0c:f14b:0:b0:65a:fcd1:1d8c with SMTP id
 y11-20020a0cf14b000000b0065afcd11d8cmr17901829qvl.61.1696948603491; 
 Tue, 10 Oct 2023 07:36:43 -0700 (PDT)
Received: from [192.168.43.95] ([37.170.189.5])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a0cf381000000b0064f43efc844sm4765123qvk.32.2023.10.10.07.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 07:36:42 -0700 (PDT)
Message-ID: <9bc182c6-dd2d-2f00-c7eb-3065f17a05cb@redhat.com>
Date: Tue, 10 Oct 2023 16:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/12] virtio-iommu: Implement set_iova_ranges()
 callback
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-8-eric.auger@redhat.com>
 <20230929161547.GB2957297@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230929161547.GB2957297@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WYUkrm7kc7Eg

Hi Jean,
On 9/29/23 18:15, Jean-Philippe Brucker wrote:
> On Wed, Sep 13, 2023 at 10:01:42AM +0200, Eric Auger wrote:
>> The implementation populates the array of per IOMMUDevice
>> host reserved regions.
>>
>> It is forbidden to have conflicting sets of host IOVA ranges
>> to be applied onto the same IOMMU MR (implied by different
>> host devices).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - Forbid conflicting sets of host resv regions
>> ---
>>  include/hw/virtio/virtio-iommu.h |  2 ++
>>  hw/virtio/virtio-iommu.c         | 48 ++++++++++++++++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index 70b8ace34d..31b69c8261 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -40,6 +40,8 @@ typedef struct IOMMUDevice {
>>      MemoryRegion root;          /* The root container of the device */
>>      MemoryRegion bypass_mr;     /* The alias of shared memory MR */
>>      GList *resv_regions;
>> +    Range *host_resv_regions;
>> +    uint32_t nr_host_resv_regions;
>>  } IOMMUDevice;
>>  
>>  typedef struct IOMMUPciBus {
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index ea359b586a..ed2df5116f 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -20,6 +20,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qemu/log.h"
>>  #include "qemu/iov.h"
>> +#include "qemu/range.h"
>>  #include "exec/target_page.h"
>>  #include "hw/qdev-properties.h"
>>  #include "hw/virtio/virtio.h"
>> @@ -1158,6 +1159,52 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>      return 0;
>>  }
>>  
>> +static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
>> +                                        uint32_t nr_ranges,
>> +                                        struct Range *iova_ranges,
>> +                                        Error **errp)
>> +{
>> +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
>> +    uint32_t nr_host_resv_regions;
>> +    Range *host_resv_regions;
>> +    int ret = -EINVAL;
>> +
>> +    if (!nr_ranges) {
>> +        return 0;
>> +    }
>> +
>> +    if (sdev->host_resv_regions) {
>> +        range_inverse_array(nr_ranges, iova_ranges,
>> +                            &nr_host_resv_regions, &host_resv_regions,
>> +                            0, UINT64_MAX);
>> +        if (nr_host_resv_regions != sdev->nr_host_resv_regions) {
>> +            goto error;
>> +        }
>> +        for (int i = 0; i < nr_host_resv_regions; i++) {
>> +            Range *new = &host_resv_regions[i];
>> +            Range *existing = &sdev->host_resv_regions[i];
>> +
>> +            if (!range_contains_range(existing, new)) {
>> +                goto error;
>> +            }
>> +        }
>> +        ret = 0;
>> +        goto out;
>> +    }
>> +
>> +    range_inverse_array(nr_ranges, iova_ranges,
>> +                        &sdev->nr_host_resv_regions, &sdev->host_resv_regions,
>> +                        0, UINT64_MAX);
> Can set_iova_ranges() only be called for the first time before the guest
> has had a chance to issue a probe request?  Maybe we could add a
> sanity-check that the guest hasn't issued a probe request yet, since we
> can't notify about updated reserved regions.

I added a warning if the set_iova is called after the probe

Eric
>
> I'm probably misremembering because I thought Linux set up IOMMU contexts
> (including probe requests) before enabling DMA master in PCI which cause
> QEMU VFIO to issue these calls. I'll double check.
>
> Thanks,
> Jean
>
>> +
>> +    return 0;
>> +error:
>> +    error_setg(errp, "IOMMU mr=%s Conflicting host reserved regions set!",
>> +               mr->parent_obj.name);
>> +out:
>> +    g_free(host_resv_regions);
>> +    return ret;
>> +}
>> +
>>  static void virtio_iommu_system_reset(void *opaque)
>>  {
>>      VirtIOIOMMU *s = opaque;
>> @@ -1453,6 +1500,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
>>      imrc->replay = virtio_iommu_replay;
>>      imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
>>      imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
>> +    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
>>  }
>>  
>>  static const TypeInfo virtio_iommu_info = {
>> -- 
>> 2.41.0
>>

