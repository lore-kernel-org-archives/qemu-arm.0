Received: by 10.25.44.15 with SMTP id s15csp796631lfs;
        Fri, 14 Jul 2017 04:24:27 -0700 (PDT)
X-Received: by 10.55.180.197 with SMTP id d188mr11020043qkf.181.1500031466933;
        Fri, 14 Jul 2017 04:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500031466; cv=none;
        d=google.com; s=arc-20160816;
        b=SWkxf7O9cpulq77Wp04frhUrbCEizdap5VvARTUJFG/5Qwh150IOmVrVn90YgnTy9r
         +ua9AvRyiisAzp9l3/mBxBjmPxnsGvJtBMPwTMXNhQYJBupizpUF1bJcYespJONg/6tm
         GZGwE72RRrfyPMlQQgy5F60p2OZkwBNZoHtcB4l7pG2dwh5vKLEy94aHGJJLcV3WSDfo
         pRg9wZ0xWXDNJSYaP+joMd/OYi1WSX5Y6MkUx5h3v5vsoMp74bpeC0v6NMoroQ2r2hli
         sJRsqhCPyi863nJ5d04xOhfYW/6lhenblhNaiEAMGK4RfmK3TTIZQE/i8xjryGEhja4w
         9AKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=/g11oQV15Fhf/QsZn+CAIbzJFHMszK9GXpd3r8XJHGI=;
        b=pIZCsnKU0gfhu72QSUkAhq0cq3CcqyScvTZFLPg9x/hf5sAAxWuaoQOEuF+k0Kt/uY
         GD3QYXavAdWi6IV2ch/HZcZQgqiE+X2vsZKqxZ1MKzcMZMXuqZ+/uGMTxWiIkLVYFUJ4
         6vYD2GhfJa4k1vOlKiM0PNAXUIznKKSY5DtITEdqr0SxkI7E5zYuod+QBV85Z7l13Yz4
         4PXiyAhIYkIc968LnciRYXQjvC3HGfxYj71o1QaclocvFbV8kCrsWNkgyLilpwDdpcZ1
         kqV5hqSfD6rA/nGiW/EbjoSkhe0CFwOyKoHTLFyF7Fo5zKHSc5qRGWt4JuyUq0u2zRHv
         n3pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23si7580363qtb.270.2017.07.14.04.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 04:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyhs-0001JX-6T
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 07:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dVyfp-0007cT-Nb
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 07:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dVyfm-0004dA-Iu
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 07:22:17 -0400
Received: from foss.arm.com ([217.140.101.70]:54650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dVyfm-0004b5-A9; Fri, 14 Jul 2017 07:22:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9448680D;
	Fri, 14 Jul 2017 04:22:10 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDC643F578;
	Fri, 14 Jul 2017 04:22:07 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <0c33beca-1d6d-e8e6-c880-8807ad77ae0b@arm.com>
Date: Fri, 14 Jul 2017 12:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170714021733.GA27284@pxdev.xzpeter.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
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
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	robin.murphy@arm.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mSli9R+MHts8

Hi Peter,

On 14/07/17 03:17, Peter Xu wrote:
>
> [...]
> 
>>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
>> @@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>      uint64_t virt_addr = le64_to_cpu(req->virt_addr);
>>      uint64_t size = le64_to_cpu(req->size);
>>      uint32_t flags = le32_to_cpu(req->flags);
>> +    viommu_mapping *mapping;
>> +    viommu_interval interval;
>> +    viommu_as *as;
>>  
>>      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
>>  
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
>> +    if (!as) {
>> +        error_report("%s: no as", __func__);
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>> +    interval.low = virt_addr;
>> +    interval.high = virt_addr + size - 1;
>> +
>> +    mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
>> +
>> +    while (mapping) {
>> +        viommu_interval current;
>> +        uint64_t low  = mapping->virt_addr;
>> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
>> +
>> +        current.low = low;
>> +        current.high = high;
>> +
>> +        if (low == interval.low && size >= mapping->size) {
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +            interval.low = high + 1;
>> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +        } else if (high == interval.high && size >= mapping->size) {
>> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +            interval.high = low - 1;
>> +        } else if (low > interval.low && high < interval.high) {
>> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +        } else {
>> +            break;
>> +        }
>> +        if (interval.low >= interval.high) {
>> +            return VIRTIO_IOMMU_S_OK;
>> +        } else {
>> +            mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
>> +        }
>> +    }
> 
> IIUC for unmap here we are very strict - a extreme case is that when
> an address space is just created (so no mapping inside), if we send
> one UNMAP to a range, it'll fail currently, right? Should we loosen
> it?

In the next specification version I'd like to slightly redefine unmap
semantics (to make them more deterministic). Unmapping a range that is
only partially mapped or not mapped at all would not return an error, and
would unmap everything that is covered by the range.

Note that unmapping a partial range (splitting a single mapping) is still
forbidden. The following pseudocode sequences attempt to illustrate the
rules I'd like to set. There are no mappings in the address space prior to
each sequence.

(1) unmap(addr=0, size=5)        -> succeeds, doesn't unmap anything

(2) a = map(addr=0, size=10);
    unmap(0, 10)                 -> succeeds, unmaps a

(3) a = map(0, 5);
    b = map(5, 5);
    unmap(0, 10)                 -> succeeds, unmaps a and b

(4) a = map(0, 10);
    unmap(0, 5)                  -> faults, doesn't unmap anything

(5) a = map(0, 5);
    b = map(5, 5);
    unmap(0, 5)                  -> succeeds, unmaps a

(6) a = map(0, 5);
    unmap(0, 10)                 -> succeeds, unmaps a

(7) a = map(0, 5);
    b = map(10, 5);
    unmap(0, 15)                 -> succeeds, unmaps a and b

Previously I left (1), (6) and (7) as an implementation choice. The device
could either succeed and unmap, or fail and not unmap. This means that if
a driver wanted guarantees, it had to issue strict map/unmap sequences.

I believe that VFIO type1 v2 has these semantics, but "v1" allowed (4) to
succeed and unmap a.

Thanks,
Jean


> IMHO as long as we make sure all the mappings in the range of an UNMAP
> request are destroyed, then we are good. I think at least both vfio
> api and vt-d emuation have this assumption. But maybe I am wrong.
> Please correct me if so.
> 
>> +
>> +    if (mapping) {
>> +        error_report("****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported",
>> +                     __func__, interval.low, size,
>> +                     mapping->virt_addr, mapping->size);
>> +    } else {
>> +        error_report("****** %s: no mapping for [0x%"PRIx64",0x%"PRIx64"]",
>> +                     __func__, interval.low, interval.high);
>> +    }
>> +
>> +    return VIRTIO_IOMMU_S_INVAL;
>>  }
> 
> Thanks,
> 

