Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d43d0000000b00236733f0f98sm524419wrr.107.2022.10.27.01.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:41:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 61DFE1FFB7;
	Thu, 27 Oct 2022 09:41:18 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:40:20 +0100
In-reply-to: <20221015050750.4185-11-vikram.garhwal@amd.com>
Message-ID: <87fsf93bgx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8wjG4KcH0mJT


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
<snip>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
<snip>
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    mc->desc =3D "Xen Para-virtualized PC";
> +    mc->init =3D xen_arm_init;
> +    mc->max_cpus =3D 1;
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);

This needs #ifdef CONFIG_TPM because while doing --disable-tpm to try
and get the cross build working it then fails with:

../../hw/arm/xen_arm.c: In function =E2=80=98xen_arm_machine_class_init=E2=
=80=99:
../../hw/arm/xen_arm.c:148:48: error: =E2=80=98TYPE_TPM_TIS_SYSBUS=E2=80=99=
 undeclared (first use in this function)
  148 |     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
      |                                                ^~~~~~~~~~~~~~~~~~~
../../hw/arm/xen_arm.c:148:48: note: each undeclared identifier is reported=
 only once for each function it appears in

--=20
Alex Benn=C3=A9e
