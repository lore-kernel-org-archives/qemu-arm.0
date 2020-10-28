Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p1sm5475227wrx.3.2020.10.28.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:16:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 068941FF7E;
	Wed, 28 Oct 2020 11:16:02 +0000 (GMT)
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
 <87pn53e3ke.fsf@keithp.com>
 <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
 <87k0vbdthq.fsf@keithp.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Alistair
 Francis" <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-reply-to: <87k0vbdthq.fsf@keithp.com>
Date: Wed, 28 Oct 2020 11:16:01 +0000
Message-ID: <87lffqmwi6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JnCj0XqHxaDP


Keith Packard <keithp@keithp.com> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>>>         arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>>>         riscv_ss.add(files('common-semi.c'))
>>>
>>> This appears to work in my testing (building arm, risc-v and x86_64
>>> configs).
>>
>> I'm not a kconfig expert but it might be preferable to have
>> a new CONFIG_ for arm-semihosting-ABI which the relevant
>> targets enable. Somebody else may be able to advise.
>
> The change above makes this do exactly what the old code did -- add this
> file to the arm_ss sourceset whenever CONFIG_TCG is true. arm_ss is
> only used to build ARM targets, so this file gets added only for those
> targets. Here's what the patch to target/arm/meson.build and
> hw/semihosting/meson.build looks like now.
>
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..15b936c101 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -32,8 +32,6 @@ arm_ss.add(files(
>  ))
>  arm_ss.add(zlib)
>=20=20
> -arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
> -
>  arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_fa=
lse: files('kvm-stub.c'))
>=20=20
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>
> diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
> index f40ac574c4..26538e81e7 100644
> --- a/hw/semihosting/meson.build
> +++ b/hw/semihosting/meson.build
> @@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: file=
s(
>    'config.c',
>    'console.c',
>  ))
> +
> +arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))

I don't think we want arm specific adds in the common code. I think what
Peter was suggesting is a new config symbol that only ARM and RISC
define, e.g something like:

  specific_ss.add(when: 'CONFIG_ARM_STYLE_SEMIHOSTING',
                  if_true: files ('common-semi.c'))

or some other suitably descriptive symbol. Otherwise you have to keep
adding an foo_ss.add line for each architecture that wants it.

--=20
Alex Benn=C3=A9e
