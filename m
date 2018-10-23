Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4687796wrt;
        Tue, 23 Oct 2018 08:36:39 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eEXxvhavZrJUQIvimHv/6YeBJhf0QpsemULAsuXceE8a9EwMhQPmKzLA9J/uT61hUD/W2s
X-Received: by 2002:a0c:b989:: with SMTP id v9mr21035255qvf.110.1540308999263;
        Tue, 23 Oct 2018 08:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540308999; cv=none;
        d=google.com; s=arc-20160816;
        b=K0PL61J14oERLUE1KB6Sg/TC2L0dHgA3dyEnDxlPCG+a3yoAXKHdF7ugnAZ/BfeWFn
         l/gic6+aWusrds+mEJb1PYue70Ge6ZHo2z8W7CsFDDw1mymI5/Z5eWwK2cuf7W53Ffb2
         6dbKRg9exk74z4vef7XKoHZgBRA42fWBhtWa3LLMSW9tgwOxeLAE1qAvZYCbZKwmIVjL
         3oLmFy0Fdi3JmG3ysMShgeiZhPzqLG7NbpgIayfUkBmUD8i8aBcNM0eotvvWQFcWuZO3
         TupdgGgZ4nAVjz1C3xI8mkn0OuqVahaa1CA4Kboq8Kda4sn8FxzxYScwMtDp/WxGsaoE
         3/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=9Aa7OodyuHkJU/fKfZqrMNqLt1ZVPBZYgIRUOlQv72k=;
        b=V1Q3uWvt7uG1NMvvTbtwkzCq5jN2CyKxPAw3kcATEoUwdOD5BJ4FJ2mKWEIXrsR5Up
         e1ZsiV0MpIwG4H/CxFhakwIs/6S2/3iTQrj1t5Fk77+NnL12Y+5he/uPo7NHH2JiHA47
         zJxx0frwmlURDnC120VW8ixH+sfi0SHI1q/D9dCGNbbgCt0wZ1Bq1sE/QnMMwAbso7f6
         0V5Yvlg7CdtmxIe/qEkZkmTBaGfFAVo61PNyNvDVroj7+iJvDbTfY7DaeejQR31YxTwT
         Z6GPew558Bsj3LsWP3iU6C04HkbTp28VmzFVGuxoD9h5MccWio3XLA868wZBFbUki3r5
         cBMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=kU+vON91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v127-v6si1226618qka.94.2018.10.23.08.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=kU+vON91;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyjW-0008P2-Kw
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEygk-0006fR-S2
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEycc-0007iO-Q5
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:29:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56053)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEycS-00073q-JT; Tue, 23 Oct 2018 11:29:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj91Wdbz9sNt; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308493;
	bh=E1tv8qHmvpNhZYEu0ycilKd9cRCHKNFiIxXuHjrVbWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kU+vON91jOBDcikwSpeKILnxcLaLbWO1EC77CCW+UlAXFhvP3/1i42Y+bF62QkeFp
	Ud9ax6h8dDVkF1/nZZzkIr51ureJ3iPf5AA0VWjtJUuFC7VawGv+cec8O/Pj+psbzO
	0dXfxPn00HVvgmAitzQvd9qvqzQrSI9pijEH009g=
Date: Tue, 23 Oct 2018 16:26:40 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152640.GX12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-45-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kUoBhQsr7LsiFken"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-45-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 44/45] net: xgmac: convert SysBus init
 method to a realize method
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
X-TUID: N0G4Dz2wsGu6


--kUoBhQsr7LsiFken
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:21PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-12-clg@kaod.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/xgmac.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> index fa001563d3..63f5a62ebf 100644
> --- a/hw/net/xgmac.c
> +++ b/hw/net/xgmac.c
> @@ -374,9 +374,9 @@ static NetClientInfo net_xgmac_enet_info =3D {
>      .receive =3D eth_rx,
>  };
> =20
> -static int xgmac_enet_init(SysBusDevice *sbd)
> +static void xgmac_enet_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      XgmacState *s =3D XGMAC(dev);
> =20
>      memory_region_init_io(&s->iomem, OBJECT(s), &enet_mem_ops, s,
> @@ -397,8 +397,6 @@ static int xgmac_enet_init(SysBusDevice *sbd)
>                                   (s->conf.macaddr.a[2] << 16) |
>                                   (s->conf.macaddr.a[1] << 8) |
>                                    s->conf.macaddr.a[0];
> -
> -    return 0;
>  }
> =20
>  static Property xgmac_properties[] =3D {
> @@ -408,10 +406,9 @@ static Property xgmac_properties[] =3D {
> =20
>  static void xgmac_enet_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sbc =3D SYS_BUS_DEVICE_CLASS(klass);
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> -    sbc->init =3D xgmac_enet_init;
> +    dc->realize =3D xgmac_enet_realize;
>      dc->vmsd =3D &vmstate_xgmac;
>      dc->props =3D xgmac_properties;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kUoBhQsr7LsiFken
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPbAACgkQbDjKyiDZ
s5K4Ng/9HErHZir8eXr+KMfzyfuhFyEvRfieUPjrFRe/hoCNwB9raGHLEWIo3/Ne
5kGjylHNGPejs/dRdixNZhIgVMnzkJTlSlJty4p6OOwXdNymAoZr4I1f7prP6bld
3s+i2KnqWr2m1X7f9e/s1xqxHzc13uuy7i8eMLjAMSNRhqPpameKeEsBBvqXZXOm
5XCyejJFp+QhTPvp/PDUABEPh2UjE4JDWopcJ9GQZie+pbSDCiHfMzoswZoBfZf9
xuoDmhRkBFecJTMNKHr/R8mdUNeHiDuxgG3IVjXRkrwkGm8glA9JvQ5M++QBDanz
PLrZoZbm+hxTe9cP8Gy7ykhYSDXqCDOPkyzDIRdtbWe+x3dWq8HJ89ab7slhxnD4
w7VyDp0dI+BsUNsOHx877NI2AqKWw/9f/r3lvJh4aD2zc30yt10qsTTWz3h535PM
NQqgDOqUV5uM41v815UUTroC7+PFnhuChp662L6xRajdaE06SiS1Hu4Pcc0zdezc
ILTo2eKKCwDVNFJIQFdY5j9M4SXhunBRLApIFSVqGzppfoeKE1UlbyZaajIrwbir
OlaBYzSOWeEhz5idFsTZbjEpx6zWl6yAZwHcEpPDhaaWSJCuS4pzoGBNn+zPNn08
qb21ero6FElwx/JuoJmeqhBWQFQLq6SUccLUzxN8+boVXGv3evo=
=9okA
-----END PGP SIGNATURE-----

--kUoBhQsr7LsiFken--
