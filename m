Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4182996wrv;
        Mon, 15 Jul 2019 06:48:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHh6QJiDF234uitcplAEN4XKuPshIrrsH/Or90xj/CA8i9k/l/0cI+A/9XPayExnmjotgv
X-Received: by 2002:a0c:f20e:: with SMTP id h14mr18612416qvk.246.1563198537107;
        Mon, 15 Jul 2019 06:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563198537; cv=none;
        d=google.com; s=arc-20160816;
        b=PmvSqp6YpZFU7/kP8lRr9ZcUcx5x1G3qfHTPWk3Q3yT7Wh2oaMbN0leVNIKyU99Dvw
         Dg3Z0HnXk3QAT+qrrJR+kyv8xaG4Bot4av1vzAT+kHJrHwkApsWmb6DzzNM7flmYSB7i
         vRl9dIegZ3pAfZ3qEPSLl61TfITB962uvYpXFqIpzGCBSLzho8mZv/5Rcd8mxDcO8g2y
         ElKo0tLJpUTTUbb/eK2asm1V9jaow8monxOorV9dkRKEjQj9Lj4JYqKyzMA+FNwhU0lf
         O6RIaW4Mzmm8hqK9xN1rUDDwW5Nnun4dixcv9AnMrSyRClfbxSCwRo2+FIQxB2ww7BTN
         Koew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=6oTQ6HLIzgIXIjmOkgKxF7q0FAnOJLmw2rtwx+QTvAk=;
        b=mOiTs35EQHgV3nYC8JvF0S/Wy3L29hIMQFgaDy+WWYzzPh75OolZLeZjIpOuaepPtB
         DcNNCUycmeHcPi+sbZg4i5hFec/BLq2PlnuSR2GwhkxkJYDZIqKBSNyvuXANZzPzJhr5
         1b1vUgmrUBUSzESJu71f6vCUrtsmPhRBOQuMscsCtpi5ALJYVgEHf5DrC67weSrYwW2r
         SBR4+omMh5uWr0mPOW96kNGadtA/IUnJWUQp2ocL/bHsYelcbJYu2VSbxBfSbINIVSqT
         FC7PA6YRjijVJnba1TRrv2a9zTAOOlsoz6UomwiwyCpsWmeX+pg+nZKGNX+Df89zhwU6
         N6qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id z10si10478700qkj.70.2019.07.15.06.48.56;
        Mon, 15 Jul 2019 06:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BA4844A4FD;
	Mon, 15 Jul 2019 09:48:56 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH19OLjen+VO; Mon, 15 Jul 2019 09:48:55 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6EF5E4A4FF;
	Mon, 15 Jul 2019 09:48:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 54D8D4A49C
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 09:48:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmcEtgdyKPH4 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 15 Jul 2019 09:48:52 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E142F4A3A3
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jul 2019 09:48:52 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DBAA28;
 Mon, 15 Jul 2019 06:48:52 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697233F71F;
 Mon, 15 Jul 2019 06:48:51 -0700 (PDT)
Date: Mon, 15 Jul 2019 14:48:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [RFC] Add virtual SDEI support in qemu
Message-ID: <20190715134848.GI56232@lakrids.cambridge.arm.com>
References: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
 <20190715134059.GJ2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715134059.GJ2790@e103592.cambridge.arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
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
X-TUID: whuK1GD2J2To

On Mon, Jul 15, 2019 at 02:41:00PM +0100, Dave Martin wrote:
> On Sat, Jul 13, 2019 at 05:53:57PM +0800, Guoheyi wrote:
> > Hi folks,
> > 
> > Do it make sense to implement virtual SDEI in qemu? So that we can have the
> > standard way for guest to handle NMI watchdog, RAS events and something else
> > which involves SDEI in a physical ARM64 machine.
> > 
> > My basic idea is like below:
> > 
> > 1. Change a few lines of code in kvm to allow unhandled SMC invocations
> > (like SDEI) to be sent to qemu, with exit reason of KVM_EXIT_HYPERCALL, so
> > we don't need to add new API.
> 
> So long as KVM_EXIT_HYPERCALL reports sufficient information so that
> userspace can identify the cause as an SMC and retrieve the SMC
> immediate field, this seems feasible.
> 
> For its own SMCCC APIs, KVM exclusively uses HVC, so rerouting SMC to
> userspace shouldn't conflict.

Be _very_ careful here! In systems without EL3 (and without NV), SMC
UNDEFs rather than trapping to EL2. Given that, we shouldn't build a
hypervisor ABI that depends on SMC.

I am strongly of the opinion that (for !NV) we should always use HVC
here and have KVM appropriately forward calls to userspace, rather than
trying to use HVC/SMC to distinguish handled-by-kernel and
handled-by-userspace events.

For NV, the first guest hypervisor would use SMC to talk to KVM, all
else being the same.

> This bouncing of SMCs to userspace would need to be opt-in, otherwise
> old userspace would see exits that it doesn't know what to do with.
> 
> > 2. qemu handles supported SDEI calls just as the spec says for what a
> > hypervisor should do for a guest OS.
> > 
> > 3. For interrupts bound to hypervisor, qemu should stop injecting the IRQ to
> > guest through KVM, but jump to the registered event handler directly,
> > including context saving and restoring. Some interrupts like virtual timer
> > are handled by kvm directly, so we may refuse to bind such interrupts to
> > SDEI events.
> 
> Something like that.
> 
> Interactions between SDEI and PSCI would need some thought: for example,
> after PSCI_CPU_ON, the newly online cpu needs to have SDEs masked.
> 
> One option (suggested to me by James Morse) would be to allow userspace
> to disable in the in-kernel PSCI implementation and provide its own
> PSCI to the guest via SMC -- in which case userspace that wants to
> implement SDEI would have to implement PSCI as well.

I think this would be the best approach, since it puts userspace in
charge of everything.

However, this interacts poorly with FW-based mitigations that we
implement in hyp. I suspect we'd probably need a mechanism to delegate
that responsibility back to the kernel, and figure out if that has any
interaction with thigns that got punted to userspace...

Thanks,
Mark.
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
