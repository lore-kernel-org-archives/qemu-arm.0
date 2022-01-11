Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1459284lfj;
        Mon, 10 Jan 2022 23:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7KBOcirjHq/ifbcK/srz+RhvX34R+hwvZfZeyOC/y5nR64wqNdNULAG5tlx0A2eLeYkj5
X-Received: by 2002:a25:ea4a:: with SMTP id o10mr4558761ybe.442.1641887918599;
        Mon, 10 Jan 2022 23:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641887918; cv=none;
        d=google.com; s=arc-20160816;
        b=GvXDJ3Ye+d1hMCcltC+LLG5gaZRwir5woGzPcWgCgGZWkzYrenIP16Y3/TE1GmirJe
         gU9H4HvYgVFVFLwA7CtKTnf2YNJ2wO76bTyE9JTrjmDKf7VNitAe6188vJVy997p2rwq
         dj8fCYK1pi5gkkQnq5ZHGCiM5gfjxyj1/WvwAt//EqZT3wwvH3dKF6GK5fkJb7foLJqw
         XYgZjIPpIfsQdsytS8y0IyAQ9Um3mqWzw15xB7DGQ0ZPSu4LBxp6Yuste4duAA0yfvNU
         nUB4Ar2GFNSjHJNrwERoatUGeT6IVm9ulCwjO4GBN0pJVRQyORbmHsfFR5c6tFwkk/OD
         5B8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dFVNeYGyXmFLMMdLimt08O1vqK2n7tmXJo/jWUCpoLY=;
        b=d5975Zyq1BGcGUavl90XsJh8vHwcJ9K41lkPqipCc99s7rVgdHLseDCcohqpgq+RZu
         Ksr4QI5FWGCTnsJBS7zHoePYsnIbS/3ozXmspyisZ2Cwio/HNBnKJ2P9P8V174adr8m5
         kIgzhWen1bzSqWV6EC8BmWJr5Dn+xs0rbWRXv3+ZKnNcXQdgPg0mHFpswupPQy9xWN43
         pKEJOGAMVuAyI2SxxjE9j4adv4zCZLT6By9u1gxABidAdrbFevOhrz1XVTwMeWgj6pLN
         AjygfZZwXyprzXOsbiIHneBvOTiChb+v150d2j61AyTSM0dr2Xc1b0RsQEXhR80lv8Rd
         pOCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=S5KeU6mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r126si4590971ybr.132.2022.01.10.23.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 23:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=S5KeU6mV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7C3B-0005wk-Lr
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 02:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7C0c-0005Hb-Pl; Tue, 11 Jan 2022 02:56:00 -0500
Received: from [2607:f8b0:4864:20::236] (port=42891
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7C0a-0006Ad-VI; Tue, 11 Jan 2022 02:55:58 -0500
Received: by mail-oi1-x236.google.com with SMTP id w80so21727021oie.9;
 Mon, 10 Jan 2022 23:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dFVNeYGyXmFLMMdLimt08O1vqK2n7tmXJo/jWUCpoLY=;
 b=S5KeU6mVoaDt78KFRmPOfM/5tAaQc0HpvM9VSvywFnFX14TV3mok+GzMpBp9iM1o7J
 /jDjVOJM67Etwp7IndWmxUMdsCHfDcT5RZYbikweyuaP9uBj8eOpAN79cmcbejQOqPu5
 Ry7yYEmbqqz9Py9aTqtzUPHwyB51rQHUA9ObRmhz/IzGbMYjmqV3ZVyhT8+iIWOozLin
 zYQTDRwho8gToLQME7ucXn/03xDYaCefKvlETB8vkyr83KV8J3XLKy+ZxqZbbP2J6org
 hht1i2moBMcKe0y2wCaKqjtfoFrnwQiT203KkeJuwpGN0GUZCFKcNaqwQq3qLShhP345
 QUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dFVNeYGyXmFLMMdLimt08O1vqK2n7tmXJo/jWUCpoLY=;
 b=vVSnPfiRcZaCCYRukF5wCUQM/ZZIrKnklgYaXpRuF8Bk/tyWWpPIeA21TEWkFcR7Wc
 9IMaCElE1Blx8khl+KHYNuCLlv3v2YvK93drmj5nyy8RIRmCx4b/dzML1KY6tDVZIuYg
 Q9+vRNa51ewjrLxXwLKOG2FKe4via/AcRYMUdsLZkhcqYR67YIvaS1//VmMhAm4pndiy
 Qi9b/NaPTNCSJOaLt1CU++unqzzLzMtOysrC2dGSOuhIooknCQKz/lBq0fAqEgD0a4ZR
 /44sab7wYDNp42LItcQ0FlGTknZ9GYsxqnGNgisexrwqRnh89720r1kMAAC9kRP2kerD
 FYsw==
X-Gm-Message-State: AOAM531Ev4WvhMoYr2jJ+dANx/hu+4qiEpwm/Vc9QimRILys2/2QCQYw
 /1FfOz2F9D09mp1pTXaKVsciit0THiL1ra1OmyI=
X-Received: by 2002:aca:37c4:: with SMTP id e187mr1046960oia.126.1641887755310; 
 Mon, 10 Jan 2022 23:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
 <20220110072125.1886683-3-troy_lee@aspeedtech.com>
 <35743221-eee1-ad17-3484-bc02cef82e0a@kaod.org>
In-Reply-To: <35743221-eee1-ad17-3484-bc02cef82e0a@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 11 Jan 2022 15:55:48 +0800
Message-ID: <CAN9Jwz1UHmF9oc+dia-YT_KNRsWsjWK+BppXyjw+B0foSHBY+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm/aspeed_ast2600: create i3c instance
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1/rn59qgeEW

On Mon, Jan 10, 2022 at 10:31 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 1/10/22 08:21, Troy Lee wrote:
> > This patch includes i3c instance in ast2600 soc.
> >
> > v2: Rebase to mainline QEMU
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > ---
> >   hw/arm/aspeed_ast2600.c     | 19 ++++++++++++++++++-
> >   include/hw/arm/aspeed_soc.h |  3 +++
> >   2 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index e33483fb5d..36aa31601a 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_PWM]       =3D 0x1E610000,
> >       [ASPEED_DEV_FMC]       =3D 0x1E620000,
> >       [ASPEED_DEV_SPI1]      =3D 0x1E630000,
> > -    [ASPEED_DEV_SPI2]      =3D 0x1E641000,
> > +    [ASPEED_DEV_SPI2]      =3D 0x1E631000,
>
> Indeed ! But this belongs to another patch fixing the value.
>

Oops, that should be in a different branch, I might accidentally pick
that into my working branch. dkodihal will send it separately.


> >       [ASPEED_DEV_EHCI1]     =3D 0x1E6A1000,
> >       [ASPEED_DEV_EHCI2]     =3D 0x1E6A3000,
> >       [ASPEED_DEV_MII1]      =3D 0x1E650000,
> > @@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_UART1]     =3D 0x1E783000,
> >       [ASPEED_DEV_UART5]     =3D 0x1E784000,
> >       [ASPEED_DEV_VUART]     =3D 0x1E787000,
> > +    [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
> >       [ASPEED_DEV_SDRAM]     =3D 0x80000000,
> >   };
> >
> > @@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
> >       [ASPEED_DEV_ETH4]      =3D 33,
> >       [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
> >       [ASPEED_DEV_DP]        =3D 62,
> > +    [ASPEED_DEV_I3C]       =3D 102,   /* 102 -> 107 */
> >   };
> >
> >   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >
> >       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> >       object_initialize_child(obj, "hace", &s->hace, typename);
> > +
> > +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> >   }
> >
> >   /*
> > @@ -523,6 +527,19 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> >       sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DE=
V_HACE]);
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> >                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> > +    /* I3C */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_=
I3C]);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> > +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
>
> The controller device does not have an IRQ line.
>

Removed in v3.
Thanks for the review,
Troy Lee

> Thanks,
>
> C.
>
>
>
> > +    for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> > +        qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> > +                                        sc->irqmap[ASPEED_DEV_I3C] + i=
);
> > +        /* The AST2600 I3C controller has one IRQ per bus. */
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq)=
;
> > +    }
> >   }
> >
> >   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data=
)
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 18fb7eed46..cae9906684 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -21,6 +21,7 @@
> >   #include "hw/timer/aspeed_timer.h"
> >   #include "hw/rtc/aspeed_rtc.h"
> >   #include "hw/i2c/aspeed_i2c.h"
> > +#include "hw/misc/aspeed_i3c.h"
> >   #include "hw/ssi/aspeed_smc.h"
> >   #include "hw/misc/aspeed_hace.h"
> >   #include "hw/watchdog/wdt_aspeed.h"
> > @@ -51,6 +52,7 @@ struct AspeedSoCState {
> >       AspeedRtcState rtc;
> >       AspeedTimerCtrlState timerctrl;
> >       AspeedI2CState i2c;
> > +    AspeedI3CState i3c;
> >       AspeedSCUState scu;
> >       AspeedHACEState hace;
> >       AspeedXDMAState xdma;
> > @@ -141,6 +143,7 @@ enum {
> >       ASPEED_DEV_HACE,
> >       ASPEED_DEV_DPMCU,
> >       ASPEED_DEV_DP,
> > +    ASPEED_DEV_I3C,
> >   };
> >
> >   #endif /* ASPEED_SOC_H */
> >
>
