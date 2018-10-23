Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4698303wrt;
        Tue, 23 Oct 2018 08:45:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV631/I0ZLd2cTCiQ3xP3gbMLoNuQNOK11qr8LqSBeSLAdWXQolTjeifixZfO5Ngok/ae7wIi
X-Received: by 2002:ac8:687:: with SMTP id f7-v6mr47998047qth.348.1540309501589;
        Tue, 23 Oct 2018 08:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309501; cv=none;
        d=google.com; s=arc-20160816;
        b=m3c1jI3mzn95jcY4X1L38TIhYL0iGSFxdYvtVs9nozoMQNR8+f8AWtiQIQv28qKUaE
         WeYr/CPE2uJbVYzhh99K0D86gjrjUYoo+RTyqBFv4RXhpoCfw1WtBGLTL8AK7lhIfwZs
         17fHCs0IHJnrmjPV4vjiW3A9n16YvoXx4rl59xjVjAOINRUfI5SNNK01KQLHRWBAKt+e
         NgZ2m/s6YNolyK0NevoCOW6tVAgm2xca4IM6R3CurabK8Uro35TN5Y0qHPP8m/5JsyRn
         iXwcCES5/jPaCidqxZNML5RCEBOmMuYK+ywN4JUeu3mK7RINi4rG9YMFlSzTzioOd6SK
         JIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=FzjP5xoignqwGgLpMNuzI7NMLeRDQ2kQT++yPBu8jsM=;
        b=wi4sWUkdkBvca99qaGPTMZ/MU2AFr2cGudlgRoXbltbra8PVwhud9sIPpEy1vVbiPN
         HNPHlh1NQMAGsq5WM3i8lxwF1PHIYQ4gl5Cw4GQt1gbneVgsCJfaf3VrAhZ9XxnhCRRi
         pRjV8lt3P0BXbtBAZrc1QjWFpjEHjoy/DdD0lJXfOcC+/Vs4gMLW234BDRcqwJK++wtg
         xz0GSf7LR0vlNRmZEiqLBgoUKsgC2mQp+DaJJV8s00+lakCEMj83Fk6vauqqd03qdJ85
         3kpINmb3JqFiimoosNSyFirkAvfUo8OvP8mtBFeCiI8Ywyg6RTfWfG+eCxjPwBwfAwed
         ocOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Nq54Koyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j25-v6si825942qtc.35.2018.10.23.08.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Nq54Koyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyrd-0000Zt-3M
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:45:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhV-0007C3-9r
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybs-0006xp-Cm
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:46 -0400
Received: from ozlabs.org ([203.11.71.1]:43763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006fL-Cf; Tue, 23 Oct 2018 11:28:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj73JCnz9sMx; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=XoNGAA1GlcqyPoDqoYO8YPaTTn51OVjPxF+R4VWjJ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nq54Koyc4xbgeEeSBfecpn+IfonrpSz/HLy7QtkpY0Mr3zRF5OKh9mnk4GXhYtcea
	zi0DccFoHWv/LEGzIvgVxUnyG4EsKQN178GRqVBRLuTUaMsup2jlu4xcnH0dzLL5Hv
	FWbr79pXWlsNj95asxMd3lIiwrGaAQuuCcD0QPiA=
Date: Tue, 23 Oct 2018 16:18:42 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151842.GK12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-15-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2pR2RtFp0tAjF3C"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-15-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PULL 14/45] hw/alpha/typhoon: Remove unuseful code
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
X-TUID: e/N0EO5HfNSJ


--J2pR2RtFp0tAjF3C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:51PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20181002212522.23303-11-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/alpha/typhoon.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index d74b5b55e1..8004afe45b 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -932,23 +932,10 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **=
isa_bus,
>      return b;
>  }
> =20
> -static int typhoon_pcihost_init(SysBusDevice *dev)
> -{
> -    return 0;
> -}
> -
> -static void typhoon_pcihost_class_init(ObjectClass *klass, void *data)
> -{
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> -
> -    k->init =3D typhoon_pcihost_init;
> -}
> -
>  static const TypeInfo typhoon_pcihost_info =3D {
>      .name          =3D TYPE_TYPHOON_PCI_HOST_BRIDGE,
>      .parent        =3D TYPE_PCI_HOST_BRIDGE,
>      .instance_size =3D sizeof(TyphoonState),
> -    .class_init    =3D typhoon_pcihost_class_init,
>  };
> =20
>  static void typhoon_iommu_memory_region_class_init(ObjectClass *klass,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J2pR2RtFp0tAjF3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPO9IACgkQbDjKyiDZ
s5IpEQ//TIL1ZV6bFSoP+Hl3IiQornbLwEB5GNX5LOlksisV2K+XxO8eQj0wz2Gz
DVdqg7zDao5vGO6nQAAAIJkD0x5j2OuV0aHY/B65k9OBLhwbXjFwNMTdl7BOC4ip
fVuEdeHVIsMHYARdcfhbRtL3eXDMvHJx/CJKxIw/w1Tf3RTD2p5ES2oXwLRpJn3I
k+mVkt8Om/Apv+x6eu/PmieVCJUqamdPESLVDQZ211dsP1sDrRXnFEpj79rjtvEd
yJUOq1hYCw7UgcyLR5E0Ce5PLbonM+Z3Rp9OT8M5VlyvBff9egHHufUz7MbayY9C
FfPlCdeNKIoweaRoCgUjDMpkb7ygTjKZK1NV3aTr4/D5ZhJ6OaoV2SUaK4iCX38b
Uq/h74BcQAtYVKE3SmMBCHJMu6naskD5llCHD8Rq1Pq69R/iDFosn5Z69jedT4lR
BW+XH+ViMj+b20JZh2SWyijN62xQ9gjPW3wImjrj3aHsTn8MMo6y+K41QGjxMqaj
3kh8QAR95l6bfch2GF74+aRQB2FriOUG1SrB/ilzxOCTpVE2cj4cwbAeQR00SCTx
avV4dlS9C+3SzxeKUEOMrY7OanOC+1STY2HuV9ytgea0hsoLQpm8FB/s+RNZlDdn
81Uxo2xcG8bWRC0sDWmyriW5Zg4HzOuHr7FZpdGXLBirSgvmJQ8=
=f7ha
-----END PGP SIGNATURE-----

--J2pR2RtFp0tAjF3C--
