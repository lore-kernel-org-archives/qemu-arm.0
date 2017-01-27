Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k4sm3632089wmf.22.2017.01.27.04.41.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 04:41:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0C6013E0342;
	Fri, 27 Jan 2017 12:41:03 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-3-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 02/10] armv7m_nvic: keep a pointer to the CPU
In-reply-to: <1485285380-10565-3-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 12:41:03 +0000
Message-ID: <878tpwad5s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: BeXzLdj0KboZ


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Many NVIC operations access the CPU state, so store a pointer in
> struct nvic_state rather than fetching it via qemu_get_cpu() every
> time we need it.
>
> As with the arm_gicv3_common code, we currently just call
> qemu_get_cpu() in the NVIC's realize method, but in future we might
> want to use a QOM property to pass the CPU to the NVIC.
>
> This imposes an ordering requirement that the CPU is
> realized before the NVIC, but that is always true since
> both are dealt with in armv7m_init().
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: Use qemu_get_cpu(0) rather than first_cpu; expand
>  commit message]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 06d8db6..81dcb83 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -23,6 +23,7 @@
>
>  typedef struct {
>      GICState gic;
> +    ARMCPU *cpu;
>      struct {
>          uint32_t control;
>          uint32_t reload;
> @@ -155,7 +156,7 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
>
>  static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
>  {
> -    ARMCPU *cpu;
> +    ARMCPU *cpu = s->cpu;
>      uint32_t val;
>      int irq;
>
> @@ -187,11 +188,9 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
>      case 0x1c: /* SysTick Calibration Value.  */
>          return 10000;
>      case 0xd00: /* CPUID Base.  */
> -        cpu = ARM_CPU(qemu_get_cpu(0));
>          return cpu->midr;
>      case 0xd04: /* Interrupt Control State.  */
>          /* VECTACTIVE */
> -        cpu = ARM_CPU(qemu_get_cpu(0));
>          val = cpu->env.v7m.exception;
>          if (val == 1023) {
>              val = 0;
> @@ -222,7 +221,6 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
>              val |= (1 << 31);
>          return val;
>      case 0xd08: /* Vector Table Offset.  */
> -        cpu = ARM_CPU(qemu_get_cpu(0));
>          return cpu->env.v7m.vecbase;
>      case 0xd0c: /* Application Interrupt/Reset Control.  */
>          return 0xfa050000;
> @@ -296,7 +294,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
>
>  static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
>  {
> -    ARMCPU *cpu;
> +    ARMCPU *cpu = s->cpu;
>      uint32_t oldval;
>      switch (offset) {
>      case 0x10: /* SysTick Control and Status.  */
> @@ -349,7 +347,6 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
>          }
>          break;
>      case 0xd08: /* Vector Table Offset.  */
> -        cpu = ARM_CPU(qemu_get_cpu(0));
>          cpu->env.v7m.vecbase = value & 0xffffff80;

Given it is only used once here you could just indirect it:

           s->cpu->env.v7m.vecbase = value & 0xffffff80;

But I assume the compiler would DTRT if the load wasn't needed.

>          break;
>      case 0xd0c: /* Application Interrupt/Reset Control.  */
> @@ -495,6 +492,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      NVICClass *nc = NVIC_GET_CLASS(s);
>      Error *local_err = NULL;
>
> +    s->cpu = ARM_CPU(qemu_get_cpu(0));
> +    assert(s->cpu);
>      /* The NVIC always has only one CPU */
>      s->gic.num_cpu = 1;
>      /* Tell the common code we're an NVIC */

Anyway:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
