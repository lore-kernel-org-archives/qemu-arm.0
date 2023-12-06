Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id he15-20020a05600c540f00b0040c25abd724sm135244wmb.9.2023.12.06.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:04:06 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D563C5FBC6;
	Wed,  6 Dec 2023 16:04:05 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: "~inesvarhol" <inesvarhol@proton.me>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  alistair@alistair23.me,  philmd@linaro.org,
  peter.maydell@linaro.org,  ines.varhol@telecom-paris.fr,
  arnaud.minier@telecom-paris.fr
Subject: Re: [PATCH qemu 1/2] hw/arm: Add minimal support for the STM32L4x5 SoC
In-Reply-To: <CAKmqyKM+usN_VwrwCE68yt9nKT-LZoPw2Xgg_sV_5kw38rwjjw@mail.gmail.com>
	(Alistair Francis's message of "Wed, 6 Dec 2023 11:18:35 +1000")
References: <170100975340.4879.5844108484092111139-0@git.sr.ht>
	<170100975340.4879.5844108484092111139-1@git.sr.ht>
	<CAKmqyKM+usN_VwrwCE68yt9nKT-LZoPw2Xgg_sV_5kw38rwjjw@mail.gmail.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Wed, 06 Dec 2023 16:04:05 +0000
Message-ID: <87r0jzz5ai.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ooCYLSPADJ8y

Alistair Francis <alistair23@gmail.com> writes:

> On Mon, Nov 27, 2023 at 12:44=E2=80=AFAM ~inesvarhol <inesvarhol@git.sr.h=
t> wrote:
>>
>> From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>>
>> This patch adds a new STM32L4x5 SoC, it is necessary to add support for
>> the B-L475E-IOT01A board.
>> The implementation is derived from the STM32F405 SoC.
>> The implementation contains no peripherals, only memory regions are
>> implemented.
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>
>> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>> ---
>>  MAINTAINERS                    |   8 +
>>  hw/arm/Kconfig                 |   5 +
>>  hw/arm/meson.build             |   1 +
>>  hw/arm/stm32l4x5_soc.c         | 277 +++++++++++++++++++++++++++++++++
>>  include/hw/arm/stm32l4x5_soc.h |  68 ++++++++
>>  5 files changed, 359 insertions(+)
>>  create mode 100644 hw/arm/stm32l4x5_soc.c
>>  create mode 100644 include/hw/arm/stm32l4x5_soc.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ff1238bb98..32458d41dd 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1122,6 +1122,14 @@ L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/arm/olimex-stm32-h405.c
>>
>> +STM32L4x5 SoC Family
>> +M: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> +M: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>> +F: hw/arm/stm32l4x5_soc.c
>> +F: include/hw/arm/stm32l4x5_soc.h
>> +
>>  SmartFusion2
>>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>  M: Peter Maydell <peter.maydell@linaro.org>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 3ada335a24..d2b94d9a47 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -448,6 +448,11 @@ config STM32F405_SOC
>>      select STM32F4XX_SYSCFG
>>      select STM32F4XX_EXTI
>>
>> +config STM32L4X5_SOC
>> +    bool
>> +    select ARM_V7M
>> +    select OR_IRQ
>> +
>>  config XLNX_ZYNQMP_ARM
>>      bool
>>      default y if PIXMAN
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index 68245d3ad1..9766da10c4 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -42,6 +42,7 @@ arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm28=
36.c', 'raspi.c'))
>>  arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.=
c'))
>>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.=
c'))
>>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.=
c'))
>> +arm_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.=
c'))
>>  arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.=
c', 'xlnx-zcu102.c'))
>>  arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', =
'xlnx-versal-virt.c'))
>>  arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx=
25_pdk.c'))
>> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
>> new file mode 100644
>> index 0000000000..f476878b2c
>> --- /dev/null
>> +++ b/hw/arm/stm32l4x5_soc.c
>> @@ -0,0 +1,277 @@
>> +/*
>> + * STM32L4x5 SoC family
>> + *
>> + * SPDX-License-Identifier: MIT
>
> I'm pretty sure this must be GPL to be accepted

Does it? A quick grep of the code shows we have quite a lot of hw
emulation files that are MIT licensed. Although IANAL MIT is very
permissive and easily combined with GPL as long at the final product is
under GPL.

I think there is some LGPL code about for TCG but I'm not sure how well
tagged that is.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
