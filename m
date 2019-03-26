Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4988078wrx;
        Tue, 26 Mar 2019 04:54:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmQK1llosxJlwK7shFMOzaFfcP+SIQR3MtvGYe/6B/QukBJi0ITqTkQrswa/jS+aHuPX9c
X-Received: by 2002:a0c:aca4:: with SMTP id m33mr25150918qvc.136.1553601272786;
        Tue, 26 Mar 2019 04:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553601272; cv=none;
        d=google.com; s=arc-20160816;
        b=SzHbVSQ2ZFPR3qF9SSN/Pr2Zfz2KtQgiFOrA1UskwHVBHN6iHN1e1yp+OMqZhJMmxZ
         wewdosTwVRICXhRtvVFf+4w6RrJdbtZoLwIjzdla4Pywhw60eVZVfpjzvWc/uttkNCrG
         XYad7y6jA7P1p0SkulPndVe0tIgfDqksilEnoYoa4xfJrDMi6rPct7DJ2Vqh1tFmHJiT
         +DTrnOGHxj3CcKv6LamDO1TFDDYpOukTIdIlFI3vyQOpN7HjBORc5FFmLx2R5+zH8OEO
         aQhvsm1vy51hTcUB+fLqp2AG80sNM/LvSaE9ueRTLQwc4b6wB/dH5fC5zsM3cV9prfdm
         HIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=bXCg9dM3dFf4g4IO5gUTi4gKIgSPDdPlLhbpArtNzdw=;
        b=WGARN96Vji3rvp838eWIR/syP2A5EKqm57HfqpIXAvgrtaBMGwGoXtnhB7lEBlGuhc
         yEmz0rLWN3tlAL9hde9ZAVnckcSLLO47KMSI5WIBT2HyiaP8/o6LBBE2Zjxj03cgX4Ya
         J4sA9fAWatzE8B5xaTYmymtIul0kCs5SwgevyLtPR2EdbBijlBeBvpuaekzV78zeL3B3
         oPb6TTMDwtW1QSx1Wrmph8FkrDofkXoxait0J4Hbu7zoAxiOIWATHuhsOIVRFbmzPF9m
         eRCvyla/wIzh9WoLm1+ZHiC9+pYfUVyWBiSjxv+/XUvW5lbCCWs7fXU4gRICqK3dlINi
         0CZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id k11si450596qtk.81.2019.03.26.04.54.32;
        Tue, 26 Mar 2019 04:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1C8FB4A2E5;
	Tue, 26 Mar 2019 07:54:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.098
X-Spam-Level: 
X-Spam-Status: No, score=0.098 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yO81DA+a213G; Tue, 26 Mar 2019 07:54:30 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8ACF84A3A3;
	Tue, 26 Mar 2019 07:54:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 435D44A37D
 for <kvmarm@lists.cs.columbia.edu>; Tue, 26 Mar 2019 07:54:29 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAhCpqKitkwW for <kvmarm@lists.cs.columbia.edu>;
 Tue, 26 Mar 2019 07:54:28 -0400 (EDT)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id AD03B4A2E5
 for <kvmarm@lists.cs.columbia.edu>; Tue, 26 Mar 2019 07:54:27 -0400 (EDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 87FB34257D067C039FE0;
 Tue, 26 Mar 2019 19:54:24 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.408.0; Tue, 26 Mar 2019
 19:54:22 +0800
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Steven Price <steven.price@arm.com>, Christoffer Dall
 <christoffer.dall@arm.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
 <20190315085948.GB10950@e113682-lin.lund.arm.com>
 <ff1db661-13c2-50ff-940e-4a1d71bd0309@huawei.com>
 <101c5f17-9811-e2d0-ff3c-a0e64beee921@arm.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <662367df-e702-dd0a-da83-f1b448c5f203@huawei.com>
Date: Tue, 26 Mar 2019 19:54:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <101c5f17-9811-e2d0-ff3c-a0e64beee921@arm.com>
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
X-TUID: KwcH6nz40RT8

Hi Steven,

Thanks for your explanation. Please see my comments below.


On 2019/3/21 0:29, Steven Price wrote:
> On 19/03/2019 14:39, Heyi Guo wrote:
>> Hi Christoffer and Steve,
>>
>>
>> On 2019/3/15 16:59, Christoffer Dall wrote:
>>> Hi Steve,
>>>
>>> On Wed, Mar 13, 2019 at 10:11:30AM +0000, Steven Price wrote:
>>>> Personally I think what we need is:
>>>>
>>>> * Either a patch like the one from Heyi Guo (save/restore CNTVCT_EL0) or
>>>> alternatively hooking up KVM_KVMCLOCK_CTRL to prevent the watchdog
>>>> firing when user space explicitly stops scheduling the guest for a
>>>> while.
>>> If we save/restore CNTVCT_EL0 and the warning goes away, does the guest
>>> wall clock timekeeping get all confused and does it figure this out
>>> automagically somehow?
>> What's the source for guest wall clock timekeeping in current ARM64
>> implementation? Is it the value from CNTP_TVAL_EL0? Will guest OS keep
>> track of this? Or is the wall clock simply platform RTC?
>>
>> I tested the RFC change and did not see anything unusual. Did I miss
>> someting?
> Are you running ARM or ARM64? I'm assuming ARM64 here...
Yes, definitely :)

>
> Unless I'm mistaken you should see the time reported by the guest not
> progress when you have stopped it using the QEMU monitor console.
>
> Running something like "while /bin/true; do date; sleep 1; done" should
> allow you to see that without the patch time will jump in the guest
> (i.e. the time reflects wall-clock time). With the patch I believe it
> will not jump (i.e. the clock will be behind wall-clock time after the
> pause).
I did the test and the result was exactly like you said.
>
> However, this behaviour does depend on the exact system being emulated.
> >From drivers/clocksource/arm_arch_timer.c:
>
>> static void __init arch_counter_register(unsigned type)
>> {
>> 	u64 start_count;
>>
>> 	/* Register the CP15 based counter if we have one */
>> 	if (type & ARCH_TIMER_TYPE_CP15) {
>> 		if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
>> 		    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI)
>> 			arch_timer_read_counter = arch_counter_get_cntvct;
>> 		else
>> 			arch_timer_read_counter = arch_counter_get_cntpct;
>>
>> 		clocksource_counter.archdata.vdso_direct = vdso_default;
>> 	} else {
>> 		arch_timer_read_counter = arch_counter_get_cntvct_mem;
>> 	}
> So we can see here that there are three functions for reading the
> counter - there's the memory interface for CNTVCT, the "CP15" interface
> also for CNTVCT, and an interface for CNTPCT. CNTPCT is only used for
> !ARM64 or if hyp mode is available (not relevant until nested
> virtualisation is added).
>
> The upshot is that on arm64 we're using the virtual counter (CNTVCT).
>
>>> Does KVM_KVMCLOCK_CTRL solve that problem?
>> It seems KVM_KVMCLOCK_CTRL is dedicated for guest pause/resume scenario,
>> but it relies on pvclock both in KVM and Guest and right now only X86
>> supports it :(
> KVM_KVMCLOCK_CTRL simply provides a mechanism for the host to inform the
> guest that a vCPU hasn't been scheduled for "a while". The guest can
> then use that information to avoid triggering the watchdog timeout. As
> you note it is only currently implemented for X86.
>
>> Could Steve provide more insights about the whole thing?
> I'll try - see below.
>
>> Thanks,
>> Heyi
>>
>>>> * KVM itself saving/restoring CNTVCT_EL0 during suspend/resume so the
>>>> guest doesn't see time pass during a suspend.
>>> This smells like policy to me so I'd much prefer keeping as much
>>> functionality in user space as possible.  If we already have the APIs we
>>> need from KVM, let's use them.
> The problem with suspend/resume is that user space doesn't get a
> look-in. There's no way (generically) for a user space application to
> save/restore registers during the suspend. User space simply sees time
> jump forwards - which is precisely what we're trying to hide from the
> guest (as it otherwise gets upset that it appears a vCPU has deadlocked
> for a while).
>
> So while I agree this is "policy", it's something we need the kernel to
> do on our behalf. Potentially we can put it behind an ioctl so that user
> space can opt-in to it.
>
>>>> * Something equivalent to MSR_KVM_WALL_CLOCK_NEW for arm which allows
>>>> the guest to query the wall clock time from the host and provides an
>>>> offset between CNTVCT_EL0 to wall clock time which the KVM can update
>>>> during suspend/resume. This means that during a suspend/resume the guest
>>>> can observe that wall clock time has passed, without having to be
>>>> bothered about CNTVCT_EL0 jumping forwards.
>>>>
>>> Isn't the proper Arm architectural solution for this to read the
>>> physical counter for wall clock time keeping ?
>>>
>>> (Yes that will require a trap on physical counter reads after migration
>>> on current systems, but migration sucks in terms of timekeeping
>>> already.)
> The physical counter is certainly tempting as it largely does what we
> want as a secondary counter. However I'm wary of using it because it
> starts to get "really interesting" when dealing with nested
> virtualisation. Any by "really interesting" I of course mean horribly
> broken :)
>
> Basically the problem is that with nested virtualisation the offset
> between the physical counter and the virtual counter is controlled by
> the virtual-EL2. Because we want certain behaviours of the virtual
> counter (pausing when the guest pauses) we have to replicate that onto
> the physical counter to maintain the offset between the two that the
> guest expects.
>
> Given that it seems to be a non-starter when you introduce nested virt I
> think we should just bite the bullet and implement a PV wall clock
> mechanism for arm64 (similar to MSR_KVM_WALL_CLOCK_NEW).

If we decide to implement something like pvclock, shall we increase the priority of this work? It seems there is much to do, including the spec, KVM, qemu and guest kernel driver...

Thanks,

Heyi

>
> This also has the advantage that it is going to be faster than the
> physical counter when that has to be trapped (e.g. after migration).
>
> Steve
>
> .
>


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
