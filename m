Received: by 10.25.44.15 with SMTP id s15csp4007914lfs;
        Sun, 16 Jul 2017 18:38:03 -0700 (PDT)
X-Received: by 10.237.36.6 with SMTP id r6mr2089412qtc.159.1500255483859;
        Sun, 16 Jul 2017 18:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500255483; cv=none;
        d=google.com; s=arc-20160816;
        b=wrZqnrb9uasCJ+qU3juJ1t5Rhxp8OCUfSXFIqT9CkMgf0K1jcMwZuPBVUM+Z6v1sx1
         9zP5tIqGpjfkNnm4ACm0Slg3HlGGJ/VLKKAeCwoJpnQZ7e8HZFPwSLD/iQ3D/+2U9Jm6
         c5v8Y+xJ/gJY2Q44EfFC61rTA4o516cG0Dx66dtzzQueeHprt25O+hr20kJQVqCGwE7N
         jQ/YlxTHkemtbskmptNVHsuyI6dZGotXNPbwi69D/j+d0q4MG79a7fQFJBT7ruNMxj37
         +id2Gcv4t55zqr++BcclMmCz0sUNRpEJQ4jYQhygQzzda/XmHtHrP56JPAKyEm8w2j/B
         zNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=cERPQ04Q1DHzqXtMHCejLU5GBGEcu+myClu3SoWjGTk=;
        b=f2LCDDjntfuNSYmf/IYMAFr93ENVCiTb3itrJKco6hIPKmX/93QtyeO4R5F/rCEe49
         4xcUAImmiKVsRRo/ob1L68M06h163K4BQw7QvzsB1ERzipvS26iFyoVPIHe/WJKfMYSM
         gZi1PedNfhS256n6Di6C91t3P+6K4FfcshnYSVHA1BCKaGKQ6Eo+Z5xCogXOq0V/N2d6
         eus/K6YYw8OHdkIBORIjqcNIY9cKMsz04fU6gp6urn5IQZCFWhrIYXip9S4SiGEUk0oL
         g6JAjnWmG51YLzCtTxqgBljCvCnOv1Phkw1gPJqzYTPY8JAl5ry8UWjham1ptVV8+j9E
         OvEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r45si4874942qtc.252.2017.07.16.18.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 18:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWuz3-0006Rd-CI
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 21:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dWuyy-0006RK-Uh
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 21:37:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dWuyv-0006oK-Rr
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 21:37:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dWuyv-0006nv-JD; Sun, 16 Jul 2017 21:37:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 509C24E047;
	Mon, 17 Jul 2017 01:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 509C24E047
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=peterx@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 509C24E047
Received: from pxdev.xzpeter.org (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE0C5C6C5;
	Mon, 17 Jul 2017 01:37:38 +0000 (UTC)
Date: Mon, 17 Jul 2017 09:37:42 +0800
From: Peter Xu <peterx@redhat.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <20170717013742.GP27284@pxdev.xzpeter.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
	<0c33beca-1d6d-e8e6-c880-8807ad77ae0b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c33beca-1d6d-e8e6-c880-8807ad77ae0b@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Jul 2017 01:37:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, drjones@redhat.com,
	mst@redhat.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, qemu-devel@nongnu.org,
	Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, robin.murphy@arm.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 71/lfhfo0jSK

On Fri, Jul 14, 2017 at 12:25:13PM +0100, Jean-Philippe Brucker wrote:
> Hi Peter,
> 
> On 14/07/17 03:17, Peter Xu wrote:
> >
> > [...]
> > 
> >>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >> @@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >>      uint64_t virt_addr = le64_to_cpu(req->virt_addr);
> >>      uint64_t size = le64_to_cpu(req->size);
> >>      uint32_t flags = le32_to_cpu(req->flags);
> >> +    viommu_mapping *mapping;
> >> +    viommu_interval interval;
> >> +    viommu_as *as;
> >>  
> >>      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
> >>  
> >> -    return VIRTIO_IOMMU_S_UNSUPP;
> >> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> >> +    if (!as) {
> >> +        error_report("%s: no as", __func__);
> >> +        return VIRTIO_IOMMU_S_INVAL;
> >> +    }
> >> +    interval.low = virt_addr;
> >> +    interval.high = virt_addr + size - 1;
> >> +
> >> +    mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
> >> +
> >> +    while (mapping) {
> >> +        viommu_interval current;
> >> +        uint64_t low  = mapping->virt_addr;
> >> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> >> +
> >> +        current.low = low;
> >> +        current.high = high;
> >> +
> >> +        if (low == interval.low && size >= mapping->size) {
> >> +            g_tree_remove(as->mappings, (gpointer)&current);
> >> +            interval.low = high + 1;
> >> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
> >> +                interval.low, interval.high);
> >> +        } else if (high == interval.high && size >= mapping->size) {
> >> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
> >> +                interval.low, interval.high);
> >> +            g_tree_remove(as->mappings, (gpointer)&current);
> >> +            interval.high = low - 1;
> >> +        } else if (low > interval.low && high < interval.high) {
> >> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
> >> +            g_tree_remove(as->mappings, (gpointer)&current);
> >> +        } else {
> >> +            break;
> >> +        }
> >> +        if (interval.low >= interval.high) {
> >> +            return VIRTIO_IOMMU_S_OK;
> >> +        } else {
> >> +            mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
> >> +        }
> >> +    }
> > 
> > IIUC for unmap here we are very strict - a extreme case is that when
> > an address space is just created (so no mapping inside), if we send
> > one UNMAP to a range, it'll fail currently, right? Should we loosen
> > it?
> 
> In the next specification version I'd like to slightly redefine unmap
> semantics (to make them more deterministic). Unmapping a range that is
> only partially mapped or not mapped at all would not return an error, and
> would unmap everything that is covered by the range.
> 
> Note that unmapping a partial range (splitting a single mapping) is still
> forbidden. The following pseudocode sequences attempt to illustrate the
> rules I'd like to set. There are no mappings in the address space prior to
> each sequence.
> 
> (1) unmap(addr=0, size=5)        -> succeeds, doesn't unmap anything
> 
> (2) a = map(addr=0, size=10);
>     unmap(0, 10)                 -> succeeds, unmaps a
> 
> (3) a = map(0, 5);
>     b = map(5, 5);
>     unmap(0, 10)                 -> succeeds, unmaps a and b
> 
> (4) a = map(0, 10);
>     unmap(0, 5)                  -> faults, doesn't unmap anything
> 
> (5) a = map(0, 5);
>     b = map(5, 5);
>     unmap(0, 5)                  -> succeeds, unmaps a
> 
> (6) a = map(0, 5);
>     unmap(0, 10)                 -> succeeds, unmaps a
> 
> (7) a = map(0, 5);
>     b = map(10, 5);
>     unmap(0, 15)                 -> succeeds, unmaps a and b
> 
> Previously I left (1), (6) and (7) as an implementation choice. The device
> could either succeed and unmap, or fail and not unmap. This means that if
> a driver wanted guarantees, it had to issue strict map/unmap sequences.
> 
> I believe that VFIO type1 v2 has these semantics, but "v1" allowed (4) to
> succeed and unmap a.

Thanks Jean. It looks good.

Actually I asked mostly for (7). IMHO it is really helpful sometimes
to allow the upper layer to release the things it holds in some easy
way.

-- 
Peter Xu
