Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4690599wrt;
        Tue, 23 Oct 2018 08:38:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5etFQvYvhRoZVderrA3ldoPJZPa1JJ4ckDNajVS2UTPx++wCRFxahyWrgPm8bqL86/iZWBc
X-Received: by 2002:aed:249c:: with SMTP id t28-v6mr1680292qtc.131.1540309132971;
        Tue, 23 Oct 2018 08:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309132; cv=none;
        d=google.com; s=arc-20160816;
        b=kB0qdt2H7hV8pL5Z41gFIgGwINqe+TTcjFdYBxIyBBZNt8ZslkYSkeqw27/nhiXdXj
         j9Kfh/ye15NI/MxhuGhlMYIgHNQgmS3urbaTUgfTna9nMqi6+Xmftz3D4cCeF6pV3rx/
         eCiI0bao5ssoFzUd6qmcfu6NtHajHx8hRNFDClzcdi/mEKXCAYJWY/tlE+NKjgnNJGP4
         GUh92/jeFHAhfEVUYi+0LKTcISW97gikVPqFzRR1QUY4Mq1ZJ+c+C20Bgpjg5LHA6Usi
         PvZuF0A7qr7b2GN/PdsuWNLpoyzzdwjUEK0HSM7YgHEMXMbRkZ5CinrOAixNukaUJLa2
         5D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=WmNlS+oUk5SmTZ+gIhC2MOuo9we406ErcKInC9YW6o4=;
        b=ExJMTOXsSFlpbaYXTPSTNPu4N6UQs+oUqP6zd08YEuC5Kr0LsLyYdOdRc1uaC2/JXS
         UISHAHsgFdUhr+7u1aFGpMibX/hbgAyT5gRiTAkALiJAxdqJy7hyR4WZysTwgHSrMWXh
         yA3vnfUFotgqyx8ib6xYqAdGd9L06G9o+ggWJFy5/rNFijT9C58RfqhmiOC0Ikb3n1Xl
         gHncD3H1rOdYY1mY0hHTGnPQJL1ORYFUqmgh6NZZHq8IPX3AICdP8wjWKkKLi6ToI3nw
         B5UDfz4PGJp+UUgSmbyuePSGmNdKu46CJmtdMIAnIJOSa2ZIMGLXL6ImyzzUI73yqSgx
         I8Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=aCJW4uhr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c17-v6si1221557qtq.212.2018.10.23.08.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=aCJW4uhr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEylg-0001z8-DJ
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhG-0006fR-MA
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybx-00075v-N4
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:51 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53385)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybu-0006y5-No; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj81qSbz9sNd; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=smqzN1/0mWpzReKI2H6+fp5/oZ1iw0M+EXrKk2HHMqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCJW4uhrzX2kCZmzQBygR+5vqPkJUjSeSjqEgsEuPec/CVDpuCgHdzGbdh6LKAH/a
	JQF9ZmXiN0KOSU4rk+Vc7YjwG9sQDxvrL4YCge34chal1aDid4xodTqD/Amgp72d5a
	fnuXlSihge4zJ3GWkjl3qa30WiZ5hAYDQu+BuB3g=
Date: Tue, 23 Oct 2018 16:22:44 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152244.GP12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-35-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBUa/BSa4z6QPQv1"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-35-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 34/45] net: etraxfs_eth: convert SysBus init
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
X-TUID: uKjuysfp16dG


--DBUa/BSa4z6QPQv1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:11PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20181001063803.22330-2-clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/etraxfs_eth.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
> index a6932432b1..64ab3df1ae 100644
> --- a/hw/net/etraxfs_eth.c
> +++ b/hw/net/etraxfs_eth.c
> @@ -23,6 +23,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "hw/cris/etraxfs.h"
> @@ -584,14 +585,14 @@ static NetClientInfo net_etraxfs_info =3D {
>      .link_status_changed =3D eth_set_link,
>  };
> =20
> -static int fs_eth_init(SysBusDevice *sbd)
> +static void etraxfs_eth_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      ETRAXFSEthState *s =3D ETRAX_FS_ETH(dev);
> =20
>      if (!s->dma_out || !s->dma_in) {
> -        error_report("Unconnected ETRAX-FS Ethernet MAC");
> -        return -1;
> +        error_setg(errp, "Unconnected ETRAX-FS Ethernet MAC");
> +        return;
>      }
> =20
>      s->dma_out->client.push =3D eth_tx_push;
> @@ -611,7 +612,6 @@ static int fs_eth_init(SysBusDevice *sbd)
> =20
>      tdk_init(&s->phy);
>      mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
> -    return 0;
>  }
> =20
>  static Property etraxfs_eth_properties[] =3D {
> @@ -625,9 +625,8 @@ static Property etraxfs_eth_properties[] =3D {
>  static void etraxfs_eth_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D fs_eth_init;
> +    dc->realize =3D etraxfs_eth_realize;
>      dc->props =3D etraxfs_eth_properties;
>      /* Reason: pointer properties "dma_out", "dma_in" */
>      dc->user_creatable =3D false;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DBUa/BSa4z6QPQv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPMQACgkQbDjKyiDZ
s5JEhxAAgGIp136dXE/QjzjNnmw1LArEfo6oYZ/0gGzjo1YOs5CvFYPQGRDvmnnX
kjt9ggxoMPDCE19NjoisyccS62foguB9n4iFRfIbOxb5WQjSvy+zUcQ+ZOePZGTj
H/PMmf+aKLIRBqgTkCb+4fd4z1FPUc5YtQvoAPxlpVhWZ1uLVfF50nnPZWIr3KN1
1pn04RuOnOXAothQJ27XO0jfhKgRMDBA0MQPYus07eEk6cocZpTsHDK0pl5UPG33
3CEy+IJd6KeL2/vRTD9v2+Cw1/JxDyOeiJVCw5uQ8y7K8isBxhhLTbfJHcAFWL/Y
qSGlNjRdOy9Y6I56sCInLhXqTt1dQgDEeepvmDeHQ+l1gf/GG3/A6xsxUGGfYZUl
fbuZYhC78qQF1TDMiAp0iqxiSt11fpvJPDuU+OnNL3WTOMxs+r9tna2TPjkDXhG7
YdiquIXc0wp50bHvmtrVeGAZzlzOh8guuOkvbSrZe6YktPI5EfUIUoswlp4KhQdE
jXkNbGdF51KTqFtw4fZ7AGiW59WgelDFr7qaC3xEo8eDiegKEPusTT/AwB3HaNVM
mH1PxTgxcxOcKVTntPHBzJH0+3H9UuP7pCapjKm19bS0oZ5tZm3x7iDOlq+dELw4
3O/gpytRrRum8dT4kszGvM1QGZt6ExZL6Pe0dYfPUdfjjSPVRqY=
=cmF0
-----END PGP SIGNATURE-----

--DBUa/BSa4z6QPQv1--
