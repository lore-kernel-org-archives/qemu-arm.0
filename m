Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id he10-20020a05600c540a00b003b4a699ce8esm11985654wmb.6.2022.12.02.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 06:58:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E05CD1FFB7;
	Fri,  2 Dec 2022 14:58:00 +0000 (GMT)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul  Durrant <paul@xen.org>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Fri, 02 Dec 2022 14:52:41 +0000
In-reply-to: <20221202030003.11441-11-vikram.garhwal@amd.com>
Message-ID: <871qphc0p3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3+vTGw9m91Fh


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
>
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>     -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
>     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpm=
s and
> provides access to TPM functionality over socket, chardev and CUSE interf=
ace.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>     mkdir /tmp/vtpm2
>     swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
>     --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &
<snip>
> +
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp =3D NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> +    if (be =3D=3D NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);

Still fails on my aarch64 Debian machine:

  FAILED: libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o=20
  cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm -I../../target=
/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/local/i=
nclude -I/usr/include/capstone -I/usr/include/spice-server -I/usr/include/s=
pice-1 -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/includ=
e -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -=
g -isystem /home/alex/lsrc/qemu.git/linux-headers -isystem linux-headers -i=
quote . -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/i=
nclude -iquote /home/alex/lsrc/qemu.git/tcg/aarch64 -pthread -U_FORTIFY_SOU=
RCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFI=
LE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wm=
issing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-decl=
aration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k=
 -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-lab=
els -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-=
dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -i=
system../../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARG=
ET=3D"aarch64-softmmu-config-target.h"' '-DCONFIG_DEVICES=3D"aarch64-softmm=
u-config-devices.h"' -MD -MQ libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.=
o -MF libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o.d -o libqemu-aarch64-=
softmmu.fa.p/hw_arm_xen_arm.c.o -c ../../hw/arm/xen_arm.c
  ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_tpm=E2=80=99:
  ../../hw/arm/xen_arm.c:126:32: error: =E2=80=98GUEST_TPM_BASE=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98GUEST_RAM_BASE=
=E2=80=99?
    126 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
        |                                ^~~~~~~~~~~~~~
        |                                GUEST_RAM_BASE
  ../../hw/arm/xen_arm.c:126:32: note: each undeclared identifier is report=
ed only once for each function it appears in
  [2082/3246] Compiling C object libqemu-aarch64-softmmu.fa.p/hw_xen_xen-ma=
pcache.c.o
  [2083/3246] Compiling C object libqemu-aarch64-softmmu.fa.p/hw_xen_xen-hv=
m-common.c.o
  ninja: build stopped: subcommand failed.
  make: *** [Makefile:165: run-ninja] Error 1

> +
> +    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
> +#endif
> +}

If there is a minimum required version for TPM then it needs to be
picked up by configure.

--=20
Alex Benn=C3=A9e
