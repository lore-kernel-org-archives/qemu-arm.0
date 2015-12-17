Received: by 10.182.158.201 with SMTP id ww9csp584937obb;
        Thu, 17 Dec 2015 11:05:19 -0800 (PST)
X-Received: by 10.140.95.109 with SMTP id h100mr70225465qge.8.1450379119870;
        Thu, 17 Dec 2015 11:05:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si12525249qki.94.2015.12.17.11.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9drb-0006Gy-Ez
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:05:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dr5-0005Q5-M9
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:04:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dr4-0002qJ-E6
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:04:47 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dr4-0002q7-AV
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:04:46 -0500
Received: by mail-vk0-x234.google.com with SMTP id f2so13524641vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oHG8dRPuf0Hq/TEwjUKiOJ9fnhM1JBKCFpDizPk3yJ4=;
	b=P9h+QjqL4glN0Vuhpm1l6230Ds3G9+eRh2nsdJzw9cj+WMhsSM0t31W3+IXB5lqugv
	08iHNUaIwcLqAZEr24monfGUkA1qpwCM3/rosynoZsA3Tm8wJOJPSu13iMUr6EhYSb7z
	D83LrbT3z+c75ZySIj1bla5Yr27rkaSB7iBrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oHG8dRPuf0Hq/TEwjUKiOJ9fnhM1JBKCFpDizPk3yJ4=;
	b=lbTKGLgOH1gFhyts2omL8ZWDOPcibgNobvvCqCXCVHRjWPI5CFE+EGIjo533GxZvE/
	WU2PVCHZFmiZwDT4uD7/OtOn4GAUc48J78lVyGVCcrYLGsuCKaLzPah2vWuHlKsfjwIP
	6B+/MERGPTjTVSCLsZRHhofcMenxXJ2Jw47Dqy82pJkHJB0tZbbcuzR99kqOXxJVTi5C
	NpDNBfP2mZjPsJU+kL8w2jb/K/A7Cmlc0jJpg1pHN5O3+2tZgJ1/alB8uk52WkLSU6RO
	rtyOQF8tJZkfW1exd2Okt6PyYEYm2jBbpJG7sC6eMHXclfAtAeDCibs+kNnrcdfBpUtB
	OjsQ==
X-Gm-Message-State: ALoCoQmaAV3Hpr/L89XatkoIwVndWxBbS3KtC1BzqTobFMl/Jo4HfR1Q5C+qDbiObV8QVZRBCa7ySchhsyARbfDGcdDphVxyJZNxBy448sdY3RGVhYJXlSo=
X-Received: by 10.31.107.138 with SMTP id k10mr18707336vki.27.1450379085872;
	Thu, 17 Dec 2015 11:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:04:26 -0800 (PST)
In-Reply-To: <1449101933-24928-10-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-10-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:04:26 +0000
Message-ID: <CAFEAcA9B+Ma40SjR2qoQtTrb-P=w-dH71py7ur67cLmFfxz8cw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 09/26] armv7m: implement CFSR, HFSR, BFAR,
	and MMFAR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MDIUW4hIBF5R

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Add the Configurable, HardFault, BusFault and MemManage Status registers.
> Note undefined instructions, violations, and escalations.
>
> No BusFaults are raised at this point.
> ---
>  hw/intc/armv7m_nvic.c | 28 ++++++++++++++++++++++------
>  target-arm/cpu.h      |  4 ++++
>  target-arm/helper.c   |  3 +++
>  target-arm/machine.c  |  8 ++++++--
>  4 files changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index ca9bd4c..619c320 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -333,6 +333,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
>              irq = ARMV7M_EXCP_HARD;
>              vec = &s->vectors[irq];
>
> +            s->cpu->env.v7m.hfsr |= 1<<30; /* FORCED */

I suggest defining some constants for the various FSR bits, eg

#define HFSR_FORCED (1U << 30)
#define HFSR_DEBUGEVT (1U << 31)

etc.

Then you don't need a comment every time you set a bit to say
what it means...

target-arm/cpu.h is probably the best place for these.

>              DPRINTF(0, "Escalate %d to HardFault\n", oldirq);
>          }
>      }
> @@ -548,16 +549,20 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>          if (s->vectors[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
>          return val;
>      case 0xd28: /* Configurable Fault Status.  */
> -        /* TODO: Implement Fault Status.  */
> -        qemu_log_mask(LOG_UNIMP, "Configurable Fault Status unimplemented\n");
> -        return 0;
> +        return cpu->env.v7m.cfsr;
>      case 0xd2c: /* Hard Fault Status.  */
> +        return cpu->env.v7m.hfsr;
>      case 0xd30: /* Debug Fault Status.  */
> -    case 0xd34: /* Mem Manage Address.  */
> +        qemu_log_mask(LOG_UNIMP, "Debug Fault status register unimplemented\n");
> +        return 0;
> +    case 0xd34: /* MMFAR MemManage Fault Address */
> +        return cpu->env.v7m.mmfar;
>      case 0xd38: /* Bus Fault Address.  */
> +        return cpu->env.v7m.bfar;
>      case 0xd3c: /* Aux Fault Status.  */
>          /* TODO: Implement fault status registers.  */
> -        qemu_log_mask(LOG_UNIMP, "Fault status registers unimplemented\n");
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Aux Fault status registers unimplemented\n");
>          return 0;
>      case 0xd40: /* PFR0.  */
>          return 0x00000030;
> @@ -690,13 +695,24 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>           */
>          break;
>      case 0xd28: /* Configurable Fault Status.  */
> +        cpu->env.v7m.cfsr &= ~value; /* W1C */
> +        break;
>      case 0xd2c: /* Hard Fault Status.  */
> +        cpu->env.v7m.hfsr &= ~value; /* W1C */
> +        break;
>      case 0xd30: /* Debug Fault Status.  */
> +        qemu_log_mask(LOG_UNIMP,
> +                      "NVIC: debug fault status register unimplemented\n");
> +        break;
>      case 0xd34: /* Mem Manage Address.  */
> +        cpu->env.v7m.mmfar = value;
> +        return;
>      case 0xd38: /* Bus Fault Address.  */
> +        cpu->env.v7m.bfar = value;
> +        return;
>      case 0xd3c: /* Aux Fault Status.  */
>          qemu_log_mask(LOG_UNIMP,
> -                      "NVIC: fault status registers unimplemented\n");
> +                      "NVIC: Aux fault status registers unimplemented\n");
>          break;
>      case 0xf00: /* Software Triggered Interrupt Register */
>          if ((value & 0x1ff) < NVIC_MAX_IRQ) {
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 4b7f78e..4262efc 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -396,6 +396,10 @@ typedef struct CPUARMState {
>          uint32_t vecbase;
>          uint32_t basepri;
>          uint32_t control;
> +        uint32_t cfsr; /* Configurable Fault Status */
> +        uint32_t hfsr; /* HardFault Status */
> +        uint32_t mmfar; /* MemManage Fault Address */
> +        uint32_t bfar; /* BusFault Address */
>          int current_sp;
>          int exception;
>          int exception_prio;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4490b74..d1ca011 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5454,6 +5454,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> +        env->v7m.cfsr |= 1<<16; /* UNDEFINSTR */

We get here for other things than UNDEFINSTR (eg NOCP and maybe
also DIVBYZERO and INVSTATE). You need to figure out which before you
can set the right CFSR bit. If you're lucky then exception.syndrome
will have sufficient information; if not then we may need to sort out
something else (probably borrowing syndrome to pass v7m specific
info as needed).

>          break;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
> @@ -5465,6 +5466,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>           * should set the MMFAR, etc from exception.fsr and exception.vaddress.
>           */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
> +        env->v7m.mmfar = env->exception.vaddress;
> +        env->v7m.cfsr = (1<<1)|(1<<7); /* DACCVIOL and MMARVALID */

This change is fixing the TODO comment which you can just see the
tail end of in the context, so you should remove that comment.

You should decode exception.fsr properly to distinguish whether
this is a BusFault or a MemManage fault and what subtype.
(Also whether this is EXCP_DATA_ABORT or EXCP_PREFETCH_ABORT
will tell you whether it's IACCVIOL or DACCVIOL.)

>          break;
>      case EXCP_BKPT:
>          if (semihosting_enabled()) {
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 36a0d15..14a4882 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -92,14 +92,18 @@ static bool m_needed(void *opaque)
>
>  static const VMStateDescription vmstate_m = {
>      .name = "cpu/m",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = m_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
>          VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
>          VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
>          VMSTATE_UINT32(env.v7m.control, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
>          VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
>          VMSTATE_INT32(env.v7m.exception, ARMCPU),
>          VMSTATE_END_OF_LIST()
> --
> 2.1.4

thanks
-- PMM
