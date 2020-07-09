Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp897357lfm;
        Wed, 8 Jul 2020 17:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxermhwRkzo/yHYeWXUjNYxgH4FZziuEu8YLP5Fpd94TYNB15gEVG3ffKstrYt0vdq/02k0
X-Received: by 2002:a25:a441:: with SMTP id f59mr31525495ybi.412.1594254205632;
        Wed, 08 Jul 2020 17:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594254205; cv=none;
        d=google.com; s=arc-20160816;
        b=h5bHmjhMc/dQfD2K7im4uFStg78NWSwvtjTO3OHt3een+342UluvdIqrLSyOinzDFu
         F0BGk94Kq6Q/BoB/s/5szBiBBuQK9uIZJQGJN2vwYuqkOrozso8sCPA/e5voZ7VIL8+N
         NNWepnWXody5VuNGRQrR97XFJa5sKNIeYVfM/VoMXjC/N+yL68k8u0Q45jk9Z9htvokn
         DG0+87kvWrb9M9tdb+9W45M2O2dG4jxZA215ikzpxp9VFAtgFvHZS0zClatnDHwdwGQX
         rrwR7WbZmmSqcNAt+y3ckLhx4lUKEKWc2hcCwJHBtVNMwDyMaKNU4LRkP+mIeBuUUmYQ
         BzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5Ti6cFxCewPwMoqTLpH2XDVbkKwcEvNBNKBsSM3cnDc=;
        b=hbtGnzC+TG9Batf2TnYn1wHhqttdhkBFLTS+GIkbOJmRHcWiiMZUZhzLa1vK0yCBd3
         2QQ+8BHVox+6o1rXP+764Yhf2YY/CW5AWj4MXHwJ4AwFjV9XJMVglfwPLcPntJs1ZYp4
         bR5tJHZTlZnJyPJrk0XZ1I4MAY7GKG4GYI/WrxGo+sUf0SR5WDyTkU8pWOjd5R+62dsK
         f4mmJSNpbzi2kISKUVmpTWJjOAiNkzZGSmPi3nYxuQNtMQBsuFBWpcSUwSE9gt/GSntv
         KkbfZRFcqD1OorHbBxgHvvXg9HGfDNXCkp5puuZArFwGATioTax5fgEUi++dYQYa0uQ5
         I9Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=E64MPyc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p82si1124009yba.69.2020.07.08.17.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=E64MPyc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtKLV-0008C1-2B
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtKLL-0008BR-Nt
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:23:15 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:35173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtKLJ-0007j3-Pr
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:23:15 -0400
Received: by mail-ua1-x941.google.com with SMTP id b24so181297uak.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Ti6cFxCewPwMoqTLpH2XDVbkKwcEvNBNKBsSM3cnDc=;
 b=E64MPyc+SlIAJF9sGuCz4wyo1n/WNW7s5SgBzb9VP3utwQ/XadFXdqXPSnGnscBwme
 P5XR920PEl87SAycabDnsHYYtesyzlnOqBgmQedF2lwJmv3RebkcqUddSnafiwXo6DdZ
 /2QoNSKJGExjcV55EndDRU/FJ4/NVappxos1M6BwHZuxJmz1WPaHBL749hVdX55aE34z
 heZj3BaY2Fmtq0yxWpB5unp0eq+/fMpgxUmHtWLT1z+AvTw3+zoTXbzkPUcDxO7XEVfr
 VQuBJmQNDF1Df2xXqlUEuXzWmfI3/iiyFWhcPj6X6XWTQf2cnaQlAbfC/Az/cQ5aysm5
 XNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Ti6cFxCewPwMoqTLpH2XDVbkKwcEvNBNKBsSM3cnDc=;
 b=e8vsBrqHn4rUdBImVu/0QLKgM4CMxG6igwoG8sKeHcADUYGpFMpr278iAU0ASdOjM4
 vHdlgpnVq5g2aFsHNnINIBtO2QFx/8b+4IROnZYgX9wmg4drQysQUqeqPSEEgyrL4IP8
 SQ0QmfpnAPeUGBEJMmZ4o1i3QwpZfdr3EzXAtW1AsQIUQduscLxWsc1JWzSCaFtulSVr
 eLPFGYwz1PXG3FYCLaRk6Yr5WGY7CEVVqIxKU5HYQd8RezIYDRVrevQNtNJqMW+4fhAw
 mvwrXMybX6RQ7X8p9zxYF6G/4UK9sPh60ZNncwFFwmlGcb9JGFnokjLG5q2af/SA4VNi
 nsUg==
X-Gm-Message-State: AOAM533xvcHMnQVhnN+s2VCTcECwd9IX+HuMak/HI/wjJoNlBOVnUKO0
 FIt7u0499LqAJRx54UaHBrJ1TOl5+yrQf/HLDDcAAg==
X-Received: by 2002:ab0:4e98:: with SMTP id l24mr12576181uah.15.1594254192420; 
 Wed, 08 Jul 2020 17:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-6-hskinnemoen@google.com>
 <4b7130f2-032c-3067-b2b6-876a2b17b707@amsat.org>
 <2d1e272b-6575-30df-22ff-5d720973951d@amsat.org>
In-Reply-To: <2d1e272b-6575-30df-22ff-5d720973951d@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 8 Jul 2020 17:23:00 -0700
Message-ID: <CAFQmdRZ-fZGD-Zzr6YvRyB7oEaqdek-e6UeCjekW-DnZLOfbrQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x941.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tx/f2ta3fYwf

On Wed, Jul 8, 2020 at 10:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/8/20 7:31 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Havard,
> >
> > On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
> >> The Nuvoton NPCM7xx SoC family are used to implement Baseboard
> >> Management Controllers in servers. While the family includes four SoCs=
,
> >> this patch implements limited support for two of them: NPCM730 (target=
ed
> >> for Data Center applications) and NPCM750 (targeted for Enterprise
> >> applications).
> >>
> >> This patch includes little more than the bare minimum needed to boot a
> >> Linux kernel built with NPCM7xx support in direct-kernel mode:
> >>
> >>   - Two Cortex-A9 CPU cores with built-in periperhals.
> >>   - Global Configuration Registers.
> >>   - Clock Management.
> >>   - 3 Timer Modules with 5 timers each.
> >>   - 4 serial ports.
> >>
> >> The chips themselves have a lot more features, some of which will be
> >> added to the model at a later stage.
> [...]
>
> >> +static void npcm7xx_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    NPCM7xxState *s =3D NPCM7XX(dev);
> >> +    NPCM7xxClass *nc =3D NPCM7XX_GET_CLASS(s);
> >> +    Error *err =3D NULL;
> >> +    int i;
> >> +
> >> +    /* I/O space -- unimplemented unless overridden below. */
> >> +    create_unimplemented_device("npcm7xx.io", NPCM7XX_MMIO_BA, NPCM7X=
X_MMIO_SZ);
> >
> > I still insist this is not the best, but as "The data sheet for these
> > SoCs is not generally available" there is not much I can suggest to
> > improve.
>
> From your other comment I found:
>
> https://github.com/Nuvoton-Israel/bootblock/blob/master/SWC_HAL/Chips/npc=
m750/npcm750.h
>
> In particular:
>
> #define AHB1_BASE_ADDR                  0xF0000000      /* AHB1
> allocation (Including APB allocations)  */
> #define AHB18_BASE_ADDR                 0x80000000      /* AHB18
> allocation  */
> #define AHB3_BASE_ADDR                  0xA0000000      /* AHB3
> allocation  */
> #define XBUSR_BASE_ADDR                 0xC0002000      /* XBUS
> registers  */
> #define AHB14_BASE_ADDR                 0xE0000000      /* AHB14
> Allocation  */
> #define APB14_BASE_ADDR                 0xE0000000      /* APB14
> Allocation  */
> #define VDMX_BASE_ADDR                  0xE0800000      /* VDMX  */
>
> XBUS doesn't seem important.
>
> If SPI flashes aren't connected, returning bus transaction sounds
> correct:
>
> #define SPI0CS0_BASE_ADDR               0x80000000      /* SPI0 direct
> access CS0  */
> #define SPI0CS1_BASE_ADDR               0x88000000      /* SPI0 direct
> access CS1  */
> #define SPI0CS2_BASE_ADDR               0x90000000      /* SPI0 direct
> access CS2  */
> #define SPI0CS3_BASE_ADDR               0x98000000      /* SPI0 direct
> access CS3  */
>
> #define SPI3CS0_BASE_ADDR               0xA0000000      /* SPI3 direct
> access CS0  */
> #define SPI3CS1_BASE_ADDR               0xA8000000      /* SPI3 direct
> access CS1  */
> #define SPI3CS2_BASE_ADDR               0xB0000000      /* SPI3 direct
> access CS2  */
> #define SPI3CS3_BASE_ADDR               0xB8000000      /* SPI3 direct
> access CS3  */
>
> So I'd prefer you use:
>
>   create_unimplemented_device("npcm7xx.AHB1",  0xf0000000, 256 * MiB);
>
> Maybe for the PCI root complex:
>
>   create_unimplemented_device("npcm7xx.AHB14", 0xe0000000, 256 * MiB);
>
> What do you think?

I went ahead and added them all since they are all defined in that
public file. It does make the -d unimp output a lot more helpful.

I'll send v5 tonight. Not sure if I got the DRAM stuff 100% right.
Please let me know what you think.

Havard
