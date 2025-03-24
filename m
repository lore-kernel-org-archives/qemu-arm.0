Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2004996njc;
        Mon, 24 Mar 2025 07:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7V0PwR6Jif5+rU11XZzcUvOrV4kCHdDFzsvuT+5SXcBTLbhrjYphzgefsMDMjyQ9YK1AFJPUJUiviuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGFcg3zwlKIbvoYVYa8saXetsqWVDTzcHmSqvVtbrPHRAUtHaNU7Q5/bBTYoVEu2qTpPf9T
X-Received: by 2002:a05:622a:1f07:b0:476:c656:4e80 with SMTP id d75a77b69052e-4771de32c45mr219908901cf.34.1742828382731;
        Mon, 24 Mar 2025 07:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742828382; cv=none;
        d=google.com; s=arc-20240605;
        b=kOVNAfTDQL+HtuDZKqhBv1OqpFbT5LazgJ1GX6asrhapncVCivRvXREIFCjDCGdxKw
         hIkd7MvbYDCX0YVhLdWAjsaY5D9U59MAzA7NMZTG1d+kjaIgbOgR2FWGMkv+9zIGVRzT
         tB9EDztUa43IF1rG1ItrS2fzG4vEHX5MG/j+l86T6JyUbPzrvHqpvo21BbfmxVWs03wL
         ZqyM+VXGJ+pwtkirZtG5vr9/22xf39F8ByiVqtuPU1kTN3VQr7CGGE4FF13Yjho11Bv8
         1QDlqyud9HaYMKwY5LbCCH8Q7iI+q9bv56OqTKg2Yam71BatxjsIbN1S0MLaJPsaDnQd
         vf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7NaaV/9k3VgyOqwN8vxiIuqyHg0WT+6E2KVjCk/mMCU=;
        fh=iEUWD42eQJb+1DDuJA5CGuCtLgPRHbv8sI30qkzERnw=;
        b=NAVY+8yDGsQATPeZYvBtbbihae6/v/NPeelxJFckQsTN9zY5csv/ZJwNfCYnqrLEqa
         lfCeus0egVuFA235Tq7GyQyyVQDs16O5xFaSA3VKBs79VBGUopQJNbpigfjSL/vjzKA/
         wycaBollWsxo6Px0oVfyfPdqrg0/zBnwk049eojo+jE33UB6JCWt//x8pQgSlo0qfF7X
         5ODdZ9wfkfArElC7BTUAVA9FpO6gzpjMK204oahFvEnC3o7K8z650x2mqoEgxav9t58s
         FnbsqdI3lmbHh10DRf5lTHjgIwNQRyWQWg0vp09wMzqAI6UgS4cJ/OSZBJhGdUkRO68J
         4Kvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnsYFpBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d15c9cfsi73050581cf.15.2025.03.24.07.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 07:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnsYFpBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twjGz-0004VM-FB; Mon, 24 Mar 2025 10:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjGv-0004US-6Q
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjGq-0004ac-8Y
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742828359;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NaaV/9k3VgyOqwN8vxiIuqyHg0WT+6E2KVjCk/mMCU=;
 b=EnsYFpBKgsv/AWkSfCHIeoFMNa8TFha78Zp+MmO7Z3wtk46ar3xy6bRZ4TY3DCXRLb+b3K
 OVj8YTzeCNN+J9cJZsE/ljBV12v3kFeVRoXpVyN5tHOWqbXPWl75uf10bbTUCynWQlyo6y
 +sVk7ClVlxgXaPIIjcrxVomsza5J0Ck=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-PeWwrClrM3iYHhrV1mfE0Q-1; Mon, 24 Mar 2025 10:59:16 -0400
X-MC-Unique: PeWwrClrM3iYHhrV1mfE0Q-1
X-Mimecast-MFC-AGG-ID: PeWwrClrM3iYHhrV1mfE0Q_1742828355
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-391315098b2so1774012f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742828355; x=1743433155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7NaaV/9k3VgyOqwN8vxiIuqyHg0WT+6E2KVjCk/mMCU=;
 b=MSUj+M43iXO/6q9Yu+FE/5hWNLhV5AHVMR1Oh9pKP8wzT6XEVOfgVKh9+CocPHUbD/
 2zfIvyg9yR7cyYjwZicgVRrg0Y9UsCsZxqmNGyXklbqHZDQVMdz3s5w4TyR1ILCo1sO4
 nQCT1T2VjRemYhi5gYbTFqRqLiexF9n9JlKA21Kh/XyoabKB+TW7ibDelFQQUE86toGk
 dfmDX8BVhHpNubc25p+lMMkiN6xwneeB3S1rXsiUxleDNzIHs0DeQ+YSWaFlOdoGEWwb
 MapZgyf2zdaP1hBwBSZ7Ps2ecXV16XfEibXeggWMP1OKOh5jkfaCgbYMl3POA2ObOf7h
 NNRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2lHN360K+M70odHj3R40vu3sh6AAL49ejWAifKk8rmrHJM7A1WCbrawnJvCXmpL6fu0rydVxLvQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy/RmrOIKF3Ki+pTJ7Ned7eDEGpEUJBulPPQPDuy9FOdwZeRMDZ
 nKxC5eXzYOPqpgZXddDiCfHzSGGpcVueDhMZlDU4KeDvefYGRkHutKOajX00tkDQtiA6P6A8Cn7
 EDIr4kLlHp/W3vjcd+4hXF4zaLNdqpmJlsqda2WO6kmxoFDb85w==
X-Gm-Gg: ASbGncu/XEFenmvB8x0Lo969RdCWcatbKMeSMbc9qT4WXXgRrzLx/rJM3vEhHyiZiwo
 J6vW1oa3bP2bZiOb4InpWaOKU0b+ARHbpbI5LisJrLZODxZEASx5OX3UTNP83tf/EwYRaL2CisT
 fMRSneU0KIbNzb8QPY/yc7/rbckOYegNoFOeK7KWaf3pe0QId6IMFc4fWS7pG88kSYB9U+Gqd6x
 QW11oKv/9lcaKCSePtcc4ApihbvuTef7JBL9tTBTqW3aIFQTA4sTGF8rRvhZI6sqBS7SLdRj9B8
 zorSW8PDji9AEjwIEQOPMgfBisxDwc/DIpUipSRRLxgOqiwAKrwmIzZUradmVGI=
X-Received: by 2002:a5d:59a6:0:b0:390:f6aa:4e72 with SMTP id
 ffacd0b85a97d-3997f8fabdbmr11182141f8f.18.1742828354852; 
 Mon, 24 Mar 2025 07:59:14 -0700 (PDT)
X-Received: by 2002:a5d:59a6:0:b0:390:f6aa:4e72 with SMTP id
 ffacd0b85a97d-3997f8fabdbmr11182117f8f.18.1742828354381; 
 Mon, 24 Mar 2025 07:59:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef1f7sm11083046f8f.82.2025.03.24.07.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:59:13 -0700 (PDT)
Message-ID: <a5953211-e409-4442-babe-aa2b406355d7@redhat.com>
Date: Mon, 24 Mar 2025 15:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Donald Dutile <ddutile@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>
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
 <57e53ae1-3a34-4be1-94ab-f96b765c3bb5@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <57e53ae1-3a34-4be1-94ab-f96b765c3bb5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z-8UPA8lJPEVYTrwjrW6Hb4Oq2_J2SsISy9L1k_UEys_1742828355
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pNeYUmlqKoi0



On 3/21/25 2:26 AM, Donald Dutile wrote:
>
>
> On 3/19/25 2:09 PM, Eric Auger wrote:
>> Hi Nicolin,
>>
>>
>> On 3/19/25 6:14 PM, Nicolin Chen wrote:
>>> On Wed, Mar 19, 2025 at 05:45:51PM +0100, Eric Auger wrote:
>>>>
>>>>
>>>> On 3/17/25 8:10 PM, Nicolin Chen wrote:
>>>>> On Mon, Mar 17, 2025 at 07:07:52PM +0100, Eric Auger wrote:
>>>>>> On 3/17/25 6:54 PM, Nicolin Chen wrote:
>>>>>>> On Wed, Mar 12, 2025 at 04:15:10PM +0100, Eric Auger wrote:
>>>>>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>>>>>> Based on SMMUv3 as a parent device, add a user-creatable
>>>>>>>>> smmuv3-accel
>>>>>>>>> device. In order to support vfio-pci dev assignment with a Guest
>>>>>>>> guest
>>>>>>>>> SMMUv3, the physical SMMUv3 has to be configured in nested(S1+s2)
>>>>>>>> nested (s1+s2)
>>>>>>>>> mode, with Guest owning the S1 page tables. Subsequent patches
>>>>>>>>> will
>>>>>>>> the guest
>>>>>>>>> add support for smmuv3-accel to provide this.
>>>>>>>> Can't this -accel smmu also works with emulated devices? Do we
>>>>>>>> want an
>>>>>>>> exclusive usage?
>>>>>>> Is there any benefit from emulated devices working in the HW-
>>>>>>> accelerated nested translation mode?
>>>>>> Not really but do we have any justification for using different
>>>>>> device
>>>>>> name in accel mode? I am not even sure that accel option is really
>>>>>> needed. Ideally the qemu device should be able to detect it is
>>>>>> protecting a VFIO device, in which case it shall check whether
>>>>>> nested is
>>>>>> supported by host SMMU and then automatically turn accel mode?
>>>>>>
>>>>>> I gave the example of the vfio device which has different class
>>>>>> implementration depending on the iommufd option being set or not.
>>>>> Do you mean that we should just create a regular smmuv3 device and
>>>>> let a VFIO device to turn on this smmuv3's accel mode depending on
>>>>> its LEGACY/IOMMUFD class?
>>>> no this is not what I meant. I gave an example where depending on an
>>>> option passed to thye VFIO device you choose one class implement or
>>>> the
>>>> other.
>>> Option means something like this:
>>>     -device smmuv3,accel=on
>>> instead of
>>>     -device "smmuv3-accel"
>>> ?
>>>
>>> Yea, I think that's good.
>> Yeah actually that's a big debate for not much. From an implementation
>> pov that shall not change much. The only doubt I have is if we need to
>> conditionnaly expose the MSI RESV regions it is easier to do if we
>> detect we have a smmuv3-accel. what the option allows is the auto mode.
>>>
>>>>> Another question: how does an emulated device work with a vSMMUv3?
>>>> I don't get your question. vSMMUv3 currently only works with emulated
>>>> devices. Did you mean accelerated SMMUv3?
>>> Yea. If "accel=on", how does an emulated device work with that?
>>>
>>>>> I could imagine that all the accel steps would be bypassed since
>>>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>>>> so we will need to flush the iotlb, which will increase complexity
>>>>> as the TLBI command dispatching function will need to be aware what
>>>>> ASID is for emulated device and what is for vfio device..
>>>> I don't get the issue. For emulated device you go through the usual
>>>> translate path which indeed caches configs and translations. In
>>>> case the
>>>> guest invalidates something, you know the SID and you find the entries
>>>> in the cache that are tagged by this SID.
>>>>
>>>> In case you have an accelerated device (indeed if sdev->idev) you
>>>> don't
>>>> exercise that path. On invalidation you detect the SID matches a VFIO
>>>> devoce, propagate the invalidations to the host instead. on the
>>>> invalidation you should be able to detect pretty easily if you need to
>>>> flush the emulated caches or propagate the invalidations. Do I miss
>>>> some
>>>> extra problematic?
>>>>
>>>> I do not say we should support emulated devices and VFIO devices in
>>>> the
>>>> same guest iommu group. But I don't see why we couldn't easily plug
>>>> the
>>>> accelerated logic in the current logical for emulation/vhost and do
>>>> not
>>>> require a different qemu device.
>>> Hmm, feels like I fundamentally misunderstood your point.
>>>   a) We implement the device model with the same piece of code but
>>>      only provide an option "accel=on/off" to switch mode. And both
>>>      passthrough devices and emulated devices can attach to the same
>>>      "accel=on" device.
>> I think we all agree we don't want that use case in general. However
>> effectively I was questioning why it couldn't work maybe at the expense
>> of some perf degration.
>>>   b) We implement the device model with the same piece of code but
>>>      only provide an option "accel=on/off" to switch mode. Then, an
>>>      passthrough device can attach to an "accel=on" device, but an
>>>      emulated device can only attach to an "accel=off" SMMU device.
>>>
>>> I was thinking that you want case (a). But actually you were just
>>> talking about case (b)? I think (b) is totally fine.
>>>
>>> We certainly can't do case (a): not all TLBI commands gives an "SID"
>>> field (so would have to broadcast, i.e. underlying SMMU HW would run
>>> commands that were supposed for emulated devices only); in case of
>>> vCMDQ, commands for emulated devices would be issued to real HW and
>> I am still confused about that. For instance if the guest sends an
>> NH_ASID, NH_VA invalidation and it happens both the emulated device and
>> VFIO-device share the same cd.asid (same guest iommu domain, which
>> practically should not happen) why shouldn't we propagate the
> it can't ... on ARM ... PCIe only, no shared iommu domain btwn devices.
yeah I agree this generally happens behind a PCIe to PCI bridge.
>
> Isn't this another reason (perf) why emulated devices & physical
> devices should
> be on different vSMMU's ... so it can be distinguished on how deep (to
> hw)
> or how wide(a broadcast) actions like TLBI is implemented, or impacts
> other devices ?
To me the actual issue is vcmdq. Here we have a blocker. Otherwise if
you don't have vcmdq you still can propage invalidations using the
proper notifier (VFIO or vhost). This used to work

Eric
>
>
>> invalidation to the host. Does the problem come from the usage of vCMDQ
>> or would you foresee the same problem with a generic physical SMMU?
>>
>> Thanks
>>
>> Eric
>>> trigger HW errors.
>>>
>>> Thanks
>>> Nicolin
>>>
>>
>

