Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4687112wrt;
        Tue, 23 Oct 2018 08:36:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63/3L9IacWLoulotqo0RPfgGngtM5UBakZ7BB1Fh2yZ2D+AooWemD7n1w+t9WvKYDcZb9Rp
X-Received: by 2002:aed:2d47:: with SMTP id h65-v6mr6377046qtd.227.1540308967208;
        Tue, 23 Oct 2018 08:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540308967; cv=none;
        d=google.com; s=arc-20160816;
        b=WfS4JzeRpRWUxyiFU42lnibywPL8gh97VBmbkVHhkugE91aZzdK1ZhKza6Um59Yq+W
         FdVapIpfUYpdpGL9PfRWyiW4354U63P/85gaO/hOH42R1c9Ez5EcQQ9/kt+TnshchGMw
         E0hxc8dDFv2Uq18ZbkUF5Lq9BbrCJ+xYJX7qZWoAv1CN9Spf01nV73rOJi7qhDC635cS
         3CZEZ5uCXVyIY6Ld0uifNaATtBmBYbibXaqaG9baXPD8fsQPar7iOMjl3O78c7A58sXH
         b9yHLSkVxoat+ktI8P3kBibqIfkwMF6jKQ58W1jvOgHDC5/EEBUobjz1SoHUsAWWO95k
         66hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=skpEgNIOMBPpW3Ns4ImSz4QV35mO16UmC8Zs9ITW10Q=;
        b=OZMX7oDdDVRoF1T5L1LBjf30IML/Fnk9viANflgthlVXxZFrxnZryPBuFNUQ2SX5+s
         6ptjSh94nvhzxN9z4nxPve/eBq0z93M/5ySWriSPgnwRy6+Cy4FU/3cuqqBy+pSILmhw
         6JOJUJ6YNBeq0bH/TxPqkgzVaa7KJDwWq6zHRtiDqkg32PKXqH2x2RJ5lNpVOfTJnoT2
         lsYnpfdQdmn+WJJjEnfJVFxt8a0kwWYbLfFIMdiE+GWazLCeWCSR1KIeAJ9fPXtY0cbu
         Rv80L2BOryH4iPecSLb6OHps64cQRmjfglChr8qTyS1jCU00p52t4ZlweVFgoM2j2jui
         mJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=TdQ6qnfk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r23si450907qvr.26.2018.10.23.08.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=TdQ6qnfk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyj0-0007py-Ku
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:36:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhC-0006ks-AX
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyby-00076i-3M
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:51 -0400
Received: from ozlabs.org ([203.11.71.1]:60197)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybv-0006yz-17; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj86yDWz9sNj; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=cdwXj/gRCgEr/2MNKGI6+X7PAyKOTzg8xRV5pKPgPzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdQ6qnfkoaiXzX0j7kkLbfiLl17p+yZor2dP11V06IsqrjtWihTH7JYy+X19dPHs+
	O1tsJvD0iyquzxvZ5fuylw8u1GCG9ztmppY8HTZ7iBPW0E/FxPSSvyPzLo4KQOpxSF
	y0wG2Q9y9ej8lWqjO8xDV/zm2kNrx77Q+XY2glZY=
Date: Tue, 23 Oct 2018 16:25:57 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152557.GV12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-42-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zd8I2GZVcdxtyaG/"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-42-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 41/45] net: smc91c111: convert SysBus init
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
X-TUID: J0zzOeNvz3Rg


--Zd8I2GZVcdxtyaG/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:18PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181001063803.22330-9-clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/smc91c111.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index d2fd2040e8..99da2d9297 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -766,9 +766,9 @@ static NetClientInfo net_smc91c111_info =3D {
>      .receive =3D smc91c111_receive,
>  };
> =20
> -static int smc91c111_init1(SysBusDevice *sbd)
> +static void smc91c111_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      smc91c111_state *s =3D SMC91C111(dev);
> =20
>      memory_region_init_io(&s->mmio, OBJECT(s), &smc91c111_mem_ops, s,
> @@ -780,7 +780,6 @@ static int smc91c111_init1(SysBusDevice *sbd)
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>      /* ??? Save/restore.  */
> -    return 0;
>  }
> =20
>  static Property smc91c111_properties[] =3D {
> @@ -791,9 +790,8 @@ static Property smc91c111_properties[] =3D {
>  static void smc91c111_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D smc91c111_init1;
> +    dc->realize =3D smc91c111_realize;
>      dc->reset =3D smc91c111_reset;
>      dc->vmsd =3D &vmstate_smc91c111;
>      dc->props =3D smc91c111_properties;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zd8I2GZVcdxtyaG/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPYUACgkQbDjKyiDZ
s5KYGw/+J49J74ma2Qncbz0rUAlphJfIXryCOepHL/qP8//G4Be71VDPYLWlo+7P
5Td6W62Ygn6ny/c4MKzKUugQWbWsRLSdhd5aaAE+E0zk23VXFuhr9hWgZOT2ImRW
CPrYd0LpFEq4+g4l7DQ29JMASlH2Lmwk/DqCEHmTd4YZk8aoRz+BAuKn4EzLAYLd
fGcqclqbXghvbq2IdEb0Gq7K/6oZOT782eetZ2d6PASsjiLaTx8+HOu0nbFK2S7M
vQy1wTXYTIl1wq6tzE9UTXVFmi1AbEYihLbo94hZ3lZJteVB7/ycB4f1W/gWc9B7
h6t1w8udQLTWyMwfhAq7yRGTilx6Z2dJk2ZadU3TyLLoGkd/K/0MryB/k+gSlv0p
fPJzMFA38UAPxhicouGz051ENnH3duYq0PF1tX4Mf12rWacC1ABjiZlRtRIhujfh
MJ7T4mqCq9vxoDtzypUHyc5B++JhPg7gRVSRj9fBEeu/auYVplD9/hEsf5EFJe3o
OabtrWMT6JFyZOpUPOcE5kgtWpkOupm6PPAgUeDSmSpK9Avh5/m0/cRhH9EClM5h
c89LKAgaW28lcH8tvd0hsJaVEAgBoNCxRgngk8ys75akkG8U9UusOdJVflTZu6h1
9+DPnNb6QY1xC6CIHssnHJYHoSa+gh2LttvY99lJuXObWA8xf28=
=/3S7
-----END PGP SIGNATURE-----

--Zd8I2GZVcdxtyaG/--
