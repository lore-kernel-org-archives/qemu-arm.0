Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m3sm3133956wrb.67.2019.11.13.04.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 04:39:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 06DC01FF87;
	Wed, 13 Nov 2019 12:39:07 +0000 (GMT)
References: <20191113005201.19005-1-joel@jms.id.au>
 <20191113005201.19005-5-joel@jms.id.au>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
In-reply-to: <20191113005201.19005-5-joel@jms.id.au>
Date: Wed, 13 Nov 2019 12:39:06 +0000
Message-ID: <871ruc7xxx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tStZvEnYxpU5


Joel Stanley <joel@jms.id.au> writes:

> The AST2600 control register sneakily changed the meaning of bit 4
> without anyone noticing. It no longer controls the 1MHz vs APB clock
> select, and instead always runs at 1MHz.
>
> The AST2500 was always 1MHz too, but it retained bit 4, making it read
> only. We can model both using the same fixed 1MHz calculation.
>
> Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> v2: Fix Fixes line in commit message
> ---
>  hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 8787c5ad0f97..9a8a2200fd8e 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -93,11 +93,11 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr =
offset, unsigned size)
>
>  }
>
> -static void aspeed_wdt_reload(AspeedWDTState *s, bool pclk)
> +static void aspeed_wdt_reload(AspeedWDTState *s)
>  {
>      uint64_t reload;
>
> -    if (pclk) {
> +    if (!(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK)) {
>          reload =3D muldiv64(s->regs[WDT_RELOAD_VALUE], NANOSECONDS_PER_S=
ECOND,
>                            s->pclk_freq);
>      } else {
> @@ -109,6 +109,16 @@ static void aspeed_wdt_reload(AspeedWDTState *s, boo=
l pclk)
>      }
>  }
>
> +static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
> +{
> +    uint64_t reload =3D s->regs[WDT_RELOAD_VALUE] * 1000ULL;
> +
> +    if (aspeed_wdt_is_enabled(s)) {
> +        timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + relo=
ad);
> +    }
> +}
> +
> +
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>                               unsigned size)
>  {
> @@ -130,13 +140,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr o=
ffset, uint64_t data,
>      case WDT_RESTART:
>          if ((data & 0xFFFF) =3D=3D WDT_RESTART_MAGIC) {
>              s->regs[WDT_STATUS] =3D s->regs[WDT_RELOAD_VALUE];
> -            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK=
));
> +            awc->wdt_reload(s);
>          }
>          break;
>      case WDT_CTRL:
>          if (enable && !aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] =3D data;
> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
> +            awc->wdt_reload(s);
>          } else if (!enable && aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] =3D data;
>              timer_del(s->timer);
> @@ -283,6 +293,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *k=
lass, void *data)
>      awc->offset =3D 0x20;
>      awc->ext_pulse_width_mask =3D 0xff;
>      awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
> +    awc->wdt_reload =3D aspeed_wdt_reload;
>  }
>
>  static const TypeInfo aspeed_2400_wdt_info =3D {
> @@ -317,6 +328,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *k=
lass, void *data)
>      awc->ext_pulse_width_mask =3D 0xfffff;
>      awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
>      awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
>  }
>
>  static const TypeInfo aspeed_2500_wdt_info =3D {
> @@ -336,6 +348,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *k=
lass, void *data)
>      awc->ext_pulse_width_mask =3D 0xfffff; /* TODO */
>      awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
>  }
>
>  static const TypeInfo aspeed_2600_wdt_info =3D {
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
> index dfedd7662dd1..819c22993a6e 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -47,6 +47,7 @@ typedef struct AspeedWDTClass {
>      uint32_t ext_pulse_width_mask;
>      uint32_t reset_ctrl_reg;
>      void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
> +    void (*wdt_reload)(AspeedWDTState *s);
>  }  AspeedWDTClass;
>
>  #endif /* WDT_ASPEED_H */


--
Alex Benn=C3=A9e
