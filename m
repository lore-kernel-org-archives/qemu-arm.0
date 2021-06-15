Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2815739lff;
        Tue, 15 Jun 2021 03:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytuzpn/9p9p9kuzbgUUsc7T5Edxddy4etKL5HJpA5+9QFKY27Fnw8cIdaSnV8uleSS7oBo
X-Received: by 2002:a05:6214:80a:: with SMTP id df10mr4480310qvb.8.1623753535981;
        Tue, 15 Jun 2021 03:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623753535; cv=none;
        d=google.com; s=arc-20160816;
        b=iUD4mEWqIIRKb0958m1zGM1iKQhNtsmqF3gQEwKYOtJb5al76Hyqhi/QnRQUa5TQZ3
         7M2c+cX7pFofcaQsWV63CVzbYOJtvTxJ5tFtBVGLcHidoYWgWKTDyA5XvsiJR76n8kZA
         mYRa43TqdQyFuDOGL9ox8vqp0HL0vs6m6uGayEebEfZ5pW/2okc53wN3u5zVxNkOwwxq
         DZRVZEY6X2+Diiz1m4bnmAi9lBrIG2EpXlgPlSuekKD2lclZjnGJIuiAohFYw+cLBmpn
         OWgibCzRvEVpw2n4ka7QWt4CNu3bT9e5OsB/tG8amlrQeQ5kmIgXnAn5owg/qxxF2dO7
         0BvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vv/CT0fKvaPeFR3Ti4jdnOBGVsF+9TG7IqZ4f54M//k=;
        b=XuGx2xy3rEVTh4aD1IunMNaoeTXehurptA3JRoevBS8lgi73goitzpHsEDK3d+8d/O
         +qVTLU+eqX9mfs+Stk5/lAB+QnDiuRTZ71xJCPQ+wLe04pxkRe6ZKN4Tjfr6GRsMU61i
         VRVPIRzK0yASFOWcmydWtwYgllmSxr1zhlUluvR46v0CBfVbh2Cjyp/QQB3NsVqlJN3U
         kU0vV/+9LEKbrQObV9Be1E/e48oucCQt+/jMa1RM+xm8/hgFtHM09l6VqLaTSY/2+WgE
         7exliooPKFQ0RG6Wr2/+iPaugRjlNjeQmF7WuL5KmD7nqxGfTyUEMIToZcNAKd6RgEYy
         n+vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VScNS8XH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si4996671qta.377.2021.06.15.03.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 03:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VScNS8XH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt6T9-0006ol-9f
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 06:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6Sz-0006nh-Is
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:38:45 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6Sy-000514-1V
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:38:45 -0400
Received: by mail-ej1-x636.google.com with SMTP id g8so21772252ejx.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vv/CT0fKvaPeFR3Ti4jdnOBGVsF+9TG7IqZ4f54M//k=;
 b=VScNS8XHIdufHOveytkWiJmhYLwwk6Gi1w7lvdx3b2OBCbSQLgpReXBKpEUXiUfNeH
 1CY7xQlcSdsY0YIT/IybF1W0ni6MeWUdPlLg50xm4OVgkJMj8Yb/lL1+pFz3dDbvHWrU
 PWLJnsT7G6P4TNQOQuVTxvJuQRdLZdanJclOXNdFyz2ngN9zQApwZS1ltdZXwQd4SsvF
 sJHldvtEFcDOW26yfizY1XIRRt0MulKYywcDcH0zfqcRGv6rxxGine93xMGRPvXZhh4a
 i6D2m8q+xf4YPmBg9lLp7DbWGIU9r+dOAeG0I9k4RtsM8oAOJtnGxwrzTGO5fjFL0TTV
 do5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vv/CT0fKvaPeFR3Ti4jdnOBGVsF+9TG7IqZ4f54M//k=;
 b=m0/+Uw+lYAFUeK/iddxggXISlgda6v1PiO/6Tg3SeHNZ0TpnaM7I6pcGKNPFCe4+RE
 zMwIaIdq0NmB3ejFHJK+KzLWg8+JyNBUSdwNtiHPByaTFS5bnvkuH4gopAyDkR6Do5ln
 xxdnRh5URI8eQG+2cLV9XkF/1+28jdbY4fk4C8l7KqJ+kqX+do8N+JjA9OwEtoYTdVq3
 +CDO+V7rYeM+Eoul7FiQkZZEnv8A2SCt+ROiORZd0ZQIJEKN/m3p0mSIrWFlPO3wVBvM
 G282JWlVLWFnHIWGDezd/xi2grBO23cxb2v1HzwdesWMnUBDvVYTlrvgbnCJEjMflVRU
 Mbqw==
X-Gm-Message-State: AOAM531U6ro7Bl3LhbKVk7ves/sB1cNq09olCHLMUs2Bc9SuzGMbzjGl
 v5bh4O7/U21EfM5+UAvROe/KBOoAuxgaDEtVzCk0uA==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr19719725ejz.382.1623753521874; 
 Tue, 15 Jun 2021 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-15-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-15-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:38:07 +0100
Message-ID: <CAFEAcA9ATvn2yp=_VPitFRnWzZacGy7aodQGNTPMnwsUoFr0xA@mail.gmail.com>
Subject: Re: [PATCH v8 14/19] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: akJgyqscokMB

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
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
>
> ---

> +static void hvf_wfi(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    hv_return_t r;
> +    uint64_t ctl;
> +
> +    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
> +        /* Interrupt pending, no need to wait */
> +        return;
> +    }
> +
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> +                            &ctl);
> +    assert_hvf_ok(r);
> +
> +    if (!(ctl & 1) || (ctl & 2)) {
> +        /* Timer disabled or masked, just wait for an IPI. */
> +        hvf_wait_for_ipi(cpu, NULL);
> +        return;
> +    }
> +
> +    uint64_t cval;
> +    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> +                            &cval);
> +    assert_hvf_ok(r);
> +
> +    int64_t ticks_to_sleep = cval - mach_absolute_time();

This looks odd. The CNTV_CVAL is the compare value against
the CNTVCT (virtual count), which should start at 0 when the
VM starts, pause when the VM is paused, and so on. But here
we are comparing it against what looks like a host absolute
timecount...

> +    if (ticks_to_sleep < 0) {
> +        return;
> +    }
> +
> +    uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> +    uint64_t nanos =
> +        (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> +        1000000000 / arm_cpu->gt_cntfrq_hz;

Should this be calling gt_cntfrq_period_ns() ?
(If not, please use the NANOSECONDS_PER_SECOND constant instead of
a raw 1000000000.)

> +
> +    /*
> +     * Don't sleep for less than the time a context switch would take,
> +     * so that we can satisfy fast timer requests on the same CPU.
> +     * Measurements on M1 show the sweet spot to be ~2ms.
> +     */
> +    if (!seconds && nanos < 2000000) {

"2 * SCALE_MS" is a bit easier to read I think.

> +        return;
> +    }
> +
> +    struct timespec ts = { seconds, nanos };
> +    hvf_wait_for_ipi(cpu, &ts);
> +}

thanks
-- PMM
