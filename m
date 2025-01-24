Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab0bcsm135499666b.95.2025.01.24.05.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:58:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C3DC35F748;
	Fri, 24 Jan 2025 13:58:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Joel Stanley
 <joel@jms.id.au>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/functional: Add a test for the arm microbit machine
In-Reply-To: <20250124101709.1591761-1-thuth@redhat.com> (Thomas Huth's
	message of "Fri, 24 Jan 2025 11:17:09 +0100")
References: <20250124101709.1591761-1-thuth@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 24 Jan 2025 13:58:13 +0000
Message-ID: <8734h8joui.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: irz3xz24gK95

Thomas Huth <thuth@redhat.com> writes:

> We don't have any functional tests for this machine yet, thus let's
> add a test with a MicroPython binary that is available online

We do have a basic system test:

  test-armv6m-undef: test-armv6m-undef.S
          $(CC) -mcpu=3Dcortex-m0 -mfloat-abi=3Dsoft \
                  -Wl,--build-id=3Dnone -x assembler-with-cpp \
                  $< -o $@ -nostdlib -static \
                  -T $(ARM_SRC)/$@.ld

  run-test-armv6m-undef: QEMU_OPTS=3D-semihosting-config enable=3Don,target=
=3Dnative,chardev=3Doutput -M microbit -kernel

  ARM_TESTS+=3Dtest-armv6m-undef

But I guess this exercised more of the machine as micropython actually
comes up.

> (thanks to Joel Stanley for providing it, see:
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg606064.html ).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                           |  1 +
>  tests/functional/meson.build          |  1 +
>  tests/functional/test_arm_microbit.py | 31 +++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100755 tests/functional/test_arm_microbit.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d9b3a0011..7b4d84bf5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1157,6 +1157,7 @@ F: hw/*/microbit*.c
>  F: include/hw/*/nrf51*.h
>  F: include/hw/*/microbit*.h
>  F: tests/qtest/microbit-test.c
> +F: tests/functional/test_arm_microbit.py
>  F: docs/system/arm/nrf.rst
>=20=20
>  ARM PL011 Rust device
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index bcfbb70b65..a301c38806 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -105,6 +105,7 @@ tests_arm_system_thorough =3D [
>    'arm_cubieboard',
>    'arm_emcraft_sf2',
>    'arm_integratorcp',
> +  'arm_microbit',
>    'arm_orangepi',
>    'arm_quanta_gsj',
>    'arm_raspi2',
> diff --git a/tests/functional/test_arm_microbit.py b/tests/functional/tes=
t_arm_microbit.py
> new file mode 100755
> index 0000000000..68ea4e73d6
> --- /dev/null
> +++ b/tests/functional/test_arm_microbit.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright 2025, The QEMU Project Developers.
> +#
> +# A functional test that runs MicroPython on the arm microbit machine.
> +
> +from qemu_test import QemuSystemTest, Asset, exec_command_and_wait_for_p=
attern
> +from qemu_test import wait_for_console_pattern
> +
> +
> +class MicrobitMachine(QemuSystemTest):
> +
> +    ASSET_MICRO =3D Asset('https://ozlabs.org/~joel/microbit-micropython=
.hex',
> +        '021641f93dfb11767d4978dbb3ca7f475d1b13c69e7f4aec3382f212636bffd=
6')
> +
> +    def test_arm_microbit(self):
> +        self.set_machine('microbit')
> +
> +        micropython =3D self.ASSET_MICRO.fetch()
> +        self.vm.set_console()
> +        self.vm.add_args('-device', f'loader,file=3D{micropython}')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Type "help()" for more informati=
on.')
> +        exec_command_and_wait_for_pattern(self, 'import machine as mch',=
 '>>>')
> +        exec_command_and_wait_for_pattern(self, 'mch.reset()', 'MicroPyt=
hon')
> +        wait_for_console_pattern(self, '>>>')

We could do more if we wanted - all the microbit specific stuff lives in
the microbit module:

  https://microbit-micropython.readthedocs.io/en/latest/microbit_micropytho=
n_api.html

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +
> +if __name__ =3D=3D '__main__':
> +    QemuSystemTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
