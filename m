Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3568606ejy;
        Wed, 5 Jul 2023 06:17:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxzr3R//f7gSlD1zG35sLJfUxOfjD63mEqI88hVqZL/zzqfrm1841IHaIXSQsNC6FOJwBO
X-Received: by 2002:a05:6214:2466:b0:62d:ddeb:3770 with SMTP id im6-20020a056214246600b0062dddeb3770mr3173837qvb.0.1688563045083;
        Wed, 05 Jul 2023 06:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688563045; cv=none;
        d=google.com; s=arc-20160816;
        b=xCLoSd5WgQMvQLSiXJZcZDGb16vAk2s2S5W+Vc0OTxiB1N0ra9YS2uTp4Tr7EFaKxw
         PtT2fVZjyk9ymsGi2KgGzkEXthiBGxwbjQOQkM9R8Tt9K8Y6BU3ryGfbL3Y8svNqKJwl
         NWkPGbHkbQabWqrOi+oFrETZyyvahPOD48JP4MZkzZDq8+RFWV8O4vqUzfuB6zZK36CY
         W6fElH5lWgEAlI3ehlAWN+CW8s5BH8HLbABcWlOFQ6Mirwc0rOH650+bOdWfLalFsKOG
         lxDpUSGA4rOMLbfVEp+clzw5hJwbDEOwq5EItU7W3ElTbdFjgeGrsnA+M7gOiT9wX+xr
         9UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wM6uFg0PqIr8KvpTsPDWWdjmhNlZx6ZMkBmHSWrrBEA=;
        fh=sR1AIFvSn14E8TxWAck+T46o8zDXWYYner/U6As2epk=;
        b=vCYzVk2/5wV7S4wwmDEQEk/w7y8v6MqtoUEEpuuCPZ+gQWl6DocMBzxADxxP//O9kx
         Ql6iEjt6iJ8khn7lPlvGuM98M8krzUdkjlnvk2jzQXOlOfLy6Qelwgf4rc4Ab6MQDu8H
         sXmgz8HUOMPUoaVQbc2fWGBJufqBr3jgUYphiml0vIoUaAii9ibU6ODITfTJoYhSYYLe
         egDxrKEzUiilRuDAoRD4xauK5rnaRGAQWWIywHyk0HvmBvW1o6weLXtCz9mASbadYRaC
         7UqhezCljruoUqeLGCLEOFI2CuORUtYMt/qduzOvhczJGhZdl1lD/p1qB5kIcqXYadyq
         pv4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IPUxsOlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr5-20020a05621423c500b006287e983640si14362616qvb.16.2023.07.05.06.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IPUxsOlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2ND-0006Z2-Pa; Wed, 05 Jul 2023 09:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qH2N8-0006YL-Ng
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qH2N6-0006W9-JX
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688562998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wM6uFg0PqIr8KvpTsPDWWdjmhNlZx6ZMkBmHSWrrBEA=;
 b=IPUxsOlM2Tx9jmbAh62uiV3OkZ/HZiOH+USZGPAXMCMF2QDGNlfb7gLcJxfQ9/mlYl8oph
 x/inkzr/bNaa4cz2+981foGHe2gxMy12dSfOh5Y51THwJP/YMpdjUH3f/X+NcWvPqbykZ0
 lcrKU2wEGhgFi1BJ2BybxsEPbRKnF3g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-OpAxt2veMrivMz_F7AqIhQ-1; Wed, 05 Jul 2023 09:16:37 -0400
X-MC-Unique: OpAxt2veMrivMz_F7AqIhQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3f9e556c7d8so4520651cf.0
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688562997; x=1691154997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wM6uFg0PqIr8KvpTsPDWWdjmhNlZx6ZMkBmHSWrrBEA=;
 b=YK5YUHhtS+o1yRrlXXilFQ58Nxzy06ViL3tjfOYuHo5ferot9xdfMyY+a/rxGOl5x+
 en0ygJrYzk5VXigTJoEC/KGlDo71iUeS4k12Ax6/qhJSftPvsGFxDxICUKw5SYkTtf5N
 eo+AI4CUvIjUiys+sEQs4y2BOgSpVdQ233gqHdhXFN3NlYdYxsz8wq8lMZqtc9UJVdi1
 8eX74vr1ruCP2I5zbZKcGqsru1i94/NNUqUFqYBTQfzecGnnVGRJ4nkyL0hhb4wgQ0o4
 NFQVg9bcLJ8zxLownOgdss/EBadsBVgjgSdga3A0PNae6nIoigxrGCw95/ies0AtOhzR
 AFOA==
X-Gm-Message-State: ABy/qLYPyfjimoprKBSV+8OAUAqBlYdjFXhVEb92JMfXUHS6DSKs1eBz
 XqmggmNISdsJbwxsnyi9Y9OM9qgyy4sbIlX7HwCVCLjtkCma9QUht9WWGkvTFLzTzwDg/3BeTt1
 e2D8C7mUf8gRp
X-Received: by 2002:ac8:594e:0:b0:3ff:2cce:c625 with SMTP id
 14-20020ac8594e000000b003ff2ccec625mr2177086qtz.19.1688562996866; 
 Wed, 05 Jul 2023 06:16:36 -0700 (PDT)
X-Received: by 2002:ac8:594e:0:b0:3ff:2cce:c625 with SMTP id
 14-20020ac8594e000000b003ff2ccec625mr2177064qtz.19.1688562996484; 
 Wed, 05 Jul 2023 06:16:36 -0700 (PDT)
Received: from [192.168.1.91] (176-152-201-187.abo.bbox.fr. [176.152.201.187])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a05622a03cd00b0040091d8e63fsm8686366qtx.73.2023.07.05.06.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 06:16:35 -0700 (PDT)
Message-ID: <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
Date: Wed, 5 Jul 2023 15:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] virtio-iommu: Rework the trace in
 virtio_iommu_set_page_size_mask()
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhap.com" <clg@redhap.com>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <20230704111527.3424992-1-eric.auger@redhat.com>
 <20230704111527.3424992-3-eric.auger@redhat.com>
 <SJ0PR11MB6744FA4E41101F7EED607E9C922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744AEDC41BE576A59908A30922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744AEDC41BE576A59908A30922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: /Qn8If9LdS8V

Hi Zhenghong,

On 7/5/23 10:17, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Duan, Zhenzhong
>> Sent: Wednesday, July 5, 2023 12:56 PM
>> Subject: RE: [PATCH 2/2] virtio-iommu: Rework the trace in
>> virtio_iommu_set_page_size_mask()
>>
>>
>>
>>> -----Original Message-----
>>> From: Eric Auger <eric.auger@redhat.com>
>>> Sent: Tuesday, July 4, 2023 7:15 PM
>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>>> devel@nongnu.org; qemu-arm@nongnu.org; mst@redhat.com; jean-
>>> philippe@linaro.org; Duan, Zhenzhong <zhenzhong.duan@intel.com>
>>> Cc: alex.williamson@redhat.com; clg@redhap.com;
>> bharat.bhushan@nxp.com;
>>> peter.maydell@linaro.org
>>> Subject: [PATCH 2/2] virtio-iommu: Rework the trace in
>>> virtio_iommu_set_page_size_mask()
>>>
>>> The current error messages in virtio_iommu_set_page_size_mask() sound
>>> quite similar for different situations and miss the IOMMU memory region
>>> that causes the issue.
>>>
>>> Clarify them and rework the comment.
>>>
>>> Also remove the trace when the new page_size_mask is not applied as the
>>> current frozen granule is kept. This message is rather confusing for
>>> the end user and anyway the current granule would have been used by the
>>> driver
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>> hw/virtio/virtio-iommu.c | 19 +++++++------------
>>> 1 file changed, 7 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
>>> 1eaf81bab5..0d9f7196fe 100644
>>> --- a/hw/virtio/virtio-iommu.c
>>> +++ b/hw/virtio/virtio-iommu.c
>>> @@ -1101,29 +1101,24 @@ static int
>>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>>                                           new_mask);
>>>
>>>     if ((cur_mask & new_mask) == 0) {
>>> -        error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
>>> -                   " is incompatible with mask 0x%"PRIx64, cur_mask, new_mask);
>>> +        error_setg(errp, "virtio-iommu %s reports a page size mask 0x%"PRIx64
>>> +                   " incompatible with currently supported mask 0x%"PRIx64,
>>> +                   mr->parent_obj.name, new_mask, cur_mask);
>>>         return -1;
>>>     }
>>>
>>>     /*
>>>      * Once the granule is frozen we can't change the mask anymore. If by
>>>      * chance the hotplugged device supports the same granule, we can still
>>> -     * accept it. Having a different masks is possible but the guest will use
>>> -     * sub-optimal block sizes, so warn about it.
>>> +     * accept it.
>>>      */
>>>     if (s->granule_frozen) {
>>> -        int new_granule = ctz64(new_mask);
>>>         int cur_granule = ctz64(cur_mask);
>>>
>>> -        if (new_granule != cur_granule) {
>>> -            error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
>>> -                       " is incompatible with mask 0x%"PRIx64, cur_mask,
>>> -                       new_mask);
>>> +        if (!(BIT(cur_granule) & new_mask)) {
> Sorry, I read this piece code again and got a question, if new_mask has finer
> granularity than cur_granule, should we allow it to pass even though
> BIT(cur_granule) is not set?
I think this should work but this is not straightforward to test.
virtio-iommu would use the current granule for map/unmap. In map/unmap
notifiers, this is split into pow2 ranges and cascaded to VFIO through
vfio_dma_map/unmap. The iova and size are aligned with the smaller
supported granule.

Jean, do you share this understanding or do I miss something.

Nevertheless the current code would have rejected that case and nobody
complained at that point ;-)

thanks

Eric

>
> Thanks
> Zhenzhong
>
>> Good catch.
>>
>> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>
>> Thanks
>> Zhenzhong
>>
>>> +            error_setg(errp, "virtio-iommu %s does not support frozen
>>> + granule
>>> 0x%"PRIx64,
>>> +                       mr->parent_obj.name, BIT(cur_granule));
>>>             return -1;
>>> -        } else if (new_mask != cur_mask) {
>>> -            warn_report("virtio-iommu page mask 0x%"PRIx64
>>> -                        " does not match 0x%"PRIx64, cur_mask, new_mask);
>>>         }
>>>         return 0;
>>>     }
>>> --
>>> 2.38.1

