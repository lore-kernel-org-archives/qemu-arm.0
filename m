Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp390483wrp;
        Wed, 4 Sep 2019 00:54:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzupl/wJ5kh9kiIihr+G1qrJ2EuBo/vnHlZkxBqe1PLzK1nLznhZ79HT/jiIjAD89uUl0o6
X-Received: by 2002:a50:fb9a:: with SMTP id e26mr13276773edq.9.1567583678596;
        Wed, 04 Sep 2019 00:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567583678; cv=none;
        d=google.com; s=arc-20160816;
        b=aGb3orNOBOlvm7M6LjfhaVVWwOj0KCgaPJajQNugaeO65GA1fuLQP/w4T4Zil8FnGf
         QyTV3S8Yre6QCMi/jfYsyuO2TgyaNfnauBVmz8PefGb/HjznFctv5KRKTfjG4w7L4S2W
         hZEKpwgYYhESbpeMnnAhnrQfXUiy/5dLkkikXYOlUbn8DzeV34hmT6tKG/mcP89xtnNo
         MsYNWK3kD55TP0qjhWhGG6bfNeJ1g5zLMlcsV/rgZMWt9qj465GqJuFvBmE9wvARVy9C
         mIJxGZgJ7jSerVSFcjoTnzwd3Q65PmSz+IXcogSC8B8UgZxL3NjZU3wWlGdV+yqn8y61
         2hZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=G7pV/7DiGTWbpsONejb8vKE0x0CLk3lHY2rVfXp9ywc=;
        b=YTG6F7Cd8jm+72sKk+ix9ggfBFUth/kTAiD0e+O7IubVJwfzbJu/Vx3eijA35T7wAJ
         KQmnAMHmKjw3vNC5UbzxcSTaOf8y5l2S46II2BrU59A2s4Anfqu4+OqSiIybrkOf9ODd
         qqUa2Qng/kOB/00KnW6eGlSaSWJaGiawVFGsdDrvZWLuZqbIy86hYE+f4uNHuap58DZP
         qzyDr/ZlmsBK4E3opkvFFx5iZdcvE5zuPX150Cnwoc8lB75lD8rzMn/7FXpcrs+wCSas
         YpJn3i7l9VViDMkUMkdFicsjs6/hpXvh6704ebhRTQkczuA6HZfxjw5FWkudmjxkK3H1
         Po5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si3191765edu.410.2019.09.04.00.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Q7h-0001ws-If
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i5Q7Z-0001wk-4d
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i5Q7V-0002qE-Ua
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:54:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i5Q7V-0002ps-Em; Wed, 04 Sep 2019 03:54:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53BD4190C006;
 Wed,  4 Sep 2019 07:54:24 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5F95C219;
 Wed,  4 Sep 2019 07:54:14 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>, Peter Xu <peterx@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com> <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
 <20190904014416.GB30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
 <20190904053720.GG30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D562270@SHSMSX104.ccr.corp.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c8b8e80d-0b66-1a7c-28b8-0bd3b013a9e8@redhat.com>
Date: Wed, 4 Sep 2019 09:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D562270@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 04 Sep 2019 07:54:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.2 v10 08/15] virtio-iommu:
 Implement map/unmap
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kuaF0OXBV6KM

Hi,

On 9/4/19 7:46 AM, Tian, Kevin wrote:
>> From: Peter Xu [mailto:peterx@redhat.com]
>> Sent: Wednesday, September 4, 2019 1:37 PM
>>
>> On Wed, Sep 04, 2019 at 04:23:50AM +0000, Tian, Kevin wrote:
>>>> From: Peter Xu [mailto:peterx@redhat.com]
>>>> Sent: Wednesday, September 4, 2019 9:44 AM
>>>>
>>>> On Tue, Sep 03, 2019 at 01:37:11PM +0200, Auger Eric wrote:
>>>>> Hi Peter,
>>>>>
>>>>> On 8/19/19 10:11 AM, Peter Xu wrote:
>>>>>> On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +    mapping = g_tree_lookup(domain->mappings,
>> (gpointer)(&interval));
>>>>>>> +
>>>>>>> +    while (mapping) {
>>>>>>> +        viommu_interval current;
>>>>>>> +        uint64_t low  = mapping->virt_addr;
>>>>>>> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
>>>>>>> +
>>>>>>> +        current.low = low;
>>>>>>> +        current.high = high;
>>>>>>> +
>>>>>>> +        if (low == interval.low && size >= mapping->size) {
>>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>>>>>>> +            interval.low = high + 1;
>>>>>>> +            trace_virtio_iommu_unmap_left_interval(current.low,
>>>> current.high,
>>>>>>> +                interval.low, interval.high);
>>>>>>> +        } else if (high == interval.high && size >= mapping->size) {
>>>>>>> +            trace_virtio_iommu_unmap_right_interval(current.low,
>>>> current.high,
>>>>>>> +                interval.low, interval.high);
>>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>>>>>>> +            interval.high = low - 1;
>>>>>>> +        } else if (low > interval.low && high < interval.high) {
>>>>>>> +            trace_virtio_iommu_unmap_inc_interval(current.low,
>>>> current.high);
>>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>>>>>>> +        } else {
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +        if (interval.low >= interval.high) {
>>>>>>> +            return VIRTIO_IOMMU_S_OK;
>>>>>>> +        } else {
>>>>>>> +            mapping = g_tree_lookup(domain->mappings,
>>>> (gpointer)(&interval));
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (mapping) {
>>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>>>>> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
>>>>>>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
>>>>>>> +                     __func__, interval.low, size,
>>>>>>> +                     mapping->virt_addr, mapping->size);
>>>>>>> +    } else {
>>>>>>> +        return VIRTIO_IOMMU_S_OK;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return VIRTIO_IOMMU_S_INVAL;
>>>>>>
>>>>>> Could the above chunk be simplified as something like below?
>>>>>>
>>>>>>   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
>>>>>>     g_tree_remove(domain->mappings, mapping);
>>>>>>   }
>>>>> Indeed the code could be simplified. I only need to make sure I don't
>>>>> split an existing mapping.
>>>>
>>>> Hmm... Do we need to still split an existing mapping if necessary?
>>>> For example when with this mapping:
>>>>
>>>>   iova=0x1000, size=0x2000, phys=ADDR1, flags=FLAGS1
>>>>
>>>> And if we want to unmap the range (iova=0, size=0x2000), then we
>>>> should split the existing mappping and leave this one:
>>>>
>>>>   iova=0x2000, size=0x1000, phys=(ADDR1+0x1000), flags=FLAGS1
>>>>
>>>> Right?
>>>>
>>>
>>> virtio-iommu spec explicitly disallows partial unmap.
>>>
>>> 5.11.6.6.1 Driver Requirements: UNMAP request
>>>
>>> The first address of a range MUST either be the first address of a
>>> mapping or be outside any mapping. The last address of a range
>>> MUST either be the last address of a mapping or be outside any
>>> mapping.
>>>
>>> 5.11.6.6.2 Device Requirements: UNMAP request
>>>
>>> If a mapping affected by the range is not covered in its entirety
>>> by the range (the UNMAP request would split the mapping),
>>> then the device SHOULD set the request status to VIRTIO_IOMMU
>>> _S_RANGE, and SHOULD NOT remove any mapping.
>>
>> I see, thanks Kevin.
>>
>> Though why so strict?  (Sorry if I missed some discussions
>> ... pointers welcomed...)
>>
>> What I'm thinking is when we want to allocate a bunch of buffers
>> (e.g., 1M) while we will also need to be able to free them with
>> smaller chunks (e.g., 4K), then it would be even better that we allow
>> to allocate a whole 1M buffer within the guest and map it as a whole,
>> then we can selectively unmap the pages after used.  If with the
>> strict rule, we'll need to map one by one, that can be a total of
>> 1M/4K roundtrips.
>>
> 
> Sorry I forgot the original discussion. Need Jean to respond. :-)
> 
> A possible reason is that no such usage exists today, thus simplification
> was made? 

In
https://virtualization.linux-foundation.narkive.com/q6XOkO76/rfc-0-3-virtio-iommu-a-paravirtualized-iommu

I found

"
(Note: the semantics of unmap are chosen to be compatible with VFIO's
type1 v2 IOMMU API. This way a device serving as intermediary between
guest and VFIO doesn't have to keep an internal tree of mappings. They are
a bit tighter than VFIO, in that they don't allow unmap spilling outside
mapped regions. Spilling is 'undefined' at the moment, because it should
work in most cases but I don't know if it's worth the added complexity in
devices that are not simply transmitting requests to VFIO. Splitting
mappings won't ever be allowed, but see the relaxed proposal in 3/3 for
more lenient semantics)
"

Thanks

Eric
> 
> Thanks
> Kevin
> 
