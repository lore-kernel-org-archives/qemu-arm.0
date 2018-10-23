Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4690397wrt;
        Tue, 23 Oct 2018 08:38:42 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fiB9DBfbTBCqBK9li9uOMcp5YWsvnhgmNHK0ncApS68rwNw1z759PRpF2U4AYlzh/jDZ76
X-Received: by 2002:ac8:1c21:: with SMTP id a30-v6mr6814913qtk.16.1540309122710;
        Tue, 23 Oct 2018 08:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309122; cv=none;
        d=google.com; s=arc-20160816;
        b=hjVudjikGyEkB5jnN/36cqp/mQgRYqgxHvNfvPoJ1t0/y0F5eM63LryRFPTtccq1oX
         W1VwY58Ia81MRcLAqknHfrpjfLFTb3rIFtfgYT6ILfV88qftXjcVZMzUmnRRd4hKNmnO
         1TaGY3sX82WDTuzvnxoxyy1CvPJ7OXYrhO0550zFV05QqVnLyvBTnM4jrpJdPrt4aEuf
         XdkDRO0XCCskRxHJJL8/YObBEFgjpW2CyZiuKVmWrs226FYcFz6bTeqVeU4pydGmeTVs
         4X3kJLCPyiBjrEpVe44euOJckaQzcq3n7JEwGuELyzpEF+SZRTMueeVtPRHIpVykgsQT
         RJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=yn73kSzqJJMR7YmFOdSLPwZqyjTaMYINTfziDqHjKg0=;
        b=rNiVkwhEuIsjzX8plmER7/IinaYxO9eDTIRjhg/pSfB31iX4zCaVTB5MmGDou2TIVG
         pKd2IiZskrIclokOHczNhIN4PvfTkgMHPOsjGUYL9FJ+MsMbiUnBp4wgZpxNkCV49om0
         LniRhN6e5LlOJYU1WdivrBrGNn6zvJ6xBt/Cm4V0e4tDdXuDKmm58yoWsE2nipkXQU5i
         rYWC4/gBXmU27xMRcmjcC8cmVmqYSIIafAPIlUTIV9BoAnQHrt5guRFztYX3JRriA0Mk
         mGHygNz8eugRUBE/+dRx9/NHpfpU0MJ2PU5YXzGbIWR8cKbuNTfbyJjPaV6rgjnVp6o2
         s0Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bsd0WaqO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2-v6si1405847qkg.129.2018.10.23.08.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bsd0WaqO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEylW-0001uj-7D
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhL-0006ks-Jn
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybx-00075p-L1
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:51 -0400
Received: from ozlabs.org ([203.11.71.1]:51045)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybu-0006yw-SU; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj85f7cz9sNN; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=GByrpQOWlpu9TLRCrILysIbEnUiBmKYgQjfk7pok5xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsd0WaqOUyIlpsx/sFfRU2Kt3cXgcJ4tjA2HeYsyiEkt3IVT9orYMw2nw2QmJJr8u
	PLF7ufxTCbLQAMsA2aRw5Zz6oJEgg4sX2tfyuCM9fdnWaYY3t+50MDRwd9oq3P3rn2
	npoiwrXMuXE35GgAhyrUd+XNu5xW8li38FLqVx3k=
Date: Tue, 23 Oct 2018 16:24:49 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152449.GS12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-39-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kLVKJMuKEUFaIs8+"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-39-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 38/45] net: milkymist_minimac2: convert
 SysBus init method to a realize method
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
X-TUID: 8dtzi4H4gkoY


--kLVKJMuKEUFaIs8+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:15PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-6-clg@kaod.org>
> Acked-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/milkymist-minimac2.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
> index 3eaa19dfde..7ef1daee41 100644
> --- a/hw/net/milkymist-minimac2.c
> +++ b/hw/net/milkymist-minimac2.c
> @@ -452,9 +452,9 @@ static NetClientInfo net_milkymist_minimac2_info =3D {
>      .receive =3D minimac2_rx,
>  };
> =20
> -static int milkymist_minimac2_init(SysBusDevice *sbd)
> +static void milkymist_minimac2_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      MilkymistMinimac2State *s =3D MILKYMIST_MINIMAC2(dev);
>      size_t buffers_size =3D TARGET_PAGE_ALIGN(3 * MINIMAC2_BUFFER_SIZE);
> =20
> @@ -479,8 +479,6 @@ static int milkymist_minimac2_init(SysBusDevice *sbd)
>      s->nic =3D qemu_new_nic(&net_milkymist_minimac2_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> -
> -    return 0;
>  }
> =20
>  static const VMStateDescription vmstate_milkymist_minimac2_mdio =3D {
> @@ -521,9 +519,8 @@ static Property milkymist_minimac2_properties[] =3D {
>  static void milkymist_minimac2_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D milkymist_minimac2_init;
> +    dc->realize =3D milkymist_minimac2_realize;
>      dc->reset =3D milkymist_minimac2_reset;
>      dc->vmsd =3D &vmstate_milkymist_minimac2;
>      dc->props =3D milkymist_minimac2_properties;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kLVKJMuKEUFaIs8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPUEACgkQbDjKyiDZ
s5LTjA//b4fFkv7v2xUK7KFXjb9QPVdtqZGXSsfJRiCROsPSxlBffxLhvDiZtaHH
Ohwd4L+04jhv1TZZsVN2X7iIB4LHSj21iXh2yfVtOK4N9CObvv5R1nMCinXG1qY0
AfbLshE7jA1squ49/15Q65ckasB8/Xxqq001cJlpN5/nu0JpPAq8fsPS0JpWOEEj
IkivTfLKmNJOjRKX9ED6aK023L2DmlNzEc4dI80cRbHGEMVDEREjSUaoR1PnezvD
iLERZKU8oPiXJlDboBcDCai3bs6AXImSBfgkmTYdakAFpecKiRQ5OQOs+me70qOM
UMr6qcY/nOV90WjJCvRRhdkKaACQnGuiedukvnKW7yt5pOQONM6y5RPZz5HNIEpt
fndalqtXYZEsZhmFJu+GL0i0I2m/gCsbN1H4TX4ffY81dLXGAWQ8s2edCAjuNZk1
ItXa6uX9KnUN43xwTayINBJPsohqxaJGuMjLCZvUc4GM6PdMM+2Q/7nMfZm6SBmn
atr4/X+42JEMrctUDt1Dp3MAj02F5BbKjeALVcoPedbBkm2yQBT8rEiw8s2rZJtA
BC3rYMozkKVUpZXAbT2k7r+aeBvPWi/hiFhtK6YCMi/Dg3VSmBHLzIhGfbDkezTo
hhCCrF9xIkg8fsfrcNZwRQlOM/mRagT9OvH3NpDShIZkFm03atA=
=4xLF
-----END PGP SIGNATURE-----

--kLVKJMuKEUFaIs8+--
