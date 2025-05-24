Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602d2282d3asm1267520a12.16.2025.05.24.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:38:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D30D75F782;
	Sat, 24 May 2025 16:38:20 +0100 (BST)
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
Date: Sat, 24 May 2025 16:38:20 +0100
Message-ID: <87a57210k3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xRrYDvo6Yvj4

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.
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
> +
> '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')

Hmm do we need to specify a checksum type now?

  TAP version 13
  not ok 1 test_aarch64_hotplug_pci.HotplugPCI.test_hotplug_pci
  1..1
  ----------------------------------- stderr ------------------------------=
-----
  Traceback (most recent call last):
    File "/home/alex/lsrc/qemu.git/tests/functional/test_aarch64_hotplug_pc=
i.py", line 44, in test_hotplug_pci
      self.launch_kernel(self.ASSET_KERNEL.fetch(),
                         ~~~~~~~~~~~~~~~~~~~~~~~^^
    File "/home/alex/lsrc/qemu.git/tests/functional/qemu_test/asset.py", li=
ne 189, in fetch
      raise AssetError(self, "Hash does not match %s" % self.hash)
  qemu_test.asset.AssetError: https://ftp.debian.org/debian/dists/stable/ma=
in/installer-arm64/current/images/netboot/debian-installer/arm64/linux: Has=
h does not match 3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca=
3117b2

  More information on test_aarch64_hotplug_pci.HotplugPCI.test_hotplug_pci =
could be found here:
   /home/alex/lsrc/qemu.git/builds/all/tests/functional/aarch64/test_aarch6=
4_hotplug_pci.HotplugPCI.test_hotplug_pci/base.log
   /home/alex/lsrc/qemu.git/builds/all/tests/functional/aarch64/test_aarch6=
4_hotplug_pci.HotplugPCI.test_hotplug_pci/console.log

  (test program exited with status code 1)
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

In fact could we use the existing tuxrun images instead of relying on
debian stable not changing?

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
