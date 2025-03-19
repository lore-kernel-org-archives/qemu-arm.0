Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3339614njb;
        Tue, 18 Mar 2025 19:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJo6iXxBj4QJDAwJV1GpBUJfByNX3M0lWlb7W6ArULPyrKM7qydWfzd8v8tyT78WDp8o66GgFDENNh6w==@linaro.org
X-Google-Smtp-Source: AGHT+IFtYNSu4JrNtsB8iU75G4Vgk4TEB+U8bJDEQNjlkdDezx3LpOM9aCjdet/Yb6ugrwx4UVbx
X-Received: by 2002:a05:620a:2454:b0:7c5:a575:75da with SMTP id af79cd13be357-7c5a8283a1amr165443285a.6.1742350526845;
        Tue, 18 Mar 2025 19:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742350526; cv=none;
        d=google.com; s=arc-20240605;
        b=axvQ/Zzyp8XVLgCH1s3bMm68R6RWlBy+li6aytLM8YQlpjvQoUOm/bkf2hEMAViiUv
         td3irSc3sjMKIez+LLiIwAe0LLCc9/1dAQ/FnTIBNUp4LcfbXtsG3roKD1pywwv79xrG
         P/jvLWUGAITXPdYHz16+0XZLfb5q99b5udLTWwKuGchWN4MUS0fSkUD+3Ja3dPwjJAYZ
         OMVJkcDNolfci41dGwTP5jkDUP9wpzZ1CLXS+XuoFBCWyBLIwYOXfvSQfnJG40Dhm9/j
         Rg5oD/lzwxa59T0/GgkZgcQCWfQysIQlpa1JwEPETTP7tt7BYTztAS47Xrwz1TuehCEX
         uKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qonzyYXvvu1TU3IxZavApsjH9c4mi4mLrIVtVMRGXBg=;
        fh=zeD6BF/riwBaRfjtkoa0kHZC/qL8mFbk1qFwXYD+IXE=;
        b=f+S1SRuavoY/tkuRvJ5nUCWdKQr2b6HO3lkX6UDAVY9KTd9swY8ZnCpBuTG/vNfi88
         4bAikKxduoj6nJlkMhIOSv5H5UNynhKxHi7vSLQLFaWC2iqqOVxm2DNzT2S7uxdUFyta
         vX/9B6PcvEE2yTMrX2w71e1iJsnrHi5kgW1XL39m7R4j6BU12LgTbaCl+/CO0IrbZBAa
         7LFRec9fzT7rScI/p7EmbRIjpAAJC6zru5XFAiFj23ax4Uo0Q5MQ8TDhCk8o+GxPUUIO
         nSr1ezNcvlDr3KnXJo4Wgpm9+LinBkuTwV34XEK3mYZy2D1EVASfvRQvBpHNDeaU698n
         paug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BpalQWvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d14729si1295214885a.480.2025.03.18.19.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 19:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BpalQWvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuixk-0005F3-Hv; Tue, 18 Mar 2025 22:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuixa-0005Da-Cp
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 22:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuixY-00033c-Eb
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 22:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742350507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qonzyYXvvu1TU3IxZavApsjH9c4mi4mLrIVtVMRGXBg=;
 b=BpalQWvzE+88rU5XAK/Pxelb3FhXoTHkh6AOmel7eyukaFWW8/ke2/7AVdEgvTBmOQ3MRk
 HA37P140+tyHo2h8tFixMa+FFlJLPe1DbBGKFE9n7oj+ECUWB0GvcK0McbBgKkAqjVIsXA
 XqWXbqCmE/uVHXK7YH0fb73y2Z39D6U=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-BVXsuMDIPWKyxJ4FJh0OZw-1; Tue, 18 Mar 2025 22:15:04 -0400
X-MC-Unique: BVXsuMDIPWKyxJ4FJh0OZw-1
X-Mimecast-MFC-AGG-ID: BVXsuMDIPWKyxJ4FJh0OZw_1742350503
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85b4dc23f03so1496565139f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 19:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742350503; x=1742955303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qonzyYXvvu1TU3IxZavApsjH9c4mi4mLrIVtVMRGXBg=;
 b=TVtSjFPC2BjWrdsKfSf/gbph2mJ13ZhsYV302HdW5TttMEsjZvsf1c+QD0Y4nI1oZJ
 FOFvxF43/psh97mVUY1d13dcNGePmwcP0RhgDf9dcJe13PS1WQDPGVwP6O0zrjiWschF
 WvPq4PvKriC7qaNzoDD7WMZakeUFR9YTbI6Bkzsmf/TgRwg9SVyCq3GXR+KFOVaimwuI
 jRZGBMRWhNWsIPDBkcaSrT8+EMjhqp+Wo+x2M/s3a4IZYN2WrLsMwJsd1jagf42VbsBe
 JthThtR1ZVcz5iQ/QVWN/pfsrkuK/1Qzif6XL/Psywb8gYsncqTW4BM6odwCs5BCIHF7
 PHEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWrXmDV7bv4SOwjf66/FQ3S8ow58uXWDsjGnXAX9sDaYiTzAS9kVB+TzreP6tTD/onnyzYXUUbFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzn3+ZS8rHhjHc2BGQOOMp4sFkJmAWLkOiVm7LskJzly1u5wmuh
 JZVE4945h4ekkVRCXn4BxNOoum/oDE1uMREabPv4OK8yWUGypyI6IvhWis2Wp/NArtx51oW65cQ
 CYs86w1n1nMVuR5Gr5P8HBzQ1Jl3AqDNDHFfRFsiWa1z4q9UEkw==
X-Gm-Gg: ASbGncsjEHgASlLgheSF2HkT3r+QiSOCTdMyhZso9jwPX138iL3QvWv2bk8bAldr2vE
 Gh5xqDpn15OpFv8IIRrt8Yzwjc74jwt00swqhrtM2RVWx/WVRgMNxztx1I4AEjYyeyrPzRT2+74
 R1jV4PAvnq2TrjG9NdLFhcU9IljP/vGokeg3n68nmWMRSkiOZNsAA3+Dm3NM7JoZxZwebIxeuym
 8UbpEVwys8kMECIfEj5VeTOt36MSgjF2h1aUCS32qIdO6pVabKomcdgxNMGH88Eulw85mJqkiuq
 LuRgOwekAT1kmK/p
X-Received: by 2002:a05:6e02:188d:b0:3d0:4a82:3f43 with SMTP id
 e9e14a558f8ab-3d586b150f0mr11732135ab.5.1742350503494; 
 Tue, 18 Mar 2025 19:15:03 -0700 (PDT)
X-Received: by 2002:a05:6e02:188d:b0:3d0:4a82:3f43 with SMTP id
 e9e14a558f8ab-3d586b150f0mr11731835ab.5.1742350503124; 
 Tue, 18 Mar 2025 19:15:03 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a447ba8sm35796155ab.0.2025.03.18.19.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 19:15:02 -0700 (PDT)
Message-ID: <5dc1fcc4-a57d-4569-b86e-2e7cab7ed778@redhat.com>
Date: Tue, 18 Mar 2025 22:15:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
 <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
 <Z9nF6FaIU37BNg4B@Asurada-Nvidia>
 <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
 <20250319002325.GG9311@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250319002325.GG9311@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zaeWfNbMASx7HE05_5YyHTv1ISSBv-b-km92uWKZb2I_1742350503
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B6hrGeFcaTUT

Jason,
Hey!

On 3/18/25 8:23 PM, Jason Gunthorpe wrote:
> On Tue, Mar 18, 2025 at 05:22:51PM -0400, Donald Dutile wrote:
> 
>> I agree with Eric that 'accel' isn't needed -- this should be
>> ascertained from the pSMMU that a physical device is attached to.
> 
> I seem to remember the point was made that we don't actually know if
> accel is possible, or desired, especially in the case of hotplug.
> 
In the case of hw-passthrough hot-plug, what isn't known?:
a) domain:b:d.f is known
b) thus its hierarchy and SMMUv3 association in the host is known
c) thus, if the (accel) features of the SMMUv3 were exposed (known),
    then the proper setup (separate SMMUv3 vs system-wide-emulated SMMUv3;
    association of (allocated/configured) vSMMUv3 to pSMMUv3 would be known/made

What else is missing?

> The accelerated mode has a number of limitations that the software
> mode does not have. I think it does make sense that the user would
> deliberately choose to use a more restrictive operating mode and then
> would have to meet the requirements - eg by creating the required
> number and configuration of vSMMUs.
> 
At a qemu-cmd level, the right number & config of smmuv3's, but
libvirt, if it had the above info, could auto-generate the right number
of smmuv3's (stages, accel-features, etc.) ... just as it does today in
creating the right number of pcie bus's, RPs, etc. from simple(r)
device specs into more complete, qemu configs.

>> Now... how does vfio(?; why not qemu?) layer determine that? --
>> where are SMMUv3 'accel' features exposed either: a) in the device
>> struct (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't
>> find anything under either on my g-h system, but would appreciate a
>> ptr if there is.
> 
> I think it is not discoverable yet other thatn through
> try-and-fail. Discoverability would probably be some bits in an
> iommufd GET_INFO ioctl or something like that.
> 
I don't see how iommufd would 'get-info' the needed info any better
than any other interface/subsystem.  ...

>> and like Eric, although 'accel' is better than the
>> original 'nested', it's non-obvious what accel feature(s) are being
>> turned on, or not.
> 
> There are really only one accel feature - direct HW usage of the IO
> Page table in the guest (no shadowing).
> 
> A secondary addon would be direct HW usage of an invalidation queue in
> the guest.
> 
and, if architected correctly, even in (device-specific) sw-provided tables,
it could be 'formatted' in a way that it was discoverable by the appropriate layers
(libvirt, qemu).
Once discoverable, this whole separate accel device -- which is really an
attribute of an SMMUv3 -- can be generalized, and reduced, to a much
smaller, simpler, sw footprint, with the concept of callbacks (as the series
uses) to enable hw accelerators to perform the shadow-ops that fully-emulated
smmuv3 would have to do.
  
>> kernel boot-param will be needed; if in sysfs, a write to 0 an
>> enable(disable) it maybe an alternative as well.  Bottom line: we
>> need a way to (a) ascertain the accel feature (b) a way to disable
>> it when it is broken, so qemu's smmuv3 spec will 'just work'.
> 
> You'd turned it off by not asking qemu to use it, that is sort of the
> reasoning behind the command line opt in for accel or not.
It would make machine-level definitions far more portable if the
working/non-working, and the one-accel, or two-accel, or three-accel, or ...
features were dynamically determined  vs a static (qemu) machine config, that would have
to be manipulated each time it ran on a different machine.

e.g., cluster sw scans servers for machines with device-X.
       create VMs, assigning some/all of device-X to a VM via its own smmuv3. done.
       Now, if the smmuv3 features were exposed all the way up to userspace,
       then one could argue the cluster sw could scan for those features and add it
       to the accel=x,y,z option of the smmuv3 associated with an assigned device.
       potato/po-tah-toe cluster sw or libvirt or qemu or <something-else> scans/reads
        ... discoverability of the features has to be done by
       (a) a computer, or (b) an error-prone human.
      ... all that AI gone to waste ... ;-)

- Don

> 
> Jason
> 

