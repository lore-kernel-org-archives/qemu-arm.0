Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4249404wrv;
        Mon, 15 Jul 2019 07:44:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJUGi0rt2Ln0m5q4rWggbF49MkxmH1qA/ViORch2p2A5KFMoK+z9RsjaBriS0wv7m60xWi
X-Received: by 2002:a05:6214:13a1:: with SMTP id h1mr18367929qvz.190.1563201894595;
        Mon, 15 Jul 2019 07:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563201894; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5WUMLKVtSbB5ijLluEkV/TgPCRixf2MkKnh075jtqc1AopmYnITo1fL3pCGZ+EBtE
         t4OK5UNPUYznzLRB8CEzvY4mqkTqnBeZa6h8Blfqf5y7V4j0sYvAHdnzg4KZPDsvtMHh
         51+nmBFGd/bOWHq8rp3YQXm4FvKs/vfIhUtRn8NgKHKSwY3exotUMBlU98CdxQ4AVYNs
         yggPdbIytWfKw8tGg/U1AahTr1htfZPjA3hdeO+ibXYi/diIqkBnkMJOZA1Lh2+TTxKO
         MRs2Wp1c3otEmnsS7GJTC76Xa9t/uDIhXzigN/fa0l/By6MzugKI56PC8jc9eqoY0uC2
         2EEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=1p+pvuVFCSQQUhGiy7E+dAHcEVgv3vCj3oTZVAWdsCw=;
        b=q7aT689A7bTI2yI7mMSNjosjpW5gLDXihSNIoWY4W59YMwFBGF5cfbA210yvQDpO0f
         zo10d1memKrDrXxXmNgHP6BBWfw3vd1NGh1KRRjJDE3mF90bjt8M9CG5hbds3C+FxT4f
         aqsBHWXfrXnjmxib/IzZaMQ6ipmLdrlC5dpodBJC/KNQ9P7HbjpqJ6iDthjYoDE9vbzA
         LKapNpijkAXgZAQ0n/fLPUiNP/xCXtyCAUV17cDt/J5hoZ5OolV4pYDudvIz6xxXDXdA
         Z6TYdzzjLHVt8wIGZKGPHwMogxw5xvCUi/wvArUyR27hbPcEftONVTs9avTDRbnchiNS
         He9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 11si11904769qvf.199.2019.07.15.07.44.54;
        Mon, 15 Jul 2019 07:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1E2534A51F;
	Mon, 15 Jul 2019 10:44:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdkALEpzyKUa; Mon, 15 Jul 2019 10:44:52 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E5C9A4A389;
	Mon, 15 Jul 2019 10:44:52 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C0C2D4A389
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 10:44:51 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLPceuZYBGk2 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 15 Jul 2019 10:44:50 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 401C74A319
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 10:44:50 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D3C28;
 Mon, 15 Jul 2019 07:44:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 714D23F59C;
 Mon, 15 Jul 2019 07:44:48 -0700 (PDT)
Date: Mon, 15 Jul 2019 15:44:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: James Morse <james.morse@arm.com>
Subject: Re: [RFC] Add virtual SDEI support in qemu
Message-ID: <20190715144446.GK56232@lakrids.cambridge.arm.com>
References: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
 <20190715134059.GJ2790@e103592.cambridge.arm.com>
 <20190715134848.GI56232@lakrids.cambridge.arm.com>
 <4daefb19-6c15-f82c-31e9-1ae035d45bd5@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4daefb19-6c15-f82c-31e9-1ae035d45bd5@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-devel@nongnu.org,
 Dave Martin <Dave.Martin@arm.com>, qemu-arm@nongnu.org,
 Guoheyi <guoheyi@huawei.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
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
X-TUID: pCen76nVMX2G

On Mon, Jul 15, 2019 at 03:26:39PM +0100, James Morse wrote:
> On 15/07/2019 14:48, Mark Rutland wrote:
> > On Mon, Jul 15, 2019 at 02:41:00PM +0100, Dave Martin wrote:
> >> One option (suggested to me by James Morse) would be to allow userspace
> >> to disable in the in-kernel PSCI implementation and provide its own
> >> PSCI to the guest via SMC -- in which case userspace that wants to
> >> implement SDEI would have to implement PSCI as well.
> > 
> > I think this would be the best approach, since it puts userspace in
> > charge of everything.
> > 
> > However, this interacts poorly with FW-based mitigations that we
> > implement in hyp. I suspect we'd probably need a mechanism to delegate
> > that responsibility back to the kernel, and figure out if that has any
> > interaction with thigns that got punted to userspace...
> 
> This has come up before:
> https://lore.kernel.org/r/59C139D0.3040507@arm.com
> 
> I agree Qemu should opt-in to this, it needs to be a feature that is enabled.
> 
> I had an early version of something like this for testing SDEI before
> there was firmware available. The review feedback from Christoffer was
> that it should include HVC and SMC, their immediates, and shouldn't be
> tied to SMC-CC ranges.
> 
> I think this should be a catch-all as Heyi describes to deliver
> 'unhandled SMC/HVC' to user-space as hypercall exits. We should
> include the immediate in the struct.
> 
> We can allow Qemu to disable the in-kernel PSCI implementation, which
> would let it be done in user-space via this catch-all mechanism. (PSCI
> in user-space has come up on another thread recently). The in-kernel
> PSCI needs to be default-on for backwards compatibility.
> 
> As Mark points out, the piece that's left is the 'arch workaround'
> stuff. We always need to handle these in the kernel. I don't think
> these should be routed-back, they should be un-obtainable by
> user-space.

Sure; I meant that those should be handled in the kernel rather than
going to host userspace and back.

I was suggesting was that userspace would opt into taking ownership of
all HVC calls, then explicitly opt-in to the kernel handling specific
(sets of) calls.

There are probably issues with that, but I suspect defining "all
undandled calls" will be problematic otherwise.

Thanks,
Mark.
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
