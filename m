Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1681194lfp;
        Sat, 8 Feb 2020 03:52:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7jNkU5NOZu8tT2WqPPrrELI49EP7x0wwCtghcLtQOVsP0ob0TR5f963tkJ0dPADhwRVeN
X-Received: by 2002:a37:9ac6:: with SMTP id c189mr3159371qke.40.1581162724859;
        Sat, 08 Feb 2020 03:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581162724; cv=none;
        d=google.com; s=arc-20160816;
        b=lXoTYM6VSeq5D43RjnCzkmIVUPADrHf1snqV0mSE/r+IPhfYSNbNmb6eEt+do1xVFD
         PJrYsWKZBUVwk2IPUXiZTEkg4uQ9Sp4LskIayEPZp5Cuskln/zpLRn9L3tsp0UJHK1Iy
         9klG8DvwvVSj3mw7Xkvp/nkbKZZ4wTngN/WZIJzNC3xGsJe+tMeH7qeO9My25tD413qZ
         wDLAr8hFxhG+RITJFD1s8j1AZG6Xxj6y2Je0daITaHGpAwiFK/zqXiUJPJMsLRdkT3o5
         pTRTucj3HLO0K+zJdE6Xsx/YEyBe7thRBKjuziKVb1cnAKHc+UIUR9OOpIk8qKkZaref
         agwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tmgoM8Z59Cj0nmW9qkdGgVPuJd0CovuBUQotOi2vlrQ=;
        b=cA0yvv0DcltqyvQoZk4BgcikhfS7z9Nt9Jza3klH4pxm8iM/5gfTaxKh2ZywqQs4G+
         5iL9cKJJHeyje57Qi8mh8AtGY+srqPSTkRXZ5DTYk6elNz85laDXID50IZcVQjFrJZXJ
         kBGe8+T8LpDWHBTJD2SiBzk0dONOoZ+H93YqXnhHhfecoWkGjfVfBSzFjnpoBfs+AnUX
         8lWCqucuMn2GF5ILG607UK1jDuFT/DXcB4RF4NWEADbrPetcZwUXFx8Q6CZNUZR0XE+P
         bPSFvi2bkSLJ0SFxd2KylOiUFU8+TMC1Q+PlUaOFbXp5SRu7M3ajby95W9sZUrbrirWT
         WPew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JYQTv41k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si1310129qtv.353.2020.02.08.03.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 03:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JYQTv41k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0Oea-0001Pr-0j
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 06:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j0OdR-0000yX-Qo
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 06:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j0OdP-0006X7-IE
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 06:50:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53036
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j0OdP-0006Ww-DO
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 06:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581162650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmgoM8Z59Cj0nmW9qkdGgVPuJd0CovuBUQotOi2vlrQ=;
 b=JYQTv41kCl8rpWYLVzayNk9yWsUum8/NlLSqpUYyzJo1Vf3FtIrNCfeQQOmWhdw24nPMSO
 sEC76b6BBBDXLNRnj+gFlTEt8IvzT0l3cBOwln2MHmARFshWcRFL7M2HpRaLZjW1EYSoCe
 4i9pHdHI+QwMLLxegVypVhXuy2nBjp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-eT5bdguAOx6HNG5JVupINA-1; Sat, 08 Feb 2020 06:50:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F140E1401;
 Sat,  8 Feb 2020 11:50:46 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 855795D9C9;
 Sat,  8 Feb 2020 11:50:37 +0000 (UTC)
Subject: Re: [PATCH v14 03/11] virtio-iommu: Implement attach/detach command
To: Peter Xu <peterx@redhat.com>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-4-eric.auger@redhat.com> <20200207202601.GD720553@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b0ae352f-aee2-345a-743d-51bf67f640f8@redhat.com>
Date: Sat, 8 Feb 2020 12:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207202601.GD720553@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: eT5bdguAOx6HNG5JVupINA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEeONTuFYZlZ

Hi Peter,

On 2/7/20 9:26 PM, Peter Xu wrote:
> On Fri, Feb 07, 2020 at 10:31:55AM +0100, Eric Auger wrote:
> 
> [...]
> 
>> v13 -> v14:
>> - in virtio_iommu_put_endpoint, if the EP is attached to a
>>   domain, call virtio_iommu_detach_endpoint_from_domain()
>> - remove domain ref counting and simply delete the mappings
>>   gtree when the last EP is detached from the domain
> 
> Yeh this looks a good optimization!  Ref counting protects the domain
> from being gone when there's still EP in the domain, but since we've
> got the ep_list in domain after all so it seems to be safe and clearer.
> 
>> - in virtio_iommu_detach_endpoint_from_domain(), return if the
>>   ep's domain is unset.
> 
> [...]
> 
>> +static void virtio_iommu_put_domain(gpointer data)
>> +{
>> +    VirtIOIOMMUDomain *domain = (VirtIOIOMMUDomain *)data;
>> +    VirtIOIOMMUEndpoint *iter, *tmp;
>> +
>> +    QLIST_FOREACH_SAFE(iter, &domain->endpoint_list, next, tmp) {
>> +        virtio_iommu_detach_endpoint_from_domain(iter);
>> +    }
>> +    trace_virtio_iommu_put_domain(domain->id);
> 
> [1]
> 
>> +    g_free(domain);
>> +}
> 
> [...]
> 
>>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>>                                 struct virtio_iommu_req_attach *req)
>>  {
>>      uint32_t domain_id = le32_to_cpu(req->domain);
>>      uint32_t ep_id = le32_to_cpu(req->endpoint);
>> +    VirtIOIOMMUDomain *domain;
>> +    VirtIOIOMMUEndpoint *ep;
>>  
>>      trace_virtio_iommu_attach(domain_id, ep_id);
>>  
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    ep = virtio_iommu_get_endpoint(s, ep_id);
>> +    if (!ep) {
>> +        return VIRTIO_IOMMU_S_NOENT;
>> +    }
>> +
>> +    if (ep->domain) {
>> +        VirtIOIOMMUDomain *previous_domain = ep->domain;
>> +        /*
>> +         * the device is already attached to a domain,
>> +         * detach it first
>> +         */
>> +        virtio_iommu_detach_endpoint_from_domain(ep);
>> +        if (QLIST_EMPTY(&previous_domain->endpoint_list)) {
> 
> I feel like we still need:
> 
>                g_tree_destroy(previous_domain->mappings);
> 
> Or the mappings will be leaked.
You're fully right :-(
> 
> To make this simpler, maybe we can destroy the mappings at [1] above.
> Then we can remove line [2] below too.
Yes I chose to destroy the mappings in the put_domain and remove [2].
> 
>> +            g_tree_remove(s->domains, GUINT_TO_POINTER(previous_domain->id));
>> +        }
>> +    }
>> +
>> +    domain = virtio_iommu_get_domain(s, domain_id);
>> +    QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
>> +
>> +    ep->domain = domain;
>> +
>> +    return VIRTIO_IOMMU_S_OK;
>>  }
>>  
>>  static int virtio_iommu_detach(VirtIOIOMMU *s,
>> @@ -50,10 +268,29 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>>  {
>>      uint32_t domain_id = le32_to_cpu(req->domain);
>>      uint32_t ep_id = le32_to_cpu(req->endpoint);
>> +    VirtIOIOMMUDomain *domain;
>> +    VirtIOIOMMUEndpoint *ep;
>>  
>>      trace_virtio_iommu_detach(domain_id, ep_id);
>>  
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
>> +    if (!ep) {
>> +        return VIRTIO_IOMMU_S_NOENT;
>> +    }
>> +
>> +    domain = ep->domain;
>> +
>> +    if (!domain || domain->id != domain_id) {
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>> +
>> +    virtio_iommu_detach_endpoint_from_domain(ep);
>> +
>> +    if (QLIST_EMPTY(&domain->endpoint_list)) {
>> +        g_tree_destroy(domain->mappings);
> 
> [2]
> 
>> +        g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
>> +    }
>> +    return VIRTIO_IOMMU_S_OK;
>>  }
>>  
>>  static int virtio_iommu_map(VirtIOIOMMU *s,
>> @@ -172,6 +409,27 @@ out:
>>      }
>>  }
> 
> Other than that, the whole patch looks good to me.

Thank you for the careful review.

Eric
> 
> Thanks,
> 

