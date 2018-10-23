Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4699940wrt;
        Tue, 23 Oct 2018 08:46:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63M5qQzHtdmXiRV1nqyJTPYAnIXPA5j/u0XLqP4RYIjXxBrG0oY+HW32ZIZ4XZ7pxsZwlBc
X-Received: by 2002:aed:2806:: with SMTP id r6-v6mr11288134qtd.189.1540309579329;
        Tue, 23 Oct 2018 08:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309579; cv=none;
        d=google.com; s=arc-20160816;
        b=vC5p/+k6Kgsf58z9ngxu4GdZCPgNcdFMOh3HpG57JniWTMag49rwKa+OUktjcgDgbP
         nNgZc0HKkFi2xZj6GBIiqDsbWm9JPhHcX7/xoDwTvv8Suac86AiKv//Qkm+MaiAoKQ83
         IFaC8/F8j1PQMKMzWDZSIPmAechZu0BqmJp3BM7TiyCDhRbJT91ODbVhTKzF4RiF2omr
         wm7k/iyhmVABta470VVbPZVQ3ZL2P9HySbXBhk5mwOnVJBwMsXVIhuFOiDtcjOyFQNgd
         +RA+6sQw8OHzIYBRrrdKXX0CBf4E/yRSixjoS2wdaJLcJkQMSTFlxiQc0xrhjcX/152g
         JB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=KG3XebPm5+j7JXFzUAv8uZ6dLZEO80WQVNm8xQmcOMQ=;
        b=THlCtUyX1q9U8v2O+Hxa0EPsa/W7CSJ5jy55lHy9tKuWixEGf3SQzpuNvm/4sAdWtF
         Vaz1gfR7H/zeJKWWJJEFv9DMoACvPRs/Pqz0Srg2V8kKT9zqPpw4uOCLorywjP0cwfE8
         XN2zr5gL20SxQPVHqAjRYQkO2bppqPY7o7VPTiy+fFp7v+ZdfhS6RrqLbVrk/tEaGQcq
         kEoBfV5KV2o8GG8TRcS9I2MzpVTsrTu+9Ma/fdoMkgIIvmG7xpw/VejRyBMIXwK4bQAq
         cP9yXVp5OwZBxQ0X1ob6uBVqV8eBwb8ml2eJaXMfxGkhKgUTFJo+T8kx70S9iwIaldr8
         IV3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=pcOsJwZi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y22-v6si1359618qta.312.2018.10.23.08.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=pcOsJwZi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyss-00017r-PL
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhT-0006fy-M8
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybu-000710-Gj
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:47 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51913)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fS-Bt; Tue, 23 Oct 2018 11:28:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj70lynz9sNH; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=mJBbRgfsQCEItVkfJBzfsCqI1wXJm+W8QMhSWvlwfYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcOsJwZioAfXy7eOpkCfbX/lxq9jO/b04036VBh4YIZ4TB6HMcLNt56qn/9/4AcIo
	GXJqy1jvjyLRWgSsfVmqIdftLuFvo7noIXuAOA9P17cwA7Ps8Wkp8pYcTM7l/015Yq
	6Z+8gj+iG0k+rcUMVqtIG2LvkP/mrp0/AR2u5HCU=
Date: Tue, 23 Oct 2018 16:11:45 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151145.GG12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-9-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-9-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 08/45] hw/ssi/xilinx_spi: Use
 DeviceState::realize rather than SysBusDevice::init
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3/th8MAuVga


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:45PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181002212522.23303-5-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ssi/xilinx_spi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
> index 83585bc8b2..3dae303d5b 100644
> --- a/hw/ssi/xilinx_spi.c
> +++ b/hw/ssi/xilinx_spi.c
> @@ -319,9 +319,9 @@ static const MemoryRegionOps spi_ops =3D {
>      }
>  };
> =20
> -static int xilinx_spi_init(SysBusDevice *sbd)
> +static void xilinx_spi_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      XilinxSPI *s =3D XILINX_SPI(dev);
>      int i;
> =20
> @@ -344,8 +344,6 @@ static int xilinx_spi_init(SysBusDevice *sbd)
> =20
>      fifo8_create(&s->tx_fifo, FIFO_CAPACITY);
>      fifo8_create(&s->rx_fifo, FIFO_CAPACITY);
> -
> -    return 0;
>  }
> =20
>  static const VMStateDescription vmstate_xilinx_spi =3D {
> @@ -368,9 +366,8 @@ static Property xilinx_spi_properties[] =3D {
>  static void xilinx_spi_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D xilinx_spi_init;
> +    dc->realize =3D xilinx_spi_realize;
>      dc->reset =3D xlx_spi_reset;
>      dc->props =3D xilinx_spi_properties;
>      dc->vmsd =3D &vmstate_xilinx_spi;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOjEACgkQbDjKyiDZ
s5JIkQ//VlZrUiBAVwN8PfcgAQxa4Os/I9ANKs7wfABNd1VJLVXyIk0oF2fhMIKI
oHFTulaGiPJrtd9FXFOYGW4zaxAVNchmeLX+ffUGAeBoNNhlIQRtajDPo61p24X6
qnzAtGOSE1hXQqfkhnn6L5C7LehBFrUS9Ij7eIg76QYuJuH23bHP/uB8PosyYJTo
PvU08szzLDZ+oo8DDIxezPlpu9Gm1kZ1p9+s+F3mdQDNN16KS9B9e55/wR2vyI7Y
5KqbePoKGjQrbBtICee6TfVaOMGFhcqOT4MpYv/64kOCkQbSUNKU/tf6ncq8ICKD
S629Ep6sFWwq3o4buc6JnR/lTBqiNdZR7HR81OV5sASofmhMoLVdxzbgRhuyFjpq
P1LFlBEtZTw5qEPWeEC2ENLUOJ6DDPFTf2OfyAm11sfZqW41U/RccCGa7BJ7r8IO
eR8WG71oY6rjvhge3ZT78MFnke2jbP9v+6I3PCTF3/S+McB8hEEX9ARshz+WMRIn
ydryM14AFeSt7ImPafvnB7vO1IzxFCrQRuRc8YweTBZhT2TNJ5+m+f7xkbosqQ3p
kkRnv9C3Ljex9GTzSB7Je8HhJGfwLWnfGRDuP+tfz+qhiq/sGGttRVdjWRrV9bXx
d9RIEBFxUZPbOljwd5Vvoo6F9z+4OH5QFTFi4svmvVKtgsLATCM=
=SMI4
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
