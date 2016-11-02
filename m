Received: by 10.80.166.35 with SMTP id d32csp212140edc;
        Wed, 2 Nov 2016 09:19:55 -0700 (PDT)
X-Received: by 10.200.50.227 with SMTP id a32mr4142470qtb.32.1478103595653;
        Wed, 02 Nov 2016 09:19:55 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m26si1681356qki.199.2016.11.02.09.19.55;
        Wed, 02 Nov 2016 09:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 13A51402EF;
	Wed,  2 Nov 2016 12:19:42 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.209
X-Spam-Level: 
X-Spam-Status: No, score=0.209 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjtAKVp8skq6; Wed,  2 Nov 2016 12:19:41 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2093940421;
	Wed,  2 Nov 2016 12:19:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DA34040421
 for <kvmarm@lists.cs.columbia.edu>; Wed,  2 Nov 2016 12:19:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofaLcPt-4xeq for <kvmarm@lists.cs.columbia.edu>;
 Wed,  2 Nov 2016 12:19:38 -0400 (EDT)
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
 [209.85.215.54])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8893E402EF
 for <kvmarm@lists.cs.columbia.edu>; Wed,  2 Nov 2016 12:19:38 -0400 (EDT)
Received: by mail-lf0-f54.google.com with SMTP id b14so17299230lfg.2
 for <kvmarm@lists.cs.columbia.edu>; Wed, 02 Nov 2016 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XvTCzNCxRt0WWBLA0uOk5fvANIKH8k+dgAZpjZWK57U=;
 b=ePVs2FzhZwd+jRcHayIsRKxifoD1+8BwarwWKrBww1r84E6rz0YKO8aS2OCOP6RZWB
 oYzAXgIki+I8BYcjH63YnE2CL9phPoMMtxm8MMiIPBii1bvqxsVmQfTaZ14Bez4Je0HR
 6zoGO9LdCkfyayQZdCS9T4NgHOBexpKflTO1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XvTCzNCxRt0WWBLA0uOk5fvANIKH8k+dgAZpjZWK57U=;
 b=d6rwSxw7ttBUlGizRkAap6PLjI5GboI2kwf3+mBD0OzMsuCTOYAZkYSvm/xfLv8PSf
 Fk9GHJDy8n4Jc0dVDedqCWeMslNutlsd8OlXrebhA9mx7CiRcKpj8RRP5rh3OKSE/Nzn
 ZgJI4kH+dB8Abhp6vxW93uIsHp3HlLiEIk47VAovBFBr2/E9mwAf/xV5pPBsorIuTrGI
 7UbzOCQEEpqS8toWKV+8OucPZk3Q8Zl6xd0RbG7i86oObhzTmltbE381tNpGZ6K0S/JA
 7J33RYAis5AhtSi90FQHpx/LEHBqn2BjO8HOc0W6buD1F2MXyVpbzhtj/9OBjWo2fAGe
 ZQTw==
X-Gm-Message-State: ABUngvekm1WdDA5vDeKh0plQmSdFBMXHyBHf5va/pZ+nbZk1Eaoipt1io9stjVFyPJ8DeX8a
X-Received: by 10.25.202.6 with SMTP id a6mr2801444lfg.30.1478103590127;
 Wed, 02 Nov 2016 09:19:50 -0700 (PDT)
Received: from localhost (x1-6-50-6a-03-de-ec-c2.cpe.webspeed.dk.
 [2.108.209.202])
 by smtp.gmail.com with ESMTPSA id o194sm603580lfo.42.2016.11.02.09.19.49
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 09:19:49 -0700 (PDT)
Date: Wed, 2 Nov 2016 17:19:43 +0100
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Alexander Graf <agraf@suse.de>
Subject: Re: [RFC 2/2] ARM: KVM: Enable in-kernel timers with user space gic
Message-ID: <20161102161943.GA11122@cbox>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
 <1477775449-115472-2-git-send-email-agraf@suse.de>
 <CAFEAcA9ABvy52WDX++ACUQNo+UiRJkyC+X_mT+QhMxqE154Nqw@mail.gmail.com>
 <581A08F3.1050501@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <581A08F3.1050501@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: kvm-devel <kvm@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: mJNpHpoy5z1f

On Wed, Nov 02, 2016 at 04:40:35PM +0100, Alexander Graf wrote:
> On 11/01/2016 12:35 PM, Peter Maydell wrote:
> >On 29 October 2016 at 22:10, Alexander Graf <agraf@suse.de> wrote:

[...]

> >
> >>+        cpu->timer_irq_level = run->s.regs.timer_irq_level;
> >>+    }
> >>+
> >>      return MEMTXATTRS_UNSPECIFIED;
> >>  }
> >Does this code do the right thing across a vcpu reset or
> >a full-system reset?
> 
> Good question. I'm not 100% sure - but I don't know for sure whether
> it's guaranteed without user space irqchip even.
> 
> In essence, the code above merely synchronizes kvm state to qemu
> state and is fully unaffected from any reset sequence. This is good,
> as the line status is transient. So from a QEMU pov, we really only
> copy the state of the vcpu interrupt line into the QEMU interrupt
> line. Pulling that line down would be responsibility of the
> KVM_ARM_VCPU_INIT ioctl if it also clears the timer registers I
> guess.
> 
> However, I don't see any clearing of cntv_ctrl inside KVM or from
> QEMU. How do we ensure that the irq active bit is off on reset?


In kvm_timer_vcpu_reset we cset cntv_ctl = 0, and that function gets
called from the PSCI handler or whenever userspace calls the set target
ioctl thingy.

> 
> The other part that could get in the way of working system reset is
> the interrupt controller emulation itself which resets all internal
> irq line state. So on reset we'd always end up with the irq line
> down from a gic pov, but with the vtimer line pending or not pending
> depending on previous state. I doubt it's really going to hurt
> though.

I suppose it should resample the line, but if the GIC clears everything
and the arch timer line goes down, you're in the right starting state
again.  Right?

-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
