Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4695121wrt;
        Tue, 23 Oct 2018 08:42:31 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eJdfxRgckiXMyvYWsp8GQlvID5rqtU6DsJyrEORcaWeznjC9BPg8fJWmB8QY/cw3dfoDNE
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr8075643qkg.127.1540309351617;
        Tue, 23 Oct 2018 08:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309351; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBlkHBARFNLaazuAikXPT1OMApHMJcu3GHZT4yg3WfkKnU0Uf8c+V02nAnZmTtVilo
         YjUELZXQopI2L4t/XjylM7iN0unWi0w/LzrsFTOmN3/cfsO9ewAWS5VcMRkx3DiI3xXh
         AUzZzHu6+W9uIAvVIx4QQSaRsvvAhMpBgTbaKi+u7sfx9UrTcXsGw8g9M8tWXu7K/MHO
         2OIFYHR4Ow9JNhSFFgDfnOsuzmSx1UGHv2AJGq33+AquvspnT+T64smtHoY11zhNBTZD
         1OfmRJBSXA/7s+JeslDwwLxmzt7yNCcYicIvTymHTE/ZOrhUpTyKZWCLQDKpsiUJaC2l
         s5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=7JVn2Yqp3cnImvWNZhW3Yg6DTuaJxGZVcSwbrjHFOlU=;
        b=UqSI8yGlMf05aAhEBSvIb2DLMOPd5cND+tB+FGk16YhgZtk7On7LVxT5YQHdbNzGsf
         vF3+13WhI3t9T9ZHtRQfKXC6mIE6iv2E/5kD72AYWBTtDt4zUdEQ04hiN9Z5cpX152/1
         tvLhh7KRxjsjRPwu/18ql1ORMO9BpwUA1n5mT7cF4ive9qCbioSWl3IKac7LpVi7kVcF
         SlI3QVTBjd1M7gr0cTgBOxX5nO1s8m4MOEVeCV4pbpvmAhZY4gX2AY7RKeesU+TroyTr
         MtH6LEI6XzHMmFK3pY0tYcrt0zxfFwEGYxcG0jngDCFZIhcsYOiDjtUsDbKOmV8g/N0U
         xmMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Pnr2zLjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i188-v6si268325qkc.187.2018.10.23.08.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Pnr2zLjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEypC-0005XP-RL
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhU-0006fy-Nh
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybt-0006zo-KN
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:47 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52531)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fZ-5L; Tue, 23 Oct 2018 11:28:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj75CYZz9sNR; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=7//B03x7YlmvJ+XhsVE6AMlK/uSlRXKz1vCZV72Fspc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pnr2zLjV307r9st3fjMdYXJ8R39bohz0fK3BHPPiRbPC+xvrlOPv7WcgIjfYjH2p9
	2ZxJwaz0QgvGC1ZH5cBQt4UyMPWS/ntVTnpyIEyidpgVrUPlSS+fw9ZubcPownjMUV
	R9PSRSNui03wDcqwVEDZtqLVSbeCgE8BU9pG1EGQ=
Date: Tue, 23 Oct 2018 16:24:23 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152423.GR12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-38-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cYG5ZC/RuVsIq1ir"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-38-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 37/45] net: lance: convert SysBus init
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
X-TUID: SM+TPX9i8t+w


--cYG5ZC/RuVsIq1ir
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Oct 18, 2018 at 05:04:14PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-5-clg@kaod.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/lance.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/net/lance.c b/hw/net/lance.c
> index a08d5ac6a8..f987b2fd18 100644
> --- a/hw/net/lance.c
> +++ b/hw/net/lance.c
> @@ -97,9 +97,9 @@ static const VMStateDescription vmstate_lance =3D {
>      }
>  };
> =20
> -static int lance_init(SysBusDevice *sbd)
> +static void lance_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      SysBusPCNetState *d =3D SYSBUS_PCNET(dev);
>      PCNetState *s =3D &d->state;
> =20
> @@ -115,7 +115,6 @@ static int lance_init(SysBusDevice *sbd)
>      s->phys_mem_read =3D ledma_memory_read;
>      s->phys_mem_write =3D ledma_memory_write;
>      pcnet_common_init(dev, s, &net_lance_info);
> -    return 0;
>  }
> =20
>  static void lance_reset(DeviceState *dev)
> @@ -144,9 +143,8 @@ static Property lance_properties[] =3D {
>  static void lance_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D lance_init;
> +    dc->realize =3D lance_realize;
>      set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
>      dc->fw_name =3D "ethernet";
>      dc->reset =3D lance_reset;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cYG5ZC/RuVsIq1ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPSYACgkQbDjKyiDZ
s5L7zA//f/d4cXZuCgxXj2DMfSlgTsd9nawtpOV9bdBh3qxg7wM7KO24rxC5Ut0u
1qDuCQDu1Jvm6xOuF2+myf4GnvB+R0HJgfaH9z8CzJjvdQQIllO5rXjTv2/8XqTz
iWBT8+jtb/PkK5P+qay32IjSi8uNEt4N7EwPLMVLeFB80dGpfzJrgVfy7bQ+FONb
ED33JP0/FpV15FnN2MUfrxdvNIdPEfb1STx3NO5JqOLgByEoZJ9UcgMb2Q+2WPQb
MkKQjd9kTbQBUo4ABx/FVEoQ44y2uuJMQ6hEfygmpgmr7Eaf1OyTQj9n3j+RYs0B
9j3gqGzAWQrJ5VoqcUra0yI1eFy5S3VX7LCicyROhJRVAuvXAnhpI6sPdMTqbZRU
rw9qgchJQ8u6kHBkyObHFlmz4d7VgLVt418nBXV05m/S8eKbsOSCY+4e2SPWWDf1
tlo2YQCJN1YqjNqmoIZdE8jFapzGPJAtxoQHRcvU/w63pR6CypGnsqP7Sc0SZVzF
nbWUViKjqNC1tYUZKEUEs8ZiLvdskKMMYWmArSHVltiJ6R+JFqo/Pnud+/aeIaKs
DgGXAXHL0zDZaOiH5ubIugtUUGvetmpY/+y8qAA174FaVI/CimUQKWh/YBGcpurK
s/jdv+sMLgVS6QTsgKT89tx6mq1H7MK2ATtdooHN1/q9RIPLM+k=
=AU3U
-----END PGP SIGNATURE-----

--cYG5ZC/RuVsIq1ir--
