Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4224678lfp;
        Mon, 3 Feb 2020 09:47:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxenEgRVT2PCm7V9gRVqvzGcHBXzvtJ1EGmeCuutJhK2L6dZM655Z9ODSt/3DWXxCUBOSSi
X-Received: by 2002:a05:620a:158c:: with SMTP id d12mr10699714qkk.212.1580752038565;
        Mon, 03 Feb 2020 09:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580752038; cv=none;
        d=google.com; s=arc-20160816;
        b=nt/jSdxEROkpNt1hC6srdnakWSQ3UgQMZt5qroeAHVsK2v3orS+WLlIziyP+JEaCTc
         8UMnycKCOkatyzMpMCM4Bzyt1aZ06IwCKwAyQNUAbov8GZL9LLE1FQst41mlYsVAlh/H
         RRUPNS8KBPZ184syvzpiv8JhmNt/8Kkws3yc4WOzIpaVSrrxHA8z7cB+VChSaEy8/1Sb
         rcTO6DBTP/MRl/K+oxY+olAlqIf5vPVz1CfCoBlhCbRy/+7TSysJvXSHwhMYpPYBHU4r
         dfwnW8klX2i1g88/cz5Ak6LRhjxlePVZKSFxqJ6OWAxI9W/R9JLNQGPOlmjzhLTazt6x
         bxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BgUsDubewWfhB9JEAWF32v0uX7MoEWZRa0C9Yrwfj+M=;
        b=A43s1Z0lux7A/QRzB5lIaY8HMFllqJC9IR1X4n+AtWwrDwGA2MtAuZJ1DnmRFE6iGI
         GoHZwyZi282Gu6Fs88Ivl84DV9WBGq8WqcZ3mMnKqKUEGMoXAov1WYNcM0Lo+lY1mvYy
         ZCxX2N1C6ueoD6icDiu95LSWGmMc7R9fQDXo1RxeB23DFt3L+bvmEF9b+shogPIYtOc4
         qrsiVFQIz2UgyBa7bLhdgiQI7ma3iAdBLpwfqY+ZLFCI8MPGeQW+PtgQqTKuwmUkIA0s
         6t4W35Iryjj2EFqCy2GnJMWKC9FI8EmHrYLFIWivlAHkSSBTlGBc6kAKjQmfAKzP8VAn
         sjrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IN+zC81o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si12724548qtj.61.2020.02.03.09.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 09:47:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IN+zC81o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyfoc-0004Pr-0A
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 12:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iyfoJ-0004Mr-Tq
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 12:47:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iyfoI-0000iW-1S
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 12:46:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50448
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iyfoH-0000dh-Lt
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 12:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580752016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgUsDubewWfhB9JEAWF32v0uX7MoEWZRa0C9Yrwfj+M=;
 b=IN+zC81o/zJvSGB51sPXiqHZCb0lqb1dAWVzxYdceQIEOi4JphQNB6KX8pCxeOwj/6SRRy
 4Ngv6XZkxz8yGcmTZXDsyP83cPsleyh1ubVPBBEKKd7yoBV+yQWKBIX1YzdlWfT27yCyo5
 IGpn5iTsRzMn7tLmrZYc6NJV6f1+W+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-F9XVggoSNdmWljG0Rg-KvQ-1; Mon, 03 Feb 2020 12:46:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CDC01005F7E;
 Mon,  3 Feb 2020 17:46:50 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E380C60BE0;
 Mon,  3 Feb 2020 17:46:38 +0000 (UTC)
Subject: Re: [PATCH v13 03/10] virtio-iommu: Implement attach/detach command
To: Peter Xu <peterx@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-4-eric.auger@redhat.com>
 <20200203134915.GA155875@xz-x1>
 <ce49f691-d944-2e5e-87a3-7e7c9651c2af@redhat.com>
 <20200203151917.GD155875@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5289913a-43fc-aaae-5b82-151922de93bf@redhat.com>
Date: Mon, 3 Feb 2020 18:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200203151917.GD155875@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: F9XVggoSNdmWljG0Rg-KvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JlhZxIrzitS+

Hi Peter,

On 2/3/20 4:19 PM, Peter Xu wrote:
> On Mon, Feb 03, 2020 at 03:59:00PM +0100, Auger Eric wrote:
> 
> [...]
> 
>>>> +static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>>>> +{
>>>> +    QLIST_REMOVE(ep, next);
>>>> +    g_tree_unref(ep->domain->mappings);
>>>
>>> Here domain->mapping is unreferenced for each endpoint, while at [1]
>>> below you only reference the domain->mappings if it's the first
>>> endpoint.  Is that problematic?
>> in [1] I take a ref to the domain->mappings if it is *not* the 1st
>> endpoint. This aims at deleting the mappings gtree when the last EP is
>> detached from the domain.
>>
>> This fixes the issue reported by Jean in:
>> https://patchwork.kernel.org/patch/11258267/#23046313
> 
> Ah OK. :)
> 
> However this is tricky.  How about do explicit g_tree_destroy() in
> virtio_iommu_detach() when it's the last endpoint?  I see that you
> have:
> 
>     /*
>      * when the last EP is detached, simply remove the domain for
>      * the domain list and destroy it. Note its mappings were already
>      * freed by the ref count mechanism. Next operation involving
>      * the same domain id will re-create one domain object.
>      */
>     if (QLIST_EMPTY(&domain->endpoint_list)) {
>         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
>     }
> 
> Then it becomes:
> 
>     if (QLIST_EMPTY(&domain->endpoint_list)) {
>         g_tree_destroy(domain->mappings);
>         g_tree_remove(s->domains, GUINT_TO_POINTER(domain->id));
>     }
> 
> And also remove the trick in attach() so you take the domain ref
> unconditionally.  Would that work?
Yes I think so. On the other hand this ref counting mechanism is also
made for that purpose of destroying objects without being forced to
explicitly call the destroy function.

Thanks

Eric
> 
> Thanks,
> 

