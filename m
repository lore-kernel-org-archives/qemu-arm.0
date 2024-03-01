Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id iv20-20020a05600c549400b00412a2831806sm9315115wmb.5.2024.03.01.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:10:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC78B5F7B4;
	Fri,  1 Mar 2024 17:10:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: <qemu-devel@nongnu.org>,  <sstabellini@kernel.org>,  <jgross@suse.com>,
  Peter Maydell <peter.maydell@linaro.org>,  "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v3 7/7] hw: arm: Add grant mapping.
In-Reply-To: <20240227223501.28475-8-vikram.garhwal@amd.com> (Vikram Garhwal's
	message of "Tue, 27 Feb 2024 14:35:01 -0800")
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
	<20240227223501.28475-8-vikram.garhwal@amd.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Fri, 01 Mar 2024 17:10:28 +0000
Message-ID: <87il25514r.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 71mX5Ef9jlDY

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Enable grant ram mapping support for Xenpvh machine on ARM.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  hw/arm/xen_arm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 32776d94df..b5993ef2a6 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -125,6 +125,9 @@ static void xen_init_ram(MachineState *machine)
>                                   GUEST_RAM1_BASE, ram_size[1]);
>          memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
>      }
> +
> +    DPRINTF("init grant ram mapping for XEN\n");

I don't think we need the DPRINTF here (there others where recently
converted to trace-points although I suspect a memory_region tracepoint
would be a better place to capture this).

> +    ram_grants =3D *xen_init_grant_ram();
>  }
>=20=20
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
