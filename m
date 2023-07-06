Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4376300ejy;
        Thu, 6 Jul 2023 08:39:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHIyky9EImj16GZiJOsrGC3t5HKjBR43zsPZn0VYl00OR2XYdu5skaivZt6noeubTXvSGj6
X-Received: by 2002:a05:620a:1909:b0:762:55ed:8642 with SMTP id bj9-20020a05620a190900b0076255ed8642mr6493197qkb.8.1688657959289;
        Thu, 06 Jul 2023 08:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688657959; cv=none;
        d=google.com; s=arc-20160816;
        b=bJa+4hu/1pFtq3cJUx2k9llYxocDQ4XsSKjyyw1ccQa7wXpQwhtPbKyMu8Wi3+4N0Q
         MexICCvCt7ccF8wY5EdEC24Dorasx83G3bEmTOdnO2uAuGkNgQN6y78/wf3vLavp1vAj
         mCL0CA9l5g5pn0RuKKcWAr01wYMHT0LBEdPLfBwo8MkvWRM3WP0/4/m1vyvfXYLXxktP
         jJeryRXRrOHjExodfcKJcWuLYi0Qxw2IZo37jFz54rNyH3RftDjlxzwm/FMsS+PdjQ38
         9ZD6JI66d8Igj0hTtUsZvBOW3cx1bjjM2+1KN0ditJWIrJKce0Y4AyAg7gevK/oXynK9
         UATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1LVAbjj20xP42/XWeUvet5VKi4hkjuNxxHjORxGXaKE=;
        fh=lqDy9VLSGHSawwiEyoal9R8o/IgEd3UX9rtX2ckrtTk=;
        b=MBQOaupCE0CpJpxFDueyG8xaTnt3Yigd+sVEaSmufRc63bKm+ZGGJQoP3H4S9Xs6RB
         Rn6lXbjUUiE74aFy5lekO+AWWk04wI3djVEhcLgBPntKqDBQYmpVq0fMO7JVl0RaQp/h
         xyrGRTcbRj5yy22zgWr1UaVKxbs1KySB5tjGihEc6uLonDtJYQe2KNPjIbAZCdRum/jM
         AFsULpn60WXvyikCTn9xMkZmIebXjgGwrCg3sn2FczBP6pj6/TR2bMYXjxOoJvFmGLzG
         R5XudtpDAIIm2Av7BjsnfUjRbmhoZzNRJtE+LYRqFLxxoJdki18dRT9QO3967+FWT57F
         wPbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMV8H7ka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac87f09000000b0040302981715si1035597qtk.722.2023.07.06.08.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 08:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMV8H7ka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHR4S-0006Uq-CJ; Thu, 06 Jul 2023 11:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qHR4Q-0006UK-6m
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 11:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qHR4N-0000uG-IR
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 11:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688657938;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LVAbjj20xP42/XWeUvet5VKi4hkjuNxxHjORxGXaKE=;
 b=SMV8H7kae1m3WXNOxICNif/qZTn/Naqd69kjziCCdUKBjv/w3BGnh6BNiTYCV1D48fwhgi
 KshId8S04HEDxiHRSnNpYtQdv0n7kfHoyOXEXUpTqQduZqpKhaVrXxWFf1HE+63ZgTpy/N
 40+gDVgpkjC1ulxQxEm39ph51/9Gj1s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-KsNIkXr5NRmhvzXw1mKKaA-1; Thu, 06 Jul 2023 11:38:56 -0400
X-MC-Unique: KsNIkXr5NRmhvzXw1mKKaA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3f9e556c7d8so14442331cf.0
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 08:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688657936; x=1691249936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LVAbjj20xP42/XWeUvet5VKi4hkjuNxxHjORxGXaKE=;
 b=AgA4YwzzeMLqXDUAxtZwigT0kO19NWcADddbdfJrgzRBhuOBHPjy27MiR2SRFWnuDJ
 rtz40SuxctQ9mNBuptDIwLLqIGLAB+hZLxpxAmgVY3jmDe7TWxNBPI0JxrZ9Az64S5QT
 gWvLBKgoG1svKNoSnNAUfw3R8pVQpipwTLZafdTOUmL+rNlXqQxbx8pacmNb6UxC9E68
 j5aMOTKO+Hq3s1gEIYjfeRBiohBh1yoOg1/Bpb7kSbEft8FkSL9UcXQSI0wRLLilnU/d
 rnHhAr4pshHjebkQa5UtZBN1I+p/5WXsL5lcrTDE/zgWun8cejmQC5TI2D5FOYn0s3+I
 wrGg==
X-Gm-Message-State: ABy/qLb4gELl5s5i5Lo4qh4KaE6LvMKciLi8FTtHRc+5qjHgTit4vgHv
 sZ3Y6UjM6z1aAXCaE7n2+CNbGjzsa7EOUQ78hoNhqf8DkB/BEjo4MHpPfqRHP0VpFHJSLLEtdjO
 BWgGDNNsKmCqR
X-Received: by 2002:a0c:9c4c:0:b0:635:eef0:4894 with SMTP id
 w12-20020a0c9c4c000000b00635eef04894mr3193580qve.23.1688657936294; 
 Thu, 06 Jul 2023 08:38:56 -0700 (PDT)
X-Received: by 2002:a0c:9c4c:0:b0:635:eef0:4894 with SMTP id
 w12-20020a0c9c4c000000b00635eef04894mr3193563qve.23.1688657936034; 
 Thu, 06 Jul 2023 08:38:56 -0700 (PDT)
Received: from [192.168.1.91] (176-152-201-187.abo.bbox.fr. [176.152.201.187])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a0ce20e000000b0063004b5482csm990626qvl.92.2023.07.06.08.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:38:55 -0700 (PDT)
Message-ID: <989cad20-baf9-ae7a-24c6-f69a8b082dfc@redhat.com>
Date: Thu, 6 Jul 2023 17:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] virtio-iommu: Rework the trace in
 virtio_iommu_set_page_size_mask()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhap.com" <clg@redhap.com>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <20230704111527.3424992-1-eric.auger@redhat.com>
 <20230704111527.3424992-3-eric.auger@redhat.com>
 <SJ0PR11MB6744FA4E41101F7EED607E9C922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744AEDC41BE576A59908A30922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
 <20230706143535.GA2570588@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230706143535.GA2570588@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qemgjM9ha+pO

Hi Jean,

On 7/6/23 16:35, Jean-Philippe Brucker wrote:
> On Wed, Jul 05, 2023 at 03:16:31PM +0200, Eric Auger wrote:
>>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
>>>>> 1eaf81bab5..0d9f7196fe 100644
>>>>> --- a/hw/virtio/virtio-iommu.c
>>>>> +++ b/hw/virtio/virtio-iommu.c
>>>>> @@ -1101,29 +1101,24 @@ static int
>>>>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>>>>                                           new_mask);
>>>>>
>>>>>     if ((cur_mask & new_mask) == 0) {
>>>>> -        error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
>>>>> -                   " is incompatible with mask 0x%"PRIx64, cur_mask, new_mask);
>>>>> +        error_setg(errp, "virtio-iommu %s reports a page size mask 0x%"PRIx64
>>>>> +                   " incompatible with currently supported mask 0x%"PRIx64,
>>>>> +                   mr->parent_obj.name, new_mask, cur_mask);
>>>>>         return -1;
>>>>>     }
>>>>>
>>>>>     /*
>>>>>      * Once the granule is frozen we can't change the mask anymore. If by
>>>>>      * chance the hotplugged device supports the same granule, we can still
>>>>> -     * accept it. Having a different masks is possible but the guest will use
>>>>> -     * sub-optimal block sizes, so warn about it.
>>>>> +     * accept it.
>>>>>      */
>>>>>     if (s->granule_frozen) {
>>>>> -        int new_granule = ctz64(new_mask);
>>>>>         int cur_granule = ctz64(cur_mask);
>>>>>
>>>>> -        if (new_granule != cur_granule) {
>>>>> -            error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
>>>>> -                       " is incompatible with mask 0x%"PRIx64, cur_mask,
>>>>> -                       new_mask);
>>>>> +        if (!(BIT(cur_granule) & new_mask)) {
>>> Sorry, I read this piece code again and got a question, if new_mask has finer
>>> granularity than cur_granule, should we allow it to pass even though
>>> BIT(cur_granule) is not set?
>> I think this should work but this is not straightforward to test.
>> virtio-iommu would use the current granule for map/unmap. In map/unmap
>> notifiers, this is split into pow2 ranges and cascaded to VFIO through
>> vfio_dma_map/unmap. The iova and size are aligned with the smaller
>> supported granule.
>>
>> Jean, do you share this understanding or do I miss something.
> Yes, I also think that would work. The guest would only issue mappings
> with the larger granularity, which can be applied by VFIO with a finer
> granule. However I doubt we're going to encounter this case, because
> seeing a cur_granule larger than 4k here means that a VFIO device has
> already been assigned with a large granule like 64k, and we're trying to
> add a new device with 4k. This indicates two HW IOMMUs supporting
> different granules in the same system, which seems unlikely.

agreed
>
> Hopefully by the time we actually need this (if ever) we will support
> per-endpoint probe properties, which allow informing the guest about
> different hardware properties instead of relying on one global property in
> the virtio config.
yes looking forward to reviewing that.

Thanks

Eric
>
> Thanks,
> Jean
>

