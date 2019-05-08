Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4275614wrh;
        Tue, 7 May 2019 18:24:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaSHu1gsCyqxrhuzbHPBBJAyYoWTyicyfZmzmTeMIP+fAYpmagnOkX0UpBlzVXs2+L2isX
X-Received: by 2002:adf:f90c:: with SMTP id b12mr24327490wrr.63.1557278665284;
        Tue, 07 May 2019 18:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557278665; cv=none;
        d=google.com; s=arc-20160816;
        b=I8bW8faRXo4F4XTrxZdtQNE8bzqfQxJqWZjXzz7wPlpqnmy68dMM3xnOFImnZmo2KO
         3PkwGhiLlOs5IvzhLhhJVH+wxjZvL0Vw8mH2wSYtmMwL+Xb/LYRz9kd2x8ZzMo06bMiF
         Wt6SNWkXjmEY2fPrXcarllxBV69REBnhw8Rhf6O1KBXjl+V3k17fgToj7aKu2BOc0hV0
         9Rj8k10ee+n8HS+UnXXz3d6jO+gn8tqSu+4D0MNc9Yb7pGSGedTuX+qE0Q2ZUXg+C/Jf
         W81/0ZroIttKdCD+cWryZNtAh/4zQqD67nx7eDRS+dWSy3b+lDOU9M2kfP/0BJSaOoce
         Ydqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=eydRl/I27mFSBEwZv3mkKCVuliXUsaUQQTqMwQAXhmg=;
        b=0Ib5RCx0KL4COytP6cr26v1qRtHFRmH4wjgE41gYtUuHQARXODTJgW3zcP1erXB11h
         qKteLBmTiOenPrTYyYtgE2wyj52/I4GDoH6lQf8XQ2LhATlqA3CShuN3sz8y/9xvbpHk
         LSn1cpNezGtbGtEytOcSEx32RdVMnvRa3pa2PhEDBlVZ/3d9TrnmqdIeUpP94zbSiXDQ
         c/3sZfHg8+YdFa5VFmLeGa/pVIEbLI6UWeVXoeFvX2lBY4K02piXla6YfEiGc8goFD5s
         ZGK4JK2OPfd4DLWTtPApUrReYsEossmGog8x0r+258pbSmPfClsurXD3QwACvFzWnsaJ
         tJxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=XUXLd5H5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x184si445704wmg.6.2019.05.07.18.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 18:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=XUXLd5H5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOBJo-0006UC-9H
	for alex.bennee@linaro.org; Tue, 07 May 2019 21:24:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hOBJT-0006S0-09
	for qemu-arm@nongnu.org; Tue, 07 May 2019 21:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hOBJR-0001Ff-Lj
	for qemu-arm@nongnu.org; Tue, 07 May 2019 21:24:02 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48505)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hOBJQ-00013T-VF; Tue, 07 May 2019 21:24:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 44zJf22K4Zz9s3q; Wed,  8 May 2019 11:23:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557278634;
	bh=DxLFN7mtgOiWqnrEjlI2GPxmwGRfkp5LAerwEzitFiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUXLd5H53SuDik8XVVCvCNjkCzxVWPmk1n7331BeY+fOgM3kv9OMV09rNtqjaaX53
	/2143aahyaa27r5Ex10Pi0jpc2yUaOrDN5HvzE1m639BDRAUuS+LiqtP7LsEY5gFyg
	c+4MHiedg/rtrGRt+uZLi9mHD1as82vHbP1Ugd+M=
Date: Wed, 8 May 2019 11:23:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190508012316.GM7073@umbus.fritz.box>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B9BE8dkJ1pIKavwa"
Content-Disposition: inline
In-Reply-To: <20190507163416.24647-2-philmd@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 01/16] hw/ppc/pnv: Use
 object_initialize_child for correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Aleksandar Rikalo <arikalo@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eqQ6pVojV8wA


--B9BE8dkJ1pIKavwa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 06:34:01PM +0200, Philippe Mathieu-Daud=E9 wrote:
> As explained in commit aff39be0ed97:
>=20
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
>=20
> This patch was generated using the following Coccinelle script
> (with a bit of manual fix-up for overly long lines):
>=20
>  @use_object_initialize_child@
>  expression parent_obj;
>  expression child_ptr;
>  expression child_name;
>  expression child_type;
>  expression child_size;
>  expression errp;
>  @@
>  (
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                           child_type, &error_abort, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  |
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
>  +                            child_type, errp, NULL);
>      ... when !=3D parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  )
>=20
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/pnv.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index dfb4ea5742c..31aa20ee25d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -994,14 +994,12 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, =
Error **errp)
>          PnvCore *pnv_core =3D PNV_CORE(chip->cores + (i * 4) * typesize);
>          int core_id =3D CPU_CORE(pnv_core)->core_id;
> =20
> -        object_initialize(eq, sizeof(*eq), TYPE_PNV_QUAD);
>          snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
> +        object_initialize_child(OBJECT(chip), eq_name, eq, sizeof(*eq),
> +                                TYPE_PNV_QUAD, &error_fatal, NULL);
> =20
> -        object_property_add_child(OBJECT(chip), eq_name, OBJECT(eq),
> -                                  &error_fatal);
>          object_property_set_int(OBJECT(eq), core_id, "id", &error_fatal);
>          object_property_set_bool(OBJECT(eq), true, "realized", &error_fa=
tal);
> -        object_unref(OBJECT(eq));
> =20
>          pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->id),
>                                  &eq->xscom_regs);
> @@ -1165,10 +1163,9 @@ static void pnv_chip_core_realize(PnvChip *chip, E=
rror **errp)
>              continue;
>          }
> =20
> -        object_initialize(pnv_core, typesize, typename);
>          snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
> -        object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_co=
re),
> -                                  &error_fatal);
> +        object_initialize_child(OBJECT(chip), core_name, pnv_core, types=
ize,
> +                                typename, &error_fatal, NULL);
>          object_property_set_int(OBJECT(pnv_core), smp_threads, "nr-threa=
ds",
>                                  &error_fatal);
>          object_property_set_int(OBJECT(pnv_core), core_hwid,
> @@ -1180,7 +1177,6 @@ static void pnv_chip_core_realize(PnvChip *chip, Er=
ror **errp)
>                                         OBJECT(chip), &error_fatal);
>          object_property_set_bool(OBJECT(pnv_core), true, "realized",
>                                   &error_fatal);
> -        object_unref(OBJECT(pnv_core));
> =20
>          /* Each core has an XSCOM MMIO region */
>          if (!pnv_chip_is_power9(chip)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B9BE8dkJ1pIKavwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzSL4IACgkQbDjKyiDZ
s5KlIQ/8D+bNy6GErxnEOc5N9C5oPD8yIaHOQPc5zr9TrLedsd6znfqwCX2tHsSs
gvmCooJsyL5I1eKQZKH1R2Ns0EBm4suOYJXqEOgtnvT2L43hbcF3dEvVbhwzaDSQ
9KBo5doqXZ9BvztRW3jQL0Mfk0durgDsnuc8iQjT8hNJj9kLguPfGoJdcEeEldoF
Lqo/9o49VFnASfnwfb07kOFrCyMJ9JphjXl5paDob8/IiaZATZtd7ss1OjQ9LybP
4vQVJZlkdX93vqyWUKs5J2YPnFWW5i2G7Ba7i5ukbPYIVl90hnrx7iK7zcRMgye2
aURQtK9Uhta0++e+Du4cyBHACfUdpwGGhm65Zu9ccaHHgqw7i3mMgSLfahSGQQHs
b6sygusUsHGwRoGw8S9N5gtRwFTQ1yOnVR9dudkg7qOgPvHe9gfl9K8iqEFL8GJw
IKKIgKtXiVd4xkBSZIQBydKf2BCgFeswKq8Itm/Ijkz0XqXiIKCqhSfktl6/ixs8
dck8PdS81GmzsYqOLKvwDD1igDIH467IY7lgJkhZw17PWvL28vYlNTl0z/lZB+d6
PaKVvAkCSoG3B2yIhcae+ckCUz+MKkll3F4ol4ktJChHj9K2O7P8kI0VJlwVo3GN
7nlaZi6Hru7XEcXEi39yzA9Usw3CnWMIOIH/CPSqFIBvH3t7NBg=
=2xTF
-----END PGP SIGNATURE-----

--B9BE8dkJ1pIKavwa--
