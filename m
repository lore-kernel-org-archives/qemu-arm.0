Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp276753njb;
        Tue, 26 Nov 2024 10:29:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrUdjw48pN8ocaKmPfjKEOMb/csmMOHrvjrBq5UHDVDcZhuWxcoxSr9HM7Y1YNgYeXL4pd4f6ZUqyOOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGy253vHjUCbPcF1ER+tkEz/bwSagA/6MDc6SOfsgEX1PoE9dy/Cah44tA8/vnNBMGfQ5TD
X-Received: by 2002:ac8:5ac5:0:b0:466:b189:2071 with SMTP id d75a77b69052e-466b366f913mr1915621cf.49.1732645766211;
        Tue, 26 Nov 2024 10:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732645766; cv=none;
        d=google.com; s=arc-20240605;
        b=C8BBdOzWsCWGylQ9cGGai612e7wBeGkfhrofj0baV+mfNkVO3znqLj7iN562+tWpSU
         PUEAAMPe58ZCq0llJgImZ3nJMg7APASZmcOSso3eQXh6wKsKYwXmEdFe0Re6dvzUSeNe
         U2/E7TOx7M28BYv/l8Ci7dxg5e3FvZsJwJsolvGeLzhNkfqOvdFWOej/Ye6pd6akSKRB
         HGN4Yjp/xjDc4W/u5/ZbIqHohZc9QXBmjJYYt/RCoFaWLm67v0WJwNCU0GxW7HssDvQQ
         4uIcVtbin9HFK8Y2/SX+Mvg94I22QPx3PAH7teeeEIZ8S71Kq+b5cDY2eMmQDo07mllX
         JDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bivVPrvJsSlIeKXx5xuqW/Iw6IJ0w3tXpdKLVPBaxJ8=;
        fh=8EUSUvFapp87yOo1NYmDl4IhmpkacN9cW/CkrjJGslI=;
        b=MFv3bs2dFH9W+zt7ee9jPbPdcyMLMf8ckSoxSTlpC5pIL/rJue0+OHDIjOVcS4jd8W
         iSRz4dXEAOIZLrcMDT6BkNon3YHPYBIw+68xvYeDwJSgMnjQ7zGXx+OIOokgmm3OfNNc
         7Qrfdb6I21MbzQjYdm1GEjjiDkB9H1+j0jvsgRs0rFeAFz9KDANBLCpiKT4ylrYqWBGs
         YfQLmiTWV1e7oe4I++z9JNwo/tIhUhrO2a1Iw54mR1xsgSIWq28KKOKfOm8aCriFFdL9
         eZm04e508imK0S8UwBt99mZ+h+Gr4huBeKhieI/4H7Gg5l5GxpgsCDpqYPj6hB4sVUfF
         uKxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OHSK/zA7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fe077c3si100103641cf.354.2024.11.26.10.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 10:29:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OHSK/zA7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tG0J6-0006Ba-84; Tue, 26 Nov 2024 13:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tG0J4-0006Aj-4d
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 13:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tG0J2-0003Ld-Aq
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 13:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732645738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bivVPrvJsSlIeKXx5xuqW/Iw6IJ0w3tXpdKLVPBaxJ8=;
 b=OHSK/zA7/RehUOcN4syWVWPcjyg2vFZpzenQCErIx6o/U8Gt4dlXZ1IlURCutOb9E/xKcN
 7C6/EuEKVy1crmxpE8Nxa+oi0Nfd6ZOhfl1PbMiR7mMpkGdUiHzNcSM+eNONA1bgrH/fKn
 VzFjbTjhWYZagKEG4MX2yIQVaHB5pj0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-LMyZPDExPROvSLDG3V4TFA-1; Tue, 26 Nov 2024 13:28:55 -0500
X-MC-Unique: LMyZPDExPROvSLDG3V4TFA-1
X-Mimecast-MFC-AGG-ID: LMyZPDExPROvSLDG3V4TFA
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-84181157edbso254526739f.2
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 10:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732645735; x=1733250535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bivVPrvJsSlIeKXx5xuqW/Iw6IJ0w3tXpdKLVPBaxJ8=;
 b=GDhMDlULVSDUwkNRj8/V1L/KWvwgRH4vvYOsajETMjD8jUBNwvron7/cMlutPZD6SE
 gNh1e3vrUOClr573ofqgtCHk9Y9aWm6TO5Etle410Xbdh1plGG8y1bzvWxwN0/qZ7rr3
 3U9GtG/Gz8d58pmTxbgpMolfxjRhMcriy8R4XkhpeGfSKOJKFez39xbdPasscRNjM7Zp
 aJ3wjTvpp2cmOhnHofVDhTHce54iPD8nL1qEX6xe7V2WAySPyxx3NEoGrtFIItRf4ydd
 NDXvL/SgCN4aijaBoI0YHT2CuMjWnTeg65+v3YYPT9VHx7U6trvEdqU1keOmIQibpLBa
 596w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYLLOwlXHUyC5TKJtd2i0vSHpoKtB9nY5g3V4ibsAb7q9ZxOZZ88Xev1kcK97Fbve6bPYfGRXP2A==@nongnu.org
X-Gm-Message-State: AOJu0YwJXXnKK3s4MeB3No1Sqir0knvQBlCj36t2RQjO+rj+Lx2kmEBV
 hqrvwwBlqdDo8vjIjLxqePecv1Ranz/PmgxMlGBIuTykH0uO4jb2UxcAZAZ/IQmaDRNpuz7voUq
 uNw3EuQsIa9ucpLDobKG17BoyKa4TQEZbMBdV9L/5BxvbqD+25Q==
X-Gm-Gg: ASbGncuRZI3gJ6IdMkxWENYPneiKXuZT5LTU1rUDpgIhGQqvqii7k3ouH5sPzFT/BkB
 EjYBToC0g/UcTX2daRlw28qIseIAQREXQ6xAay9HYrGUPj+up4gHouYf9Lev9hubDpAsI3S5Abf
 HeVDfVOKPpMb09H/RvP3QD7R1bJXmGVSuL2+Zziv5GzDKPiuMX5LyIWvYG42l2f7wsq3P2JkYaW
 k4jEdDbVf2x4kCpVbkkGRDYAjmAsInUB26Q24lk23l7EnL90sI=
X-Received: by 2002:a05:6602:6b85:b0:82d:9b0:ecb7 with SMTP id
 ca18e2360f4ac-843ecfa9533mr61545639f.3.1732645734799; 
 Tue, 26 Nov 2024 10:28:54 -0800 (PST)
X-Received: by 2002:a05:6602:6b85:b0:82d:9b0:ecb7 with SMTP id
 ca18e2360f4ac-843ecfa9533mr61536339f.3.1732645733432; 
 Tue, 26 Nov 2024 10:28:53 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e21031f7bdsm721640173.101.2024.11.26.10.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 10:28:52 -0800 (PST)
Message-ID: <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
Date: Tue, 26 Nov 2024 13:28:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: scX4ANX2EbUsPx2_p6dnwDlRcICz3oAEnzH8oHBI-pw_1732645735
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.931,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: tscW97P/34Ry



On 11/13/24 1:05 PM, Nicolin Chen wrote:
> Hi Eric,
> 
> On Wed, Nov 13, 2024 at 06:12:15PM +0100, Eric Auger wrote:
>> On 11/8/24 13:52, Shameer Kolothum wrote:
>>> @@ -181,6 +181,7 @@ static const MemMapEntry base_memmap[] = {
>>>       [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>>>       [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
>>>       [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>>> +    [VIRT_SMMU_NESTED] =        { 0x0b000000, 0x01000000 },
> 
>> I agree with Mostafa that the _NESTED terminology may not be the best
>> choice.
>> The motivation behind that multi-instance attempt, as introduced in
>> https://lore.kernel.org/all/ZEcT%2F7erkhHDaNvD@Asurada-Nvidia/
>> was:
>> - SMMUs with different feature bits
>> - support of VCMDQ HW extension for SMMU CMDQ
>> - need for separate S1 invalidation paths
>>
>> If I understand correctly this is mostly wanted for VCMDQ handling? if
>> this is correct we may indicate that somehow in the terminology.
>>
>> If I understand correctly VCMDQ terminology is NVidia specific while
>> ECMDQ is the baseline (?).
> 
> VCMDQ makes a multi-vSMMU-instance design a hard requirement, yet
> the point (3) for separate invalidation paths also matters. Jason
> suggested VMM in base case to create multi vSMMU instances as the
> kernel doc mentioned here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/userspace-api/iommufd.rst#n84
> 
> W.r.t naming, maybe something related to "hardware-accelerated"?
> 
Given that 'accel' has been used for hw-acceleration elsewhere, that seems like a reasonable 'mode'.
But, it needs a paramater to state was is being accelerated.
i.e., the more global 'accel=kvm' has 'kvm'.

For SMMUv3, NVIDIA-specific vCMDQ, it needs a parameter to state that specifically,
since I'm concluding from reading the SMMUv3 version G.a spec, that ECMDQ was added
to be able to assign an ECMDQ to a VM, and let the VM do CMDQ driven invalidations via
a similar mechanism as assigned PCI-device mmio space in a VM.
So, how should the QEMU invocation select what parts to 'accel' in the vSMMUv3 given
to the VM?  ... and given the history of hw-based, virt-acceleration, I can only guess
more SMMUv3 accel tweaks will be found/desired/implemented.

So, given there is an NVIDIA-specific/like ECMDQ, but different, the accel parameter
chosen has to consider 'name-space collision', i.e., accel=nv-vcmdq  and accel=ecmdq,
unless sw can be made to smartly probe and determine the underlying diffs, and have
equivalent functionality, in which case, a simpler 'accel=vcmdq' could be used.

Finally, wrt libvirt, how does it know/tell what can and should be used?
For ECMDQ, something under sysfs for an SMMUv3 could expose its presence/capability/availability
(tag for use/alloc'd for a VM), or an ioctl/cdev i/f to the SMMUv3.

But how does one know today that there's NVIDIA-vCMDQ support on its SMMUv3? -- is it
exposed in sysfs, ioctl, cdev?
... and all needs to be per-instance ....
... libvirt  (or any other VMM orchestrator) will need to determine compatibility for
     live migration. e.g., can one live migrate an accel=nv-vcmdq-based VM to a host with
     accel=ecmdq support?  only nv-vcmdq?  what if there are version diffs of nv-vcmdq over time?
     -- apologies, but I don't know the minute details of nv-vcmdq to determine if that's unlikely or not.

Once the qemu-smmuv3-api is defined, with the recognition of what libvirt (or any other VMM) needs to probe/check/use for hw-accelerated features,
I think it'll be more straight-fwd to implement, and (clearly) understand from a qemu command line. :)

Thanks,
- Don

> Thanks
> Nicolin
> 

