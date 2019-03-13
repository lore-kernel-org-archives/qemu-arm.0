Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1463410wrs;
        Wed, 13 Mar 2019 03:11:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3v+4MreuAj/7UoDqAE/J41vOdCghPRmL2SPsrvupB/hXL9BjS8az058smXU6i1qhnlVv1
X-Received: by 2002:a37:32d4:: with SMTP id y203mr31414154qky.282.1552471898653;
        Wed, 13 Mar 2019 03:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552471898; cv=none;
        d=google.com; s=arc-20160816;
        b=W90HR8HwFXzpjv3eEQmA5grsg5JpV3Ib2xIrPDtkOAMqsRscer/UuAWJuDvi7T9nW9
         16lBieBd6vR7eAFrUADGWQrTjMNk1Hy9K8hD3+mJyIJWlVLzKcj4r4NYhn1vWZTVa00Q
         dD/UAz99ccNv3seKG2Nka7r4TPw6lXerbUkdKDQ2e9O91dyAjapKVH474oZVAuMX/Mrl
         A8xGoPGlYFyIWJP+Opd7xpYAiTKTzzIQlWvNKbgDFkIir/enG/D98SQgRnIYR7EKrb/0
         c6x/xuZ6KSJthA7WPH08DzCNp6vvoyRIs15WKFtyYULpPvoT1HD5NOTSspnIMufY7qwK
         BqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mDwGpZRZip5OXPX6ZYC4EBReyAeUCi33ZoF+yaklYdg=;
        b=BV2nTaktetZs0z3QMea6dg0y2UZJL2JmeiPctwjuNyUKmJ1znN/upYQ2bpg539ytxl
         eaz6qB37phyrs/nEsbEFKuxCh9wD+xVdsqi/qGmr8LmkG5Dy8IIGKEblIAtroLXCJKLH
         ko2lT2BByaF2QeXpVocPyO5n0ZtsEl0fsZ+X+FuQPXf8ex8e3gt1OEPEzFNkddxC+xIO
         uxWeZvslA04/hNIN3izB53rardbfZSoVzQUuYFnpKGBbHRvW9smm7vHDxHXGQ16GGk7B
         7mr4Xf/+eKO/T7IDqS9GMuJpSYAaRZ/JaNJWhV1GedyfAhY984BRKBiJRZqfqD3g2UkP
         4F4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id o12si756136qtg.179.2019.03.13.03.11.38;
        Wed, 13 Mar 2019 03:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 53B184A2BE;
	Wed, 13 Mar 2019 06:11:38 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L+weLfiVpj9X; Wed, 13 Mar 2019 06:11:36 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 955B94A3BF;
	Wed, 13 Mar 2019 06:11:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A2C774A331
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Mar 2019 06:11:35 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qqlcv3-5VJF for <kvmarm@lists.cs.columbia.edu>;
 Wed, 13 Mar 2019 06:11:34 -0400 (EDT)
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 47AE24A2BE
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Mar 2019 06:11:34 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88CA680D;
 Wed, 13 Mar 2019 03:11:33 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763F33F71D;
 Wed, 13 Mar 2019 03:11:32 -0700 (PDT)
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Marc Zyngier <marc.zyngier@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Heyi Guo <guoheyi@huawei.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
Date: Wed, 13 Mar 2019 10:11:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
Content-Language: en-GB
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 3QpXuPE6j7MS

On 12/03/2019 14:12, Marc Zyngier wrote:
> Hi Peter,
> 
> On 12/03/2019 10:08, Peter Maydell wrote:
>> On Tue, 12 Mar 2019 at 06:10, Heyi Guo <guoheyi@huawei.com> wrote:
>>>
>>> When we stop a VM for more than 30 seconds and then resume it, by qemu
>>> monitor command "stop" and "cont", Linux on VM will complain of "soft
>>> lockup - CPU#x stuck for xxs!" as below:
>>>
>>> [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
>>> [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
>>> [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
>>> [ 2783.809563] Modules linked in...
>>>
>>> This is because Guest Linux uses generic timer virtual counter as
>>> a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
>>> by qemu.
>>>
>>> This patch is to fix this issue by saving the value of CNTVCT_EL0 when
>>> stopping and restoring it when resuming.

An alternative way of fixing this particular issue ("stop"/"cont"
commands in QEMU) would be to wire up KVM_KVMCLOCK_CTRL for arm to allow
QEMU to signal to the guest that it was forcibly stopped for a while
(and so the watchdog timeout can be ignored by the guest).

>> Hi -- I know we have issues with the passage of time in Arm VMs
>> running under KVM when the VM is suspended, but the topic is
>> a tricky one, and it's not clear to me that this is the correct
>> way to fix it. I would prefer to see us start with a discussion
>> on the kvm-arm mailing list about the best approach to the problem.
>>
>> I've cc'd that list and a couple of the Arm KVM maintainers
>> for their opinion.
>>
>> QEMU patch left below for context -- the brief summary is that
>> it uses KVM_GET_ONE_REG/KVM_SET_ONE_REG on the timer CNT register
>> to save it on VM pause and write that value back on VM resume.
> 
> That's probably good enough for this particular use case, but I think
> there is more. I can get into similar trouble if I suspend my laptop, or
> suspend QEMU. It also has the slightly bizarre effect of skewing time,
> and this will affect timekeeping in the guest in ways that are much more
> subtle than just shouty CPUs.

Indeed this is the bigger issue - user space doesn't get an opportunity
to be involved when suspending/resuming, so saving/restoring (or using
KVM_KVMCLOCK_CTRL) in user space won't fix these cases.

> Christoffer and Steve had some stuff regarding Live Physical Time, which
> should cover that, and other cases such as host system suspend, and QEMU
> being suspended.

Live Physical Time (LPT) is only part of the solution - this handles the
mess that otherwise would occur when moving to a new host with a
different clock frequency.

Personally I think what we need is:

* Either a patch like the one from Heyi Guo (save/restore CNTVCT_EL0) or
alternatively hooking up KVM_KVMCLOCK_CTRL to prevent the watchdog
firing when user space explicitly stops scheduling the guest for a while.

* KVM itself saving/restoring CNTVCT_EL0 during suspend/resume so the
guest doesn't see time pass during a suspend.

* Something equivalent to MSR_KVM_WALL_CLOCK_NEW for arm which allows
the guest to query the wall clock time from the host and provides an
offset between CNTVCT_EL0 to wall clock time which the KVM can update
during suspend/resume. This means that during a suspend/resume the guest
can observe that wall clock time has passed, without having to be
bothered about CNTVCT_EL0 jumping forwards.

Steve
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
