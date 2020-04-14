Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4466539lfm;
        Mon, 13 Apr 2020 19:31:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypL65s13fnKbJiqkIf5+HiEL4jBgGlf+hCkXDf0u6wTh9R7bubCAurACHW4pesMlOv03tFye
X-Received: by 2002:a37:c0d:: with SMTP id 13mr16812305qkm.25.1586831488019;
        Mon, 13 Apr 2020 19:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586831488; cv=none;
        d=google.com; s=arc-20160816;
        b=O9rHQICQp5tWGGbGJz7lVexVZ/vlp3YWsg84JX1d33u67icGlclN1BaOSZggShboXp
         8Uqi+mcp8JBg5Lr6NssNO7z4vCb/MmX5LO40uP9eKB0agZs9qjD2nYzhhzOCtishVOr5
         8+h66zpNOD5wNxvsuvPNayrwz5P+64nShj7S9pAfMOXIkmcwK/JNuyOX0ljF7ac9AsIo
         JSu+9keMtK349A1YnzzGYFTrTme8ze4fu6DAX8xPg3C2OlAgyfTK3c83BBuGqk/H8Bsd
         PTHcVwI7IOBa9kt6+GvYqRANqhfCY8LWXyvxHIfXk2bESx42AWYaQ4cRBcE2ny1eq2F9
         mxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=9v9Ud40gdIuhjsnqnhcccPOfcS0OSRbhiICyJNZMyN0=;
        b=hjeFnDOLdU2bikuR+hyGAAxyU6glIm+Tz+woXLemFbBkpY6y3OI1L3OVhx99K1ASQL
         UG0Y8HrMuTK3XjSYTGoTR7g9wqVBlXlP0nT5IlmfC4YGFs2GVt2pYD2/jxCyMbqjHYo6
         3mnt5441kFBVi2yQbfP7Pqw5lDn84/9poaVqA9Bfvz9wwFcEM5zsbfZkFmgsFFYixmtR
         A/Ic1hGAuTJFs9VEnWVLXXNDoIWCa0oWb8bIteG/A1TD2yT+7PhyRAfVb1XHtvrnbhrE
         VQrRZTCa9S42FNLCWrjrbQsrIhLWLAc8FtAtdUAuVS7AItuN9FMOiUY0pSk9KGilv2Au
         698w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=e46lssns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si4633445qvp.22.2020.04.13.19.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 19:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=e46lssns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOBMF-0001Kr-CF
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 22:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBM6-0001Jt-GJ
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 22:31:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBM5-0003LB-7L
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 22:31:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33649 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jOBM4-00030w-RZ; Mon, 13 Apr 2020 22:31:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491Tvw2Mxtz9sTv; Tue, 14 Apr 2020 12:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831372;
 bh=z+ZKS6N1wAGyfVLEACnmrKqjFBePx1Vp+lIM3SeVP6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e46lssns7GrXbiOHAinFwEZTAsbwbhpeQa3K8t+xcvIEBlJ34blXEgeXKGvUpbsxv
 qhw9bR+kFi2VApTAipF/1zLMiYBhaNdOtfQPbHHOWnOVgF+rhNshx+NgYURnw9+KFI
 eQj1E+OBwH09U8+neeEGTVRI1ubwizuTeBgRUxkQ=
Date: Tue, 14 Apr 2020 12:10:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v3 18/24] hw/pci-host/pnv_phb3: Move some code
 from realize() to init()
Message-ID: <20200414021029.GH48061@umbus.fritz.box>
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-19-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Content-Disposition: inline
In-Reply-To: <20200412223619.11284-19-f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VN8Zk0lxs/Ch


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 12:36:13AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/pci-host/pnv_phb3.c
>   >>> possible moves from pnv_phb3_instance_init() to pnv_phb3_realize() =
in ./hw/pci-host/pnv_phb3.c:992
>=20
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/pci-host/pnv_phb3.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 74618fadf0..57d717ed23 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -970,6 +970,8 @@ static void pnv_phb3_instance_init(Object *obj)
>      /* LSI sources */
>      object_initialize_child(obj, "lsi", &phb->lsis, sizeof(phb->lsis),
>                               TYPE_ICS, &error_abort, NULL);
> +    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-ir=
qs",
> +                            &error_abort);
> =20
>      /* Default init ... will be fixed by HW inits */
>      phb->lsis.offset =3D 0;
> @@ -977,6 +979,8 @@ static void pnv_phb3_instance_init(Object *obj)
>      /* MSI sources */
>      object_initialize_child(obj, "msi", &phb->msis, sizeof(phb->msis),
>                              TYPE_PHB3_MSI, &error_abort, NULL);
> +    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
> +                            &error_abort);
> =20
>      /* Power Bus Common Queue */
>      object_initialize_child(obj, "pbcq", &phb->pbcq, sizeof(phb->pbcq),
> @@ -1005,8 +1009,6 @@ static void pnv_phb3_realize(DeviceState *dev, Erro=
r **errp)
>      /* LSI sources */
>      object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-ir=
qs",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &loca=
l_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -1024,8 +1026,6 @@ static void pnv_phb3_realize(DeviceState *dev, Erro=
r **errp)
>                                     &error_abort);
>      object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->msis), true, "realized", &loca=
l_err);
>      if (local_err) {
>          error_propagate(errp, local_err);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VG5UACgkQbDjKyiDZ
s5KtbA/+Mv4pdUqhOpQqcFoIV3GcQcu+ytXfzeZYa3WuvIGGyDPRFVliSiHz9DHr
uxMGDIZtPKWJ442M9e4jMpF7N4X29+7mcNRg/NlGTX3Het5P2dnz3ETLLCcqoOun
4pe7XMT3pE6GT9ZyhINHLlFmpCZSLJc5jxGS9XDe49Chd+HvgkvYGdwHFr8soI9T
hY9TdLxsG2kW/ETst/QKV5MELhk8xsv18saS3Y7rnvo2R72nvgdGc1Z80QTJKGMT
/1tySYfSrgYaIi0qnWbUk2otd7l2e4cErZBuZA0kVN+Gqp6MjwPxmV90jokZrTL4
9oHBCzTMCW94yAtKUMuXmxqifTmY7pakOjED0tx2uDa19ilhy/X4dIXIH8oBWvgN
6+oG1JorCkndBOL9g0BqzwfRAdIiq+ZbEUE0pkyLartmd4XhJfk6pIIeUHSYzhwx
DeTL/TfZPaSKYBAh7pdJY43S57E6vrvIwvE3MP8BvwhrWBMQ66+tWOcDC8C6xv06
51Jirlqw1uBiXblJbLqhCiIg+DQ/HhwumkyLCzfj6dkX3WeOF40vIdcXYQKUISFC
RkM3EZbzUHTUW2BCs5ktiz45KEVUbDOJQN0Z25zXMDn4DOMteAsnvZXDops8kS3S
oS8U0oet+93OFbqWjGBzbj9OrpkiWMsWVpCkBKGOyeBY0PeVFKg=
=476g
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--
