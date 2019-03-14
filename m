Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp943291wro;
        Thu, 14 Mar 2019 07:55:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVdPTC3I47YWd2EnLu9SUMzs2RoFvuSifFkPQhdvSHPkeJrpG0Sj5tmJTl8hvhV3byAn2s
X-Received: by 2002:a0c:c3c7:: with SMTP id p7mr4271119qvi.162.1552575317279;
        Thu, 14 Mar 2019 07:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552575317; cv=none;
        d=google.com; s=arc-20160816;
        b=jBYAVjQecO81noHrbBNf9yBQxTZKTNRq3Lv8iTMz2tPsMhn5f3GKI8Ahz/J8Iz9H/i
         TNYeGVjnl6zcHCMBFORJ9dOxqr1DpEupJEmW/uanXbApkSfjNa3fOpav9uZMhdsGz5Mi
         a7xwPeaFfzHXA0oqu7Eef9gPECxkjKK/aGo2gkTdxPlIAKvzp7b3FwRiHhnG3Dh7pSqp
         7RLP6OfrFn8O062Kz7SmpEr5Czwkw9j3pAPL6b5Ju1oRn6Pd8brk92glhj7TN7JdSXLN
         v1/352GcN5k0sqVjUrAtgy7DFG5uj2R/UhB9Tu3TGiXgYc4eEZnKFrT39bz6SWqIfnUm
         iC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=Cqch2AvArspZsCiWpr0PWOkrHHp6BHBa9V1pyeQuuTk=;
        b=sgh0TIkqorwpbF4SScSgqhXjArc7p8YkC0/HSjsKzGcHW1d6bUPLI8SPnJfZFIftfO
         wttMmCx04bsmP38nKNknn0PoQQWjewUoZx7gHadrVj4HPx1Zsa9dzUbSzo2P1xgSwkR0
         GfLU61cT1zu3nWV0xqcQYfN38U2VPeLq5l4C/Ig4lQIl0/9HpdZRkQyLnNB9LWROgYLi
         bH9fhSHSbFXuWGxXhHUD5NEI5L8q+y/Eh+B1uwAlCUNWlloe6YaHsvNhBTRoQSvd+4yx
         /zO+G0ItvCy7p7XbSxBqWOjewirBsE6PgTuy91CPcYwuUPh6SfAYPzxfaqHyKIqYE/yd
         wuoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id t4si2916274qtp.131.2019.03.14.07.55.17;
        Thu, 14 Mar 2019 07:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EC3484A430;
	Thu, 14 Mar 2019 10:55:16 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.098
X-Spam-Level: 
X-Spam-Status: No, score=0.098 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuPGDY85-OsD; Thu, 14 Mar 2019 10:55:15 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EA8E74A41B;
	Thu, 14 Mar 2019 10:55:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 895704A41B
 for <kvmarm@lists.cs.columbia.edu>; Thu, 14 Mar 2019 10:55:14 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHI8y3Kpi81a for <kvmarm@lists.cs.columbia.edu>;
 Thu, 14 Mar 2019 10:55:13 -0400 (EDT)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2BB024A41A
 for <kvmarm@lists.cs.columbia.edu>; Thu, 14 Mar 2019 10:55:13 -0400 (EDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 51C9EFA7616796081390;
 Thu, 14 Mar 2019 22:55:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Thu, 14 Mar 2019
 22:55:03 +0800
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Steven Price <steven.price@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, 
 Peter Maydell <peter.maydell@linaro.org>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <d04c2f21-8d9c-58fa-3b1f-5efbfa55e6d8@huawei.com>
Date: Thu, 14 Mar 2019 22:55:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: /uZymx9604qm

Hi Peter and Steven,


On 2019/3/13 18:11, Steven Price wrote:
> On 12/03/2019 14:12, Marc Zyngier wrote:
>> Hi Peter,
>>
>> On 12/03/2019 10:08, Peter Maydell wrote:
>>> On Tue, 12 Mar 2019 at 06:10, Heyi Guo <guoheyi@huawei.com> wrote:
>>>> When we stop a VM for more than 30 seconds and then resume it, by qemu
>>>> monitor command "stop" and "cont", Linux on VM will complain of "soft
>>>> lockup - CPU#x stuck for xxs!" as below:
>>>>
>>>> [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
>>>> [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
>>>> [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
>>>> [ 2783.809563] Modules linked in...
>>>>
>>>> This is because Guest Linux uses generic timer virtual counter as
>>>> a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
>>>> by qemu.
>>>>
>>>> This patch is to fix this issue by saving the value of CNTVCT_EL0 when
>>>> stopping and restoring it when resuming.
> An alternative way of fixing this particular issue ("stop"/"cont"
> commands in QEMU) would be to wire up KVM_KVMCLOCK_CTRL for arm to allow
> QEMU to signal to the guest that it was forcibly stopped for a while
> (and so the watchdog timeout can be ignored by the guest).
>
>>> Hi -- I know we have issues with the passage of time in Arm VMs
>>> running under KVM when the VM is suspended, but the topic is
>>> a tricky one, and it's not clear to me that this is the correct
>>> way to fix it. I would prefer to see us start with a discussion
>>> on the kvm-arm mailing list about the best approach to the problem.
>>>
>>> I've cc'd that list and a couple of the Arm KVM maintainers
>>> for their opinion.
>>>
>>> QEMU patch left below for context -- the brief summary is that
>>> it uses KVM_GET_ONE_REG/KVM_SET_ONE_REG on the timer CNT register
>>> to save it on VM pause and write that value back on VM resume.
>> That's probably good enough for this particular use case, but I think
>> there is more. I can get into similar trouble if I suspend my laptop, or
>> suspend QEMU. It also has the slightly bizarre effect of skewing time,
>> and this will affect timekeeping in the guest in ways that are much more
>> subtle than just shouty CPUs.
> Indeed this is the bigger issue - user space doesn't get an opportunity
> to be involved when suspending/resuming, so saving/restoring (or using
> KVM_KVMCLOCK_CTRL) in user space won't fix these cases.
>
>> Christoffer and Steve had some stuff regarding Live Physical Time, which
>> should cover that, and other cases such as host system suspend, and QEMU
>> being suspended.
> Live Physical Time (LPT) is only part of the solution - this handles the
> mess that otherwise would occur when moving to a new host with a
> different clock frequency.
>
> Personally I think what we need is:
>
> * Either a patch like the one from Heyi Guo (save/restore CNTVCT_EL0) or
> alternatively hooking up KVM_KVMCLOCK_CTRL to prevent the watchdog
> firing when user space explicitly stops scheduling the guest for a while.
Per Steven's comments, the above change is still needed even when LPT is implemented, so do it make sense for us to apply this patch first? At least it fixes something and does not cause conflict with future solution. And do you think it is better to use KVM_KVMCLOCK_CTRL?

Thanks,
Heyi

>
> * KVM itself saving/restoring CNTVCT_EL0 during suspend/resume so the
> guest doesn't see time pass during a suspend.
>
> * Something equivalent to MSR_KVM_WALL_CLOCK_NEW for arm which allows
> the guest to query the wall clock time from the host and provides an
> offset between CNTVCT_EL0 to wall clock time which the KVM can update
> during suspend/resume. This means that during a suspend/resume the guest
> can observe that wall clock time has passed, without having to be
> bothered about CNTVCT_EL0 jumping forwards.
>
> Steve
>
> .
>


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
