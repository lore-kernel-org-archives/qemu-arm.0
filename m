Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4696000wrt;
        Tue, 23 Oct 2018 08:43:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63GSnGF2vv8Uy08fYE3tAqDWLGREnA26uyn1nrAsZ9jBgS3bu52EYgzQ04jjz9X6cKRLVdC
X-Received: by 2002:a0c:cb87:: with SMTP id p7mr48074458qvk.63.1540309392779;
        Tue, 23 Oct 2018 08:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309392; cv=none;
        d=google.com; s=arc-20160816;
        b=HmcT6ytnrP5wiH5TrUy8ky3VpbjM07oOxdUKyyw0D1Ef0ru2Gr04lhzzEXPQ4WSEBY
         +BfV6UnBL4lE9pCzzkI9Rp4Y2hMeIJVA0zPz2llcwj2u+Lqw3223SnsGty9r6Cg+6Ff8
         rclT8PZVt0o+n95QVCf3WP9BK/hK90viIl231Jbu+uAImrqOmFtgM1m1OT9MyaxqrzvR
         jGrZo4kfJ1MK05BESB7cbcMZHKeHJuFIyYqqoBzDnA7W4osG4gdxJmOwZmBrKurp9N4c
         AeddscjNJirJDQRFJIyEYIHSusljX2Jk7oUFj7PPP5nzUGZ5jB1KH1dE8T1jxeHn1Qah
         Zb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=XdI/dZ/Dem4MAmc1ZeZdqUDNKfKRax/8EvqI5POegi0=;
        b=XYb028Ns7DrZHZXlRCqs8Q2bFaAQIev5agt+eeUTtUue48X66UiyXwprcg8E066jHC
         1T9gmUKJW6BqOVLo1WbnUa5WPOIzsO09GYET3ELLOdJNTsKP9PTiikJ8auKB5pvJ7Ovo
         DbJpl+jiLDfm+vTdDcPGQjEgPbXe1LvWDF42KDVGtcZ53BoZ43ZQjjR23Ah4IYRqPxLt
         xfEWR+mp1Kar58Bg4ZSWBpSQgZGKHrsp5yPtiIGzqdWaMKEmAtLFaKnRPpJ4Uj4mOxcy
         aNoKXIuin3Gp8Nu/CsnAgEfH2Bm/JNVTMbURrwmGzKwjZkAGxD1O1Yep1P86Mvc+uvqu
         V86A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bMF4Ft9D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w31-v6si1247365qtj.360.2018.10.23.08.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=bMF4Ft9D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEyps-0005mV-7J
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:43:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhU-0007C3-Ay
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybu-00070K-2m
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:47 -0400
Received: from ozlabs.org ([203.11.71.1]:55061)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybr-0006sb-Ae; Tue, 23 Oct 2018 11:28:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj816h9z9sNr; Wed, 24 Oct 2018 02:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308492;
	bh=vQoIAnxEk5We/wFgSysi6WoJaVxV7bh9PCS+torRFGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMF4Ft9D/Rfmj44Br7vRgzjOvaJvbau6PmVdsPhTVbfLVJfR/OYYm4evIiuCFI27s
	yD5W2pxBeA/nd3kw3J6wB1fpQt4exJ8XsFbonrzWFP4gYXnJkUBLbkSMug/2ZnFy+A
	S9IqxidYmt2YhxisBxflgD1oFbhI7DSzAQ3oayAU=
Date: Tue, 23 Oct 2018 16:20:01 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023152001.GN12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-18-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CNmCRe8Sh4keFKJ"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-18-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 17/45] machine: fix a typo
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
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Li Qiang <liq3ea@163.com>, Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTY6xBYj0odk


--8CNmCRe8Sh4keFKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:54PM -0300, Eduardo Habkost wrote:
> From: Li Qiang <liq3ea@163.com>
>=20
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> Message-Id: <20181010161025.34796-1-liq3ea@163.com>
> Reviewed-by: Stefano Garzarella <stefanogarzarella@gmail.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1987557833..da50ad6de7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void =
*data)
>          machine_get_memory_encryption, machine_set_memory_encryption,
>          &error_abort);
>      object_class_property_set_description(oc, "memory-encryption",
> -        "Set memory encyption object to use", &error_abort);
> +        "Set memory encryption object to use", &error_abort);
>  }
> =20
>  static void machine_class_base_init(ObjectClass *oc, void *data)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8CNmCRe8Sh4keFKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPPCEACgkQbDjKyiDZ
s5L3+Q/+JhO7ZX8Js1h3E7W084g9DevCgdEkiDxRw/wUcYNsu/YoIa1mAw28AonM
I5ge5kV4xkqq1uJO0ZqnFPgi4GoKF+k3/i8/5GNLnl9cF97YWTxmvJOb040D9oaN
VsGoPfErDy0MW3pZNCTzTr3+MKAKoNT8yBFjfeSGMiOrRKeExPlHx/EOrm00ZDPZ
e5jcJU8h+34Xu6eBud72hstSiFYrPN/FaZChNJq/TGH+DUqGs8O1qA77B7ELc+Ne
VkKt1+OoIkWzNz52I7NKGYgWPh1MWRvTErzr/2hU4wg0CdRelUmgkLHHCZR211z1
qpkWqb9R+eZ9Re33QeaEqdpSd1rupBUGEq28PVOgmcZFvvzQ3D1vHvQbNN1oeNiH
3w2RcIZn1H+7xuAA1U7V+R30RNqqvr9K1NagvOJe8g/Wa2V2sMbJBPMMJR5WG7Rs
DXpl3g9esM7llDmSV3nDDQg4l8lClSpF1fleH0frB3AQMMzWwwcOVUVSNmpCnoh5
3oalkRlmUSn/bBHks0WNR4thV7yAOsec3cooRtJUAH79U04j4Q9BWVsb+KPBwsCQ
ziDcrNjE7DMc6QAPwKirMXdNRu+ytSKGgk7KXUOIKkbU9EkJ7lwpFqALtFFxUqnL
+Zm/5b2ZTid44ME/VfnMrvuvM+7WRMMd+M82Bz0L83kt5BjfUAo=
=WozB
-----END PGP SIGNATURE-----

--8CNmCRe8Sh4keFKJ--
