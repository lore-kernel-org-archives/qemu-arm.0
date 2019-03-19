Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3614044wrt;
        Tue, 19 Mar 2019 07:39:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz07memfoXrEDKpteQ91twzxxW6iTfogN3BKZyQ5uXXY4rT07QRzjTYr+3yMu2U2R6QqzW1
X-Received: by 2002:ac8:464b:: with SMTP id f11mr2341355qto.276.1553006376768;
        Tue, 19 Mar 2019 07:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553006376; cv=none;
        d=google.com; s=arc-20160816;
        b=yV04EVn2xAAfC44UQLtckPGEKQFuyty9ecTdAncBoAmhgTsKO/wNr59yatCZneyVTq
         DtXPmWU1BbbubJmARItoCKDjcHaiKB3aTKXMlNxFBfjarxfPJqzgkzZPdDQkrBCBs8DV
         Y/1pTfMozIaZGSp8PLBHaOe3iBDgbQdtkrNXfBaX/AIVOG150Thk/DN2R7KxFeYDBRYV
         dj25m1LcxJ6fpkvuT7s8c7rXBQjTTaM8h7CLxlY2aNFML0Vae5CClvcWz2+paUcYMnDv
         9AnMCh3TQ+bao/oDVHUikuIE2F3Ydm+fwzApphvea9p2KkfSDLBAnczNA2gGwLqXdNBR
         oDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=4Dsxj8BBdtr5gXi9fU7+wCb9UWJYdK8KWnaMiF/Pia0=;
        b=bCPHMeNG5i8LvfRImFQbDXZRxzCBxDdIMyApaeCUsbgH9pXVZJmF/UjI3c8EiwQvWB
         9GK60JGMPf30+8+rJjLjvH8DoDhDklRkQFgPedyg5jsnkaF2adH1S/wHttgSwN3YxNcf
         P+HCRW6MoQQtsM7JRSiO3/OyE5h2AnGO25K1aZ9x3LAuuej8Kdy7adIHOTRQPBy5M0Ah
         f40fydkgyV4uP/C7ldX+sZvZ6iAKRF3qLDLEsuBhYx/0TjHaZXqBjVa8xOIWeHpk5mxl
         BH7rIoJTzOu4z07icywIDL6+38fjwOQ2x6EECgkN7y7PWLUP1qKoclOluekA203mH/rz
         JPeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h50si3241246qvd.22.2019.03.19.07.39.36;
        Tue, 19 Mar 2019 07:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 039654A44D;
	Tue, 19 Mar 2019 10:39:36 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYbU+bHh2lJq; Tue, 19 Mar 2019 10:39:34 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DE2B44A408;
	Tue, 19 Mar 2019 10:39:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 45DB94A3BF
 for <kvmarm@lists.cs.columbia.edu>; Tue, 19 Mar 2019 10:39:33 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW8IW-JWmUXI for <kvmarm@lists.cs.columbia.edu>;
 Tue, 19 Mar 2019 10:39:31 -0400 (EDT)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8C8F14A3B3
 for <kvmarm@lists.cs.columbia.edu>; Tue, 19 Mar 2019 10:39:31 -0400 (EDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 87C0297C5F73C9B021DB;
 Tue, 19 Mar 2019 22:39:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.408.0; Tue, 19 Mar 2019
 22:39:26 +0800
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Christoffer Dall <christoffer.dall@arm.com>, Steven Price
 <steven.price@arm.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
 <20190315085948.GB10950@e113682-lin.lund.arm.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <ff1db661-13c2-50ff-940e-4a1d71bd0309@huawei.com>
Date: Tue, 19 Mar 2019 22:39:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190315085948.GB10950@e113682-lin.lund.arm.com>
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kvmarm@lists.cs.columbia.edu
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
X-TUID: fLF76prQ1H6k

Hi Christoffer and Steve,


On 2019/3/15 16:59, Christoffer Dall wrote:
> Hi Steve,
>
> On Wed, Mar 13, 2019 at 10:11:30AM +0000, Steven Price wrote:
>> Personally I think what we need is:
>>
>> * Either a patch like the one from Heyi Guo (save/restore CNTVCT_EL0) or
>> alternatively hooking up KVM_KVMCLOCK_CTRL to prevent the watchdog
>> firing when user space explicitly stops scheduling the guest for a while.
> If we save/restore CNTVCT_EL0 and the warning goes away, does the guest
> wall clock timekeeping get all confused and does it figure this out
> automagically somehow?
What's the source for guest wall clock timekeeping in current ARM64 implementation? Is it the value from CNTP_TVAL_EL0? Will guest OS keep track of this? Or is the wall clock simply platform RTC?

I tested the RFC change and did not see anything unusual. Did I miss someting?

>
> Does KVM_KVMCLOCK_CTRL solve that problem?
It seems KVM_KVMCLOCK_CTRL is dedicated for guest pause/resume scenario, but it relies on pvclock both in KVM and Guest and right now only X86 supports it :(

Could Steve provide more insights about the whole thing?

Thanks,
Heyi

>
>> * KVM itself saving/restoring CNTVCT_EL0 during suspend/resume so the
>> guest doesn't see time pass during a suspend.
> This smells like policy to me so I'd much prefer keeping as much
> functionality in user space as possible.  If we already have the APIs we
> need from KVM, let's use them.
>
>> * Something equivalent to MSR_KVM_WALL_CLOCK_NEW for arm which allows
>> the guest to query the wall clock time from the host and provides an
>> offset between CNTVCT_EL0 to wall clock time which the KVM can update
>> during suspend/resume. This means that during a suspend/resume the guest
>> can observe that wall clock time has passed, without having to be
>> bothered about CNTVCT_EL0 jumping forwards.
>>
> Isn't the proper Arm architectural solution for this to read the
> physical counter for wall clock time keeping ?
>
> (Yes that will require a trap on physical counter reads after migration
> on current systems, but migration sucks in terms of timekeeping
> already.)
>
>
> Thanks,
>
>      Christoffer
>
> .
>


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
