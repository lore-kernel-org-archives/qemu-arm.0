Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a21adsm20673715e9.12.2025.01.22.03.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:20:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 55BE05F9F8;
	Wed, 22 Jan 2025 11:20:37 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Leif Lindholm <quic_llindhol@quicinc.com>,  Leif
 Lindholm <leif.lindholm@oss.qualcomm.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Radoslaw Biernacki <rad@semihalf.com>,
  qemu-arm@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v2 4/5] hw/arm: enable secure EL2 timers for virt machine
In-Reply-To: <CAFEAcA_yqw2DJ_iPpwYXjsR_h1gAZdOs29b-2ar0QOg4k4D0hQ@mail.gmail.com>
	(Peter Maydell's message of "Fri, 10 Jan 2025 12:53:18 +0000")
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
	<20241218181511.3575613-5-alex.bennee@linaro.org>
	<CAFEAcA_yqw2DJ_iPpwYXjsR_h1gAZdOs29b-2ar0QOg4k4D0hQ@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 11:20:37 +0000
Message-ID: <87frlbnlh6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QYI9s6SFWGNW

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 18 Dec 2024 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> ---
>>  hw/arm/virt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 333eaf67ea..5e3589dc6a 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -873,6 +873,8 @@ static void create_gic(VirtMachineState *vms, Memory=
Region *mem)
>>              [GTIMER_HYP]  =3D ARCH_TIMER_NS_EL2_IRQ,
>>              [GTIMER_SEC]  =3D ARCH_TIMER_S_EL1_IRQ,
>>              [GTIMER_HYPVIRT] =3D ARCH_TIMER_NS_EL2_VIRT_IRQ,
>> +            [GTIMER_SEC_PEL2] =3D ARCH_TIMER_S_EL2_IRQ,
>> +            [GTIMER_SEC_VEL2] =3D ARCH_TIMER_S_EL2_VIRT_IRQ,
>>          };
>>
>>          for (unsigned irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {
>
> Do these timer interrupts have a defined devicetree binding that
> we need to set up in fdt_add_timer_nodes()? How about ACPI?

The DT in the kernel doesn't care (why would it, it never sees the SEL2
timers). The hafnium test case works without it.

I'm not sure where there is a DT specification that describes what
should be there for SEL2.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
