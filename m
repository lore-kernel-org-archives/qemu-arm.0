Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp421154wrp;
        Wed, 4 Sep 2019 01:33:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb/CDVHcoe2YIm2Ne1JlKCiPahf1b/hZubra7fjHb4+qpEAWPB4UKJKKBAOcoWiipx5Te6
X-Received: by 2002:a05:6402:148c:: with SMTP id e12mr13666438edv.62.1567586016803;
        Wed, 04 Sep 2019 01:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567586016; cv=none;
        d=google.com; s=arc-20160816;
        b=j9WM7UuQM5oDPvE1JkTc9h6M3IdUkR6ZD3bCeStWO79Xky8E9HVjrCZxoCf27B95Mi
         RugHqUyvzcniBq5FlZzkyJBDV4sKPHiCPFdQlG6SRH1jQJ4oYep0RqplFZnwkzAQnDep
         FjXbM2nVeolaEXMCB789ISUZdNegbcMVHWs1Xo6q0KJ+ll51IUDbusGAzwfbho61odcT
         gFKPGNoJpsXhSOK5k5GDAQtLkolBMQj2hqTodSGt234C3V6OUtetSn563LREgbWHi7Vx
         44pO4JxKEy/vStbv05UQs7wkTGsxIh+9Onvnb/dj+rG7Gs/eW9TzU+BuqKEbtDTowlZV
         DR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=0ptA+kKm/dj2CUxK+n6Ih9FrB6Z2Eg7sZG2KmhKzrkw=;
        b=y8G9r+fVqUZkk+ScS30c96vvP6AzWQkHj3KvzsQrsFq7HtGn80rjHWBfbnHJ4s8GN1
         xUnMbBT1z6zS3EHSYWvz2mz/I0aaDbabKbqV6sDMlb6dS7+Xdc/EJnS54VzfqgwJZsRT
         4z1DDJS/n8PhtWM9iXFE8XcawX1E9JAbPD06Wl28XSt+nyTblsL78mQzTmABBWLDllfX
         oz8VoP8FaTMCIOvtQR2OEQ5gxcFJgfhHhWd1fxdbC29dBu4vwvtc4lfDt9Ih+ND/HVit
         IDQVLhnJlnYy+LLJoRge+DCUTGbOVjfc/U6bwDp4RiVdBLQfV4tbmc1WuxvrX3A8TE3x
         x2iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s56si4993905eda.145.2019.09.04.01.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 01:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5QjP-0006yk-Ia
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 04:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5Qim-0006yQ-D6
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5Qik-0005uK-K1
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:32:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5Qik-0005tt-BN
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:32:54 -0400
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4BE3E85542
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 08:32:53 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id b8so16141858pfd.5
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 01:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ptA+kKm/dj2CUxK+n6Ih9FrB6Z2Eg7sZG2KmhKzrkw=;
 b=kdsTjbCO9Z+HrrWiOjiql/721L+yvH+CSznXtJ5vEp+rJqpHfkTTmG1ZjrSJkYCXsX
 XnyWUAROolySChZ4ZOkXRgyNZdBfbjN3ZxuExq6EaW46X4q1wqumOWtGMW0rv692SkLL
 Io5Idc55ABsQQAXwm1oGccwpv7vnhspaN34eTE2dt1LavDKK5JQhrXnnYomM+Gi6OdIG
 0sF5HP65nLfCBzonRi5/5zbW+SWM7aDGA8hRRKILZ7csq2AjHothWPnr3Ar62B4YrFpC
 oqc8pz3xqY4sPCdps+0HXn3uPDs463JL72CfxwujkxN0lRZW8PwGbf24phTWj+uWzhe3
 ijZA==
X-Gm-Message-State: APjAAAXBHIIde7OkFhPUl6M2OB3OGxicXvdpMXAbRPTG3cRIpKhwDAgp
 o6GvEey1/Uq1xBJz/q5BFztsx9nkKzD5DhPeP15tEGIarx6ZMIX3ji6wn1Acxy7q+7XbziRa+VY
 5eMR1Me70NRNd
X-Received: by 2002:a62:3145:: with SMTP id x66mr45521051pfx.186.1567585972685; 
 Wed, 04 Sep 2019 01:32:52 -0700 (PDT)
X-Received: by 2002:a62:3145:: with SMTP id x66mr45521017pfx.186.1567585972384; 
 Wed, 04 Sep 2019 01:32:52 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q20sm22311269pfg.85.2019.09.04.01.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 01:32:51 -0700 (PDT)
Date: Wed, 4 Sep 2019 16:32:39 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190904083239.GI30402@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
 <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
 <20190904014416.GB30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
 <20190904053720.GG30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D562270@SHSMSX104.ccr.corp.intel.com>
 <c8b8e80d-0b66-1a7c-28b8-0bd3b013a9e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8b8e80d-0b66-1a7c-28b8-0bd3b013a9e8@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USTyP9OTlyW4

On Wed, Sep 04, 2019 at 09:54:12AM +0200, Auger Eric wrote:
> Hi,
> 
> On 9/4/19 7:46 AM, Tian, Kevin wrote:
> >> From: Peter Xu [mailto:peterx@redhat.com]
> >> Sent: Wednesday, September 4, 2019 1:37 PM
> >>
> >> On Wed, Sep 04, 2019 at 04:23:50AM +0000, Tian, Kevin wrote:
> >>>> From: Peter Xu [mailto:peterx@redhat.com]
> >>>> Sent: Wednesday, September 4, 2019 9:44 AM
> >>>>
> >>>> On Tue, Sep 03, 2019 at 01:37:11PM +0200, Auger Eric wrote:
> >>>>> Hi Peter,
> >>>>>
> >>>>> On 8/19/19 10:11 AM, Peter Xu wrote:
> >>>>>> On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +    mapping = g_tree_lookup(domain->mappings,
> >> (gpointer)(&interval));
> >>>>>>> +
> >>>>>>> +    while (mapping) {
> >>>>>>> +        viommu_interval current;
> >>>>>>> +        uint64_t low  = mapping->virt_addr;
> >>>>>>> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> >>>>>>> +
> >>>>>>> +        current.low = low;
> >>>>>>> +        current.high = high;
> >>>>>>> +
> >>>>>>> +        if (low == interval.low && size >= mapping->size) {
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +            interval.low = high + 1;
> >>>>>>> +            trace_virtio_iommu_unmap_left_interval(current.low,
> >>>> current.high,
> >>>>>>> +                interval.low, interval.high);
> >>>>>>> +        } else if (high == interval.high && size >= mapping->size) {
> >>>>>>> +            trace_virtio_iommu_unmap_right_interval(current.low,
> >>>> current.high,
> >>>>>>> +                interval.low, interval.high);
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +            interval.high = low - 1;
> >>>>>>> +        } else if (low > interval.low && high < interval.high) {
> >>>>>>> +            trace_virtio_iommu_unmap_inc_interval(current.low,
> >>>> current.high);
> >>>>>>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >>>>>>> +        } else {
> >>>>>>> +            break;
> >>>>>>> +        }
> >>>>>>> +        if (interval.low >= interval.high) {
> >>>>>>> +            return VIRTIO_IOMMU_S_OK;
> >>>>>>> +        } else {
> >>>>>>> +            mapping = g_tree_lookup(domain->mappings,
> >>>> (gpointer)(&interval));
> >>>>>>> +        }
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if (mapping) {
> >>>>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
> >>>>>>> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> >>>>>>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
> >>>>>>> +                     __func__, interval.low, size,
> >>>>>>> +                     mapping->virt_addr, mapping->size);
> >>>>>>> +    } else {
> >>>>>>> +        return VIRTIO_IOMMU_S_OK;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    return VIRTIO_IOMMU_S_INVAL;
> >>>>>>
> >>>>>> Could the above chunk be simplified as something like below?
> >>>>>>
> >>>>>>   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
> >>>>>>     g_tree_remove(domain->mappings, mapping);
> >>>>>>   }
> >>>>> Indeed the code could be simplified. I only need to make sure I don't
> >>>>> split an existing mapping.
> >>>>
> >>>> Hmm... Do we need to still split an existing mapping if necessary?
> >>>> For example when with this mapping:
> >>>>
> >>>>   iova=0x1000, size=0x2000, phys=ADDR1, flags=FLAGS1
> >>>>
> >>>> And if we want to unmap the range (iova=0, size=0x2000), then we
> >>>> should split the existing mappping and leave this one:
> >>>>
> >>>>   iova=0x2000, size=0x1000, phys=(ADDR1+0x1000), flags=FLAGS1
> >>>>
> >>>> Right?
> >>>>
> >>>
> >>> virtio-iommu spec explicitly disallows partial unmap.
> >>>
> >>> 5.11.6.6.1 Driver Requirements: UNMAP request
> >>>
> >>> The first address of a range MUST either be the first address of a
> >>> mapping or be outside any mapping. The last address of a range
> >>> MUST either be the last address of a mapping or be outside any
> >>> mapping.
> >>>
> >>> 5.11.6.6.2 Device Requirements: UNMAP request
> >>>
> >>> If a mapping affected by the range is not covered in its entirety
> >>> by the range (the UNMAP request would split the mapping),
> >>> then the device SHOULD set the request status to VIRTIO_IOMMU
> >>> _S_RANGE, and SHOULD NOT remove any mapping.
> >>
> >> I see, thanks Kevin.
> >>
> >> Though why so strict?  (Sorry if I missed some discussions
> >> ... pointers welcomed...)
> >>
> >> What I'm thinking is when we want to allocate a bunch of buffers
> >> (e.g., 1M) while we will also need to be able to free them with
> >> smaller chunks (e.g., 4K), then it would be even better that we allow
> >> to allocate a whole 1M buffer within the guest and map it as a whole,
> >> then we can selectively unmap the pages after used.  If with the
> >> strict rule, we'll need to map one by one, that can be a total of
> >> 1M/4K roundtrips.
> >>
> > 
> > Sorry I forgot the original discussion. Need Jean to respond. :-)
> > 
> > A possible reason is that no such usage exists today, thus simplification
> > was made? 
> 
> In
> https://virtualization.linux-foundation.narkive.com/q6XOkO76/rfc-0-3-virtio-iommu-a-paravirtualized-iommu
> 
> I found
> 
> "
> (Note: the semantics of unmap are chosen to be compatible with VFIO's
> type1 v2 IOMMU API. This way a device serving as intermediary between
> guest and VFIO doesn't have to keep an internal tree of mappings. They are
> a bit tighter than VFIO, in that they don't allow unmap spilling outside
> mapped regions. Spilling is 'undefined' at the moment, because it should
> work in most cases but I don't know if it's worth the added complexity in
> devices that are not simply transmitting requests to VFIO. Splitting
> mappings won't ever be allowed, but see the relaxed proposal in 3/3 for
> more lenient semantics)
> "

Yes it makes sense to follow vfio type1v2 here.  Though I'm not sure
whether the maintainance of "an internal tree of mappings" could be
avoided by this, at least if using current QEMU IOMMU notifier
framework.  The problem is currently the IOMMU notifiers cannot fail
(e.g., the VFIO_IOMMU_MAP_DMA ioctl from vfio-pci device will assume
the messages delivered from vIOMMUs are always valid), so AFAICT the
vIOMMU needs to tell which mapping request from the guest driver is
valid before delivering the request to vfio.  It seems impossible to
do that if without the internal tree of mapping.  But that seems to be
another story.

In all cases, I think I'm fine with the approach for this patch.

Thanks!

-- 
Peter Xu
