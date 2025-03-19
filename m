Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp389756njc;
        Wed, 19 Mar 2025 10:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8efgmUu2VEu7Gx8gABg67H++GqEjDJ6sS0PA1h1Z7ag4q/iUTsXIW9ilSRm+M4H02uyl8WFRF8TtGGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGjG/NnQssGHDR3nEqv5V9alyYPyeiFeIRu5UDOxDwJWwpDNoUmXyhpwvK+UJTnFSVkANsE
X-Received: by 2002:ad4:5de7:0:b0:6e8:fb94:b9bf with SMTP id 6a1803df08f44-6eb29277389mr56783906d6.4.1742403896448;
        Wed, 19 Mar 2025 10:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742403896; cv=none;
        d=google.com; s=arc-20240605;
        b=BuPXJzCyrOukozu1Rl03lnjODM2oM4Fk6RzCrKKGNLKUyBiebWKsF9TgVIhbuz63S5
         9nePJ2xtXvR/CuWCq+zXgOq12eOz1sApHMPNJN4MqqbAAsQU6hBALKOIOD3+zECxOYJF
         XUDOz4LtB4+a4Lw2uozKnB1icmS0Qav61zv41MfXRn3PJYXCc1pNpmRJ6yNc1wzkP4gw
         6XDDAbnIq83KjXSVsOGrfo4OFevYZ71SDXrNTaeZ9DVDCRmiBjd/LDLMgkiLZ44A4zE3
         p3J+R3r5bt0PStPox+mwBxO3vLWw5toF9YllX+hNvjg2MNk97qTNxczMT6W+j4HHIHx0
         +jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1Y0K9Lf7D3vcBagQzRWyHpE0d44ScmNSqhz3fS0XaC0=;
        fh=rJ1SnAPxXoXXxPt8uPYC5BanQhEUv9vjmINyFVes0KU=;
        b=H5cJSYIFUD9RwYKeelLxAIG2RQNsnZK7lrV3zmdyEUXVZKkLxPdvLEX47TYaYh4W4D
         epYWtQwU+EmhkWEozNdLmUAo8AbtKYl4iQYZbDfCvpQqPcnHZXssQltLjqRBser/xQqZ
         X+S8zLKF5LiQ3HqwSHbA+V+Q+oFzZFs8bhkfnxbKcJjV8n26OWEnIqPcYq/+LxpsX9QP
         iiOKse6PC/kv4MhB0A8SESwLwWqKns/JRvdBTg54wfRgSKtiA7QBGQsZBcJO4/d+GfAf
         XS1EBnUisHhyxV3qDmBOD6HzyB2YB+K31wJXfJhhsFZkl9PM0vtx5uOpvVhw5eWCqeWm
         x5wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRHIyoxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33cb97si140312736d6.228.2025.03.19.10.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRHIyoxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuwq7-0006yk-6v; Wed, 19 Mar 2025 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwpw-0006Uq-Lt
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwpu-0007y8-7i
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742403849;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Y0K9Lf7D3vcBagQzRWyHpE0d44ScmNSqhz3fS0XaC0=;
 b=YRHIyoxhxoZ2hO9+xu3RDtCrzIugm36LD9/LWG6lH2UsOry3+bLxzmHBspoCZ7w2pw876W
 IuC4wtkYBBJlBfiasNS8VGV/0B2ScGZk6GJNJWeQRPwz6Wt9Sv6uSIAW+M8S31Syvbabez
 6jHgJ69pzjspgxzDDWWJXc5BDvqs0JE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-5aPuxhgrNFqQahaX27Y06w-1; Wed, 19 Mar 2025 13:04:07 -0400
X-MC-Unique: 5aPuxhgrNFqQahaX27Y06w-1
X-Mimecast-MFC-AGG-ID: 5aPuxhgrNFqQahaX27Y06w_1742403847
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-399744f742bso312709f8f.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742403846; x=1743008646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Y0K9Lf7D3vcBagQzRWyHpE0d44ScmNSqhz3fS0XaC0=;
 b=K5mhc1GFxC3BzODGly2nMAlsac0tYXkEBWCbmR/U9ts01TBwdwnRi8vftGFcphOEfz
 rn13iQeKRLfiHijGXJs8xJae1fhmsD3Ls8MH8R8R5uH3IwkTxxQ0Id5IPyUEdlOaS6nL
 i5qID6wLwBZRraVQW32dKzS9MbNlElnTBQXhXYVhcDFWOstTLub0ID6iyJCUy4g0Sp5l
 9NMsTTMJ+AX5ictY16k1QYjKdgwiV0rTO57dvc/5zs2bR+7LvCbP+389qCi1oYA1y8+E
 mbE6yxU5+Igyl4G7s8blWlCmuK9qjzwySGdLnlBc6PgMbvwCHQOJh2oNI8PdLzFz9rBN
 /W+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9UKr1+heDJI3dypGiUf+U/EbgqHTCgaw9BP4PKiIC3nezauVKl9ZZq+6/vMVNETGxGH39LUmwOw==@nongnu.org
X-Gm-Message-State: AOJu0YwHcSaMycMrKOudxJlw/8yWgXsxk7x9PBmfNWgEiDoMIitXEcT8
 YvY4fTOwvLLZizfT1g7z69wKSh2NolLZuqsoREoIzyn6wWwzJqbI9Q0hzk6PZFIyoB5dad0dm8H
 hmfid01MzDBLL8nULum8oNmzBm4r7bxJ5JlytEslkjAYJG1ro6g==
X-Gm-Gg: ASbGncvEA0xQp6Tp2Wo+kZ4XlmTbw08As4cqbTnmzqBJgGUehJINXVswWsmr67qBHpm
 DIbSnmTSGZ+gdecgZiW165z1RUKG9GoiMX0u56SdB4Q1K7mNY4oy0y+RaI66YDEF0AbmH7ECqAb
 mxQsvfsVBW5dfzywpFhS7b3qE7C53B6yrT1FxONuk+rB2Q1mWKxDk0J9MSyqh2+vV7NWJUGXAkU
 bwWvUyIxEFEx41qc+EOsPAO/BZaQpCZfauUdWtE6P1XLLJSCvtj+xiNwMqtGdozKAznGdt0KLwP
 wnxNmRKzgYayEwoWkR/OQM4RTtCeUuFbJh+ruF+UHM+D4+SSh10OvRvqxZTg7TI=
X-Received: by 2002:adf:ca93:0:b0:391:42f2:5c82 with SMTP id
 ffacd0b85a97d-399739d7300mr3234909f8f.21.1742403846412; 
 Wed, 19 Mar 2025 10:04:06 -0700 (PDT)
X-Received: by 2002:adf:ca93:0:b0:391:42f2:5c82 with SMTP id
 ffacd0b85a97d-399739d7300mr3234848f8f.21.1742403845855; 
 Wed, 19 Mar 2025 10:04:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7e9f8asm21351062f8f.81.2025.03.19.10.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:04:05 -0700 (PDT)
Message-ID: <c0448b92-1e2a-4983-837f-504a1cfa0975@redhat.com>
Date: Wed, 19 Mar 2025 18:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Donald Dutile <ddutile@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
 <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
 <Z9nF6FaIU37BNg4B@Asurada-Nvidia>
 <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2L3IaDHOJiQyFLxIAchqdDdidnPfyAU9wi2-iqS3RKQ_1742403847
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: G3f/cmrfBzbQ




On 3/18/25 10:22 PM, Donald Dutile wrote:
>
>
> On 3/18/25 3:13 PM, Nicolin Chen wrote:
>> On Tue, Mar 18, 2025 at 07:31:36PM +0100, Eric Auger wrote:
>>> On 3/17/25 9:19 PM, Nicolin Chen wrote:
>>>> On Mon, Mar 17, 2025 at 04:24:53PM -0300, Jason Gunthorpe wrote:
>>>>> On Mon, Mar 17, 2025 at 12:10:19PM -0700, Nicolin Chen wrote:
>>>>>> Another question: how does an emulated device work with a vSMMUv3?
>>>>>> I could imagine that all the accel steps would be bypassed since
>>>>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>>>>> so we will need to flush the iotlb, which will increase complexity
>>>>>> as the TLBI command dispatching function will need to be aware what
>>>>>> ASID is for emulated device and what is for vfio device..
>>>>> I think you should block it. We already expect different vSMMU's
>>>>> depending on the physical SMMU under the PCI device, it makes sense
>>>>> that a SW VFIO device would have it's own, non-accelerated, vSMMU
>>>>> model in the guest.
>>>> Yea, I agree and it'd be cleaner for an implementation separating
>>>> them.
>>>>
>>>> In my mind, the general idea of "accel=on" is also to keep things
>>>> in a more efficient way: passthrough devices go to HW-accelerated
>>>> vSMMUs (separated PCIE buses), while emulated ones go to a vSMMU-
>>>> bypassed (PCIE0).
>>
>>> Originally a specific SMMU device was needed to opt in for MSI reserved
>>> region ACPI IORT description which are not needed if you don't rely on
>>> S1+S2. However if we don't rely on this trick this was not even needed
>>> with legacy integration
>>> (https://patchwork.kernel.org/project/qemu-devel/cover/20180921081819.9203-1-eric.auger@redhat.com/).
>>>
>>>
>>> Nevertheless I don't think anything prevents the acceleration granted
>>> device from also working with virtio/vhost devices for instance unless
>>> you unplug the existing infra. The translation and invalidation just
>>> should use different control paths (explicit translation requests,
>>> invalidation notifications towards vhost, ...).
>>
>> smmuv3_translate() is per sdev, so it's easy.
>>
>> Invalidation is done via commands, which could be tricky:
>> a) Broadcast command
>> b) ASID validation -- we'll need to keep track of a list of ASIDs
>>     for vfio device to compare the ASID in each per-ASID command,
>>     potentially by trapping all CFGI_CD(_ALL) commands? Note that
>>     each vfio device may have multiple ASIDs (for multiple CDs).
>> Either a or b above will have some validation efficiency impact.
>>
>>> Again, what does legitimate to have different qemu devices for the same
>>> IP? I understand that it simplifies the implementation but I am not
>>> sure
>>> this is a good reason. Nevertheless it worth challenging. What is the
>>> plan for intel iommu? Will we have 2 devices, the legacy device and one
>>> for nested?
>>
>> Hmm, it seems that there are two different topics:
>> 1. Use one SMMU device model (source code file; "iommu=" string)
>>     for both an emulated vSMMU and an HW-accelerated vSMMU.
>> 2. Allow one vSMMU instance to work with both an emulated device
>>     and a passthrough device.
>> And I get that you want both 1 and 2.
>>
>> I'm totally okay with 1, yet see no compelling benefit from 2 for
>> the increased complexity in the invalidation routine.
>>
>> And another question about the mixed device attachment. Let's say
>> we have in the host:
>>    VFIO passthrough dev0 -> pSMMU0
>>    VFIO passthrough dev1 -> pSMMU1
>> Should we allow emulated devices to be flexibly plugged?
>>    dev0 -> vSMMU0 /* Hard requirement */
>>    dev1 -> vSMMU1 /* Hard requirement */
>>    emu0 -> vSMMU0 /* Soft requirement; can be vSMMU1 also */
>>    emu1 -> vSMMU1 /* Soft requirement; can be vSMMU0 also */
>>
>> Thanks
>> Nicolin
>>
> I agree w/Jason & Nicolin: different vSMMUs for pass-through devices
> than emulated, & vice-versa.
> Not mixing... because... of the next agreement:
you need to clarify what you mean by different vSMMUs: are you taking
about different instances or different qemu device types?
>
> I agree with Eric that 'accel' isn't needed -- this should be
> ascertained from the pSMMU that a physical device is attached to.
we can simply use an AUTO_ON_OFF property and by default choose AUTO
value. That would close the debate ;-)

Eric
> Now... how does vfio(?; why not qemu?) layer determine that? -- where
> are SMMUv3 'accel' features exposed either: a) in the device struct
> (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't find
> anything under either on my g-h system, but would appreciate a ptr if
> there is.
> and like Eric, although 'accel' is better than the original 'nested',
> it's non-obvious what accel feature(s) are being turned on, or not.
> In fact, if broken accel hw occurs ('if' -> 'when'), how should it be
> turned off? ... if info in the kernel, a kernel boot-param will be
> needed;
> if in sysfs, a write to 0 an enable(disable) it maybe an alternative
> as well.
> Bottom line: we need a way to (a) ascertain the accel feature (b) a
> way to disable it when it is broken,
> so qemu's smmuv3 spec will 'just work'.
> [This may also help when migrating from a machine that has accel
> working to one that does not.[
>
> ... and when an emulated device is assigned a vSMMU, there are no
> accel features ... unless we have tunables like batch iotlb
> invalidation for perf reasons, which can be viewed as an 'accel' option.
>

