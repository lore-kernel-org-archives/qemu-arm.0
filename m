Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4702467wrt;
        Tue, 23 Oct 2018 08:48:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fHmYmFtHedU0c80VtsHI6lGGO+C5WjWAhn8/oIWnyqlE5Jo12lXdpPiHIJ3cfD8geFdA5U
X-Received: by 2002:a37:1956:: with SMTP id k83mr6905630qkh.344.1540309696506;
        Tue, 23 Oct 2018 08:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309696; cv=none;
        d=google.com; s=arc-20160816;
        b=tnSzzxK4PxuK59KoF2/N0+4ld2xFfR7nZ4WG+BKV34d8JsbL9IJ0i5Mz9dfUkgKlP0
         RPVF1wnzQPb+ZxppiWupZTajA1qtrDDIOFo4QEAeVn5xV+BoAINxvtdp+fyPLIGep/7B
         w+xsA2U7NcD0D+y8jAVu/nUcHT2oBK+785bKVElZWsV7gXV3JDJtrLyYJKW/4OiwMo4Z
         OglUHdwC0yXY62H+WpBTkaSH4V2xJG2CwOUM0nXz2TzLjCOb/GqZO+nUEEdFsEizB3GT
         4ljPwGbhr0y/Zr4ov26D+dZR6XcKiPc5XA8fK0vjAUNgxMEZ8GBxEpcsRPSnDARpixYq
         +j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=nAMjKhZa5YdowSkeK4VKQxfRNA7rwrOSix49HtFfx7k=;
        b=fDZgk4dUBWLi24KwcCm3GpCqOq0EoaazQ1jnWsm2Ttl98AIgY4XCHJuAOVKGDZDfna
         1JFF7bu3wNApkdCCEiXP1PqwLg7+jmXm/wzgTSrJTL2KwJ67Lco1VkMZvtmgye7F4+XF
         VI5tydTLlF5NF+gHaeTsUCecE6jEPFVzLNArPIl1qxly0saLPZTbbGK9H+qw1gssu6U5
         KNGISJYEDaJ1hvDtzbeuYqXwpwo7OaxY/t1AQgf+Sn6A023QiKUZI8Isr1pME3FTBk1S
         lX3+M9Rt39QqnV2pCjasJka/VSduJ1R2wJBaPMzCVjZ7u5j+i83BnI0bl7vX+TqrCqrr
         +jZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=OrrF1K8Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14-v6si439317qtp.301.2018.10.23.08.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=OrrF1K8Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyul-0002op-VL
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhM-0006fR-SI
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybx-00075e-Jx
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:50 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybu-0006yE-MU; Tue, 23 Oct 2018 11:28:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj82zDxz9sNg; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=OU4vGhOc9kZsDmkMTT9AaCFGIO7WuLlR8KKwWJ8Lu6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrrF1K8QSDqM+vHlRCejWIqbYeHbpNWDsfQE2luRmBXNRAFtfEWtEWlBfHmbn2TlQ
	yAzHM/ENYwXoViBfH0hiG1/8t2/X5nq9dh0OmNTqx9GDkp+X00TVBWuy/7Fr75EdXq
	UKmM/rtfDVnpXLuGY1aAAvOeQMJOXog/RdEF+r0k=
Date: Tue, 23 Oct 2018 16:25:14 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152514.GT12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-40-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9r3HF47jptiQlX4s"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-40-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 39/45] net: mipsnet: convert SysBus init
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
X-TUID: XLFXYEeKpa5b


--9r3HF47jptiQlX4s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:16PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Message-Id: <20181001063803.22330-7-clg@kaod.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/mipsnet.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
> index 5a63df7ccb..03b3104278 100644
> --- a/hw/net/mipsnet.c
> +++ b/hw/net/mipsnet.c
> @@ -236,9 +236,9 @@ static const MemoryRegionOps mipsnet_ioport_ops =3D {
>      .impl.max_access_size =3D 4,
>  };
> =20
> -static int mipsnet_sysbus_init(SysBusDevice *sbd)
> +static void mipsnet_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      MIPSnetState *s =3D MIPS_NET(dev);
> =20
>      memory_region_init_io(&s->io, OBJECT(dev), &mipsnet_ioport_ops, s,
> @@ -249,8 +249,6 @@ static int mipsnet_sysbus_init(SysBusDevice *sbd)
>      s->nic =3D qemu_new_nic(&net_mipsnet_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> -
> -    return 0;
>  }
> =20
>  static void mipsnet_sysbus_reset(DeviceState *dev)
> @@ -267,9 +265,8 @@ static Property mipsnet_properties[] =3D {
>  static void mipsnet_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D mipsnet_sysbus_init;
> +    dc->realize =3D mipsnet_realize;
>      set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
>      dc->desc =3D "MIPS Simulator network device";
>      dc->reset =3D mipsnet_sysbus_reset;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9r3HF47jptiQlX4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPVoACgkQbDjKyiDZ
s5Jetw/+LizyhaV6sECK7hs0ZFnFzOYGo78xwYx4W6ZZn7tbKkgG0o2OgJP6VuJn
sIZQd7TwOa57Ca0HepehcyJK7WjuwdbCD+oOUayrhZJIM4PMENTu2GzZbo+hoXi7
nbjtqIU4HYEjOUtB+wCI19iuxFc8rfwYdm8/881x3s0OD/HfDgVRJHTYVjf/9zRc
fBJCFkbF7QiFYwyvWTzKDPAoCJHOeXfCPxQhE3EpWPiA2HYOn5ubsIEifNHtEQLG
lSshwCp7icutHMD8JYH2LSFZ3zI2YUfT4hJqcnxm4I1WLUDDk+dQPjA05a9/Zd8c
cIbNmK6x0o+EP79rL+uvGFtq6UzEu8w4PwJk2qSgN/L8iqdHNUJatXs/x7cSa2gf
k5MyCKJ6mMUArEEGo6p8TyPHniL8idsbRq4n18Lbp6vDOO2ZTW+jiMOnKbEb++2B
pDtpd8N70zmq/1xBA50S8rmFV61/ny1rzN6MFRy94BDHz7+HuihZm+cWe/64DqwK
uEdt/w4tNWR0Vdc6hfWknUXLxv1VFTySGcYhYhe0ES5whQythrN1roGD7HuKGoMO
1Tqxpe0qLLJ0UhezWnIRxFrgy8SUnKh7Atw36YWCH6bIfYrMZ6gANGiX3UMz8mUK
GouVdErwdX4bPmtYxEaozCW2K812u9sMANiZoyHYacCAnr45u7o=
=AqMn
-----END PGP SIGNATURE-----

--9r3HF47jptiQlX4s--
