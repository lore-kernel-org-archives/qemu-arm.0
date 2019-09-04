Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp283833wrp;
        Tue, 3 Sep 2019 22:37:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8XaGsUK6JCTw1MQ4wwEnHNjMjcLc7AEoTCA7yVFibFak+kJSHNCP647Z/Y/tITMqGc7RE
X-Received: by 2002:a50:8974:: with SMTP id f49mr38677692edf.95.1567575463725;
        Tue, 03 Sep 2019 22:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567575463; cv=none;
        d=google.com; s=arc-20160816;
        b=jaHuFUBo/wEqfv2GmJPnDFVvbGdvf0DJx1ha4Fk8L2ONIVIa9l9Q2NW9iPQ6/INRUt
         Lfrxrdxtyb3bp+rXv6zQFv43r5J2ixZbIQ8R2LOF10o7k8R4BoYOvBMK/WX3onWM0Ppy
         szVj8jbnY3hZBEVFiApsSAmxdk/aLopyCV9423p17jjl2NvyhGuWkQHtUPbGszDIIgFw
         eUPOzICNRPQ8F1r++S44VBqWJuVjjkidaE9B6LSllmF89dZLfXNio6WeoGbQ07rN6VUE
         hmakc04mFdiw0HP5+bZ5d2/t2NlzrMLFbPdoeuMFdpVrxsMo2vGQnCtYnxCCx+HB6WFI
         ZY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7Xok+yVyZiHneq3LIxnYfTEQeUGrDhjEYQBclKpyfow=;
        b=MBh+QEG/lFPhyq1NqVkX0e/mtdOfSwEg5N2YQ7dg6zUmyb5peRhAqG1eep4lXulxet
         OiKiPiIRM8Go8nxdJfkjxm/xkBXLy9B7VWFAXMuKRbjGzlgD/HI7TjGS8dJP0IRHpzp/
         qA8DIGUitMAczmHymCXZK00EBBiDMT9ZWorozRHNU6AjnY/1oAwEItdXoPDrEh0tlbWa
         Gnl98KoDjLUyRBUlSYbqqYWX/69y4QAaXQk6VRctQHzliydWd2HedghuwgFg1VK9CF/a
         KwaCnq7iqAIgyE8GvT1q9U2/8jXS3m25Xae2mvRtmK1Cn1DbW9RBjbylwhmyqv38jwrf
         6cIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si5691030edz.77.2019.09.03.22.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 22:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5NzC-0001i0-O9
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 01:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5Nz5-0001ho-HH
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 01:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5Nz4-0003CF-CW
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 01:37:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5Nz4-0003Bl-4Q
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 01:37:34 -0400
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50778C05168C
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 05:37:33 +0000 (UTC)
Received: by mail-pg1-f199.google.com with SMTP id m17so12450384pgh.21
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 22:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Xok+yVyZiHneq3LIxnYfTEQeUGrDhjEYQBclKpyfow=;
 b=aFUyHaW2qHQOKMs3HgFr0VQkdpEq0CfJ1yKiqQwi9PEvBCGTMInTHiHRGoiZoA4C6Z
 O3eZYL4EBmOBDtuYCtwYfbonq4e4HVx9dNrnYORlHzrkAjXvuMwFHBt3x8sL5WKz8vS3
 Ga9SDm/N2qZRCL2Qb5T8Er9HX+Vk027Gk+2ZkCi+hPt78BYxk5GrLNGUO6A8wUsh/6Be
 A5GB7dYKaBWby94RdDBVv2MhTcW1BPXKRjg9hJPOBoak/uSPJvATP0nEvY3WAzRwGWGe
 mde3DKB1m07WhohnSl5w7f1tmEPYpyofHBSp1wHWTl0WmzzRbEnlXePkQVBEZuVyMbp4
 Kd7g==
X-Gm-Message-State: APjAAAWBPeCfEAnuAKHgz/gW1d2pbtu053l2ktZBfZ1KNGR9avzOtVhD
 uM3j7HZTyT0zFcGNQcoigEILJM/VPjrSpJrnNIH4vssET+VjI9KJGwSLFDxGBLAi+XSQkldc8Ye
 6xDbrsw1sfAb5
X-Received: by 2002:a17:90a:36ae:: with SMTP id
 t43mr3130342pjb.7.1567575452744; 
 Tue, 03 Sep 2019 22:37:32 -0700 (PDT)
X-Received: by 2002:a17:90a:36ae:: with SMTP id
 t43mr3130314pjb.7.1567575452475; 
 Tue, 03 Sep 2019 22:37:32 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c1sm21790274pfd.117.2019.09.03.22.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 22:37:31 -0700 (PDT)
Date: Wed, 4 Sep 2019 13:37:20 +0800
From: Peter Xu <peterx@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20190904053720.GG30402@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
 <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
 <20190904014416.GB30402@xz-x1>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 08/15] virtio-iommu: Implement
 map/unmap
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
 Auger Eric <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqW5C7i1/Eyh

On Wed, Sep 04, 2019 at 04:23:50AM +0000, Tian, Kevin wrote:
> > From: Peter Xu [mailto:peterx@redhat.com]
> > Sent: Wednesday, September 4, 2019 9:44 AM
> > 
> > On Tue, Sep 03, 2019 at 01:37:11PM +0200, Auger Eric wrote:
> > > Hi Peter,
> > >
> > > On 8/19/19 10:11 AM, Peter Xu wrote:
> > > > On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
> > > >
> > > > [...]
> > > >
> > > >> +    mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
> > > >> +
> > > >> +    while (mapping) {
> > > >> +        viommu_interval current;
> > > >> +        uint64_t low  = mapping->virt_addr;
> > > >> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> > > >> +
> > > >> +        current.low = low;
> > > >> +        current.high = high;
> > > >> +
> > > >> +        if (low == interval.low && size >= mapping->size) {
> > > >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> > > >> +            interval.low = high + 1;
> > > >> +            trace_virtio_iommu_unmap_left_interval(current.low,
> > current.high,
> > > >> +                interval.low, interval.high);
> > > >> +        } else if (high == interval.high && size >= mapping->size) {
> > > >> +            trace_virtio_iommu_unmap_right_interval(current.low,
> > current.high,
> > > >> +                interval.low, interval.high);
> > > >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> > > >> +            interval.high = low - 1;
> > > >> +        } else if (low > interval.low && high < interval.high) {
> > > >> +            trace_virtio_iommu_unmap_inc_interval(current.low,
> > current.high);
> > > >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> > > >> +        } else {
> > > >> +            break;
> > > >> +        }
> > > >> +        if (interval.low >= interval.high) {
> > > >> +            return VIRTIO_IOMMU_S_OK;
> > > >> +        } else {
> > > >> +            mapping = g_tree_lookup(domain->mappings,
> > (gpointer)(&interval));
> > > >> +        }
> > > >> +    }
> > > >> +
> > > >> +    if (mapping) {
> > > >> +        qemu_log_mask(LOG_GUEST_ERROR,
> > > >> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> > > >> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
> > > >> +                     __func__, interval.low, size,
> > > >> +                     mapping->virt_addr, mapping->size);
> > > >> +    } else {
> > > >> +        return VIRTIO_IOMMU_S_OK;
> > > >> +    }
> > > >> +
> > > >> +    return VIRTIO_IOMMU_S_INVAL;
> > > >
> > > > Could the above chunk be simplified as something like below?
> > > >
> > > >   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
> > > >     g_tree_remove(domain->mappings, mapping);
> > > >   }
> > > Indeed the code could be simplified. I only need to make sure I don't
> > > split an existing mapping.
> > 
> > Hmm... Do we need to still split an existing mapping if necessary?
> > For example when with this mapping:
> > 
> >   iova=0x1000, size=0x2000, phys=ADDR1, flags=FLAGS1
> > 
> > And if we want to unmap the range (iova=0, size=0x2000), then we
> > should split the existing mappping and leave this one:
> > 
> >   iova=0x2000, size=0x1000, phys=(ADDR1+0x1000), flags=FLAGS1
> > 
> > Right?
> > 
> 
> virtio-iommu spec explicitly disallows partial unmap.
> 
> 5.11.6.6.1 Driver Requirements: UNMAP request
> 
> The first address of a range MUST either be the first address of a 
> mapping or be outside any mapping. The last address of a range 
> MUST either be the last address of a mapping or be outside any 
> mapping.
> 
> 5.11.6.6.2 Device Requirements: UNMAP request
> 
> If a mapping affected by the range is not covered in its entirety 
> by the range (the UNMAP request would split the mapping), 
> then the device SHOULD set the request status to VIRTIO_IOMMU
> _S_RANGE, and SHOULD NOT remove any mapping.

I see, thanks Kevin.

Though why so strict?  (Sorry if I missed some discussions
... pointers welcomed...)

What I'm thinking is when we want to allocate a bunch of buffers
(e.g., 1M) while we will also need to be able to free them with
smaller chunks (e.g., 4K), then it would be even better that we allow
to allocate a whole 1M buffer within the guest and map it as a whole,
then we can selectively unmap the pages after used.  If with the
strict rule, we'll need to map one by one, that can be a total of
1M/4K roundtrips.

Regards,

-- 
Peter Xu
