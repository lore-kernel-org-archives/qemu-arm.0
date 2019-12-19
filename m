Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2311612lff;
        Thu, 19 Dec 2019 06:43:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnUht8a5z5TJ9LoOYVo6XYQp5R26orfQIy0IIW3kp3jO5+w1MfvyJzJkMDBrR2McpB6Mex
X-Received: by 2002:a37:96c2:: with SMTP id y185mr8959233qkd.202.1576766602887;
        Thu, 19 Dec 2019 06:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576766602; cv=none;
        d=google.com; s=arc-20160816;
        b=CmElIx5/mpKJKATogMOUusVR8Oj4YZUcJc/EMHYfiTOtT0U80d7jY+FUzqTi2jydOy
         kW/vePa9/19qvMPrCivlYyASLikznaVObMuCZ7V9+AHyZFqrWYXul/fQXrnWhHQIXXmQ
         RKOgy8OHpD7C//mwjywQO9E7nZqDJIQdFyCMPqQZ6G9T+YJPlMM0jbEwNePk1avWOZmV
         mpDkD/37U/yUA9fYxr6k90J19KwxV+9Oli8Jx4v1R91m0a+uv1Mi0cxLg0M8WoV1dES8
         9/jJUxEZjwfDOfBsdUbOuz5hDWqyW7cV1r18vhl8NuEXN4VYBuBP92V0vTRoUIjrLbSn
         AX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FGeYsn7pVHeBnwY1fZ9RQcAAn6RDUwhcR2jNqIY+R88=;
        b=cCWC96811IJl/n2wGeERdl++50h43eRXoHs9Sgnd3cB+HiPUVAXteFmSVDvPbybT3D
         xwH7J80wr0z3S7hOIw+zKimNDbQ7J421HSmFUY60DITq7OWK1Jxen19d7B+0cqDDEE3z
         vJ5na9TasvEArZqud5U23Ss1sJTlY/fcXJDrI5a/3DlCGNEq8Z8cHjuNX6lQpDVUHgEp
         A7o3wk9VnUX7ekkPrROH0qH7Qe1MtRfyQfMCaiSjkpDuptmHUeE7X5JLgVwPMZdfp4Rn
         cGO70BCxTTXomlRYwh2H8TjRoVEyN3obyVUTNY0RywjBSQG2crvsdrYm3aXCXo2TTatd
         zhbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZHbODSF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q51si380457qtf.236.2019.12.19.06.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 06:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZHbODSF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihx1N-0002Vw-LY
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 09:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ihwx6-00053r-Qf
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ihwx5-00066M-52
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:38:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53493
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ihwx4-00063H-Sm
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576766334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGeYsn7pVHeBnwY1fZ9RQcAAn6RDUwhcR2jNqIY+R88=;
 b=PZHbODSFm3xTg0SvHun4gnGhV4r4jpulCg3YFqeOJCjC81zDeLlCMzccJHngWQfxzmCzGo
 TtGP1gHEDYk8w4T8oI05WEz3Djd4zPlnEBURyP6iqT6qaeUsN+4++W2PSNuiLbCgRmEAyS
 7RFQPTmtX6Yi7tMYVpTkzzMva/rxS28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-tCVEtQx3MAuaBq0xoDMSjQ-1; Thu, 19 Dec 2019 09:38:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7001089B87;
 Thu, 19 Dec 2019 14:38:49 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16F685E243;
 Thu, 19 Dec 2019 14:38:36 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
To: Peter Xu <peterx@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-9-eric.auger@redhat.com> <20191210193342.GJ3352@xz-x1>
 <44c0041d-68ad-796f-16cc-4bab7ba0f164@redhat.com>
 <20191219133308.GA4246@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
Date: Thu, 19 Dec 2019 15:38:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191219133308.GA4246@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tCVEtQx3MAuaBq0xoDMSjQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oixt3XuuyNp4

Hi Peter,

On 12/19/19 2:33 PM, Peter Xu wrote:
> On Thu, Dec 19, 2019 at 11:30:40AM +0100, Auger Eric wrote:
>> Hi Peter,
>> On 12/10/19 8:33 PM, Peter Xu wrote:
>>> On Fri, Nov 22, 2019 at 07:29:31PM +0100, Eric Auger wrote:
>>>> This patch implements the translate callback
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> v10 -> v11:
>>>> - take into account the new value struct and use
>>>>   g_tree_lookup_extended
>>>> - switched to error_report_once
>>>>
>>>> v6 -> v7:
>>>> - implemented bypass-mode
>>>>
>>>> v5 -> v6:
>>>> - replace error_report by qemu_log_mask
>>>>
>>>> v4 -> v5:
>>>> - check the device domain is not NULL
>>>> - s/printf/error_report
>>>> - set flags to IOMMU_NONE in case of all translation faults
>>>> ---
>>>>  hw/virtio/trace-events   |  1 +
>>>>  hw/virtio/virtio-iommu.c | 63 +++++++++++++++++++++++++++++++++++++++-
>>>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>>>> index f25359cee2..de7cbb3c8f 100644
>>>> --- a/hw/virtio/trace-events
>>>> +++ b/hw/virtio/trace-events
>>>> @@ -72,3 +72,4 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=%d"
>>>>  virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=%d"
>>>>  virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>>>>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>>>> +virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>>> index f0a56833a2..a83666557b 100644
>>>> --- a/hw/virtio/virtio-iommu.c
>>>> +++ b/hw/virtio/virtio-iommu.c
>>>> @@ -412,19 +412,80 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>>                                              int iommu_idx)
>>>>  {
>>>>      IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
>>>> +    viommu_interval interval, *mapping_key;
>>>> +    viommu_mapping *mapping_value;
>>>> +    VirtIOIOMMU *s = sdev->viommu;
>>>> +    viommu_endpoint *ep;
>>>> +    bool bypass_allowed;
>>>>      uint32_t sid;
>>>> +    bool found;
>>>> +
>>>> +    interval.low = addr;
>>>> +    interval.high = addr + 1;
>>>>  
>>>>      IOMMUTLBEntry entry = {
>>>>          .target_as = &address_space_memory,
>>>>          .iova = addr,
>>>>          .translated_addr = addr,
>>>> -        .addr_mask = ~(hwaddr)0,
>>>> +        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
>>>>          .perm = IOMMU_NONE,
>>>>      };
>>>>  
>>>> +    bypass_allowed = virtio_has_feature(s->acked_features,
>>>> +                                        VIRTIO_IOMMU_F_BYPASS);
>>>> +
>>>
>>> Would it be easier to check bypass_allowed here once and then drop the
>>> latter [1] and [2] check?
>> bypass_allowed does not mean you systematically bypass. You bypass if
>> the SID is unknown or if the device is not attached to any domain.
>> Otherwise you translate. But maybe I miss your point.
> 
> Ah ok, then could I ask how will this VIRTIO_IOMMU_F_BYPASS be used?
> For example, I think VT-d defines passthrough in a totally different
> way in that the PT mark will be stored in the per-device context
> entries, then we can allow a specific device to be pass-through when
> doing DMA.  That information is explicit (e.g., unknown SID will
> always fail the DMA), and per-device.
> 
> Here do you mean that you just don't put a device into any domain to
> show it wants to use PT?  Then I'm not sure how do you identify
> whether this is a legal PT or a malicious device (e.g., an unknown
> device that even does not have any driver bound to it, which will also
> satisfy "unknown SID" and "not attached to any domain", iiuc).

The virtio-iommu spec currently says:

"If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
unattached endpoints are
allowed and translated by the IOMMU using the identity function. If the
feature is not negotiated, any
memory access from an unattached endpoint fails. Upon attaching an
endpoint in bypass mode to a new
domain, any memory access from the endpoint fails, since the domain does
not contain any mapping.
"

I guess this can serve the purpose of devices doing early accesses,
before the guest OS gets the hand and maps them?

Thanks

Eric
> 
> Thanks,
> 

