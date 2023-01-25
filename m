Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d6acd000000b002bc7f64efa3sm4160252wrw.29.2023.01.25.04.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 04:14:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C3DF21FFB7;
	Wed, 25 Jan 2023 12:14:00 +0000 (GMT)
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth
 <thuth@redhat.com>, qemu-arm@nongnu.org, Niek Linnenbank
 <nieklinnenbank@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>, Rob Herring
 <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka
 <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU)
 by object_new(ARMCPU)
Date: Wed, 25 Jan 2023 11:58:23 +0000
In-reply-to: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Message-ID: <87sffyreuv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 16U9lVkKrPkV


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> Replace the ARMCPU field in DigicState by a reference to
>> an allocated ARMCPU. Instead of initializing the field
>> with object_initialize(), allocate it with object_new().
>>
>> As we don't access ARMCPU internal fields or size, we can
>> move digic.c from arm_ss[] to the more generic softmmu_ss[].
>
> I'm not really a fan of this, because it moves away
> from a standard coding pattern we've been using for
> new QOM 'container' devices, where all the sub-components
> of the device are structs embedded in the device's own
> struct. This is as opposed to the old style which tended
> to use "allocate memory for the sub-component and have
> pointers to it". It means the CPU object is now being
> treated differently from all the timers, UARTs, etc.

I think you can certainly make the argument that CPU's have always been
treated separately because we pass it around as an anonymous pointer all
the time. We currently can't support two concrete CPU types in the same
structure. For example zyncmp has:

  struct XlnxZynqMPState {
      /*< private >*/
      DeviceState parent_obj;

      /*< public >*/
      CPUClusterState apu_cluster;
      CPUClusterState rpu_cluster;
      ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
      ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];

which only works because A/R cpus are the same underlying type. However
when we want to add Microblaze how would we do it?

Is the main problem preventing us from including multiple cpu.h
definitions that we overload CPUArch and CPUArchState? What are the
implications if we convert them to fully anonymous pointer types?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
