Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3254237wrq;
        Sun, 24 Jun 2018 17:59:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLzBVRe72XUnFJ6DFMyFPVP3FNsHVl88z8Tmm5s6Mr3muH+U1IRLNEgdUbK98WUDzX66jNH
X-Received: by 2002:a37:4792:: with SMTP id u140-v6mr9009442qka.100.1529888379596;
        Sun, 24 Jun 2018 17:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529888379; cv=none;
        d=google.com; s=arc-20160816;
        b=a4P+vOvKnCwLZbDgdkr3kS4QM7QqRSae3r6aNJ6dUa0nhf0cTgX9Ik/iBhSzmYaNtX
         dBj8w1wIe9pzUszV7H0/CQfhtkkEixq6O+ojclqhWhSjgZ96rsc3FE5ZM/yasyFUDToD
         MPZEb+3Z/FJBMb5Us++Buuqe4aUbW3oAx5xqNTj22ZxSgXXAXhNrgzKXd0KpU2UaH2If
         iKelQdr9Z6//CUms+8fqPba7u/4hG0aSRl9kNgPLlD0rIDa62MBfb7oh+F7sqDfgDdK9
         aPrmxz54n+geO+WubvIK7AUElWAC6n5sG+BnXF+yxtd6Mnj4D2k7C0t2CS5gZ3t8nPZr
         iRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:date
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=k4EC3+Eyk5vn/q+UvJRM/w9lT+ps6xqenGmdy451cRM=;
        b=sSm1GjY8Rl0oelf6IIMDKYsQqFNhzU1gh20xgnRhjNFipYbtMhfye6sVBZMcUBJ7tr
         y28BwC7eS7iwlDJsa+rladeV5pjUy0FRaogliBsHqC4emproOCoz09RpQgQLxjJ82Ukx
         rQ+doPbSF8NAPVGGLEJFnnVZFKNvjeQTZErNgvzbSeJWgoDzsKv+0BC9SjCazwtSIcEI
         LSl0Ee1KsaBo9IyMnczhWKYNkKDsM4kQFxWQhgqibZlgCGX19cNaNy2kki/8D7Ec6Cdk
         YvgbhWUloKMLZmq3AsYPx8uCjgsr/HsUBJXRqG09yGBPKDt8d/9vMREKL0FaYvFu8NIQ
         3LZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=iSk8Zujn;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=tBtRpqHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4-v6si42960qkb.120.2018.06.24.17.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 17:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=iSk8Zujn;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=tBtRpqHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXFr1-0006Hc-3c
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 20:59:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFqp-0006GW-Ir
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:59:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFql-00044D-MP
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:59:27 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45491)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXFql-00043z-HX; Sun, 24 Jun 2018 20:59:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 018FF21763;
	Sun, 24 Jun 2018 20:59:22 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Sun, 24 Jun 2018 20:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=k4EC3+Eyk5vn/q+UvJRM/w9lT+ps6
	xqenGmdy451cRM=; b=iSk8ZujnfNJnHtzs5jcUqdsw2I2fSkgjplHSAz+K0e2TG
	u3e4CajiiQnpfPko8IXhLEBudw5+SYiNxLRvPMWHAdUHTmbcl8ZnZwB0XWqAVR+f
	IEBt5rr6ccaEZOJo+NbRAv43Mk56qQGWJsPIWKPwHT7lXZVNiKHfTJT4Q7C0MDBT
	e4daa//bogij2AlEC5u/+ntlOZHShi72CDemb6P7L1I/4JVqQgeE2AN3+gVDQb+G
	dLFJBo1mQn8IoRRO/6mzq88WPMo+c6AOXkXIr9Sw/6DE9k2XFf1wCz19eX1S/z1b
	nC33Q0xRSDLJLtFmmL3b1e8O64AmYlrS0w/A/XFow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=k4EC3+
	Eyk5vn/q+UvJRM/w9lT+ps6xqenGmdy451cRM=; b=tBtRpqHRGC6iDkfBg4vLXc
	K1TnDyN91pckC/P60FijY6TNoB/D4xX/Ez0XsP16NFXBxLQxYbQYg0IYkxzxAsdk
	iAHXoy6ttOSBeDxw0n0VMoWrjrmH0a+ONqzGSVdIRps/mD7oIJeZhFaWxKk/MW7c
	Cxy8Q9/FKrGTvzmZuAbU92wpD/1DDUG8IR8XHlLV83bAZtBdCl7HnaSIzomBM+7C
	4+fTRLqEz+7LctYiAz9fIYDo7SDppy/xpGQ3KTlT9zv0XRxggrhuTZ+JwBaLFRjx
	lNAunjKCkUri4pa65eBsKinE8ay7nXrQWXaW+w1J54mnr7s6eV8lEauwVpzBsYvw
	==
X-ME-Proxy: <xmx:aj4wW4jXMFnpL2MZ-6W6puUf3FhrBd_d0PQFmP1AOKT_xuxlqnnHyQ>
	<xmx:aj4wW6fOwA5RQu_9oSB8sz0o0vZRDNS-w74DJuLQT_oxTtawxwdkbw>
	<xmx:aj4wWxCuHf6culDenN2GCDy04AsUgybjQIYPYPo8Sc8FciPI6DlMCg>
	<xmx:aj4wW2ZhbdgjCtQFsNrSLzhR37_YjH05_2DSq78oFgYkF34HFGiLJA>
	<xmx:aj4wWy0-r9jeQjHNKVUPvLL3iGmoS6KqEnbPVNogDwsiSlSY0GHLDw>
	<xmx:aj4wWzt2agh0gkvUNIPVokQMNW_Ib9Kw93N8V7qchE-6QQhZwq3_Eg>
X-ME-Sender: <xms:aj4wWwZKuHpZM5ek0vwRgtirT2Lu3Yajos6e9prV2wKJTr2TatNWTg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id A6A9FBA43D; Sun, 24 Jun 2018 20:59:22 -0400 (EDT)
Message-Id: <1529888362.2194836.1418938448.349CB4FA@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
References: <20180622075700.5923-1-clg@kaod.org>
	<20180622075700.5923-4-clg@kaod.org>
Date: Mon, 25 Jun 2018 10:29:22 +0930
In-Reply-To: <20180622075700.5923-4-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v2 3/3] aspeed/timer: use the APB frequency
 from the SCU
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zsPU1/zA0ey

On Fri, 22 Jun 2018, at 17:27, C=C3=A9dric Le Goater wrote:
> The timer controller can be driven by either an external 1MHz clock or
> by the APB clock. Today, the model makes the assumption that the APB
> frequency is always set to 24MHz but this is incorrect.
>=20
> The AST2400 SoC on the palmetto machines uses a 48MHz input clock
> source and the APB can be set to 48MHz. The consequence is a general
> system slowdown. The QEMU machines using the AST2500 SoC do not seem
> impacted today because the APB frequency is still set to 24MHz.
>=20
> We fix the timer frequency for all SoCs by linking the Timer model to
> the SCU model. The APB frequency driving the timers is now the one
> configured for the SoC.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  include/hw/timer/aspeed_timer.h |  4 ++++
>  hw/arm/aspeed_soc.c             |  2 ++
>  hw/timer/aspeed_timer.c         | 19 +++++++++++++++----
>  3 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
> index bd6c1a7f9609..040a08873432 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -24,6 +24,8 @@
>=20=20
>  #include "qemu/timer.h"
>=20=20
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
>=20=20
>  #endif /* ASPEED_TIMER_H */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 7cc05ee27ea4..e68911af0f90 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -127,6 +127,8 @@ static void aspeed_soc_init(Object *obj)
>=20=20
>      object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
>      object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
> +    object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
> +                                   OBJECT(&s->scu), &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
>=20=20
>      object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 1e31e22b6f1f..5e3f51b66b43 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -10,8 +10,10 @@
>   */
>=20=20
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
>=20=20
>  #define TIMER_REG_STATUS 0
>  #define TIMER_REG_RELOAD 1
> @@ -80,11 +81,11 @@ static inline bool timer_external_clock(AspeedTimer *=
t)
>      return timer_ctrl_status(t, op_external_clock);
>  }
>=20=20
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
>=20=20
>  static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t=20
> now_ns)
> @@ -449,6 +450,16 @@ static void aspeed_timer_realize(DeviceState *dev,=20
> Error **errp)
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
>=20=20
>      for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>          aspeed_init_one_timer(s, i);
> --=20
> 2.13.6
>=20
