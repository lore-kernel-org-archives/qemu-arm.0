Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2215958lfg;
        Sun, 2 May 2021 17:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0iAe8ygcYmqEGKPj0WuIYxWYdbDvX+cmzU1t8e/ZKiHKcFBfTA1VwLsdVyvoO9f6IHTvZ
X-Received: by 2002:a05:6e02:13d0:: with SMTP id v16mr14085824ilj.8.1620002421478;
        Sun, 02 May 2021 17:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620002421; cv=none;
        d=google.com; s=arc-20160816;
        b=Lci1NRd+i0BE240Ehs24qEkyftqTGNYaEsc9v6/kMVF+eHNMXdSSrg8G3SmI50RMwn
         kpdGAKWmh7hieCpIhxVnvgZ5bvSMhuYdVYl0iP/kLx/EHwtTZKUURDkC1kCZjb6t+uus
         DG23ByWvlXTdYE575eQ7HNuTH+cx26gIihrSgdnj78TJuo3bgR6KWQ6FVHrs4WzQR0tX
         +L0g419FDpmJRU88e6N1de7hsFHE0ahMH/duvknsSRPhPyTJijOeuNUQs52QZe29Phws
         wxdNpuE8SF4G+iq3+cQ07LZZ1Z7glR2vZr1zpXr29B/KOdLbxWFXdoZMxoevlFqSWca1
         gn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ISWHyAydSoyW7zUDQqskD8Tr9rFGyqH39WbOCOiOWXs=;
        b=RRj+2Wei5EFXpwg0gxj42wND4RIn6ZT+d8Y289eTdpmyAYCib8EUHxvVqJcg4S5TK1
         l8xdBNqg4u9agViXsrgI0/2AMKd9zX5k4O/RwkHYKV4J2Z3AWDZjjxFD3duC+cFSnPGX
         /q+k0ej4ndHmBRQykBaigVvHfb2reLmH9Z0AvHzS9sx+mluD3OWRhB/vHi4qP1wHEt22
         DvJvnnCz7DKoG1F6yzLPsjGVsCUgLWL4iYslqLWYm3XzAMvYFFDYVHx9Y28niRABHyAP
         JNM+ZZsmPyfTUXaBJxIdtXRn1gzCYUGuTD9eN0Et17oPFtwr0Y8717PhWFE8FvM6Q0Bs
         yMjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=A7Jy52v1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si13164137iow.16.2021.05.02.17.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 17:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=A7Jy52v1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldMdI-00027h-ML
	for alex.bennee@linaro.org; Sun, 02 May 2021 20:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldMd4-00027E-Tf; Sun, 02 May 2021 20:40:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37539 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldMd1-0007PP-Rw; Sun, 02 May 2021 20:40:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYPJ6125Zz9sTD; Mon,  3 May 2021 10:39:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620002390;
 bh=Zwledic2kIhKs6Aw12Fliq7h3cIPAKPT/pHAIDt9ymA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7Jy52v1nwGVZclCxbZRYUzH/KsjT2x8MiLVS6WpGpoig62IB3HMztUr+Iegf6fVj
 x6UP3aFFv4RDEWWznzbRTJoEnvmnOnoF7hbgB+IH0aDimz/fBrtLEHvsGb1fIETWb2
 MHekVvV026U+ofHE+GlRiemtHXEIXeVx8s1XLnvE=
Date: Mon, 3 May 2021 10:18:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 2/3] hw/pci-host/raven: Manually reset the OR_IRQ device
Message-ID: <YI9BU90w8s7akEZF@yekko>
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C/McwL+Wukj8oqWe"
Content-Disposition: inline
In-Reply-To: <20210502203121.630944-3-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ekJlSFVo0iMZ


--C/McwL+Wukj8oqWe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 02, 2021 at 10:31:20PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Add the raven_pcihost_reset() handler to manually reset the OR IRQ.
>=20
> Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba97..7481bbf99d4 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, i=
nt level)
>      s->contiguous_map =3D level;
>  }
> =20
> +static void raven_pcihost_reset_enter(Object *obj, ResetType type)
> +{
> +    PREPPCIState *s =3D RAVEN_PCI_HOST_BRIDGE(obj);
> +
> +    if (!s->is_legacy_prep) {
> +        device_cold_reset(DEVICE(&s->or_irq));
> +    }
> +}
> +
>  static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>  {
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
> @@ -419,11 +428,13 @@ static Property raven_pcihost_properties[] =3D {
>  static void raven_pcihost_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> =20
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->realize =3D raven_pcihost_realizefn;
>      device_class_set_props(dc, raven_pcihost_properties);
>      dc->fw_name =3D "pci";
> +    rc->phases.enter =3D raven_pcihost_reset_enter;
>  }
> =20
>  static const TypeInfo raven_pcihost_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C/McwL+Wukj8oqWe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPQVEACgkQbDjKyiDZ
s5Jc2xAAk8uUyxWcYVHoquuHLpoTIZF0q25RSmkgMRb/ZznY1XQ9nX2i/ROzTYuq
ycPJzLzLEIQFL455hPRdpb7vzXdDDM0CGkZfI8ZIwlW5qqqaqP5OBuROJ9PP7XwU
xFpZqRvGesZs6EQnBlafhw5H6+lQeltP37037mByxXoFjgDSUVn6XxXFRg1F4FVm
ZRegR9MdGmVvM/W9oRcZMoxTnRsYWmlKP7vkjrib/tKYkU7bOkXtSoxqDkG4m5/4
o3UrWo/mYYgWdhICvC14P006VqK/qdxH2T0zruaZZP4Y6WIa5BZ9uHhOJRwkwK5G
e76hM/J1/nj3JenBTB9FRNriaqXMHuGNeDN9uHGfWhrxIIehJx5WjxwGg2sskyo2
ucP9qsISqR+rAwZiL7YQXk0u6QOCQkqLePnqoHa5kgz27Kjkqf5XCBB3w3Bi16/X
E3fI6D+lU2RGpO50UD8hzAd6YlgYrL1GxCnvd3ALOEcYY0GBPpWOLpSsiEO1OCxr
7opnA77Lr6uBU1lRn0WK4oTaMZbR8oOw1fmB3yUAXlC5PzXYu/JZNxeyQeBIcJh5
8FhDDCgPNL5QHKR2fQZsULcG4HVbsCi7IEHm8Bf6P/r4IH6GKNo5qxgxcCknk3ej
3B4KAJV7EsKkCNucTS5AC3xFE0GhCEXHaWlYGgWLhWWzdQxNwOQ=
=OAtD
-----END PGP SIGNATURE-----

--C/McwL+Wukj8oqWe--
