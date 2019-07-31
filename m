Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5254676wrv;
        Tue, 30 Jul 2019 23:34:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzssNTQtCxSdmGTlBG6VOzSdalS6v3VQmGYh9Uv9vDx4ZnNGxZsM/rTpdNHjtlQJ7v6IYpE
X-Received: by 2002:a17:906:418:: with SMTP id d24mr94643702eja.258.1564554865390;
        Tue, 30 Jul 2019 23:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564554865; cv=none;
        d=google.com; s=arc-20160816;
        b=dqUIp6K/EEERuWN3W/NbLoVEsRr0uyLMkVKwCwFQx6tNqIlEZWEa2r8PUkJ2s7xjUa
         QX8rysxHy/TkqtXBD7mf6554o9vIh6TNXLRDzdXG/GG1dTbL9GKJdwHDwM51lr2/gZ9B
         qTR2+mb83biNmv77Psm2Ebmhbh+xuWsUmNbc0bbskeWPANyXgHaQXH9nIcKyd7lQZMrf
         Xn9Bbrp5dsV4fZBB2bz+AN5lXxNQ8A+Vuj2YbkwOgXpavPEVO54nFLRFImthsSUMxCeK
         VkyYpjTlQnq/y4WjA0kj4VykE/HH9mdzcXbKEq4HMi0sSTn9dcGGiD8LjoxidyQ5cwHY
         IqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ogXZEvZUL+GX7EZrAQ6DYmN/QTZRSV5qEqyYEneh9ew=;
        b=Zw8w9/jf/wiOGxQUDU1+Bufcq6+/62CFpDbplFCo9ZCK2mvfyjsAK3N2tdGfBspGVN
         bD5Re1MKDxpSXEfTrc+9cYmczduTq8KHWKY58JZMZG9MVsZtutHg4FvNfYu96Jcm5uXv
         0BXlBk65I1abIClIUf6tt48UT8q9ECE95PsmApXMWKtEQY4z+jWLzgWaJ2RzC/GIgiRM
         6pidYl0uI0AWe3m6jH7uhMAfh9BRZB2BDx9ZkpO/IvLyxxb5Q10i8mFYbTFrUMLxXNIa
         MvXQIxFKDeHUN51DpEHTMJsTEAWsZ6ZiJiLoYQhKf2V7/1h8W0PZtKrZCR4/NCs5al3Y
         8Hsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=C5HVez2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si17508388ejo.306.2019.07.30.23.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 23:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=C5HVez2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsiBq-0003gV-E0
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 02:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hsiBQ-0003OG-Pe
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 02:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hsiBN-0000MJ-9A
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 02:33:54 -0400
Received: from ozlabs.org ([203.11.71.1]:41985)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hsiBM-00085T-Ip; Wed, 31 Jul 2019 02:33:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45z3Xk6gQ1z9sND; Wed, 31 Jul 2019 16:33:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564554822;
 bh=29ai3ILc/EcKe7R0bLUQp9FTyRHWOu86Sxlqb+PMQ6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5HVez2eUzeO4FL3VwpAH7HFYa3w7lqQeLg712rkZm8p54QGd2bojRGVU4YBaGiM/
 LKj4kF2RhPp5wjeMdzCozSG8eznwzCenC8uFsVRDteUvEYqrHSaykcZS70FxlPbsRH
 3lGwU9kWqwOtJSlgb+O3cmqA5geZ6puBpzyLuztc=
Date: Wed, 31 Jul 2019 16:08:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190731060850.GE2032@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-7-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline
In-Reply-To: <20190729145654.14644-7-damien.hedde@greensocs.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH v3 06/33] add the vmstate description for
 device reset state
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xA8ZrX2cKJe9


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 04:56:27PM +0200, Damien Hedde wrote:
> It contains the resetting counter and cold flag status.
>=20
> At this point, migration of bus reset related state (counter and cold/warm
> flag) is handled by parent device. This done using the post_load
> function in the vmsd subsection.
>=20
> This is last point allow to add an initial support of migration with part=
 of
> qdev/qbus tree in reset state under the following condition:
> + time-lasting reset are asserted on Device only
>=20
> Note that if this condition is not respected, migration will succeed and
> no failure will occurs. The only impact is that the resetting counter
> of a bus may lower afer a migration.
>=20
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/Makefile.objs  |  1 +
>  hw/core/qdev-vmstate.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 hw/core/qdev-vmstate.c
>=20
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index d9234aa98a..49e9be0228 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -4,6 +4,7 @@ common-obj-y +=3D bus.o reset.o
>  common-obj-y +=3D resettable.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
> +common-obj-$(CONFIG_SOFTMMU) +=3D qdev-vmstate.o
>  # irq.o needed for qdev GPIO handling:
>  common-obj-y +=3D irq.o
>  common-obj-y +=3D hotplug.o
> diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
> new file mode 100644
> index 0000000000..07b010811f
> --- /dev/null
> +++ b/hw/core/qdev-vmstate.c
> @@ -0,0 +1,45 @@
> +/*
> + * Device vmstate
> + *
> + * Copyright (c) 2019 GreenSocs
> + *
> + * Authors:
> + *   Damien Hedde
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev.h"
> +#include "migration/vmstate.h"
> +
> +static bool device_vmstate_reset_needed(void *opaque)
> +{
> +    DeviceState *dev =3D (DeviceState *) opaque;
> +    return dev->resetting !=3D 0;
> +}
> +
> +static int device_vmstate_reset_post_load(void *opaque, int version_id)
> +{
> +    DeviceState *dev =3D (DeviceState *) opaque;
> +    BusState *bus;
> +    QLIST_FOREACH(bus, &dev->child_bus, sibling) {
> +        bus->resetting =3D dev->resetting;

Having redundant copies of the resetting bit in the bridge and every
bus instance seems kind of bogus.

> +        bus->reset_is_cold =3D dev->reset_is_cold;
> +    }
> +    return 0;
> +}
> +
> +const struct VMStateDescription device_vmstate_reset =3D {
> +    .name =3D "device_reset",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .needed =3D device_vmstate_reset_needed,
> +    .post_load =3D device_vmstate_reset_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(resetting, DeviceState),
> +        VMSTATE_BOOL(reset_is_cold, DeviceState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1BMHIACgkQbDjKyiDZ
s5IPkRAA3qZhu/RLWXmjjSlPGlNqZSJgaD+8gmEZQVU3r+1GtTrLpLPOuMtoFRLZ
qNpvHPtIB8vWd40A1w9igbVKK0cYbAjlmPCRy1rauFyZuWy1KQF9sQFJx/ZmDk0S
0OTNr2qjftIcOsNcD48V65WSNmIT+vAFkAFUlHhM24FHLuX57EcjxAcZBRPDIePB
7iu9eTBOa+VN1Y29+iRfqQgL1lYGdwRyn4+5QOfcoRczNQ3OL0oeAoHWrgFa/fiu
ojWk3YvYgwT63nmoM1c/WsVqO6vWPvUX5u9c+yiL6qcfryRE0nHI8kAjFD+CN2/4
VjGc8f0SAcdkmiFOkVyEPsekxs0eeF7fn0UrTqNchcDrBHjam3nuRqyEC9X4l5Vr
R3cox9h8/mFkGhmED3SKrCovOQohrcqv0BxjVGiEu+nhsRO1Or8Mh4a0lmamQ9Mo
GOIrkNST2/hflpvf5AflwhMQUdRTjHs7A9FTHUXsYV6Q+EdFH+gbMKNrsHhzIs5o
fg9DWQlkxdhycNm/QK3FQOsAI5fTqa9rGBDeLbr+4LeEQ96aHdGYkNpRJ1dYKpkq
MOtq7Al4FOxH9MHWL15LvD6bTfK1UEMz/3glw2Rs/ry+Mx7hniM2LIQSfQM+CM6B
TQmicwGJGJb/ope9SjKEwvCpX2uKlarD3uLUPP7u2LNOmqI9fb8=
=qu7o
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
