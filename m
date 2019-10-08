Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o22sm45624503wra.96.2019.10.08.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:35:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C2F8C1FF87;
	Tue,  8 Oct 2019 16:35:00 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-18-f4bug@amsat.org>
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
Subject: Re: [PATCH 17/19] tests/boot_linux_console: Test the raspi2 UART1
 (16550 based)
In-reply-to: <20190926173428.10713-18-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 16:35:00 +0100
Message-ID: <87lftvi72z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tVQUrfp+OHId


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The current do_test_arm_raspi2() case tests the PL011 UART0.
> Our model also supports the AUX UART (16550 based).
> We can very simply test the UART1 with Linux, modifying the
> kernel command line.
>
> Add few lines to expand our previous test and cover the AUX
> UART.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/acceptance/boot_linux_console.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 7eaf6cb60e..33e8f6c635 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -326,6 +326,7 @@ class BootLinuxConsole(Test):
>          """
>          serial_kernel_cmdline =3D {
>              0: 'earlycon=3Dpl011,0x3f201000 console=3DttyAMA0',
> +            1: 'earlycon=3Duart8250,mmio32,0x3f215040 console=3DttyS1,11=
5200'
>          }
>          deb_url =3D ('http://archive.raspberrypi.org/debian/'
>                     'pool/main/r/raspberrypi-firmware/'
> @@ -336,7 +337,7 @@ class BootLinuxConsole(Test):
>          dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-=
2-b.dtb')
>
>          self.vm.set_machine('raspi2')
> -        self.vm.set_console()
> +        self.vm.set_console(console_id=3Duart_id)
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>                                 serial_kernel_cmdline[uart_id])
>          self.vm.add_args('-kernel', kernel_path,
> @@ -354,6 +355,14 @@ class BootLinuxConsole(Test):
>          """
>          self.do_test_arm_raspi2(0)
>
> +    def test_arm_raspi2_uart1(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:raspi2
> +        :avocado: tags=3Ddevice:bcm2835_aux
> +        """
> +        self.do_test_arm_raspi2(1)
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x


--
Alex Benn=C3=A9e
