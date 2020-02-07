Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp429446lfp;
        Fri, 7 Feb 2020 02:53:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwP+zFSqYjhdsNIkwbZoqQ0ISvJJNKWzcb2UeyYF1lBHlSXYaB1Q0um4q7fHJLbL8pr51Tm
X-Received: by 2002:a05:620a:20c7:: with SMTP id f7mr6653250qka.440.1581072817367;
        Fri, 07 Feb 2020 02:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581072817; cv=none;
        d=google.com; s=arc-20160816;
        b=CuKyq1WTGA4Jf903bI/hu4LFbxJsj9vmBj31A3+o8qRUdadTj4hqiZaktRN6nK1LlB
         Piy1EmHqWmZXWT5vLXZ5S4kLtAAMz/Drf9GKRbwzL7d9qmcvVxajgJn1i1mr/fqeA3QB
         Ny1OwB9EJVGJ0ayEDFw6EpiRwEgPqJDShxZPaS0aOclHl/D74RJqBznu1Qd/QCOgY4Oi
         VMPTkeaYiMlgliXI00Shv3oKMr+9ecCFz7C3CHtcpYTGyyAXOU/u8gk8fbMka3qpGULE
         sSG68JBXSQxH6HuY7UJHAk2M30m1BDM4Atbe7DZHQ1yAhvnOPyIV7+T19CqVgg+AANkp
         YY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=P9GZ1EpFNI0nwagalTXwUWoF2SLnKfZLzWMSUchzWSI=;
        b=hH6QDzh9G1BXkYM14cpHPKFNY25pnWOAg96VWPbkU07EPVmqXgP1P9faANVPp+ctdC
         Xf1wfXSNUcMlcwagZaWwAx6dH44rIVOz6BBtJIqbt5gJfTmtUcRYGXP4nrSUIvgWYJ7w
         sCuOSOMCDicAEcE199NH1upf7GxlrfHO+MGHMuNCrm2eA5tu22Texa43lMXnweJPdHNg
         /doBSfQBXyTL/l6rW5OLSobqEPQWQ0897O2aPGYf9060OiiQoIA0IFv89ZbGZA+OrzIJ
         as2e7S5RhSDwwOxyr2dQEkSwToFjeihtERgjBQMC2WdR7aUuDlMiwIJVqUBlcUbmWHnc
         W7tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si1244052qtu.250.2020.02.07.02.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j01GS-0007Ul-Hq
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <james.morse@arm.com>) id 1j01Ft-0007Q7-N7
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:53:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <james.morse@arm.com>) id 1j01Fr-0005XI-Ip
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:53:00 -0500
Received: from foss.arm.com ([217.140.110.172]:46824)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <james.morse@arm.com>)
 id 1j01Fr-0005Tk-Bp; Fri, 07 Feb 2020 05:52:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92F2630E;
 Fri,  7 Feb 2020 02:52:57 -0800 (PST)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4CFC3F52E;
 Fri,  7 Feb 2020 02:52:55 -0800 (PST)
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Marc Zyngier <maz@kernel.org>, Heyi Guo <guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
 <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
 <f8394aafb2adb513186cd2784a1cb077@kernel.org>
From: James Morse <james.morse@arm.com>
Message-ID: <58519c6b-5c0e-b557-ac91-2024c594b28c@arm.com>
Date: Fri, 7 Feb 2020 10:52:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f8394aafb2adb513186cd2784a1cb077@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.140.110.172
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
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TyXItL4JCSE1

Hi guys,

On 06/02/2020 17:30, Marc Zyngier wrote:
> On 2020-02-06 01:20, Heyi Guo wrote:
>> On 2020/2/5 21:15, Marc Zyngier wrote:
>>> My concern is that SDEI implies having EL3. EL3 not being virtualizable
>>> with KVM, you end-up baking SDEI in *hardware*. Of course, this hardware
>>> is actually software (it is QEMU), but this isn't the way it was intended.
>>
>>>
>>> It's not the first time we've done that (PSCI is another example), but the
>>> logic behind SDEI looks much more invasive.
>>
>> Thanks for your comments.
>>
>> Thinking about them for quite a while, below is my understanding,
>> please correct me if I'm wrong:
>>
>> So should the KVM based virtual machine be treated as one with CPUs
>> only having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model,
>> isn't it?
> 
> Well, that's exactly what it is (until we have nested virt, in which case
> you will be able to add NS-EL2 to the mix).
> 
>> PSCI only contains some one-shot operations, so it is much less
>> invasive than SDEI.

Is there an established pattern for how Qemu 'gets' things that are done in secure-world?
For PSCI the kernel does it, but this obviously doesn't scale to something like OP-TEE.

Ideally we'd get the reference implementation (from ATF) in some form that is easy to use...


>> I've another question. The origin of "virtual" SDEI requirement comes
>> from the lack of hard lockup detector in VM.

(this is your use case. Its origin was just symmetry with EL3<->EL2)


> Sure. But nothing guarantees that the guest is going to register a SDEI
> entry point anyway.

>> We can have some kind of
>> watchdog, but how can the watchdog trigger the VM OS to panic and run
>> kdump, even in irq-off state?
> 
> Nothing. All the events, including SDEI, are maskable, one way or another.
> 
> Gavin's approach to inject a SError is probably OK for Linux, given that
> it tends to run with PSTATE.A==0. But that's not a guarantee either (if
> you take a recursive exception, SError won't be delivered).

Or get stuck in debug-state (for which we mask SError), power-management, the vectors or
somewhere weird, like KVM's world-switch.


If you just want to kill the OS if its sort-of-alive, there is another trick:

Synchronous exceptions can't be masked because they are caused by the instruction pointed
to by the ELR. You can't inject an emulated data-abort unless the ELR points to an
instruction that accesses memory, but...

synchronous external abort for instruction fetch is something that  could happen at any
time. If you have v8.2 you can make the severity uncontainable for extra points.

On real hardware, this would be as if this instruction missed in the i-cache, then got an
abort from the PoU-cache. The PoU-cache must have suffered some metadata corruption to
report an uncontained error. On real hardware its very likely the next instruction would
suffer the same fate, but linux should put up a good show of trying to panic().


> The long and the short of it is that there is no way to do what you want
> with absolute guarantees on the ARM architecture. It just doesn't exist.

Yes. By sort-of-alive it needs to be making some kind of progress. If the CPU is spinning
through the vectors (because some joker unmapped them), all bets are off.


Thanks,

James
