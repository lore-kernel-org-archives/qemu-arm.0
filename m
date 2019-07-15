Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4175335wrv;
        Mon, 15 Jul 2019 06:41:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1Sp0CSvK7TB/0M+aiLSFLvsxsvbyY+gRetVYQQcIWvt7gN4uZCWp1HhsKn9GtU7hHDv2a
X-Received: by 2002:a0c:b521:: with SMTP id d33mr19003814qve.239.1563198069693;
        Mon, 15 Jul 2019 06:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563198069; cv=none;
        d=google.com; s=arc-20160816;
        b=OzC9Bg7SbdOayHzbCUxS1X9rp6pXPLgxqhaAKCaIYOWDOLo2bAv7ZyA2mu0f+ild8K
         9kODCPoY6Ix3b+jRa1+Iaub9BF4xMwWHRmaEpwGeXnckwHqyvXqI4bAk95nqM3rOnuae
         caf72w6OHK8j0Xt1yeBooY3xPwzzGG38AdCUQLCmKhwHcUYT/vBX8LhVyy3xxpV7R59H
         n8lXLHY/1oj0nPLzD4jxxxaQpOyH21gT0Aj34uO0/3H/5diS6ZLOs9uRr5zuFnreauJA
         XyRgDbVlk9FxzY87Wv0BaRSCSIZYVPKEnblU07Ca5AGakgxxvm5JOBUzPxU6m4kMU4E6
         bPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=xhj1w2U7PZRioXArvAVbLj72tMuMg8Cu82lIfbaAsHo=;
        b=ykCNR3XubCTj89JbV+CC200zyK+JGlhLbswany43JFr76o+Ry2tS3j5A2Ns8DzHzdu
         1MQq6QTkVYt+HyTEwFpwwRsVRZSbxu8qqUYwgO8cPsjr1B+Ojs2wm4vTWD7Di3swTZuZ
         5kk8oUs032CyuH3Dj10w4pHeMdQms1S84EDLlOUU0GlVuf6NkSO6PjiIj6etoj30Wqq/
         1T1QinEUKIfmqNFzNfVNmaXkLXRNXvXFVyLKmODg+peOTP/WomhtEEXtey9Sx7exaAlJ
         fG6CsLc9moBR3kmFoq2YD9E1O7CtlVEFJV8ITfm8RzY3Na6vy6EOI0xBae+PA3RCx8cj
         GMRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f6si11275193qtd.251.2019.07.15.06.41.09;
        Mon, 15 Jul 2019 06:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2BC234A51E;
	Mon, 15 Jul 2019 09:41:09 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jqt4pXRhZ-aD; Mon, 15 Jul 2019 09:41:06 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8327A4A4FD;
	Mon, 15 Jul 2019 09:41:06 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 00F134A4FD
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 09:41:05 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpOHJmEofGeO for <kvmarm@lists.cs.columbia.edu>;
 Mon, 15 Jul 2019 09:41:03 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 96BED4A3A3
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 09:41:03 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 242E228;
 Mon, 15 Jul 2019 06:41:03 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 390B03F71F;
 Mon, 15 Jul 2019 06:41:02 -0700 (PDT)
Date: Mon, 15 Jul 2019 14:41:00 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [RFC] Add virtual SDEI support in qemu
Message-ID: <20190715134059.GJ2790@e103592.cambridge.arm.com>
References: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
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
X-TUID: A3LCDvP6/USQ

On Sat, Jul 13, 2019 at 05:53:57PM +0800, Guoheyi wrote:
> Hi folks,
> 
> Do it make sense to implement virtual SDEI in qemu? So that we can have the
> standard way for guest to handle NMI watchdog, RAS events and something else
> which involves SDEI in a physical ARM64 machine.
> 
> My basic idea is like below:
> 
> 1. Change a few lines of code in kvm to allow unhandled SMC invocations
> (like SDEI) to be sent to qemu, with exit reason of KVM_EXIT_HYPERCALL, so
> we don't need to add new API.

So long as KVM_EXIT_HYPERCALL reports sufficient information so that
userspace can identify the cause as an SMC and retrieve the SMC
immediate field, this seems feasible.

For its own SMCCC APIs, KVM exclusively uses HVC, so rerouting SMC to
userspace shouldn't conflict.

This bouncing of SMCs to userspace would need to be opt-in, otherwise
old userspace would see exits that it doesn't know what to do with.

> 2. qemu handles supported SDEI calls just as the spec says for what a
> hypervisor should do for a guest OS.
> 
> 3. For interrupts bound to hypervisor, qemu should stop injecting the IRQ to
> guest through KVM, but jump to the registered event handler directly,
> including context saving and restoring. Some interrupts like virtual timer
> are handled by kvm directly, so we may refuse to bind such interrupts to
> SDEI events.

Something like that.

Interactions between SDEI and PSCI would need some thought: for example,
after PSCI_CPU_ON, the newly online cpu needs to have SDEs masked.

One option (suggested to me by James Morse) would be to allow userspace
to disable in the in-kernel PSCI implementation and provide its own
PSCI to the guest via SMC -- in which case userspace that wants to
implement SDEI would have to implement PSCI as well.

There may be reasons why this wouldn't work ... I haven't thought about
it in depth.

Cheers
---Dave
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
