Received: by 10.25.0.144 with SMTP id 138csp1107152lfa;
        Sun, 16 Apr 2017 19:38:06 -0700 (PDT)
X-Received: by 10.200.57.103 with SMTP id t36mr7626772qtb.150.1492396686538;
        Sun, 16 Apr 2017 19:38:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z94si9525956qtc.28.2017.04.16.19.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 19:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czwYI-0005IQ-0L
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 22:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czwYB-0005Gt-Ei
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 22:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czwYA-0006pR-BU
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 22:37:59 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czwY4-0006m8-26; Sun, 16 Apr 2017 22:37:52 -0400
Received: by mail-qk0-x243.google.com with SMTP id d131so17950714qkc.0;
	Sun, 16 Apr 2017 19:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=YDPk0kRIstbq5S4HGHBx71LOL8ZMb/f2vuQ6Jm3CF7c=;
	b=jS0h9uGNygyCI1K80oB6tCuWY4dgczP4FiZLcgdZahO8bUPev+gGHN6ri5HkIsnrkL
	uu85yG6jWrzSEm0ppt+Vdg2JTO6xFholnfLlzo6vkf4deODybQsXJPEE4uLMgaZ7c2hG
	0bcgyjGDIbuggIK5ShM/9ElzAfUaDQivPn99HJwAi9mvGE62bdMYpuJb+cQpmf+TuIgg
	Fr1RRimpDQ4Q4G66ux9NcTDFVJimB55AT/U4ce9Rh3MxMz0M4+QC0+FGhm//KS65wo4l
	evCI19U+Xh9E4UKEUo+OYDmdgw6SA9wViWMaMNGcU/3jOOtdEUP+uUXXrtw5wt7dXIsz
	RQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YDPk0kRIstbq5S4HGHBx71LOL8ZMb/f2vuQ6Jm3CF7c=;
	b=BOtVwCoWhS5MDscqnDIClhg/3Jb+HaTEWxfMBGpuSai8FOC1w3a9EGeQBAzUZGlpYy
	c9FE1M0lSl+rQ5nnORsy8WWkeP/peyJqAUxDAQuP7yeahiUFA6EIo9g+uGRIo3hVr7A+
	RpQMenLFqYYqqHv1a51I0DLqSPwieX+BUbcVu2q8IVccqDNsk1V4n5bOaV343BBWdt7H
	GSWywUJebhM7zKtt+A3RGnZvKS98I3ejNhlIiUjS0qN7QTki+Ub2YB7aeInt9dg6deyo
	b5i/5GTsnr8ve4gt4q0C538s1JwS1i+9Xt1XlccIEAwhPUefxy3uRD3ynj/em7EPgsMU
	xsfQ==
X-Gm-Message-State: AN3rC/75UbdblEFD27I+XYk14Jq1zx60QHFaqm8UQbcymonqnPNibkj6
	hhGMDkxmhm91gg==
X-Received: by 10.55.9.129 with SMTP id 123mr6600907qkj.183.1492396671268;
	Sun, 16 Apr 2017 19:37:51 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	g185sm6297442qkc.7.2017.04.16.19.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 19:37:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
	<1487262963-11519-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e9f5148-cfca-6108-e7d1-95e51398512a@amsat.org>
Date: Sun, 16 Apr 2017 23:37:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487262963-11519-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 04/13] armv7m: Fix condition check for
 taking exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kpNH6YmL1Z+5

On 02/16/2017 01:35 PM, Peter Maydell wrote:
> The M profile condition for when we can take a pending exception or
> interrupt is not the same as that for A/R profile.  The code
> originally copied from the A/R profile version of the
> cpu_exec_interrupt function only worked by chance for the
> very simple case of exceptions being masked by PRIMASK.
> Replace it with a call to a function in the NVIC code that
> correctly compares the priority of the pending exception
> against the current execution priority of the CPU.
>
> [Michael Davidsaver's patchset had a patch to do something
> similar but the implementation ended up being a rewrite.]
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h      |  8 ++++++++
>  hw/intc/armv7m_nvic.c |  7 +++++++
>  target/arm/cpu.c      | 16 ++++++++--------
>  3 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 0956a54..53299fa 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1342,6 +1342,14 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
>                                   uint32_t cur_el, bool secure);
>
>  /* Interface between CPU and Interrupt controller.  */
> +#ifndef CONFIG_USER_ONLY
> +bool armv7m_nvic_can_take_pending_exception(void *opaque);
> +#else
> +static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
> +{
> +    return true;
> +}
> +#endif
>  void armv7m_nvic_set_pending(void *opaque, int irq);
>  int armv7m_nvic_acknowledge_irq(void *opaque);
>  void armv7m_nvic_complete_irq(void *opaque, int irq);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index f45b897..e0fce3e 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -286,6 +286,13 @@ static inline int nvic_exec_prio(NVICState *s)
>      return MIN(running, s->exception_prio);
>  }
>
> +bool armv7m_nvic_can_take_pending_exception(void *opaque)
> +{
> +    NVICState *s = opaque;
> +
> +    return nvic_exec_prio(s) > nvic_pending_prio(s);
> +}
> +
>  /* caller must call nvic_irq_update() after this */
>  static void set_prio(NVICState *s, unsigned irq, uint8_t prio)
>  {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 4a069f6..edbc87b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -338,13 +338,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      CPUARMState *env = &cpu->env;
>      bool ret = false;
>
> -
> -    if (interrupt_request & CPU_INTERRUPT_FIQ
> -        && !(env->daif & PSTATE_F)) {
> -        cs->exception_index = EXCP_FIQ;
> -        cc->do_interrupt(cs);
> -        ret = true;
> -    }
>      /* ARMv7-M interrupt return works by loading a magic value
>       * into the PC.  On real hardware the load causes the
>       * return to occur.  The qemu implementation performs the
> @@ -354,9 +347,16 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>       * the stack if an interrupt occurred at the wrong time.
>       * We avoid this by disabling interrupts when
>       * pc contains a magic address.
> +     *
> +     * ARMv7-M interrupt masking works differently than -A or -R.
> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
> +     * masking FIQ and IRQ interrupts, an exception is taken only
> +     * if it is higher priority than the current execution priority
> +     * (which depends on state like BASEPRI, FAULTMASK and the
> +     * currently active exception).
>       */
>      if (interrupt_request & CPU_INTERRUPT_HARD
> -        && !(env->daif & PSTATE_I)
> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))
>          && (env->regs[15] < 0xfffffff0)) {
>          cs->exception_index = EXCP_IRQ;
>          cc->do_interrupt(cs);
>
