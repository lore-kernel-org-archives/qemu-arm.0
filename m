Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp294623wrs;
        Tue, 12 Mar 2019 03:09:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKxIpvA8k7Vv+yFCXWyKJvj2Fjlc6XSZ699kxxuJM0PShyeTsjcs0tWvBBJ4C0GkPJuC12
X-Received: by 2002:a05:620a:1244:: with SMTP id a4mr27080068qkl.201.1552385347530;
        Tue, 12 Mar 2019 03:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552385347; cv=none;
        d=google.com; s=arc-20160816;
        b=WoDiavn2zYleqUw3aBi3agX7MLGMfFpQ4C9oCXMTNUXuchC6SQklFAvLtWghiUbTWo
         nXpFyTlmVJcGifA561NPSNUGbLL10bacQvPR8b94RbrMQIsb0TsuqSZVdwo5deNWNYWH
         nGXMxrg6/5Nz5wUhXYTN9JeWsOOypYT0L5nlXnxJdTgOH7Ye+OzlteOXB4P9TLJ+nq7Y
         YvlotHyZr9Bnzd7HOjtH/LSzomDry7VEt07iCoqCtfNuNewlYGjllsD70KDGVvNamwPW
         MrM1Y9MYON7DOpQGkKD+MBQNQ6vPgvifn24qYnuIQeQod87kyYpeUWw2eZJSGNus7Thz
         lylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vkKBy5wGSAe9t+Oi2WYo6szYufJ6s/6oql6otOb2R0g=;
        b=bM9g+upDeQ9wL0S7bAhuPbdZs4+9EYEL9npnHblmjsKhZBu/opLMwPyslJACt3I9MP
         +UEAxsATH0f2e4KUg9I+XZhVIsGM9YOTjDbOgu4fqFmSyuLl2DhbWcWEbZbUmR3ol2QK
         CBp3BWOA495lyapklY9Dp/RES/cEoZXMqGp/FKtWgHSe8Pnl0pVCMEIh6Knm3oc9nGQb
         ormdnM+xi9e1RewIEuXApi7zYspQlqZufFIoaI25y0n01YlWOppugTy0KwFzqd8gCRVN
         I94rgQ1yjDk3Mv1E8YzbCe5QBLgaktlwruCH1ASXP5sSSjqmmNz5sPtrgW1XRVbZS0VA
         9row==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=zYdGENJi;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u73si4952813qka.156.2019.03.12.03.09.07;
        Tue, 12 Mar 2019 03:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=zYdGENJi;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1E5494A2E5;
	Tue, 12 Mar 2019 06:09:07 -0400 (EDT)
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
	with ESMTP id 6z2k+PP4JYed; Tue, 12 Mar 2019 06:09:05 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EAFCF4A414;
	Tue, 12 Mar 2019 06:09:05 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1A5D34A408
 for <kvmarm@lists.cs.columbia.edu>; Tue, 12 Mar 2019 06:09:04 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSfMB9N-CATH for <kvmarm@lists.cs.columbia.edu>;
 Tue, 12 Mar 2019 06:08:59 -0400 (EDT)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 533774A2E5
 for <kvmarm@lists.cs.columbia.edu>; Tue, 12 Mar 2019 06:08:59 -0400 (EDT)
Received: by mail-io1-f66.google.com with SMTP id f6so1582475iop.3
 for <kvmarm@lists.cs.columbia.edu>; Tue, 12 Mar 2019 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9HspksdB39OKDBZwWCF/WIP/PUR2SH+e4ujhpboAfAU=;
 b=zYdGENJieEXiMQjBgJYkiFk8F69nnNQZiKeRJ7QwD19uHViNvjPR8sgLLINe9rN9Vr
 Ap3ICFuDPcuWOPafvLdyGswKt/Yzcq1JIWVWyjcULubwU9rZUsPtIEXzmK7o15CXKniP
 milKbtwgwPWMxnXcfNX/Ze9D+fOTcEDK3Fso86sj4ypeT2oSYY2olaT+BBMiyI3MPfMg
 P/A+PufgmWuJ3Ub8JPUNPIEzOMUkXnl88rZLY1OV0oFHPb4HNIhjRyYNYB2myUQDQJuZ
 mMtqit9NtHLymNt7zyVz3NWsDiTI0tSYWThnybnUv3MHDQbUuxlgkc7HdESVT0KMO44B
 410g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HspksdB39OKDBZwWCF/WIP/PUR2SH+e4ujhpboAfAU=;
 b=ggrAPuv2GGW5o+j6um0je67xI9I3EQOO278T9Y/nJMYoKZ1b1qQFBJ5HhWpua879TL
 ItqPmx/hgOGuS1qX80ejKUe5aNC/WWMguK0NXr3F3miU4ZCG1ZONH+lvN2c61WjNP+Tv
 I6l0B0T+mlGw4udn/lE9N+H/lI497E8h0XNOojSwWYpopXdPTq2f0y52aQSLlf1A6tt6
 JhIvY1m5aVFTkONuyzCpge3UpxTCpuQbRbDoF6GVHI7cD1kGKPjuy4Bk4lS7rrduDlvz
 toWFzuCNtIeLadqbxyDszWTFxYaKJjel6Dth8qg0Mhze3Zpm/8T8GVVuHw8vHCTD7sV8
 EMIA==
X-Gm-Message-State: APjAAAWMM+e2HVR1kzPTar5PMnE9qjttpWO3w4PS5X1C3CXw62Cxyzl1
 t++qoIMta5B/+Qr9bgbC66CiaSUd0f9EZhiF8N6mZQ==
X-Received: by 2002:a6b:7941:: with SMTP id j1mr19950423iop.262.1552385338761; 
 Tue, 12 Mar 2019 03:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
In-Reply-To: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 10:08:47 +0000
Message-ID: <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Heyi Guo <guoheyi@huawei.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
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
X-TUID: ZEJ95mx+ALLa

On Tue, 12 Mar 2019 at 06:10, Heyi Guo <guoheyi@huawei.com> wrote:
>
> When we stop a VM for more than 30 seconds and then resume it, by qemu
> monitor command "stop" and "cont", Linux on VM will complain of "soft
> lockup - CPU#x stuck for xxs!" as below:
>
> [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
> [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
> [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
> [ 2783.809563] Modules linked in...
>
> This is because Guest Linux uses generic timer virtual counter as
> a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
> by qemu.
>
> This patch is to fix this issue by saving the value of CNTVCT_EL0 when
> stopping and restoring it when resuming.

Hi -- I know we have issues with the passage of time in Arm VMs
running under KVM when the VM is suspended, but the topic is
a tricky one, and it's not clear to me that this is the correct
way to fix it. I would prefer to see us start with a discussion
on the kvm-arm mailing list about the best approach to the problem.

I've cc'd that list and a couple of the Arm KVM maintainers
for their opinion.

QEMU patch left below for context -- the brief summary is that
it uses KVM_GET_ONE_REG/KVM_SET_ONE_REG on the timer CNT register
to save it on VM pause and write that value back on VM resume.

thanks
-- PMM



> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> ---
>  target/arm/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 96f0ff0..7bbba3d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -896,6 +896,60 @@ static void arm_cpu_finalizefn(Object *obj)
>  #endif
>  }
>
> +static int get_vcpu_timer_tick(CPUState *cs, uint64_t *tick_at_pause)
> +{
> +    int err;
> +    struct kvm_one_reg reg;
> +
> +    reg.id = KVM_REG_ARM_TIMER_CNT;
> +    reg.addr = (uintptr_t) tick_at_pause;
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    return err;
> +}
> +
> +static int set_vcpu_timer_tick(CPUState *cs, uint64_t tick_at_pause)
> +{
> +    int err;
> +    struct kvm_one_reg reg;
> +
> +    reg.id = KVM_REG_ARM_TIMER_CNT;
> +    reg.addr = (uintptr_t) &tick_at_pause;
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    return err;
> +}
> +
> +static void arch_timer_change_state_handler(void *opaque, int running,
> +                                            RunState state)
> +{
> +    static uint64_t hw_ticks_at_paused;
> +    static RunState pre_state = RUN_STATE__MAX;
> +    int err;
> +    CPUState *cs = (CPUState *)opaque;
> +
> +    switch (state) {
> +    case RUN_STATE_PAUSED:
> +        err = get_vcpu_timer_tick(cs, &hw_ticks_at_paused);
> +        if (err) {
> +            error_report("Get vcpu timer tick failed: %d", err);
> +        }
> +        break;
> +    case RUN_STATE_RUNNING:
> +        if (pre_state == RUN_STATE_PAUSED) {
> +            err = set_vcpu_timer_tick(cs, hw_ticks_at_paused);
> +            if (err) {
> +                error_report("Resume vcpu timer tick failed: %d", err);
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    pre_state = state;
> +}
> +
>  static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -906,6 +960,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      Error *local_err = NULL;
>      bool no_aa32 = false;
>
> +    /*
> +     * Only add change state handler for arch timer once, for KVM will help to
> +     * synchronize virtual timer of all VCPUs.
> +     */
> +    static bool arch_timer_change_state_handler_added;
> +
>      /* If we needed to query the host kernel for the CPU features
>       * then it's possible that might have failed in the initfn, but
>       * this is the first point where we can report it.
> @@ -1181,6 +1241,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>
>      init_cpreg_list(cpu);
>
> +    if (!arch_timer_change_state_handler_added && kvm_enabled()) {
> +        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
> +        arch_timer_change_state_handler_added = true;
> +    }
> +
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          cs->num_ases = 2;
> --
> 1.8.3.1
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
