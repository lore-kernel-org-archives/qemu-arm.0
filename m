Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp671797wrv;
        Tue, 16 Jul 2019 01:47:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRP3FF6PXaIveI2jCZ3rSG1mg0sX1w3xyRyBFIstaWfmD3I/Z8rOvzlc/5tmjG7gidvsHy
X-Received: by 2002:a37:9c94:: with SMTP id f142mr18369991qke.427.1563266862539;
        Tue, 16 Jul 2019 01:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563266862; cv=none;
        d=google.com; s=arc-20160816;
        b=dQjdnIRMZ3rIZOapAUQWiuWXMLr4sejAcB5KBEHtYuiI0ta/HcFadb67VH6ErOxbDX
         hBXXc88kckMt9ajbMDs38CAHu6B3Jnvj3XA/XCcga9R/kuOIU3AeXYSqBveABBoVaD61
         W2KaeMClYSu45F0wB9ynBPWsdTlB8Tp/n3/gMd16BZjWPUgdrx95qUwd4yyfkmn4Ld06
         8UTtmGLW7Ck5zIV1MmT2TAbwwwi6Y+sebEFt/+0C0bCqIMvCM6/hbEEknhjoJmA/XJgx
         jG+9SxkRCJkEODE4Yrm8tKPR3gu4J5WAuNNeFrMR4OiWNfPbrgFzFPpm6ed9pXUTuBpi
         E+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=JGuA6RrRFyi71vW4Re1Zt7jzdjv568BT8vnoBzVGm38=;
        b=z4qmVbHOuAorwBNiC92E/kZ1iFUM0PmYfn3nDPDB/irCZtpgzNlJhfBuwuCfvnfsaE
         yezya6v8+RuxKqR4ujZztVnsAdkZbDWweP3BZkm5Ym5cdVW/EuG8+3zrjxLeUeEScyAD
         EOdn21x7G0wECGw/Wd+u+Fa9Tley/jj7RloYEmxjkHGI2635Q8u75pPW3FhMBzvg3X1K
         cqlqCKu3xIw4qt60K9bxhWtto8DP5Qq+uJCLTzpdHsBPhrmblIR2FW/yCXb653e8nZcz
         8fBfzGpC94aYrm6tdBnU2Q16fAEGhixkLhkf2V9pgEHIbJFI1MpdtVmsMG5OL2OIlorH
         szpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id s4si60471qkg.189.2019.07.16.01.47.42;
        Tue, 16 Jul 2019 01:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 368784A534;
	Tue, 16 Jul 2019 04:47:42 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SDOsXw8f4fy; Tue, 16 Jul 2019 04:47:41 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F2DE64A539;
	Tue, 16 Jul 2019 04:47:40 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3A5BB4A534
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Jul 2019 04:47:40 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVNC+TzQcUC9 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 16 Jul 2019 04:47:38 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BBD974A4E6
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Jul 2019 04:47:38 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13D242B;
 Tue, 16 Jul 2019 01:47:38 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E94343F59C;
 Tue, 16 Jul 2019 01:47:36 -0700 (PDT)
Date: Tue, 16 Jul 2019 09:47:34 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC] Add virtual SDEI support in qemu
Message-ID: <20190716084734.GL2790@e103592.cambridge.arm.com>
References: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
 <20190715134059.GJ2790@e103592.cambridge.arm.com>
 <20190715134848.GI56232@lakrids.cambridge.arm.com>
 <4daefb19-6c15-f82c-31e9-1ae035d45bd5@arm.com>
 <20190715144446.GK56232@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715144446.GK56232@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Guoheyi <guoheyi@huawei.com>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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
X-TUID: acsSwwaFjgrP

On Mon, Jul 15, 2019 at 03:44:46PM +0100, Mark Rutland wrote:
> On Mon, Jul 15, 2019 at 03:26:39PM +0100, James Morse wrote:
> > On 15/07/2019 14:48, Mark Rutland wrote:
> > > On Mon, Jul 15, 2019 at 02:41:00PM +0100, Dave Martin wrote:
> > >> One option (suggested to me by James Morse) would be to allow userspace
> > >> to disable in the in-kernel PSCI implementation and provide its own
> > >> PSCI to the guest via SMC -- in which case userspace that wants to
> > >> implement SDEI would have to implement PSCI as well.
> > > 
> > > I think this would be the best approach, since it puts userspace in
> > > charge of everything.
> > > 
> > > However, this interacts poorly with FW-based mitigations that we
> > > implement in hyp. I suspect we'd probably need a mechanism to delegate
> > > that responsibility back to the kernel, and figure out if that has any
> > > interaction with thigns that got punted to userspace...
> > 
> > This has come up before:
> > https://lore.kernel.org/r/59C139D0.3040507@arm.com
> > 
> > I agree Qemu should opt-in to this, it needs to be a feature that is enabled.
> > 
> > I had an early version of something like this for testing SDEI before
> > there was firmware available. The review feedback from Christoffer was
> > that it should include HVC and SMC, their immediates, and shouldn't be
> > tied to SMC-CC ranges.
> > 
> > I think this should be a catch-all as Heyi describes to deliver
> > 'unhandled SMC/HVC' to user-space as hypercall exits. We should
> > include the immediate in the struct.
> > 
> > We can allow Qemu to disable the in-kernel PSCI implementation, which
> > would let it be done in user-space via this catch-all mechanism. (PSCI
> > in user-space has come up on another thread recently). The in-kernel
> > PSCI needs to be default-on for backwards compatibility.
> > 
> > As Mark points out, the piece that's left is the 'arch workaround'
> > stuff. We always need to handle these in the kernel. I don't think
> > these should be routed-back, they should be un-obtainable by
> > user-space.
> 
> Sure; I meant that those should be handled in the kernel rather than
> going to host userspace and back.
> 
> I was suggesting was that userspace would opt into taking ownership of
> all HVC calls, then explicitly opt-in to the kernel handling specific
> (sets of) calls.

The most logical thing to do would be to have userspace handle all
calls, but add an ioctl to forward a call to KVM.  This puts userspace
in charge of the SMCCC interface, with KVM handling only those things
that userspace can't do for itself, on request.

If the performance overhead is unacceptable for certain calls, we could
have a way to delegate specific function IDs to KVM.  I suspect that
will be the exception rather than the rule.

> There are probably issues with that, but I suspect defining "all
> undandled calls" will be problematic otherwise.

Agreed: the set of calls not handled by KVM will mutate over time.

Cheers
---Dave
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
