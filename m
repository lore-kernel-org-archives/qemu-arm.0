Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59700asm28828285e9.34.2025.05.16.02.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:55:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 33BA55F904;
	Fri, 16 May 2025 10:55:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  berrange@redhat.com,
  eric.auger@redhat.com,  philmd@linaro.org,  peter.maydell@linaro.org,
  qemu-arm@nongnu.org
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
In-Reply-To: <20250512144629.182340-1-gustavo.romero@linaro.org> (Gustavo
	Romero's message of "Mon, 12 May 2025 15:45:45 +0100")
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 16 May 2025 10:55:02 +0100
Message-ID: <87frh4yj61.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lIuDIC0RWMf8

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.

Queued to maintainer/may-2025, thanks.

>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  MAINTAINERS                                  |  5 ++
>  tests/functional/meson.build                 |  1 +
>  tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23174b4ca7..9ebb768214 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2065,6 +2065,11 @@ S: Supported
>  F: include/hw/pci/pcie_doe.h
>  F: hw/pci/pcie_doe.c
>=20=20
> +ARM PCI Hotplug
> +M: Gustavo Romero <gustavo.romero@linaro.org>
> +S: Supported
> +F: tests/functional/test_aarch64_hotplug_pci.py
> +
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 52b4706cfe..2d68840fa2 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -83,6 +83,7 @@ tests_aarch64_system_quick =3D [
>  tests_aarch64_system_thorough =3D [
>    'aarch64_aspeed_ast2700',
>    'aarch64_aspeed_ast2700fc',
> +  'aarch64_hotplug_pci',
>    'aarch64_imx8mp_evk',
>    'aarch64_raspi3',
>    'aarch64_raspi4',
> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functio=
nal/test_aarch64_hotplug_pci.py
> new file mode 100755
> index 0000000000..fa1bb62c8f
> --- /dev/null
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -0,0 +1,74 @@
> +#!/usr/bin/env python3
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# The test hotplugs a PCI device and checks it on a Linux guest.
> +#
> +# Copyright (c) 2025 Linaro Ltd.
> +#
> +# Author:
> +#  Gustavo Romero <gustavo.romero@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_=
pattern
> +from qemu_test import BUILD_DIR
> +
> +class HotplugPCI(LinuxKernelTest):
> +
> +    ASSET_KERNEL =3D Asset(
> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm6=
4/'
> +         'current/images/netboot/debian-installer/arm64/linux'),
> +        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b=
2')
> +
> +    ASSET_INITRD =3D Asset(
> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm6=
4/'
> +         'current/images/netboot/debian-installer/arm64/initrd.gz'),
> +        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b=
4')
> +
> +    def test_hotplug_pci(self):
> +
> +        self.set_machine('virt')
> +        self.vm.add_args('-m', '512M')
> +        self.vm.add_args('-cpu', 'cortex-a57')
> +        self.vm.add_args('-append',
> +                         'console=3DttyAMA0,115200 init=3D/bin/sh')
> +        self.vm.add_args('-device',
> +                         'pcie-root-port,bus=3Dpcie.0,chassis=3D1,slot=
=3D1,id=3Dpcie.1')
> +        self.vm.add_args('-bios', self.build_file('pc-bios',
> +                                                  'edk2-aarch64-code.fd'=
))
> +
> +        # BusyBox prompt
> +        prompt =3D "~ #"
> +        self.launch_kernel(self.ASSET_KERNEL.fetch(),
> +                           self.ASSET_INITRD.fetch(),
> +                           wait_for=3Dprompt)
> +
> +        # Check for initial state: 2 network adapters, lo and enp0s1.
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',
> +                                          '2')
> +
> +        # Hotplug one network adapter to the root port, i.e. pcie.1 bus.
> +        self.vm.cmd('device_add',
> +                    driver=3D'virtio-net-pci',
> +                    bus=3D'pcie.1',
> +                    addr=3D0,
> +                    id=3D'na')
> +        # Wait for the kernel to recognize the new device.
> +        self.wait_for_console_pattern('virtio-pci')
> +        self.wait_for_console_pattern('virtio_net')
> +
> +        # Check if there is a new network adapter.
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',
> +                                          '3')
> +
> +        self.vm.cmd('device_del', id=3D'na')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',
> +                                          '2')
> +
> +if __name__ =3D=3D '__main__':
> +    LinuxKernelTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
