Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4698598wrt;
        Tue, 23 Oct 2018 08:45:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63vRMPeejc5GM/d/UAcgUJ2+lVW99Ig1/cIiWUCXhb4mNAeA1GEEIV3TBMjJX/jDVzzK9PV
X-Received: by 2002:a37:ec3:: with SMTP id 186-v6mr47355207qko.236.1540309517137;
        Tue, 23 Oct 2018 08:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309517; cv=none;
        d=google.com; s=arc-20160816;
        b=Va2GS1MMZzzKRSvtYbfuQinxXKoApcjRJq1tT/wPJMEI9XwAuF5AmTvjapp/YAvDvF
         vepy4GD+xj3PGhwpGlY+/ZKBQ65kuQfvQTqnEm3+/Q1WKHSYcPk568KGaEcwCEa00+cX
         YD3lGX2nIa75eE2MZudBaq9RHjLW7c5ROPEfV/OUDfFBtFix0QbV26fb4c1N7z9HAMD7
         uR77vZJMWaEgrH2djvksI73lULijs0ohcpSyTpBaXWPig3PjBZuE4cQXL4pqGucadvP6
         ywnhZC8JGrXCborp+r51MR39kfD802vq/H1H8IyXLF/CkKiZoNY+n/H/weINFaeCZXyB
         W5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=r69j90L4LkO3X+W/NIfh4Xy/JSPXY7lLydEM1TcXiYc=;
        b=Dovk/hDLujuTLg7q9NQEt4doRboSjaZyaqiXNuro+mwgFWVE1/KoofVntvydkR9xXl
         G0X+He2sfgQviq85DM7l+JwvCtHhkep5vfV22H0BDgr3bOE84dQN8DGuJTeuEpUcB/FZ
         2hbiCDPZ+vPF6pSsW5bP/MTLWdDBoSXrhCH17G91UyUyxXNr+S16cQTGon8716x53MqS
         n2KEiOcIx6x30LsUrRuySuXlfyD7yQZMty+9YI0Jzjw8lrFSFNrMd+IW2UsLGYKJIKqE
         iPg3awvboL65MMZ119vMLmWfd10MR9FURj52EMI9K6kDtaokq4Rv6fKA+go7I/pMT6YQ
         TniA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=cwrckVC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1-v6si1345099qtp.185.2018.10.23.08.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=cwrckVC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyrs-0000oa-IM
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:45:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhW-0007C3-Hk
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybr-0006wv-TI
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:45 -0400
Received: from ozlabs.org ([203.11.71.1]:55081)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fQ-3Y; Tue, 23 Oct 2018 11:28:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj76DDKz9sNk; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=8+azQ8w2CUHgx8F2s6qTCKnsbPWUtRUH7r9uI4h1wN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwrckVC7glqjC1ixqkojUEAb1hYnnOAY0CYoenw5Z3eNKH/sD1qUXwkZbiMC0mKyH
	eFMhuWKb97CUMdAHR1GWX3oKdG8Q9E8NEafriFFQqZwK/2aN/faXiBXoApLinUkgX/
	ymLWmW2qYHFY+BRLJwWJ9cMOHKgYWGQz4yZqJnUU=
Date: Tue, 23 Oct 2018 16:25:35 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152535.GU12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-41-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ma2pZxZcUUd0eybH"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-41-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PULL 40/45] net: opencores_eth: convert SysBus init
 method to a realize method
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
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d92+ou2x62z7


--Ma2pZxZcUUd0eybH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:17PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-8-clg@kaod.org>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/opencores_eth.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
> index d42b79c08c..d6f54f8d82 100644
> --- a/hw/net/opencores_eth.c
> +++ b/hw/net/opencores_eth.c
> @@ -715,9 +715,9 @@ static const MemoryRegionOps open_eth_desc_ops =3D {
>      .write =3D open_eth_desc_write,
>  };
> =20
> -static int sysbus_open_eth_init(SysBusDevice *sbd)
> +static void sysbus_open_eth_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      OpenEthState *s =3D OPEN_ETH(dev);
> =20
>      memory_region_init_io(&s->reg_io, OBJECT(dev), &open_eth_reg_ops, s,
> @@ -732,7 +732,6 @@ static int sysbus_open_eth_init(SysBusDevice *sbd)
> =20
>      s->nic =3D qemu_new_nic(&net_open_eth_info, &s->conf,
>                            object_get_typename(OBJECT(s)), dev->id, s);
> -    return 0;
>  }
> =20
>  static void qdev_open_eth_reset(DeviceState *dev)
> @@ -750,9 +749,8 @@ static Property open_eth_properties[] =3D {
>  static void open_eth_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D sysbus_open_eth_init;
> +    dc->realize =3D sysbus_open_eth_realize;
>      set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
>      dc->desc =3D "Opencores 10/100 Mbit Ethernet";
>      dc->reset =3D qdev_open_eth_reset;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ma2pZxZcUUd0eybH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPW4ACgkQbDjKyiDZ
s5LwTBAA5fVtx/enmmdjhKRA6WlTWQXj7RpnG262bhZWbHjmVAfGcdRd/4pcyc0M
28P4QxfKshSHEP3c/GXUYbhLsF/noODqqvdgICEfLenrmGaHi+7iZHYd1tB6RlsB
Bx5NLvssrCq+9L3ay8q0zkT9t/H9qAuALBvyVTXMVPwgpxKOkaDBbi2P0L9SXgz1
AMy9VVah1BjXJedtUZPr4WB72OefoCaxP0nDIi5A/GgDHxp6imEO6j/rDb87XG7q
Vqh+KsJKXDcdPIf367Iuf3FABCsjRc2f9BQYq2g1bxQOObHTjIr7NjgAYiLU/LUb
OqjK8DIeqWcxpSzbZJdQNR8wBt57mpptRI8EEPKy20TuprsOcF5fnWunshNRb+gD
H5+t522p/iTOsnHqw15eAgCHJZIgT1EEiZedOp4wv6cyrb2Fp5V5BdwmgpWbvC6x
VtA5YtaIfZUrQv7niIdEEeFkGMFaVM9q03nm7zERgmhw7/N7cifE+VGaD5T2XceY
w52Pw0lnAmkjS6MnQajYcjZ15oRh/FQRhL9ezhe2CT7mY4vTJ+Ec8caytQKkH8lE
MUnKhA7x7YULhlCYEq1l8ZNW+DGgGwkqe+cOWcC+L3s8HB2Lf6hRXBWWK68mY2M+
2zbPWWUlOTa3c31Ous5GdzKpcnamLx3rwJ69sHIC3yqmd3l8vNI=
=VznO
-----END PGP SIGNATURE-----

--Ma2pZxZcUUd0eybH--
