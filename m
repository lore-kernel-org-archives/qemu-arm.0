Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D543FFF8860
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 18:42:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHQud-0002il-7t; Mon, 27 Apr 2026 14:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHQub-0002iS-Sk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 14:42:29 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHQuZ-00018Y-CI
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 14:42:29 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-2b4520f6b32so15181306eec.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 11:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777315345; x=1777920145; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9D9752LVMe2fTIJea87T8EvGRre91VlA7lnj2zzLGng=;
 b=BDLLZ0FmCuS1omgFRPCad7kIcEfZ2JZn+QRCwQ0OA2yMuHoywJe09dcxbuQplrGTj8
 ciQvsHnAkL29cx/xsXOE4/LaKVAjS7CgKPdTERt+Fu0nAgPsLDcEnz43URFz7iYEx8Kl
 Y3mEOE6HBvzf+ufPLBOLxvc9aLAriyrEpbO4iSz5qvFD1A/f5+d3nuK7cGF9+GIoJSkk
 sNPYHPDBkPmVbbqbkCrWnq3Dzr22Kw0yJ7lJMskjyD9vOfl6pUsfdtAxIk4IaZ+SZsFa
 YbvAG0xCnECc1FOmoeM3xFFARX/AxVnhRg3JAjcTg8sQGmfEukhmXClpG14kLI8JguHe
 goqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777315345; x=1777920145;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9D9752LVMe2fTIJea87T8EvGRre91VlA7lnj2zzLGng=;
 b=Z8GSL3GjDefRunso2eivugD8emPPp8KAe+BISXIDewRkQcksOzLWqbyMigh5UY6YW9
 WbI7jHA90fEwU2B/zyDmjrrKnnAQUg1d8gRKxRJmHMDX6To1XTNJrtW0mY+I1VR2xza1
 t6HryREtv+ZVdxQ7tt6dpN0n2hUgScvAebNnMjhf4DN0oEONlQdkD7foZelcYkIhDoen
 iFryPyn6STU/rNs5LlQdSlauue10ft6mDvPSaw/4hQLnKOBlxw1IF8DmucspYdEjwOoL
 HmWXm+77+WuI7QuoF0tar/eWh4kRlNufXxp7LomhKsUPzBigR46E6lJDTS4bMPBZ0LQL
 wk0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BISX1FlXtc/FjVfBrWqT50O2A6zV+VHTcicH2SDALEKb6tk91qL8vtlD5UnKkomCtwGO9HEflzQ==@nongnu.org
X-Gm-Message-State: AOJu0YxTc4ow25tNcG7eX1vXJ9mvPeRD07QeRWd6co1D7FYSQ12lQxbr
 MH3LC729JwVDrOrJw/WgCijGywS+cbSHq68pxI1jAiZkHIG12FiVDy5L
X-Gm-Gg: AeBDiev/S/N4vg54pZ76N4iVKCOPjpBY69WvEDcYReBRVWf9CnOMB2pK0HONGqIaTW9
 jBFitHNvUlMvS5EJUo13HRGd7AypKnYq4DPEylx+MfT/BksiM/pF2U0AFibsgLFq4LpAiKFks7L
 vkUjGZRXJtMAUWRy4eY8J8bURdPEpSEhRxaeYXDRQfEbQYEKZgW9ZmCay6JEB0KBDR17AkzBRgK
 RxFZ1am+ZwaLEbAKDkSPhlWaB8284izv2ZAnYueYrXugqXf6Bip4qbY3qoC+0iolOXNz6q9KJKy
 EDR7CpVKHf7L2neTYRa6FFQLc3uMm/FXTHYfaYcOUvlCcvmZAjWnLibIw5/YYQQGuZIssVde6Po
 u/OMLGUrw6BWbhLJJDAnlLlvM0Ur5gB30iVnlmuCxLm8al9Uxn2DUTnHmeG7OvDDLI3w3o3EmG4
 y5HPC6NS2C3LQ4Ub39vL3jGKcdArPwm0DCRERzrVzWJKWHtKJHjLnI0WicmoqneKRxyefHh6NIN
 RDlAXwKmbTj4AegRrm3vN4/TsAVzfHg
X-Received: by 2002:a05:7301:1691:b0:2df:71f0:e5b3 with SMTP id
 5a478bee46e88-2ed0a1403bfmr16838eec.20.1777315345223; 
 Mon, 27 Apr 2026 11:42:25 -0700 (PDT)
Received: from localhost ([2601:645:8200:47:f4a5:bd04:3ca7:5727])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed09f8f2b2sm88182eec.1.2026.04.27.11.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 11:42:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 11:42:23 -0700
Message-Id: <DI45PH4NASOO.3MQVHIFL83QFX@gmail.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <rbolshakov@ddn.com>,
 <phil@philjordan.eu>, <agraf@csgraf.de>
Subject: Re: [PATCH v2] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: "Peter Maydell" <peter.maydell@linaro.org>, "Scott J. Goldman"
 <scottjgo@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260410044726.61853-1-scottjgo@gmail.com>
 <20260410055045.63001-1-scottjgo@gmail.com>
 <CAFEAcA9RHQ+7++=kLn2goJwcgzDnaqdkQtQBtxQ2Rw1-uiKY=g@mail.gmail.com>
In-Reply-To: <CAFEAcA9RHQ+7++=kLn2goJwcgzDnaqdkQtQBtxQ2Rw1-uiKY=g@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=scottjgo@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon Apr 27, 2026 at 4:15 AM PDT, Peter Maydell wrote:
> On Fri, 10 Apr 2026 at 06:50, Scott J. Goldman <scottjgo@gmail.com> wrote=
:
>>
>> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>> changed hvf_wfi() from blocking the vCPU thread with pselect() to
>> returning EXCP_HLT, intending QEMU's main event loop to handle the
>> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
>> always returns false and the vCPU thread spins at 100% CPU per core
>> while the guest is idle.
>>
>> Fix this by:
>>
>> 1. Setting cpu->halted =3D 1 in hvf_wfi() so the vCPU thread sleeps on
>>    halt_cond in qemu_process_cpu_events().
>>
>> 2. Arming a host-side QEMU_CLOCK_HOST timer to fire when the guest's
>>    virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
>>    because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>>    hv_vcpu_run(), which is not called while the CPU is halted. The
>>    timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
>>    vtimer IRQ through the GIC and marks vtimer_masked, causing the
>>    interrupt delivery chain to wake the vCPU via qemu_cpu_kick().
>
> A host side timer here seems a bit odd -- it will still
> expire even if the user halts the whole VM. We only use
> QEMU_CLOCK_HOST timers for things that are part of QEMU proper,
> like handling timeouts in the migration networking code.
>
>> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
>> index 2621164cb2..58fb865eba 100644
>> --- a/include/system/hvf_int.h
>> +++ b/include/system/hvf_int.h
>> @@ -48,6 +48,7 @@ struct AccelCPUState {
>>      hv_vcpu_exit_t *exit;
>>      bool vtimer_masked;
>>      bool guest_debug_enabled;
>> +    struct QEMUTimer *wfi_timer;
>>  #endif
>>  };
>
> QEMUTimer objects need to be migrated. I think as it is now,
> if you do a migration while one vCPU is in WFI we won't
> migrate the timer state, and so on the destination it won't
> be woken up when it should.

Hi Peter--

Thanks for the review here. I am going to post a follow-up patch based
on your comments, but I did want to just flag that migration is broken
in hvf/arm right now (segfaults in the dirty page tracking code). Of
course, I can post fixes for that as well.


>
>> +static void hvf_wfi_timer_cb(void *opaque)
>> +{
>> +    CPUState *cpu =3D opaque;
>> +    ARMCPU *arm_cpu =3D ARM_CPU(cpu);
>> +
>> +    /*
>> +     * vtimer expired while the CPU was halted for WFI.
>> +     * Mirror HV_EXIT_REASON_VTIMER_ACTIVATED: raise the vtimer
>> +     * interrupt and mark as masked so hvf_sync_vtimer() will
>> +     * check and unmask when the guest handles it.
>> +     *
>> +     * The interrupt delivery chain (GIC -> cpu_interrupt ->
>> +     * qemu_cpu_kick) wakes the vCPU thread from halt_cond.
>> +     */
>> +    qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
>> +    cpu->accel->vtimer_masked =3D true;
>
> If the VM happens to be stopped by the user when the timer
> fires, this will change the VM state, which I suspect is
> not correct. Avoiding use of a QEMU_CLOCK_HOST timer would
> fix this.
>
>> +}
>> +
>>  static int hvf_wfi(CPUState *cpu)
>>  {
>> +    ARMCPU *arm_cpu =3D ARM_CPU(cpu);
>> +    uint64_t ctl, cval;
>> +    hv_return_t r;
>> +
>>      if (cpu_has_work(cpu)) {
>>          /*
>>           * Don't bother to go into our "low power state" if
>> @@ -2037,6 +2068,34 @@ static int hvf_wfi(CPUState *cpu)
>>          return 0;
>>      }
>>
>> +    /*
>> +     * Set up a host-side timer to wake us when the vtimer expires.
>> +     * HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>> +     * hv_vcpu_run(), which we won't call while halted.
>> +     */
>> +    r =3D hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, =
&ctl);
>> +    assert_hvf_ok(r);
>> +
>> +    if ((ctl & TMR_CTL_ENABLE) && !(ctl & TMR_CTL_IMASK)) {
>> +        r =3D hv_vcpu_get_sys_reg(cpu->accel->fd,
>> +                                HV_SYS_REG_CNTV_CVAL_EL0, &cval);
>> +        assert_hvf_ok(r);
>> +
>> +        uint64_t now =3D hvf_vtimer_val_raw();
>> +        if (cval <=3D now) {
>> +            /* Timer already expired, don't halt */
>> +            return 0;
>> +        }
>> +
>> +        uint64_t delta_ticks =3D cval - now;
>> +        int64_t delta_ns =3D delta_ticks * NANOSECONDS_PER_SECOND
>> +                           / arm_cpu->gt_cntfrq_hz;
>
> As a general rule, tick-to-ns and vice-versa conversions should
> use muldiv64() to avoid potential overflow in the intermediate value.
>
>> +        int64_t deadline =3D qemu_clock_get_ns(QEMU_CLOCK_HOST) + delta=
_ns;
>> +
>> +        timer_mod(cpu->accel->wfi_timer, deadline);
>> +    }
>> +
>> +    cpu->halted =3D 1;
>>      return EXCP_HLT;
>>  }
>
> thanks
> -- PMM


