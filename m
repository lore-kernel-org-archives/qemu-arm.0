Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6323268lfb;
        Tue, 28 Dec 2021 01:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweDYzPRmXECyXh13tWGa2+QdYGSnz3heBWgKoTuJgtCZTsghoPLhFUw65rQ1501xFW6aPQ
X-Received: by 2002:a25:4285:: with SMTP id p127mr8399587yba.261.1640683001447;
        Tue, 28 Dec 2021 01:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683001; cv=none;
        d=google.com; s=arc-20160816;
        b=dp9lICv9RtLnDV5mNCGMo/gp1XxEhAFwKLz5JEuCvGJNrGlpTbBBuC794XQ2xJaFTr
         RkSOnyqTuAgM40T+CgDXJGyy6ijAPq2Lju5IauaKMxfIoGZ7hZJZN75m0lt3vR9c8bhR
         eiyL6KRZIdJd/SKiQXRL4dCO+Sub8agZba/CYH64tWiaOTQ2Jj4FEtf4LracZexFZ7/p
         r/Ie94YTFolTM8h1x9HeRN08nyqJxvthG4Qs9eV7hxM/m81o6DN6Y0/nrl5P+CRWLs1M
         ygROVh7L0oQCetmP/uTNCYAwb4yGaFxGUac9q7vdNNSGostWJteghdtJG4Ry+zL8XPhD
         0sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
        b=wXm6c996NsbReQk0qsXTJ1aSta49Nji3yoz3EtUulUuj+DCWPljdGixgiy53cu9brn
         eEUnHePFMwl1GDQ4+LfOqhmD4QfA2KDR9qgtqkeCrq3/CWoNzB8WZEJWQAJCdk0BPZuX
         hrUMtc3V9qYjKomGupEP4rCmJpaHsAOopfIlcv7UzniRk5xH3hPmAow1PCZ/MlJJZu/Y
         7K9w6pMwEbUY9ioIyISXomM0jcI6Um3mZwT7Xy9VBwTp1v76gfleTsm6qeZY0K7Sy6bX
         rqI8VYs6Nux3W+WVYDMaY3HXo2CA/3sEldU6RTUgcvwfFyq6+MBveQ+iX1umzSn7Mq22
         7RtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gME9jCez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j79si8025895ybg.434.2021.12.28.01.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gME9jCez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28b2-0003ND-OS
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n28ar-0003Kt-4D; Tue, 28 Dec 2021 04:16:29 -0500
Received: from [2607:f8b0:4864:20::32e] (port=42540
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n28ap-0006Bx-Ba; Tue, 28 Dec 2021 04:16:28 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 a26-20020a9d6e9a000000b0058f37eeb861so21134906otr.9; 
 Tue, 28 Dec 2021 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=gME9jCezNa75fYUBtMpekJR2/GISRwuWGzc4zSPUP0Q/kdgFwfKqMRPzLiInvg718A
 kJaBftJSSnr0XtKrJ6CmWVgENaYgFJoBtN0snJsYWXPBitxTC8ErQXNI/CFBoOuyku9E
 38Lsv4xCms3zNcqW6VwWRvMKvlsuFtB010YZbAEVWmyMW6DbcDzW9eOgRpg9z6nC2hF7
 qRHohuuSKSP+z1ircBcR/c8+jOECQESuPBW4x5zwUwu2zy6KYroKTaBQfj2JDfuBoUYS
 H10rTrXfUm6wU3nHnujUjDv8VApmD9/+NQr5sz4l7pJf7ldomgNT1V5BPhmAfsPP3saC
 AOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=IivQjec5wRpUImoPz8Cg0HrfDcBXs7pi6BKpLBemxJtdOJ/lC5pwOV56d4rT3J8/p0
 cJ7rjmv6t2LoXODWZEQw6APIWuR0Zu6ugX4LC/X2OMyfDz0pj62uQaW6mhGwvXPtLhnS
 VVKZwdNI5QIfZAa4wbvMPoQCLenGvziGnVakbTpSyX+TieXfzQmyB7pBF+agtL1vyatf
 U9ODpvvl6wgd+m9lPxqOgJzp9RPFsCpHJcnkfjJATFUiWGnCqxELzpU16sF71o1JJKX1
 fNc1D5Z8b/usUJO0N9SRTEXLiI7hX5wg+C5eeFOmay9doXAfireOql43ZJDYh7KhVRwC
 ++Kw==
X-Gm-Message-State: AOAM533jwCUf0uH2Wp4DLpiDwJm3Z55MQCHMDvewugihfZBCpVjWA7kx
 jAUWrzTmoodsZM63GAQnvhDvThCuQErNF7hIbG8=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr14718627otp.112.1640682985831; 
 Tue, 28 Dec 2021 01:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-3-troy_lee@aspeedtech.com>
 <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
In-Reply-To: <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 28 Dec 2021 17:16:19 +0800
Message-ID: <CAN9Jwz1pqwv4ATH-qX9fxqVYYwDd2BcRve+p_rCDo=pNbavwcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=leetroy@gmail.com; helo=mail-ot1-x32e.google.com
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YceBiW/yHeyI

On Thu, Dec 23, 2021 at 9:54 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/22/21 10:23, Troy Lee wrote:
> > This patch includes i3c instance in ast2600 soc.
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Looks good but it is based on the QEMU aspeed branch for OpenBMC.
> You should rebase on upstream.
>
> Thanks,
>
> C.
>
Will do.

Thanks,
Troy Lee

> > ---
> >   hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
> >   include/hw/arm/aspeed_soc.h |  3 +++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index f2fef9d706..219b025bc2 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_VUART]     =3D 0x1E787000,
> >       [ASPEED_DEV_FSI1]      =3D 0x1E79B000,
> >       [ASPEED_DEV_FSI2]      =3D 0x1E79B100,
> > +    [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
> >       [ASPEED_DEV_SDRAM]     =3D 0x80000000,
> >   };
> >
> > @@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
> >       [ASPEED_DEV_FSI1]      =3D 100,
> >       [ASPEED_DEV_FSI2]      =3D 101,
> >       [ASPEED_DEV_DP]        =3D 62,
> > +    [ASPEED_DEV_I3C]       =3D 102,   /* 102 -> 107 */
> >   };
> >
> >   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >
> >       object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
> >
> > +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> > +
> >       object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_AP=
B2OPB);
> >   }
> >
> > @@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
> >                          aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
> >
> > +    /* I3C */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_=
I3C]);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> > +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
> > +
> >       /* FSI */
> >       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
> >           return;
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 0db200d813..0c950fab3c 100644
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
> > @@ -53,6 +54,7 @@ struct AspeedSoCState {
> >       AspeedRtcState rtc;
> >       AspeedTimerCtrlState timerctrl;
> >       AspeedI2CState i2c;
> > +    AspeedI3CState i3c;
> >       AspeedSCUState scu;
> >       AspeedHACEState hace;
> >       AspeedXDMAState xdma;
> > @@ -148,6 +150,7 @@ enum {
> >       ASPEED_DEV_FSI2,
> >       ASPEED_DEV_DPMCU,
> >       ASPEED_DEV_DP,
> > +    ASPEED_DEV_I3C,
> >   };
> >
> >   #endif /* ASPEED_SOC_H */
> >
>
