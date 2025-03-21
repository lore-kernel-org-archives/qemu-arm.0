Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp17645njc;
        Thu, 20 Mar 2025 18:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWikkfro5LWxi163w6NtLhAbX2bg+ohqGcryCKhQkT/Q/Z30yeKXBUnID46cqQ9QoH8V78K66X8GTm+SA==@linaro.org
X-Google-Smtp-Source: AGHT+IERFTqKxa7K19XmyH2adwuadbCtT4GnggmXA35RXoQVGyebFgqIxyJ302gdM0/uLeKeZGOT
X-Received: by 2002:a05:620a:8081:b0:7c3:d677:dcd2 with SMTP id af79cd13be357-7c5ba240a0amr246970085a.51.1742520425039;
        Thu, 20 Mar 2025 18:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742520425; cv=none;
        d=google.com; s=arc-20240605;
        b=DCNAs0N5z2K2xF8vEFX1uUSLSsPRWyfm+tM/Lg1i5my8VoJ/z1f8JDqeWTKXPpxoBL
         7jWY0fMwNiOotDRdaSRvLuRNzWaprIWwnDgLWw5waTIjLz0O1e/Ax82nq0QJmDtgMhzx
         vN6WNHlxdYx0Hqgp8q0X8GgbZ6JNWyS4mYX+ft2zcmWrVA22Dk6awT0GMQpQ5grfxmO3
         ZF/qiniazZXN149tnp5hxofEONwWWFMDSccaIryZeN/gxgz7Rt24kEvsSPr/MXt/aPZf
         sTp8hNtoquG9OnheVfQz0dKuogS8XR6h5mXZq1EPW9RjnPD09KqN9037e1XPMmmPBrbb
         Cs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DPzH+pbWEdmaE+tb6lEZgkQVsUFoZg4eoMTkUxT1Jx0=;
        fh=tv6rb5lFHriwFm2Lqc7MKIjs2gNznMNFHFgIzpXrUI8=;
        b=WMsV1QyoFzDzcWhczI8EBH0ynyUYHypTiSL/cvqHLug/VM7urzWXPROYvTcHX1ZhhQ
         p0tTwWg4+mVHeKQqShGs9cAg94JK5Ot5Yc+OcBiA119MIBYm3puy7JcfeWvzzIh6EgH4
         G0x0rHh3LMxhahf0qS6PdNECo7lowNtRl4FeWQnJFwJmG328ARYYZhEmnfcYFBxApGDp
         qPAfZ53VP3npybgS1wz5nnlSVUqP4J6XpU41Vro+Fyp66LTYsiLaWsOysFpvtWV22gaE
         j8AG5KgHLM1xEi1RSu5QnN/sdA7CtjBaP2ZHKhnhfITeYJNO6wW+d8FbWbuATwfP1HzW
         dNew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apUX5t1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93854ddsi94884685a.642.2025.03.20.18.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 18:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apUX5t1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvR9y-0004rJ-K0; Thu, 20 Mar 2025 21:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvR9w-0004r4-SK
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 21:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvR9v-0008Rb-4q
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 21:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742520410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPzH+pbWEdmaE+tb6lEZgkQVsUFoZg4eoMTkUxT1Jx0=;
 b=apUX5t1CCduf3yAbeUqWVolFZg5g9RNq51HyKYqvICBJbJ32m4MMdISw5TmRU3/Vl5aJ9P
 TPMyqYCLhQa3Rh0yWIHvMWK5vXA53utcaStaGt+AQw5mQwlTKsh8oKemZOGULm4isXXw6b
 8lJyQCfCxwWFVm2eIAOGAjkwZfrh2no=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-O3c0jB0dNo6Mu6sZSAzlXg-1; Thu, 20 Mar 2025 21:26:43 -0400
X-MC-Unique: O3c0jB0dNo6Mu6sZSAzlXg-1
X-Mimecast-MFC-AGG-ID: O3c0jB0dNo6Mu6sZSAzlXg_1742520402
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d44b221f0dso27926055ab.1
 for <qemu-arm@nongnu.org>; Thu, 20 Mar 2025 18:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742520402; x=1743125202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPzH+pbWEdmaE+tb6lEZgkQVsUFoZg4eoMTkUxT1Jx0=;
 b=KCkxm5J6QSxN1ihbDlJ+2CnqTKjsdMiymxTgzrvdggMYNhp+HHi1v/Ech+8ZhHFgkt
 Y2JHiRkMtOajvoTqd5Suqosbz2zItponU7aSMHozrhHigTefILtZ+KTEIN9J2z10pXnX
 jnuAIMG1JVgFbvl7pXH/XmloRwqPTVzd7F96agXGsyQBY49LAoQAU6xqSoNY+qQzV7zu
 +GloA5JbIv3s+qkVm9iO46E9YikZBIfGPjsAhFcSbLz84TZ5v4w8GhLRX2TrmXxY7gcq
 +9IezxRy9Eb1ZrbUbX9y4OGOxsCQe7IUkxAAcATh+YZiOma5TKgprVCeJIU44DgGeAWn
 /Pxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG2Pn+ePGcOLZqzHIkwcWpSjUPBEnG8qPY8nqdI02+vgOQ0+Hg7bOhmhf65iNOw14E8m7ATeA3sw==@nongnu.org
X-Gm-Message-State: AOJu0Yyesqehtz9tz9oPNmot/pVirat5ShfBak7okNq3r35AsqYqaBel
 mdCdq+tQhkpQPFKKMEGqP19hnMZH++Bkd/IogtGwX31EvkHBsL3D+ZMuBu7GYv4DXiA3hK7nfXR
 FjkD80Q8pOl7qlJ9P+CZCbeM6CULIphOGRJ+hfP6TQJDk3WnWig==
X-Gm-Gg: ASbGnct0P/LUE7dS8oYsc35C3bwdk/sj+Mwlzyz+9AGZW/GBpCvknacE7XcFaSzKGSq
 sqbjXOqnwo60BRAo+pN47zcPEDh9CLVM3dyjiUyfFmbLZ+uaXiEIPhvsc5KbusUqVP47je3ESV6
 zqgEa+z2lT2Junx0QGvIUwZksb5Zk007DvdZl3Oz/m/CbQOdAslfmRi3ChriMxjGaqE++fvX3vJ
 DVmkNFq9twGzgHaEWMqJ2RirH/jZla1daBlxDxNC8w/kOW0QE077IJaYrGyfL7+0WidolwUfkbS
 M+bmrveyCN/5GzMN
X-Received: by 2002:a05:6e02:23c5:b0:3d3:d965:62c3 with SMTP id
 e9e14a558f8ab-3d5961775a9mr17939395ab.15.1742520402572; 
 Thu, 20 Mar 2025 18:26:42 -0700 (PDT)
X-Received: by 2002:a05:6e02:23c5:b0:3d3:d965:62c3 with SMTP id
 e9e14a558f8ab-3d5961775a9mr17939265ab.15.1742520402258; 
 Thu, 20 Mar 2025 18:26:42 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d59607e92csm2063905ab.23.2025.03.20.18.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 18:26:41 -0700 (PDT)
Message-ID: <57e53ae1-3a34-4be1-94ab-f96b765c3bb5@redhat.com>
Date: Thu, 20 Mar 2025 21:26:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: eric.auger@redhat.com, Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
 <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
 <Z9r7dT/5E+YToqc9@Asurada-Nvidia>
 <c70fdb0c-ef56-4a52-8591-31df51ff0eec@redhat.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <c70fdb0c-ef56-4a52-8591-31df51ff0eec@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R11nwyFU0H0rhaqwLWmZ_Ob097bV_utWMJwQrBj-A0Y_1742520402
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KMaiJI07xrLr



On 3/19/25 2:09 PM, Eric Auger wrote:
> Hi Nicolin,
> 
> 
> On 3/19/25 6:14 PM, Nicolin Chen wrote:
>> On Wed, Mar 19, 2025 at 05:45:51PM +0100, Eric Auger wrote:
>>>
>>>
>>> On 3/17/25 8:10 PM, Nicolin Chen wrote:
>>>> On Mon, Mar 17, 2025 at 07:07:52PM +0100, Eric Auger wrote:
>>>>> On 3/17/25 6:54 PM, Nicolin Chen wrote:
>>>>>> On Wed, Mar 12, 2025 at 04:15:10PM +0100, Eric Auger wrote:
>>>>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>>>>> Based on SMMUv3 as a parent device, add a user-creatable smmuv3-accel
>>>>>>>> device. In order to support vfio-pci dev assignment with a Guest
>>>>>>> guest
>>>>>>>> SMMUv3, the physical SMMUv3 has to be configured in nested(S1+s2)
>>>>>>> nested (s1+s2)
>>>>>>>> mode, with Guest owning the S1 page tables. Subsequent patches will
>>>>>>> the guest
>>>>>>>> add support for smmuv3-accel to provide this.
>>>>>>> Can't this -accel smmu also works with emulated devices? Do we want an
>>>>>>> exclusive usage?
>>>>>> Is there any benefit from emulated devices working in the HW-
>>>>>> accelerated nested translation mode?
>>>>> Not really but do we have any justification for using different device
>>>>> name in accel mode? I am not even sure that accel option is really
>>>>> needed. Ideally the qemu device should be able to detect it is
>>>>> protecting a VFIO device, in which case it shall check whether nested is
>>>>> supported by host SMMU and then automatically turn accel mode?
>>>>>
>>>>> I gave the example of the vfio device which has different class
>>>>> implementration depending on the iommufd option being set or not.
>>>> Do you mean that we should just create a regular smmuv3 device and
>>>> let a VFIO device to turn on this smmuv3's accel mode depending on
>>>> its LEGACY/IOMMUFD class?
>>> no this is not what I meant. I gave an example where depending on an
>>> option passed to thye VFIO device you choose one class implement or the
>>> other.
>> Option means something like this:
>> 	-device smmuv3,accel=on
>> instead of
>> 	-device "smmuv3-accel"
>> ?
>>
>> Yea, I think that's good.
> Yeah actually that's a big debate for not much. From an implementation
> pov that shall not change much. The only doubt I have is if we need to
> conditionnaly expose the MSI RESV regions it is easier to do if we
> detect we have a smmuv3-accel. what the option allows is the auto mode.
>>
>>>> Another question: how does an emulated device work with a vSMMUv3?
>>> I don't get your question. vSMMUv3 currently only works with emulated
>>> devices. Did you mean accelerated SMMUv3?
>> Yea. If "accel=on", how does an emulated device work with that?
>>
>>>> I could imagine that all the accel steps would be bypassed since
>>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>>> so we will need to flush the iotlb, which will increase complexity
>>>> as the TLBI command dispatching function will need to be aware what
>>>> ASID is for emulated device and what is for vfio device..
>>> I don't get the issue. For emulated device you go through the usual
>>> translate path which indeed caches configs and translations. In case the
>>> guest invalidates something, you know the SID and you find the entries
>>> in the cache that are tagged by this SID.
>>>
>>> In case you have an accelerated device (indeed if sdev->idev) you don't
>>> exercise that path. On invalidation you detect the SID matches a VFIO
>>> devoce, propagate the invalidations to the host instead. on the
>>> invalidation you should be able to detect pretty easily if you need to
>>> flush the emulated caches or propagate the invalidations. Do I miss some
>>> extra problematic?
>>>
>>> I do not say we should support emulated devices and VFIO devices in the
>>> same guest iommu group. But I don't see why we couldn't easily plug the
>>> accelerated logic in the current logical for emulation/vhost and do not
>>> require a different qemu device.
>> Hmm, feels like I fundamentally misunderstood your point.
>>   a) We implement the device model with the same piece of code but
>>      only provide an option "accel=on/off" to switch mode. And both
>>      passthrough devices and emulated devices can attach to the same
>>      "accel=on" device.
> I think we all agree we don't want that use case in general. However
> effectively I was questioning why it couldn't work maybe at the expense
> of some perf degration.
>>   b) We implement the device model with the same piece of code but
>>      only provide an option "accel=on/off" to switch mode. Then, an
>>      passthrough device can attach to an "accel=on" device, but an
>>      emulated device can only attach to an "accel=off" SMMU device.
>>
>> I was thinking that you want case (a). But actually you were just
>> talking about case (b)? I think (b) is totally fine.
>>
>> We certainly can't do case (a): not all TLBI commands gives an "SID"
>> field (so would have to broadcast, i.e. underlying SMMU HW would run
>> commands that were supposed for emulated devices only); in case of
>> vCMDQ, commands for emulated devices would be issued to real HW and
> I am still confused about that. For instance if the guest sends an
> NH_ASID, NH_VA invalidation and it happens both the emulated device and
> VFIO-device share the same cd.asid (same guest iommu domain, which
> practically should not happen) why shouldn't we propagate the
it can't ... on ARM ... PCIe only, no shared iommu domain btwn devices.

Isn't this another reason (perf) why emulated devices & physical devices should
be on different vSMMU's ... so it can be distinguished on how deep (to hw)
or how wide(a broadcast) actions like TLBI is implemented, or impacts other devices ?


> invalidation to the host. Does the problem come from the usage of vCMDQ
> or would you foresee the same problem with a generic physical SMMU?
> 
> Thanks
> 
> Eric
>> trigger HW errors.
>>
>> Thanks
>> Nicolin
>>
> 

