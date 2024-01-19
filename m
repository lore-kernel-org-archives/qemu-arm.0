Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f12-20020adfb60c000000b00336b8461a5esm6331586wre.88.2024.01.19.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 04:05:59 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BD6095F8C8;
	Fri, 19 Jan 2024 12:05:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/6] hw/arm/xen_arm.c: convert DPRINTF to tracepoints
In-Reply-To: <49905a0d22aa80956645d6dd74e9bc098c56555b.1705662313.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Fri, 19 Jan 2024 13:14:21 +0200")
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
	<49905a0d22aa80956645d6dd74e9bc098c56555b.1705662313.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 19 Jan 2024 12:05:58 +0000
Message-ID: <87jzo5fryx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Eq5Y5F+1DcO7

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on tracepoints should be able to opt-in to each tracepoint and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into tracepoints.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/arm/trace-events |  7 +++++++
>  hw/arm/xen_arm.c    | 26 +++++++++++++++-----------
>  2 files changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index a6a67d5f16..e3f5d677d7 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -81,3 +81,10 @@ strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
>  strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
>  strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LB=
M mode"
>  strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"
> +
> +# xen_arm.c
> +xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created v=
irtio-mmio device %d: irq %d base 0x%lx"
> +xen_init_ram(const char *hi_xor_low, uint64_t base, uint64_t size) "Init=
ialized region xen.ram.%s: base 0x%lx size 0x%lx"
> +xen_enable_tpm_not_found(void) "Couldn't find tmp0 backend"
> +xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%lx"
> +xen_arm_init(const char *msg) "%s"
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index a5631529d0..a024117d22 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -34,6 +34,7 @@
>  #include "hw/xen/xen-hvm-common.h"
>  #include "sysemu/tpm.h"
>  #include "hw/xen/arch_hvm.h"
> +#include "trace.h"
>=20=20
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> @@ -91,8 +92,9 @@ static void xen_create_virtio_mmio_devices(XenArmState =
*xam)
>=20=20
>          sysbus_create_simple("virtio-mmio", base, irq);
>=20=20
> -        DPRINTF("Created virtio-mmio device %d: irq %d base 0x%lx\n",
> -                i, GUEST_VIRTIO_MMIO_SPI_FIRST + i, base);
> +        trace_xen_create_virtio_mmio_devices(i,
> +                                             GUEST_VIRTIO_MMIO_SPI_FIRST=
 + i,
> +                                             base);
>      }
>  }
>=20=20
> @@ -117,15 +119,13 @@ static void xen_init_ram(MachineState *machine)
>      memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
>                               GUEST_RAM0_BASE, ram_size[0]);
>      memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
> -    DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
> -            GUEST_RAM0_BASE, ram_size[0]);
> +    trace_xen_init_ram("lo", GUEST_RAM0_BASE, ram_size[0]);
>=20=20
>      if (ram_size[1] > 0) {
>          memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memor=
y,
>                                   GUEST_RAM1_BASE, ram_size[1]);
>          memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
> -        DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n=
",
> -                GUEST_RAM1_BASE, ram_size[1]);
> +        trace_xen_init_ram("hi", GUEST_RAM1_BASE, ram_size[1]);
>      }

I wonder if a single trace_xen_init_ram(machine->ram_size) at the top
would be better as everything can be inferred from that.

>  }
>=20=20
> @@ -158,7 +158,7 @@ static void xen_enable_tpm(XenArmState *xam)
>=20=20
>      TPMBackend *be =3D qemu_find_tpm_be("tpm0");
>      if (be =3D=3D NULL) {
> -        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        trace_xen_enable_tpm_not_found();

This smells like it should be an error_report (or maybe warn_report) as
its a misconfiguration the user/tools should know about.

>          return;
>      }
>      dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> @@ -168,7 +168,7 @@ static void xen_enable_tpm(XenArmState *xam)
>      sysbus_realize_and_unref(busdev, &error_fatal);
>      sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
>=20=20
> -    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_add=
r);
> +    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
>  }
>  #endif
>=20=20
> @@ -179,8 +179,11 @@ static void xen_arm_init(MachineState *machine)
>      xam->state =3D  g_new0(XenIOState, 1);
>=20=20
>      if (machine->ram_size =3D=3D 0) {
> -        DPRINTF("ram_size not specified. QEMU machine started without IO=
REQ"
> -                "(no emulated devices including Virtio)\n");
> +        trace_xen_arm_init("ram_size not specified. "
> +                           "QEMU machine started "
> +                           "without IOREQ "
> +                           "(no emulated devices"
> +                           "including Virtio)");

again at least an warn_report...

>          return;
>      }
>=20=20
> @@ -194,7 +197,8 @@ static void xen_arm_init(MachineState *machine)
>      if (xam->cfg.tpm_base_addr) {
>          xen_enable_tpm(xam);
>      } else {
> -        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\=
n");
> +        trace_xen_arm_init("tpm-base-addr is not provided."
> +                           "TPM will not be enabled");

warn_report.

>      }
>  #endif
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
