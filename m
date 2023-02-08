Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp77103ejb;
        Wed, 8 Feb 2023 14:40:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8YpbfRks3Ip0jiOyhehFUE7xXZoxs7cnAjZ0QZeiVVz/vuMB12fTsZzNWREvKy0PPNXsvl
X-Received: by 2002:a05:622a:1047:b0:3b8:68df:fc75 with SMTP id f7-20020a05622a104700b003b868dffc75mr16585022qte.31.1675896033824;
        Wed, 08 Feb 2023 14:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675896033; cv=none;
        d=google.com; s=arc-20160816;
        b=e9/hpdwV4w0Yyi2QfzOyvPqsq6hzPsTRPZKYGMrB042uH0zKpOynjuGXAbEGO6t4+h
         Te9dEQjlam2dYJR7X20+mjbn7mBult0u+mvWOBvSlyhUJ0hYytVmDpo+JNQtoqa3Qn+D
         w0sM8KVKz8NchWykVBhrJ3c3dzKfmU+aqdhzrfjbtgp/R6UisbkeD/07XEAikzmvQCv9
         cIFfgIActHrbcSlIzk1HEY2wg4D7Nc5ljeYGHiSqaTYcSHmpX8RBqs0Ov+HE3yoB6U8H
         tUJ8CFG8TykqARLvqdrPbIL6/XyqTUjkuA6qv4WEbK6JcNthEh+niKiQybAnmIlTDssw
         eYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aX3QGVpjjZv9v5vvRb11j0eFEHT2YcamYu+zEmxeIfU=;
        b=X5trmZsvVJQFLTAn8Ip0VGqP89g/Yr0LwsZ4S+oUNfTZqLYfL49iN/p8iX9S6kSPAT
         +Akvid615IW1yrrE1d/iAYNaMZqoGW3PJDdJLGOxyMaNy8He8c8g68O2Xgz5WMpry/Bz
         czl8gqljkm9Zhzdj/scmLDHZ48PHfMz9zdrZLZWkArw8RJdtZWyZ9gId/5QsTmqP0CFN
         Xq2ciShR9lqUFfpajyTzYzwQ1H4VgfScnKwzvftFe3S9J9znlcn87KJdofFHjy/ZihoB
         4YmO+w+Kso0i0FzRkC1HaBC4gKJLWEeUjXZEU7oCJfZLUC1KU5Ob8qTH5xCT4M/1jG8U
         0OAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=OW3IGl2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132-20020a370b8a000000b00733ff0a19efsi34733qkl.677.2023.02.08.14.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=OW3IGl2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPt76-0004ki-1U; Wed, 08 Feb 2023 17:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt74-0004jN-J3
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt72-0001gI-JD
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id bu23so44233wrb.8
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aX3QGVpjjZv9v5vvRb11j0eFEHT2YcamYu+zEmxeIfU=;
 b=OW3IGl2QlWmFHJcv/cYfo0gHbNRzR3JoCWc+dI5vQ3O/Tb8NaZ4l7jADWXCdl7FfFG
 QgytSSZOLYmBPxOdvg9unRoGGSfSy3Xff5gvEWCOSxWOPSzpdVeiY8URjgQFqF6un8Fg
 og3uvuTC+ahsXi76j9ahzYIy32pxfLhL8HEQdPKa6WTvYxcqa2aNR76g/8kqz1btDKYF
 qj9metQXlc682zG07YJ0RYpo/6MfLsHAEuZb34AztRdwW1JqOuRNxnmaQDVOmAArjH8l
 z2rbKW3FA0Fw2rWRC6TTg9rzWIgUPjttaKdz0Rl/A8tXP9g0hxrE0Rdh1dQTxAUtbf7C
 KZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aX3QGVpjjZv9v5vvRb11j0eFEHT2YcamYu+zEmxeIfU=;
 b=GchZYoplRl9nWwoBehdAI+aOUuyV+Vnd2tT89dZPEc2kkCQfPA4jWqxJnPFfYhGGe9
 KIvOf/DsrTelI1FduwcJYM/flh2lOk/Nf5HsBfEwYb8lFU/Hr846feDJWXtMa0GY5hP/
 gT3O/jyknv36qcNW6Eng6GL10ZwW8QahAdAnFpdJoAh3UOa8aCKxsWbWT4zZqev1S59l
 BXP/AV0hXCqgW1YV72IX/GVbIinep7mEmMk6PMDLMHF2IwF36wksQpMYk86wGD8BSN4I
 l6hEW0OC3lrGJCoAdjy4cSZPym5j7WqnOc7Y5UtEcVyZsXpOSDFsdNRQuQl3X8bKbY7l
 eoiQ==
X-Gm-Message-State: AO0yUKXOcJ2bpsW7+6fVIHmGWw4Mogob0y6DAVuyra/H6b4U3WPcriXo
 pcEY+1ifcTTjVcrKi1on5Vik7edkX629JAi0n7vCUA==
X-Received: by 2002:adf:f287:0:b0:2c3:f119:66b4 with SMTP id
 k7-20020adff287000000b002c3f11966b4mr423341wro.615.1675896021911; Wed, 08 Feb
 2023 14:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <CACPK8Xc=w9n-Q-K7iJQF8QSSzSW1e1S=dfuqrQvRp=SOCwQfHw@mail.gmail.com>
In-Reply-To: <CACPK8Xc=w9n-Q-K7iJQF8QSSzSW1e1S=dfuqrQvRp=SOCwQfHw@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 8 Feb 2023 14:40:00 -0800
Message-ID: <CAMvPwGqmSF4YDgt6-3W8m_yUDM6O+gcvQNLFQntexZt++R1Ldg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: Joel Stanley <joel@jms.id.au>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=titusr@google.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VHWIermJfR7m

On Mon, 6 Feb 2023 at 19:43, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 6 Feb 2023 at 19:51, Titus Rwantare <titusr@google.com> wrote:
> >
> > This is a simple i2c device that allows i2c capable devices to have
> > GPIOs.
>
> Nice.
>
> In Linux this is supported by a driver called pca953x.  Would it make
> sense to name your model similarly (both the file and the prefixes you
> use)?
>
> If we do that then it looks like other devices from the same family
> could be easily supported. (I'm not suggesting you do that work up
> front)

Thanks to NXP's naming, pca<number> could mean anything, so I opted
for i2c_gpio.
For example, we use pca954{3,6,8} i2c muxes that are entirely unrelated.
Looking at the driver, most of the devices there seem like they would
work with this qemu model. Someone more familiar would need to
validate them.

> >  hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
> >  hw/gpio/trace-events            |   5 +
> >  hw/i2c/Kconfig                  |   4 +
> >  include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
> >  tests/qtest/meson.build         |   1 +
> >  tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
> >  8 files changed, 615 insertions(+)
> >  create mode 100644 hw/gpio/pca_i2c_gpio.c
> >  create mode 100644 include/hw/gpio/pca_i2c_gpio.h
> >  create mode 100644 tests/qtest/pca_i2c_gpio-test.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 2d157de9b8..1b533ddd76 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -418,6 +418,7 @@ config NPCM7XX
> >      select SSI
> >      select UNIMP
> >      select PCA954X
> > +    select PCA_I2C_GPIO
> >
> >  config FSL_IMX25
> >      bool
> > diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> > index b726e6d27a..1e5b602002 100644
> > --- a/hw/gpio/meson.build
> > +++ b/hw/gpio/meson.build
> > @@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
> > +softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true: files('pca_i2c_gpio.c'))
> > diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
> > new file mode 100644
> > index 0000000000..afae497a22
> > --- /dev/null
> > +++ b/hw/gpio/pca_i2c_gpio.c
> > @@ -0,0 +1,362 @@
> > +/*
> > + * NXP PCA I2C GPIO Expanders
> > + *
> > + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
> > + * reset, and configuration registers
> > + *
> > + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
>
> +1
>
> > + *
> > + * Copyright 2023 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * These devices, by default, are configured to input only. The configuration is
> > + * settable through qom/qmp, or i2c.To set some pins as inputs before boot, use
> > + * the following in the board file of the machine:
> > + *      object_property_set_uint(Object *obj, const char *name,
> > + *                               uint64_t value, Error **errp);
> > + * specifying name as "gpio_config" and the value as a bitfield of the inputs
> > + * e.g. for the pca6416, a value of 0xFFF0, sets pins 0-3 as outputs and
> > + * 4-15 as inputs.
> > + * This value can also be set at runtime through qmp externally, or by
> > + * writing to the config register using i2c.
>
> Nice docs. I'm sure someone else will tell you if there's a better
> spot, but I like that you've written this down.

Thanks,
-Titus
