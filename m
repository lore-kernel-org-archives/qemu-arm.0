Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp972528njb;
        Fri, 20 Sep 2024 11:10:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8G3UdTZj3s/lSK3hZ2CKrZzM5bmZreIyTZwYeNNUIDnExv6C1/DMnVpz5W5cfkcm7curekilAYWg8nQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGulaCBdVlDN8DK9IGiZc106Frl4VX0vyzgpijWyQMPiRLAi6Mrkf9yX7Q6cn7wS8FSLLu5
X-Received: by 2002:a05:6214:3a09:b0:6c5:681e:1d4 with SMTP id 6a1803df08f44-6c7bc80d1bcmr51710496d6.34.1726855800856;
        Fri, 20 Sep 2024 11:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726855800; cv=none;
        d=google.com; s=arc-20240605;
        b=gLVJ6K1NczWpyoTF8+PkrDdKV4OpzQkZglh5YNEyt09lVSQAeqZdXIRNWA3T97Ud/i
         TolbVehlzYyROjB89RbM++vL0zJEVIMrpQAaFcVz7yE8uWG1iJRoBwi/Rny9N86PnB2n
         Tp0lRii7Y0OG17fv3hUf62SktLRq/eYgL4JZTz9FJBMvSlP633kmjM0i0OWNqTWUn6YG
         xMmxcKocOjGxtx/N5WDfkN4ykUvybUohjgWEvLoUEli4GSJtHtYAbfwHFtxWik2jzRGo
         UJRzDpiG3lm14QPxtqs5Cp28PuFgkkpUGafn4saQ+grvDXtp7fhGaP381F6o6ZJru9a7
         HBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LacxQpJuK2J3AiMcw1FAtS734utUTVehtpy/NRIDDsY=;
        fh=frB+xFuNbR2/VnVoIIhfpWKnckd4bsyqMOqGh91386k=;
        b=gn0OdlJ/JmURAPxo6LxzBENTjZ2tXwIarAl+spGqZZJhxj4fmYPKHICAu73bO6B6Nd
         QjcFZ0gMqltXFmp306jM3RY7BiwF+4uDFfF5FE3egu5N2Pl8TPS5TRf1NNgHqDlE72hJ
         NODqonkx8ZJDMZkwDSVdHa5Mbu1jx36D02ew52T+Jq4BCyYSWhuXIEUSGNvGkGjnIeaQ
         CaFAkF1kEXScjyrqyAPYJRyyBje6RKOYbNTcDkChO9H7mwhfWFmsThLewjJzcSTFJpEc
         kAn7WEwsTIJjfzUxSieX4CnPV0J8tOuI7Q5mKT6TiA5SW/Cd56VXfhEgB2Hk2QKsqIOy
         2MYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=bRDE6u6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e5abc38si47011476d6.538.2024.09.20.11.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 11:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=bRDE6u6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sri4h-0003Wi-RZ; Fri, 20 Sep 2024 14:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1sri4g-0003SL-6R
 for qemu-arm@nongnu.org; Fri, 20 Sep 2024 14:09:46 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1sri4a-0003NG-OM
 for qemu-arm@nongnu.org; Fri, 20 Sep 2024 14:09:45 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso2821364e87.2
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2024 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1726855778; x=1727460578;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LacxQpJuK2J3AiMcw1FAtS734utUTVehtpy/NRIDDsY=;
 b=bRDE6u6T12WLu5hD8bNehpLgmJInQtQCab66pyLAAkhE7d90qpIBdhV4boKBbW1RXo
 me/kmdSfFiTzW0xokeptDzI1eKZfsLK2WqPVKew/MmWX5zcxHPEaWJKWhPLYXd4E0sF8
 UYGW2vl082V2j8NM2rzUt7QMlRd5+4a/QiBHxh/fM9n+9QOiHbmW6b0KbR1BKituk6JA
 QCQr5eOhWVCpV14SQF1TVoKKMIK1/zqwgU9hhgrZri6SvPjef17/IKdBOw2hIs0236d0
 QgEeOEYB7ocuthX7jqneG/y4KpkA0u0j+ClrpsBeTWlYvzTAw/ivJ1t7BkbQk7sLT45B
 9ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726855778; x=1727460578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LacxQpJuK2J3AiMcw1FAtS734utUTVehtpy/NRIDDsY=;
 b=uvqWpkJB9IOA/U0hjVQTAcHZF4YcddG3uCDvWXOhba0qLanz/RHBbkLcTbufy8BhCO
 hNfUm1V59e7EIq1iMTFgFAGcRCny9QOl4Lw7oBrS7WkNSCUvVojsXcpQ6rS/tMzM0yHu
 ttQfqF5OCDyzdHe5Cm6NymDnHd3eI/Yqus90x6DFZZ2tl1dQyWO6H8QoPysxyT512D6g
 O3rPUX9ip0Yq+d6QnMi1gAPL7EzXfxKtvETJQCDJmVdU0c8pRTI7nQAz8m2ivtzQ3P24
 DdYqWT3sngTn7qqFhwl4sbeTlE+DChjXPlzqFlY28xp8RhAEPgBnPQb5vyN9UScCbfeI
 8/FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD8a7uLHCqWzVT/vtQS23+gELlxB9gCAZvORULNw6q7HCi/KtHzxXEFv4YJLksfDBzmvWt9BtkaQ==@nongnu.org
X-Gm-Message-State: AOJu0YyXpV61WY3vp1aHofGsA6Qd4iE4Rdf3GPirswMHIs0S9S6lbHjU
 4+FUKW2uKqmA6ELhD3s59+hPVj30uxUVEy8Ml8IvBs9KaKVa3NJfnIFCw3g6iXT/CUMElXxcSaq
 hBYEDC+fIofmBGOXKBtQttP7tHuNI5M1f8rjDbA==
X-Received: by 2002:a05:6512:6c9:b0:534:543e:1895 with SMTP id
 2adb3069b0e04-536ad3d7205mr2289035e87.39.1726855777687; Fri, 20 Sep 2024
 11:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
 <20240918192254.3136903-9-tavip@google.com>
 <Zus1YzMOZD1ppO-2@mail.minyard.net>
 <CAGWr4cSvq+WnUQO3-8jyasQPhKGQCvzOYqRm5W8vRdhW9iU=xw@mail.gmail.com>
 <ZutGsQglLtK7MtRB@mail.minyard.net>
 <CAFEAcA_ZUkz8xv_PP27nD_eRL18v0cU6A7K+K57b8ML-9pmodQ@mail.gmail.com>
 <CAGWr4cScq6+KQi2aJWtgSUSt+j28wXsxP240FfzTrCAFGRV14g@mail.gmail.com>
In-Reply-To: <CAGWr4cScq6+KQi2aJWtgSUSt+j28wXsxP240FfzTrCAFGRV14g@mail.gmail.com>
From: Corey Minyard <corey@minyard.net>
Date: Fri, 20 Sep 2024 13:09:26 -0500
Message-ID: <CAB9gMfosdyNxRS4N+pt+oHCXoQ2enV7Ot+ws7enuts0XOMUp5g@mail.gmail.com>
Subject: Re: [PATCH 08/25] hw/i2c: add support for flexcomm i2c
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::129;
 envelope-from=corey@minyard.net; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qQCzzeWeJK99

Thanks, this all looks good to me.  And FIELD() is the right way to
go, as Peter said.

-corey

On Fri, Sep 20, 2024 at 1:03=E2=80=AFPM Octavian Purdila <tavip@google.com>=
 wrote:
>
> On Thu, Sep 19, 2024 at 2:36=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Wed, 18 Sept 2024 at 22:31, Corey Minyard <corey@minyard.net> wrote:
> > > Generally it's frowned upon to have a ton of extra stuff that's not
> > > used.  I would think some is ok, like defining bits in registers that
> > > aren't used yet, but I have no idea how all the enums below here
> > > actually tie into anything.  I'm guessing these are just bitmasks int=
o
> > > registers, but really, it's a lot easier to read if you have somethin=
g
> > > like:
> > >
> > > /*
> > >  * The I2C Master function enable. When disabled, the Master
> > >  * configuration settings are not changed, but the Master function is
> > >  * internally reset.
> > >  */
> > > #define FLEXCOMM_I2C_CFG_MSTEN (1 << 4)
> >
> > The FIELD macro already gives you that:
> >   FIELD(FLEXCOMM_I2C_CFG, MSTEN, startbit, len);
> > will define an R_FLEXCOMM_I2C_CFG_MSTEN_MASK (which is
> > (1 << startbit) for the 'len =3D=3D 1' case).
> >
> > You can also set and read a 1 bit field the same as
> > any other, with the FIELD_DP32/FIELD_EX32 macros, so
> > you don't often need to directly use the MASK macro:
> >   s->cfg =3D FIELD_DP32(s->cfg, CFG, MSTEN, 1);
> > and
> >   if (FIELD_EX32(s->cfg, CFG, MSTEN)) {
> >      ...
> >   }
> >
> > The FIELD() macros are a bit unwieldy sometimes but the
> > advantage over ad-hoc #defines is that they're consistent
> > for every field in every register.
> >
> > I agree that providing enums for the possible values for 1-bit
> > fields is a bit superfluous.
> >
>
> I went ahead and removed those 1-bit enum values and added support to
> filter register/fields when generating the code. Also converted the
> enums to defines to make these a little bit more compact as I don't
> think we have any advantage over the enums?
>
> So with the following invocation:
>
>   run_target('svd-flexcomm-i2c', command: svd_gen_header +
>     [ '-i', rt595, '-o', '@SOURCE_ROOT@/include/hw/arm/svd/flexcomm_i2c.h=
',
>       '-p', 'I2C0', '-t', 'FLEXCOMM_I2C',
>       '--fields', 'CFG TIMEOUT:TOMIN MSTCTL MSTDAT
> STAT:MSTPENDING,MSTSTATE INT*:MSTPENDING* SLV*:'])
>
> I am getting the below generated file. Note that the register info is
> generated for all registers because this information is used to
> initialize the reset values, mask writes appropriately in registers
> and trace register access.
>
> Please let me know if this looks good or if there are any other tweaks
> I could make.
>
> /*
>  * Copyright 2016-2023 NXP SPDX-License-Identifier: BSD-3-Clause
>  *
>  * Automatically generated by svd-gen-header.py from MIMXRT595S_cm33.xml
>  */
> #pragma once
>
> #include "hw/register.h"
>
> /* I2C Bus Interface */
> #define FLEXCOMM_I2C_REGS_NO (1024)
>
> /* Configuration Register */
> REG32(FLEXCOMM_I2C_CFG, 0x800);
> /* Master Enable */
> FIELD(FLEXCOMM_I2C_CFG, MSTEN, 0, 1);
> /* Slave Enable */
> FIELD(FLEXCOMM_I2C_CFG, SLVEN, 1, 1);
> /* Monitor Enable */
> FIELD(FLEXCOMM_I2C_CFG, MONEN, 2, 1);
> /* I2C bus Time-out Enable */
> FIELD(FLEXCOMM_I2C_CFG, TIMEOUTEN, 3, 1);
> /* Monitor function Clock Stretching */
> FIELD(FLEXCOMM_I2C_CFG, MONCLKSTR, 4, 1);
> /* High Speed mode Capable enable */
> FIELD(FLEXCOMM_I2C_CFG, HSCAPABLE, 5, 1);
>
> /* Status Register */
> REG32(FLEXCOMM_I2C_STAT, 0x804);
> /* Master Pending */
> FIELD(FLEXCOMM_I2C_STAT, MSTPENDING, 0, 1);
> /* Master State code */
> FIELD(FLEXCOMM_I2C_STAT, MSTSTATE, 1, 3);
> /* Idle. The Master function is available to be used for a new transactio=
n. */
> #define FLEXCOMM_I2C_STAT_MSTSTATE_IDLE 0
> /*
>  * Receive ready. Received data is available (in Master Receiver mode). A=
ddress
>  * plus Read was previously sent and Acknowledged by a slave.
>  */
> #define FLEXCOMM_I2C_STAT_MSTSTATE_RECEIVE_READY 1
> /*
>  * Transmit ready. Data can be transmitted (in Master Transmitter mode).
>  * Address plus Write was previously sent and Acknowledged by a slave.
>  */
> #define FLEXCOMM_I2C_STAT_MSTSTATE_TRANSMIT_READY 2
> /* NACK Address. Slave NACKed address. */
> #define FLEXCOMM_I2C_STAT_MSTSTATE_NACK_ADDRESS 3
> /* NACK Data. Slave NACKed transmitted data. */
> #define FLEXCOMM_I2C_STAT_MSTSTATE_NACK_DATA 4
>
> /* Interrupt Enable Set Register */
> REG32(FLEXCOMM_I2C_INTENSET, 0x808);
> /* Master Pending interrupt Enable */
> FIELD(FLEXCOMM_I2C_INTENSET, MSTPENDINGEN, 0, 1);
>
> /* Interrupt Enable Clear Register */
> REG32(FLEXCOMM_I2C_INTENCLR, 0x80C);
> /* Master Pending interrupt clear */
> FIELD(FLEXCOMM_I2C_INTENCLR, MSTPENDINGCLR, 0, 1);
>
> /* Time-out Register */
> REG32(FLEXCOMM_I2C_TIMEOUT, 0x810);
> /* Time-out time value, the bottom 4 bits */
> FIELD(FLEXCOMM_I2C_TIMEOUT, TOMIN, 0, 4);
>
> /* Interrupt Status Register */
> REG32(FLEXCOMM_I2C_INTSTAT, 0x818);
> /* Master Pending */
> FIELD(FLEXCOMM_I2C_INTSTAT, MSTPENDING, 0, 1);
>
> /* Master Control Register */
> REG32(FLEXCOMM_I2C_MSTCTL, 0x820);
> /* Master Continue(write-only) */
> FIELD(FLEXCOMM_I2C_MSTCTL, MSTCONTINUE, 0, 1);
> /* Master Start control(write-only) */
> FIELD(FLEXCOMM_I2C_MSTCTL, MSTSTART, 1, 1);
> /* Master Stop control(write-only) */
> FIELD(FLEXCOMM_I2C_MSTCTL, MSTSTOP, 2, 1);
> /* Master DMA enable */
> FIELD(FLEXCOMM_I2C_MSTCTL, MSTDMA, 3, 1);
>
> /* Master Data Register */
> REG32(FLEXCOMM_I2C_MSTDAT, 0x828);
> /* Master function data register */
> FIELD(FLEXCOMM_I2C_MSTDAT, DATA, 0, 8);
>
> /* Slave Control Register */
> REG32(FLEXCOMM_I2C_SLVCTL, 0x840);
>
> /* Slave Data Register */
> REG32(FLEXCOMM_I2C_SLVDAT, 0x844);
>
> /* Slave Address Register */
> REG32(FLEXCOMM_I2C_SLVADR0, 0x848);
>
> /* Slave Address Register */
> REG32(FLEXCOMM_I2C_SLVADR1, 0x84C);
>
> /* Slave Address Register */
> REG32(FLEXCOMM_I2C_SLVADR2, 0x850);
>
> /* Slave Address Register */
> REG32(FLEXCOMM_I2C_SLVADR3, 0x854);
>
> /* Slave Qualification for Address 0 Register */
> REG32(FLEXCOMM_I2C_SLVQUAL0, 0x858);
>
>
> #define FLEXCOMM_I2C_REGISTER_ACCESS_INFO_ARRAY(_name) \
>     struct RegisterAccessInfo _name[FLEXCOMM_I2C_REGS_NO] =3D { \
>         [0 ... FLEXCOMM_I2C_REGS_NO - 1] =3D { \
>             .name =3D "", \
>             .addr =3D -1, \
>         }, \
>         [0x200] =3D { \
>             .name =3D "CFG", \
>             .addr =3D 0x800, \
>             .ro =3D 0xFFFFFFC0, \
>             .reset =3D 0x0, \
>         }, \
>         [0x201] =3D { \
>             .name =3D "STAT", \
>             .addr =3D 0x804, \
>             .ro =3D 0xFCF57FAF, \
>             .reset =3D 0x801, \
>         }, \
>         [0x202] =3D { \
>             .name =3D "INTENSET", \
>             .addr =3D 0x808, \
>             .ro =3D 0xFCF476AE, \
>             .reset =3D 0x0, \
>         }, \
>         [0x203] =3D { \
>             .name =3D "INTENCLR", \
>             .addr =3D 0x80C, \
>             .ro =3D 0xFCF476AE, \
>             .reset =3D 0x0, \
>         }, \
>         [0x204] =3D { \
>             .name =3D "TIMEOUT", \
>             .addr =3D 0x810, \
>             .ro =3D 0xFFFF0000, \
>             .reset =3D 0xFFFF, \
>         }, \
>         [0x205] =3D { \
>             .name =3D "CLKDIV", \
>             .addr =3D 0x814, \
>             .ro =3D 0xFFFF0000, \
>             .reset =3D 0x0, \
>         }, \
>         [0x206] =3D { \
>             .name =3D "INTSTAT", \
>             .addr =3D 0x818, \
>             .ro =3D 0xFFFFFFFF, \
>             .reset =3D 0x801, \
>         }, \
>         [0x208] =3D { \
>             .name =3D "MSTCTL", \
>             .addr =3D 0x820, \
>             .ro =3D 0xFFFFFFF0, \
>             .reset =3D 0x0, \
>         }, \
>         [0x209] =3D { \
>             .name =3D "MSTTIME", \
>             .addr =3D 0x824, \
>             .ro =3D 0xFFFFFF88, \
>             .reset =3D 0x77, \
>         }, \
>         [0x20A] =3D { \
>             .name =3D "MSTDAT", \
>             .addr =3D 0x828, \
>             .ro =3D 0xFFFFFF00, \
>             .reset =3D 0x0, \
>         }, \
>         [0x210] =3D { \
>             .name =3D "SLVCTL", \
>             .addr =3D 0x840, \
>             .ro =3D 0xFFFFFCF4, \
>             .reset =3D 0x0, \
>         }, \
>         [0x211] =3D { \
>             .name =3D "SLVDAT", \
>             .addr =3D 0x844, \
>             .ro =3D 0xFFFFFF00, \
>             .reset =3D 0x0, \
>         }, \
>         [0x212] =3D { \
>             .name =3D "SLVADR0", \
>             .addr =3D 0x848, \
>             .ro =3D 0xFFFF7F00, \
>             .reset =3D 0x1, \
>         }, \
>         [0x213] =3D { \
>             .name =3D "SLVADR1", \
>             .addr =3D 0x84C, \
>             .ro =3D 0xFFFF7F00, \
>             .reset =3D 0x1, \
>         }, \
>         [0x214] =3D { \
>             .name =3D "SLVADR2", \
>             .addr =3D 0x850, \
>             .ro =3D 0xFFFF7F00, \
>             .reset =3D 0x1, \
>         }, \
>         [0x215] =3D { \
>             .name =3D "SLVADR3", \
>             .addr =3D 0x854, \
>             .ro =3D 0xFFFF7F00, \
>             .reset =3D 0x1, \
>         }, \
>         [0x216] =3D { \
>             .name =3D "SLVQUAL0", \
>             .addr =3D 0x858, \
>             .ro =3D 0xFFFFFF00, \
>             .reset =3D 0x0, \
>         }, \
>         [0x220] =3D { \
>             .name =3D "MONRXDAT", \
>             .addr =3D 0x880, \
>             .ro =3D 0xFFFFFFFF, \
>             .reset =3D 0x0, \
>         }, \
>         [0x3FF] =3D { \
>             .name =3D "ID", \
>             .addr =3D 0xFFC, \
>             .ro =3D 0xFFFFFFFF, \
>             .reset =3D 0xE0301300, \
>         }, \
>     }
