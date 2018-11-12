Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2539780wrw;
        Sun, 11 Nov 2018 16:16:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5fvrNvYKV8J2fYWzzE89ml/FySBYuM0iehPrg4vk2UYAUuQtznKM9NE3j9Ob0SJ2RdrIecI
X-Received: by 2002:a0c:e40a:: with SMTP id o10mr16973798qvl.197.1541981769010;
        Sun, 11 Nov 2018 16:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541981769; cv=none;
        d=google.com; s=arc-20160816;
        b=mvrFXGTchR8DBSauyDrVEPbzZvdHxf2ON2+6FLemXUGjrivXQlxXLVyJM4BpqkrIpF
         LP/AnV+Hf/rNGMpOB2M7C0CycqeRMTAzzBufS/KzdQaN9zzWMXf2a0u68QxLO2eblXMB
         8wE4YHYiQBXy7ZgL3x9y7/FFqCI1Ta01Tcw6NDti/ZwdgacTI9qWlG0VXipBZLtTM3xb
         QMgpe0U8FhSyb9x+rLXlYjO87UCOYOAGHzZEww6Vn9AUszzUtF/XCFgcUsGOcDrinNeK
         mty8gfAjj8XIwkj7jv9sChwRGQq5Hncbh1D2rI3P+AuYxO0FXD/hi6jxJvTMilxyJWN5
         hLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=2NDAGfaH90dUYtmfqprg5ZwyGZeYz6OLw9/ix/LHVOs=;
        b=N/2PHV5CTdn6QckPyOlkWCtkntgxnQzWowEn6oI2UQUazkK9IfvRbXArqpfbJPXYIa
         SvzggNs+7BmdGGC4TA7KKZiENa3bbs03ZPGKiPlvuoGdY2oZ/ZYXj7IJd+Z0bpFxmcLJ
         E76P4NV4Me0hh5Izk7AALunfbJ6HWCSWN+63BknWGJ/t8ZYSN0CUZC0TF91DdEhsQPxX
         zYobjXq9/7OhLR346Yf/Wqv/pGam6vIdt8Xo4IInApBUy2UHoRV3TS/DoEKKIlAXMGEt
         wFXGJ/aQXxZ+pLbQYDWni3lhAMCuBw/3UMoLjG7fpjCL/YkcgZqBvHdOyvB68N9g9G93
         tLEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g51si8438864qtc.224.2018.11.11.16.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 16:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLztg-0001jO-Gj
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 19:16:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLztS-0001hl-Vl
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLztP-00041J-Lo
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:15:54 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:38207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLztP-0003q7-Gl; Sun, 11 Nov 2018 19:15:51 -0500
Received: by mail-yb1-f194.google.com with SMTP id u103-v6so3262148ybi.5;
	Sun, 11 Nov 2018 16:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2NDAGfaH90dUYtmfqprg5ZwyGZeYz6OLw9/ix/LHVOs=;
	b=iBNZcoI9VAlYPsFHvd+1r16weaPTxKz4+XEHRJT4VCfSby5SlmgSECPuP990qQ9kZ2
	zBTzERiRM8mE124ZZ5W4lQYqfE+G4pQS6g+xAEjgDYJlvaoajujLx9Dk6aWH94PRgkeT
	7AHQYsgYm/8iNxPMiiQLncCkTy2gTTraDop0I+xrqwhHifrjUtgPNGwesSpeR6hekUay
	l//mJvpBhV532vSRyS7jmLAY1RIzTJbZgQb/wF9XD7IDNlqcXls+wOoFwyWcJAYbdvNA
	o+PV1rweIA5qAfk+WmgZj/wkEgaPhM6jF3sqoFh64v7d/OHmGGGvZxrbLxBNNEtN/GlN
	10Og==
X-Gm-Message-State: AGRZ1gJiMUfujjWfuH2s83OuHju3FxllNsM92D6r+PnhztJ+2VSpUWK3
	kKsGyGhc9XPUc1oIihHFYGId7Wwe2GNS+Tjg4yhlzyLE
X-Received: by 2002:a25:d64d:: with SMTP id
	n74-v6mr16578548ybg.204.1541981740777; 
	Sun, 11 Nov 2018 16:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20181109134731.11605-1-peter.maydell@linaro.org>
	<20181109134731.11605-2-peter.maydell@linaro.org>
In-Reply-To: <20181109134731.11605-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 01:15:29 +0100
Message-ID: <CAAdtpL4TJonY7ko9V9ggNut--evB9s6YkrfNJJtj73ZUOxZ3gA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.194
Subject: Re: [Qemu-arm] [PATCH for-v3.1 1/3] Revert "target/arm: Implement
 HCR.VI and VF"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, adam.lackorzynski@kernkonzept.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +I5YyOTmuvLv

On Fri, Nov 9, 2018 at 2:48 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> This reverts commit 8a0fc3a29fc2315325400c738f807d0d4ae0ab7f.
>
> The implementation of HCR.VI and VF in that commit is not
> correct -- they do not track the overall "is there a pending
> VIRQ or VFIQ" status, but whether there is a pending interrupt
> due to "this mechanism", ie the hypervisor having set the VI/VF
> bits. The overall pending state for VIRQ and VFIQ is effectively
> the logical OR of the inbound lines from the GIC with the
> VI and VF bits. Commit 8a0fc3a29fc231 would result in pending
> VIRQ/VFIQ possibly being lost when the hypervisor wrote to HCR.
>
> As a preliminary to implementing the HCR.VI/VF feature properly,
> revert the broken one entirely.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

On Fri, Nov 9, 2018 at 2:49 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> Currently we track the state of the four irq lines from the GIC
> only via the cs->interrupt_request or KVM irq state. That means
> that we assume that an interrupt is asserted if and only if the
> external line is set. This assumption is incorrect for VIRQ
> and VFIQ, because the HCR_EL2.{VI,VF} bits allow assertion
> of VIRQ and VFIQ separately from the state of the external line.
>
> To handle this, start tracking the state of the external lines
> explicitly in a CPU state struct field, as is common practice
> for devices.
>
> The complicated part of this is dealing with inbound migration
> from an older QEMU which didn't have this state. We assume in
> that case that the older QEMU did not implement the HCR_EL2.{VI,VF}
> bits as generating interrupts, and so the line state matches
> the current state in cs->interrupt_request. (This is not quite
> true between commit 8a0fc3a29fc2315325400c7 and its revert, but
> that commit is broken and never made it into any released QEMU
> version.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 47 ++++-----------------------------------------
>  1 file changed, 4 insertions(+), 43 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 851ea9aa977..f3878f505b7 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3931,7 +3931,6 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[=
] =3D {
>  static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t=
 value)
>  {
>      ARMCPU *cpu =3D arm_env_get_cpu(env);
> -    CPUState *cs =3D ENV_GET_CPU(env);
>      uint64_t valid_mask =3D HCR_MASK;
>
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
> @@ -3950,28 +3949,6 @@ static void hcr_write(CPUARMState *env, const ARMC=
PRegInfo *ri, uint64_t value)
>      /* Clear RES0 bits.  */
>      value &=3D valid_mask;
>
> -    /*
> -     * VI and VF are kept in cs->interrupt_request. Modifying that
> -     * requires that we have the iothread lock, which is done by
> -     * marking the reginfo structs as ARM_CP_IO.
> -     * Note that if a write to HCR pends a VIRQ or VFIQ it is never
> -     * possible for it to be taken immediately, because VIRQ and
> -     * VFIQ are masked unless running at EL0 or EL1, and HCR
> -     * can only be written at EL2.
> -     */
> -    g_assert(qemu_mutex_iothread_locked());
> -    if (value & HCR_VI) {
> -        cs->interrupt_request |=3D CPU_INTERRUPT_VIRQ;
> -    } else {
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_VIRQ;
> -    }
> -    if (value & HCR_VF) {
> -        cs->interrupt_request |=3D CPU_INTERRUPT_VFIQ;
> -    } else {
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_VFIQ;
> -    }
> -    value &=3D ~(HCR_VI | HCR_VF);
> -
>      /* These bits change the MMU setup:
>       * HCR_VM enables stage 2 translation
>       * HCR_PTW forbids certain page-table setups
> @@ -3999,32 +3976,16 @@ static void hcr_writelow(CPUARMState *env, const =
ARMCPRegInfo *ri,
>      hcr_write(env, NULL, value);
>  }
>
> -static uint64_t hcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> -{
> -    /* The VI and VF bits live in cs->interrupt_request */
> -    uint64_t ret =3D env->cp15.hcr_el2 & ~(HCR_VI | HCR_VF);
> -    CPUState *cs =3D ENV_GET_CPU(env);
> -
> -    if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
> -        ret |=3D HCR_VI;
> -    }
> -    if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
> -        ret |=3D HCR_VF;
> -    }
> -    return ret;
> -}
> -
>  static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>      { .name =3D "HCR_EL2", .state =3D ARM_CP_STATE_AA64,
> -      .type =3D ARM_CP_IO,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.hc=
r_el2),
> -      .writefn =3D hcr_write, .readfn =3D hcr_read },
> +      .writefn =3D hcr_write },
>      { .name =3D "HCR", .state =3D ARM_CP_STATE_AA32,
> -      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
> +      .type =3D ARM_CP_ALIAS,
>        .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.hc=
r_el2),
> -      .writefn =3D hcr_writelow, .readfn =3D hcr_read },
> +      .writefn =3D hcr_writelow },
>      { .name =3D "ELR_EL2", .state =3D ARM_CP_STATE_AA64,
>        .type =3D ARM_CP_ALIAS,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 4, .crm =3D 0, .opc2 =3D 1,
> @@ -4261,7 +4222,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>
>  static const ARMCPRegInfo el2_v8_cp_reginfo[] =3D {
>      { .name =3D "HCR2", .state =3D ARM_CP_STATE_AA32,
> -      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
> +      .type =3D ARM_CP_ALIAS,
>        .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 4,
>        .access =3D PL2_RW,
>        .fieldoffset =3D offsetofhigh32(CPUARMState, cp15.hcr_el2),
> --
> 2.19.1
>
>
