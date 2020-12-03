Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp611397lfb;
        Thu, 3 Dec 2020 10:19:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxckNFW5KKZ6EkHSEGnOkwwemgMprPpAsh5r3K85gy2TuPmT5aaEZCbzV6tEK3FR9bl1Gzx
X-Received: by 2002:a25:774c:: with SMTP id s73mr630808ybc.262.1607019570191;
        Thu, 03 Dec 2020 10:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607019570; cv=none;
        d=google.com; s=arc-20160816;
        b=gvbyEp+oG5pObRK2Q1HFYVKH6Pk2+TacraJzdPWQkqWOovok1nu4aLopYqEKyOdGBN
         YApUYdxQ+n5OuXgn1NCJD48auqw7L5LdDauKxgqjCc6SygHJfPJxmMUb0cm8NUD1nWA6
         CW+U68PQcOpdZMwBSZO6+W137WErBlnlusbKlogH7g1JCeTk1xG+43a+4RrhP4dBkSH1
         j+G5g9If6OjNyTaz0O6LzzQRY9KnJ+doU3f3DFPV4++DKy/Ts7YPaoGR3r5ud/mRUNuF
         2y24139Q/uFYjcAGJJMDJeR5bg+dgaUQDZS375tkn7bbPfjUQoJsdZzYAS6AR2y99uTu
         cb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XouQXNk1ygjsPrcd65VhmmS5YnlV3+QZ4o5+3fbl2xc=;
        b=UEhHq5PxbzDL+lRaOctL88GpSSoNTsLmVvgKUd+OWh9YBCN90X5W2hI7yyi7sTrKzb
         Uq2m57g8z9KGZnpecjIIzCisFoey7AFm5dbqpQJPwrHGFFUNQWOc6mfwiWThCUPuxw7Y
         1FNVi3Y5M8lAxsCcnuk3ajC44bs8XZZS0HtKavztdbRkFeNKKqmhBl63ZiGyZsmK3yCl
         logDS8u33rg0oxh6WvFcTPOZXDPpjswZ3kWP5lDjiTwNHPqEoeXOZiDs/Wrt3ImEZ3ag
         GfTUwlKQLW5lKqT6zFAhsB4ZumBjhYL00/yU3pMerMYuDQ3KGQcsALc9N/mW9DfS6f4h
         a9xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=o+of32SI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si143272ybz.208.2020.12.03.10.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 10:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=o+of32SI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kktCT-0005G5-ID
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 13:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kktBc-0005EV-Dl
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 13:18:37 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:44263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kktBV-0004wz-FZ
 for qemu-arm@nongnu.org; Thu, 03 Dec 2020 13:18:36 -0500
Received: by mail-il1-x142.google.com with SMTP id r17so2779968ilo.11
 for <qemu-arm@nongnu.org>; Thu, 03 Dec 2020 10:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XouQXNk1ygjsPrcd65VhmmS5YnlV3+QZ4o5+3fbl2xc=;
 b=o+of32SIWbIQomAQomEKwsQBDyBdxZePzVg+Bobib04mecVyI7S6PGFT5ukOShQP1x
 Uo3NXYgcmePw6xFTlY0WxjVPfjqD+GZcmLe+1DhGEnPIgzQt31hb2BmkxlPY0MCqU6+9
 kOvxgz2mflgL807zKfedRdes5yEY/Q7UjkAdVYbIFmZjeDhSa1ae+9Qla2uRhCxxSwwZ
 31tZKqHSX03hEUknoHwmsKUW+/C1WIoPSBXCl49fv4g2bmaD3levKOoy4y4W87HMrOf7
 qVibULHsxVy/eFUw2r17BmWuk4MZJ7wDwPj4Ei6dJD5r/xsSKWYWKJo5yPRwnEeLyT2k
 yK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XouQXNk1ygjsPrcd65VhmmS5YnlV3+QZ4o5+3fbl2xc=;
 b=jfEv8XK+knoE6J65o1ne9E6jV9yPE9sdxptN5r+kIvy0hm0jzXMMLHBuagJ9DmYvXj
 DUzLYT6bMrN8txPJPn8Y42/yGTqYLDt9KWeDSXIQ8f0dyQRpzmSq5JaS9nT2K56EHScv
 XY4O6NdHKOWYj2b7UcPnIjrnTodIV+4LmTmbQ1cUu8J339HakcuSSq/s8SVAl4JZrElF
 aP/KTd3xyJB/uAmqM9kSlsNYnkSORcH094XF4pnLe3f0j74joAcarj4eOMETyZLVzLkW
 4BsslL+ed6lg6hOuc4ha3XBDdoIktW/z/GPANVgS27fTXpCh1ZmBrvlJvmzXRujiD2oq
 BmIA==
X-Gm-Message-State: AOAM530FHRjEPhYjLixpYfxMTEmOsxVAIZGMKXHh0pUz633dKX+gyD/L
 F/S0k/xMBQcrrLmFZhv4f28gobpXsdIsEv4mjnjg4Q==
X-Received: by 2002:a92:990e:: with SMTP id p14mr478259ili.28.1607019506219;
 Thu, 03 Dec 2020 10:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-9-agraf@csgraf.de>
 <20201203103949.GC7201@SPB-NB-133.local>
In-Reply-To: <20201203103949.GC7201@SPB-NB-133.local>
From: Peter Collingbourne <pcc@google.com>
Date: Thu, 3 Dec 2020 10:18:14 -0800
Message-ID: <CAMn1gO4adJvkWDMV6e0Caigh7B3O5STq=S5P_F6SbWi58x22CQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm/hvf: Add a WFI handler
To: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani <dirty@apple.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Frank Yang <lfy@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pcc@google.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: OTOSbEO/vn4n

On Thu, Dec 3, 2020 at 2:39 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> On Wed, Dec 02, 2020 at 08:04:06PM +0100, Alexander Graf wrote:
> > From: Peter Collingbourne <pcc@google.com>
> >
> > Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> > up on IPI.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > ---
> >  accel/hvf/hvf-cpus.c     |  5 ++--
> >  include/sysemu/hvf_int.h |  1 +
> >  target/arm/hvf/hvf.c     | 55 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> > index e613c22ad0..a981ccde70 100644
> > --- a/accel/hvf/hvf-cpus.c
> > +++ b/accel/hvf/hvf-cpus.c
> > @@ -337,15 +337,14 @@ static int hvf_init_vcpu(CPUState *cpu)
> >      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
> >
> >      /* init cpu signals */
> > -    sigset_t set;
> >      struct sigaction sigact;
> >
> >      memset(&sigact, 0, sizeof(sigact));
> >      sigact.sa_handler = dummy_signal;
> >      sigaction(SIG_IPI, &sigact, NULL);
> >
> > -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> > -    sigdelset(&set, SIG_IPI);
> > +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> > +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
> >
> >  #ifdef __aarch64__
> >      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> > diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> > index 5f15119184..13adf6ea77 100644
> > --- a/include/sysemu/hvf_int.h
> > +++ b/include/sysemu/hvf_int.h
> > @@ -62,6 +62,7 @@ extern HVFState *hvf_state;
> >  struct hvf_vcpu_state {
> >      uint64_t fd;
> >      void *exit;
> > +    sigset_t unblock_ipi_mask;
> >  };
> >
> >  void assert_hvf_ok(hv_return_t ret);
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 5ecce36d4a..79aeeb237b 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -2,6 +2,7 @@
> >   * QEMU Hypervisor.framework support for Apple Silicon
> >
> >   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> > + * Copyright 2020 Google LLC
> >   *
> >   * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >   * See the COPYING file in the top-level directory.
> > @@ -18,6 +19,7 @@
> >  #include "sysemu/hw_accel.h"
> >
> >  #include <Hypervisor/Hypervisor.h>
> > +#include <mach/mach_time.h>
> >
> >  #include "exec/address-spaces.h"
> >  #include "hw/irq.h"
> > @@ -413,6 +415,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >
> >  void hvf_kick_vcpu_thread(CPUState *cpu)
> >  {
> > +    cpus_kick_thread(cpu);
> >      hv_vcpus_exit(&cpu->hvf->fd, 1);
> >  }
> >
> > @@ -468,6 +471,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
> >      return 0;
> >  }
> >
> > +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> > +{
> > +    /*
> > +     * Use pselect to sleep so that other threads can IPI us while we're
> > +     * sleeping.
> > +     */
> > +    qatomic_mb_set(&cpu->thread_kicked, false);
> > +    qemu_mutex_unlock_iothread();
>
> I raised a concern earlier, but I don't for sure if a kick could be lost
> right here. On x86 it could be lost.

If the signal is sent right before the pselect() it will be blocked
i.e. left pending. With the pselect() we get an atomic unblock of
SIG_IPI at the same time as we begin sleeping, which means that we
will receive the signal and leave the pselect() immediately.

I think at some point macOS had an incorrect implementation of
pselect() where the signal mask was non-atomically set in userspace
which could lead to the signal being missed but I checked the latest
XNU sources and it looks like the pselect() implementation has been
moved to the kernel.

> > +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> > +    qemu_mutex_lock_iothread();
> > +}
> > +
> >  int hvf_vcpu_exec(CPUState *cpu)
> >  {
> >      ARMCPU *arm_cpu = ARM_CPU(cpu);
> > @@ -579,6 +594,46 @@ int hvf_vcpu_exec(CPUState *cpu)
> >          }
> >          case EC_WFX_TRAP:
> >              advance_pc = true;
> > +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> > +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > +
> > +                uint64_t ctl;
> > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> > +                                        &ctl);
> > +                assert_hvf_ok(r);
> > +
> > +                if (!(ctl & 1) || (ctl & 2)) {
> > +                    /* Timer disabled or masked, just wait for an IPI. */
> > +                    hvf_wait_for_ipi(cpu, NULL);
> > +                    break;
> > +                }
> > +
> > +                uint64_t cval;
> > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> > +                                        &cval);
> > +                assert_hvf_ok(r);
> > +
> > +                int64_t ticks_to_sleep = cval - mach_absolute_time();
>
>
> Apple reference recommends to use [1]:
>
>   clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
>
> It, internally in Libc, invokes mach_absolute_time() [2].
>
> 1. https://developer.apple.com/documentation/kernel/1462446-mach_absolute_time
> 2. https://opensource.apple.com/source/Libc/Libc-1158.1.2/gen/clock_gettime.c.auto.html

I think that recommendation is because most people want to deal with
seconds, not ticks. In our case we specifically want ticks because
we're comparing against a ticks value from the guest, so I don't see
the benefit of converting from ticks to seconds and back again.

Peter

>
> Thanks,
> Roman
>
> > +                if (ticks_to_sleep < 0) {
> > +                    break;
> > +                }
> > +
> > +                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> > +                uint64_t nanos =
> > +                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> > +                    1000000000 / arm_cpu->gt_cntfrq_hz;
> > +
> > +                /*
> > +                 * Don't sleep for less than 2ms. This is believed to improve
> > +                 * latency of message passing workloads.
> > +                 */
> > +                if (!seconds && nanos < 2000000) {
> > +                    break;
> > +                }
> > +
> > +                struct timespec ts = { seconds, nanos };
> > +                hvf_wait_for_ipi(cpu, &ts);
> > +            }
> >              break;
> >          case EC_AA64_HVC:
> >              cpu_synchronize_state(cpu);
> > --
> > 2.24.3 (Apple Git-128)
> >
