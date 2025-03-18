Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3217799njb;
        Tue, 18 Mar 2025 14:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9PfqbQRkhHmmkIU+xAU2ScDof/k+Uk/QI1Cpc+/Ge1h6yiSqAehosDWy4wb7+SMY5dT4/z7TdD3xxvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHZR2gQK0zp3dk1yGOnhoNJUZLjhYCx56mQ+Ur+2j+SQ4cF5d+WCH9wkO+CXOntM51Dc8FT
X-Received: by 2002:a05:622a:1b94:b0:476:7d74:dd06 with SMTP id d75a77b69052e-477083a20a5mr6649431cf.51.1742333029732;
        Tue, 18 Mar 2025 14:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742333029; cv=none;
        d=google.com; s=arc-20240605;
        b=fazENbbMg99FQLoQnVAOztzwteRf9YJV2JxOY4wqCZiaUUu4Z7bnTiGOIwBQ16yYp9
         G8D5cLhDOmN3p7khxTW/ujPvCMkeKuXuR5ejeH5Oqukhl7yPHjBG8uu8YgJW7zkBqPgl
         EBkRwVwlZHpemay/AI1CVzG54POvJzoNIaW2qzq4IyAwyKh2LtKuz7/KP4mApFmEIJ5a
         kvwLgPc0VfQfE3hEIiQ1Q4v+YcURa95MFaHV0lTcRU/nc4zZivMjQB0AGDGBOPa//Hgi
         Hbu3GW3UgwtNbBZG9GB4/rRHJOFurSZDoNUxKE13tXBd2xhwacbjrzqyAh0/WzbtBAOe
         T2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aIHMvr7swYGcIj3kvWaTE+mkZ1Ye9htvacqmYNN0ZWY=;
        fh=SllmA+N0RgOve2Pn/SuLd0bDj9ve8yWIZrZBC6hX39s=;
        b=Me+G3ClOZ50k1IeRPlB8jY/onFzE2jYRQGnYy/Gkp4qHaHn3Ghd6PSRzO66XgWcSUA
         7dCpMmSByFDNAqwPYRZW7wvDwcRgOYyj53MZQ1lcs0GPjIytYC3K1IjSD3hkbzQASnQU
         KA3jRe1OTq9ldeGF9sv1dmU4eKGzDWGPxl6sBpkZ6ezWkLFEmJT3LosffDYOf1Yw3s6b
         PXr4PiY/cgdvStQi5x4cOTEwvUw694Szpq+6Lpr8NN58bsLH7zN+CO6saHJ8K0kMqMFr
         xUFhJFY2UBTkNunYSe8X7nYYYc7Jb1hA5UvcFjeMGJ/uXdbPg2j6UXbSHgAO6DFH3PBA
         kkeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AWgHFKdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7d9e74si136626501cf.277.2025.03.18.14.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 14:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AWgHFKdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuePW-0007Yc-3J; Tue, 18 Mar 2025 17:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tueOt-0007Kh-Mx
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 17:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tueOr-0005yD-RR
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 17:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742332976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIHMvr7swYGcIj3kvWaTE+mkZ1Ye9htvacqmYNN0ZWY=;
 b=AWgHFKdPakw2RwGIfqAL7lkTvqj+nUrFsPTQ5toBga2u2T4XV/XV/7imuZludu4tTV0pDL
 Czn+QAWcJI6V2zsOsE729LD50r8/CrwFceqHGw1XzeXsozGSIUFZX1ynKy/vf8up9skZs0
 MgsVwsxEAJehPOEOH0dVDWqNBUfx7gI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-oeQQKhNxNj6bYJE9ZOx5PA-1; Tue, 18 Mar 2025 17:22:55 -0400
X-MC-Unique: oeQQKhNxNj6bYJE9ZOx5PA-1
X-Mimecast-MFC-AGG-ID: oeQQKhNxNj6bYJE9ZOx5PA_1742332974
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85b3a62e3e5so1131128339f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 14:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742332974; x=1742937774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIHMvr7swYGcIj3kvWaTE+mkZ1Ye9htvacqmYNN0ZWY=;
 b=R5+PedXEmyu2hs0iGlD5AsFtOGIUkeFEZwpi9Vt5uXMSZ0IfP7EeTtiADDgsdRdzgE
 ocZIR1aHowAxI/l+aAV02tTsZYateJ8/VukARkVNTaxKj1m/ormQ93XfTFmdh4KLcTXR
 WqShm6tMi8RCyseah7mt45HMXTSOAOmfZXd3Pmj1+MhLpPPSgoYb/qdOuZtweOxFn91+
 JdzRVzn3YudQ8bMw7EsQsd3zls1PsTh1YhizzbA/yAHN++DpFUqBR3G1QFJjstfzHig7
 mdSJMa0OG10VhL/5XCvPyiToQmVlpgZfq6K6Wyc9gXK1mi6i7xXrPEPZ1I85mSmvgcJQ
 bELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpQAge5oJw19lERH1UqUyvwzaCm4uZEsY/X23qL4k5PXYbRgPlHnbG4vbLyrR4Qj7o+16oFjS+gw==@nongnu.org
X-Gm-Message-State: AOJu0YzFVkVxXehf1dfmL6Xb/xpns9nJGkk6Bd2iD37SgoI/sg4TpZjW
 yUrBw7EnXVuvrhHNRQgZSSO/yKFqpdj688oK1hTXtZMPb4Corz2S07n+fFq934xLlH5w5caoK+K
 UgBolUfqqw36TkBDqnh2Dz4s1XV3zosQVuGX4N2ucEOhkHUKGKA==
X-Gm-Gg: ASbGncuEt1UHQQoVZspszoG41yUbqBrOLGAs6OJxVZ3yLInL8j1e951oV6ewJ9Gkp5R
 DtC+By2mdGbfq1XDlY4KaxgFoXO3T+bVLS0hk0zsmfyvE6TDC/VN62ksdBToAJap3VhYxhEGZFc
 z3mEoa7y+R3e/vkhpjFiGntr0c6cHnYrhydRMC6omzy+gYz/ze68+hktAduqwGLRV9J8xrdbMUm
 qntRJcPoYjdNmJ65bWP0axgsKdLpewmL3ncwxHyDe8/Jkk5MK1+RxZqL20pFIAMB12eCTWtsf/6
 d8ulwZZTQ68GSSOB
X-Received: by 2002:a05:6e02:1b0c:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d586b5a5e6mr3869075ab.13.1742332974254; 
 Tue, 18 Mar 2025 14:22:54 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b0c:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d586b5a5e6mr3868765ab.13.1742332973911; 
 Tue, 18 Mar 2025 14:22:53 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f26372760asm2891455173.67.2025.03.18.14.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 14:22:53 -0700 (PDT)
Message-ID: <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
Date: Tue, 18 Mar 2025 17:22:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
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
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <Z9nF6FaIU37BNg4B@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pHkWhHkuz8a_c7Hu9rlIw-daCA1gzU1DoTTrFQ3CYO8_1742332974
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
X-TUID: UO+kqIljWEZi



On 3/18/25 3:13 PM, Nicolin Chen wrote:
> On Tue, Mar 18, 2025 at 07:31:36PM +0100, Eric Auger wrote:
>> On 3/17/25 9:19 PM, Nicolin Chen wrote:
>>> On Mon, Mar 17, 2025 at 04:24:53PM -0300, Jason Gunthorpe wrote:
>>>> On Mon, Mar 17, 2025 at 12:10:19PM -0700, Nicolin Chen wrote:
>>>>> Another question: how does an emulated device work with a vSMMUv3?
>>>>> I could imagine that all the accel steps would be bypassed since
>>>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>>>> so we will need to flush the iotlb, which will increase complexity
>>>>> as the TLBI command dispatching function will need to be aware what
>>>>> ASID is for emulated device and what is for vfio device..
>>>> I think you should block it. We already expect different vSMMU's
>>>> depending on the physical SMMU under the PCI device, it makes sense
>>>> that a SW VFIO device would have it's own, non-accelerated, vSMMU
>>>> model in the guest.
>>> Yea, I agree and it'd be cleaner for an implementation separating
>>> them.
>>>
>>> In my mind, the general idea of "accel=on" is also to keep things
>>> in a more efficient way: passthrough devices go to HW-accelerated
>>> vSMMUs (separated PCIE buses), while emulated ones go to a vSMMU-
>>> bypassed (PCIE0).
> 
>> Originally a specific SMMU device was needed to opt in for MSI reserved
>> region ACPI IORT description which are not needed if you don't rely on
>> S1+S2. However if we don't rely on this trick this was not even needed
>> with legacy integration
>> (https://patchwork.kernel.org/project/qemu-devel/cover/20180921081819.9203-1-eric.auger@redhat.com/).
>>
>> Nevertheless I don't think anything prevents the acceleration granted
>> device from also working with virtio/vhost devices for instance unless
>> you unplug the existing infra. The translation and invalidation just
>> should use different control paths (explicit translation requests,
>> invalidation notifications towards vhost, ...).
> 
> smmuv3_translate() is per sdev, so it's easy.
> 
> Invalidation is done via commands, which could be tricky:
> a) Broadcast command
> b) ASID validation -- we'll need to keep track of a list of ASIDs
>     for vfio device to compare the ASID in each per-ASID command,
>     potentially by trapping all CFGI_CD(_ALL) commands? Note that
>     each vfio device may have multiple ASIDs (for multiple CDs).
> Either a or b above will have some validation efficiency impact.
> 
>> Again, what does legitimate to have different qemu devices for the same
>> IP? I understand that it simplifies the implementation but I am not sure
>> this is a good reason. Nevertheless it worth challenging. What is the
>> plan for intel iommu? Will we have 2 devices, the legacy device and one
>> for nested?
> 
> Hmm, it seems that there are two different topics:
> 1. Use one SMMU device model (source code file; "iommu=" string)
>     for both an emulated vSMMU and an HW-accelerated vSMMU.
> 2. Allow one vSMMU instance to work with both an emulated device
>     and a passthrough device.
> And I get that you want both 1 and 2.
> 
> I'm totally okay with 1, yet see no compelling benefit from 2 for
> the increased complexity in the invalidation routine.
> 
> And another question about the mixed device attachment. Let's say
> we have in the host:
>    VFIO passthrough dev0 -> pSMMU0
>    VFIO passthrough dev1 -> pSMMU1
> Should we allow emulated devices to be flexibly plugged?
>    dev0 -> vSMMU0 /* Hard requirement */
>    dev1 -> vSMMU1 /* Hard requirement */
>    emu0 -> vSMMU0 /* Soft requirement; can be vSMMU1 also */
>    emu1 -> vSMMU1 /* Soft requirement; can be vSMMU0 also */
> 
> Thanks
> Nicolin
> 
I agree w/Jason & Nicolin: different vSMMUs for pass-through devices than emulated, & vice-versa.
Not mixing... because... of the next agreement:

I agree with Eric that 'accel' isn't needed -- this should be ascertained from the pSMMU that a physical device is attached to.
Now... how does vfio(?; why not qemu?) layer determine that? -- where are SMMUv3 'accel' features exposed either: a) in the device struct (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't find anything under either on my g-h system, but would appreciate a ptr if there is.
and like Eric, although 'accel' is better than the original 'nested', it's non-obvious what accel feature(s) are being turned on, or not.
In fact, if broken accel hw occurs ('if' -> 'when'), how should it be turned off? ... if info in the kernel, a kernel boot-param will be needed;
if in sysfs, a write to 0 an enable(disable) it maybe an alternative as well.
Bottom line: we need a way to (a) ascertain the accel feature (b) a way to disable it when it is broken,
so qemu's smmuv3 spec will 'just work'.
[This may also help when migrating from a machine that has accel working to one that does not.[

... and when an emulated device is assigned a vSMMU, there are no accel features ... unless we have tunables like batch iotlb invalidation for perf reasons, which can be viewed as an 'accel' option.

