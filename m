Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp134393wrp;
        Tue, 3 Sep 2019 18:44:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzB+eY9EmCuojq1XsKmZYuBXGwVMcjreEcmP846g1C77x+RtTaEGNF49rgMIDWh0LrzWr3e
X-Received: by 2002:aa7:d8cf:: with SMTP id k15mr10158512eds.195.1567561485668;
        Tue, 03 Sep 2019 18:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567561485; cv=none;
        d=google.com; s=arc-20160816;
        b=OSXmKBTntKGStfpvXrpGU8w22idgjLpFMWKCJsZaaJM9PmEooIBi1h6PQUijwfvwLJ
         zcMqACLxDrIp1++qPNIOfeezR2akpMoZ6bS4LG7vNpzmJ0LSLVZTrbpd757nInCLrNrC
         F1oeuWGprduRbNkd+XxNl5MpkL3QaiDpwQ60cwQUjeB4fB45iQEU1gtriKDr906RI3h+
         1qIqkpVy1oI+hF7jJf2AnlqcGSM4y+DVVIeJjKd26c4LCS0NVuK1Enc4qsaPlRG+CW2y
         jXFIBnFSZlWXIWvHt5XIZhWOVhmeISyUk6fioKNrfOZqmKN/4Sc6bJOwTr3zcA37sQrU
         pAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=4o8FHxgaqFbS/PgjXmIAyIKGNCQJb6xAwRHqIacJmR4=;
        b=qHrdScVXPE8g7EwXl5S5tQggo3XnbvKjhWKvsXDetI1YM3DInDf4qqMUp4ay5GPjWo
         AjjQLdP4R417vSrXnaHeG3P4d4jlmjK1P1lQuvK/BpJzs+hZjpx8Ln+JezlCuQJpIqet
         yNYOidcXVuILdlaTPgzb7qm9bdWQrIAiAxjgyMkK2Vv1ArnszhDEt8amO8S2hmhXGEzi
         lAg1vAtCpSr5a58L/XjTrq5CqQgBt6od98xyN0zTHZAzxLKTwdNaZ0Yy8meBADzpvITv
         faJ9HJBXVsloGkmdVbnhPqBEblu42PvELq5vG5mEamXGiKvnwh4V6uBtwQSpTETSbLrN
         vIhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si4227993ejx.53.2019.09.03.18.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 18:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5KLk-0007qR-IV
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 21:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i5KLa-0007nj-1n
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i5KLX-00067x-F7
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:44:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33070)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i5KLX-00067T-7e
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 21:44:31 -0400
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF25C811D8
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 01:44:29 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id j9so12139694pgk.20
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 18:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4o8FHxgaqFbS/PgjXmIAyIKGNCQJb6xAwRHqIacJmR4=;
 b=SA6/oJvncS9bDTqdDPUg479+4stnfaikN7AilZzOF9kqxN8iAQZRNalDJJ7/2p2kqH
 sM75s169GwwSRaateAxChnTiWn5FQqtztwn2vvBgi0CkoxgUZN058faSj/7z/efXxh+D
 aSv7ZHaWXn9GRr36jnuuYv4g7gzTJLffBvE2SOvHqpfkucOsE5fyt5KkpJV+bBpLj1WB
 hzxT/Tj4L7quNQBKk84T38pXtHrwlWbDzMee7AgV4nGwbHS63oD05a3076OQsV7eaTqP
 imn1nSyjGQuTqOOoz1wAr0GoNTHOvYAa/ahyW80tyjUACa7iQOI3vpToDq3Tjw7iru8Y
 4kjQ==
X-Gm-Message-State: APjAAAXMFcveTPclP3hO1NQ7tslClQzLfC3cd+XAiSRt5GhObySVVHGd
 tjUtCV+wxWIGzH6fun7Y1ydGZGh19Qfhy+ox++KM8X3qLA8rVa0Ajkv7YY5ASdNxXyZ/13ebiF5
 nRGv7rSJw7rFJ
X-Received: by 2002:aa7:908b:: with SMTP id i11mr41686332pfa.199.1567561469304; 
 Tue, 03 Sep 2019 18:44:29 -0700 (PDT)
X-Received: by 2002:aa7:908b:: with SMTP id i11mr41686315pfa.199.1567561469099; 
 Tue, 03 Sep 2019 18:44:29 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c138sm394749pfc.80.2019.09.03.18.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 18:44:28 -0700 (PDT)
Date: Wed, 4 Sep 2019 09:44:16 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190904014416.GB30402@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
 <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aK2JjFvNX+cI

On Tue, Sep 03, 2019 at 01:37:11PM +0200, Auger Eric wrote:
> Hi Peter,
> 
> On 8/19/19 10:11 AM, Peter Xu wrote:
> > On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:
> > 
> > [...]
> > 
> >> +    mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
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
> >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >> +            interval.low = high + 1;
> >> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
> >> +                interval.low, interval.high);
> >> +        } else if (high == interval.high && size >= mapping->size) {
> >> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
> >> +                interval.low, interval.high);
> >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >> +            interval.high = low - 1;
> >> +        } else if (low > interval.low && high < interval.high) {
> >> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
> >> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> >> +        } else {
> >> +            break;
> >> +        }
> >> +        if (interval.low >= interval.high) {
> >> +            return VIRTIO_IOMMU_S_OK;
> >> +        } else {
> >> +            mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
> >> +        }
> >> +    }
> >> +
> >> +    if (mapping) {
> >> +        qemu_log_mask(LOG_GUEST_ERROR,
> >> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> >> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
> >> +                     __func__, interval.low, size,
> >> +                     mapping->virt_addr, mapping->size);
> >> +    } else {
> >> +        return VIRTIO_IOMMU_S_OK;
> >> +    }
> >> +
> >> +    return VIRTIO_IOMMU_S_INVAL;
> > 
> > Could the above chunk be simplified as something like below?
> > 
> >   while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
> >     g_tree_remove(domain->mappings, mapping);
> >   }
> Indeed the code could be simplified. I only need to make sure I don't
> split an existing mapping.

Hmm... Do we need to still split an existing mapping if necessary?
For example when with this mapping:

  iova=0x1000, size=0x2000, phys=ADDR1, flags=FLAGS1

And if we want to unmap the range (iova=0, size=0x2000), then we
should split the existing mappping and leave this one:

  iova=0x2000, size=0x1000, phys=(ADDR1+0x1000), flags=FLAGS1

Right?

> 
> Also I needed to use g_tree_lookup_extended to retrieve the actual key
> to remove. The usage of g_tree_lookup_extended() allows me to remove the
> virt_addr and size fields from the mapping value value struct as those
> info can be retrieved from the key.

True.  Thanks,

-- 
Peter Xu
