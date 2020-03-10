Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n1sm21145923wrj.77.2020.03.10.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 07:54:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3E3B61FF7E;
	Tue, 10 Mar 2020 14:54:14 +0000 (GMT)
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-4-peter.maydell@linaro.org>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/5] docs/system/target-arm.rst: Add some introductory text
In-reply-to: <20200309215818.2021-4-peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 14:54:14 +0000
Message-ID: <877dzsi7l5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: w5Z+6bVYDxFo


Peter Maydell <peter.maydell@linaro.org> writes:

> Now we've moved the various bits of per-board documentation into
> their own files, the top level document is a little bare. Add
> some introductory information, including a note that many
> of the board models we support are currently undocumented.
>
> (Most sections of this new text were originally written by me
> for the wiki page https://wiki.qemu.org/Documentation/Platforms/ARM)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> ---
>  docs/system/target-arm.rst | 66 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index c7df6fc1f97..86ea6f2f568 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -1,9 +1,71 @@
>  .. _ARM-System-emulator:
>=20=20
> -ARM System emulator
> +Arm System emulator
>  -------------------
>=20=20
> -Use the executable ``qemu-system-arm`` to simulate a ARM machine.
> +QEMU can emulate both 32-bit and 64-bit Arm CPUs. Use the
> +``qemu-system-aarch64`` executable to simulate a 64-bit Arm machine.
> +You can use either ``qemu-system-arm`` or ``qemu-system-aarch64``
> +to simulate a 32-bit Arm machine: in general, command lines that
> +work for ``qemu-system-arm`` will behave the same when used with
> +``qemu-system-aarch64``.
> +
> +QEMU has generally good support for Arm guests. It has support for
> +nearly fifty different machines. The reason we support so many is that
> +Arm hardware is much more widely varying than x86 hardware. Arm CPUs
> +are generally built into "system-on-chip" (SoC) designs created by
> +many different companies with different devices, and these SoCs are
> +then built into machines which can vary still further even if they use
> +the same SoC. Even with fifty boards QEMU does not cover more than a
> +small fraction of the Arm hardware ecosystem.
> +
> +The situation for 64-bit Arm is fairly similar, except that we don't
> +implement so many different machines.
> +
> +As well as the more common "A-profile" CPUs (which have MMUs and will
> +run Linux) QEMU also supports "M-profile" CPUs such as the Cortex-M0,
> +Cortex-M4 and Cortex-M33 (which are microcontrollers used in very
> +embedded boards). For most boards the CPU type is fixed (matching what
> +the hardware has), so typically you don't need to specify the CPU type
> +by hand, except for special cases like the ``virt`` board.
> +
> +Choosing a board model
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +For QEMU's Arm system emulation, you must specify which board
> +model you want to use with the ``-M`` or ``--machine`` option;
> +there is no default.
> +
> +Because Arm systems differ so much and in fundamental ways, typically
> +operating system or firmware images intended to run on one machine
> +will not run at all on any other. This is often surprising for new
> +users who are used to the x86 world where every system looks like a
> +standard PC. (Once the kernel has booted, most userspace software
> +cares much less about the detail of the hardware.)
> +
> +If you already have a system image or a kernel that works on hardware
> +and you want to boot with QEMU, check whether QEMU lists that machine
> +in its ``-machine help`` output. If it is listed, then you can probably
> +use that board model. If it is not listed, then unfortunately your image
> +will almost certainly not boot on QEMU. (You might be able to
> +extract the filesystem and use that with a different kernel which
> +boots on a system that QEMU does emulate.)
> +
> +If you don't care about reproducing the idiosyncrasies of a particular
> +bit of hardware, such as small amount of RAM, no PCI or other hard
> +disk, etc., and just want to run Linux, the best option is to use the
> +``virt`` board. This is a platform which doesn't correspond to any
> +real hardware and is designed for use in virtual machines. You'll
> +need to compile Linux with a suitable configuration for running on
> +the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and
> +large amounts of RAM. It also supports 64-bit CPUs.
> +
> +Board-specific documentation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Unfortunately many of the Arm boards QEMU supports are currently
> +undocumented; you can get a complete list by running
> +``qemu-system-aarch64 --machine help``.
>=20=20
>  .. toctree::


--=20
Alex Benn=C3=A9e
