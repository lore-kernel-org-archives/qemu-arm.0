Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp77406ejb;
        Wed, 8 Feb 2023 14:41:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9eZGY5G3PUrTgZrClpinQYHPA+/QwIy/wWddbyf2if3sBFVF9XP+WYz40Fnkidk8mXNmpj
X-Received: by 2002:a05:6214:d06:b0:537:7819:c274 with SMTP id 6-20020a0562140d0600b005377819c274mr5629698qvh.36.1675896061904;
        Wed, 08 Feb 2023 14:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675896061; cv=none;
        d=google.com; s=arc-20160816;
        b=qOQwFSDqrqLvvT6PYKoZ8EeBwqhj8upNeO8bazsNzTqQtbTmh7DWWEdNMhqGJ7f13L
         vPtTwbMw22zMIMI71E2vJVmZxGmZomvgxZ6hOOveJPzFY6cGKeWvJbeqiCjhIZ2LdPxN
         0iir/YoklY+5BUz9VK2tS636tD3rKbs/Kpm5zPSVRPhchUh9D7pFSsuzq3wKJVfVzgV2
         puauLdibccAMPrxmBN6HeBJjNR+ugizj6q2CGSKsoNBQ9iSs2hre5EySpdpUi2SXOKWI
         qVUQ3PJNEWZh7DW4j7q9O94drHGPt4t+c0rjgv/HaHZTIZOW2qvgq//1sBQNnifggL6N
         BxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CBzENvNroXi0WkQO9dnl44AlgHFshY9wwrV8KqBIu2E=;
        b=OwlFDfxutYAXs1Tj8oVvbGslo5dQTOTBTqenGkdxG35g4iKf9zUhZbPCiX8xK93EGP
         liLIdNqcctuhVveNE+G54AVyRxMEZiYY9Ijz+3fDhnrkBzJXtahWBhBeIn04vq99p3qF
         PM9kTds3JlmxH3ulzaaVeSquLQ861+JxdfyOQcNIht+kCc26wBdg4cdmb2F0u04ctslf
         VPlaCq555k5SiYmJ2IAzPoDpmtAfDba4iID2h1VH1AJwWxrkgCFLLwA+89bNVU3+2lI/
         Ukw4mgoYUb8Jdy/8BcwNp8ZPJ0zZm453cZkpvc5mFc4DR/ZiojQwYbiCVp9Jlu3YsCVU
         RM2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="rAwR/Dwl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a0cf241000000b0056bf9b6b0f5si7323624qvl.251.2023.02.08.14.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="rAwR/Dwl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPt7L-0004ok-Tt; Wed, 08 Feb 2023 17:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7K-0004nN-KN
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:42 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7I-0001kz-Ki
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so2650469wma.1
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CBzENvNroXi0WkQO9dnl44AlgHFshY9wwrV8KqBIu2E=;
 b=rAwR/Dwlf7Io0AiVzr5ai60MYJin2pYYglQ0UZOxEgRfoZ4cqQ59UPzlqCBnfqu1xi
 TS/cIej88qMgm3llP1kyUj9fPMyT0SQ6odMqZSx34cKJk8rDfKmym60wxUktlC8sF6hg
 xPAxpD/4pbJkuTJNp26GbK7mFX8yW60wyiXadbhrpXo5UB6C2KwhW9kpv9P7t23Cziep
 3YKDS6XCYaqYbE7lHj3Oed0mo1mTIu0X0++Y5+asU2uolOmg3mS6A1dgGnsDzzV9q+1P
 nwrKxSeereh9jabM9z/Y5tTgCUqiDzCakTl1sMjVUquiU3DuxYaOkSIy6ZBS5QMQGp3N
 LYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CBzENvNroXi0WkQO9dnl44AlgHFshY9wwrV8KqBIu2E=;
 b=XmC+kMl+Q11sbJwEyGEO/GSnrMCsNpPevV5iGRDRLY1WrmBvpk8cVWnVmfuqDQ0aDG
 tCjsRcuf/xIOAi9nj/5hEY4RJF3kiXyRNpJrN1E+luebBI73HOdtY+Lh+bFywxZj0Cfm
 ouRsBNkeEPKvaGeHYy1Burqacg1CCKBSSIRAodlgCE3HlfdboDef+0Xo1gnnyF/VB6MJ
 xQVgDKaXBEhSRDQqApnBajRnzAvgqOeP3R1sQZI7RoUbj1UzPzeA7UhL39iE97wXhVPA
 QrJLptVmEICGlf+/Sg22p61oHZ8dCjsrsHk68aYTyT8rIk5B2txsVbD2ueRCopdyRrk7
 4voA==
X-Gm-Message-State: AO0yUKWibXve9855QWfImfHJe2cg3lQf80j2CuBFSQmzNKShAc342hOx
 Fu+21YzPRyegdRBEMJhzF6T/7BDsNMcXVOOmUM0HWA==
X-Received: by 2002:a05:600c:1c89:b0:3db:2858:db85 with SMTP id
 k9-20020a05600c1c8900b003db2858db85mr361135wms.104.1675896038265; Wed, 08 Feb
 2023 14:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <Y+F+4nt79DPqL5BH@minyard.net>
In-Reply-To: <Y+F+4nt79DPqL5BH@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 8 Feb 2023 14:40:00 -0800
Message-ID: <CAMvPwGoQsTwJap1YBVeDcP_H2ACnZTJy_HMPKs2UOc3Hcyx0Lw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: minyard@acm.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=titusr@google.com; helo=mail-wm1-x330.google.com
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
X-TUID: KglwUAi3SoAu

On Mon, 6 Feb 2023 at 14:27, Corey Minyard <minyard@acm.org> wrote:
>
> On Mon, Feb 06, 2023 at 07:49:34PM +0000, Titus Rwantare wrote:
> > This is a simple i2c device that allows i2c capable devices to have
> > GPIOs.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >  hw/arm/Kconfig                  |   1 +
> >  hw/gpio/meson.build             |   1 +
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
> > + *
> > + * Copyright 2023 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * These devices, by default, are configured to input only. The configuration is
>
> Yout initial email set they are output only by default


Oops, over the course of writing this I changed my mind on what the
default should be.
I've now checked it's all consistent.

>
>
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
> When the real hardware comes up, can it be configured in some way
> before the software access it through I2C?  It seems odd to me that you
> have a qemu configuration for something that wouldn't normally be
> configurable by something at power up time.
>
> Philippe mentioned some things, too, but this looks good to me beyond
> that.
>
> -corey


Right, my intention is to not have an implicit dependency on the default
configuration, I've re-written this section to be less confusing.

Thanks for the review, I've sent v2.

-Titus
