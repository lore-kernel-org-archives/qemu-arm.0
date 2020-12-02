Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp704272lfb;
        Tue, 1 Dec 2020 17:20:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdycKaNapUy0KsA16R4HOp2VTBVcHbCHEkDhjT4wDi6EyLx6yHTBANgX+IHWZX8CW7hrFu
X-Received: by 2002:a5b:bc8:: with SMTP id c8mr284000ybr.228.1606872030604;
        Tue, 01 Dec 2020 17:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606872030; cv=none;
        d=google.com; s=arc-20160816;
        b=qYIpgWc3zZsEg0TcffCeogY8R/YEaNvmzK60yI2V34EV2C8sGroTTat6Q+ZKukYgri
         gN/sD/GzSjQk0sIg6MNXlRRuGZ6TX9thaUniWKCA/L5/2vDzNHhtMgHrr6+9gxV0IogM
         Cx9/KvmcvNuiGeXcVRNHSP1dWxfZ+n45bay1jJ04FT93gHvnwILWfRYz9C4coSFFYIa9
         JtRRdSG9h43lJ0RnZgmXryJ+KNqth3OwF3GJuXDJQ5enivzsu+oxPCR69MbL85AM5B5B
         4RGDqggQNonJpsI5RphvSfJw/xgdz+7aD4DTqOeJZiZpnX9Q0Fdbk3t6YbhaUIlXs9vN
         gjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ChhDiCzVDxbl05mzuMNhiOuTSOxaKUEH1cVcjrkqecM=;
        b=l+gXPa0RTf5F8QK/w3k+yrroFKNhXOQtLCX87YDojqVtfReda+pL+rOz18JFM6e+ur
         GtXW/0/QuMKn7PcNe7ySMVtNC1aZ152xhbI29912bhbur2pdLrjrcJ0q3bfGGLxHE3uk
         A+UzskF1/OWw+gy91VoAVL+NYZ7VBSoWDd4Ay+EJSsvlj/yWf5XOcbGR3vcAkL25Ri6Y
         Q5m8cW9uSRmDltgtL2Q3aDO+oOhDNqTUtXmWcKaKT/Dy8fK1QrvqrxFfc/uFJXsZKmPB
         cCvUUTkC/CrDHICc26dajlt+4zJWODR+Ta+umnC0wPTb2FSDfUa2R/SM8zUB5ETtJTPx
         F6pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=k3lAuaCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e193si193069ybh.478.2020.12.01.17.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 17:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=k3lAuaCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkGon-0001rd-U0
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 20:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkGo1-0001qA-Bg
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 20:19:41 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkGnu-0005hr-N3
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 20:19:41 -0500
Received: by mail-il1-x143.google.com with SMTP id w8so37437ilg.12
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 17:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ChhDiCzVDxbl05mzuMNhiOuTSOxaKUEH1cVcjrkqecM=;
 b=k3lAuaCr89kVFBMNNACG439jYByeqd4F4PFsswCj81eMVuyhPq6aQ9a5KJxSeNeGdd
 nrsLgP6mK/K56acUlgsLRrR9OdlH0HE6BdLE9rwNNco/MHB0yJJIw7uNYxKfUdo9MDfe
 WsQIiHaUC03T/qpEm8eifA882v1fyEkDVvcLTHxIMU4kTBdzRJqeeSRWE+haFQgKEieS
 ITEXxE4jhU4tXZ1LqJD2RtX60vpdXgXWHH8OCMAAwztHGPV+wR2p/LmXDs/pmP8tzOsa
 ecI5VfR7Ka2OOSqjD9IXEBtHUSyQJlCQK+wBSnHZYgLWnXw01YC2RI836eSKiqS8hB9X
 I/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ChhDiCzVDxbl05mzuMNhiOuTSOxaKUEH1cVcjrkqecM=;
 b=O+bSU2BpoqpS7ZmSHZMVFXEFbPzIeWkODJ2v348txe+wSJ7MalTMYKQoIkwrXU0gc1
 CCOYNFnt3ih3kkjEFNMJ9X3mCyRrOP16BkVsM9EGlj/c8F/qfSwDT9g9FKUXqGosrc6J
 R2RDVRtTJkEHFaK4N+/Fyyga5PzJlSL62IDp8T3N1KQRpRDMdTsvtcoLq86kLkzp/qGV
 jJlBf103iST+tQVCvFP5OyDmMAxLhYGfs7FtIC6Wr0H917CsQy5cptYs3A/K6XafCt4r
 z9BPS1myK63kF2r2jn9+MrGe8a9m73g4JBktG174nMmycW9YgotDeCtETxCt9ha5v4vR
 /YYg==
X-Gm-Message-State: AOAM532TgW3wZTUonyomWbDcukbyJ0xZTz4wkTJeoj5DKaccIQJJFj6k
 rYkoIMG4s7OtVJr9jQnQmKXu1lHfEM8fOwYdPUxUtA==
X-Received: by 2002:a92:9904:: with SMTP id p4mr338118ili.145.1606871973022;
 Tue, 01 Dec 2020 17:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20201201082142.649007-1-pcc@google.com>
 <d932a9a0-c577-4159-0100-9c2942d279b7@csgraf.de>
 <CAMn1gO4qtzB30s3=AAdCQSyvwhNY43F_DxOji5iJuxJuKeko4g@mail.gmail.com>
 <14cfa271-d1a8-6fe4-969a-a0903dc690b3@csgraf.de>
In-Reply-To: <14cfa271-d1a8-6fe4-969a-a0903dc690b3@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 1 Dec 2020 17:19:21 -0800
Message-ID: <CAMn1gO4OhrRPbGLh1zrqGT_jyhzB3Fg+JirHqUuNaJT3=E77Aw@mail.gmail.com>
Subject: Re: [PATCH] arm/hvf: Optimize and simplify WFI handling
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=pcc@google.com; helo=mail-il1-x143.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HSiMN7M1029Z

On Tue, Dec 1, 2020 at 2:04 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 01.12.20 19:59, Peter Collingbourne wrote:
> > On Tue, Dec 1, 2020 at 3:16 AM Alexander Graf <agraf@csgraf.de> wrote:
> >> Hi Peter,
> >>
> >> On 01.12.20 09:21, Peter Collingbourne wrote:
> >>> Sleep on WFx until the VTIMER is due but allow ourselves to be woken
> >>> up on IPI.
> >>>
> >>> Signed-off-by: Peter Collingbourne <pcc@google.com>
> >>
> >> Thanks a bunch!
> >>
> >>
> >>> ---
> >>> Alexander Graf wrote:
> >>>> I would love to take a patch from you here :). I'll still be stuck f=
or a
> >>>> while with the sysreg sync rework that Peter asked for before I can =
look
> >>>> at WFI again.
> >>> Okay, here's a patch :) It's a relatively straightforward adaptation
> >>> of what we have in our fork, which can now boot Android to GUI while
> >>> remaining at around 4% CPU when idle.
> >>>
> >>> I'm not set up to boot a full Linux distribution at the moment so I
> >>> tested it on upstream QEMU by running a recent mainline Linux kernel
> >>> with a rootfs containing an init program that just does sleep(5)
> >>> and verified that the qemu process remains at low CPU usage during
> >>> the sleep. This was on top of your v2 plus the last patch of your v1
> >>> since it doesn't look like you have a replacement for that logic yet.
> >>>
> >>>    accel/hvf/hvf-cpus.c     |  5 +--
> >>>    include/sysemu/hvf_int.h |  3 +-
> >>>    target/arm/hvf/hvf.c     | 94 +++++++++++-------------------------=
----
> >>>    3 files changed, 28 insertions(+), 74 deletions(-)
> >>>
> >>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> >>> index 4360f64671..b2c8fb57f6 100644
> >>> --- a/accel/hvf/hvf-cpus.c
> >>> +++ b/accel/hvf/hvf-cpus.c
> >>> @@ -344,9 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
> >>>        sigact.sa_handler =3D dummy_signal;
> >>>        sigaction(SIG_IPI, &sigact, NULL);
> >>>
> >>> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> >>> -    sigdelset(&set, SIG_IPI);
> >>> -    pthread_sigmask(SIG_SETMASK, &set, NULL);
> >>> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> >>> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
> >>
> >> What will this do to the x86 hvf implementation? We're now not
> >> unblocking SIG_IPI again for that, right?
> > Yes and that was the case before your patch series.
>
>
> The way I understand Roman, he wanted to unblock the IPI signal on x86:
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20201126215017.4115=
6-3-agraf@csgraf.de/#23807021
>
> I agree that at this point it's not a problem though to break it again.
> I'm not quite sure how to merge your patches within my patch set though,
> given they basically revert half of my previously introduced code...
>
>
> >
> >>>    #ifdef __aarch64__
> >>>        r =3D hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->h=
vf->exit, NULL);
> >>> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> >>> index c56baa3ae8..13adf6ea77 100644
> >>> --- a/include/sysemu/hvf_int.h
> >>> +++ b/include/sysemu/hvf_int.h
> >>> @@ -62,8 +62,7 @@ extern HVFState *hvf_state;
> >>>    struct hvf_vcpu_state {
> >>>        uint64_t fd;
> >>>        void *exit;
> >>> -    struct timespec ts;
> >>> -    bool sleeping;
> >>> +    sigset_t unblock_ipi_mask;
> >>>    };
> >>>
> >>>    void assert_hvf_ok(hv_return_t ret);
> >>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> >>> index 8fe10966d2..60a361ff38 100644
> >>> --- a/target/arm/hvf/hvf.c
> >>> +++ b/target/arm/hvf/hvf.c
> >>> @@ -2,6 +2,7 @@
> >>>     * QEMU Hypervisor.framework support for Apple Silicon
> >>>
> >>>     * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> >>> + * Copyright 2020 Google LLC
> >>>     *
> >>>     * This work is licensed under the terms of the GNU GPL, version 2=
 or later.
> >>>     * See the COPYING file in the top-level directory.
> >>> @@ -18,6 +19,7 @@
> >>>    #include "sysemu/hw_accel.h"
> >>>
> >>>    #include <Hypervisor/Hypervisor.h>
> >>> +#include <mach/mach_time.h>
> >>>
> >>>    #include "exec/address-spaces.h"
> >>>    #include "hw/irq.h"
> >>> @@ -320,18 +322,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >>>
> >>>    void hvf_kick_vcpu_thread(CPUState *cpu)
> >>>    {
> >>> -    if (cpu->hvf->sleeping) {
> >>> -        /*
> >>> -         * When sleeping, make sure we always send signals. Also, cl=
ear the
> >>> -         * timespec, so that an IPI that arrives between setting hvf=
->sleeping
> >>> -         * and the nanosleep syscall still aborts the sleep.
> >>> -         */
> >>> -        cpu->thread_kicked =3D false;
> >>> -        cpu->hvf->ts =3D (struct timespec){ };
> >>> -        cpus_kick_thread(cpu);
> >>> -    } else {
> >>> -        hv_vcpus_exit(&cpu->hvf->fd, 1);
> >>> -    }
> >>> +    cpus_kick_thread(cpu);
> >>> +    hv_vcpus_exit(&cpu->hvf->fd, 1);
> >>
> >> This means your first WFI will almost always return immediately due to=
 a
> >> pending signal, because there probably was an IRQ pending before on th=
e
> >> same CPU, no?
> > That's right. Any approach involving the "sleeping" field would need
> > to be implemented carefully to avoid races that may result in missed
> > wakeups so for simplicity I just decided to send both kinds of
> > wakeups. In particular the approach in the updated patch you sent is
> > racy and I'll elaborate more in the reply to that patch.
> >
> >>>    }
> >>>
> >>>    static int hvf_inject_interrupts(CPUState *cpu)
> >>> @@ -385,18 +377,19 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>            uint64_t syndrome =3D hvf_exit->exception.syndrome;
> >>>            uint32_t ec =3D syn_get_ec(syndrome);
> >>>
> >>> +        qemu_mutex_lock_iothread();
> >>
> >> Is there a particular reason you're moving the iothread lock out again
> >> from the individual bits? I would really like to keep a notion of fast
> >> path exits.
> > We still need to lock at least once no matter the exit reason to check
> > the interrupts so I don't think it's worth it to try and avoid locking
> > like this. It also makes the implementation easier to reason about and
> > therefore more likely to be correct. In our implementation we just
> > stay locked the whole time unless we're in hv_vcpu_run() or pselect().
> >
> >>>            switch (exit_reason) {
> >>>            case HV_EXIT_REASON_EXCEPTION:
> >>>                /* This is the main one, handle below. */
> >>>                break;
> >>>            case HV_EXIT_REASON_VTIMER_ACTIVATED:
> >>> -            qemu_mutex_lock_iothread();
> >>>                current_cpu =3D cpu;
> >>>                qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1=
);
> >>>                qemu_mutex_unlock_iothread();
> >>>                continue;
> >>>            case HV_EXIT_REASON_CANCELED:
> >>>                /* we got kicked, no exit to process */
> >>> +            qemu_mutex_unlock_iothread();
> >>>                continue;
> >>>            default:
> >>>                assert(0);
> >>> @@ -413,7 +406,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>                uint32_t srt =3D (syndrome >> 16) & 0x1f;
> >>>                uint64_t val =3D 0;
> >>>
> >>> -            qemu_mutex_lock_iothread();
> >>>                current_cpu =3D cpu;
> >>>
> >>>                DPRINTF("data abort: [pc=3D0x%llx va=3D0x%016llx pa=3D=
0x%016llx isv=3D%x "
> >>> @@ -446,8 +438,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>                    hvf_set_reg(cpu, srt, val);
> >>>                }
> >>>
> >>> -            qemu_mutex_unlock_iothread();
> >>> -
> >>>                advance_pc =3D true;
> >>>                break;
> >>>            }
> >>> @@ -493,68 +483,36 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>            case EC_WFX_TRAP:
> >>>                if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_reque=
st &
> >>>                    (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> >>> -                uint64_t cval, ctl, val, diff, now;
> >>> +                uint64_t cval;
> >>>
> >>> -                /* Set up a local timer for vtimer if necessary ... =
*/
> >>> -                r =3D hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_C=
NTV_CTL_EL0, &ctl);
> >>> -                assert_hvf_ok(r);
> >>>                    r =3D hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG=
_CNTV_CVAL_EL0, &cval);
> >>>                    assert_hvf_ok(r);
> >>>
> >>> -                asm volatile("mrs %0, cntvct_el0" : "=3Dr"(val));
> >>> -                diff =3D cval - val;
> >>> -
> >>> -                now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
> >>> -                      gt_cntfrq_period_ns(arm_cpu);
> >>> -
> >>> -                /* Timer disabled or masked, just wait for long */
> >>> -                if (!(ctl & 1) || (ctl & 2)) {
> >>> -                    diff =3D (120 * NANOSECONDS_PER_SECOND) /
> >>> -                           gt_cntfrq_period_ns(arm_cpu);
> >>> +                int64_t ticks_to_sleep =3D cval - mach_absolute_time=
();
> >>> +                if (ticks_to_sleep < 0) {
> >>> +                    break;
> >>
> >> This will loop at 100% for Windows, which configures the vtimer as
> >> cval=3D0 ctl=3D7, so with IRQ mask bit set.
> > Okay, but the 120s is kind of arbitrary so we should just sleep until
> > we get a signal. That can be done by passing null as the timespec
> > argument to pselect().
>
>
> The reason I capped it at 120s was so that if I do hit a race, you don't
> break everything forever. Only for 2 minutes :).

I see. I think at this point we want to notice these types of bugs if
they exist instead of hiding them, so I would mildly be in favor of
not capping at 120s.

> >
> >>
> >> Alex
> >>
> >>
> >>>                    }
> >>>
> >>> -                if (diff < INT64_MAX) {
> >>> -                    uint64_t ns =3D diff * gt_cntfrq_period_ns(arm_c=
pu);
> >>> -                    struct timespec *ts =3D &cpu->hvf->ts;
> >>> -
> >>> -                    *ts =3D (struct timespec){
> >>> -                        .tv_sec =3D ns / NANOSECONDS_PER_SECOND,
> >>> -                        .tv_nsec =3D ns % NANOSECONDS_PER_SECOND,
> >>> -                    };
> >>> -
> >>> -                    /*
> >>> -                     * Waking up easily takes 1ms, don't go to sleep=
 for smaller
> >>> -                     * time periods than 2ms.
> >>> -                     */
> >>> -                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2)=
)) {
> >>
> >> I put this logic here on purpose. A pselect(1 ns) easily takes 1-2ms t=
o
> >> return. Without logic like this, super short WFIs will hurt performanc=
e
> >> quite badly.
> > I don't think that's accurate. According to this benchmark it's a few
> > hundred nanoseconds at most.
> >
> > pcc@pac-mini /tmp> cat pselect.c
> > #include <signal.h>
> > #include <sys/select.h>
> >
> > int main() {
> >    sigset_t mask, orig_mask;
> >    pthread_sigmask(SIG_SETMASK, 0, &mask);
> >    sigaddset(&mask, SIGUSR1);
> >    pthread_sigmask(SIG_SETMASK, &mask, &orig_mask);
> >
> >    for (int i =3D 0; i !=3D 1000000; ++i) {
> >      struct timespec ts =3D { 0, 1 };
> >      pselect(0, 0, 0, 0, &ts, &orig_mask);
> >    }
> > }
> > pcc@pac-mini /tmp> time ./pselect
> >
> > ________________________________________________________
> > Executed in  179.87 millis    fish           external
> >     usr time   77.68 millis   57.00 micros   77.62 millis
> >     sys time  101.37 millis  852.00 micros  100.52 millis
> >
> > Besides, all that you're really saving here is the single pselect
> > call. There are no doubt more expensive syscalls involved in exiting
> > and entering the VCPU that would dominate here.
>
>
> I would expect that such a super low ts value has a short-circuit path
> in the kernel as well. Where things start to fall apart is when you're
> at a threshold where rescheduling might be ok, but then you need to take
> all of the additional task switch overhead into account. Try to adapt
> your test code a bit:
>
> #include <signal.h>
> #include <sys/select.h>
>
> int main() {
>    sigset_t mask, orig_mask;
>    pthread_sigmask(SIG_SETMASK, 0, &mask);
>    sigaddset(&mask, SIGUSR1);
>    pthread_sigmask(SIG_SETMASK, &mask, &orig_mask);
>
>    for (int i =3D 0; i !=3D 10000; ++i) {
> #define SCALE_MS 1000000
>      struct timespec ts =3D { 0, SCALE_MS / 10 };
>      pselect(0, 0, 0, 0, &ts, &orig_mask);
>    }
> }
>
>
> % time ./pselect
> ./pselect  0.00s user 0.01s system 1% cpu 1.282 total
>
> You're suddenly seeing 300=C2=B5s overhead per pselect call then. When I
> measured actual enter/exit times in QEMU, I saw much bigger differences
> between "time I want to sleep for" and "time I did sleep" even when just
> capturing the virtual time before and after the nanosleep/pselect call.

Okay. So the alternative is that we spin on the CPU, either doing
no-op VCPU entries/exits or something like:

while (mach_absolute_time() < cval);

My intuition is we shouldn't try to subvert the OS scheduler like this
unless it's proven to help with some real world metric since otherwise
we're not being fair to the other processes on the CPU. With CPU
intensive workloads I wouldn't expect these kinds of sleeps to happen
very often if at all so if it's only microbenchmarks and so on that
are affected then my inclination is not to do this for now.

Peter
