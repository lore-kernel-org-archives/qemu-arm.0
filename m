Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2888953njc;
        Tue, 17 Jun 2025 18:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0TDuG5gyLHwOyc69Z9etwA2A3lKA7eDO4gaLEcEL8tPmqPlvy5jwkE/xwKk8KaZcYSN0eSrv2pfAE4g==@linaro.org
X-Google-Smtp-Source: AGHT+IHZvk6/El28z9/bE6HKErjXa0RMo8jZotuciu9RNSe4MdGGEoxPIS5+Uqftsp/4QQq2bU/A
X-Received: by 2002:ac8:5f8e:0:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a73c5951a3mr263277491cf.31.1750209961060;
        Tue, 17 Jun 2025 18:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750209961; cv=none;
        d=google.com; s=arc-20240605;
        b=K5HwjugAEBMKsyjGn0ZllqbQ0qGQapsguqpwm3WJhblMk3IIG5SP8jgxhLSUvt6C97
         O8zPblycUtkCIDRMbWClSTsMsELFu0Wbxm2ropIg5dQo2EFqCkaeLAo0rNXGIXkoMxlI
         AcFf3r+cb79x3Fv2dp/NiKrWHDF7cyLtlm8q+E2QVAFNjKtCNvTd9pDlcz5ZlRFSCKS1
         9qxFqyhzhWnvHnXwyPqxat6GP7xONpeFxFJmp1canK0bRhzWp+5wOHEjY+MPlFLFsReZ
         KeNpa72JIGKlnO9zT7tRKrUD1WKkpaZdp7umCxHTGnuzpTe73dHH/0xExVCwJAWSfVye
         btGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IcKJlxotYYNzqhm17rsomT0rEkiw74pK5ylA3za2Brc=;
        fh=aaHT7MQyfwgi484CEZUv0GE37UqOEjFI0WT+FdQ8dto=;
        b=fwFE1nmV6niH9cs3HDAmL0CLQGkGtFuuxPnZLclbZAM7u8o6GZK8IjYt0YbbXXjNLY
         hItobt8mYpzhVYHuPXUfsY8SDt+MmhflHZKPmNddWE1iWlyFsZJIYGZ4RHUHGW48tdzT
         Es2lG32F2WtsyaEdCEzIRmaSgbZm5VU4klK+XAF6Sf1VBfoenszUKy3FOEjMYhuEWBJW
         HsEzCfc8Kd4ex+xEne4HFAyYpONT5t1k55nt6VwYBmf5M4a9ZcsKrcmnuVsH88MlsufX
         QnL5BL2qfgx9k+p6NFZ4GsIVIkLU6v4rshJl2OToS1Ph2/lfv/judCe0rlilaZFPi+ek
         hiOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hRKdtrvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d4f7si141831751cf.262.2025.06.17.18.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 18:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hRKdtrvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRhYT-0007R0-Sj; Tue, 17 Jun 2025 21:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1uRhYL-0007Po-4T
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 21:25:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1uRhYG-00051N-VI
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 21:25:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3138e64b3fcso5625190a91.2
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750209917; x=1750814717; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IcKJlxotYYNzqhm17rsomT0rEkiw74pK5ylA3za2Brc=;
 b=hRKdtrvq4/OtKLS9u+PjY2gENLLUr6DL+h/A+ChlQdahVFkQZ91fUWhsafKHg7Sftw
 CbHEOwdp9tbf73RUnjCcOHxM3VT8aJrq+WlRPiIv/eyWRTalsJCeFXNwPPSRdsqBVBK7
 ZMhWclA/0iNPnbyfBKabHZOJOgPk6WnW2WihrbNeCt1zuhSO8cLa6dMQG/Y3MfiTOe3q
 2JueIuXphqWtcuIKLDqpMxsT9yTvw2HsT2KtV/F53yQZvwy28N+atdepzV7zuPE33+vY
 I8cgu5qxfVftQh2bwkke/Pn/fF/VZ+Y6wDaIfmRoFY37VbK0b+N001SdOabcxFO2zzIm
 EezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750209917; x=1750814717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcKJlxotYYNzqhm17rsomT0rEkiw74pK5ylA3za2Brc=;
 b=GfJFUGiCch+FpGe1IqbNBtwfGTSFf5KCOr6tgJFhmLTmH6+XWf5xncNVe4/cHVPxaF
 ECsdbe+DQkn6oje9UbM+MLNOlxJ7A/gP8MntpLtNME1nX1P+ClUzyLZucWOp1ZxrS+FC
 knyugSo1eU4asXZ808pW79WO1lvunGzrfBgkI06/sYf9jDpJvZIp5r+cAELHkLgjgDQo
 uUpwOK7wP+S1013n5EQ6bMTmap9yvbbqIzXt54HLhGExPuCecEWW7VUqEe9+MOVpQsEq
 4K6N+ZP7cvajBvQGhbEPDA0FrCj4zlDvPiKy5jx2Bqhr5VQbFQ7ui6eTwLhm1gy2bt4c
 hVmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4iAympzuFfmWt9qOlqU2WcZn1EV6HjVJug/3KPrgY45sUjGsP8/w4hxiRK8IdpjGmu1j8lL4Fww==@nongnu.org
X-Gm-Message-State: AOJu0YyiqGHiAkzUqvsP5JW+wQLq3SCuagCFTVUWDmxa7Ohp7IMRXjH5
 KnVHpeVG1y73hzCNwXIWoJkrmyP5hrFQMW4U6WEeTfZXlrSR93njBy4LoDNkhOReA/xvyUAbqZk
 6U8szEFHo+AqcRlqN6HkztMHUcgYhI5zjp4hFigFg
X-Gm-Gg: ASbGncukRI94amS+xGE50f/Pdbp4XCH1jDv7eemXBIkuFrGQrgFe2qwpu112at0r+aA
 +2RFuogj13OjzrYo1rKg1npXXFbG6oq/SV7lF2N7uvSV3xz61J9/AF2wehQOOMUjoegW/llDVT6
 Q6TDd4fJO3wER9St4jo7L/OlplHF06zktJQP8BKBgcjEk4UUGLyi9lu0DgE3zLjCHCwSUBNHrO
X-Received: by 2002:a17:90b:1f92:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-313f1ce543dmr21814795a91.24.1750209916647; Tue, 17 Jun 2025
 18:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
 <23deafc7-d832-470b-8d8e-aea0125d756f@kaod.org>
In-Reply-To: <23deafc7-d832-470b-8d8e-aea0125d756f@kaod.org>
From: Joe Komlodi <komlodi@google.com>
Date: Tue, 17 Jun 2025 18:25:04 -0700
X-Gm-Features: AX0GCFvq4VR_hFdnvIwoJysTOSa7grY78aoZUC42NOj6kk5zX4qiTtCwvnI5G2c
Message-ID: <CAGDLtxti58hRfOjtr5RJuQE93+UWMOLhfM+YivwU4UZdgXRJfg@mail.gmail.com>
Subject: Re: [PATCH 00/19] i3c: aspeed: Add I3C support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org, 
 steven_lee@aspeedtech.com, leetroy@gmail.com, jamin_lin@aspeedtech.com, 
 andrew@codeconstruct.com.au, joel@jms.id.au, qemu-arm@nongnu.org, 
 Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=komlodi@google.com; helo=mail-pj1-x1032.google.com
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
X-TUID: 9fU+yMDYODjc

Hi,

On Sun, Jun 15, 2025 at 11:49=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:
>
> Hi
>
> + Jeremy
>
> On 6/13/25 02:03, Joe Komlodi wrote:
> > Hi all,
> >
> > This series adds I3C bus support to QEMU and adds more functionality to=
 the
> > Aspeed I3C controller.
> >
> > This implementation is a basic implementation that introduces IBIs
> > (including hot-join), CCCs, and SDR data transfer. As-is, it doesn't su=
pport
> > multi-controller buses or HDR transfers.
> >
> > First we add the I3C bus and controller model. With that added we exten=
d
> > the functionality of the Aspeed I3C controller so it can do transfers
> > and handle IBIs.
> >
> > Next, we add a mock I3C target. It's intended to be a very simple targe=
t
> > just to verify that I3C is working on the guest. Internally, we've used=
 it
> > on Linux to verify that i3C devices can be probed and can send/receive =
data
> > and IBIs.
> > This target is sort of like an EEPROM, and it can also send IBIs upon
> > reception of a user-defined magic number.>
> > Lastly we add  hotplugging support. The hotplugging doesn't do anything=
 too
> > complicated, it just adds the device attempting to hotplug to the bus. =
It
> > is the device's responsibility to hot-join and go through the DAA proce=
ss
> > to participate on the bus.
> >
> > Thanks,
> > Joe
> >
> > Joe Komlodi (19):
> >    hw/misc/aspeed_i3c: Move to i3c directory
> >    hw/i3c: Add bus support
> >    hw/i3c: Split DesignWare I3C out of Aspeed I3C
> >    hw/i3c/dw-i3c: Add more register fields
> >    hw/i3c/aspeed_i3c: Add more register fields
> >    hw/i3c/dw-i3c: Add more reset values
> >    hw/i3c/aspeed_i3c: Add register RO field masks
> >    hw/i3c/dw-i3c: Add register RO field masks
> >    hw/i3c/dw-i3c: Treat more registers as read-as-zero
> >    hw/i3c/dw-i3c: Use 32 bits on MMIO writes
> >    hw/i3c/dw-i3c: Add IRQ MMIO behavior
> >    hw/i3c/dw-i3c: Add data TX and RX
> >    hw/i3c/dw-i3c: Add IBI handling
> >    hw/i3c/dw-i3c: Add ctrl MMIO handling
> >    hw/i3c/dw-i3c: Add controller resets
> >    hw/i3c/aspeed: Add I3C bus get function
> >    hw/i3c: Add Mock target
> >    hw/arm/aspeed: Build with I3C_DEVICES
> >    hw/i3c: Add hotplug support
> >
> >   hw/Kconfig                            |    1 +
> >   hw/arm/Kconfig                        |    3 +
> >   hw/i3c/Kconfig                        |   15 +
> >   hw/i3c/aspeed_i3c.c                   |  261 ++++
> >   hw/i3c/core.c                         |  669 +++++++++
> >   hw/i3c/dw-i3c.c                       | 1881 ++++++++++++++++++++++++=
+
> >   hw/i3c/meson.build                    |    6 +
> >   hw/i3c/mock-i3c-target.c              |  311 ++++
> >   hw/i3c/trace-events                   |   47 +
> >   hw/i3c/trace.h                        |    2 +
> >   hw/meson.build                        |    1 +
> >   hw/misc/aspeed_i3c.c                  |  383 -----
> >   hw/misc/meson.build                   |    1 -
> >   hw/misc/trace-events                  |    6 -
> >   include/hw/arm/aspeed_soc.h           |    2 +-
> >   include/hw/{misc =3D> i3c}/aspeed_i3c.h |   22 +-
> >   include/hw/i3c/dw-i3c.h               |  201 +++
> >   include/hw/i3c/i3c.h                  |  277 ++++
> >   include/hw/i3c/mock-i3c-target.h      |   52 +
> >   meson.build                           |    1 +
> >   20 files changed, 3735 insertions(+), 407 deletions(-)
> >   create mode 100644 hw/i3c/Kconfig
> >   create mode 100644 hw/i3c/aspeed_i3c.c
> >   create mode 100644 hw/i3c/core.c
> >   create mode 100644 hw/i3c/dw-i3c.c
> >   create mode 100644 hw/i3c/meson.build
> >   create mode 100644 hw/i3c/mock-i3c-target.c
> >   create mode 100644 hw/i3c/trace-events
> >   create mode 100644 hw/i3c/trace.h
> >   delete mode 100644 hw/misc/aspeed_i3c.c
> >   rename include/hw/{misc =3D> i3c}/aspeed_i3c.h (63%)
> >   create mode 100644 include/hw/i3c/dw-i3c.h
> >   create mode 100644 include/hw/i3c/i3c.h
> >   create mode 100644 include/hw/i3c/mock-i3c-target.h
> >
>
> This lacks a MAINTAINER.

Ah, right. I can add that in v2. I can add myself to it, is there
anyone else who should be on it?
>
> Could you please provide functional tests ? some with a standard I2C
> device attached to an I3C legacy bus too.

I can work on that, probably v2 or v3 depending on how long it takes.
>
> Are there any other stakeholders interested in the I3C to get feedback ?
>
> Have there been any changes since:
>
>    https://lore.kernel.org/qemu-devel/20230331010131.1412571-1-komlodi@go=
ogle.com/
>
Nothing too substantial. I decided not to upstream remote I3C since
it's unlikely it would be useful upstream.
I think there might be a couple bugfixes in the DwC controller as
well, but I don't remember off-hand what they were. If there were any,
they were all minor.

Thanks,
Joe

> Thanks,
>
> C.
