Received: by 10.182.158.201 with SMTP id ww9csp602559obb;
        Thu, 17 Dec 2015 11:38:25 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr67204145qhc.43.1450381105158;
        Thu, 17 Dec 2015 11:38:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x130si12656346qhb.26.2015.12.17.11.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eNc-0000Y7-QT
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:38:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eHS-00070A-1U
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eHR-0001A4-2L
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:32:01 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eHP-00017v-Qo
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:32:00 -0500
Received: by mail-vk0-x232.google.com with SMTP id a189so52673887vkh.2
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ruRzBjvC34kpmkwgGCqG5s2V1YfF84/Up92xWZKhnt0=;
	b=GTVaU1E4hrOp+Nb1U0xQqm+AjdA23AW34BiWQ0Dj4X66c0wGxXUaJF6m3PL9K/alz1
	VEB5USYc305/ZzwP+VqaIoHoH6KTJwoPnHngrqIJkbncQSu7pUEh9n2r6bPehzvsKaUO
	Q/GKUSS1nEhuIJi2LDBIYY/cmiT9eiZsRgqhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ruRzBjvC34kpmkwgGCqG5s2V1YfF84/Up92xWZKhnt0=;
	b=Dpxy4UJEL7aG4WBO+5S7AYT0so8138OIFCxQ6PVAypzOizLk3x+Jey6hedhlFTBr11
	SDSnwoWRm3SA2GopjAjKBsX3chR7kO1I3sSvmFCF7No0orlmmQie51Rr3ozS57WeFXOg
	psGGBZcr8yE2NarUY+4NW3z1yHrEwoPAK1aYOmzkEeVIPdoKvKBmpCfDfapjoW6Tb+47
	3PJiO1WUiGLhAkBUgus8/pUPl/jUKVhNPJEgvH0dYGSnziwUF5OYsQ99Rh8WcfgcKNZ7
	7BaGL0zQU2YuaN9L4K6GTUeBYYy/aAyjmewzrpFD06PIHSD/4NI1VI8akUQPoxGAnouz
	YoyA==
X-Gm-Message-State: ALoCoQm2lSd55X4eP5jAg3PJby7wi6Iihm5ePMbxDClwl28b6MwH1A5nbOBJXX7ZabTdTMDPEv+Um74f10Co2NJdkNCLYcHaP35JDejGYrrAhjc+btr1HlI=
X-Received: by 10.31.52.211 with SMTP id b202mr39885721vka.82.1450380719456;
	Thu, 17 Dec 2015 11:31:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:31:40 -0800 (PST)
In-Reply-To: <1449101933-24928-14-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-14-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:31:40 +0000
Message-ID: <CAFEAcA8mryd8zw6mfBc85bpbZKpsFpOC6EEZ+a-J6=9Lc6_vqQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 13/26] armv7m: implement CCR
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
X-TUID: X15P/tYyred9

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Implement Configuration and Control register.
> Handle STACKALIGN and USERSETMPEND bits.

The patch doesn't seem to do anything with USERSETMPEND,
though it does do something with NONBASETHRDENA.

> ---
>  hw/intc/armv7m_nvic.c | 15 +++++++++++----
>  target-arm/cpu.h      |  1 +
>  target-arm/helper.c   |  8 +++-----
>  target-arm/machine.c  |  1 +
>  4 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 7d261ae..0f9ca6a 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -534,8 +534,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>          /* TODO: Implement SLEEPONEXIT.  */
>          return 0;
>      case 0xd14: /* Configuration Control.  */
> -        /* TODO: Implement Configuration Control bits.  */
> -        return 0;
> +        return cpu->env.v7m.ccr;
>      case 0xd24: /* System Handler Status.  */
>          val = 0;
>          if (s->vectors[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
> @@ -685,9 +684,17 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>          }
>          break;
>      case 0xd10: /* System Control.  */
> -    case 0xd14: /* Configuration Control.  */
>          /* TODO: Implement control registers.  */
> -        qemu_log_mask(LOG_UNIMP, "NVIC: SCR and CCR unimplemented\n");
> +        qemu_log_mask(LOG_UNIMP, "NVIC: SCR unimplemented\n");
> +        break;
> +    case 0xd14: /* Configuration Control.  */
> +        value &= 0x31b;
> +        if (value & 0x118) {
> +            qemu_log_mask(LOG_UNIMP, "CCR unimplemented bits"
> +                                     " BFHFNMIGN, DIV_0_TRP, UNALIGN_TRP");
> +            value &= ~0x118;

There's not much point in clearing out the bits we don't implement;
we may as well let them read-as-written.

> +        }
> +        cpu->env.v7m.ccr = value;
>          break;
>      case 0xd24: /* System Handler Control.  */
>          /* TODO: Real hardware allows you to set/clear the active bits
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index b98ef89..4e1b8cf 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -396,6 +396,7 @@ typedef struct CPUARMState {
>          uint32_t vecbase;
>          uint32_t basepri;
>          uint32_t control;
> +        uint32_t ccr; /* Configuration and Control */
>          uint32_t cfsr; /* Configurable Fault Status */
>          uint32_t hfsr; /* HardFault Status */
>          uint32_t mmfar; /* MemManage Fault Address */
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index f7e496d..17d1ca0 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5412,7 +5412,7 @@ static void do_v7m_exception_exit(CPUARMState *env)
>          break;
>      case 0x9: /* Return to Thread mode w/ Main stack */
>      case 0xd: /* Return to Thread mode w/ Process stack */
> -        if (env->v7m.exception_prio != 0x100) {
> +        if ((env->v7m.exception_prio != 0x100) && !(env->v7m.ccr & 1)) {

A #define for CCR_NONBASETHRDENA would be nice (and for
CCR_STKALIGN).

>              /* Attempt to return to Thread mode
>               * from nested handler while NONBASETHRDENA not set.
>               */
> @@ -5582,10 +5582,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>
>      qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
>
> -    /* Align stack pointer.  */
> -    /* ??? Should only do this if Configuration Control Register
> -       STACKALIGN bit is set.  */
> -    if (env->regs[13] & 4) {
> +    /* Align stack pointer (STACKALIGN)  */
> +    if ((env->regs[13] & 4) && (env->v7m.ccr & (1<<9))) {

Spaces around operators.

>          env->regs[13] -= 4;
>          xpsr |= 0x200;
>      }
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 14a4882..7aee41e 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -100,6 +100,7 @@ static const VMStateDescription vmstate_m = {
>          VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
>          VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
>          VMSTATE_UINT32(env.v7m.control, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
>          VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
>          VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
>          VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),

Changing the vmstate implies that we should be bumping its
version number.

thanks
-- PMM
