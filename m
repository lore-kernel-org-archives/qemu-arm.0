Received: by 10.25.221.202 with SMTP id w71csp729690lfi;
        Wed, 9 Aug 2017 03:30:31 -0700 (PDT)
X-Received: by 10.55.133.195 with SMTP id h186mr9029479qkd.21.1502274631700;
        Wed, 09 Aug 2017 03:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502274631; cv=none;
        d=google.com; s=arc-20160816;
        b=KEZfFvGYdb8Ae15KK1+urN7WZoThoaYAal6Kpy8iBVcS5Glo+kU9QTfryhcr3IYCvF
         MTBZ34lOSv73QTKDqmMy4gAJLnHPkp+mfJhHMLJTaptg1916isp5ZLIwm6Fk4nOH9FS3
         GmPj+W2l9b4Uqmc2KOcVFWFTsClpCECgwHp/zFL/c4xzkStDQcArdQ4PkbdkMNXcO+v0
         stKFMBjrglkat+cZ8/58OXb+66pEIwheevCdOeqzJfN7I89ZqHWxDxA6oy8L2kRql8MX
         /CTAub8nS/Um3QLwqGRIBkqYQB/MEOEFhQdDqhxTiBocsG3OyIbVR9XbgDRsp7aqbSXj
         aBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:references
         :date:content-transfer-encoding:mime-version:to:from:message-id
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=weuV/nlyoPanR4Dz089WDkLD91w0hARLHdOdov2iF6k=;
        b=u1XQjspOIG55T3If0HqFkTdNljo9Pcppp288PSNLTf8krdWxu2Oj8fQh6la1lX3rZO
         wV4211KTQeoSC3F/MuI3fKxHFJuRqtaPuxvI1tnqXCvgZdCrBIa+MydG48CVv1brVdSe
         oxaN51PGEt4oHaQ1t1Y1yVefDpZosNkd0D9lSx7AQbJGss9d06dIL0aLlALtJRxdRgbK
         aman7osoqkLNh+2KerwoaxAFwuNQhkoknznPfBpYZYy5xvY0pVvqRxIkiYjlXSkwwF43
         DolrY2pyuqU4NBk+LswYZoDvH7H63Dy7wvzREV/5Oxx91AGslv0xUaOoi1RcLxmP2Nit
         m5vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=t6bgbRL/;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=njhl3Eql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x46si2838409qtx.547.2017.08.09.03.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Aug 2017 03:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=t6bgbRL/;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=njhl3Eql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfOFx-0005VN-0m
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 06:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfOFr-0005VG-Mj
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 06:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfOFn-0001Gu-8V
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 06:30:23 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52885)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfOFm-0001Ev-H7; Wed, 09 Aug 2017 06:30:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E050B20958;
	Wed,  9 Aug 2017 06:30:17 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 06:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=weuV/nlyoPanR4Dz089WDkLD91w0h
	ARLHdOdov2iF6k=; b=t6bgbRL/vxIEnwnKD3XiDEJ7/VxpQCIVJS6eQuij8bZpN
	wEr2IYYQeUNznZrLy4537pFvmY47W+meeIMfp6fs4dJmdlgHLcgE1PS1gwuDmToG
	IIrRhE5eZnh8JHbMaUVdBhq9FBhXGKqWe+ycjVHcO/4I7Szkkmx5UX0LQvHH+u9u
	ilTwkWHtaPD1qAvUw/y6Odxg6DjGCNu4/nOlh3VsiYwZHHtHKZ6+IIUJm36s+eFo
	2K2q+JZboAHMZU/UVxniOff8WfLgYmWUFgtk7FwoB0AX7zv4qlF6Y+uSDJmEOYP1
	ohfttIYcGBQOiQQhBNFAMkiD2XGTtwZpNGM6Wyrkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=weuV/n
	lyoPanR4Dz089WDkLD91w0hARLHdOdov2iF6k=; b=njhl3EqlpJfKKtL4jjZgwc
	cYwrSGKu+2FQKKylujxYXLguyychtzJeCDvC0tUvoz/IQ5KUm+CAP2d7ZW2nh7RU
	6zSy3e2Uczg3+Gq9F3hQtVEi4AEQ8zZR3JCI9uHcUnhr4SIzhpWBVNxRuxQXw0tH
	SYJWUgoEdMWsP1wnRExxCD6vRf80gSS9gufp4Ka54shlyPvUjT7lBn0XZmajaFNi
	1RgI1JISidGE2gL7disXTbwK63FWePwTXHAVxNsuhB9hxKdTo+1YItivsHAhDvFt
	+XYgS6CYI29a31/tgIxjm+X6+LXlU1412pC/+hSL0j5dH+pD1fQ09Qx4kQ7wCsVQ
	==
X-ME-Sender: <xms:OeSKWaVuSZut020J839tFeuX-WSJEhLDQHnKFRPJf2w4lNy-1kQN6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id BBEDA6264D; Wed,  9 Aug 2017 06:30:17 -0400 (EDT)
Message-Id: <1502274617.2058464.1067857056.3F238295@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-4448c6f4
Date: Wed, 09 Aug 2017 20:00:17 +0930
References: <20170809062828.3673-1-andrew@aj.id.au>
	<20170809062828.3673-2-andrew@aj.id.au>
	<8d122179-665f-2cbe-939e-2e466b98b28d@kaod.org>
In-Reply-To: <8d122179-665f-2cbe-939e-2e466b98b28d@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH for 2.11 v2 1/2] watchdog: wdt_aspeed: Add
 support for the reset width register
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	openbmc@lists.ozlabs.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNce6EXeWBgX



On Wed, Aug 9, 2017, at 18:28, C=C3=A9dric Le Goater wrote:
> On 08/09/2017 08:28 AM, Andrew Jeffery wrote:
> > The reset width register controls how the pulse on the SoC's WDTRST{1,2}
> > pins behaves. A pulse is emitted if the external reset bit is set in
> > WDT_CTRL. On the AST2500 WDT_RESET_WIDTH can consume magic bit patterns
> > to configure push-pull/open-drain and active-high/active-low
> > behaviours and thus needs some special handling in the write path.
> >=20
> > As some of the capabilities depend on the SoC version a silicon-rev
> > property is introduced, which is used to guard version-specific
> > behaviour.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> One minor comment below. Nevertheless :
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> > ---
> >  hw/watchdog/wdt_aspeed.c         | 93 ++++++++++++++++++++++++++++++++=
+++-----
> >  include/hw/watchdog/wdt_aspeed.h |  2 +
> >  2 files changed, 84 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> > index 8bbe579b6b66..22bce364d7b5 100644
> > --- a/hw/watchdog/wdt_aspeed.c
> > +++ b/hw/watchdog/wdt_aspeed.c
> > @@ -8,16 +8,19 @@
> >   */
> >=20=20
> >  #include "qemu/osdep.h"
> > +
> > +#include "qapi/error.h"
> >  #include "qemu/log.h"
> > +#include "qemu/timer.h"
> >  #include "sysemu/watchdog.h"
> > +#include "hw/misc/aspeed_scu.h"
> >  #include "hw/sysbus.h"
> > -#include "qemu/timer.h"
> >  #include "hw/watchdog/wdt_aspeed.h"
> >=20=20
> > -#define WDT_STATUS              (0x00 / 4)
> > -#define WDT_RELOAD_VALUE        (0x04 / 4)
> > -#define WDT_RESTART             (0x08 / 4)
> > -#define WDT_CTRL                (0x0C / 4)
> > +#define WDT_STATUS                      (0x00 / 4)
> > +#define WDT_RELOAD_VALUE                (0x04 / 4)
> > +#define WDT_RESTART                     (0x08 / 4)
> > +#define WDT_CTRL                        (0x0C / 4)
> >  #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
> >  #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
> >  #define   WDT_CTRL_1MHZ_CLK             BIT(4)
> > @@ -25,18 +28,41 @@
> >  #define   WDT_CTRL_WDT_INTR             BIT(2)
> >  #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
> >  #define   WDT_CTRL_ENABLE               BIT(0)
> > +#define WDT_RESET_WIDTH                 (0x18 / 4)
> > +#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
> > +#define     WDT_POLARITY_MASK           (0xFF << 24)
> > +#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
> > +#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
> > +#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
> > +#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
> > +#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
> > +#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
> >=20=20
> > -#define WDT_TIMEOUT_STATUS      (0x10 / 4)
> > -#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
> > -#define WDT_RESET_WDITH         (0x18 / 4)
> > +#define WDT_TIMEOUT_STATUS              (0x10 / 4)
> > +#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
> >=20=20
> > -#define WDT_RESTART_MAGIC       0x4755
> > +#define WDT_RESTART_MAGIC               0x4755
> >=20=20
> >  static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
> >  {
> >      return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
> >  }
> >=20=20
> > +static bool is_ast2500(const AspeedWDTState *s)
>=20
> I think we could use this routine in other controllers (scu, sdmc).=20
> So may be, in a follow-up patch, we could move it in aspeed_scu.h

Right, I figured we would move it when we came to need it elsewhere.

Thanks for the review.

Cheers,

Andrew

>=20
> Thanks,
>=20
> C.=20
>=20=20
> > +{
> > +    switch (s->silicon_rev) {
> > +    case AST2500_A0_SILICON_REV:
> > +    case AST2500_A1_SILICON_REV:
> > +        return true;
> > +    case AST2400_A0_SILICON_REV:
> > +    case AST2400_A1_SILICON_REV:
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >  static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned =
size)
> >  {
> >      AspeedWDTState *s =3D ASPEED_WDT(opaque);
> > @@ -55,9 +81,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr=
 offset, unsigned size)
> >          return 0;
> >      case WDT_CTRL:
> >          return s->regs[WDT_CTRL];
> > +    case WDT_RESET_WIDTH:
> > +        return s->regs[WDT_RESET_WIDTH];
> >      case WDT_TIMEOUT_STATUS:
> >      case WDT_TIMEOUT_CLEAR:
> > -    case WDT_RESET_WDITH:
> >          qemu_log_mask(LOG_UNIMP,
> >                        "%s: uninmplemented read at offset 0x%" HWADDR_P=
RIx "\n",
> >                        __func__, offset);
> > @@ -119,9 +146,27 @@ static void aspeed_wdt_write(void *opaque, hwaddr =
offset, uint64_t data,
> >              timer_del(s->timer);
> >          }
> >          break;
> > +    case WDT_RESET_WIDTH:
> > +    {
> > +        uint32_t property =3D data & WDT_POLARITY_MASK;
> > +
> > +        if (property && is_ast2500(s)) {
> > +            if (property =3D=3D WDT_ACTIVE_HIGH_MAGIC) {
> > +                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_ACTIVE_H=
IGH;
> > +            } else if (property =3D=3D WDT_ACTIVE_LOW_MAGIC) {
> > +                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_ACTIVE_=
HIGH;
> > +            } else if (property =3D=3D WDT_PUSH_PULL_MAGIC) {
> > +                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_PUSH_PUL=
L;
> > +            } else if (property =3D=3D WDT_OPEN_DRAIN_MAGIC) {
> > +                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_PUSH_PU=
LL;
> > +            }
> > +        }
> > +        s->regs[WDT_RESET_WIDTH] &=3D ~s->ext_pulse_width_mask;
> > +        s->regs[WDT_RESET_WIDTH] |=3D data & s->ext_pulse_width_mask;
> > +        break;
> > +    }
> >      case WDT_TIMEOUT_STATUS:
> >      case WDT_TIMEOUT_CLEAR:
> > -    case WDT_RESET_WDITH:
> >          qemu_log_mask(LOG_UNIMP,
> >                        "%s: uninmplemented write at offset 0x%" HWADDR_=
PRIx "\n",
> >                        __func__, offset);
> > @@ -167,6 +212,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
> >      s->regs[WDT_RELOAD_VALUE] =3D 0x03EF1480;
> >      s->regs[WDT_RESTART] =3D 0;
> >      s->regs[WDT_CTRL] =3D 0;
> > +    s->regs[WDT_RESET_WIDTH] =3D 0xFF;
> >=20=20
> >      timer_del(s->timer);
> >  }
> > @@ -187,6 +233,25 @@ static void aspeed_wdt_realize(DeviceState *dev, E=
rror **errp)
> >      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> >      AspeedWDTState *s =3D ASPEED_WDT(dev);
> >=20=20
> > +    if (!is_supported_silicon_rev(s->silicon_rev)) {
> > +        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
> > +                s->silicon_rev);
> > +        return;
> > +    }
> > +
> > +    switch (s->silicon_rev) {
> > +    case AST2400_A0_SILICON_REV:
> > +    case AST2400_A1_SILICON_REV:
> > +        s->ext_pulse_width_mask =3D 0xff;
> > +        break;
> > +    case AST2500_A0_SILICON_REV:
> > +    case AST2500_A1_SILICON_REV:
> > +        s->ext_pulse_width_mask =3D 0xfffff;
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +
> >      s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_exp=
ired, dev);
> >=20=20
> >      /* FIXME: This setting should be derived from the SCU hw strapping
> > @@ -199,6 +264,11 @@ static void aspeed_wdt_realize(DeviceState *dev, E=
rror **errp)
> >      sysbus_init_mmio(sbd, &s->iomem);
> >  }
> >=20=20
> > +static Property aspeed_wdt_properties[] =3D {
> > +    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> >  static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> > @@ -207,6 +277,7 @@ static void aspeed_wdt_class_init(ObjectClass *klas=
s, void *data)
> >      dc->reset =3D aspeed_wdt_reset;
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >      dc->vmsd =3D &vmstate_aspeed_wdt;
> > +    dc->props =3D aspeed_wdt_properties;
> >  }
> >=20=20
> >  static const TypeInfo aspeed_wdt_info =3D {
> > diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt=
_aspeed.h
> > index 080c2231222e..7de3e5c224fb 100644
> > --- a/include/hw/watchdog/wdt_aspeed.h
> > +++ b/include/hw/watchdog/wdt_aspeed.h
> > @@ -27,6 +27,8 @@ typedef struct AspeedWDTState {
> >      uint32_t regs[ASPEED_WDT_REGS_MAX];
> >=20=20
> >      uint32_t pclk_freq;
> > +    uint32_t silicon_rev;
> > +    uint32_t ext_pulse_width_mask;
> >  } AspeedWDTState;
> >=20=20
> >  #endif  /* ASPEED_WDT_H */
> >=20
>=20
