Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp428043wrs;
        Tue, 12 Mar 2019 05:25:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtzCA5oeu6Dcpqfdy5RIVvQxp7nlMZaR3m4B28otYJWpaq+pfOQ1DWEcKhjA98Wqf41VpT
X-Received: by 2002:a0c:f786:: with SMTP id s6mr6158840qvn.170.1552393535724;
        Tue, 12 Mar 2019 05:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552393535; cv=none;
        d=google.com; s=arc-20160816;
        b=D6Z6TrBZ3FrUH4z234nlTn43xmmvpIcnkbVNp4Of+gdGa7uHrqT8du3SoPNnGV5sSd
         OUi1NhIzNzHZ1RNkzpYMqnIjj0DT+SgIe4dENCrYvhize2d9nig61CTh/tkSlwgA38bZ
         KlRI6sj2aGIJk/91wK+ttoCklwCFdJURSqgY+ttFQeFacTbsP/KFYA/WRKVQtx7syVgx
         i+qRhasVywUb7y9WATSSe6mjTsbeEyMKkLlfiTOVmz0p0OO6zcJAIwgeIzhvXXM1qtih
         5qS3O1bYYJqvPfa6u+0QbUcMb69tFVldlM+y03tP3F4iR4qXFH9422jE0xXBQKfqQaUS
         cFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=WpBBLyviBgBTMdNVVRSGb2gnzGZyG9ef4O6X+aI81FI=;
        b=C7796rAgLkodQmVGr9UVtdrO5v6uT/g+rr5rkravvkhR7phE70Gp7jV9uRQ1HjASeS
         /FUiaYUXGZTP503s7ZWoVsRSYTlPzqYUkJYWMy9nhdX9A0Zz61kWQywctCp3gHYrAijn
         s7TxD0hHtGvr5OZfdor5dHqXJWIuFhrH5/efgAZuoIfKAQLLWQ1/f766h2d4v6aHWBRc
         FnMXXCDmKymQHLR+EsmpO0D7InEwK62Ex0qdXT+h3hrIf6BCHHSyy6Jf/8vT2p7182eL
         eZDZf3GwhWCU85+ziapzBKWw8ZjUWWAz/CmBr0U/yaLPmubF6uWTS3/X58wQaD64nfZc
         D0YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q70si304706qke.9.2019.03.12.05.25.35;
        Tue, 12 Mar 2019 05:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4EC124A42F;
	Tue, 12 Mar 2019 08:25:35 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X41p7bA7r--S; Tue, 12 Mar 2019 08:25:34 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 137F74A379;
	Tue, 12 Mar 2019 08:25:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E68734A2E7
 for <kvmarm@lists.cs.columbia.edu>; Tue, 12 Mar 2019 08:25:32 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48+DzTOftV65 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 12 Mar 2019 08:25:31 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7DC464A2E5
 for <kvmarm@lists.cs.columbia.edu>; Tue, 12 Mar 2019 08:25:31 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA13CA78;
 Tue, 12 Mar 2019 05:25:30 -0700 (PDT)
Received: from localhost (e113682-lin.copenhagen.arm.com [10.32.144.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B5A03F614;
 Tue, 12 Mar 2019 05:25:30 -0700 (PDT)
Date: Tue, 12 Mar 2019 13:25:28 +0100
From: Christoffer Dall <christoffer.dall@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
Message-ID: <20190312122528.GA12646@e113682-lin.lund.arm.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marc Zyngier <marc.zyngier@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, steven.price@arm.com,
 qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
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
X-TUID: k9RRjZalkFDt

[Adding Steven Price, who has recently looked at this, in cc]

On Tue, Mar 12, 2019 at 10:08:47AM +0000, Peter Maydell wrote:
> On Tue, 12 Mar 2019 at 06:10, Heyi Guo <guoheyi@huawei.com> wrote:
> >
> > When we stop a VM for more than 30 seconds and then resume it, by qemu
> > monitor command "stop" and "cont", Linux on VM will complain of "soft
> > lockup - CPU#x stuck for xxs!" as below:
> >
> > [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
> > [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
> > [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
> > [ 2783.809563] Modules linked in...
> >
> > This is because Guest Linux uses generic timer virtual counter as
> > a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
> > by qemu.
> >
> > This patch is to fix this issue by saving the value of CNTVCT_EL0 when
> > stopping and restoring it when resuming.
> 
> Hi -- I know we have issues with the passage of time in Arm VMs
> running under KVM when the VM is suspended, but the topic is
> a tricky one, and it's not clear to me that this is the correct
> way to fix it. I would prefer to see us start with a discussion
> on the kvm-arm mailing list about the best approach to the problem.
> 
> I've cc'd that list and a couple of the Arm KVM maintainers
> for their opinion.
> 
> QEMU patch left below for context -- the brief summary is that
> it uses KVM_GET_ONE_REG/KVM_SET_ONE_REG on the timer CNT register
> to save it on VM pause and write that value back on VM resume.
> 
> thanks
> -- PMM
> 
> 
> 
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > ---
> >  target/arm/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 96f0ff0..7bbba3d 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -896,6 +896,60 @@ static void arm_cpu_finalizefn(Object *obj)
> >  #endif
> >  }
> >
> > +static int get_vcpu_timer_tick(CPUState *cs, uint64_t *tick_at_pause)
> > +{
> > +    int err;
> > +    struct kvm_one_reg reg;
> > +
> > +    reg.id = KVM_REG_ARM_TIMER_CNT;
> > +    reg.addr = (uintptr_t) tick_at_pause;
> > +
> > +    err = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +    return err;
> > +}
> > +
> > +static int set_vcpu_timer_tick(CPUState *cs, uint64_t tick_at_pause)
> > +{
> > +    int err;
> > +    struct kvm_one_reg reg;
> > +
> > +    reg.id = KVM_REG_ARM_TIMER_CNT;
> > +    reg.addr = (uintptr_t) &tick_at_pause;
> > +
> > +    err = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +    return err;
> > +}
> > +
> > +static void arch_timer_change_state_handler(void *opaque, int running,
> > +                                            RunState state)
> > +{
> > +    static uint64_t hw_ticks_at_paused;
> > +    static RunState pre_state = RUN_STATE__MAX;
> > +    int err;
> > +    CPUState *cs = (CPUState *)opaque;
> > +
> > +    switch (state) {
> > +    case RUN_STATE_PAUSED:
> > +        err = get_vcpu_timer_tick(cs, &hw_ticks_at_paused);
> > +        if (err) {
> > +            error_report("Get vcpu timer tick failed: %d", err);
> > +        }
> > +        break;
> > +    case RUN_STATE_RUNNING:
> > +        if (pre_state == RUN_STATE_PAUSED) {
> > +            err = set_vcpu_timer_tick(cs, hw_ticks_at_paused);
> > +            if (err) {
> > +                error_report("Resume vcpu timer tick failed: %d", err);
> > +            }
> > +        }
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    pre_state = state;
> > +}
> > +
> >  static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >  {
> >      CPUState *cs = CPU(dev);
> > @@ -906,6 +960,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >      Error *local_err = NULL;
> >      bool no_aa32 = false;
> >
> > +    /*
> > +     * Only add change state handler for arch timer once, for KVM will help to
> > +     * synchronize virtual timer of all VCPUs.
> > +     */
> > +    static bool arch_timer_change_state_handler_added;
> > +
> >      /* If we needed to query the host kernel for the CPU features
> >       * then it's possible that might have failed in the initfn, but
> >       * this is the first point where we can report it.
> > @@ -1181,6 +1241,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >
> >      init_cpreg_list(cpu);
> >
> > +    if (!arch_timer_change_state_handler_added && kvm_enabled()) {
> > +        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
> > +        arch_timer_change_state_handler_added = true;
> > +    }
> > +
> >  #ifndef CONFIG_USER_ONLY
> >      if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> >          cs->num_ases = 2;
> > --
> > 1.8.3.1
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
