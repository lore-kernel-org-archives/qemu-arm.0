Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp580600lfm;
        Fri, 24 Apr 2020 05:51:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGpsHr/uPPsp9u54W5Ic8Y2DPDlFX1K4uy50xCPvPntyrBAklcNPDy+t9X9q3Qq0DUXNmK
X-Received: by 2002:a05:6214:1242:: with SMTP id q2mr9035472qvv.198.1587732716826;
        Fri, 24 Apr 2020 05:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587732716; cv=none;
        d=google.com; s=arc-20160816;
        b=qsAQrgr9J4qimXw1edlm+qM97yo/yxk/kTT25ZwVlIMl7YLt+l5vlG+HglL0zM+l6j
         x0CPnVBMLhK18cGJNFq8C135k65lkFaIWiuZXQ0hrUDlZTxsF23cuWmPjp1sVWfo2HgO
         CON1IDzVlhWU6mQB+NMTuu6MbvRCqguzbq/StnLqjkkDivhIWL/ZWlhvEqhZ4vazJRci
         tLbvD8I5fUxVDMlfFV7sLnoBlz03iv/ic6GobyrLBm0JIfi6HvNuSbLDHmpMt4xk1FtN
         ZKJXd+z7PWe1abxyh3qpz6+Cl9R+9fpkrlbxqE3Z0pghJMfPYcAAZw8/i1eS9H9iF50P
         j4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tZrrpk+ijVkVvblgsOqG3Wk0BXsgtc+ff3QFHfwa37A=;
        b=t3WvdnaFW33Ttys5qnZ8SE3+wck5Iwz8rNFZgRfdTQzTEnbsmEIEQxLHyPgt2yocPe
         zc/ErYQ0ujnhwhnrVsQTn8r6/QjSvwCWEoUF585Am3fqtvk26nCoY1btOWTizBX6Q9xh
         cfnVYTn411rXgXsTdg4rOaLZ3WaXQ2pNhWssAHaXNp4jfeGAAKEkPBHIQabai8imRQo1
         qqHWYMsvUNiOKQIZA64m4Kjj83/mOrc8HfyFLWVjT7B3uO+DeneC4afjZfOMDnJa4n0/
         6t6EpTlksp8nOTzIrGrxYDDTV4L6DExIuXiwnFUzDP1et2ScHwNLPN71451jywy0no2q
         Oi1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=wqxIct9V;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 135si3205549qkk.96.2020.04.24.05.51.56;
        Fri, 24 Apr 2020 05:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=wqxIct9V;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 535114B25B;
	Fri, 24 Apr 2020 08:51:56 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWuykvkhUBJS; Fri, 24 Apr 2020 08:51:55 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 47E464B213;
	Fri, 24 Apr 2020 08:51:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3A3A84B211
 for <kvmarm@lists.cs.columbia.edu>; Fri, 24 Apr 2020 08:51:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qo6hp7YkndAq for <kvmarm@lists.cs.columbia.edu>;
 Fri, 24 Apr 2020 08:51:53 -0400 (EDT)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 30B6F4B20F
 for <kvmarm@lists.cs.columbia.edu>; Fri, 24 Apr 2020 08:51:53 -0400 (EDT)
Received: by mail-ot1-f67.google.com with SMTP id j26so12141320ots.0
 for <kvmarm@lists.cs.columbia.edu>; Fri, 24 Apr 2020 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BsEj32339N9txHinFeBr5Cb+eAcnXuu4GyaJJlDL5Xs=;
 b=wqxIct9Vdjf7GbHCvxT1MiYpyTH0iAANjm65ib62bdKmXkUFNwoH2Qatz7paLYpEO6
 c8ejTE1n7IOdE0xpR1JZ964Wruoe4AnvsicWutEUYnYyXvBPd5VQJU27WIB4DvbiNola
 tOM73Fbegx5pg82i/NIfns4e8hHRtQPQ/GwRtkdcOOS7RzrjyWCH8+DvFVum3qwN+DSo
 dTj+8o+oBPvoRwzU27lj7r7bmSkFdomSepa92imc2kjiWvj/JQ+dKmXYoQ59r0MJ9JOq
 QaFwmXR/aq8u6x8OPS3EPk8Y5nigIYZ1Y/A0EXvIr/ixnBJ8FFCwgcZzIzfwmJrSrvtu
 zS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsEj32339N9txHinFeBr5Cb+eAcnXuu4GyaJJlDL5Xs=;
 b=hvkw+iChhv4+gcAD6hudEyg5RSX7cA+eOMaKdQM4YPrtSpK5bnaHzwN5XSMK3R8XY8
 0HlxNGaUev/pIliAh73sA+XPqeHqHzTUZrCEh7v85GOeV3hEZqNZNeWa3P9SyR5263KO
 zOtrsi6tdn3M6qFgU1u/WRafReA4myfZXKhpqJ0l/DwfaSTZcxuOcdTEiklUn5mvrgKn
 HUu9Zmbxk9PgZNxm8l+AEeQsH6oj2uxcsQLixZvHecSg+TQNai5YNJpzt0uzQj9qlGTZ
 KYG8bM/bxmAqZktVDk/GxfvH1fGh9awMIy7ooNngEygKxZ3oSrOUDBvXfYxhPFuiFBcR
 lTmw==
X-Gm-Message-State: AGi0PuZgrSTZP3zDjMrAhN27aAjDfByQeQTvXxXDnnmfkhP4EoQh8k7T
 E4PUPQanxtb89Z2GvueT934yRM791tWgLeIOF7rjZg==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr7769127otb.135.1587732712601; 
 Fri, 24 Apr 2020 05:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-2-beata.michalska@linaro.org>
 <CAFEAcA_uWS+cVRk=BKra8AhsD+B1syVzhXeCMttSKwQDdo=j3w@mail.gmail.com>
 <20200417131032.lcyunbjwofsn2nzz@kamzik.brq.redhat.com>
 <20200424121633.GF3106@work-vm>
In-Reply-To: <20200424121633.GF3106@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2020 13:51:41 +0100
Message-ID: <CAFEAcA9055qMOMDubpRf+XS4RwtbYEVFqQf-nhPd8T087aCdHg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] target/arm: kvm: Handle DABT with no valid ISS
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
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
X-TUID: iuzF46ZIL6CF

On Fri, 24 Apr 2020 at 13:17, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Andrew Jones (drjones@redhat.com) wrote:
> > On Fri, Apr 17, 2020 at 11:39:25AM +0100, Peter Maydell wrote:
> > > I was trying to work out whether we need to migrate this state,
> > > and I'm not sure. Andrew, do you know? I think this comes down
> > > to "at what points in QEMU's kvm run loop can migration kick in",
> > > and specifically if we get a KVM_EXIT_ARM_NISV do we definitely
> > > go round the loop and KVM_RUN again without ever checking
> > > to see if we should do a migration ?
> > >
> >
> > I'd prefer a migration expert confirm this, so I've CC'ed David and Juan,
> > but afaict there's no way to break out of the KVM_RUN loop after a
> > successful (ret=0) call to kvm_arch_handle_exit() until after the next
> > KVM_RUN ioctl. This is because even if migration kicks the vcpus between
> > kvm_arch_handle_exit() and the next run, the signal won't do anything
> > other than prepare the vcpu for an immediate exit.
>
> This is a level I've not looked at I'm afraid.
> However, the point at which we're saving the vCPU state is when the
> vCPUs are stopped; so as long as your state that you save is everything
> you need to restart and you migrate that then you should be OK; but in
> the end fromt he migration point of view we just stop the VM and ask for
> each devices state.

Yeah, but I think the question is "at what point in the main loop
do we check 'is the VM stopping'". It sounds from what Andrew
says that the answer is that it can't happen at this point in
time, though.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
