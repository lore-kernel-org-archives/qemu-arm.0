Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u10sm4318212wmm.0.2019.10.08.08.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:34:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C3C511FF87;
	Tue,  8 Oct 2019 16:34:35 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-17-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti
 <bztemail@gmail.com>, Laurent Bonnans <laurent.bonnans@here.com>, Esteban
 Bosse <estebanbosse@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 16/19] tests/boot_linux_console: Add a test for the
 Raspberry Pi 2
In-reply-to: <20190926173428.10713-17-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 16:34:35 +0100
Message-ID: <87muebi73o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JvuUq1epeyt7


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
> board and verify the serial is working.
>
> The kernel image and DeviceTree blob are built by the Raspbian
> project (based on Debian):
> https://www.raspbian.org/RaspbianImages
> as recommended by the Raspberry Pi project:
> https://www.raspberrypi.org/downloads/raspbian/
>
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>
> Alternatively, this test can be run using:
>
>     $ avocado run -t arch:arm tests/acceptance
>     $ avocado run -t machine:raspi2 tests/acceptance
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> v3: removed debug printf (Cleber)
>     use serial_kernel_cmdline dict
> ---
>  tests/acceptance/boot_linux_console.py | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 079590f0c8..7eaf6cb60e 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -318,6 +318,42 @@ class BootLinuxConsole(Test):
>          self.vm.launch()
>          self.wait_for_console_pattern('init started: BusyBox')
>
> +    def do_test_arm_raspi2(self, uart_id):
> +        """
> +        The kernel can be rebuilt using the kernel source referenced
> +        and following the instructions on the on:
> +        https://www.raspberrypi.org/documentation/linux/kernel/building.=
md
> +        """
> +        serial_kernel_cmdline =3D {
> +            0: 'earlycon=3Dpl011,0x3f201000 console=3DttyAMA0',
> +        }
> +        deb_url =3D ('http://archive.raspberrypi.org/debian/'
> +                   'pool/main/r/raspberrypi-firmware/'
> +                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
> +        deb_hash =3D 'cd284220b32128c5084037553db3c482426f3972'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path, '/boot/kernel7.i=
mg')
> +        dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-=
2-b.dtb')
> +
> +        self.vm.set_machine('raspi2')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               serial_kernel_cmdline[uart_id])
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> +        self.wait_for_console_pattern(console_pattern)
> +
> +    def test_arm_raspi2_uart0(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:raspi2
> +        :avocado: tags=3Ddevice:pl011
> +        """
> +        self.do_test_arm_raspi2(0)
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x


--
Alex Benn=C3=A9e
