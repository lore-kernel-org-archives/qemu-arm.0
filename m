Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp83463lfb;
        Thu, 2 Sep 2021 02:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlC5CkmCJcX3R/x5GGCjJj9aZwTkPV5dee+PmyPKQQjW8FKAramJHYTH7aVDfm8EXpBmV0
X-Received: by 2002:a92:c04e:: with SMTP id o14mr1576238ilf.289.1630575493786;
        Thu, 02 Sep 2021 02:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630575493; cv=none;
        d=google.com; s=arc-20160816;
        b=jULinU0fxEI55XvbtKHvavMxqGQVqXymg+gBXhtzuCkKLhWKzLuUo/wuC+xTXgWmjC
         x7TkFm4N1mG38ATfNiF/aEZQXFSE+uXDy1pYjeaG+aFhE4LXsC0uXwqIwir1e24LVwLB
         DPsI8kYvvA9UAcKQdSIRqv/8HJe2BEe1+9uEFhlZYllQt97PWfnbYHrok/FIlCIYp0BK
         m00V4J38LaGiKl21oWSjL65F6bxHDXMv8dd7qx3m6q93l6nYyrA0TicTZZYbaFgdpjAr
         GHpbR1qxsdUyMMjH43yJqsnyDeuyKWbmia9+gJAQtHzydx0+JJBKeo7bi9syhwk+dj2m
         +SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h5E4aoy6GDYyHU2HoBN+ICe1KrCcbGlyC3yCmM84624=;
        b=rXgN8wPOnQlHUTOGAMBJuOOK9I/K6wsisvI9Mxe1c44kiy9XhefK7W1PW+/+qeqUc1
         Ans789lkBXZE8PD50GEVnuW8qnU4TjCWl2db7u/ioyq77kP/mCvCp6dUECu9llNG7cTc
         iYfSsdlzRztVLfXD3bi6vVKwDjvp9nTkNl/sopjJITitXV/ve3NcXwOahrndXAw90IIX
         XSNvQaSju6V0UaiUdbPFCUKJUwyNeI+0dugvFqa4pH/N1tyOqqDoU/gD4aMMVcPvnJMy
         x6X1yO8tpprXvhV/GaJnykKpPLckN+VXEGdPhuxQwHpr0igprktsj6GB4qUWW64qwxjU
         qy4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eNsFdB1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si1685606ilu.26.2021.09.02.02.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 02:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eNsFdB1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLjAj-000599-4K
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 05:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLj9F-0002bS-MT
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 05:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLj9E-0005Ca-3v
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 05:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575399;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5E4aoy6GDYyHU2HoBN+ICe1KrCcbGlyC3yCmM84624=;
 b=eNsFdB1KU2n4i/1OT7cYKu3JiqxniWaT7m6SGcgrBR4ZAcYAYnlmVE7vM/Hwtqmjh9yjh1
 pD0NiDAH0+dBRCz0Gf5fIroISMMe/Uq3sqhCi4Biu/Fogb2A7Q+se4O9IT6adVWlXSuu9E
 8Jkp56d0zGYh1K93AxaZQAwAKxqJWLM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-qLzB20J5Or-HOkmlFpRlaw-1; Thu, 02 Sep 2021 05:36:38 -0400
X-MC-Unique: qLzB20J5Or-HOkmlFpRlaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso343891wrw.5
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 02:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=h5E4aoy6GDYyHU2HoBN+ICe1KrCcbGlyC3yCmM84624=;
 b=X239C2lOypNcHw6CNlGRhHzdHNQiUKcWiDL5Jk1Bw000moS5F1WoeXIuQBXMTV8d85
 A/20dkodxnExpnQe7cZOHenrVnmmJT24G9Qt6PZZHfrsfMDXd7cCGHM91xhoiSKnaQcv
 qK5I9TQS/otXPTz4QWjBPng1sWjpuRUEReQPgXklshde1RZ5+XzJsNTt2oXpk1MtcAqo
 Q8Zn9/GlXRI6r0bsKmpagE3gZyQg58jjNCOoZajdvh/RSRNqh5XsDJvGbFK9b/cMgjUP
 UiBL9XrR8kuhXSNwD9dUOmPwLg7uwihVEIBS5/ITSpe8iyRtuD8Rg9oIF5KeLMsAlAYZ
 Dxbw==
X-Gm-Message-State: AOAM532kpDNCzcmWlGC3UtRB66DXYAXKexCA4iif/HH9WoZJyszAG/96
 Bz2SEdn+t8Kz72XsLH04mt5u4So6P9Gf/efdqyCTovdetAxwuDndL/IdgoR4GeCUjC1ZJ6omgKR
 ZXyDqSHI4mN/FltUbw/Aqvp/jjWk1qDsUrH/j87rYZqAn7zLVfH47wrpNi+dmABM9L30=
X-Received: by 2002:a5d:6352:: with SMTP id b18mr2528904wrw.116.1630575396728; 
 Thu, 02 Sep 2021 02:36:36 -0700 (PDT)
X-Received: by 2002:a5d:6352:: with SMTP id b18mr2528865wrw.116.1630575396305; 
 Thu, 02 Sep 2021 02:36:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x21sm1132426wmi.15.2021.09.02.02.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:36:35 -0700 (PDT)
Subject: Re: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-7-jean-philippe@linaro.org>
 <41720de5-ce29-dd79-2911-d974408af544@redhat.com> <YSjoCW5z1xbYL4Gp@larix>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a6d02a90-4991-4577-909b-3cc38c49f71e@redhat.com>
Date: Thu, 2 Sep 2021 11:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YSjoCW5z1xbYL4Gp@larix>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O0vjCWDN8DPm

Hi Jean,

On 8/27/21 3:26 PM, Jean-Philippe Brucker wrote:
> On Tue, Aug 17, 2021 at 04:11:49PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> Add a hotplug handler for virtio-iommu on x86 and set the necessary
>>> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
>>> region is reserved for MSIs. DMA transactions to this range either
>>> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
>>>
>>> Although virtio-iommu does not support IRQ remapping it must be informed
>>> of the reserved region so that it can forward DMA transactions targeting
>>> this region.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> I think we need to handle the case where the end-user gets lost with
>> iommu options and use an invalid combination such as
>>
>> -M q35,iommu=on,int_remap=on,kernel_irqchip=off -device -device virtio-iommu-pci
> I guess that would be
> "-M q35,kernel_irqchip=off -device intel-iommu,intremap=on -device virtio-iommu-pci"
>
> I'll add the checks, similar to the one in x86_iommu_set_default().
yes that what I meant sorry.
>
>> We may also document somewhere that the virtio-iommu-pci
>> does not support irq remapping as this may be an important limitation on x86.
> I'll mention it in the commit message, unless you had another place in
> mind?

you may add an entry in qemu-options.hx too as Peter did for the intel
iommu in
7395b3e3e7  docs: Add '-device intel-iommu' entry (7 weeks ago) <Peter Xu>

Thanks

Eric
>
> Thanks,
> Jean
>

