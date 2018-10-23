Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4694220wrt;
        Tue, 23 Oct 2018 08:41:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60OOzljHPiXrFW/XBMQ70EWVeT1ogjLaevTETO3I/ttDOstqyWzKDBGB7NZq9nfRLyVxT0L
X-Received: by 2002:a0c:e58b:: with SMTP id t11mr28912771qvm.76.1540309308287;
        Tue, 23 Oct 2018 08:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309308; cv=none;
        d=google.com; s=arc-20160816;
        b=EqJF+85psNjTQFa/2SXup/23zR2nkyxMYeFBKR28zvs0aHh3397Tmam+RXTJPD0svh
         +s4BTAx0PafyjvKUDanJN15pGAbNujBlirPJDvTp0HlBYfJdFp3wLimly4gI7qWZ2bK0
         LAShLCZvurxrY8uRfx/o0EDyZISJ/QHPnJ2Hp8jwwUrxhYyrzxIiSRqrp4GaCcqy6mYo
         lqxijeGlpIjgKCJfl2QKiRWj+7QlS9Bv9fNhebR7Wsl8ZgfWI6IkKwwWmuF/+9xWluxT
         GOSoS04uobMYBHrQiE1t+V73d71rVi9gqInRpbQHOW+bSDFDqesEKnOkg3yhC/3OUonq
         xNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=rO5Dokra5vQFkE5fV8quzsxqNC3AvtC322SojYjrKlw=;
        b=kjPJMxriob1wgWKC6yowDIgijZUAJNIkGkBzRqOMBI2778xGjyq4BmatHP0N7nGXgC
         tQYQPadeOriANzxtV3XrYsYmUhJ93sIpiI9ooNNuUdoirWMPnUTak9RijDVAEYbgErXX
         sht4sZr6AtJ/BBq3pkWOqLIIn9wJTJ35LJ7PBO28FQ//JOHLwp2cYgB2CtmJn9ExDOWI
         KsHZiXlCBlcdPIxgqwDWK3OKaywbehuq2xX5pyarhLozSHwrz1TfbEXp2pUILwphUjIk
         k2E/rMPzsAHYqlWPSUbfr6QkUgWVxrD7Q/EEFNZXzrPEr2DdOi7sV1bpggEd+bj3hOl/
         /L6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=luIXHOK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t39-v6si123729qta.353.2018.10.23.08.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=luIXHOK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyoV-0005CK-OB
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhP-0007C3-II
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybw-00073I-1z
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59919)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybv-0006yV-3s; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj850CMz9sNf; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=ek2oezW2uzOKlSvZpBy0SUkHgIBFnejB+vrTRUiY+kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luIXHOK9iMvJJWabvVNHyciybcAMoWJPawJwKDrB15tbRgbhp9Fo/g8UjjqlsX65y
	D4kXUQOR2a+johbhb6sL4P3kxfav7NEHlIjDAGSTfmCdg1vN7WKRDlow/rHSD9N+el
	SKogAE6ongVVF8fdtusFrOr1zOJ26uHqH9dNBEt4=
Date: Tue, 23 Oct 2018 16:18:59 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151859.GL12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-16-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V3eawNQxI9TAjvgi"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-16-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 15/45] hw/hppa/dino: Remove unuseful code
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0RUx84FMWh8U


--V3eawNQxI9TAjvgi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:52PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20181002212522.23303-12-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/hppa/dino.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 564b938e3a..31e09942b5 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -488,17 +488,10 @@ PCIBus *dino_init(MemoryRegion *addr_space,
>      return b;
>  }
> =20
> -static int dino_pcihost_init(SysBusDevice *dev)
> -{
> -    return 0;
> -}
> -
>  static void dino_pcihost_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> -    k->init =3D dino_pcihost_init;
>      dc->vmsd =3D &vmstate_dino;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--V3eawNQxI9TAjvgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPO+MACgkQbDjKyiDZ
s5LBsRAA3DqajFZABBiaigBwzG94RotGK+p8Ci+sVj7XV7XV5VKol+J5D+wJgc+q
sO2dPYMbmvnDf7yc0QYPhkWuWSSF9E9D5cXqQbFuKHPKOhuYVUwwOyMOx2NdF0rQ
bhgPCoTPTO6bIREYp79Ox86xR1LRIjs87P4+e+6obro8xAeEJfHvauuR9IF1BgQW
KhnDgnZyuP4z94G6qKvSQZa/WRMREoQeknbvg2JJ9DHcS3XVIa/2/fAfVcBU3/mj
dq7jgudx9kkRf4N0IwUvyjIWwOS6vXSsHkLgsxqK2pD2kL+3OXBN9d32B3/wMb+B
dskzCT3BNn2/OLgB6fiSQr/Nos174zMBlXvDVfwBugJ1XiYgofVGw7D84L6YyJct
Y9g3Lw17r0zDEgyeSEQSGqs2do6Ed/rWwRNjzbC1JsVJL9cSAnHF/m+zrN4tfIAv
pql8g/MDUe2dagk8vuRRsmWRsEQlpdlQM/I8Q8/WlRMD8y/Bg5cGKI+5PwuMIf8+
Fr/CNhcKNpKzn1JbgrE1Zcb6TWlG9Ot8PI8l4iDsBomexXtZTHdLTGxoXb0AfEwn
pV74PawItuB2NAmNZPCkXR1wtNZYu92UgGVRx3XMkQRUglN74LfjSCULNJzWkCJJ
Xw0yuNg+qcqYyS95rXQYPcJApk3trX0lFIjEY9TWlDCtVYFpCs0=
=+/4C
-----END PGP SIGNATURE-----

--V3eawNQxI9TAjvgi--
