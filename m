Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9917891wrt;
        Wed, 5 Dec 2018 14:40:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WEnK9mVbnKg2IJ5P3eqvkdFOKeEekogAEi7XnlN4tsfsnnkwxxebAM4ahiYU8ItlW9HdCE
X-Received: by 2002:a37:6982:: with SMTP id e124mr24493315qkc.50.1544049657027;
        Wed, 05 Dec 2018 14:40:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544049657; cv=none;
        d=google.com; s=arc-20160816;
        b=fNQ1hdzr4rAW+SVzCprU5fq2PElkVIUcUgQsJOhxuW+j5OJtC8jOZOx9x8uaEkV96r
         EYOuLUy09X8N9I8L20haZlgZ9Jv5aKc5iCX7A8MxtWALRncY32DQ/1Jjg3qU9KCJMu2v
         Tk3g4M1n2qX1+B66cu/s8sbFAwhZ/Q1YZJVor5+iHfS2aYusmL8VV3Fw8NkVHn7NoBmZ
         4oI+tCUI5DEzUsOdK1rPNBHDySx60cdW7q0MqNa/lzICmRLQ/8Cgah8zhe1RPRzV97JK
         gPRspW7AhQyoIVm+H6glbwSFjymd87wK8x3nP7JV4MHz8pk8LGkwdpK2+wQawQ/ld+6y
         5oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=bYjorqJqVmBqN+Our1QWPH92i9B5KgYB7bGrMC2r/SE=;
        b=szYBOhKPMpnNK1o9uFFKEeSN9P9jWXkDz/KZKxuvKJ8CJ4TII2n4pbrPmUN2YsqAAl
         tdnT83AnklSM/BV4g3f26p4gYhjnK83gaE71mTWCINHM3gkiXhaI14Hu6NjBSuRTalmd
         cD5KkcUhb31rnhHQ3+qR/arBzq4Ik+wv+04UQXGstavfNd03hvi1qgdCbixwmm/TKUFG
         Yo2Ke5zRMHY56wDV0LZWy26/2X76urvWhMTVJAVw5SnqlhlnE9HQgE0nxCN53EMi3B0U
         PYzB30MDycOwGUD/bQYpp5PrX3jO3nYuOTBqXB+sJE7LqCDJz8GlSdcxce1RKHUqZATT
         g9Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=RCWbggx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j29si8329492qtl.88.2018.12.05.14.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 14:40:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=RCWbggx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUfqi-00017j-E9
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 17:40:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfok-0007vj-9z
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfof-00053J-Js
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:54 -0500
Received: from ozlabs.org ([203.11.71.1]:58053)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gUfoe-0004Aj-LR; Wed, 05 Dec 2018 17:38:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 439DCz5QPFz9s8J; Thu,  6 Dec 2018 09:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1544049519;
	bh=sYrt2m/JAVNQfhq2rkWhLyrQPiMEfwW2mVoMzUh/AQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCWbggx3036AQI5dzqKpxRwCePGZiq+Twaq2w31osgZntCBueAq7o61UuKZynRHqp
	e6pKbRiuKCAODf+rvmcw2H3iAUnV8hANe3d/UkmdwaTY5hvLU1QNOckiLeNlZV3Gsv
	OiFjDpkt7C7koEVIqwv7ZzfQ/piGdB/Q00NPFCPw=
Date: Thu, 6 Dec 2018 09:29:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181205222925.GF768@umbus.fritz.box>
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-3-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline
In-Reply-To: <20181205205827.19387-3-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PATCH for-4.0 2/5] spapr: Use default_machine_opts
 to set use_hotplug_event_source
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ioK1T2XeGPA


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 06:58:24PM -0200, Eduardo Habkost wrote:
> Instead of setting use_hotplug_event_source at instance_init
> time, set default_machine_opts on spapr_machine_2_7_class_options()
> to implement equivalent behavior.
>=20
> This will let us eliminate the need for separate instance_init
> functions for each spapr machine-type.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 80d8498867..f6b60e6fbd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4240,10 +4240,7 @@ static void phb_placement_2_7(sPAPRMachineState *s=
papr, uint32_t index,
> =20
>  static void spapr_machine_2_7_instance_options(MachineState *machine)
>  {
> -    sPAPRMachineState *spapr =3D SPAPR_MACHINE(machine);
> -
>      spapr_machine_2_8_instance_options(machine);
> -    spapr->use_hotplug_event_source =3D false;
>  }
> =20
>  static void spapr_machine_2_7_class_options(MachineClass *mc)
> @@ -4252,6 +4249,7 @@ static void spapr_machine_2_7_class_options(Machine=
Class *mc)
> =20
>      spapr_machine_2_8_class_options(mc);
>      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power7_v2.3");
> +    mc->default_machine_opts =3D "modern-hotplug-events=3Doff";
>      SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_2_7);
>      smc->phb_placement =3D phb_placement_2_7;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwIUUIACgkQbDjKyiDZ
s5L8hA//aK/MVG92n7nwd4e0a09zuQvWu8abkH1rPFBnLmWR+WrAkyXNE1TuoBT4
hLLEdJB/kx7foKkgUqlN7geUWPfzF3kG+QfxA/IscZ8mulmuenN6ATb/l3xnBEwu
rtqDkgdUCZmbztL/2ta9DDhbmFRUTzhtEaBIUKTllOK9Ezj/hz+leLnMQfNq837X
vkOOb+mEEFH3PS6ve/+LvrIW5Yi8l9QoMbu7KhVfnrMSmQnIrTSV/eTf2Mpivpke
ZLQtQ7DK3xWMvpz0WvTZL6kiQjFG5Pn9oH0TCupPEbGDX7eu7msrozOTH0aegi9l
fP94RPMnmbOkJ9FxrRhSzPRut3rT8TSaJof1bC83z3YtDjRBSnp9Eek+vpWgmJzO
8qz5I0o83d9svzDAjxo5m928FmWXVZ4YdCVokj9eOzxMXCmosFwiyYDj8bPdMPAm
E5x7OnvPcGkqngqS+TSuzaX4kyut5dGE2t67cElJ8sOYKCyz1RU4f516T4CySno8
xyidqyZw8BVSTZko6eH37bn2ivZ5Qcp4LwycISaW6Dndr4/IMWqxpKs3bEpJNGwN
u+0XcRJC6vCnu2Eq4OgJ3JtuWGkuEGPye6n+Me5fWECbRt8keiVlI4fJtezoDbbd
S991ekihmMSWYXdOPaJozd2on3qyueuTDkWwRVadu7nhLaVLcqw=
=jo03
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
