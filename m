Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1288915lfm;
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyHEjucHbNwh4jmUbKvOlDt+CPfX9QcXW+Gz/Lgp5/lIm6v3uNavi43QlWn0fzs+UCI9Ji
X-Received: by 2002:a17:90a:f488:: with SMTP id bx8mr2305269pjb.56.1595473727482;
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473727; cv=none;
        d=google.com; s=arc-20160816;
        b=HgKgCNifYY4Kvwie4TjkCrpyDvUuuuX939dUVFpPEK6WCwW/mQqLyIa902Lyu3ZDzw
         ctz1/SwEWCsPJW8CoL4HBk27CDi694F3rjw+ZYpIUl5vntZzldjbswxXCzlCkl8tHAQP
         dVBg8XlfjiP2lk7U5JiXHMvefnCQ0JGQLXs8v/5JUKHcSLjrMIhvEyucJoMHk0r7GGWp
         fH2+m4VxUDmyW+ofml/Z3oLVwK/GNAR88mpfz1+kWt1MDoWksP2LLZDTSuUTuDv+XOc9
         emnqjo7n1DQoD/uQWvYy36zk2mK6ysc3e4pe5rd0rw5ea/8MrR8d1h2fMF48OY7ZQNdB
         WMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=BjPkGi0Y5fUoWPgOL/Pe5BEgj1TpOcIE4Rp9b+pPl7k=;
        b=W6UHw1/iwjVSOjj28NrN8uHZW0frWHKLkjwGcFH5L5Ey7pkJEHkSXtCAMrH+8DV+HS
         HCB/igpiDT96cvZsVvm9/DUSGfSwyZ6nuO8k3jkffsyBVOeBdZJkZla6wgDNEFc56gJE
         8/JtvOx8jW0WXCHSeDQbke5Txw5ECEboNlqyaZ/AWCPluXxiqwQvZeH50CfU4bSj6cly
         S/9q/oKzUa66vE8JqYhu0uvQ4N3fXXx8Q6rOKWS2ueOE0wjRQXIhzAEjVNIQBgaCoJvU
         ccs9Mfv2lbQ2qUK4n2NoHFibYtejGFkN54kpW/ISNUjTd9HJT8DHLOcf8u0K0qkqgUQv
         bHYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=b2WkPEO1;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id y9si832045plr.228.2020.07.22.20.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 20:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=b2WkPEO1;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BBy2v6JQmz9sSn; Thu, 23 Jul 2020 13:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1595473719;
	bh=/3q+qLEIXDksYPkpoztheGx/0Gg45dfxB5RFVCq5noQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2WkPEO1LNULVqHT6wDa/TavMhuFeeW0WS8QkGaa8/9zpRqt9SdnfWaXWpxAx29Rq
	 7if1wosHvnqveofLaTmgN9Mlv4Xekf/SYb6dN2e1XC9K/OfU5J+ZaJmz9KsU2uEwx1
	 exSITBfrw26TU/hmiKQJ8nxuvOvQksRJjnfM2NNY=
Date: Thu, 23 Jul 2020 13:07:41 +1000
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
Subject: Re: [PATCH v3 5/8] mips/cps: Use start-powered-off CPUState property
Message-ID: <20200723030741.GP5513@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-6-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ccJhwVfaC+fHwTsl"
Content-Disposition: inline
In-Reply-To: <20200723025657.644724-6-bauerman@linux.ibm.com>
X-TUID: hyf09R3hbuEQ


--ccJhwVfaC+fHwTsl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 11:56:54PM -0300, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/mips/cps.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
>=20
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 615e1a1ad2..d5b6c78019 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>      CPUState *cs =3D CPU(cpu);
> =20
>      cpu_reset(cs);
> -
> -    /* All VPs are halted on reset. Leave powering up to CPC. */
> -    cs->halted =3D 1;
>  }
> =20
>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
> @@ -89,6 +86,9 @@ static void mips_cps_realize(DeviceState *dev, Error **=
errp)
>              env->itc_tag =3D mips_itu_get_tag_region(&s->itu);
>              env->itu =3D &s->itu;
>          }
> +        /* All VPs are halted on reset. Leave powering up to CPC. */
> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
> +                                 &error_abort);
>          qemu_register_reset(main_cpu_reset, cpu);
>      }
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ccJhwVfaC+fHwTsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Y/v0ACgkQbDjKyiDZ
s5K9uA//d+6joOJM6ETKu6e2feviuz0xobf0FwbR2LFgh2l3nDsAtYh5Ohq2rku2
KOTiMP7j3erjw0SHphbivaNqcQrN2i9M1lKm3qWgVG+gy1R8Qp4RdV5IzDCGXvDp
hiSsyPr31FU0LfUahU26kkBa4Mv6/HWlVpstWFLUyfk1JMZdqar2EdMkCY64vSE5
eloUY5GQryor52oXIfqBrt/Ik0lWqp2wL8py11oopRO6ATlegaRV9b1Ft6Wk98X4
leiHGKnXuEsmf5gSwcoYgTFYKWtgnGZiLB3wN0QYWz7whHThM9R1OETQGIEl/GWb
nTgnwn8VeP+M+f9bZFC0wUHE45IBwHNdi1/6Usl1Uk+T/lSaEmXt1IKGDIAAEjA7
2F/GePUBfFOkESmmPr6Dphzg4Uv7+Pz9y3k8cOVUJrqRO92xYJFqVfpQE3IWwZJF
NC8K8+fM8GwLV6BtiRpfrjbVxEA/JEkaoVF+w666Lz1lT/UKWpw0XImxz/+BBf4u
OwImdh/7zWMJpNA7C33yVBk/OIfql33sQu9ZLSyZ1RgxrxdRSmDV/X9Asew4Xcmy
yUTTUnzupvdZDwlcF7KJJuKGaIy2o7p2huKJI+7jLtxIjo/mD73KsuhXriQ1n5Lz
pUCp8GFNKZm2Zjh6Sn4mTNgnPmWiNaPsUO2C4TBk8u5CscQpSlc=
=fS7F
-----END PGP SIGNATURE-----

--ccJhwVfaC+fHwTsl--
