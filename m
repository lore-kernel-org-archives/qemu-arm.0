Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp80782lfk;
        Wed, 10 Nov 2021 03:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFeCmCpy3yPqSLsJwmGhdae68LEdGMvmNu2WVNTkPwaGhMuFab0voqqn+yWJWVKAi0WQc9
X-Received: by 2002:a67:b005:: with SMTP id z5mr125391785vse.59.1636542096711;
        Wed, 10 Nov 2021 03:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636542096; cv=none;
        d=google.com; s=arc-20160816;
        b=glqKjk7w6Z0oM9g4xA9wSCQk0afL1ztsKBTVGaDu8vg2VnwuaZ8qQvP0lZRtBaWP2d
         G7d7XHQZiElSLa3IUIAdXGwNLQIU3vGbry1AuSIbe082DQfpY/NHPksj6oIll4rMcp3N
         CURXjDM6nn/QceNDIroSSTo4ub2d5mwnMBdFxAkgKZl5tz40wWjaCzLwTsf09OWIlj7I
         SbtPyAMAne6uVc2OcAEficB6p67CpH1giWi0Fm9D68YuJq4ED6Z+4PkCpZq5EEPxtFaw
         y7IouUWhKrPZJeYqiYzT8oUawOvcCtcP9wHUeXZH4u7opyyBTgvhJnHsH2Ro8RuNtn3o
         lVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=By35jQDKBIMNSKPBBnDsXGLHQNRWj1/ligZlNiHiYb8=;
        b=AnWQ2a7XuCkp0U6jAKfIlzHamb2gTC00smaaHsmbuaWy0IDi6kXcLsYAHkB+kYpLDr
         0l6KXfWoBxMEyHRBBJuivFaNqrAlJQvR2py/j4lg/DcfQMFIYK8/LqPVipxuz1b//7+d
         Ds49Ce57M7Sx5vEWtnYSUljAMvh1FsnAfjBKfQ3ZKNMPHCKg0OQS3V8+Ne94jPAYtr3w
         HC8jPrYvayfLbTQm2ELyUM6qcbEnkLIccgXJhoRAa+u8gE4p1bbJZQAv8YevNsjBAOXD
         /2K+g3MlFMMAIERgfU4C3hiabWm4NPLV3DanoCj70hGkYaTkGAUwyrCd1Mgu2N/BaE8p
         SV6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXyNOmf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y27si25084930vsi.180.2021.11.10.03.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Nov 2021 03:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXyNOmf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mklMG-0007Rp-1J
	for alex.bennee@linaro.org; Wed, 10 Nov 2021 06:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mklM5-0007RY-9e
 for qemu-arm@nongnu.org; Wed, 10 Nov 2021 06:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mklLy-0002jE-1r
 for qemu-arm@nongnu.org; Wed, 10 Nov 2021 06:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636542076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=By35jQDKBIMNSKPBBnDsXGLHQNRWj1/ligZlNiHiYb8=;
 b=HXyNOmf5sZZT2ovyf7kGG0sxsCv49+Wcml2Bhit5eLrMt82x3j0apR1hI+I8bZZXQNRrto
 6NOg/2/H8vozDzZ1WIvymyNit3fnt6OViZoMFxFYIMYw2+SNM71vl1JlY+PpNAmKSZ9/rw
 hurk0qFgn65SxXsQvx1YeD/j/Zi3Agc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-c7Zb_ZAsOiukVKAAv2Sn-g-1; Wed, 10 Nov 2021 06:01:15 -0500
X-MC-Unique: c7Zb_ZAsOiukVKAAv2Sn-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so948478wmb.3
 for <qemu-arm@nongnu.org>; Wed, 10 Nov 2021 03:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=By35jQDKBIMNSKPBBnDsXGLHQNRWj1/ligZlNiHiYb8=;
 b=GugcH860oK7mIFQx3OcYd1sV8BQY0mWzYiYz8VojIghzDaqoLjEN6ltPsMRrUrgvnt
 iUEMQxxtVvSacyjReSmftlEpXGorW+5ukNwUP8GHyxGXbE0DxMxV4fEZoUkQOG2LyD52
 Lv3S0OfolN50qbAadd79QkDjo6ddqQ3ksghhhhwzDYNqs9E7E1QVWCxPn8yRr7phg9HW
 3dURTMR00bvlFJaxN5rCkHZblyZc6YrWuknJMb00PLGEDZaIZUZJnk7FIFwCJjoOIt/i
 u2JywfeZBQ67oxiyEYKjsV1rKbnbhaE1wtQ1jRxXBV6qQysmjK2suO4VMcOEOlofkakN
 WUaA==
X-Gm-Message-State: AOAM533Q8LYyu9n33lpnn7W6R8LS28QH0V2wnHuu9737lRD/g9rvKAe5
 03zxgIlW8ufBk8sxcIE5nvtePV2OWWggsj16EXNNbVPESz3cNHG1UKVvzhR35Yy0KyjmjEuOl7t
 cAUAtUv8g3ooW
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr14946077wmq.123.1636542074289; 
 Wed, 10 Nov 2021 03:01:14 -0800 (PST)
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr14946034wmq.123.1636542074007; 
 Wed, 10 Nov 2021 03:01:14 -0800 (PST)
Received: from [192.168.3.132] (p5b0c604f.dip0.t-ipconnect.de. [91.12.96.79])
 by smtp.gmail.com with ESMTPSA id
 l7sm28754058wry.86.2021.11.10.03.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:01:12 -0800 (PST)
Message-ID: <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
Date: Wed, 10 Nov 2021 12:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Igor Mammedov <imammedo@redhat.com>, Gavin Shan <gshan@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211110113304.2d713d4a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 ehabkost@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gYlulosKZ4VY

On 10.11.21 11:33, Igor Mammedov wrote:
> On Fri, 5 Nov 2021 23:47:37 +1100
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Hi Drew and Igor,
>>
>> On 11/2/21 6:39 PM, Andrew Jones wrote:
>>> On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:  
>>>>
>>>> Yeah, I agree. I don't have strong sense to expose these empty nodes
>>>> for now. Please ignore the patch.
>>>>  
>>>
>>> So were describing empty numa nodes on the command line ever a reasonable
>>> thing to do? What happens on x86 machine types when describing empty numa
>>> nodes? I'm starting to think that the solution all along was just to
>>> error out when a numa node has memory size = 0...
> 
> memory less nodes are fine as long as there is another type of device
> that describes  a node (apic/gic/...).
> But there is no way in spec to describe completely empty nodes,
> and I dislike adding out of spec entries just to fake an empty node.
> 

There are reasonable *upcoming* use cases for initially completely empty
NUMA nodes with virtio-mem: being able to expose a dynamic amount of
performance-differentiated memory to a VM. I don't know of any existing
use cases that would require that as of now.

Examples include exposing HBM or PMEM to the VM. Just like on real HW,
this memory is exposed via cpu-less, special nodes. In contrast to real
HW, the memory is hotplugged later (I don't think HW supports hotplug
like that yet, but it might just be a matter of time).

The same should be true when using DIMMs instead of virtio-mem in this
example.

> 
>> Sorry for the delay as I spent a few days looking into linux virtio-mem
>> driver. I'm afraid we still need this patch for ARM64. I don't think x86
> 
> does it behave the same way is using pc-dimm hotplug instead of virtio-mem?
> 
> CCing David
> as it might be virtio-mem issue.

Can someone share the details why it's a problem on arm64 but not on
x86-64? I assume this really only applies when having a dedicated, empty
node -- correct?

> 
> PS:
> maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
> and describe it as PCI device (we don't do that yet if I'm no mistaken).

virtio-mem exposes the PXM itself, and avoids exposing it memory via any
kind of platform specific firmware maps. The PXM gets translated in the
guest accordingly. For now there was no need to expose this in SRAT --
the SRAT is really only used to expose the maximum possible PFN to the
VM, just like it would have to be used to expose "this is a possible node".

Of course, we could use any other paravirtualized interface to expose
both information. For example, on s390x, I'll have to introduce a new
hypercall to query the "device memory region" to detect the maximum
possible PFN, because existing interfaces don't allow for that. For now
we're ruinning SRAT to expose "maximum possible PFN" simply because it's
easy to re-use.

But I assume that hotplugging a DIMM to an empty node will have similar
issues on arm64.

> 
>> has this issue even though I didn't experiment on X86. For example, I
>> have the following command lines. The hot added memory is put into node#0
>> instead of node#2, which is wrong.

I assume Linux will always fallback to node 0 if node X is not possible
when translating the PXM.

-- 
Thanks,

David / dhildenb

