Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1113386lfk;
        Wed, 17 Nov 2021 10:27:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpOyAj8UkdkDnJ0Tj9fu/gODHJ/ctGdRlIJL7r7Nv9DVarQZqeqvdm5JkAiZltKFzxsKQ6
X-Received: by 2002:a1f:a3ca:: with SMTP id m193mr90817732vke.4.1637173642462;
        Wed, 17 Nov 2021 10:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637173642; cv=none;
        d=google.com; s=arc-20160816;
        b=FYXLOH4rEbhXbVeLRH/bcgZOXfMzk+1uel92Tm22UIC20L3cMImXtZ/aNyU5kN3byJ
         GZy+hA69tC2Z4Kh4rBStF047XrJNU5H5X8ulU6L8GwtmbxbT//nFwNyJ7A1vz6/e3aqr
         P1f40BYR4DP6JTx6OJZNmfZXwIYQLsLjmqsnfBU4jZzSuYljZM+nGq8+vcQ/2jkd8nwA
         Jr/QFxkbidt4It5Sf4R7oAV4/OXQeqUwy0PLgkJPcQ4VAvExKgnnhR66GUgpCTQdiFAb
         NR7kGC8i0rfhjEKdNc3WhZ7QuhhUC69vl/6RzOEqnMuySDHWG8gFCVDMNyv2a38cb6jt
         3JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Yx3erGkbgf2c8Sm+xNDYAPLJRAbN/TckQ2bVLRRVkZw=;
        b=cdpVAiQosFjxmGIWFq8MaUSFztoENjPhV0iIyHrmnppcb6o/s8MuQXOdIpcDgqnxQJ
         TI2z4zzu0YnyrkSucMabFevAXXuBDMXmsTSIfoUbLG+rmj0EvS7BadlZU/gO1Rfmpc82
         xAXtG6aMcuhkwecJlRLN7euALa3leWdpOAMMUEgJ8gbXIij0Y5E7E7Bp9jDK4vr4r+nX
         jNhDd2pk9G8vCNHTyELp4eo0WcFRZnL+ZCwik6kZeEEO/HiSCZaOc/+ZFbPfNztshKYg
         RiA0SR4yBGiVuSeV1vu/5XhB2o6uvff3SRGAGTy3pUZjMQ2aam6VbZS00mYrBJM5LSoo
         VwhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rt62ZdeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a190si1059305vkh.22.2021.11.17.10.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 10:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rt62ZdeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnPeT-0002oC-PZ
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 13:27:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPe7-0002mt-Ak
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 13:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPdv-00076B-Fp
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 13:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637173604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yx3erGkbgf2c8Sm+xNDYAPLJRAbN/TckQ2bVLRRVkZw=;
 b=Rt62ZdeF8ANj5ZOlKkAh/HKqPNqCA9OdS8zDMosoaKgaYgBJEhymIb7c7ykceVzMH8QUEY
 y4aoqoTjWVPWa4NrWPpvOz3RofZmmmNj7FnGTfD4nbqZYext9jAGfh2WdcJx8C6WBu5N21
 cn6vjxiXW2/KBnztimQHM11Iq7BSdcY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-ZS9cxh7eN8ei37czTG-3JA-1; Wed, 17 Nov 2021 13:26:42 -0500
X-MC-Unique: ZS9cxh7eN8ei37czTG-3JA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1808588wmq.9
 for <qemu-arm@nongnu.org>; Wed, 17 Nov 2021 10:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Yx3erGkbgf2c8Sm+xNDYAPLJRAbN/TckQ2bVLRRVkZw=;
 b=gBny9LrDaCFel6a6pbC1GdnFTvOS6LYzPYuWqeUidb6cEMM3U1A8jcCxpLCmvdJulx
 61G6zB83KODxAeblFzn6QbMIOnHDkARVgdDV4JXK9OGrD8frdA1ErpZXbtTGTBUYnzI+
 0ONNAQHjhXSQDOFd7wupVpVnhLXDHws0YGxT+FnUxVppF24dK6dEvyKU99hjKu58nf4F
 F+mqGvJT5h5HH33tApiBCL8yTIv3f+vioh424IgCJ9zp7qIw8wqZsTgtG7ZOf1TnzTxS
 +qpX8bNDp2V62yJfClnd7kXvpFwWAEZxhLuYypPjgZwXtXaV4+rzxQwneTxCZemTW+7G
 H2PA==
X-Gm-Message-State: AOAM533cCy0QKk0ZoSNnbk1tOd4IcYxrGtQ3ySg6w/K+NScOPglRTR8h
 U2/rKDYs44v98ho4eHFt9TSGk+JfA0HzWPtke2JSg/H1E1VVU2e4KTFYnC49VWWk6fO5bCqpbIi
 NaWXn+mm7bJiS
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr22802641wrw.104.1637173601726; 
 Wed, 17 Nov 2021 10:26:41 -0800 (PST)
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr22802596wrw.104.1637173601487; 
 Wed, 17 Nov 2021 10:26:41 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6882.dip0.t-ipconnect.de. [91.12.104.130])
 by smtp.gmail.com with ESMTPSA id e3sm579086wrp.8.2021.11.17.10.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 10:26:41 -0800 (PST)
Message-ID: <4dfd5b40-df90-6987-d2e9-0d39b7d6a0a3@redhat.com>
Date: Wed, 17 Nov 2021 19:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Igor Mammedov <imammedo@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211112142751.4807ab50@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3u4TvJwjtZpi

On 12.11.21 14:27, Igor Mammedov wrote:
> On Wed, 10 Nov 2021 12:01:11 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 10.11.21 11:33, Igor Mammedov wrote:
>>> On Fri, 5 Nov 2021 23:47:37 +1100
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>   
>>>> Hi Drew and Igor,
>>>>
>>>> On 11/2/21 6:39 PM, Andrew Jones wrote:  
>>>>> On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:    
>>>>>>
>>>>>> Yeah, I agree. I don't have strong sense to expose these empty nodes
>>>>>> for now. Please ignore the patch.
>>>>>>    
>>>>>
>>>>> So were describing empty numa nodes on the command line ever a reasonable
>>>>> thing to do? What happens on x86 machine types when describing empty numa
>>>>> nodes? I'm starting to think that the solution all along was just to
>>>>> error out when a numa node has memory size = 0...  
>>>
>>> memory less nodes are fine as long as there is another type of device
>>> that describes  a node (apic/gic/...).
>>> But there is no way in spec to describe completely empty nodes,
>>> and I dislike adding out of spec entries just to fake an empty node.
>>>   
>>
>> There are reasonable *upcoming* use cases for initially completely empty
>> NUMA nodes with virtio-mem: being able to expose a dynamic amount of
>> performance-differentiated memory to a VM. I don't know of any existing
>> use cases that would require that as of now.
>>
>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>> this memory is exposed via cpu-less, special nodes. In contrast to real
>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>> like that yet, but it might just be a matter of time).
> 
> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
> some by MEMORY entries. Or nodes created dynamically like with normal
> hotplug memory.
> 
> 
>> The same should be true when using DIMMs instead of virtio-mem in this
>> example.
>>
>>>   
>>>> Sorry for the delay as I spent a few days looking into linux virtio-mem
>>>> driver. I'm afraid we still need this patch for ARM64. I don't think x86  
>>>
>>> does it behave the same way is using pc-dimm hotplug instead of virtio-mem?
>>>
>>> CCing David
>>> as it might be virtio-mem issue.  
>>
>> Can someone share the details why it's a problem on arm64 but not on
>> x86-64? I assume this really only applies when having a dedicated, empty
>> node -- correct?
>>
>>>
>>> PS:
>>> maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
>>> and describe it as PCI device (we don't do that yet if I'm no mistaken).  
>>
>> virtio-mem exposes the PXM itself, and avoids exposing it memory via any
>> kind of platform specific firmware maps. The PXM gets translated in the
>> guest accordingly. For now there was no need to expose this in SRAT --
>> the SRAT is really only used to expose the maximum possible PFN to the
>> VM, just like it would have to be used to expose "this is a possible node".
>>
>> Of course, we could use any other paravirtualized interface to expose
>> both information. For example, on s390x, I'll have to introduce a new
>> hypercall to query the "device memory region" to detect the maximum
>> possible PFN, because existing interfaces don't allow for that. For now
>> we're ruinning SRAT to expose "maximum possible PFN" simply because it's
>> easy to re-use.
>>
>> But I assume that hotplugging a DIMM to an empty node will have similar
>> issues on arm64.
>>
>>>   
>>>> has this issue even though I didn't experiment on X86. For example, I
>>>> have the following command lines. The hot added memory is put into node#0
>>>> instead of node#2, which is wrong.  
>>
>> I assume Linux will always fallback to node 0 if node X is not possible
>> when translating the PXM.
> 
> I tested how x86 behaves, with pc-dimm, and it seems that
> fc43 guest works only sometimes.
> cmd:
>   -numa node,memdev=mem,cpus=0 -numa node,cpus=1 -numa node -numa node
> 
> 1: hotplug into the empty last node creates a new node dynamically 
> 2: hotplug into intermediate empty node (last-1) is broken, memory goes into the first node

See my other reply: Reason is that we (QEMU) indicate all hotpluggable
memory as belonging to the last NUMA node. When processing that SRAT
entry, Linux maps that PXM to an actual node.

-- 
Thanks,

David / dhildenb

