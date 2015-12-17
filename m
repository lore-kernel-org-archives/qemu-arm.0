Received: by 10.182.158.201 with SMTP id ww9csp600958obb;
        Thu, 17 Dec 2015 11:35:21 -0800 (PST)
X-Received: by 10.55.209.24 with SMTP id s24mr29229760qki.72.1450380921080;
        Thu, 17 Dec 2015 11:35:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m205si12611644qhm.111.2015.12.17.11.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:35:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eKe-0004Fd-JJ
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:35:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eC9-0006Q8-LV
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:26:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eC8-0008Ny-2v
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:26:33 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eC7-0008Nk-Up
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:26:32 -0500
Received: by mail-vk0-x236.google.com with SMTP id a189so52585101vkh.2
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yNf9VSVas7p7ji1bbEWbtDTEDOMCxnG0u0wcEVIjZi8=;
	b=ZHfH56GD71pY+kb9eMLIAzC5/l2aRh1VlBkdQyj2cD1JhlyXPuzm2A2z8aBHmAzB7w
	YDYlMxaK1yHVwTElU8X6ZcrCg9xN5HWcd7IEc7Ic+3x3aB4wP76n3O5rFJG2VKQWxDP/
	5+XIltF7z3uTOdKBWKCiFYbAcx4aNAfChEq78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yNf9VSVas7p7ji1bbEWbtDTEDOMCxnG0u0wcEVIjZi8=;
	b=S/B2MK/z32E2voiRYbxGUj0kCCMU/93UwC0gKxhZcFnrlKVlNLEgs/vZ4PfgQwNPPm
	QDyeaYXs0C6ezFjGuqIj3ipmWBGzGQnWDHU9qmJIWfpzB9QEFOsvjZWXPFDsqJSGjQ6I
	Rqrsgs9bJLlkWWWRiKyECIkP5LW6mgTSHrgpH89zRN2kXhtnCJ8es5RFueiMeorm29R1
	OXagmBmpbOYzGzmaHK1IiXTQft7RY7558+qz4WCNSsi5U2BoRrZ0L25OUQyE1ae3uLhh
	JFwRBJyoVNlYf0F2vmWmi0TS6rIy97MJ3mZls64gSxpncSnSx7SxxkzXlgpjMdkrzDzZ
	RXwg==
X-Gm-Message-State: ALoCoQkSnC9bPwYX4IpVR3KprTz1egLTkQ5mkYoD9M1I7HWIhpIY31zaow7GkFMp0bp+hZBWpuVlEl0tmTQ5glu5frsdbIII6IZ6BwbMHGl2mxPOEIXcHJQ=
X-Received: by 10.31.13.205 with SMTP id 196mr40546632vkn.37.1450380391594;
	Thu, 17 Dec 2015 11:26:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:26:12 -0800 (PST)
In-Reply-To: <1449101933-24928-13-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-13-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:26:12 +0000
Message-ID: <CAFEAcA-dYHJDc5YsneK63ubTHfrrf7RfpV23+r8VbE77X6yKyA@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 12/26] armv7m: check exception return
	consistency
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
X-TUID: ARHNGBfjv905

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Detect use of reserved exception return codes
> and return to thread mode from nested
> exception handler.
>
> Also check consistency between NVIC and CPU
> wrt. the active exception.
> ---
>  hw/intc/armv7m_nvic.c |  7 +++-
>  target-arm/cpu.h      |  2 +-
>  target-arm/helper.c   | 95 ++++++++++++++++++++++++++++++++++++++++++++++-----
>  3 files changed, 94 insertions(+), 10 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 619c320..7d261ae 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -396,7 +396,7 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
>      assert(env->v7m.exception > 0); /* spurious exception? */
>  }
>
> -void armv7m_nvic_complete_irq(void *opaque, int irq)
> +bool armv7m_nvic_complete_irq(void *opaque, int irq)
>  {
>      NVICState *s = (NVICState *)opaque;
>      VecInfo *vec;
> @@ -406,12 +406,17 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
>
>      vec = &s->vectors[irq];
>
> +    if (!vec->active) {
> +        return true;
> +    }
> +
>      vec->active = 0;
>      vec->pending = vec->level;
>      assert(!vec->level || irq >= 16);
>
>      nvic_irq_update(s);
>      DPRINTF(0, "EOI %d\n", irq);
> +    return false;
>  }
>
>  /* Only called for external interrupt (vector>=16) */
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 4262efc..b98ef89 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1043,7 +1043,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq);
>  bool armv7m_nvic_is_active(void *opaque, int irq);
>  int armv7m_nvic_get_active_prio(void *opaque);
>  void armv7m_nvic_acknowledge_irq(void *opaque);
> -void armv7m_nvic_complete_irq(void *opaque, int irq);
> +bool armv7m_nvic_complete_irq(void *opaque, int irq);

A brief comment here describing what the return value means would be nice.

>
>  /* Interface for defining coprocessor registers.
>   * Registers are defined in tables of arm_cp_reginfo structs
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index b6ec761..f7e496d 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5375,18 +5375,65 @@ static void switch_v7m_sp(CPUARMState *env, int process)
>
>  static void do_v7m_exception_exit(CPUARMState *env)
>  {
> +    unsigned ufault = 0;
>      uint32_t type;
>      uint32_t xpsr;
>
> -    type = env->regs[15];
> +    if (env->v7m.exception == 0) {
> +        hw_error("Return from exception w/o active exception.  Logic error.");

Should this just be an assert(), or can the guest provoke this?

> +    }
> +
>      if (env->v7m.exception != ARMV7M_EXCP_NMI) {
>          /* Auto-clear FAULTMASK on return from other than NMI */
>          env->daif &= ~PSTATE_F;
>      }
> -    if (env->v7m.exception != 0) {
> -        armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
> +
> +    if (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Requesting return from exception "
> +                      "from inactive exception %d\n",
> +                      env->v7m.exception);
> +        ufault = 1;
> +    }
> +    env->v7m.exception = -42; /* spoil, will be unstacked below */

I don't really like this. If you're going to do it please at least
use a symbolic constant rather than hardcoding -42.

> +    env->v7m.exception_prio = armv7m_nvic_get_active_prio(env->nvic);
> +
> +    type = env->regs[15] & 0xf;
> +    /* QEMU seems to clear the LSB at some point. */
> +    type |= 1;

This is a rather vague comment. The LSB of regs[15] is always
clear because Thumb PCs are 2-aligned. We don't ever store the
"Thumb mode" bit in regs[15] (and the hardware doesn't either).

> +
> +    switch (type) {
> +    case 0x1: /* Return to Handler mode */
> +        if (env->v7m.exception_prio == 0x100) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Requesting return from exception "
> +                          "to Handler mode not allowed at base level of "
> +                          "activation");
> +            ufault = 1;

What is this test? None of the listed integrity checks in section
B1.5.8 of the v7M ARM ARM or the ExceptionReturn pseudocode cehck
the priority of the currently executing exception.

> +        }
> +        break;
> +    case 0x9: /* Return to Thread mode w/ Main stack */
> +    case 0xd: /* Return to Thread mode w/ Process stack */
> +        if (env->v7m.exception_prio != 0x100) {
> +            /* Attempt to return to Thread mode
> +             * from nested handler while NONBASETHRDENA not set.
> +             */
> +            qemu_log_mask(LOG_GUEST_ERROR, "Nested exception return to %d w/"
> +                          " Thread mode while NONBASETHRDENA not set\n",
> +                          env->v7m.exception);

The error message and the comment talk about NONBASETHRDENA, but
the code isn't testing it. Also, you have nothing corresponding
to what the pseudocode NestedActivation variable is tracking
(ie is there a single active exception currently).

> +            ufault = 1;
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "Exception return w/ reserved code"
> +                                       " %02x\n", (unsigned)type);
> +        ufault = 1;
>      }
>
> +    /* TODO? if ufault==1 ARM calls for entering exception handler
> +     * directly w/o popping stack.
> +     * We pop anyway since the active UsageFault will push on entry
> +     * which should happen before execution resumes?
> +     */

There is a distinction if SP is currently pointing at an invalid
address -- if you try to unstack and stack again then that will
fault and the guest can see the difference. This is a corner case
that I'm happy with us just marking as TODO for the moment though.
(Also I think there may be a difference if we have a pending NMI
at this point, but I haven't thought that through.)

> +
>      /* Switch to the target stack.  */
>      switch_v7m_sp(env, (type & 4) != 0);
>      /* Pop registers.  */
> @@ -5409,14 +5456,46 @@ static void do_v7m_exception_exit(CPUARMState *env)
>      }
>      xpsr = v7m_pop(env);
>      xpsr_write(env, xpsr, 0xfffffdff);
> +
> +    assert(env->v7m.exception!=-42);
> +
>      /* Undo stack alignment.  */
>      if (xpsr & 0x200)
>          env->regs[13] |= 4;
> -    /* ??? The exception return type specifies Thread/Handler mode.  However
> -       this is also implied by the xPSR value. Not sure what to do
> -       if there is a mismatch.  */
> -    /* ??? Likewise for mismatches between the CONTROL register and the stack
> -       pointer.  */
> +
> +    if (!ufault) {
> +        /* consistency check between NVIC and guest stack */
> +        if (env->v7m.exception == 0 && env->v7m.exception_prio != 0x100) {
> +            ufault = 1;
> +            qemu_log_mask(LOG_GUEST_ERROR, "Can't Unstacked to thread mode "
> +                          "with active exception\n");
> +            env->v7m.exception_prio = 0x100;
> +
> +        } else if (env->v7m.exception != 0 &&
> +                   !armv7m_nvic_is_active(env->nvic, env->v7m.exception))
> +        {
> +            ufault = 1;
> +            qemu_log_mask(LOG_GUEST_ERROR, "Unstacked exception %d is not "
> +                          "active\n", env->v7m.exception);
> +        } else  if (env->v7m.exception != 0
> +                    && env->v7m.exception_prio == 0x100) {
> +            hw_error("logic error at exception exit\n");
> +        }
> +        /* ARM calls for PushStack() here, which should happen
> +         * went we return with a pending exception

"when"

> +         */
> +    }
> +
> +    if (ufault) {
> +        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> +        env->v7m.cfsr |= 1<<18; /* INVPC */
> +    }
> +
> +    /* Ensure that priority is consistent.  Clear for Thread mode
> +     * and set for Handler mode
> +     */
> +    assert((env->v7m.exception == 0 && env->v7m.exception_prio > 0xff)
> +           || (env->v7m.exception != 0 && env->v7m.exception_prio <= 0xff));
>  }
>
>  static

thanks
-- PMM
