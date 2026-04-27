Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5AFF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 11:16:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHJwf-0006vr-EK; Mon, 27 Apr 2026 07:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJwR-0006s3-5t
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:15:59 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJwD-0005Dr-Q7
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:15:47 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651c366f7efso10137628d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 04:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777288537; cv=none;
 d=google.com; s=arc-20240605;
 b=aB1/cQCkf4jOhq0Gh0VIhXffTR/LEdMo+kz5k3v1KQaWOKV3uKTniQF/fHF1rpWI3N
 OulkvlJfkZnIEZZDa3832/hBrlVO8r6t5RGOoDm3bRakZkJkx/Iy2rFLmGTY3PWWIjOu
 +eBAV1SWSMT+umm2GVlTaor+Z064r8zhDWQBiTkJIaNMA4QuDO5ctgXedL2TeNb3T6sY
 2fMcuKS6XC1V6n546uVR4zulbwgFhcYqYC9tDuUtb+O4xVpIpPJVnP4gV28cT5REma6V
 KZYFQiI8aJNyzdzOKF6URYpLPS2faAZOFmPg35L64kHYN7bLJOCIdkZ0DBYLYxfTm/WV
 zsxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XvXQjPpVyTBT7utFRaiYJELt8AOVtar8+L24Hso4Stg=;
 fh=+9UDMOTmfw6NtUcz7dxTRGIQM2FV6dyYMyRZ/q6Ig4U=;
 b=g6ZOvg0gsV5o/aGi87kDM9yG+/QbC+koiAcCQcr3UmmbE4jsdDMY/0VOx1e41GLdp5
 xty/Z17kWv4JJM2JcnpW3YkUpS2wxJFgya9nVYTjyrHPf7g4Bjatrv8snGAUDeNWvK5r
 BbOVCgdo1FZ9KD5ZvHd/QYhvpQ2xSD07+8rHrbK7auV9aGKylJyxp4WB7km8ldVikXvT
 6npgyWFAdjnyQKe3XE4WMluLopnd9jxM42QbN+rUp/LNKah/xl6aMpI2ntzHQryAKd9f
 vJbttyT1iQqdDjgilmjQVhj2EV3pHeuLh4LPvS4qhjUsC6FNS/2aadsy7ZE+9WiibDoZ
 V35w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777288537; x=1777893337; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvXQjPpVyTBT7utFRaiYJELt8AOVtar8+L24Hso4Stg=;
 b=ZKuqFBlT+yFdK9pG99HcWv2wKXXod3sCjA71J0YD/yeeo5tkTzwsCJ8qp7IJF3unzl
 AkPp/bUiV2KgJLIo/2EQoUkk1lFZtiY1LT+YqdGmaQjC1FBOg4ykrXB56sWeBy614N24
 ykxIqcPA8j9t6WPl7F0IIPcC7ZRbz1uTgjexkHhF0uo+ExupaHa2D27idp/svRLYFxbX
 R/M5DXEO76Sb0I1SMj0I4WzvKsDlZFpSNFXs5GSlwybKPyIbzN2MCoyITGq6aCQxYmYS
 YVV7W3pOaRXD4m16PEskeJHvPVCV8fU3zaznFSHf8ULH0MHLl8WwhtBx9zZuwWmfk7Le
 N5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777288537; x=1777893337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvXQjPpVyTBT7utFRaiYJELt8AOVtar8+L24Hso4Stg=;
 b=Hl87AEDyD0K4KjPFw8xhzF9RGW45PkgJmO4NATqqTXnQxePoEiHN1dsUUDGykcaauF
 vAn0/yTrnEobrBwA1+OvuFcQCqy2nMRNFRW/9t20GAJOON+KKxaSnL7Orr4uTnX/KfBe
 O7jmOra9w4PLXcwYjJbIXNNb3Wn4cYVBTMQ191TmEUV1zZdHS7/m9z4Smj5ZYs33WPHo
 mw1hdtPFfGkhs4TIYYCRDY9jiDbJ+KJM2tO8II1GQ6dVggOWY5Dxs4RJWIt1GqGCAv4G
 6bI2fmFwMwWY9SVEGGqd/5JJl04fkfV0DYSY3tzc5T/KftNTUeoxmaY2D8otwXDtvBxc
 5gIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+3WWQpExCsNh2JCDZf+OqK+TnvZXqAsNCG2A/guGxqYwltNGNp7TkiH8SrTGKykrYbjgYqbF6vgw==@nongnu.org
X-Gm-Message-State: AOJu0YyWTYYz+NTnuocRh/Lyy0IhYe0PspQf9rYwUrYgf6rK8YQkIs7+
 AVDYQoq5rEe6g0kO+qCo4choZyA57LmIG1xa2Wvs7XYho0veI+ImMA5vSbvGODNOKKkdcbedlMu
 vmqJbmt31Ur20Y7Y6VilZHpmduaxkE3Oz4n8KTXl1bA==
X-Gm-Gg: AeBDievVUw2oH1EIbugThickOSJ/HMvCSC4ElUT48gBzplQJ107dzjirrJhpDWOodt2
 NklFkb3Ql3YgEj9OQerSpKjUScKhSgLq3egibVIGXSzykzKMSQyPwdX5XQ/DKTL7G9gVFPZDJmK
 BcpK36/54/lhqoeKKaqjen57dQL5bdndTIJJtqzETALzS0JsCv0kg8NznXacDQ4uhiA5xYT2BrQ
 qIKJcsviWOZfahUrOdyoToo4CpQxGmMt1gKQyjjB15YpE1OxI+MDK6AKCODwX32AbFB9eN9p77x
 6anW7Z0NJq2MyWMqXaqgiNbNz/JdjPfHVlqxylPsOv8He/tOTcN0GBpzu0AQ4VAeBUMHO/hX6hE
 43g==
X-Received: by 2002:a05:690e:d0a:b0:653:1945:8fab with SMTP id
 956f58d0204a3-65319459b3cmr38342261d50.43.1777288537181; Mon, 27 Apr 2026
 04:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260410044726.61853-1-scottjgo@gmail.com>
 <20260410055045.63001-1-scottjgo@gmail.com>
In-Reply-To: <20260410055045.63001-1-scottjgo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 12:15:25 +0100
X-Gm-Features: AVHnY4IrVaAknF8pb63PJgE2xMZClVrFOdJbAzwV0P2JnXEfrSF0mwf6CtZuy34
Message-ID: <CAFEAcA9RHQ+7++=kLn2goJwcgzDnaqdkQtQBtxQ2Rw1-uiKY=g@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
To: "Scott J. Goldman" <scottjgo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, rbolshakov@ddn.com, 
 phil@philjordan.eu, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 10 Apr 2026 at 06:50, Scott J. Goldman <scottjgo@gmail.com> wrote:
>
> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
> changed hvf_wfi() from blocking the vCPU thread with pselect() to
> returning EXCP_HLT, intending QEMU's main event loop to handle the
> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
> always returns false and the vCPU thread spins at 100% CPU per core
> while the guest is idle.
>
> Fix this by:
>
> 1. Setting cpu->halted = 1 in hvf_wfi() so the vCPU thread sleeps on
>    halt_cond in qemu_process_cpu_events().
>
> 2. Arming a host-side QEMU_CLOCK_HOST timer to fire when the guest's
>    virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
>    because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>    hv_vcpu_run(), which is not called while the CPU is halted. The
>    timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
>    vtimer IRQ through the GIC and marks vtimer_masked, causing the
>    interrupt delivery chain to wake the vCPU via qemu_cpu_kick().

A host side timer here seems a bit odd -- it will still
expire even if the user halts the whole VM. We only use
QEMU_CLOCK_HOST timers for things that are part of QEMU proper,
like handling timeouts in the migration networking code.

> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
> index 2621164cb2..58fb865eba 100644
> --- a/include/system/hvf_int.h
> +++ b/include/system/hvf_int.h
> @@ -48,6 +48,7 @@ struct AccelCPUState {
>      hv_vcpu_exit_t *exit;
>      bool vtimer_masked;
>      bool guest_debug_enabled;
> +    struct QEMUTimer *wfi_timer;
>  #endif
>  };

QEMUTimer objects need to be migrated. I think as it is now,
if you do a migration while one vCPU is in WFI we won't
migrate the timer state, and so on the destination it won't
be woken up when it should.

> +static void hvf_wfi_timer_cb(void *opaque)
> +{
> +    CPUState *cpu = opaque;
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +
> +    /*
> +     * vtimer expired while the CPU was halted for WFI.
> +     * Mirror HV_EXIT_REASON_VTIMER_ACTIVATED: raise the vtimer
> +     * interrupt and mark as masked so hvf_sync_vtimer() will
> +     * check and unmask when the guest handles it.
> +     *
> +     * The interrupt delivery chain (GIC -> cpu_interrupt ->
> +     * qemu_cpu_kick) wakes the vCPU thread from halt_cond.
> +     */
> +    qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
> +    cpu->accel->vtimer_masked = true;

If the VM happens to be stopped by the user when the timer
fires, this will change the VM state, which I suspect is
not correct. Avoiding use of a QEMU_CLOCK_HOST timer would
fix this.

> +}
> +
>  static int hvf_wfi(CPUState *cpu)
>  {
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    uint64_t ctl, cval;
> +    hv_return_t r;
> +
>      if (cpu_has_work(cpu)) {
>          /*
>           * Don't bother to go into our "low power state" if
> @@ -2037,6 +2068,34 @@ static int hvf_wfi(CPUState *cpu)
>          return 0;
>      }
>
> +    /*
> +     * Set up a host-side timer to wake us when the vtimer expires.
> +     * HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
> +     * hv_vcpu_run(), which we won't call while halted.
> +     */
> +    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
> +    assert_hvf_ok(r);
> +
> +    if ((ctl & TMR_CTL_ENABLE) && !(ctl & TMR_CTL_IMASK)) {
> +        r = hv_vcpu_get_sys_reg(cpu->accel->fd,
> +                                HV_SYS_REG_CNTV_CVAL_EL0, &cval);
> +        assert_hvf_ok(r);
> +
> +        uint64_t now = hvf_vtimer_val_raw();
> +        if (cval <= now) {
> +            /* Timer already expired, don't halt */
> +            return 0;
> +        }
> +
> +        uint64_t delta_ticks = cval - now;
> +        int64_t delta_ns = delta_ticks * NANOSECONDS_PER_SECOND
> +                           / arm_cpu->gt_cntfrq_hz;

As a general rule, tick-to-ns and vice-versa conversions should
use muldiv64() to avoid potential overflow in the intermediate value.

> +        int64_t deadline = qemu_clock_get_ns(QEMU_CLOCK_HOST) + delta_ns;
> +
> +        timer_mod(cpu->accel->wfi_timer, deadline);
> +    }
> +
> +    cpu->halted = 1;
>      return EXCP_HLT;
>  }

thanks
-- PMM

