Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v102sm1547975wrb.11.2017.02.14.09.08.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Feb 2017 09:08:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4DFD53E017C;
	Tue, 14 Feb 2017 17:08:59 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-3-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 2/9] armv7m: Implement reading and writing of PRIGROUP
In-reply-to: <1486065742-28639-3-git-send-email-peter.maydell@linaro.org>
Date: Tue, 14 Feb 2017 17:08:59 +0000
Message-ID: <878tp8vgwk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: D6gNp044PWv0


Peter Maydell <peter.maydell@linaro.org> writes:

> Add a state field for the v7M PRIGROUP register and implent
> reading and writing it. The current NVIC doesn't honour
> the values written, but the new version will.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 09975f3..ce22001 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -24,6 +24,9 @@
>  typedef struct NVICState {
>      GICState gic;
>      ARMCPU *cpu;
> +
> +    uint32_t prigroup;

It might be worth mentioning the field resets to 0b000 here.
Nevertheless:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> +
>      struct {
>          uint32_t control;
>          uint32_t reload;
> @@ -223,7 +226,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>      case 0xd08: /* Vector Table Offset.  */
>          return cpu->env.v7m.vecbase;
>      case 0xd0c: /* Application Interrupt/Reset Control.  */
> -        return 0xfa050000;
> +        return 0xfa050000 | (s->prigroup << 8);
>      case 0xd10: /* System Control.  */
>          /* TODO: Implement SLEEPONEXIT.  */
>          return 0;
> @@ -362,9 +365,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>              if (value & 1) {
>                  qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
>              }
> -            if (value & 0x700) {
> -                qemu_log_mask(LOG_UNIMP, "PRIGROUP unimplemented\n");
> -            }
> +            s->prigroup = extract32(value, 8, 3);
>          }
>          break;
>      case 0xd10: /* System Control.  */
> @@ -483,13 +484,14 @@ static const MemoryRegionOps nvic_sysreg_ops = {
>
>  static const VMStateDescription vmstate_nvic = {
>      .name = "armv7m_nvic",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(systick.control, NVICState),
>          VMSTATE_UINT32(systick.reload, NVICState),
>          VMSTATE_INT64(systick.tick, NVICState),
>          VMSTATE_TIMER_PTR(systick.timer, NVICState),
> +        VMSTATE_UINT32(prigroup, NVICState),
>          VMSTATE_END_OF_LIST()
>      }
>  };


--
Alex Bennée
