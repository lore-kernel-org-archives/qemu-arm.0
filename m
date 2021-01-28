Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp363527lfo;
        Thu, 28 Jan 2021 08:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuosA5p521K/mOWerfkSKX7zWsM0bLtgw8HeJU8OHWtgABISaI8t+Hk4DXfuxgGS9QzU/i
X-Received: by 2002:a25:a183:: with SMTP id a3mr24159617ybi.459.1611851265329;
        Thu, 28 Jan 2021 08:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611851265; cv=none;
        d=google.com; s=arc-20160816;
        b=Rori0p4cK38AjwsXdqKyBOriRwUOPsNTE3UaHbtjgNrr+Bph3UY119X2hK1A0CToti
         4Fu7GNXGIQkWrmKXLWNBarpXSJqItiJPO62XaFimwsmJpBMPjeTgppJoPz6SOwBTYIy9
         MvS9Pobm0sOtEPdyNgd38C6cBDfMu+x9LV+tWsy79eN/2aYwr5o10XctWe5Ezk4NeW+8
         1NuJnDcDFMMfI0T/ePe5THMLEDT8E9QQ22yKh5fJhlN+A4kyUSRph8E/I99Ob5DeM8Gp
         o9nHa0agi1hCnu8thjPI3wWljI6DGoinuKuYr8UNzityOaJ7jKS2TYypdAZPYcJT+LmN
         HKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJuGslgeW7w4cAv44iEm6ui16UJgZucXEB/uRmVEIrs=;
        b=HrF8+o6+L+lBJ9skOzmzLyUH82yKbDJMP0XtkfyGs/1J0MX0gwvLCFOlMzR2UyD1di
         pjrSeyYWUGcqo2qE54BwQWo1vXqcD2x8c0AcNIxEapkNGgay9qKrJz3SkTniWOATbjDn
         j6itZFBdZyhMdxjTFQvxH7+Bgl55ZOEaJ6wgjtdrBVmJV89a8EI2p/O+aEYEpl6O9IS4
         /ozFEnbt/RbkSETbjhYtgpUwRiLQquA1IZsSPgezD97IQFsFql5NU2gT/fK4Cabm708g
         SLngytqjPLS+8gNYSd14lmAyCaX8o29ehKvuLulw3Xts8OX1hEeQA6HYZzJwR0hehPEJ
         63yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UcmAC4E9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z92si6292636ybh.63.2021.01.28.08.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 08:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UcmAC4E9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5A92-00029i-Lm
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 11:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5A7G-0000ie-Ih
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:25:54 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5A7E-0005GL-B7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:25:54 -0500
Received: by mail-ed1-x536.google.com with SMTP id d2so7323817edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJuGslgeW7w4cAv44iEm6ui16UJgZucXEB/uRmVEIrs=;
 b=UcmAC4E9+LvX0HJlehbjSZR5vVMgK7rVTCQV1n5kBA8OgFxe0hWCYvN9jKbUDGDWHh
 461Iu6A5GArzS3XPJSyLcxSxBcXAuKFHdh3BQcs4UqQY+ShgCGdLecXxbm9abSSbB1c7
 yjl3RrxT5+GB8Cr8FH3V7LuOhNFDIiVxug8lyW0s0oPIoXCgTna5j9xVnV0UAEQh29Nq
 WWcWRgzX0uAZVhLifrmsQSVu4d0yzM+J2WPou/kTFHH8HsFWpLl+ewjH/Cnoi6apKH39
 +5JbJ9J46IUL4ciNuYeYAKLPj/2FOmVguQsX6/evgE2/QOkC3IUmD9rn6ltQnvgUOlOD
 V1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJuGslgeW7w4cAv44iEm6ui16UJgZucXEB/uRmVEIrs=;
 b=bNAnbjCaiSan1Y8xQ0abL96lYsWHf4diJAlv6/gRyTS9kBwVAqlMEFa1TxhSklonfM
 JZ+vrA924C2Y3sHeHnDweE6FEFxdxjq10rRmdOCQ1ZgU0tMtdCGEw4elSJLoUFSlazZN
 MieeKH9HKzSC43UH+8C5WZV0DVGlk6eClpOOR9GBUl/gK+8DaiXMhwdPfhDG8XZDFMoz
 0WvodVpjH34e8T0CF0JfILpwYS71g/54TcWTVa7GrAYNOmCYWUGrIRbwJqMHJPXp9tUF
 dx8FAoigCdZuCw3SSkSfjRxae/oSQTHgHCjA5z2zYSQYvsEuGD0TkOtURsGs/a9SfRxs
 A7ow==
X-Gm-Message-State: AOAM5318NvZhF6f4Yp21jSaSGZ2PDQejWtsnNjKa+qVMdAjGt+HC8Cvt
 krti9gshfUlwrcUPNy8nXabze5bcWZ3hyliFXbtRkQ==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr381301edd.52.1611851150324; 
 Thu, 28 Jan 2021 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-10-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:25:39 +0000
Message-ID: <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idYdQJ2Efjdq

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> From: Peter Collingbourne <pcc@google.com>
>
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
>
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  accel/hvf/hvf-cpus.c     |  5 ++--
>  include/sysemu/hvf_int.h |  1 +
>  target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 3 deletions(-)
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 6d70ee742e..abef6a58f7 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -322,15 +322,14 @@ static int hvf_init_vcpu(CPUState *cpu)
>      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
>
>      /* init cpu signals */
> -    sigset_t set;
>      struct sigaction sigact;
>
>      memset(&sigact, 0, sizeof(sigact));
>      sigact.sa_handler = dummy_signal;
>      sigaction(SIG_IPI, &sigact, NULL);
>
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
>
>  #ifdef __aarch64__
>      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> index c2ac6c8f97..7a397fe85a 100644
> --- a/include/sysemu/hvf_int.h
> +++ b/include/sysemu/hvf_int.h
> @@ -51,6 +51,7 @@ extern HVFState *hvf_state;
>  struct hvf_vcpu_state {
>      uint64_t fd;
>      void *exit;
> +    sigset_t unblock_ipi_mask;
>  };
>
>  void assert_hvf_ok(hv_return_t ret);
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8f18efe856..f0850ab14a 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2,6 +2,7 @@
>   * QEMU Hypervisor.framework support for Apple Silicon
>
>   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> + * Copyright 2020 Google LLC
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
> @@ -17,6 +18,8 @@
>  #include "sysemu/hvf_int.h"
>  #include "sysemu/hw_accel.h"
>
> +#include <mach/mach_time.h>
> +
>  #include "exec/address-spaces.h"
>  #include "hw/irq.h"
>  #include "qemu/main-loop.h"
> @@ -411,6 +414,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>
>  void hvf_kick_vcpu_thread(CPUState *cpu)
>  {
> +    cpus_kick_thread(cpu);
>      hv_vcpus_exit(&cpu->hvf->fd, 1);
>  }
>
> @@ -466,6 +470,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
>      return 0;
>  }
>
> +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> +{
> +    /*
> +     * Use pselect to sleep so that other threads can IPI us while we're
> +     * sleeping.
> +     */
> +    qatomic_mb_set(&cpu->thread_kicked, false);
> +    qemu_mutex_unlock_iothread();
> +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> +    qemu_mutex_lock_iothread();
> +}

It seems a bit odd that this is specific to Arm hvf.
Doesn't x86 hvf need "pause until interrupt" functionality ?

> +
>  int hvf_vcpu_exec(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -577,6 +593,46 @@ int hvf_vcpu_exec(CPUState *cpu)
>          }
>          case EC_WFX_TRAP:
>              advance_pc = true;
> +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> +
> +                uint64_t ctl;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> +                                        &ctl);
> +                assert_hvf_ok(r);
> +
> +                if (!(ctl & 1) || (ctl & 2)) {
> +                    /* Timer disabled or masked, just wait for an IPI. */
> +                    hvf_wait_for_ipi(cpu, NULL);
> +                    break;
> +                }
> +
> +                uint64_t cval;
> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> +                                        &cval);
> +                assert_hvf_ok(r);
> +
> +                int64_t ticks_to_sleep = cval - mach_absolute_time();
> +                if (ticks_to_sleep < 0) {
> +                    break;
> +                }
> +
> +                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> +                uint64_t nanos =
> +                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> +                    1000000000 / arm_cpu->gt_cntfrq_hz;
> +
> +                /*
> +                 * Don't sleep for less than 2ms. This is believed to improve
> +                 * latency of message passing workloads.
> +                 */

Believed by who ?

> +                if (!seconds && nanos < 2000000) {
> +                    break;
> +                }
> +
> +                struct timespec ts = { seconds, nanos };
> +                hvf_wait_for_ipi(cpu, &ts);
> +            }

Why doesn't the timer timeout manifest as an IPI ? (Put another way,
why is the timer interrupt special?)

thanks
-- PMM
