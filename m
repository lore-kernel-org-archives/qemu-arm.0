Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j2sm94386754wrt.35.2021.01.05.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:22:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7AD761FF7E;
	Tue,  5 Jan 2021 09:22:06 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2 4/4] docs/system: arm: Add sabrelite board description
Date: Tue, 05 Jan 2021 09:21:38 +0000
In-reply-to: <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87turv3fi9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xIACs0ayrfrM


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the target guide for SABRE Lite board, and documents how
> to boot a Linux kernel and U-Boot bootloader.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Awesome documentation =F0=9F=91=8F

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> ---
>
> Changes in v2:
> - new patch: add sabrelite target guide
>
>  docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++=
++++++
>  docs/system/target-arm.rst    |   1 +
>  2 files changed, 120 insertions(+)
>  create mode 100644 docs/system/arm/sabrelite.rst
>
> diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
> new file mode 100644
> index 0000000..4c5d101
> --- /dev/null
> +++ b/docs/system/arm/sabrelite.rst
> @@ -0,0 +1,119 @@
> +Boundary Devices SABRE Lite (``sabrelite``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Boundary Devices SABRE Lite i.MX6 Development Board is a low-cost develo=
pment
> +platform featuring the powerful Freescale / NXP Semiconductor's i.MX 6 Q=
uad
> +Applications Processor.
> +
> +Supported devices
> +-----------------
> +
> +The SABRE Lite machine supports the following devices:
> +
> + * Up to 4 Cortex A9 cores
> + * Generic Interrupt Controller
> + * 1 Clock Controller Module
> + * 1 System Reset Controller
> + * 5 UARTs
> + * 2 EPIC timers
> + * 1 GPT timer
> + * 2 Watchdog timers
> + * 1 FEC ethernet controller
> + * 3 I2C controllers
> + * 7 GPIO controllers
> + * 4 SDHC storage controllers
> + * 4 USB 2.0 host controllers
> + * 5 ECSPI controllers
> + * 1 SST 25VF016B flash
> +
> +Please note above list is a complete superset the QEMU SABRE Lite machin=
e can
> +support. For a normal use case, a device tree blob that reprents a real =
world
> +SABRE Lite board, only exposes a subset of devices to the guest software.
> +
> +Boot options
> +------------
> +
> +The SABRE Lite machine can start using the standard -kernel functionality
> +for loading a Linux kernel, U-Boot bootloader or ELF executable.
> +
> +Running Linux kernel
> +--------------------
> +
> +Linux mainline v5.10 release is tested at the time of writing. To build =
a Linux
> +mainline kernel that can be booted by the SABRE Lite machine, simply con=
figure
> +the kernel using the imx_v6_v7_defconfig configuration:
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make imx_v6_v7_defconfig
> +  $ make
> +
> +To boot the newly built Linux kernel in QEMU with the SABRE Lite machine=
, use:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
> +      -display none -serial null -serial stdio \
> +      -kernel arch/arm/boot/zImage \
> +      -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
> +      -initrd /path/to/rootfs.ext4 \
> +      -append "root=3D/dev/ram"
> +
> +Running U-Boot
> +--------------
> +
> +U-Boot mainline v2020.10 release is tested at the time of writing. To bu=
ild a
> +U-Boot mainline bootloader that can be booted by the SABRE Lite machine,=
 use
> +the mx6qsabrelite_defconfig with similar commands as described above for=
 Linux:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make mx6qsabrelite_defconfig
> +
> +Note we need to adjust settings by:
> +
> +.. code-block:: bash
> +
> +  $ make menuconfig
> +
> +then manually select the following configuration in U-Boot:
> +
> +  Device Tree Control > Provider of DTB for DT Control > Embedded DTB
> +
> +To start U-Boot using the SABRE Lite machine, provide the u-boot binary =
to
> +the -kernel argument, along with an SD card image with rootfs:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
> +      -display none -serial null -serial stdio \
> +      -kernel u-boot
> +
> +The following example shows booting Linux kernel from dhcp, and uses the
> +rootfs on an SD card. This requies some additional command line paramete=
rs
> +for QEMU:
> +
> +.. code-block:: none
> +
> +  -nic user,tftp=3D/path/to/kernel/zImage \
> +  -drive file=3Dsdcard.img,id=3Drootfs -device sd-card,drive=3Drootfs
> +
> +The directory for the built-in TFTP server should also contain the devic=
e tree
> +blob of the SABRE Lite board. The sample SD card image was populated wit=
h the
> +root file system with one single partition. You may adjust the kernel "r=
oot=3D"
> +boot parameter accordingly.
> +
> +After U-Boot boots, type the following commands in the U-Boot command sh=
ell to
> +boot the Linux kernel:
> +
> +.. code-block:: none
> +
> +  =3D> setenv ethaddr 00:11:22:33:44:55
> +  =3D> setenv bootfile zImage
> +  =3D> dhcp
> +  =3D> tftpboot 14000000 imx6q-sabrelite.dtb
> +  =3D> setenv bootargs root=3D/dev/mmcblk3p1
> +  =3D> bootz 12000000 - 14000000
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index bde4b8e..edd013c 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
>     arm/versatile
>     arm/vexpress
>     arm/aspeed
> +   arm/sabrelite
>     arm/digic
>     arm/musicpal
>     arm/gumstix


--=20
Alex Benn=C3=A9e
