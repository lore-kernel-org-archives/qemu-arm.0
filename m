Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4697947wrt;
        Tue, 23 Oct 2018 08:44:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fg5BDuIwNrcQ0C+PfZkGeR98IKFw4GbuF5NfQxG201R8pfsDm6jpztpF18kXtc0CcDuIF2
X-Received: by 2002:a37:380b:: with SMTP id f11mr4888669qka.309.1540309485035;
        Tue, 23 Oct 2018 08:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309485; cv=none;
        d=google.com; s=arc-20160816;
        b=qiOX1CaMP+fQ6Dv8u3nQEPMjw/C/fD3HYvUZMAPGHoGtToYw5WcptZ3u7GcSCh8QcH
         BcAirAnKfRCuhjE372grrOFZMRVMFmYp4JUV3Q0ZfvfVSdG7AM6TMcyx3bExA7evlr1A
         l0/hmjnDCobGUoxbhdUu/Gsz79whjL84hDD0LxPH+7xAc3tCJfpQ0KJ6gmQqD9BxWU2y
         TnQfNG+9VWsaXp5OhpnW0tDFbILgenZ0QHvIwfvKpNDyVPwQvfdFZvdGdh3nn2THlXEN
         uh/+dMW8rwQCYIaK7Gu9qkyQvUHcovKP/+ZjaK0XZhCl8WGVJPLTfG76sKlMy+RqjEtT
         8B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=n2AQS4SDMfXQgOwEqs8JR01U9CH3pQYJWVXlDvkvUmM=;
        b=A/BRL+LqBJJSgeL36bJvNPPFaIbH8617vP6DKjx0YTNqCspkaGwShH/7tLlkp2P5KV
         LUVvMRBnb+0UYW6FeTlBJ0NCOR8sBtT+QgY/Az99KlA2cZxLOW9k8uUwTij4sOmJiEP7
         lhUOazwl4LgJZnBBW344SCxqyMR2CLavS2qCNqGy6Pte+K7We2GXRb8tLxVUeqZo39I7
         HGRKHleQTpbErnh8y17FiFpswg3JE6KnzZW0Y9PJYi96zaidLAjdHEaLlFrT12OhX2h1
         UK/JKzdGSnjw7dZdS+vFUiHJZt/VLDYCIQ25uiUbFpolQTeBAkMSR5oiXkyhjp3LQo5L
         1tmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=CNJ2DrvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si269412qve.184.2018.10.23.08.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=CNJ2DrvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyrM-00087g-GJ
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:44:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhS-0006ks-To
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybv-000720-Ck
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52859)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006pS-B4; Tue, 23 Oct 2018 11:28:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj80Nlnz9sNp; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=aXouyZGVDvTa6F8zSH9Mod/OyiYxwfq2Gi6WkhUqTtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNJ2DrvKJK+UP7TWkrPY4JWoBwiDpC8By/bL/R+lnRSWh9rTu+IrM40kRH+f5VNRc
	sIhf+FQZsz+V4XDxSa9Dkk+2IxwbcIPkblgFBJ64YEzMWzL66vPKCsggGOXF+LnzZu
	83fgdUygpLUQf/h7PBMhVcxNcFAoA2RS3O+R/POY=
Date: Tue, 23 Oct 2018 16:26:19 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152619.GW12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-43-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JaUdphvQ2+4F/M7k"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-43-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 42/45] net: stellaris_enet: convert SysBus
 init method to a realize method
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9DZO7sWth/x


--JaUdphvQ2+4F/M7k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:19PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-10-clg@kaod.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/stellaris_enet.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> index 165562d788..3ee1e0f8a4 100644
> --- a/hw/net/stellaris_enet.c
> +++ b/hw/net/stellaris_enet.c
> @@ -473,9 +473,9 @@ static NetClientInfo net_stellaris_enet_info =3D {
>      .receive =3D stellaris_enet_receive,
>  };
> =20
> -static int stellaris_enet_init(SysBusDevice *sbd)
> +static void stellaris_enet_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      stellaris_enet_state *s =3D STELLARIS_ENET(dev);
> =20
>      memory_region_init_io(&s->mmio, OBJECT(s), &stellaris_enet_ops, s,
> @@ -489,7 +489,6 @@ static int stellaris_enet_init(SysBusDevice *sbd)
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> =20
>      stellaris_enet_reset(s);
> -    return 0;
>  }
> =20
>  static Property stellaris_enet_properties[] =3D {
> @@ -500,9 +499,8 @@ static Property stellaris_enet_properties[] =3D {
>  static void stellaris_enet_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D stellaris_enet_init;
> +    dc->realize =3D stellaris_enet_realize;
>      dc->props =3D stellaris_enet_properties;
>      dc->vmsd =3D &vmstate_stellaris_enet;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JaUdphvQ2+4F/M7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPZsACgkQbDjKyiDZ
s5InPhAAjofTEnoZcH4eM733YnaRa6hiPq2Q1G2qjRLIY8UzfSgff+Ewu1Qg2fWT
RGy75W9W1vCacsU79NwPwpnstD+cI/drmVXLzkr4SzoQ358CJg5p+4hfD/jRyOuB
dD/SGjIPkJuc2PTdHspvp+q3xkVkHN9d9RHIf/mpojFm+XeOU65ije0gYSBWnK/7
scfJwt13gNyGpn7//b4suh4YsUAnMeH+fSgt/znaGLguLeZRm4AC3bTeCXKpC1pg
74kzMW+zLlgzgscstA/qHnaeNIAP/DzKPvQkjo/hR9H2n/ARJDMieEN9ny7YaTt/
hUMhlqCE+pSjUicFjOxA+59SvKOwX2KEYDwKC3+XLPXpmxisrciRgNapaPfdR6N1
XOrbInQQtJk0WOOOgCWzjEZr02BQ7EL8xsSTLU0UNFqAQFtmrMU2pY0HtQiNYUrX
IptBN7Ajbtd7WBN/zL2fMQWm5w4OPhRS/bKZtv6qAo0C1q6A66FB+67MlkcjeAjU
Ci63dlt4cUPir8ZIycK+p1L+e1ynsspBh8JqzGwHaof/UmWv23sip71Pl0K+tjGY
mtLa6M/IxWZiJCm62e5FSuJK6j6lZowhBY/uOsSlRlwrkc4dyopkNGAMHXpoR0Em
niWEI+ADeuoVf2VMYr0zw5R33o9REzb2GmMYkggxX9RMFlyCU1o=
=iHIh
-----END PGP SIGNATURE-----

--JaUdphvQ2+4F/M7k--
