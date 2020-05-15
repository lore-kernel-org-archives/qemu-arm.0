Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g10sm2704455wrx.4.2020.05.15.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 02:54:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1EDE31FF7E;
	Fri, 15 May 2020 10:54:12 +0100 (BST)
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-4-peter.maydell@linaro.org>
User-agent: mu4e 1.4.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/5] docs/system: Document Arm Versatile Express boards
In-reply-to: <20200507151819.28444-4-peter.maydell@linaro.org>
Date: Fri, 15 May 2020 10:54:12 +0100
Message-ID: <87k11dcym3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4BALSQ6CPHJ9


Peter Maydell <peter.maydell@linaro.org> writes:

> Provide a minimal documentation of the Versatile Express boards
> (vexpress-a9, vexpress-a15).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 60 ++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst   |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 62 insertions(+)
>  create mode 100644 docs/system/arm/vexpress.rst
>
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> new file mode 100644
> index 00000000000..7f1bcbef078
> --- /dev/null
> +++ b/docs/system/arm/vexpress.rst
> @@ -0,0 +1,60 @@
> +Arm Versatile Express boards (``vexpress-a9``, ``vexpress-a15``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +QEMU models two variants of the Arm Versatile Express development
> +board family:
> +
> +- ``vexpress-a9`` models the combination of the Versatile Express
> +  motherboard and the CoreTile Express A9x4 daughterboard
> +- ``vexpress-a15`` models the combination of the Versatile Express
> +  motherboard and the CoreTile Express A15x2 daughterboard
> +
> +Note that as this hardware does not have PCI, IDE or SCSI,
> +the only available storage option is emulated SD card.
> +
> +Implemented devices:
> +
> +- PL041 audio
> +- PL181 SD controller
> +- PL050 keyboard and mouse
> +- PL011 UARTs
> +- SP804 timers
> +- I2C controller
> +- PL031 RTC
> +- PL111 LCD display controller
> +- Flash memory
> +- LAN9118 ethernet
> +
> +Unimplemented devices:
> +
> +- SP810 system control block
> +- PCI-express
> +- USB controller (Philips ISP1761)
> +- Local DAP ROM
> +- CoreSight interfaces
> +- PL301 AXI interconnect
> +- SCC
> +- System counter
> +- HDLCD controller (``vexpress-a15``)
> +- SP805 watchdog
> +- PL341 dynamic memory controller
> +- DMA330 DMA controller
> +- PL354 static memory controller
> +- BP147 TrustZone Protection Controller
> +- TrustZone Address Space Controller
> +
> +Other differences between the hardware and the QEMU model:
> +
> +- QEMU will default to creating one CPU unless you pass a different
> +  ``-smp`` argument
> +- QEMU allows the amount of RAM provided to be specified with the
> +  ``-m`` argument
> +- QEMU defaults to providing a CPU which does not provide either
> +  TrustZone or the Virtualization Extensions: if you want these you
> +  must enable them with ``-machine secure=3Don`` and ``-machine
> +  virtualization=3Don``
> +- QEMU provides 4 virtio-mmio virtio transports; these start at
> +  address ``0x10013000`` for ``vexpress-a9`` and at ``0x1c130000`` for
> +  ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
> +  provided on the command line then QEMU will edit it to include
> +  suitable entries describing these transports for the guest.

TIL ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
