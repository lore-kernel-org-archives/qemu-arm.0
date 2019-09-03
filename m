Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp327701wrp;
        Tue, 3 Sep 2019 04:37:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyr3JXRonybHF1tTmqLlyZpd49nxvXduB99tfQqGN7sH94CPKUciUYApXvsypG7U5RbsWJ
X-Received: by 2002:a37:9e0d:: with SMTP id h13mr33571078qke.473.1567510648967;
        Tue, 03 Sep 2019 04:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567510648; cv=none;
        d=google.com; s=arc-20160816;
        b=rf+NgK+QmSDTwwOxfOZ5EmDuAbvU5cDkR2EriaYV983JEzLTdt5nkxCqL0hkF1An7l
         EfuTkAWgLWM9U8vwATXjpp9sD4qKPifqDpr5EL5PV+VaLk6mQfTI3cq0tnl9N8ZifwAl
         FNZR38aYJ9A/Q3f7rOyOcOVxYXMIslKZSjwZ7n6SA3rBGkWwSTgg7Ho3ByLGvFwXMo75
         rO1OBTPKPKR35lsp+RBKSeOTd+o9bruXXTHuBQEoql7GiFKe/CeTyRDsyodzcWx0kavR
         RH6nKvZY9CUq2rY4lrQ8bDw+Sd8aYAetThbK3SH+pVqj7tZu0KnJEHO7p0h9MaDf6mIO
         kgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Vyrjk4wCHoLQhs4chEXUMvZZRgzynZmSCgW5BhY81vI=;
        b=w7PVvNM/jyczHjGV5BCC6ECjz0zu5uvPqhMZDKdukZ627ALukL1iTdLDovFTGhlJe3
         Xm2MKE7Qn9Qu0Tu5QG/48v+Mfn//k9PLc4VTSVxkr1TiIMUGO528Xhu3HTcnMcmhwswV
         S7Ay4CC/B1kCCGdHPBVJF+UTKsOepFMOytGBi1I2KLeT3tc2cfXnm9hQG4U4Kes7ik0G
         0okvScAAfn2V+JCqB5zssnGzKKhpdIv5C9WVmq2eAzbBNoW7zvXYMqxH5XUlUxtwA4ww
         GnL1+Ih2f2JPu2yrsav9L1sms0Wsi47Bg7FX3vCksMH7x6GG/Yu0iy66Rn/kqLx1oJ6c
         p3iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si11796073qtp.324.2019.09.03.04.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i577o-0000zf-Bv
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i577e-0000yt-Hf
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i577d-0008Jm-0t
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:37:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i577c-0008JE-PI; Tue, 03 Sep 2019 07:37:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF64D8535D;
 Tue,  3 Sep 2019 11:37:15 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5165D9E1;
 Tue,  3 Sep 2019 11:37:12 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com> <20190819081143.GA13560@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
Date: Tue, 3 Sep 2019 13:37:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190819081143.GA13560@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 03 Sep 2019 11:37:15 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQWnxEZ3YF+B

Hi Peter,

On 8/19/19 10:11 AM, Peter Xu wrote:
> On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
> 
> [...]
> 
>> +    mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
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
>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>> +            interval.low = high + 1;
>> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +        } else if (high == interval.high && size >= mapping->size) {
>> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>> +            interval.high = low - 1;
>> +        } else if (low > interval.low && high < interval.high) {
>> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
>> +            g_tree_remove(domain->mappings, (gpointer)(&current));
>> +        } else {
>> +            break;
>> +        }
>> +        if (interval.low >= interval.high) {
>> +            return VIRTIO_IOMMU_S_OK;
>> +        } else {
>> +            mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
>> +        }
>> +    }
>> +
>> +    if (mapping) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
>> +                     __func__, interval.low, size,
>> +                     mapping->virt_addr, mapping->size);
>> +    } else {
>> +        return VIRTIO_IOMMU_S_OK;
>> +    }
>> +
>> +    return VIRTIO_IOMMU_S_INVAL;
> 
> Could the above chunk be simplified as something like below?
> 
>   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
>     g_tree_remove(domain->mappings, mapping);
>   }
Indeed the code could be simplified. I only need to make sure I don't
split an existing mapping.

Also I needed to use g_tree_lookup_extended to retrieve the actual key
to remove. The usage of g_tree_lookup_extended() allows me to remove the
virt_addr and size fields from the mapping value value struct as those
info can be retrieved from the key.

Thanks!

Eric
> 
> Thanks,
> 
