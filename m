Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp548987ejq;
        Wed, 24 Jan 2024 13:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOkd4XdHXusx+URsuJ3IaWNVve7LEGkrtfJhG+mTZjT5lWk74ithJbRpZcgViOEStSYWOi
X-Received: by 2002:a05:6870:b60f:b0:205:9fe9:67de with SMTP id cm15-20020a056870b60f00b002059fe967demr3884652oab.39.1706130292650;
        Wed, 24 Jan 2024 13:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706130292; cv=none;
        d=google.com; s=arc-20160816;
        b=nxhK0XTT+k8hEHgU4f1E3o5je6kYNKsZJjTCldTu3X8vsTziVI2tdbZBderRSXCo5d
         /zWj/lQe1nNaRbREFEzZnJlmxkzl+goQW6d3cPldhBeGosIALrypZbbxtSP+89wS8QsR
         bee2wU3PFBlv3b0LlmgQ4MivLA/ZHJqcRO4Mgp1Exc8A/t93wvP9tB7bExzVwWl/tbdt
         Oc09B9jBG+ahKyiP/Qlsl1+tPYATLM2ULrdgRrwjRaHt1+KiOSNFq1PSbMbjj306SXeE
         SPp29yjYY4aA/xBk0MTGUR8FTCwy6ojxiEFMOdzTWC/M044argyvho6OBs89AXBOGBtR
         05EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pzumg2ibmjGB8BsT1tRBbbHW7FHEV7ESfyDIgA5MVVY=;
        fh=i4aQDvMVklZZRQIk2gIZG1DpYjAHIH74Vpvh0ENxbz8=;
        b=OstcTYNB7B1YgPd9NmED2ib/59R61zdAvcQ9HmR8x9ophNL/pTvLG92FNExEJ8i+GI
         uw9x6RA2+IOKN7cDqsJS47/iPXdCYfBXgkSu/1GHuZo79rkj5Ua+72HL5C73pX1VxmfA
         vujs+XCpDzz+TGb0Wo89vXai5RSBiVfiZtvuuuMeNqUxPqX1NSgL2a/J59fGgLf3jfKf
         QbbSYOLis4iYP+rt4QrlIkRw8Te8YlFqcY/01WXLH+0ek+n/olkhk61J0e5RZX4fQ0Qf
         PHlQmjyfuUWQki4c0BzsjWzQuMxGdgXe1Sxz8X4VIcQMOrNdJ0wbGgWtIDi50BrgNe9w
         zM4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zgbfixna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a05622a11c400b0042a544a1a8csi3747017qtk.87.2024.01.24.13.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 13:04:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zgbfixna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSkQR-0002Xc-OF; Wed, 24 Jan 2024 16:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSkQE-0002Vg-Ig
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 16:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSkQC-0001OL-B1
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 16:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706130267;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzumg2ibmjGB8BsT1tRBbbHW7FHEV7ESfyDIgA5MVVY=;
 b=ZgbfixnaPe3j/2W2DChw5XlNbqktJ7zvnIq29dxCOcA4ku/2LWrYmejsTzKCzkOLI5rEvR
 L61P/s457PUqyMk/N9CnD5p3H7rx7MbMjG86S7O/yu8I/6mqr+4+WyBxT6vZDm7vj0DC0L
 K1L6vmVZQT1rlPGZpUJB5JArBwhHreM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-7WE4dI1RMLKx8iLbTM0H4g-1; Wed, 24 Jan 2024 16:04:24 -0500
X-MC-Unique: 7WE4dI1RMLKx8iLbTM0H4g-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7832a94b051so778957985a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 13:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706130264; x=1706735064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzumg2ibmjGB8BsT1tRBbbHW7FHEV7ESfyDIgA5MVVY=;
 b=rI0aTjg43RBjRQvOuDdGpsmZ3WOCeF75AvOrmndIhx1LqggIscStEYXmzPERQWBecI
 415fYtcWw36eN6hHrwOKf93lI48gVSmJLiQAPGSHfPiT5Vwmz2HaJYi8t413q8srWsIz
 bZC+WgmkxkXU8XOLlwFV0BRp6s02+Hje50clGVNmsFuGeb1Tg84JJG/YeutHBM6qiYC3
 DUEwtdre8tcManEGiGt5OEpiwKVjZ80Wy5Mzxog+JLDHNwQ7wBWKwrQsbA7ije0uDrSq
 mgpJ+LwfO8tHlNrzhdCxv8IGtT3sg2RtWIqLoDLpFnb626aAZn/SQ0MH/yk5U4EK849N
 yzDA==
X-Gm-Message-State: AOJu0YxpWMrrn6+/tvOAOfxjWsIX29AP8Vpu8IxPoOUjHt/WHzpODxwF
 VnyF9T9t7AqyEEqNHN+ON62R7G4Wr5+b10RTsc9eZYwa7C6RnbB+phLVxmY2eM24NfXU5nbk7/g
 8ICklyqEhL9u6A4VU3xIDZgnnlIW7hTCW4VU8ziKPlYNZxhSsTA==
X-Received: by 2002:a37:e301:0:b0:783:4b92:3b3b with SMTP id
 y1-20020a37e301000000b007834b923b3bmr8931012qki.121.1706130263849; 
 Wed, 24 Jan 2024 13:04:23 -0800 (PST)
X-Received: by 2002:a37:e301:0:b0:783:4b92:3b3b with SMTP id
 y1-20020a37e301000000b007834b923b3bmr8930996qki.121.1706130263585; 
 Wed, 24 Jan 2024 13:04:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05620a215d00b00783958079b0sm4015507qkm.123.2024.01.24.13.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 13:04:22 -0800 (PST)
Message-ID: <ef080ff4-1fd5-4639-a316-6e09949608c7@redhat.com>
Date: Wed, 24 Jan 2024 22:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] virtio_iommu: Clear IOMMUPciBus pointer cache when
 system reset
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20240122064015.94630-1-zhenzhong.duan@intel.com>
 <20240122064015.94630-2-zhenzhong.duan@intel.com>
 <c47b95f9-ca42-4f8e-85d1-8fc72404e441@redhat.com>
 <SJ0PR11MB6744E96BE6A6014F7E43899892742@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744E96BE6A6014F7E43899892742@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2otDBPBYEwHt

Hi Zhenzhong,

On 1/23/24 11:03, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Subject: Re: [PATCH 1/3] virtio_iommu: Clear IOMMUPciBus pointer cache
>> when system reset
>>
>> On 1/22/24 07:40, Zhenzhong Duan wrote:
>>> IOMMUPciBus pointer cache is indexed by bus number, bus number
>>> may not always be a fixed value, i.e., guest reboot to different
>>> kernel which set bus number with different algorithm.
this cannot harm to reset it but I don't know if this can be encountered.
>>>
>>> This could lead to endpoint binding to wrong iommu MR in
>>> virtio_iommu_get_endpoint(), then vfio device setup wrong
>>> mapping from other device.
>>>
>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>> ---
>>>   hw/virtio/virtio-iommu.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>> index 8a4bd933c6..bfce3237f3 100644
>>> --- a/hw/virtio/virtio-iommu.c
>>> +++ b/hw/virtio/virtio-iommu.c
>>> @@ -1264,6 +1264,8 @@ static void virtio_iommu_system_reset(void
>> *opaque)
>>>       trace_virtio_iommu_system_reset();
>>>
>>> +    memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s-
>>> iommu_pcibus_by_bus_num));
>>> +
>>>       /*
>>>        * config.bypass is sticky across device reset, but should be restored on
>>>        * system reset
>> you could remove the memset in virtio_iommu_device_realize() then ?
> Good suggestion, will do.
By the way what about the vtd implementation. s->vtd_address_spaces is
hash table but I don't see it reset either?
Also if is requested here we would need it on smmuv3 as well.

Thanks

Eric
>
> Thanks
> Zhenzhong

