Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2807016ejo;
        Thu, 14 Dec 2023 21:18:33 -0800 (PST)
X-Received: by 2002:a05:6102:5086:b0:464:421c:a56b with SMTP id bl6-20020a056102508600b00464421ca56bmr9282191vsb.0.1702617512903;
        Thu, 14 Dec 2023 21:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702617512; cv=none;
        d=google.com; s=arc-20160816;
        b=EoL+az417VFwZzCe3Hj0x6Y28OIOpXFGZU+Aj7Zb98p4AesRT2OZOXuopj4EWVj+s9
         DLVoLR+KuGrdvpcad4AKfspeI7gVJ4Nu+5JK1GhK1PsbSopGEDobjP72/PL2ZQBBGo6y
         4xk/sPYLaXxtHlLoYTcFM6vWYUxIz5bJY4cSuCReooeTTYpO2tGFRSM7PN+ijpHniGST
         SWIET7q4Xz9DBJ5PdIAz9LC49/9QzL/eKsClaRNXwptiXgV0geZPnz0VaphzUc06+jQZ
         Xxkd8KtrJutK49Oiqf9f96lpzNTuLCjtMLsd1Dm6FfaEqc2YYGZ40Cbc7f5JB7E7JM+Z
         DXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XKY/O6KVcNCcF3H3XlB8EWP64PWrdzQ/7w2G0UUtLf4=;
        fh=tjG/cyl64oXQamuaotzD6aWYWWTXX7scgO8ovkNTNaQ=;
        b=UxP/oLZZixCNjPgqqQAMXwkt7QpCMQCCNgVUuOcNQf5xy/17r/Urqt0hWRrcfyRnhe
         rkkR5fCNHox3U8aXbu154JuOFkQvY0CkBmwMCguD5ByIRVxDJG2h2nmkmK4yrDedDbqE
         cZ9r3uKo2SB8Sm23hE/mK+a6ATp5fZ9EM/l61fwG0+wDGZgg0dqFd69O/96lQYq+Wwt9
         l90abQmKrbtQM6ZiccVoLP2Lmpudn7BQ5UYJXFcGyauOamEFUOV6mGcYSmEUHSQ2L0lY
         e4dRvS/k/Haazd/fRv9lQq+FKe6lGZ0RdJYDniT3HXOp08zuC336f+5KKS7vM/UEcEkz
         chHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2Tbrfw4;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 7-20020a056102030700b004665c2010adsor844490vsa.3.2023.12.14.21.18.32
        (Google Transport Security);
        Thu, 14 Dec 2023 21:18:32 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2Tbrfw4;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702617512; x=1703222312; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKY/O6KVcNCcF3H3XlB8EWP64PWrdzQ/7w2G0UUtLf4=;
        b=U2Tbrfw4C5aRa2sniNh0E8rnq9rWxMfT6zpVMC3c9OfusdG7BWeRtF8nOodTZmvmpK
         ZiH+B8NXt/3Wcl2trTfvG3Uzd1P7qLlELuKnAvIDr3QOKhJm6BfOPypbIkqZJDRBUAFG
         f2DXIOjWxHziLPgOU0S0qm0y9paTLOgY24So028wx4KWJ/InWzSQgmX5nifduTBpVPv8
         I5ica1IUZvRGT74tqD7cOaQybnnyR7xxP8fzQFormeDIGqXKSiofMkUdGAQaBANTtMvi
         xF77kpW5HehM6HD227rV3OAKQreZe0frwz3urSfFM3ZXsk1RL5qV+fHefz9DMJUt0FCP
         Uj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702617512; x=1703222312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKY/O6KVcNCcF3H3XlB8EWP64PWrdzQ/7w2G0UUtLf4=;
        b=qUsuGTzdavUXb6UfzClLVrOKcvbhmo/lRP0MSwdqwW7fz0zogw10aTFfnY0ZkBWEDW
         ck2U3wlG4sJTXJAmlphOhrnlzSsHb7Z9u8+CBfm4dXpNl3KsjmbbgDazB/d+jRIuXony
         o5+rFehKntD0Pnr3QKlL34dNCqdhESNJwMUiilxyRdPlbKiljTRiQ+XUlA25BMhMAEcy
         2kf9xnkKdL+jk36bEGsjYuLJRc2kZYqoUcJ1W69mfw0WUCu78X3cl3fCymVYrNuEzl+t
         yEYEc19dMIIVxLc2pFtuAVRZLCPRCxED/LrEO3P3p/EP5w1/11HKkCCavXLBRG8uVAeZ
         rkqQ==
X-Gm-Message-State: AOJu0YwRnJCnTQ2f7D/BVbQaQDKpa8Z/m/ngHO+xDAwpvUYb+0MuT11A
	2VX68ypTrfE7e8RdXajHOw96kX14H+dt8jo9Ik26yGud6MM=
X-Google-Smtp-Source: AGHT+IFsDDcvUxOE1pQbBqft7IrnydqmNGIvlqnp7T4en2zxpAtlADXKSchkuZruxTOiqUMOrmJ0b47EXNjk00OBUnQ=
X-Received: by 2002:a67:c091:0:b0:460:7b72:894f with SMTP id
 x17-20020a67c091000000b004607b72894fmr7966806vsi.33.1702617512053; Thu, 14
 Dec 2023 21:18:32 -0800 (PST)
MIME-Version: 1.0
References: <170100975340.4879.5844108484092111139-0@git.sr.ht>
 <170100975340.4879.5844108484092111139-1@git.sr.ht> <CAKmqyKM+usN_VwrwCE68yt9nKT-LZoPw2Xgg_sV_5kw38rwjjw@mail.gmail.com>
 <87r0jzz5ai.fsf@draig.linaro.org>
In-Reply-To: <87r0jzz5ai.fsf@draig.linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 15:18:05 +1000
Message-ID: <CAKmqyKNEehbEgPXN-c1Bf=aB=974muigx_=yu3=tkijGfHb4+A@mail.gmail.com>
Subject: Re: [PATCH qemu 1/2] hw/arm: Add minimal support for the STM32L4x5 SoC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "~inesvarhol" <inesvarhol@proton.me>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	alistair@alistair23.me, philmd@linaro.org, peter.maydell@linaro.org, 
	ines.varhol@telecom-paris.fr, arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 33+SHtMbmwbV

On Thu, Dec 7, 2023 at 2:04=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> Alistair Francis <alistair23@gmail.com> writes:
>
> > On Mon, Nov 27, 2023 at 12:44=E2=80=AFAM ~inesvarhol <inesvarhol@git.sr=
.ht> wrote:
> >>
> >> From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> >>
> >> This patch adds a new STM32L4x5 SoC, it is necessary to add support fo=
r
> >> the B-L475E-IOT01A board.
> >> The implementation is derived from the STM32F405 SoC.
> >> The implementation contains no peripherals, only memory regions are
> >> implemented.
> >>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>
> >> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> >> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> >> ---
> >>  MAINTAINERS                    |   8 +
> >>  hw/arm/Kconfig                 |   5 +
> >>  hw/arm/meson.build             |   1 +
> >>  hw/arm/stm32l4x5_soc.c         | 277 ++++++++++++++++++++++++++++++++=
+
> >>  include/hw/arm/stm32l4x5_soc.h |  68 ++++++++
> >>  5 files changed, 359 insertions(+)
> >>  create mode 100644 hw/arm/stm32l4x5_soc.c
> >>  create mode 100644 include/hw/arm/stm32l4x5_soc.h
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index ff1238bb98..32458d41dd 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1122,6 +1122,14 @@ L: qemu-arm@nongnu.org
> >>  S: Maintained
> >>  F: hw/arm/olimex-stm32-h405.c
> >>
> >> +STM32L4x5 SoC Family
> >> +M: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> >> +M: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> >> +L: qemu-arm@nongnu.org
> >> +S: Maintained
> >> +F: hw/arm/stm32l4x5_soc.c
> >> +F: include/hw/arm/stm32l4x5_soc.h
> >> +
> >>  SmartFusion2
> >>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >>  M: Peter Maydell <peter.maydell@linaro.org>
> >> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> >> index 3ada335a24..d2b94d9a47 100644
> >> --- a/hw/arm/Kconfig
> >> +++ b/hw/arm/Kconfig
> >> @@ -448,6 +448,11 @@ config STM32F405_SOC
> >>      select STM32F4XX_SYSCFG
> >>      select STM32F4XX_EXTI
> >>
> >> +config STM32L4X5_SOC
> >> +    bool
> >> +    select ARM_V7M
> >> +    select OR_IRQ
> >> +
> >>  config XLNX_ZYNQMP_ARM
> >>      bool
> >>      default y if PIXMAN
> >> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> >> index 68245d3ad1..9766da10c4 100644
> >> --- a/hw/arm/meson.build
> >> +++ b/hw/arm/meson.build
> >> @@ -42,6 +42,7 @@ arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm=
2836.c', 'raspi.c'))
> >>  arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_so=
c.c'))
> >>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_so=
c.c'))
> >>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_so=
c.c'))
> >> +arm_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_so=
c.c'))
> >>  arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqm=
p.c', 'xlnx-zcu102.c'))
> >>  arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c'=
, 'xlnx-versal-virt.c'))
> >>  arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'i=
mx25_pdk.c'))
> >> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> >> new file mode 100644
> >> index 0000000000..f476878b2c
> >> --- /dev/null
> >> +++ b/hw/arm/stm32l4x5_soc.c
> >> @@ -0,0 +1,277 @@
> >> +/*
> >> + * STM32L4x5 SoC family
> >> + *
> >> + * SPDX-License-Identifier: MIT
> >
> > I'm pretty sure this must be GPL to be accepted
>
> Does it? A quick grep of the code shows we have quite a lot of hw
> emulation files that are MIT licensed. Although IANAL MIT is very
> permissive and easily combined with GPL as long at the final product is
> under GPL.

Ah interesting. I just assumed everything had to be GPL

Nevermind then!

Alistair

>
> I think there is some LGPL code about for TCG but I'm not sure how well
> tagged that is.
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
