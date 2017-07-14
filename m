Received: by 10.25.44.15 with SMTP id s15csp326345lfs;
        Thu, 13 Jul 2017 19:27:26 -0700 (PDT)
X-Received: by 10.237.55.129 with SMTP id j1mr8601336qtb.152.1499999246075;
        Thu, 13 Jul 2017 19:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499999246; cv=none;
        d=google.com; s=arc-20160816;
        b=A5wErZEIeSFHnfc6K7INFrxg3SBZbQPRN6Hj1DhDh3nRT+PeSQEN28FAwMeWFLGyfF
         X0QpjDgi1Z8NPcdVtjPlXRweUDMW1PmxTRKtW21wi+S0n/63e87mRC1ehL0trMQyiZZl
         8Q/4+yyFxVi6vcwaZqT4Z170XwjVwfixIudQoV2GU7TyScK1TVWvNxCBFxZWv4s+mr3N
         wN74FpFdYiBMxs5w8MOCFZOyWBSxpYYIbZRrC6QshDcHx0y06yCAsXvpJQsCgphGYi1M
         4zkVPm1uktn+SijpL9WhrZgSXogz+ST76ozvLQIDnMS5VHPG776rlYlmMMk4qI5kcPaK
         yy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=+Hj4qFpF04TRAH2S++/PYQ9RZ2Ck+z2+OqGE0lHnR6A=;
        b=JEUW+1I7Q706SWS7RMqPPqLS6JkxMHGoRnyYXkuIX2jpJ3utnb9NZfSczQ8le0mcAr
         HAPe/MCHlyWo3fPcJrF3WZhIGXcGVQ2dPNtm7vzvjJnyyO9scMA5PrFEjTNsjAOQ7k9t
         vG8Wq11X9hKjgYteVKpMZQjSIi8CLVQkUf29WMcmTXX8jj/CiZUnIk0Reylk5vj5zk2D
         FHAD5i0vyG8mjqpaY4cD3obdEHx3lznwO8gu+xL4W0aqjvE0/Z62nat8/wsEczOcKbUS
         duiSlyPPSjAy6us6+7iBLoeSr8rx5qWS920/ZfnLGGfauA950M6VJbUwkm5GhmrxPtdW
         kRLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si6391198qkx.185.2017.07.13.19.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 19:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVqKB-0006Cu-2n
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 22:27:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dVqB0-0005HN-N4
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 22:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dVqAz-00027f-Fb
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 22:17:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dVqAz-00026x-6B; Thu, 13 Jul 2017 22:17:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A3F17F6B1;
	Fri, 14 Jul 2017 02:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5A3F17F6B1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=peterx@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5A3F17F6B1
Received: from pxdev.xzpeter.org (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04EEB6E532;
	Fri, 14 Jul 2017 02:17:33 +0000 (UTC)
Date: Fri, 14 Jul 2017 10:17:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170714021733.GA27284@pxdev.xzpeter.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1496851287-9428-7-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 14 Jul 2017 02:17:51 +0000 (UTC)
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
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, marc.zyngier@arm.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	robin.murphy@arm.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IESx2zJJWVrB

On Wed, Jun 07, 2017 at 06:01:25PM +0200, Eric Auger wrote:
> This patch adds the actual implementation for the translation routine
> and the virtio-iommu commands.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
> @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      uint32_t asid = le32_to_cpu(req->address_space);
>      uint32_t devid = le32_to_cpu(req->device);
>      uint32_t reserved = le32_to_cpu(req->reserved);
> +    viommu_as *as;
> +    viommu_dev *dev;
>  
>      trace_virtio_iommu_attach(asid, devid, reserved);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (dev) {
> +        return -1;
> +    }
> +
> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        as = g_malloc0(sizeof(*as));
> +        as->id = asid;
> +        as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                         NULL, NULL, (GDestroyNotify)g_free);
> +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> +        trace_virtio_iommu_new_asid(asid);
> +    }
> +
> +    dev = g_malloc0(sizeof(*dev));
> +    dev->as = as;
> +    dev->id = devid;
> +    as->nr_devices++;
> +    trace_virtio_iommu_new_devid(devid);
> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);

Here do we need to record something like a refcount for address space?
Since...

> +
> +    return VIRTIO_IOMMU_S_OK;
>  }
>  
>  static int virtio_iommu_detach(VirtIOIOMMU *s,
> @@ -106,10 +170,13 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>  {
>      uint32_t devid = le32_to_cpu(req->device);
>      uint32_t reserved = le32_to_cpu(req->reserved);
> +    int ret;
>  
>      trace_virtio_iommu_detach(devid, reserved);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));

... here when detach, imho we should check the refcount: if there is
no device using specific address space, we should release the address
space as well.

Otherwise there would have no way to destroy an address space?

> +
> +    return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
>  }

[...]

>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
> @@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>      uint64_t virt_addr = le64_to_cpu(req->virt_addr);
>      uint64_t size = le64_to_cpu(req->size);
>      uint32_t flags = le32_to_cpu(req->flags);
> +    viommu_mapping *mapping;
> +    viommu_interval interval;
> +    viommu_as *as;
>  
>      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        error_report("%s: no as", __func__);
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +    interval.low = virt_addr;
> +    interval.high = virt_addr + size - 1;
> +
> +    mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
> +
> +    while (mapping) {
> +        viommu_interval current;
> +        uint64_t low  = mapping->virt_addr;
> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> +
> +        current.low = low;
> +        current.high = high;
> +
> +        if (low == interval.low && size >= mapping->size) {
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +            interval.low = high + 1;
> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
> +                interval.low, interval.high);
> +        } else if (high == interval.high && size >= mapping->size) {
> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
> +                interval.low, interval.high);
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +            interval.high = low - 1;
> +        } else if (low > interval.low && high < interval.high) {
> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +        } else {
> +            break;
> +        }
> +        if (interval.low >= interval.high) {
> +            return VIRTIO_IOMMU_S_OK;
> +        } else {
> +            mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
> +        }
> +    }

IIUC for unmap here we are very strict - a extreme case is that when
an address space is just created (so no mapping inside), if we send
one UNMAP to a range, it'll fail currently, right? Should we loosen
it?

IMHO as long as we make sure all the mappings in the range of an UNMAP
request are destroyed, then we are good. I think at least both vfio
api and vt-d emuation have this assumption. But maybe I am wrong.
Please correct me if so.

> +
> +    if (mapping) {
> +        error_report("****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported",
> +                     __func__, interval.low, size,
> +                     mapping->virt_addr, mapping->size);
> +    } else {
> +        error_report("****** %s: no mapping for [0x%"PRIx64",0x%"PRIx64"]",
> +                     __func__, interval.low, interval.high);
> +    }
> +
> +    return VIRTIO_IOMMU_S_INVAL;
>  }

Thanks,

-- 
Peter Xu
