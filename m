Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60011E92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ45-0003k9-OS; Mon, 29 Dec 2025 14:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ3x-0003Zc-Ou
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:53 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ3v-0000E5-Lw
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:37:53 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3867431cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037071; cv=none;
 d=google.com; s=arc-20240605;
 b=b8MN7CpId3cOIwfaSXXsv+axDaaPubIFEtWIXTNlnhbe5KUI0BGRqXUhmnVQFQ2p5u
 Q3ixKHE80tlKmYeR+szr/vV+FCg6n7M2QzTUkeLOSkeALGhBrqXsDDD/hFFALtkayT58
 k1MDA0pFerE0tNxaNS5UPsrrTA/OBl9IsjGMoUmfZLCZqUL465wCWQ79gee0146mF9tw
 riOWKHl/m+T/Yh+JoBbst77XvYm+rLNyxeRd5u4gTwZAmYa5tmSW2vWmebeEjDDRhg7w
 CGevUEyN7x3q0iSJUDseyMFfbG3+eVlzuaz1/GbV/nlwIxfUDQZABk5VrRTrHKST8oAK
 7sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Oc0Eicmqsegr21jAAuYrfaRxCYikt927C1D4WMgzzqs=;
 fh=G2ECEVVVTdq18xErLHrUnH+y/BGXrZdMafykqY6xtko=;
 b=jTlrQx9YSC11VGQHyhmSNQQPKPQtGijWalzQ5xIhdRtCT0jTlF3QmP7cmK0ppOtY+/
 /d+oduPQiedkcl1KcjbHvFjk4ypiIADzwIDADSSOqeeF3XrlxOoR5JGAmnaO9STTMFrj
 Ju0ARsKyS4qpH2G0sAs05ynWv6kfsgHYxdhgx3qWDSIGxEp4S6DBJaQbTRXyy/0/M1gb
 epDq0vwlffbToB+kiRviz1VWYuYn+6RC9aTt00tEYzLtQyl4udbLfSswSWTqY5awQgSD
 8kOx52TrEG7TAsa/UymbR1Iy6sBjKoiwHK96i0ZyOhvut22gtQV1fj2NX4KFNhLkY/ir
 dc1g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037071; x=1767641871; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oc0Eicmqsegr21jAAuYrfaRxCYikt927C1D4WMgzzqs=;
 b=TinwYl2zLFcmDphcbE4q/rrLl646jOybUn5IhVLmlPa6ndcRFb6YnCAN8Frj3oo+ag
 1vzF9Q1rZb/vWBvwqZCAuwU2fz8QxtnSjvG2ZGVerlEfufyzIvlC6JdsWg01H+aMAvGz
 eHKFbxLAoswFZ1ubZC7hCzgje3DUjIYbfW3R+CxQsChZGz91WESHYjCTUTZVi81m8tJs
 /oDRgMMKv5fa/FWn2wilDgYL1dID0+Ozbr3J8pRvyuNG836uXjKFbEcCtJKcRrVDPkVr
 ag2pYdjoCodTjqDGceqKD+NmIYC8VsNCQ1PGGS0zb1gaIwyoBA34HPgLRvc0WsZGsJ4v
 HRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037071; x=1767641871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oc0Eicmqsegr21jAAuYrfaRxCYikt927C1D4WMgzzqs=;
 b=dqlK37LCAHUPFixgR2D0HGjAxAfTCuUS9LY4FkRuwZ1B5906AkJbK9P1vtxHtBNLT0
 HFsnsazrDx7x1m0s94duxQjBQ9ZZpWBPGXnK9Ih3KmekSFsPkkkm+WpDhTgBmBb8NCv3
 2DmPeUCpREbARwYSfKX4T4kmCgQNx0PwTX7M4AlsLoOa0fhV6u0BLS+RDW5hMwx5/k5H
 og1C+l5d+IOB3mbwf9Yz7oSMZs06x1yD9XbHqcvUHKYXxWOBFwLgNqjItOVGBG38Xvic
 P8UjZAfITXZtU3g44rPyQ7LeYZCNISw5SiUZMfEMjfLOtp8JJ8wOK+wNTUkHY4+En8Dv
 /qLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv/eSCyGvjLk+T+zIbhwVwfM7hH0SCDemz4NITx+ZOoOVFF2OXnembyM6C/XJFNf7yJ6t4BLSykA==@nongnu.org
X-Gm-Message-State: AOJu0Yycuc/y8myTEcvxDmWXG2E+5tYoLIWWrQm6b0zoK52qpZfu2q5W
 w5jfiRopox6xDMn0TTEh7t21LcHIjXpH6ECS8wuFC0kpdJOFBVUVUO6XTMSJJ8WBQIDxYr9qFNh
 1KGOyj2i/9htBl/NpAuCOsZeCuPeGxNbXfCdpHSTtmiydSCbc3+8yCcSp4S4=
X-Gm-Gg: AY/fxX5v3x8o/L5cQViuWWxyog4SuiGTE+3n+wZRTG1TnV5TvL9OIJHbUonbhsZihtr
 9k6SDq8UtK/PAeUO2Jlwus/2uECKJDOJPpC1RbKVBTPipIdpI0KPrwmEb9aMzWBycPkx6fNZLKW
 9T4zIShAp5NpG/sk18ljHxqmo73jhxPsuDspMv5IlYjwZLiXtGcBQIQf8kAcmKzjZx8S1IbJODE
 WkLmJlSlAKVl7R6kkVn/WGYemmfz/OvZeCeH6O3BV+9AechwBZX1qH9HUhwfAg8G7FtvHnYJtJ0
 13IQw3j+gKkW5zUjghERqUmatQ==
X-Google-Smtp-Source: AGHT+IGI3DQccZWs8wOV17/EJ95hoNum8iNBrD1xrOsLczR3U0JhXxaRTGM272h90Cdl0P5zxm3ZnH6xlmCsH7CNj9g=
X-Received: by 2002:a05:622a:307:b0:4eb:7681:d90 with SMTP id
 d75a77b69052e-4f4e4e5b475mr31215111cf.16.1767037070433; Mon, 29 Dec 2025
 11:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-4-kane_chen@aspeedtech.com>
 <3369eba7-b1f9-4356-8f77-d2da2c6b7b07@kaod.org>
In-Reply-To: <3369eba7-b1f9-4356-8f77-d2da2c6b7b07@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:37:39 -0800
X-Gm-Features: AQt7F2pUyy2IxM18pk7vkf5j05FvHx8BXjNR5ZDVYNGugM94Ww72XQzVGcmbMOs
Message-ID: <CA+QoejWGK5s2EOSp3OXUXFHExNxvmUr6PDnOo5W=g4rATBJ=_A@mail.gmail.com>
Subject: Re: [PATCH v4 03/19] hw/misc: Add basic Aspeed PWM model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Dec 24, 2025 at 2:37=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 12/24/25 02:41, Kane Chen via wrote:
> > From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> It should be From: clg ...
>
> I will fix it. Don't resend for that.
>
>
> Thanks,
>
> C.
>
> >
> > Add an initial PWM model for Aspeed SoCs, including device state,
> > register definitions, and basic initialization as a sysbus device.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


> > ---
> >   include/hw/arm/aspeed_soc.h  |   3 +-
> >   include/hw/misc/aspeed_pwm.h |  31 +++++++++
> >   hw/misc/aspeed_pwm.c         | 121 ++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build          |   1 +
> >   hw/misc/trace-events         |   4 ++
> >   5 files changed, 159 insertions(+), 1 deletion(-)
> >   create mode 100644 include/hw/misc/aspeed_pwm.h
> >   create mode 100644 hw/misc/aspeed_pwm.c
> >
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index bca10c387b..7b08cca908 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -28,6 +28,7 @@
> >   #include "hw/misc/aspeed_hace.h"
> >   #include "hw/misc/aspeed_sbc.h"
> >   #include "hw/misc/aspeed_sli.h"
> > +#include "hw/misc/aspeed_pwm.h"
> >   #include "hw/watchdog/wdt_aspeed.h"
> >   #include "hw/net/ftgmac100.h"
> >   #include "target/arm/cpu.h"
> > @@ -88,6 +89,7 @@ struct AspeedSoCState {
> >       MemoryRegion secsram;
> >       UnimplementedDeviceState sbc_unimplemented;
> >       AspeedSDMCState sdmc;
> > +    AspeedPWMState pwm;
> >       AspeedWDTState wdt[ASPEED_WDTS_NUM];
> >       FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> >       AspeedMiiState mii[ASPEED_MACS_NUM];
> > @@ -108,7 +110,6 @@ struct AspeedSoCState {
> >       UnimplementedDeviceState video;
> >       UnimplementedDeviceState emmc_boot_controller;
> >       UnimplementedDeviceState dpmcu;
> > -    UnimplementedDeviceState pwm;
> >       UnimplementedDeviceState espi;
> >       UnimplementedDeviceState udc;
> >       UnimplementedDeviceState ltpi;
> > diff --git a/include/hw/misc/aspeed_pwm.h b/include/hw/misc/aspeed_pwm.=
h
> > new file mode 100644
> > index 0000000000..13dc3ea45b
> > --- /dev/null
> > +++ b/include/hw/misc/aspeed_pwm.h
> > @@ -0,0 +1,31 @@
> > +/*
> > + * ASPEED PWM Controller
> > + *
> > + * Copyright (C) 2017-2021 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef ASPEED_PWM_H
> > +#define ASPEED_PWM_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_PWM "aspeed.pwm"
> > +#define ASPEED_PWM(obj) OBJECT_CHECK(AspeedPWMState, (obj), TYPE_ASPEE=
D_PWM)
> > +
> > +#define ASPEED_PWM_NR_REGS (0x10C >> 2)
> > +
> > +typedef struct AspeedPWMState {
> > +    /* <private> */
> > +    SysBusDevice parent;
> > +
> > +    /*< public >*/
> > +    MemoryRegion iomem;
> > +    qemu_irq irq;
> > +
> > +    uint32_t regs[ASPEED_PWM_NR_REGS];
> > +} AspeedPWMState;
> > +
> > +#endif /* _ASPEED_PWM_H_ */
> > diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
> > new file mode 100644
> > index 0000000000..de209274af
> > --- /dev/null
> > +++ b/hw/misc/aspeed_pwm.c
> > @@ -0,0 +1,121 @@
> > +/*
> > + * ASPEED PWM Controller
> > + *
> > + * Copyright (C) 2017-2021 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > +#include "hw/misc/aspeed_pwm.h"
> > +#include "qapi/error.h"
> > +#include "migration/vmstate.h"
> > +
> > +#include "trace.h"
> > +
> > +static uint64_t aspeed_pwm_read(void *opaque, hwaddr addr,
> > +                                     unsigned int size)
> > +{
> > +    AspeedPWMState *s =3D ASPEED_PWM(opaque);
> > +    uint64_t val =3D 0;
> > +
> > +    addr >>=3D 2;
> > +
> > +    if (addr >=3D ASPEED_PWM_NR_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PR=
Ix "\n",
> > +                      __func__, addr << 2);
> > +    } else {
> > +        val =3D s->regs[addr];
> > +    }
> > +
> > +    trace_aspeed_pwm_read(addr << 2, val);
> > +
> > +    return val;
> > +}
> > +
> > +static void aspeed_pwm_write(void *opaque, hwaddr addr, uint64_t data,
> > +                              unsigned int size)
> > +{
> > +    AspeedPWMState *s =3D ASPEED_PWM(opaque);
> > +
> > +    trace_aspeed_pwm_write(addr, data);
> > +
> > +    addr >>=3D 2;
> > +
> > +    if (addr >=3D ASPEED_PWM_NR_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_P=
RIx "\n",
> > +                      __func__, addr << 2);
> > +        return;
> > +    }
> > +
> > +    s->regs[addr] =3D data;
> > +}
> > +
> > +static const MemoryRegionOps aspeed_pwm_ops =3D {
> > +    .read =3D aspeed_pwm_read,
> > +    .write =3D aspeed_pwm_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    },
> > +};
> > +
> > +static void aspeed_pwm_reset(DeviceState *dev)
> > +{
> > +    struct AspeedPWMState *s =3D ASPEED_PWM(dev);
> > +
> > +    memset(s->regs, 0, sizeof(s->regs));
> > +}
> > +
> > +static void aspeed_pwm_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AspeedPWMState *s =3D ASPEED_PWM(dev);
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +
> > +    sysbus_init_irq(sbd, &s->irq);
> > +
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_pwm_ops, s,
> > +            TYPE_ASPEED_PWM, 0x1000);
> > +
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +}
> > +
> > +static const VMStateDescription vmstate_aspeed_pwm =3D {
> > +    .name =3D TYPE_ASPEED_PWM,
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(regs, AspeedPWMState, ASPEED_PWM_NR_REGS)=
,
> > +        VMSTATE_END_OF_LIST(),
> > +    }
> > +};
> > +
> > +static void aspeed_pwm_class_init(ObjectClass *klass, const void *data=
)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D aspeed_pwm_realize;
> > +    device_class_set_legacy_reset(dc, aspeed_pwm_reset);
> > +    dc->desc =3D "Aspeed PWM Controller";
> > +    dc->vmsd =3D &vmstate_aspeed_pwm;
> > +}
> > +
> > +static const TypeInfo aspeed_pwm_info =3D {
> > +    .name =3D TYPE_ASPEED_PWM,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedPWMState),
> > +    .class_init =3D aspeed_pwm_class_init,
> > +};
> > +
> > +static void aspeed_pwm_register_types(void)
> > +{
> > +    type_register_static(&aspeed_pwm_info);
> > +}
> > +
> > +type_init(aspeed_pwm_register_types);
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 45b16e7797..7afe1d0009 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -137,6 +137,7 @@ system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: f=
iles(
> >     'aspeed_i3c.c',
> >     'aspeed_lpc.c',
> >     'aspeed_ltpi.c',
> > +  'aspeed_pwm.c',
> >     'aspeed_scu.c',
> >     'aspeed_sbc.c',
> >     'aspeed_sdmc.c',
> > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > index eeb9243898..f7870babba 100644
> > --- a/hw/misc/trace-events
> > +++ b/hw/misc/trace-events
> > @@ -299,6 +299,10 @@ aspeed_i3c_write(uint64_t offset, uint64_t data) "=
I3C write: offset 0x%" PRIx64
> >   aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t d=
ata) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
> >   aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t =
data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
> >
> > +# aspeed_pwm.c
> > +aspeed_pwm_read(uint64_t offset, uint64_t data) "read: offset 0x%" PRI=
x64 " data 0x%" PRIx64
> > +aspeed_pwm_write(uint64_t offset, uint64_t data) "write: offset 0x%" P=
RIx64 " data 0x%" PRIx64
> > +
> >   # aspeed_sdmc.c
> >   aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " da=
ta: 0x%" PRIx64
> >   aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " dat=
a: 0x%" PRIx64
>

