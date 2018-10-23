Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4688893wrt;
        Tue, 23 Oct 2018 08:37:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60805Y4aHFWAdkz8gi8JTPnlg6ScH4DmdqCEvXZrCI8DuRyG/qI/jzBJu/9P6yAc6ciO3Jt
X-Received: by 2002:a37:a48d:: with SMTP id n135-v6mr46672027qke.160.1540309055080;
        Tue, 23 Oct 2018 08:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309055; cv=none;
        d=google.com; s=arc-20160816;
        b=tj1slMjPapbmIErodPCxH6nLcnkLaqEXs0SpoHigWFlJHAxskbudipR9Yd0xEUSN6U
         To0CeU3K/eEdWnLL99O+1BJBQIp+esi9WZogj4JU0nP2kMOvqJPOFpolaUx+GNl3M9C1
         3VZF4yyFhDqBwGrbxnywMfIfiVzsgdk1wC8P2eNqilcmq4GeKA1aufUiOjqofW43B7Jk
         7m3KLdx4QPT2N9bN+umtJKspKNdPw48VKDDpJT3HFzu5Yp2NK1txL6SFlxPdXmh/bvkT
         hycg9VDmcD1CXfBo0ktN73qGe/KJISHd88huLlszBoc6lSYmNjJ6EGnLxRHt+Q30LYqx
         3Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=tcOz5xIkihR2GvuWM6Agum9UY1lWjtp/5f2WPajVt3w=;
        b=OYumv7/gPjE9UG7w3l1AvQMbAz3sJHmGWREa4G+6L8WKj1krJ56ZNiXr4RIxbHAJh3
         AMjf9NkBNqmWhM2Xs5JJ/pgnbBQ/aiggcldSMGn+eLbzKtnrkHwV8yi9JvCjmuALRDIo
         7GLe11MpQ0m8AM+cwy35Bg7fyxqnHdEMAuOxy8KmdxIUaHDY86USLhACexjML5tF7giU
         ORo67UfQTWgXvnUGhkA9N+75LMnN1lvu88+uErdmkTLdZYB5YtQqOKxc7rlaWzxyMYiR
         EwiWi/uon3YIrCQ0mYH9XUnI+qaYb4TN8o0FV4sS9316yheiI5Q7bub2PVL3RpmG9QDH
         kc5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=SLQZbuzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b8si1300408qvp.128.2018.10.23.08.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=SLQZbuzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEykQ-00017B-GY
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:37:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEygn-0006ks-A6
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEycV-0007ek-Sl
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:29:25 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41903)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEycP-0006z4-7c; Tue, 23 Oct 2018 11:29:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj86JGCz9sNl; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=fqeeynZbmnecugOtrenOTDHyGfqBKhzkw6BLHSGnUNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLQZbuzAPMH7RqUfJyg0NLZRPaHrAVqE1hWsHwhDgLDesfZjkF8y8eizEyZ7IEGuu
	ky+RTEiWHkpyE1vmi9cSG4eNOt59cP00A6pBFpyUtjvypDISlNwbKZ0U2HRDqEX2KL
	WCwTKV/GJPCS3NrM1Nj7Z2Joi6p5ZuMOxJvhbVgk=
Date: Tue, 23 Oct 2018 16:23:50 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152350.GQ12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-37-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eLe8FOcWSbbyMVJD"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-37-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 36/45] net: lan9118: convert SysBus init
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
X-TUID: go8VoS91ff98


--eLe8FOcWSbbyMVJD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:04:13PM -0300, Eduardo Habkost wrote:
> From: C=E9dric Le Goater <clg@kaod.org>
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181001063803.22330-4-clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/net/lan9118.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index b9032dac59..a6269d9463 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1320,9 +1320,9 @@ static NetClientInfo net_lan9118_info =3D {
>      .link_status_changed =3D lan9118_set_link,
>  };
> =20
> -static int lan9118_init1(SysBusDevice *sbd)
> +static void lan9118_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(sbd);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      lan9118_state *s =3D LAN9118(dev);
>      QEMUBH *bh;
>      int i;
> @@ -1349,8 +1349,6 @@ static int lan9118_init1(SysBusDevice *sbd)
>      s->timer =3D ptimer_init(bh, PTIMER_POLICY_DEFAULT);
>      ptimer_set_freq(s->timer, 10000);
>      ptimer_set_limit(s->timer, 0xffff, 1);
> -
> -    return 0;
>  }
> =20
>  static Property lan9118_properties[] =3D {
> @@ -1362,12 +1360,11 @@ static Property lan9118_properties[] =3D {
>  static void lan9118_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> =20
> -    k->init =3D lan9118_init1;
>      dc->reset =3D lan9118_reset;
>      dc->props =3D lan9118_properties;
>      dc->vmsd =3D &vmstate_lan9118;
> +    dc->realize =3D lan9118_realize;
>  }
> =20
>  static const TypeInfo lan9118_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eLe8FOcWSbbyMVJD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPQYACgkQbDjKyiDZ
s5I88A//V2rT/Wje9fcPNIEE/vTsOlANi2zMYzpQMDghToF2hsVOV+X5GSVEAfSW
ycqt7GFGayATKOVNCLlf9amGtevbKGLqcajoKXcpWERbOnKSCoX267pS4P4Dpeax
yQRT14WJ21EC9cKMtD30rtxPZl57K0zNXLVSPr4sU5UmxQc5Aki3OnChJ3YtAZr8
+yax5i79gsrn1YRqY5nxlPnmenJ3vMRLjv3ZCYhUS309HfSyQXl3orrMbWFNcF5u
JDMwx4s7VYPegh2aI+58O58Su+tTL2xcu4gQ3ADKNXLeBXDQEVG4Fvy1sJ5ZMILc
sjqXNKDDm0MG6L2SAue3zdDVIXnkiX7gw01gxDpWdq9fa6sVA1VH35Zqi9/KpZxg
Mkv7aWR4pfcGhH+M2HsFADvjdciYrVaVNWR0Lk7usaDk4AoM7C/dZDLj/osq0dr4
xQBZcRp1TYMRJuBa3TvmUATNqKu/CdNuERbhaUJ5G0pyWMzteZZ1piubzeaAN18A
snTrGYKsIZz05IHz+JARFdEcb0RzFXl14SotwpGLN9wktycBflfOZ1H+Fxi7Gqbh
rEnHG7xP8fwz3KGqrElP2au0BgcR4tQouQ2jCc7CqOHf+BOEcuLgF6lCcxCIk6+y
kYU+uHC65xoDGeDRpZjFTiRUhUF7lYc/iP5lKXKEXT1ZYhwBkaQ=
=3Zsw
-----END PGP SIGNATURE-----

--eLe8FOcWSbbyMVJD--
