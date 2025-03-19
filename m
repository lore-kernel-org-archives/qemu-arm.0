Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp431706njc;
        Wed, 19 Mar 2025 11:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/Vpn6xFBAGTc5f4Mk36v3lXDozeTTpUn2ba/TggFxpDyp4TbftC00lNZxOvrq4y409XDaIAWZOYAWKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1uOXfGwBkjidOPPS431fB7XJt314Lh6SJwjJpsULzqDoq5mCr8LAgS5Pg3gczDyAoKy9B
X-Received: by 2002:a05:6214:411b:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6eb293c1305mr57254216d6.25.1742407809892;
        Wed, 19 Mar 2025 11:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742407809; cv=none;
        d=google.com; s=arc-20240605;
        b=ASsg+GpPVIDWjJNLvHlXLG6pHcrVFagXWscYLgFDeTPGw4cW+r1Rhe913r1bPnKii1
         SdBxDoOpln/SXpgtYnHTyL+T3Km4RFHialELykamNIO2FIAACGwEObCqfbOV76ciE7fL
         2TeY0k340YYMOhPhNc9ZOeUFPlOcGr1Jis4NPyT8plMJBGHN5lOGlIJSUlaioEmFoGzy
         ZgEdgWZmGg6l9zSEhUory9daVmrwDqvsjGJ/IAIRupweWXQd9Yv/UIIZjhlKMHy++RI3
         Qt0gi/6N7XF9ujez+U9MfMkYdP1BoPGsBju/Rw+IUEd1hkBwnJeqt0iHYpqZe+OPodyw
         Kbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6hAllg4QpmIzJrn9u+m+lN6INt3fA4J1LErAC6oV2wY=;
        fh=5wapGb+ajkhjV6OWOgHpAwHXlwgWuLBK0bIYjH97jAA=;
        b=SL8L9rW4Wxss1WHJrgSfRIgxA/5QlNB/5/rjYL/WgN3HmACQABxDxP9KpJft2Dj6yw
         WBgRRjnjdyPpQdJaHq5gXI9ev//r0t78IIFB+08fFigQHNO/2n1ILO1ElGxsCf0p6yMh
         /cqnlUmtmqXsglH90I5J4InDc/rsn778C8PTpStNvFa1t1q3pfHGlqT7ofKWJEQTVq/G
         PG9qb/OluBa8DMobAtEZ4lv1H0plGqctufcGv71ew+FOQdJ+m7Uz7K3Qp/mMgqXmkVXA
         ezJ8zk8tEidK3t89SP7l9pwj8mo3TCXgwdNtlDPFC23UASE/utf4ExXm3VEuDU0yshug
         /0qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hz4qrSSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1ddaa6si142454196d6.60.2025.03.19.11.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 11:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hz4qrSSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuxrY-00055S-AW; Wed, 19 Mar 2025 14:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxrM-00053t-K6
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxrJ-0001XL-8y
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742407778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hAllg4QpmIzJrn9u+m+lN6INt3fA4J1LErAC6oV2wY=;
 b=hz4qrSSLjzKMeE7p7jTXGukyw61I6ihb3GZJJZU7J64IluhKjVS2nAbLc81puAcv5RSC4z
 X2ZKDTL5+eSjahmnotmjdzqIn3dReu6NZt4OlZYU03XoQtcjzzDPxq9gs6YFdpR1rfgGEd
 OCYh/npKiOpGxLH3enmOWips06jqjmE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-CSmo_TqHPeCxnLy5waRx1Q-1; Wed, 19 Mar 2025 14:09:37 -0400
X-MC-Unique: CSmo_TqHPeCxnLy5waRx1Q-1
X-Mimecast-MFC-AGG-ID: CSmo_TqHPeCxnLy5waRx1Q_1742407776
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39130f02631so3401335f8f.2
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 11:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742407776; x=1743012576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hAllg4QpmIzJrn9u+m+lN6INt3fA4J1LErAC6oV2wY=;
 b=NJQ5cgRxb4Ez/aQt5wDJ56T7/202Fy90zSkCGd5v+rd+6UDiYdWp69ewo8Uo8Pgo9/
 4BxbMZJ7jisQ17+oR86R5lbljMtgd5MeuhcGxBInM0sQTFMFU9L+KM7uKsy3iP4I08yR
 +fKwCWTc0CzuwnROgXUZhH6cXl2RM9wS/ncDatDC5ju1FUz+UPspg7iNaGtMu+3do9it
 p8DLYXhoebgCQcvsuh5BiTQw/+lE5B9Sh2Ad27tM2OWYO8X5AM+LHjmBsqZuYaEHsMai
 rYCg1JgQuY43U+S3UF732cWD/nZmZto0iYktgFRw/X0EsfyDVblvpsxLW+P3cENkV/uf
 LZug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTXPbGE2gMYzNvCB9b6Y7f5HPGS1pqQZMZ+Mj8vWwlx3TpMG4f11T+SJq/8q2FoBn/bnYJavLO1g==@nongnu.org
X-Gm-Message-State: AOJu0YzAs6Ahcy87e+GvUVg4n2WmzWLeRdV6py00Ihhj0qfg7F3rZJKy
 jlDYP3f7iG/QVNQTTbjxJ06YOUly/wW1Jab6jqZKcVqCOxhB7tfClpUTC8Jfh/xdQpaXre3Plxg
 GydN6houXyJNTZD/U4sjTZjqBOOIx/J8l474Rv2DHfJ4nGXD5fg==
X-Gm-Gg: ASbGnctcAZ6hl4EfJSpcajR0SwEC+7AvAUrlxj6DgOYpCRRpgdttyRQ7jNi6qwlAF4s
 kiwG4j1e5S8HrnhJKYMN1IQ0VZS/yLQNq1CvOcAYnL/yyF89bNQtGYIzBctprTq9ge8N6mir73B
 HIR8g+P1FQd8wkbgQck4j0sl7OBZaWxArUL4MkCL65oXoTF6S5w7LMTBV0USTG1vPZRWOfoHaZV
 IOhkOc9fhEgsBvo0AJW1DEVEqFXBzMvTgm0GmsM+xVPIRzdJjBU8TBSwqzEvOAHKgHI/RIN9St/
 xqPBinA8aZx0PV9cU0so76PHvQKw99s74kUoaUpNpko9watDfK3vboQMY1H5+xw=
X-Received: by 2002:a05:6000:2c2:b0:391:3aaf:1d5d with SMTP id
 ffacd0b85a97d-399739c916cmr3350531f8f.27.1742407776145; 
 Wed, 19 Mar 2025 11:09:36 -0700 (PDT)
X-Received: by 2002:a05:6000:2c2:b0:391:3aaf:1d5d with SMTP id
 ffacd0b85a97d-399739c916cmr3350502f8f.27.1742407775684; 
 Wed, 19 Mar 2025 11:09:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb92csm22125436f8f.91.2025.03.19.11.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 11:09:35 -0700 (PDT)
Message-ID: <c70fdb0c-ef56-4a52-8591-31df51ff0eec@redhat.com>
Date: Wed, 19 Mar 2025 19:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
 <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
 <Z9r7dT/5E+YToqc9@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z9r7dT/5E+YToqc9@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I566sOcd9XcScrrT570RBQzjQOJNXrCfWtg3sWwaUUo_1742407776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: boB1nXMVG0wj

Hi Nicolin,


On 3/19/25 6:14 PM, Nicolin Chen wrote:
> On Wed, Mar 19, 2025 at 05:45:51PM +0100, Eric Auger wrote:
>>
>>
>> On 3/17/25 8:10 PM, Nicolin Chen wrote:
>>> On Mon, Mar 17, 2025 at 07:07:52PM +0100, Eric Auger wrote:
>>>> On 3/17/25 6:54 PM, Nicolin Chen wrote:
>>>>> On Wed, Mar 12, 2025 at 04:15:10PM +0100, Eric Auger wrote:
>>>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>>>> Based on SMMUv3 as a parent device, add a user-creatable smmuv3-accel
>>>>>>> device. In order to support vfio-pci dev assignment with a Guest
>>>>>> guest
>>>>>>> SMMUv3, the physical SMMUv3 has to be configured in nested(S1+s2)
>>>>>> nested (s1+s2)
>>>>>>> mode, with Guest owning the S1 page tables. Subsequent patches will
>>>>>> the guest
>>>>>>> add support for smmuv3-accel to provide this.
>>>>>> Can't this -accel smmu also works with emulated devices? Do we want an
>>>>>> exclusive usage?
>>>>> Is there any benefit from emulated devices working in the HW-
>>>>> accelerated nested translation mode?
>>>> Not really but do we have any justification for using different device
>>>> name in accel mode? I am not even sure that accel option is really
>>>> needed. Ideally the qemu device should be able to detect it is
>>>> protecting a VFIO device, in which case it shall check whether nested is
>>>> supported by host SMMU and then automatically turn accel mode?
>>>>
>>>> I gave the example of the vfio device which has different class
>>>> implementration depending on the iommufd option being set or not.
>>> Do you mean that we should just create a regular smmuv3 device and
>>> let a VFIO device to turn on this smmuv3's accel mode depending on
>>> its LEGACY/IOMMUFD class?
>> no this is not what I meant. I gave an example where depending on an
>> option passed to thye VFIO device you choose one class implement or the
>> other.
> Option means something like this:
> 	-device smmuv3,accel=on
> instead of
> 	-device "smmuv3-accel"
> ?
>
> Yea, I think that's good.
Yeah actually that's a big debate for not much. From an implementation
pov that shall not change much. The only doubt I have is if we need to
conditionnaly expose the MSI RESV regions it is easier to do if we
detect we have a smmuv3-accel. what the option allows is the auto mode.
>
>>> Another question: how does an emulated device work with a vSMMUv3?
>> I don't get your question. vSMMUv3 currently only works with emulated
>> devices. Did you mean accelerated SMMUv3?
> Yea. If "accel=on", how does an emulated device work with that?
>
>>> I could imagine that all the accel steps would be bypassed since
>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>> so we will need to flush the iotlb, which will increase complexity
>>> as the TLBI command dispatching function will need to be aware what
>>> ASID is for emulated device and what is for vfio device..
>> I don't get the issue. For emulated device you go through the usual
>> translate path which indeed caches configs and translations. In case the
>> guest invalidates something, you know the SID and you find the entries
>> in the cache that are tagged by this SID.
>>
>> In case you have an accelerated device (indeed if sdev->idev) you don't
>> exercise that path. On invalidation you detect the SID matches a VFIO
>> devoce, propagate the invalidations to the host instead. on the
>> invalidation you should be able to detect pretty easily if you need to
>> flush the emulated caches or propagate the invalidations. Do I miss some
>> extra problematic?
>>
>> I do not say we should support emulated devices and VFIO devices in the
>> same guest iommu group. But I don't see why we couldn't easily plug the
>> accelerated logic in the current logical for emulation/vhost and do not
>> require a different qemu device.
> Hmm, feels like I fundamentally misunderstood your point.
>  a) We implement the device model with the same piece of code but
>     only provide an option "accel=on/off" to switch mode. And both
>     passthrough devices and emulated devices can attach to the same
>     "accel=on" device.
I think we all agree we don't want that use case in general. However
effectively I was questioning why it couldn't work maybe at the expense
of some perf degration.
>  b) We implement the device model with the same piece of code but
>     only provide an option "accel=on/off" to switch mode. Then, an
>     passthrough device can attach to an "accel=on" device, but an
>     emulated device can only attach to an "accel=off" SMMU device.
>
> I was thinking that you want case (a). But actually you were just
> talking about case (b)? I think (b) is totally fine.
>
> We certainly can't do case (a): not all TLBI commands gives an "SID"
> field (so would have to broadcast, i.e. underlying SMMU HW would run
> commands that were supposed for emulated devices only); in case of
> vCMDQ, commands for emulated devices would be issued to real HW and
I am still confused about that. For instance if the guest sends an
NH_ASID, NH_VA invalidation and it happens both the emulated device and
VFIO-device share the same cd.asid (same guest iommu domain, which
practically should not happen) why shouldn't we propagate the
invalidation to the host. Does the problem come from the usage of vCMDQ
or would you foresee the same problem with a generic physical SMMU?

Thanks

Eric
> trigger HW errors.
>
> Thanks
> Nicolin
>

