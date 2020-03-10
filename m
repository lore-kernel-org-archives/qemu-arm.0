Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r23sm9583357wrr.93.2020.03.10.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 01:15:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ADDA41FF7E;
	Tue, 10 Mar 2020 08:15:58 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com>
 <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAPan3WqOT1B4xuJeAYUh4Np1UjJuypCDSQVGeV2yyNbH5mBxKw@mail.gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
In-reply-to: <CAPan3WqOT1B4xuJeAYUh4Np1UjJuypCDSQVGeV2yyNbH5mBxKw@mail.gmail.com>
Date: Tue, 10 Mar 2020 08:15:58 +0000
Message-ID: <87pndkiq0x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mz+dGWrS9TL7


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> Hi Alex,
>
> On Wed, Mar 4, 2020 at 9:55 PM Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
>
>> Hello Alex,
>>
>> On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> wrote:
>>
>>>
>>> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>>>
>>> > The Xunlong Orange Pi PC machine is a functional ARM machine
>>> > based on the Allwinner H3 System-on-Chip. It supports mainline
>>> > Linux, U-Boot, NetBSD and is covered by acceptance tests.
>>> >
>>> > This commit adds a documentation text file with a description
>>> > of the machine and instructions for the user.
>>>
>>> This is great, thanks for taking the time to include documentation.
>>>
>>
>> Sure, I'm happy to contribute it. I tried to include most relevant
>> information
>> in there for developers and potential users of the machine. If something
>> is missing
>> just let me know and I'll make an update for it.
>>
>>
>>>
>>> >
>>> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>>> > ---
>>> >  docs/orangepi.rst | 226
>>> > ++++++++++++++++++++++++++++++++++++++++++++++
>>>
>>> I suspect there is a better place to put this is than the top level. I
>>> wonder if it should be docs/specs?
>>>
>>
>> Yeah I'm fine to move it to a different subdirectory if needed. Right now
>> its placed in docs,
>> as it seems that documents for machines are also placed there, for examp=
le
>> docs/microvm.rst
>>
>>
>>>
>>> >  MAINTAINERS       |   1 +
>>> >  2 files changed, 227 insertions(+)
>>> >  create mode 100644 docs/orangepi.rst
>>> >
>>> > diff --git a/docs/orangepi.rst b/docs/orangepi.rst
>>> > new file mode 100644
>>> > index 0000000000..a9b46f553c
>>> > --- /dev/null
>>> > +++ b/docs/orangepi.rst
>>> > @@ -0,0 +1,226 @@
>>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> > +Orange Pi PC Machine Type
>>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> > +
>>> > +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
>>> > +based embedded computer with mainline support in both U-Boot
>>> > +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
>>> > +1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
>>> > +various other I/O.
>>>
>>> When Peter's document PR goes in later this week there will also be a:
>>>
>>>   docs/system/target-arm.rst
>>>
>>> which would benefit from a section for the Orange Pi in it.
>>>
>>
>> Nice, I'll have a look at it when it gets merged and add a section for
>> Orange Pi.
>> I'll try to include that in the next version of this series.
>>
>>
>>>
>>> > +
>>> > +Supported devices
>>> > +-----------------
>>> > +
>>> > +The Orange Pi PC machine supports the following devices:
>>> > +
>>> > + * SMP (Quad Core Cortex A7)
>>> > + * Generic Interrupt Controller configuration
>>> > + * SRAM mappings
>>> > + * SDRAM controller
>>> > + * Real Time Clock
>>> > + * Timer device (re-used from Allwinner A10)
>>> > + * UART
>>> > + * SD/MMC storage controller
>>> > + * EMAC ethernet
>>>
>>> Do we ever exercise the ethernet in the acceptance tests? I see we have
>>> some that boots a full OS but boot console only seems to touch the
>>> serial console.
>>>
>>
>> Good point. Currently in the acceptance tests U-Boot and Linux detect
>> the ethernet device, but there are no explicit checks for that in the
>> acceptance tests
>> nor any actual packet transmission.
>>
>> I'll try to extend the current tests in the next version of this series =
to
>> include some
>> basic checks for the ethernet device, perhaps with DHCP or a ping.
>> I'm open to suggestions for the preferred way to do this.
>>
>
> FYI, I added some coverage for the ethernet device by extending the
> test_arm_orangepi_sd test with a few lines like:
>
> +        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up', 'eth=
0:
> Link is Up')
> +        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
> +                                                'udhcpc: lease of
> 10.0.2.15 obtained')
> +        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
> +            '3 packets transmitted, 3 packets received, 0% packet loss')
>

That will work as a smoke test. Are you going to re-spin this week so we
can get the final reviews done?

> Regards,
> Niek
>
>
>> Regards,
>> Niek
>>
>>
>>
>>
>>
>>
>>>
>>> <snip>
>>>
>>> --
>>> Alex Benn=C3=A9e
>>>
>>
>>
>> --
>> Niek Linnenbank
>>
>>


--=20
Alex Benn=C3=A9e
