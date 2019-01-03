Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp368270wrt;
        Wed, 2 Jan 2019 23:56:40 -0800 (PST)
X-Received: by 2002:a1c:43:: with SMTP id 64mr39619844wma.72.1546502200724;
        Wed, 02 Jan 2019 23:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546502200; cv=none;
        d=google.com; s=arc-20160816;
        b=H9oU8HfjY977OjG6vrPARbokn3E00/7yamOGXbgsFIGkHj+CGnqdb0RLQWTM7EjpU3
         kM0CiI4rUvg1J8pXhieP86tp2ZEaZrvKXChhjA1IoKIwC/EhvSM68xWgJ3SJCb/9iaJQ
         wTiOAA1764ZKt1anTHAwwp7GHZLMT/vFfM462HBpBcHL0G1+ny+8HzTikJA59fKHBoUF
         U91PFfQdA5Jrb7dBenl0Rqv/bntgDzkg2v4eZhy5kO7ku02CHJG2UpWY1RacWJ2N5jqY
         EFKDKvcPYESjDcn7eG1FJBAt9yjzoIJEzRTejJS5u7Emw2KSxjREE8PT92MFrIa9uPBJ
         B0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=Mom+Aivwo/6SAQQozIlFRehGgvayItmX6sq5yhsIoMU=;
        b=SaHwp4wlM8ZxMxPjEgqeM4Wn+xbUPpCiAa7rSc+1J2qAAi/iwmkDtKrA53XWJt2K6F
         +nx7baQn+YpPoWPRS7jrSuBldMyZahFO2rL3gFHGBb8/wAfkTs/SO9Nqkb2Gn32TxgF6
         ntI7IgpHqnA92sYQOcx0GrQ9UZVUzKW8gSzA8h53HWYZ0CEoxXSblNqNO3H/1KErTMcF
         zgPAEC+V8w3+A4Dpd3GBzhKxQ9B3Rs9w1yVpuJ8Aqmdz5ONVPr7EkZ+nFZ4ITuLf4Hef
         CJOgDqmgJtZOk0oJNJxPwa0DKBpJ4ioeUTQ3lsl0pieNNuM+y+WIM4hJcFm4kCoKWfKA
         8gqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H1Z1E8w+;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j10sor27713653wrx.15.2019.01.02.23.56.40
        (Google Transport Security);
        Wed, 02 Jan 2019 23:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=H1Z1E8w+;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mom+Aivwo/6SAQQozIlFRehGgvayItmX6sq5yhsIoMU=;
        b=H1Z1E8w+WgcAi/Uo6EZS02Kj+cbg17bdTrpBW5cQTqkDr5G3d0AwTNtnDYZZipBBzD
         PFhhuAm3BPPDEGt6kjcBVZCztye9IGxtKDDvB9EU9RprIuZpHk/klnUNRc8dzCN90B+h
         th7tQqsx5WHO8TbDLWvHsEWxrjh+O8c2YY2sQpAzFQMZ18CtxzsNZOCJ0qWMsdWCxuVN
         +YRsxYTqSyoBq4Ph6cyaFKyN0+Ua8Lwcb/t0Wg6fH2h/3nbE1QfewaXxJeRnG7i37XTv
         5VVP0JzDiyBQ++xFI3tqdwt43VqPkFoJQCtGXBi+UwnO8Ojczdc3ChwBU67l3sCtkPgV
         infw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mom+Aivwo/6SAQQozIlFRehGgvayItmX6sq5yhsIoMU=;
        b=OnLFBATtju3wBnsstRSJu+gbDoBiSExFDieBS62Qn8DNI6ScRm1s4LPi7oNy8YDkZK
         aH5pqM2yztVhuLVTHJ4MxPDhw+XQPuP5vgYUqJw5uH+GA9KO3y+rXkwEZ/sNXngXvOd6
         Zn0Q1S4ZTHbvR58FAuVADVvpQTOyFv7D8kqOfL7LWFtRkIqOE4T/V3ZKoM5tq3bXG0pP
         XgZnl7e+tzi/mXXgofB0YVAuHjHoBGw9y7ffpxR4Z+k/e/C7Xb709wyNeiJfYhs2v496
         YQs5mb0kR1durLH48XC0sZfUfKjz8Wn/HTvYumDRKQkznOQE69OqNsYHPEjWbXqWwFQM
         1ezQ==
X-Gm-Message-State: AJcUukdGkJAcAr5jHp3rq8dA/AUchw1j0lIsDGGUVU58ONsOI93OwR7/
	VuxnXEl1/TOpY6oU4Mahumt/MoZiZWI=
X-Google-Smtp-Source: ALg8bN4orEYyCiTDc7mIQEl0t7ioW1hbLy5czSOdS8TdpnUlUOT3FYeEZ5TVUG6AzNP7iEGN3xJ7nA==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr43029280wrr.67.1546502200012;
        Wed, 02 Jan 2019 23:56:40 -0800 (PST)
Return-Path: <stefanha@gmail.com>
Received: from localhost ([51.15.41.238])
        by smtp.gmail.com with ESMTPSA id y34sm125192223wrd.68.2019.01.02.23.56.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jan 2019 23:56:38 -0800 (PST)
Date: Thu, 3 Jan 2019 07:56:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jim@groklearning.com,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, jusual@mail.ru
Subject: Re: [Qemu-devel] [PATCH] microbit: make -kernel optional
Message-ID: <20190103075638.GA5724@stefanha-x1.localdomain>
References: <20181214145152.27250-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20181214145152.27250-1-stefanha@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: YPDA8Rs+6MkL


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 02:51:52PM +0000, Stefan Hajnoczi wrote:
> ARMv7M machine types support -kernel for ELF and raw image files.
> Microbit programs are typically in Intel HEX (.hex) format.  The generic
> loader supports .hex files but it doesn't work as expected:
>=20
>   $ qemu-system-arm -M microbit -device loader,file=3Dmicrobit.hex
>   Guest image must be specified (using -kernel)
>=20
> This error comes from armv7m_load_kernel() but we don't have -kernel in
> this case.
>=20
> This patch makes -kernel optional since most of the time we'll want to
> use -device loader instead.
>=20
> Note that we need to register the reset handler that
> armv7m_load_kernel() used to register for us.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/microbit.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Ping

> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index a734e7f650..638f638792 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
> +#include "qemu/error-report.h"
> =20
>  #include "hw/arm/nrf51_soc.h"
> =20
> @@ -28,6 +29,13 @@ typedef struct {
>  #define MICROBIT_MACHINE(obj) \
>      OBJECT_CHECK(MicrobitMachineState, obj, TYPE_MICROBIT_MACHINE)
> =20
> +static void microbit_cpu_reset(void *opaque)
> +{
> +    ARMCPU *cpu =3D opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
>  static void microbit_init(MachineState *machine)
>  {
>      MicrobitMachineState *s =3D MICROBIT_MACHINE(machine);
> @@ -41,8 +49,13 @@ static void microbit_init(MachineState *machine)
>                               &error_fatal);
>      object_property_set_bool(soc, true, "realized", &error_fatal);
> =20
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       NRF51_SOC(soc)->flash_size);
> +    if (machine->kernel_filename) {
> +        armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                           NRF51_SOC(soc)->flash_size);
> +    } else {
> +        /* armv7m_load_kernel() does this, we need to do it manually her=
e */
> +        qemu_register_reset(microbit_cpu_reset, ARM_CPU(first_cpu));
> +    }
>  }
> =20
>  static void microbit_machine_class_init(ObjectClass *oc, void *data)
> --=20
> 2.19.2
>=20
>=20

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLcA1AAoJEJykq7OBq3PIoTEH/2xOAU0P4RebFVcOUsh7+uPc
Czfr0L5zoXelNYWU26F8xg7NeQpMGLISAfvVGfL68ptTdYLlVmCj07JUX1qcw0UL
oU/KW2ZYh8ugCGmklCjj8LIpCfiMrBlBh6p8Tgd99g4f4VG4FSaRpXhlpVd5mRQN
tPla/NqMZ/21G6b5vzCEqLFlHN/fCVNcGYQhH+HaP3CmRU8xoMdtwLnnQntWpmXn
z9sZRTIg0Yn1sefCmcdATZwWNlsMbzzsP/FPa3vZaECmNVMJzcXJ9xx3/2qb+xYt
nvGG3a/bbk4EUdeuJ3ROU9nTmKhUHZ3SksQQIO/dYL8mn78fnHpzP+IXGMNlPoE=
=H6T4
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
