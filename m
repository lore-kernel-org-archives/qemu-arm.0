Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u84sm4767223wmg.7.2020.07.14.07.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 07:58:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A44271FF7E;
	Tue, 14 Jul 2020 15:58:12 +0100 (BST)
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-5-peter.maydell@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH for-5.1 4/4] docs/system: Document the arm virt board
In-reply-to: <20200713175746.5936-5-peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 15:58:12 +0100
Message-ID: <871rleywhn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6XMvPpk7PWGX


Peter Maydell <peter.maydell@linaro.org> writes:

> Document the arm 'virt' board, which has been undocumented
> for far too long given that it is the main recommended board
> type for arm guests.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/virt.rst   | 157 +++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |   1 +
>  MAINTAINERS                |   1 +
>  3 files changed, 159 insertions(+)
>  create mode 100644 docs/system/arm/virt.rst
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> new file mode 100644
> index 00000000000..6a7823d8bca
> --- /dev/null
> +++ b/docs/system/arm/virt.rst
> @@ -0,0 +1,157 @@
> +'virt' generic virtual platform (``virt``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The `virt` board is a platform which does not correspond to any
> +real hardware; it is designed for use in virtual machines.
> +It is the recommended board type if you simply want to run
> +a guest such as Linux and do not care about reproducing the
> +idiosyncrasies and limitations of a particular bit of real-world
> +hardware.
> +
> +This is a "versioned" board model, so as well as the ``virt`` machine
> +type itself (which may have improvements, bugfixes and other minor
> +changes between QEMU versions) a version is provided that guarantees
> +to have the same behaviour as that of previous QEMU releases, so
> +that VM migration will work between QEMU versions. For instance the
> +``virt-5.0`` machine type will behave like the ``virt`` machine from
> +the QEMU 5.0 release, and migration should work between ``virt-5.0``
> +of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
> +is not guaranteed to work between different QEMU releases for
> +the non-versioned ``virt`` machine type.
> +
> +Supported devices
> +"""""""""""""""""
> +
> +The virt board supports:
> +
> +- Flash memory
> +- One PL011 UART
> +- An RTC
> +- The fw_cfg device that allows a guest to obtain data from QEMU
> +- A PL061 GPIO controller
> +- An optional SMMUv3 IOMMU
> +- hotpluggable DIMMs
> +- hotpluggable NVDIMs
> +- 32 virtio-mmio transport devices

We seem to miss out we also support the virtio-pci transports here.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
