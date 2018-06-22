Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp255847wrq;
        Thu, 21 Jun 2018 18:02:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKID8r61rTL5lpXJRF2+dbOp23mWsj7RwqFCS8n1ovBFeDEdsT/RV6LvRlBLoqk1vvOLxVJI
X-Received: by 2002:a37:318f:: with SMTP id x137-v6mr23085428qkx.324.1529629355427;
        Thu, 21 Jun 2018 18:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529629355; cv=none;
        d=google.com; s=arc-20160816;
        b=Fu1AnoiG4K/WoGXYh9BBghTWGyf5ubI7kv9WLtr8Gyu7czid+i01c7oiDLKk8BhZdG
         3L6R00dqOVNVWuz7AaCFvJub2KKnhwx0BpaxofPuWqhKX+/PYkKrRtm/GKhiIXYaBn5n
         IC53rlYmctG3RAdS1/IJGf1yjZ4wYpmDq0WdwpPMBHNz2896fBHWQ9ROXYLb1kn0eHGU
         4AI2eOdW5mkHngAMTagF4NRYeb5Y3f+qa+5400tqIq2fttzW8ch1/++zYjJJRWXxhDLW
         gLuwrrrgkxp+lkoDM/kc1ehSRuuCKXWkAEVrNqrt52XgHrkVuiR22b/e3G/gt7HRMIXQ
         +Tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=t/2WWYMLGFF2sx1PCUX10IBMpPS8GzqfBC8wm9MCgKk=;
        b=QLmAaPB74Nc3BkvTgY3OyePx3MbJch0bCIukIqzoukOWIaMUJRSXHUfDs9xNjpcNxx
         EPtmnaBT+33kDJuV4IqEUylyHYF8x2SnM3GdXXeA9siRw46oSmqt2XWPo+9lHYbJ2Whe
         mptdG2Fu89j25XFJuy4eML9zkAL7YnnuxkbbhKMOMPbGJUc6dZg8z3YPbXnVPLT/4Ubu
         eXiu6zSTp8SdR3bXU699tsitSLp8hVnWNVIIUBaI1YuYxwYySVjiMgoqaBxdtDysw9vG
         KfSD4CTz93uDbYKZiyoemUU01gl2GpwlCX/ol/vzCVHgJyalsp1C5ARxy75rdTLrg8sP
         Z6Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ddm7R04X;
       dkim=fail header.i=@jms.id.au header.s=google header.b=MU6nLFUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g187-v6si5562890qkc.55.2018.06.21.18.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 18:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ddm7R04X;
       dkim=fail header.i=@jms.id.au header.s=google header.b=MU6nLFUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWATC-0003cw-VQ
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 21:02:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWASz-0003bY-IB
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 21:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWASy-0008C1-Ae
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 21:02:21 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fWASv-00087v-Kf; Thu, 21 Jun 2018 21:02:17 -0400
Received: by mail-qt0-x241.google.com with SMTP id d3-v6so4656847qto.1;
	Thu, 21 Jun 2018 18:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=t/2WWYMLGFF2sx1PCUX10IBMpPS8GzqfBC8wm9MCgKk=;
	b=Ddm7R04XMRrjI7lKXG4D2fY7/KIsK3Sv3+OMNq5ixgoNy4WxBHxpKtUKJpcFdyMDLl
	wSZb/RLzPSI/wBNUMyU370gWX/mQi9bf5FC2odHEU61/xXRR59Ya6dbqoc5VsdlRsHJE
	3wPdDAls+p4hg3rWuQE96noNb4qM1nCqBS1Kw8g8LKNyMHa8/JEWeuoWhz5N8mbibtXV
	GuaNvDpDd4TvbOEKC5wSvXcszvziu8CtWxJZBTCFkKUQtMFgO8Xj0c+0N/gvobCcMtAT
	a7+AfqDDqCJJ89zbvvKajoFwjdGhHwltedx0VzK4rJxL0s+TPue2MqFlUZdemEX8mHou
	KLSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=t/2WWYMLGFF2sx1PCUX10IBMpPS8GzqfBC8wm9MCgKk=;
	b=MU6nLFURDbZVKKoc8LcSV4jfm3xPpfl7obDz0/a8BZELdANbAD0S1xuJLCzxdbTIgM
	rwYy4bLUgMcBI5go/SuwHyld6/8YSKA8ENzeg6mirdSxfTCcwFPJ1P7+cy5//KAyeDhW
	rZIuxTNcsgvd59kMl0S0eqUr+iuBBApYmSpc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=t/2WWYMLGFF2sx1PCUX10IBMpPS8GzqfBC8wm9MCgKk=;
	b=ul/3hvEh+XZaJDSnS+gS1wsiywqvxAahK9N1aGOd9rFCcZUov7NTDckzvO7A0kODOC
	7xTQjVGdttfjANUOuQRIrO7GQCaugNCEQK0jtiapU3ebqBC3dwHi52Kj+6JjyhDPjYha
	07iIpx7PoculACQt3q3ftOJDaqy1iSKkQ+BSsTow77uC1tXwiZ24QS1A8zTIOTwrYOtL
	wt68Ht8ou5C04OCc+3RO5j3Dt3W6tLmHQWjtJpE8piypbqY1qR3VEIVExv00qHQD0mGf
	ikA3JZPUVckMyIH7Wmr0eo5v8i7BuTo9HRcJ65zXWd7mF8ewG4jUR5m51FpK8nmqi/KS
	OroQ==
X-Gm-Message-State: APt69E2XpfajpQ/M7PjlRMLs1kHAzkdajWWj89EjDchvni5ECX1qNKQs
	Nh9jyY9HezBXY/xrJdfDf2tLD0Gnh1N4L/oYSbU=
X-Received: by 2002:ac8:2911:: with SMTP id
	y17-v6mr6697843qty.340.1529629336946; 
	Thu, 21 Jun 2018 18:02:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 18:01:56
	-0700 (PDT)
In-Reply-To: <20180621223946.20738-4-clg@kaod.org>
References: <20180621223946.20738-1-clg@kaod.org>
	<20180621223946.20738-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jun 2018 10:31:56 +0930
X-Google-Sender-Auth: qWGbNmsK7IUJDnQnCvJ0TQIO178
Message-ID: <CACPK8Xdpnyz=wTBuWyh_ZQTqd7r+RVZertN+a-wrX1QqtYQU0A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 3/3] aspeed/timer: use the APB frequency from
 the SCU
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 896U39AJ557A

On 22 June 2018 at 08:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The timer controller can be driven by either an external 1MHz clock or
> by the APB clock. Today, the model makes this assumption that the APB
> frequency is 24MHz but this is incorrect on the AST2400 SoC. palmetto
> machines use a 48MHz input clock source.

So this fixes it to use a apb frequency from the scu for all platform,
not just the 2400?

Can you put something in the commit message about the change in guest
behaviour - the output of Linux's clk_summary or similar - so we know
what bug this fixed?

The code looks good though.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> Use the SCU object to get the APB frequency and drive the timers with
> the configured freq for the SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/timer/aspeed_timer.h |  4 ++++
>  hw/arm/aspeed_soc.c             |  2 ++
>  hw/timer/aspeed_timer.c         | 19 +++++++++++++++----
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
> index bd6c1a7f9609..040a08873432 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -24,6 +24,8 @@
>
>  #include "qemu/timer.h"
>
> +typedef struct AspeedSCUState AspeedSCUState;
> +
>  #define ASPEED_TIMER(obj) \
>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
>  #define TYPE_ASPEED_TIMER "aspeed.timer"
> @@ -55,6 +57,8 @@ typedef struct AspeedTimerCtrlState {
>      uint32_t ctrl;
>      uint32_t ctrl2;
>      AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
> +
> +    AspeedSCUState *scu;
>  } AspeedTimerCtrlState;
>
>  #endif /* ASPEED_TIMER_H */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7cc05ee27ea4..e68911af0f90 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -127,6 +127,8 @@ static void aspeed_soc_init(Object *obj)
>
>      object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
>      object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
> +    object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
> +                                   OBJECT(&s->scu), &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
>
>      object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 1e31e22b6f1f..5e3f51b66b43 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -10,8 +10,10 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/timer/aspeed_timer.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "qemu-common.h"
>  #include "qemu/bitops.h"
>  #include "qemu/timer.h"
> @@ -26,7 +28,6 @@
>  #define TIMER_CLOCK_USE_EXT true
>  #define TIMER_CLOCK_EXT_HZ 1000000
>  #define TIMER_CLOCK_USE_APB false
> -#define TIMER_CLOCK_APB_HZ 24000000
>
>  #define TIMER_REG_STATUS 0
>  #define TIMER_REG_RELOAD 1
> @@ -80,11 +81,11 @@ static inline bool timer_external_clock(AspeedTimer *=
t)
>      return timer_ctrl_status(t, op_external_clock);
>  }
>
> -static uint32_t clock_rates[] =3D { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_=
HZ };
> -
>  static inline uint32_t calculate_rate(struct AspeedTimer *t)
>  {
> -    return clock_rates[timer_external_clock(t)];
> +    AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
> +
> +    return timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ : s->scu->apb_fr=
eq;
>  }
>
>  static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t n=
ow_ns)
> @@ -449,6 +450,16 @@ static void aspeed_timer_realize(DeviceState *dev, E=
rror **errp)
>      int i;
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      AspeedTimerCtrlState *s =3D ASPEED_TIMER(dev);
> +    Object *obj;
> +    Error *err =3D NULL;
> +
> +    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
> +    if (!obj) {
> +        error_propagate(errp, err);
> +        error_prepend(errp, "required link 'scu' not found: ");
> +        return;
> +    }
> +    s->scu =3D ASPEED_SCU(obj);
>
>      for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>          aspeed_init_one_timer(s, i);
> --
> 2.13.6
>
