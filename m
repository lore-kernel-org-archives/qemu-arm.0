Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1113265lfo;
        Fri, 29 Jan 2021 05:12:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypcJze8/9B5EPDBpfxZSQEQwXXI3ypJRRS2Gg4E7b3I7kFnQj+vDUh3fmVJlA5vvdqZP8F
X-Received: by 2002:a25:aaa2:: with SMTP id t31mr6449228ybi.280.1611925920481;
        Fri, 29 Jan 2021 05:12:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611925920; cv=none;
        d=google.com; s=arc-20160816;
        b=0iT2sUfC8MQMFIclSVUSEaySeo3SIVtriAyViRoMQQxTfmJCHcOnVaxe8aS6oNiCAH
         FMcOv5hz/cI6gIsk44Odz8cTnU0uUl2w2XKNVRzFKLTkqNQoU70Z1NOuvqRpU+mOFWDq
         SQtwhrjamh47YkTgUTuwV+Ge+0/ZMl8ApxSjSWLEYZwBAR/4KZCcgMvGA0+fvZLnEYqe
         ShKrPwHFGEMVL6pkTY7eKaJ+wETpXH0NTc70XXiQ4OJcY1+WpwhA7fxstBZgNNxwhDic
         gy7Rl6TP9WrbuEV6gPFRzO7c4s2XrfCXxo+0YP/YrAQfU/D/8bX0BL/EnQlq9bKQERem
         BbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a0n2iAz7qZVW82Meqto8Hz6DydlTWNUsMON8L3R8h70=;
        b=eZlEmph6RyBnmvEcHB0xnpvZBw4jE80uFF3URO2wPd55imyWiIoesnqPEZLiX+Uqi4
         1cN++MODfykjp2QCCIXDO7XvNR2L8k9xzB0Z3rilYqtbUyahD77MeUPTG0ZZ+cCj6aah
         y2gVRw8RWM2arEuaMfyzoaNhe1tFptZOWH34GvMpOgwRaSaKk09zfqec8+9FhhHVeUEd
         l9ttgbDOZE3jcyxa1HlAk7LVjQ4D/EYoLdZmPOJ4pCTLJCE1CAGRZh5XGaUK4pvnhhmi
         OctQAS6HR5CaSTlsoa4uJodCB2JhI73NWUJiyRqILS7yjZQkjEBKltG7emBkvOYxurjL
         Btpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TdDG40/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si8648316ybc.14.2021.01.29.05.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:12:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TdDG40/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TZ9-0000a2-TR
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l5TYU-0000YP-2O
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 08:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l5TYN-00030y-Mb
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 08:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611925867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0n2iAz7qZVW82Meqto8Hz6DydlTWNUsMON8L3R8h70=;
 b=TdDG40/Dg9zk4k4FMOIQIlX1NuOo1MDAjwAEQ1ezAnx/kkVGq4aXAxmjXb8hzTgJzCQZkM
 eoMMS1usMjp9YDdo0WMSi1bfT7rKtZqmdWRQpmABLTlrmLohqHldu9UF8OOxa0UGx2rDwY
 9LKxQdrcMb00yqI3SjXG5OBaUxlUYW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-tHs3kU-RPhKpf3hiodCbUw-1; Fri, 29 Jan 2021 08:11:03 -0500
X-MC-Unique: tHs3kU-RPhKpf3hiodCbUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4332C107ACE3;
 Fri, 29 Jan 2021 13:11:02 +0000 (UTC)
Received: from [10.36.114.62] (ovpn-114-62.ams2.redhat.com [10.36.114.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25DBD620D7;
 Fri, 29 Jan 2021 13:10:59 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20201225095015.609-1-yuzenghui@huawei.com>
 <4e114709-e5c2-1860-c760-c05aa3ed5388@redhat.com>
 <45f3334d-f0b4-9a40-1bd1-78bd04735eaf@redhat.com>
 <aca67ce0-5e26-a0cf-1c31-4b08694afda4@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f262e0fb-7544-eac2-4b2d-5eeb9761e447@redhat.com>
Date: Fri, 29 Jan 2021 14:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aca67ce0-5e26-a0cf-1c31-4b08694afda4@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUKTr5v256nG

Hi Zenghui,

On 1/29/21 1:15 PM, Zenghui Yu wrote:
> Hi Eric,
> 
> On 2021/1/29 5:30, Auger Eric wrote:
>> Hi Zenghui,
>>
>> On 1/28/21 9:25 AM, Auger Eric wrote:
>>> Hi Zenghui,
>>>
>>> On 12/25/20 10:50 AM, Zenghui Yu wrote:
>>>> When performing range-based IOTLB invalidation, we should decode the TG
>>>> field into the corresponding translation granule size so that we can
>>>> pass
>>>> the correct invalidation range to backend. Set @granule to (tg * 2 +
>>>> 10) to
>>>> properly emulate the architecture.
>>>>
>>>> Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range
>>>> invalidation")
>>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>>
>>> Good catch! I tested with older guest kernels though. I wonder how I did
>>> not face the bug?
>> Please ignore this wrong comment as this corresponds to recent kernels
>> instead. Still puzzled anyway ;-)
> 
> I noticed this when looking through your nested SMMU series and I didn't
> have much clue about the impact on the real setups.
> 
> I guess we may receive some unexpected fault events with this bug. But I
> think we may miss it for some reasons:
> 
>  - the stale TLB entries happen to be evicted due to heavy traffic
>  - some form of over-invalidation is performed by your implementation
>  - ...
Yep I will further trace things. Anyway thank you for spotting it.
> 
>>>> ---
>>>>   hw/arm/smmuv3.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>> index bbca0e9f20..65231c7d52 100644
>>>> --- a/hw/arm/smmuv3.c
>>>> +++ b/hw/arm/smmuv3.c
>>>> @@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion
>>>> *mr,
>>>>   {
>>>>       SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>>>>       IOMMUTLBEvent event;
>>>> -    uint8_t granule = tg;
>>>> +    uint8_t granule;
>>>>         if (!tg) {
>>>>           SMMUEventInfo event = {.inval_ste_allowed = true};
>>>> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion
>>>> *mr,
>>>>               return;
>>>>           }
>>>>           granule = tt->granule_sz;
>>>> +    } else {
>>>> +        guanule = tg * 2 + 10;
>>> maybe just init granule to this value above while fixing the typo.
> 
> My intention is to initialize @granule to this value explicitly for the
> range-based invalidation case. But I'm okay with either way.
same for me ;-)

Eric
> 
> 
> Thanks,
> Zenghui
> 

