Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1063150njg;
        Wed, 18 Sep 2024 16:03:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYn2AKfLSV63yn5a1+t45xL2G7Qh8ERDesD7dSHDcwpMNf6xhIbnksLX9GFtbpfmI6nVXtni7e7+SjfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE3Y9MS7vaRMBW+AF6KTcDMAbCMcdVW3I3EEH7qPxYNhD3liUy9uy+1+w/JlWz05zIhb+5Z
X-Received: by 2002:a05:620a:298d:b0:7a9:b425:15 with SMTP id af79cd13be357-7ab30d17afdmr3308805785a.19.1726700621339;
        Wed, 18 Sep 2024 16:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726700621; cv=none;
        d=google.com; s=arc-20240605;
        b=i/CMv5YsI9BjLYm/4b+lr8BBBc4P1S9wYcFbMFJna9Twf9oEzKqqmsUNxLc0QDnZTs
         52dzorrgxiKbH9RUGRe02jtRFWXyTtUDdaSzbuPAZ9Okwy8HNhjVLMcFO+TdkyNPEC6Z
         IeK7ovIWI6tFN/NuDRpbi7IKVvaSmP3HR4SR/QNvXQNWh/aqKnVBVJi/AOM7T1aWI4qs
         j6Xw3Am9YVtU4QGScMinCqE3TcYXuGUc/xkxu8oOFtdANHdw6m/FDhuunsWwCB6JYqM8
         IjGv3OETBJu+1i4avIHDHZGovj1K65CtHjiNGKJKQBsmfBpe5jQpziHgtdrld9L3FhVN
         K/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=d0XHLnHSYciIA9k4ZqsqHgbNsw+iRtJoHrmtSqO/HIA=;
        fh=n2VBXYVjtf4gqTv8qQuHAWkU/c7MvA6lGmHyCt7lMzg=;
        b=UFDElBq7gvbx7meIeRE2fzc9+PmB6+zCNKtS0xChUgEvSikXmOhjjPQ1ZixH1LMG2u
         nXWsVJ5j+AQDAB4IpJzUcsrqXCUrdnhEhz+IMZ5bT68BUon0XYmHMOS0BwwN0ZzDWAjc
         1kQOOQzPj6a5+rrlIDtQmUMOmcd6uYqxkm4/lSNIioFWP8VU2mg9NbpWuUW/Jm15HTDY
         CjwY0LQsRk1s4RvTDN7gzTfbuzGQ6sAZPz191wv0isz3T4RGsmjeDQxd+fSg0MAk2qVN
         VAim82+tPYyRbE38sgn92aTz3Uz9PUhUUbiGwyOdcD3LJxHA8QVFe4Yps74Uycp1pZUh
         +fmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=N6p7ISje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1786ad6fsi5206421cf.143.2024.09.18.16.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 16:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=N6p7ISje;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr3hp-0007UF-QI; Wed, 18 Sep 2024 19:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1sr3ho-0007NY-7J
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 19:03:28 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1sr3hm-0005Hk-2p
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 19:03:27 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-536552fcc07so41360e87.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726700604; x=1727305404; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0XHLnHSYciIA9k4ZqsqHgbNsw+iRtJoHrmtSqO/HIA=;
 b=N6p7ISjetoKLPN5Excd0vqA+aqhRyN/uc0QsE674v8wwbFnomRNt638kOMppGqTD98
 DHh3WWdFLRHzdq9W1yk7mL21S/GYyqCjoBh8ewZrrXsnGoViW55Bo4kl0iG0Kl/4BX+Y
 Dzh9M3iAAC7gdY6KLYMPx3Fuwj5RpoNWgTvnH10w32GmNVIs3KiMCtM3QOo18BKWMz2D
 BeF8ShwifhOzSzFmR57+akK0SSJVM9PG3/pOVMuo08DI+4EkPgy62Q/aBOQfysEgNNUG
 6NommMByBRMBseLjrtDVgD9uGy1NohFpLgWeTl03bQNq/2A+xjRueiTyxKFLnCLvla1z
 5tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726700604; x=1727305404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0XHLnHSYciIA9k4ZqsqHgbNsw+iRtJoHrmtSqO/HIA=;
 b=Lxd1xhFYhAthY25dmwg/96RtnknqSHDN7Xn8bU5heTz3qbsLq2DVr4PAZF4Rg7Vd3K
 ksUi726UvWSrbM7TwZ0wUuBZ56Q+6Gh0N9fLsdab7yeh8KXJdsuYjW6VstHdSG7i3RuX
 O1Ip3u2x0J+zFZ+XdnC4xc5DLDBucibLjJLr1r4+GAK/HDYi/og6UCZdhDArLHzvg9sV
 sXAnoLwuqx2E63MyPiEeqLu9QoV8V3gjXxdzjwmKJT53UrNPpFc+03BXhUINmFiaJVJJ
 srkst42ns1rRBdNenpldPQNmAwWKrPRzq3bDw3D1RpMsjFC3L/zULWdfzfuVlEzgZayY
 zxVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/iJ+UlSdkbz463oiP6sKMTrIF+LA0583JHXB+fJDXgeRLcpKzgl0K5xevoGJzQgAx3rXfEX7IMQ==@nongnu.org
X-Gm-Message-State: AOJu0YxHwraP92Cofx1Dx3YIbRcaa9+C7AzKwbBbGCdJ0i9jXA0ROaBA
 GGjvWiKIzi340Vq/SX0dnbEwWjtNdzTHke8XpLZdRXpkJxfHk6Vasa4joLxXcW07sFs2V6CwUGs
 otSMpGHjkb2pJiaMVJuKh12YlHSs9L7idlJ15
X-Received: by 2002:a05:6512:1395:b0:52e:8475:7c23 with SMTP id
 2adb3069b0e04-536a7c2e3acmr12906e87.7.1726700603774; Wed, 18 Sep 2024
 16:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
 <20240918192254.3136903-20-tavip@google.com>
 <Zusypeay8cjjPTn0@mail.minyard.net>
In-Reply-To: <Zusypeay8cjjPTn0@mail.minyard.net>
From: Octavian Purdila <tavip@google.com>
Date: Wed, 18 Sep 2024 16:03:12 -0700
Message-ID: <CAGWr4cQapNbGZteQYAFYrgDnh3cY0xHnEtAiDW0zuURwZr_V3g@mail.gmail.com>
Subject: Re: [PATCH 19/25] hw/misc: add i2c-tester
To: corey@minyard.net
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, luc@lmichel.fr, 
 damien.hedde@dahe.fr, alistair@alistair23.me, thuth@redhat.com, 
 philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=tavip@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 63nxfL0aUXiA

On Wed, Sep 18, 2024 at 1:06=E2=80=AFPM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Wed, Sep 18, 2024 at 12:22:47PM -0700, Octavian Purdila wrote:
> > Add a simple i2c peripheral to be used for testing I2C device
> > models. The peripheral has a fixed number of registers that can be
> > read and written.
>
> Why is this better than just using the eeprom device?
>

The main reason for adding it is that, AFAICT, there is no i2c slave
device that responds with I2C_NACK during a transaction.

Also, having a dedicated device for testing purposes makes it easier
to add new features than adding it to a real device where it might not
always be possible. I tried to add the NACK functionality but I did
not find one where the datasheet would confirm the behaviour I was
looking for.

> This has some uncommon attributes compared to most i2c devices.  For
> instance, most i2c devices take their address as the first bytes of a
> write operation, then auto-increment after that for reads and writes.
> This seems to take one address on a write after a system reset, then use
> that forever.
>
> Anyway, unless there is a compelling reason to use this over the eeprom
> device, I'm going to recommend against it.
>


> -corey
>
> >
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >  include/hw/misc/i2c_tester.h |  30 ++++++++++
> >  hw/misc/i2c_tester.c         | 109 +++++++++++++++++++++++++++++++++++
> >  hw/misc/Kconfig              |   5 ++
> >  hw/misc/meson.build          |   2 +
> >  4 files changed, 146 insertions(+)
> >  create mode 100644 include/hw/misc/i2c_tester.h
> >  create mode 100644 hw/misc/i2c_tester.c
> >
> > diff --git a/include/hw/misc/i2c_tester.h b/include/hw/misc/i2c_tester.=
h
> > new file mode 100644
> > index 0000000000..f6b6491008
> > --- /dev/null
> > +++ b/include/hw/misc/i2c_tester.h
> > @@ -0,0 +1,30 @@
> > +/*
> > + *
> > + * Copyright (c) 2024 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef HW_I2C_TESTER_H
> > +#define HW_I2C_TESTER_H
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "hw/irq.h"
> > +
> > +#define I2C_TESTER_NUM_REGS    0x31
> > +
> > +#define TYPE_I2C_TESTER "i2c-tester"
> > +#define I2C_TESTER(obj) OBJECT_CHECK(I2cTesterState, (obj), TYPE_I2C_T=
ESTER)
> > +
> > +typedef struct {
> > +    I2CSlave i2c;
> > +    bool set_reg_idx;
> > +    uint8_t reg_idx;
> > +    uint8_t regs[I2C_TESTER_NUM_REGS];
> > +} I2cTesterState;
> > +
> > +#endif /* HW_I2C_TESTER_H */
> > diff --git a/hw/misc/i2c_tester.c b/hw/misc/i2c_tester.c
> > new file mode 100644
> > index 0000000000..77ce8bf91a
> > --- /dev/null
> > +++ b/hw/misc/i2c_tester.c
> > @@ -0,0 +1,109 @@
> > +/*
> > + * Simple I2C peripheral for testing I2C device models.
> > + *
> > + * Copyright (c) 2024 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "hw/misc/i2c_tester.h"
> > +
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "migration/vmstate.h"
> > +
> > +static void i2c_tester_reset_enter(Object *o, ResetType type)
> > +{
> > +    I2cTesterState *s =3D I2C_TESTER(o);
> > +
> > +    s->set_reg_idx =3D false;
> > +    s->reg_idx     =3D 0;
> > +    memset(s->regs, 0, I2C_TESTER_NUM_REGS);
> > +}
> > +
> > +static int i2c_tester_event(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    I2cTesterState *s =3D I2C_TESTER(i2c);
> > +
> > +    if (event =3D=3D I2C_START_SEND) {
> > +        s->set_reg_idx =3D true;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static uint8_t i2c_tester_rx(I2CSlave *i2c)
> > +{
> > +    I2cTesterState *s =3D I2C_TESTER(i2c);
> > +
> > +    if (s->reg_idx >=3D I2C_TESTER_NUM_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __f=
unc__,
> > +                      s->reg_idx);
> > +        return I2C_NACK;
> > +    }
> > +
> > +    return s->regs[s->reg_idx];
> > +}
> > +
> > +static int i2c_tester_tx(I2CSlave *i2c, uint8_t data)
> > +{
> > +    I2cTesterState *s =3D I2C_TESTER(i2c);
> > +
> > +    if (s->set_reg_idx) {
> > +        /* Setting the register in which the operation will be done. *=
/
> > +        s->reg_idx =3D data;
> > +        s->set_reg_idx =3D false;
> > +        return 0;
> > +    }
> > +
> > +    if (s->reg_idx >=3D I2C_TESTER_NUM_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __f=
unc__,
> > +                      s->reg_idx);
> > +        return I2C_NACK;
> > +    }
> > +
> > +    /* Write reg data. */
> > +    s->regs[s->reg_idx] =3D data;
> > +
> > +    return 0;
> > +}
> > +
> > +static const VMStateDescription vmstate_i2c_tester =3D {
> > +    .name =3D "i2c-tester",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (const VMStateField[]) {
> > +        VMSTATE_I2C_SLAVE(i2c, I2cTesterState),
> > +        VMSTATE_BOOL(set_reg_idx, I2cTesterState),
> > +        VMSTATE_UINT8(reg_idx, I2cTesterState),
> > +        VMSTATE_UINT8_ARRAY(regs, I2cTesterState, I2C_TESTER_NUM_REGS)=
,
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void i2c_tester_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> > +    ResettableClass *rc =3D RESETTABLE_CLASS(oc);
> > +    I2CSlaveClass *isc =3D I2C_SLAVE_CLASS(oc);
> > +
> > +    rc->phases.enter =3D i2c_tester_reset_enter;
> > +    dc->vmsd =3D &vmstate_i2c_tester;
> > +    isc->event =3D i2c_tester_event;
> > +    isc->recv =3D i2c_tester_rx;
> > +    isc->send =3D i2c_tester_tx;
> > +}
> > +
> > +static const TypeInfo i2c_tester_types[] =3D {
> > +    {
> > +        .name =3D TYPE_I2C_TESTER,
> > +        .parent =3D TYPE_I2C_SLAVE,
> > +        .instance_size =3D sizeof(I2cTesterState),
> > +        .class_init =3D i2c_tester_class_init
> > +    },
> > +};
> > +
> > +DEFINE_TYPES(i2c_tester_types);
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index 4b688aead2..3e93c12c8e 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -213,6 +213,11 @@ config IOSB
> >  config XLNX_VERSAL_TRNG
> >      bool
> >
> > +config I2C_TESTER
> > +    bool
> > +    default y if TEST_DEVICES
> > +    depends on I2C
> > +
> >  config FLEXCOMM
> >      bool
> >      select I2C
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index faaf2671ba..4f22231fa3 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -158,6 +158,8 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: fil=
es('sbsa_ec.c'))
> >  # HPPA devices
> >  system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
> >
> > +system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'=
))
> > +
> >  system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
> >  system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkct=
l0.c', 'rt500_clkctl1.c'))
> >  system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstct=
l.c'))
> > --
> > 2.46.0.662.g92d0881bb0-goog
> >
> >
