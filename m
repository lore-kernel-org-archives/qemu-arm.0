Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1079185njg;
        Wed, 18 Sep 2024 16:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsFSQB4gzbXMWoryiAh8Ir8J8x1ywNBra2tV5xU9MC8o1/UqnsluQZh8JpekGsnWBf4Bsl17UE86SSDA==@linaro.org
X-Google-Smtp-Source: AGHT+IGX+R4nAHDDA41wmBvS+7WP8WMoseIn5pmcrWqYqMdhR2VVl7vCsepnOPn4wFcWUz1Ep3b8
X-Received: by 2002:ac8:7f4e:0:b0:458:326d:8995 with SMTP id d75a77b69052e-45860442bb4mr419128031cf.54.1726703575312;
        Wed, 18 Sep 2024 16:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726703575; cv=none;
        d=google.com; s=arc-20240605;
        b=FIY4u/rUl3aJCX3gjZDCXhoLVraDxuWgtT/N5X3ML3TAUIsdmweg6lsR35K1ZjsEXw
         2mG/qR+u57ZPR0vbgs6Uym9KjGoL3PZQO+215dVnachzb+i2EkUiE0YNf/nJ2lKRad7F
         hGQhaVNO5QT7cxWwreBzP0ZgudijuIEruUHtNIM5d5ctWIInhBdnaHNeu0JHPx4jfcYo
         CGUCnZRHISVPb36c9bLFU4pdcyWAKQ6qkbhaVDv5/QSNkAP9DO5+5LkR5DP3ItciO0Am
         9AYRZMkATYs/0Nyam8CUAtiiFA34pdLU1Mk2NDKAr/tlRoeJWVTDXYbWN5ulAf3zljA+
         iTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=evL+cL1zIXxUOEc73t8qN29EBvw/0BYeyTuo8tg+3zM=;
        fh=r9N72Dyb9PCwxI0x4DwLhOjMuOP/caluBIt3nUZfj3M=;
        b=I6tT0asbzgc9lPGobUinG9JEqGJ7m5qRg/vuVKnqMS8IvB1PiaakzxPd9YL87QXOqc
         pnxh1ACJZFGuBLdHaKwq1VFrxCws9wQFopiUZkUfyIBlfmisuXYUyAdrM+u3kUoT1/4j
         P7A+2fmEVgYt60sFoi4Zn/En4XVoMfwf8Rxo3kTBI2bYGyaveDfMiKTNKmsM2+vNyLbn
         EAWba2lqH/v3u0o45T+a4rDc0SWKtyT3nh4DmpVHN7n8v5jIb02AhLdHO3ePsWRrhiQH
         XD4UXUeVZUxjRpcIZpwVLQmG1mkCLXuwjZP08eXqgcThpgbR0P1Iecg13qNjHKj+ZEaj
         L7hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=n6WRp1Rf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1786b141si5973451cf.160.2024.09.18.16.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 16:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=n6WRp1Rf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr4TG-0002M5-96; Wed, 18 Sep 2024 19:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1sr4TE-0002GW-FS
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 19:52:28 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1sr4TC-0002LN-5N
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 19:52:28 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5e56759e6d7so184333eaf.3
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 16:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1726703545; x=1727308345;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=evL+cL1zIXxUOEc73t8qN29EBvw/0BYeyTuo8tg+3zM=;
 b=n6WRp1RfoGNImpWiwTBnXIsuC9WoBIA23jocwgDJE+aEobdU87Y3KNgysOSJBB7wo0
 i0XoTk6o/LO6r54FcKYwkWAIDSDLnuHRcCbeE/AlrFAFuz/WAxhTuRo/2BoQ+buN89op
 q4RpfTw5NVi4TrBnWz708lJ9z8ZEb94fE5iOLVB7vXWlkAkuCww9a9uQn6VAZFqrtjuC
 yQd5QNmUT3GHNc8Hs9emY17+qHkHRJFKbalZc4H4L3n3cbih3P5Sd7wNwGg8MxT6niC1
 NEEz4SFthVA3HdNfGDyI8JlnZe+63/rlYjG/kdMro8s3yYFeq5MdDe9YSzM9RQBM8gL9
 taRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726703545; x=1727308345;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=evL+cL1zIXxUOEc73t8qN29EBvw/0BYeyTuo8tg+3zM=;
 b=KCcwg24eEY1h5dOkI8Od0wNlRLUMDGWIy2o+0V1ZeQEGeGrQKs3E3tb0ZGZn7BLRe9
 ZtVONpg4mUhUvQ67hjxJPgjI8MpUyyl3k+36ylNP1nQETUThfJwfaJee5152NiTSdTh9
 qJhfmCOB+YTxgiBzIG6hK+hkrjw1ivTqahTWxZMDggkZ7Tam31avx7pT01gSfB9a7DBf
 xp0fE7OZU6629o3D+khEEBZZFWNAvdf011Tmzx83W/vovm2Wf0XBWnknZ/OP6BQ06diM
 oStsR0kvQc8hSu8J5u7ZweY4fawMNGEW1OhTDRaT3Dh/5d0j+lyAkROY5hcIONCC2mpU
 oWeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5wgHcl7QPtNSS+rDXR3s4sCkBBrdaXJDfc2TzsSskHfivo5INzZtryZceMg9DBrhtztiAt87fmQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx4YCaxx/eyDeZlc++OlKqlaKTdeEW0pW9A0DdXvUAw77aySz/h
 seJ+85ZCIEW+ETl7M5UnMLP7nhZmBKXFLya4X6eWqc/WKL5vLa+G3I1f/JIl1/8=
X-Received: by 2002:a05:6808:1405:b0:3d9:35df:8f2 with SMTP id
 5614622812f47-3e071ac5783mr12814631b6e.28.1726703544699; 
 Wed, 18 Sep 2024 16:52:24 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:bfe4:2aee:929f:be5])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e26b73c931sm120451b6e.44.2024.09.18.16.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 16:52:23 -0700 (PDT)
Date: Wed, 18 Sep 2024 18:52:17 -0500
From: Corey Minyard <corey@minyard.net>
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr,
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org,
 jsnow@redhat.com, crosa@redhat.com, lvivier@redhat.com
Subject: Re: [PATCH 19/25] hw/misc: add i2c-tester
Message-ID: <ZutnsQIEQNo9icnX@mail.minyard.net>
References: <20240918192254.3136903-1-tavip@google.com>
 <20240918192254.3136903-20-tavip@google.com>
 <Zusypeay8cjjPTn0@mail.minyard.net>
 <CAGWr4cQapNbGZteQYAFYrgDnh3cY0xHnEtAiDW0zuURwZr_V3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGWr4cQapNbGZteQYAFYrgDnh3cY0xHnEtAiDW0zuURwZr_V3g@mail.gmail.com>
Received-SPF: none client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=corey@minyard.net; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: corey@minyard.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EJLm/AhboV0D

On Wed, Sep 18, 2024 at 04:03:12PM -0700, Octavian Purdila wrote:
> On Wed, Sep 18, 2024 at 1:06 PM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Wed, Sep 18, 2024 at 12:22:47PM -0700, Octavian Purdila wrote:
> > > Add a simple i2c peripheral to be used for testing I2C device
> > > models. The peripheral has a fixed number of registers that can be
> > > read and written.
> >
> > Why is this better than just using the eeprom device?
> >
> 
> The main reason for adding it is that, AFAICT, there is no i2c slave
> device that responds with I2C_NACK during a transaction.
> 
> Also, having a dedicated device for testing purposes makes it easier
> to add new features than adding it to a real device where it might not
> always be possible. I tried to add the NACK functionality but I did
> not find one where the datasheet would confirm the behaviour I was
> looking for.

SMBUS devices (like the eeprom) use NACKs as part of the protocol, to
mark the end of a transfer, but that's probably not what you are looking
for.  You are using it to signal an error, which I don't think any
existing device will do.  Real devices, in general, don't NACK anything
for errors, but the protocol allows it.

Somehow in my previous look I completely missed i2c_tester_event(), so
this works like a normal I2C device, except that most of them
auto-increment the index register.  But some don't, so it's fine.

If you could document the rationale for this, it would help a lot, for
others that might want to use it.  Also, I would expect people might
add their own test code to this.  I'm not sure what you can do at the
moment about that, but just a heads up that people will probably hack on
this in the future.

So this is good.

-corey

> 
> > This has some uncommon attributes compared to most i2c devices.  For
> > instance, most i2c devices take their address as the first bytes of a
> > write operation, then auto-increment after that for reads and writes.
> > This seems to take one address on a write after a system reset, then use
> > that forever.
> >
> > Anyway, unless there is a compelling reason to use this over the eeprom
> > device, I'm going to recommend against it.
> >
> 
> 
> > -corey
> >
> > >
> > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > > ---
> > >  include/hw/misc/i2c_tester.h |  30 ++++++++++
> > >  hw/misc/i2c_tester.c         | 109 +++++++++++++++++++++++++++++++++++
> > >  hw/misc/Kconfig              |   5 ++
> > >  hw/misc/meson.build          |   2 +
> > >  4 files changed, 146 insertions(+)
> > >  create mode 100644 include/hw/misc/i2c_tester.h
> > >  create mode 100644 hw/misc/i2c_tester.c
> > >
> > > diff --git a/include/hw/misc/i2c_tester.h b/include/hw/misc/i2c_tester.h
> > > new file mode 100644
> > > index 0000000000..f6b6491008
> > > --- /dev/null
> > > +++ b/include/hw/misc/i2c_tester.h
> > > @@ -0,0 +1,30 @@
> > > +/*
> > > + *
> > > + * Copyright (c) 2024 Google LLC
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#ifndef HW_I2C_TESTER_H
> > > +#define HW_I2C_TESTER_H
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "hw/i2c/i2c.h"
> > > +#include "hw/irq.h"
> > > +
> > > +#define I2C_TESTER_NUM_REGS    0x31
> > > +
> > > +#define TYPE_I2C_TESTER "i2c-tester"
> > > +#define I2C_TESTER(obj) OBJECT_CHECK(I2cTesterState, (obj), TYPE_I2C_TESTER)
> > > +
> > > +typedef struct {
> > > +    I2CSlave i2c;
> > > +    bool set_reg_idx;
> > > +    uint8_t reg_idx;
> > > +    uint8_t regs[I2C_TESTER_NUM_REGS];
> > > +} I2cTesterState;
> > > +
> > > +#endif /* HW_I2C_TESTER_H */
> > > diff --git a/hw/misc/i2c_tester.c b/hw/misc/i2c_tester.c
> > > new file mode 100644
> > > index 0000000000..77ce8bf91a
> > > --- /dev/null
> > > +++ b/hw/misc/i2c_tester.c
> > > @@ -0,0 +1,109 @@
> > > +/*
> > > + * Simple I2C peripheral for testing I2C device models.
> > > + *
> > > + * Copyright (c) 2024 Google LLC
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "hw/misc/i2c_tester.h"
> > > +
> > > +#include "qemu/log.h"
> > > +#include "qemu/module.h"
> > > +#include "migration/vmstate.h"
> > > +
> > > +static void i2c_tester_reset_enter(Object *o, ResetType type)
> > > +{
> > > +    I2cTesterState *s = I2C_TESTER(o);
> > > +
> > > +    s->set_reg_idx = false;
> > > +    s->reg_idx     = 0;
> > > +    memset(s->regs, 0, I2C_TESTER_NUM_REGS);
> > > +}
> > > +
> > > +static int i2c_tester_event(I2CSlave *i2c, enum i2c_event event)
> > > +{
> > > +    I2cTesterState *s = I2C_TESTER(i2c);
> > > +
> > > +    if (event == I2C_START_SEND) {
> > > +        s->set_reg_idx = true;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static uint8_t i2c_tester_rx(I2CSlave *i2c)
> > > +{
> > > +    I2cTesterState *s = I2C_TESTER(i2c);
> > > +
> > > +    if (s->reg_idx >= I2C_TESTER_NUM_REGS) {
> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __func__,
> > > +                      s->reg_idx);
> > > +        return I2C_NACK;
> > > +    }
> > > +
> > > +    return s->regs[s->reg_idx];
> > > +}
> > > +
> > > +static int i2c_tester_tx(I2CSlave *i2c, uint8_t data)
> > > +{
> > > +    I2cTesterState *s = I2C_TESTER(i2c);
> > > +
> > > +    if (s->set_reg_idx) {
> > > +        /* Setting the register in which the operation will be done. */
> > > +        s->reg_idx = data;
> > > +        s->set_reg_idx = false;
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (s->reg_idx >= I2C_TESTER_NUM_REGS) {
> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __func__,
> > > +                      s->reg_idx);
> > > +        return I2C_NACK;
> > > +    }
> > > +
> > > +    /* Write reg data. */
> > > +    s->regs[s->reg_idx] = data;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static const VMStateDescription vmstate_i2c_tester = {
> > > +    .name = "i2c-tester",
> > > +    .version_id = 1,
> > > +    .minimum_version_id = 1,
> > > +    .fields = (const VMStateField[]) {
> > > +        VMSTATE_I2C_SLAVE(i2c, I2cTesterState),
> > > +        VMSTATE_BOOL(set_reg_idx, I2cTesterState),
> > > +        VMSTATE_UINT8(reg_idx, I2cTesterState),
> > > +        VMSTATE_UINT8_ARRAY(regs, I2cTesterState, I2C_TESTER_NUM_REGS),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
> > > +
> > > +static void i2c_tester_class_init(ObjectClass *oc, void *data)
> > > +{
> > > +    DeviceClass *dc = DEVICE_CLASS(oc);
> > > +    ResettableClass *rc = RESETTABLE_CLASS(oc);
> > > +    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
> > > +
> > > +    rc->phases.enter = i2c_tester_reset_enter;
> > > +    dc->vmsd = &vmstate_i2c_tester;
> > > +    isc->event = i2c_tester_event;
> > > +    isc->recv = i2c_tester_rx;
> > > +    isc->send = i2c_tester_tx;
> > > +}
> > > +
> > > +static const TypeInfo i2c_tester_types[] = {
> > > +    {
> > > +        .name = TYPE_I2C_TESTER,
> > > +        .parent = TYPE_I2C_SLAVE,
> > > +        .instance_size = sizeof(I2cTesterState),
> > > +        .class_init = i2c_tester_class_init
> > > +    },
> > > +};
> > > +
> > > +DEFINE_TYPES(i2c_tester_types);
> > > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > > index 4b688aead2..3e93c12c8e 100644
> > > --- a/hw/misc/Kconfig
> > > +++ b/hw/misc/Kconfig
> > > @@ -213,6 +213,11 @@ config IOSB
> > >  config XLNX_VERSAL_TRNG
> > >      bool
> > >
> > > +config I2C_TESTER
> > > +    bool
> > > +    default y if TEST_DEVICES
> > > +    depends on I2C
> > > +
> > >  config FLEXCOMM
> > >      bool
> > >      select I2C
> > > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > > index faaf2671ba..4f22231fa3 100644
> > > --- a/hw/misc/meson.build
> > > +++ b/hw/misc/meson.build
> > > @@ -158,6 +158,8 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
> > >  # HPPA devices
> > >  system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
> > >
> > > +system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'))
> > > +
> > >  system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
> > >  system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
> > >  system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstctl.c'))
> > > --
> > > 2.46.0.662.g92d0881bb0-goog
> > >
> > >
