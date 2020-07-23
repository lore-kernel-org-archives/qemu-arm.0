Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288918lfm;
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymALfeNIK6l+FWVuiEBK7qsNbpXxfBWzg2FZ++ndVvji7A8hu2ZHzuWqbFJSToWTAK1VfX
X-Received: by 2002:a63:fe42:: with SMTP id x2mr2458045pgj.207.1595473727316;
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473727; cv=none;
        d=google.com; s=arc-20160816;
        b=NzCBzVnhZIWLAlyGRsZrIw9uG+2nv6mbQIOAGLhBMQaAO2aUo7PEacHKQtmMeO3joO
         HemBC6cGxD7WtoX182j4X6mC1rBp/wDc8co+/rJJAVXh2mjWZFrcUWMZAwX2Ecl3FJEP
         kqm6yHhb4FRT7ky6gRp88wjgVyscXgDGHFRBB9kxVYLC2HBgfKNoJ/mgrOeSjKf6biSL
         FmuPvrfjvynB6virZ+QbvYnZ2GGBRahcdbhtz95oIkawcDGmBiH8hQSmQI2lVcannGaU
         YoI4yuU2gea3UgzsuC7eNvkyjQdmRA8VSNZzeWb5m3xfBDUngef8ycwOM5FLKBlIqHkX
         mdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=rH2QqCTYALRXFkBo5Vcnc0yV25SzPyKQxqIzuGgmOZ0=;
        b=Y7Il+rH4w8xcFmp/i60B1oR20gHRSkLCOIes/Iz6z9uUbVFd0seg2G8ynUV85GY8oB
         202BWXUbtZVYP6vxois0QOuxgGzGq9xM8f/hWHvdorgruxm7+4a0r/rQe8jBMqH648/W
         oobEPmIbKiNg448CoUDycRRX3V5a1qQsIaNH/+aio92mfReizIKzikFpkzgmJ+lPbXPg
         IY7B8AoM2p/B391o6DZwd9TLfZSWCKR12wrA3fN7zTRPXDRuj5p1M3TUkcdV2sSdqJ7x
         UXZLEmMBeqCspUoT+skSrXghbZdK/8k/so0u+GtI5/bi4Vsb/JADr+zG69xYHjlF9qZb
         HTnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=LBS807Hf;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id y2si902104pgf.108.2020.07.22.20.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=LBS807Hf;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2w0Zv1z9sSd; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473720;
	bh=7IPc2Q1fTaCeaM4LUpDehskEstA2XXUOp7aYej6dJSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBS807HfKJJsLUOK1BFWmk1dk3FoLyfXjaq8mBlGnVAHeAf3ieXxIYN2EskcM8Glb
	 cpTTOiV5BkVVkma9X04Uo9uQrG4ISNqDIjRi5DaWlkeDVJLaXDwRAjzUa72/6d4U9D
	 sElZF7m2ffp0jMiZ7CdMoLvRV7U/Ty+u3fqDY1kQ=
Date: Thu, 23 Jul 2020 13:08:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 7/8] sparc/sun4m: Use start-powered-off CPUState
 property
Message-ID: <20200723030822.GR5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-8-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2z7AKWNQ4hR/M4ga"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-8-bauerman@linux.ibm.com>
X-TUID: VU7yuR+WT3x2


--2z7AKWNQ4hR/M4ga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:56PM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
>=20
> This makes secondary_cpu_reset() unnecessary, so remove it.
>=20
> Also remove setting of cs->halted from cpu_devinit(), which seems out of
> place when compared to similar code in other architectures (e.g.,
> ppce500_init() in hw/ppc/e500.c).
>=20
> Suggested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/sparc/sun4m.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index f1d92df781..fd74e516bb 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq,=
 int level)
>  {
>  }
> =20
> -static void secondary_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu =3D opaque;
> -    CPUState *cs =3D CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted =3D 1;
> -}
> -
>  static void cpu_halt_signal(void *opaque, int irq, int level)
>  {
>      if (level && current_cpu) {
> @@ -810,7 +801,6 @@ static const TypeInfo ram_info =3D {
>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>  {
> -    CPUState *cs;
>      SPARCCPU *cpu;
>      CPUSPARCState *env;
> =20
> @@ -818,11 +808,8 @@ static void cpu_devinit(const char *cpu_type, unsign=
ed int id,
>      env =3D &cpu->env;
> =20
>      cpu_sparc_set_id(env, id);
> -    if (id !=3D 0) {
> -        qemu_register_reset(secondary_cpu_reset, cpu);
> -        cs =3D CPU(cpu);
> -        cs->halted =3D 1;
> -    }
> +    object_property_set_bool(OBJECT(cpu), "start-powered-off", id !=3D 0,
> +                             &error_abort);
>      *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr =3D prom_addr;
>  }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2z7AKWNQ4hR/M4ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/yUACgkQbDjKyiDZ
s5JsVw//fEJWBKkb5iGCm0e/sLgbwcRm7nmw+o6Uthn5eMWXAYTk5hydgF13HlGC
6PjROV2N6PtgQlWwERcuJMZ0kdTnytbKzLKXWwk7A/PIUHDNjxzc9wlTQ70rRA9G
sDrKIGsDXJP7oQ2a9RixxHTcg/LRp1HfhZAZBHHdt9Zf0rW4JVJR9xjRJ/lH64rx
6lqBQCkLuSH1ZPCZikriNwD4/olq4KAT+UMECHSkWqiYNFAWB4b7s/o963+nX6xw
lPethsUMsqIU555LGnxNS1bKlif1/254o0aZ3LRcbU5fNmUdw9RqozIvubo7d026
xwaEDDSF/kk7M3LgF/O6R7j/g2qZXxHB+PFiV8qQh0PXtmsdy7xdaRkbTiTnZRz5
A38CMxqOcCwlK1JFSEe1P/lQCZVkHOf4rakw5IAiFTpvsRB/wTuruCNxYXzJCrg5
0np4FfQPnku6PSYuMLpyHyoZlBs2nUHTIBp2qu+9YdNt4u7kxLH6A8Ui+arNN0es
M22ZeO+aaEbb5pk/XKcaVulFlueTW6rQlywZdFERSdUr6Dk98aNFSRO2ke4bPIO8
9Dn1R6T8oskzlFww0iPOALx6qe+LQHd06PWI5Jqar9sFCcwgjIum3/BIChYV/eg5
VMeu4x5vVhhp23v1Yxg/pRYJ1DRFh1T/wowBj6gxUGZ0PAxmbUE=
=l61x
-----END PGP SIGNATURE-----

--2z7AKWNQ4hR/M4ga--
