Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8349170lfc;
        Thu, 18 Feb 2021 09:49:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySMwXCby/oFaBUBJDw3mL3URU2Nj9PRGfES1gjIqd/aYCtGYVtgPqXy6jze725MDiL+9Yl
X-Received: by 2002:a25:d4e:: with SMTP id 75mr8484994ybn.271.1613670559098;
        Thu, 18 Feb 2021 09:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613670559; cv=none;
        d=google.com; s=arc-20160816;
        b=ELDEYInRT0p2ee4OY3PiAxRosxA7EkfS/YhGvnvgjtfDRu3LXO3fFLKFziAZEZHIsN
         fb6hlYzZ41oRJDky7DSiChcXE6eE9vYMPIFGpKa3q2HnM+bU+6fbVAIn3IEhqDkR08GZ
         ZMMz+Y8uhCT/ytmy4xI2h4OXeIEX4MWqx8ovFpfoNXzSaNTzKImMZ8TT85iYyeHSQUme
         KML9ujg0rtFVHSEWAVJ04/EBrcHyN3Wz5HxLZ2V4inlLda1hZcP4mmLmZQ6N9+kprEgR
         cDInDx4+Upfbm3cDG1nejW7LcSKlXWliag57A0Kt2WSQDqBvivuWL9jd5MKtGUT9UOCn
         6mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=vaLcHI81bsZGD/eLOp6GXk4o4+/iVT8dFQ95ievPE78=;
        b=Z7+3TAHFoOQXFXn6k4LUHm3xGRdKWVDQIsR8jmIrcd9a1g2z1eVVixlJpjjItFHJj+
         69nViLw3sSKkVIFX5Mb/e7ESnRFEl52K1U+Oi1Vfr6G9jCA9fTqY+XTEqEpaDTZ8GUC4
         Bp8r58vmvM493WAGq2RIabxlWv3Z29t/73AAsYJ+ae45HwSLlBzQ4eeKocuyw5cgzdjt
         DONt+lPAD5o+qQLRLVR4yQN3t1yRLMteQcaiXdevVnmdU86RRTEIQBrNI9hGeM72ATFZ
         TqPHhyb/vyxCkVoemOAd+E2brojr50NlD40/7V2HPNhajarSgelVI9uzUVyicNSALuF0
         WGGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ggXUcZMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si6169742ybp.206.2021.02.18.09.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 09:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ggXUcZMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCnQU-0006SO-9o
	for alex.bennee@linaro.org; Thu, 18 Feb 2021 12:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCnPQ-0006Pi-Uw
 for qemu-arm@nongnu.org; Thu, 18 Feb 2021 12:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCnPO-0001h2-Pl
 for qemu-arm@nongnu.org; Thu, 18 Feb 2021 12:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613670489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vaLcHI81bsZGD/eLOp6GXk4o4+/iVT8dFQ95ievPE78=;
 b=ggXUcZMjXLW9sW6R1JQuounFJau/6rqkpExYF5kLDe2yqvT58x7uEzKX+PQuDSAT9zV24p
 klV2Yzo3ko4NbPoLZbFyor/v5aF9MDauC2Quwr6OjEX6cWRETkApMDWVf3J/tUFqikwlPf
 0KCJtQG4TCGsosVH+d5RCVkTgxZbx/w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-aYoxbWfBOUyRErNogPWXIw-1; Thu, 18 Feb 2021 12:48:07 -0500
X-MC-Unique: aYoxbWfBOUyRErNogPWXIw-1
Received: by mail-qk1-f197.google.com with SMTP id d66so1772888qke.9
 for <qemu-arm@nongnu.org>; Thu, 18 Feb 2021 09:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vaLcHI81bsZGD/eLOp6GXk4o4+/iVT8dFQ95ievPE78=;
 b=NEkZ53/iM364x7IrmkCsmqWW80AVJDxV/jDstPLw3eYjIkf1MEVmmcptdkZ8EIS4p+
 8/5kuLwE+WDwo1wXa3lma9d6yBXLTcRFg6j1B2/xpzCEd8Y9ogAQZbx4rEYXxDtrO6LS
 5AlB5n4+KHBrBIYwyZsYQ68YCUkExJKA3c3Lri3fvRkI79nfVHI25WUXBdeDoWzE5n1g
 a4pPXIh3j/qptP1+aHxEuwbRaBlnalUAwgg++w06bbLoXJgf+2EZ2vs39w6qBRrTgN38
 hs1sUDLiuGG3Cl/+CGdzb3qRtLGr7XrzbBeFjQVxU9Nnhzq6JN/6mGmI762DEO3qNj/x
 mxgQ==
X-Gm-Message-State: AOAM5339LqGRUbPjAZVUYTqG08BQlDTDGYvUVTiEXXbzEQIcc27XUrK5
 L6S7BuPyvR6vVc8rrLJYJBlsWSDp8f2Ys1fH5SfgBMzoEz0sDQmZDXA2CedJWwwltmT/Gusv4xu
 DgHuFtMzB367e
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr5327072qkb.264.1613670486556; 
 Thu, 18 Feb 2021 09:48:06 -0800 (PST)
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr5327056qkb.264.1613670486289; 
 Thu, 18 Feb 2021 09:48:06 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id 90sm3841235qtc.86.2021.02.18.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 09:48:05 -0800 (PST)
Date: Thu, 18 Feb 2021 12:48:04 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
Message-ID: <20210218174804.GB108961@xz-x1>
References: <20210218141650.424967-1-eric.auger@redhat.com>
 <20210218164203.GA108961@xz-x1>
 <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b2781e6b-d3db-8d89-4ae2-f81f12251793@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, vivek.gautam@arm.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tUJeDnJgT5Iw

On Thu, Feb 18, 2021 at 06:18:22PM +0100, Auger Eric wrote:
> Hi Peter,
> 
> On 2/18/21 5:42 PM, Peter Xu wrote:
> > Eric,
> > 
> > On Thu, Feb 18, 2021 at 03:16:50PM +0100, Eric Auger wrote:
> >> @@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
> >>  
> >>      event.type = IOMMU_NOTIFIER_UNMAP;
> >>      event.entry.target_as = &address_space_memory;
> >> -    event.entry.addr_mask = virt_end - virt_start;
> >> -    event.entry.iova = virt_start;
> >>      event.entry.perm = IOMMU_NONE;
> >>      event.entry.translated_addr = 0;
> >> +    event.entry.addr_mask = mask;
> >> +    event.entry.iova = virt_start;
> >>  
> >> -    memory_region_notify_iommu(mr, 0, event);
> >> +    if (mask == UINT64_MAX) {
> >> +        memory_region_notify_iommu(mr, 0, event);
> >> +    }
> >> +
> >> +    size = mask + 1;
> >> +
> >> +    while (size) {
> >> +        uint8_t highest_bit = 64 - clz64(size) - 1;
> > 
> > I'm not sure fetching highest bit would work right. E.g., with start=0x11000
> > and size=0x11000 (then we need to unmap 0x11000-0x22000), current code will
> > first try to invalidate range (0x11000, 0x10000), that seems still invalid
> > since 0x11000 is not aligned to 0x10000 page mask.
> 
> Hum I thought aligning the size was sufficient. Where is it checked exactly?

I don't remember all the context either.. :)

Firstly - It makes sense to do that since hardware does it, and emulation code
would make sense to follow that.

There's some more info where I looked into the src of when vt-d got introduced
with the similar change:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg625340.html

I'm not 100% certain anything will break if we don't use page mask but
arbitrary length as vhost did in iotlb msg.  However what Yan Zhao reported is
definitely worse than that since we (vt-d) used to unmap outside the range of
the range just for page mask alignment.

Thanks,

-- 
Peter Xu

