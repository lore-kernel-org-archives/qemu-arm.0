Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u4sm4739115wrt.37.2020.02.06.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 08:18:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DA59D1FF87;
	Thu,  6 Feb 2020 16:18:56 +0000 (GMT)
References: <CADxp150RUQXjDFjrQcrJCfoWto=ERaGVd=neo9s_2=3XsyS9XA@mail.gmail.com>
 <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
 <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Liviu Ionescu <ilg@livius.net>, Mohannad Maklad <msala.work@gmail.com>,
 qemu-discuss@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>
Subject: Re: Is STM32f429 discovery board fully supported on qemu?
In-reply-to: <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
Date: Thu, 06 Feb 2020 16:18:56 +0000
Message-ID: <87a75v8z9r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3KMzNnLvy8Bq


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Liviu,
>
> On 2/6/20 3:34 PM, Liviu Ionescu wrote:
>>> On 6 Feb 2020, at 11:23, Mohannad Maklad <msala.work@gmail.com> wrote:
>>>
>>> I'm trying to emulate STM32F429I discovery board using qemu & eclipse I=
DE.
>>>
>>> I got the blinky example running with the led turning on and off on the=
 graphics screen but I have tried an example to run the on-board screen and=
 it doesn't seem to be running, Is it supported?
>>>
>>> Also, many drivers fail when simulated with qemu (sdram, rcc, ...) How =
can I know exactly what peripherals that are fully supported?
>>>
>> If you are using the xPack QEMU (formerly GNU MCU Eclipse QEMU), the
>> documentation page is:
>> https://xpack.github.io/qemu-arm/
>
> https://xpack.github.io/qemu-arm/#why-xpack-qemu-arm
>
>   "Even more, support for semihosting in the public
>   QEMU version was broken, and the verbosity required
>   for integration with the QEMU plug-in was missing,
>   so it could not be used with the GNU MCU Eclipse
>   plug-ins."
>
> Too bad these improvements aren't shared with the whole community.
>
> Note there have been a lot of changes/improvements related to ARM
> semihosting recently in the mainstream QEMU.

As far as I can tell from a quick glance over:

  git diff v2.8.0..xpack/xpack -- target-arm/

The changes fall into:

  * more cortex-m profile CPUs

  However of the ones we implement in master are more complete
  definitions (cortex_m0/3/4/7/33).

  * tweaks to semihosting fd handling

  This is superseded by the cleanups Peter did for semihosting 2.0
  support

  * a suspect hack for semihosting exit

  I think this is trying to ensure graphics are updated before the exit.
  Arguably we could make fixes to make a semihosting triggered exit more
  uniform (avoiding lots of places forgetting to call gdb_exit and other
  pre-exit handlers). The is probably overlap with things like pvpanic
  and virtio exit code support.

  * extending gdbstub for m-profile

  I think these are mostly status registers fields rather than
  additional system registers which should already be exported by our
  gdbstub.

  * changes to nvic handling for debug states

  I'm not sure I fully follow what is going on here. The larger diff
  seems to import an additional copy of the nvic emulation.

I've not looked at the wider diff as it is quite big. However as far as
I can tell the gdbstub "verbosity" support is basically a bunch of
printf's.

>
> https://xpack.github.io/qemu-arm/#supported-boards-and-mcus
>
>   The boards currently supported by the xPack QEMU Arm are:
>
>     Maple =E2=80=93 LeafLab Arduino-style STM32 microcontroller board
>     NUCLEO-F103RB =E2=80=93 ST Nucleo Development Board for STM32 F1 seri=
es
>     NetduinoGo =E2=80=93 Netduino GoBus Development Board with STM32F4
>     NetduinoPlus2 =E2=80=93 Netduino Development Board with STM32F4
>     STM32-E407 =E2=80=93 Olimex Development Board for STM32F407ZGT6
>     STM32-H103 =E2=80=93 Olimex Header Board for STM32F103RBT6
>     STM32-P103 =E2=80=93 Olimex Prototype Board for STM32F103RBT6
>     STM32-P107 =E2=80=93 Olimex Prototype Board for STM32F107VCT6
>     STM32F4-Discovery =E2=80=93 ST Discovery kit for STM32F407/417 lines
>     STM32F429I-Discovery =E2=80=93 ST Discovery kit for STM32F429/439 lin=
es
>
> Quite a nice list, it shouldn't require a lot of effort to contribute
> these boards to the community IMHO.

It really depends on if:

  - there is an active maintainer to look after it
  - there is actual demand for it's usage

We should be cautious about importing 3rd party boards because it adds
to QEMUs attack surface and overall maintenance burden.

That said m-profile has been a subject of a lot of work recently.
Linaro's focus has mostly been on providing modern M-profile boards with
interesting architectural features to build on (TrustZone being the big
one). Your work on AVR/Arduino is also interesting because there are a
lot of Arduino's out there so I can see a good use case for supporting
it in QEMU. Random development boards that may have a very limited use
case is less compelling.

However if any of the existing embedded dev houses that already support
QEMU want to reduce their 3rd diff by up-streaming and supporting their
favourite pet board I don't see many objections would be raised.

--
Alex Benn=C3=A9e
