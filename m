Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp594368lfp;
        Fri, 7 Feb 2020 05:45:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKeDRr9ZAGlqF2rEEDAHN5I5k3HNLn6c3IDn3w3kjOVblKIVdEv7SHKLrNxoKW++umRVnC
X-Received: by 2002:ac8:7396:: with SMTP id t22mr7460805qtp.269.1581083146142;
        Fri, 07 Feb 2020 05:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581083146; cv=none;
        d=google.com; s=arc-20160816;
        b=DpkHssE0YLDMjAivv84ThP/cnhGLKUpa6Uryd4tVqBWWAZvlnVbDzNtmBE45rlHdSA
         80waAdCx73tFTEmb2UShOiMTOi6kbnfa//ThyCUi3I0zEhZOTZ7l4kyjruejWlCKBEi6
         YcP07HrbmK6FG7PKvWe9GEQKG4gpOukcYG5hmjpOmF+hLlcqmIRhoiEgRXsD2czh7CvS
         j7ZsXRABrYbpMTj0FAKDiZRpmFd3VEBpdBYNLDv3Fo+dXXaihrSEX85HtW6uLJO4OT8F
         qkC0dO0L0YeSmUqyzMdcRGo3+vbI7kgvD6hpFwLhB0Ti4A60ou6XCrmttwJxX4jXzLzI
         JY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=8XgyTsxG+pQRaOX6DjawSDaOXNBlKSyo7eZKb89YL5M=;
        b=jKa3bev86rya7KqmhnHkid7BTs5Oz3AZkbsmbuJ6AJCb6wfHeevREvIbx3wmTJtx6N
         pho1mmiVJI+WiPoPBW9YGGWWFAMKwzpuB3icoOs/jU/KfpE98CnrG+hJlbWu4Pl7c/eM
         Ws/US8Zjq8ewy9jqbNTHh8yPu4qWtS+CfZwyEcwxr+l1eX/E7I0Q9/QEnndrsmz/mbgj
         gXYJhskopDrvMPWpRyTR7tp6y2ZKNIntfv5B3ZtWCS3YzYOCml0MSHQCfc/hyxPKXxli
         WqDSerS4EaNPmwEMbYBinOE/py9MjZn4UOPCfujyo8+2/ZlGp8R9p4h90uc08P4SGb6c
         Lwmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si1236805qvp.52.2020.02.07.05.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03x3-0007Zh-IH
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1j03wo-0007ZG-W1
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:45:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1j03wn-00057d-CF
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:45:30 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2758 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1j03wm-0004l0-Uo; Fri, 07 Feb 2020 08:45:29 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 202298598E8A1BE03C7A;
 Fri,  7 Feb 2020 21:45:23 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 7 Feb 2020 21:45:13 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
 <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
 <f8394aafb2adb513186cd2784a1cb077@kernel.org>
 <58519c6b-5c0e-b557-ac91-2024c594b28c@arm.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <0e727390-0ed9-0346-aa3b-dc983afd443d@huawei.com>
Date: Fri, 7 Feb 2020 21:45:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <58519c6b-5c0e-b557-ac91-2024c594b28c@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.228]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo
 Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com, Dave
 Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgtZ3c51WL+h


On 2020/2/7 18:52, James Morse wrote:
> Hi guys,
>
> On 06/02/2020 17:30, Marc Zyngier wrote:
>> On 2020-02-06 01:20, Heyi Guo wrote:
>>> On 2020/2/5 21:15, Marc Zyngier wrote:
>>>> My concern is that SDEI implies having EL3. EL3 not being virtualizable
>>>> with KVM, you end-up baking SDEI in *hardware*. Of course, this hardware
>>>> is actually software (it is QEMU), but this isn't the way it was intended.
>>>> It's not the first time we've done that (PSCI is another example), but the
>>>> logic behind SDEI looks much more invasive.
>>> Thanks for your comments.
>>>
>>> Thinking about them for quite a while, below is my understanding,
>>> please correct me if I'm wrong:
>>>
>>> So should the KVM based virtual machine be treated as one with CPUs
>>> only having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model,
>>> isn't it?
>> Well, that's exactly what it is (until we have nested virt, in which case
>> you will be able to add NS-EL2 to the mix).
>>
>>> PSCI only contains some one-shot operations, so it is much less
>>> invasive than SDEI.
> Is there an established pattern for how Qemu 'gets' things that are done in secure-world?
> For PSCI the kernel does it, but this obviously doesn't scale to something like OP-TEE.
>
> Ideally we'd get the reference implementation (from ATF) in some form that is easy to use...
>
>
>>> I've another question. The origin of "virtual" SDEI requirement comes
>>> from the lack of hard lockup detector in VM.
> (this is your use case. Its origin was just symmetry with EL3<->EL2)
>
>
>> Sure. But nothing guarantees that the guest is going to register a SDEI
>> entry point anyway.
>>> We can have some kind of
>>> watchdog, but how can the watchdog trigger the VM OS to panic and run
>>> kdump, even in irq-off state?
>> Nothing. All the events, including SDEI, are maskable, one way or another.
>>
>> Gavin's approach to inject a SError is probably OK for Linux, given that
>> it tends to run with PSTATE.A==0. But that's not a guarantee either (if
>> you take a recursive exception, SError won't be delivered).
> Or get stuck in debug-state (for which we mask SError), power-management, the vectors or
> somewhere weird, like KVM's world-switch.
>
>
> If you just want to kill the OS if its sort-of-alive, there is another trick:
>
> Synchronous exceptions can't be masked because they are caused by the instruction pointed
> to by the ELR. You can't inject an emulated data-abort unless the ELR points to an
> instruction that accesses memory, but...
>
> synchronous external abort for instruction fetch is something that  could happen at any
> time. If you have v8.2 you can make the severity uncontainable for extra points.
>
> On real hardware, this would be as if this instruction missed in the i-cache, then got an
> abort from the PoU-cache. The PoU-cache must have suffered some metadata corruption to
> report an uncontained error. On real hardware its very likely the next instruction would
> suffer the same fate, but linux should put up a good show of trying to panic().

Good idea. It seems to be able to cover all the possible the cases, 
while we only need to highlight this exception in the user document :)

Thanks,

Heyi

>
>
>> The long and the short of it is that there is no way to do what you want
>> with absolute guarantees on the ARM architecture. It just doesn't exist.
> Yes. By sort-of-alive it needs to be making some kind of progress. If the CPU is spinning
> through the vectors (because some joker unmapped them), all bets are off.
>
>
> Thanks,
>
> James
>
> .

