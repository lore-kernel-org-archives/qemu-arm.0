Received: by 10.25.21.156 with SMTP id 28csp2137611lfv;
        Wed, 20 Jul 2016 05:58:12 -0700 (PDT)
X-Received: by 10.66.219.105 with SMTP id pn9mr74392733pac.25.1469019492502;
        Wed, 20 Jul 2016 05:58:12 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ly10si3335546pab.55.2016.07.20.05.58.12;
        Wed, 20 Jul 2016 05:58:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1753790AbcGTM6K (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 08:58:10 -0400
Received: from ozlabs.org ([103.22.144.67]:41903 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753391AbcGTM6J (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 08:58:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rvcQl5Rvgz9t14; Wed, 20 Jul 2016 22:58:07 +1000 (AEST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469019487;
	bh=SiFfmee68TULcx1I1RsKceKut/0MSxyVimg6cT0OObg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOEVtkeNhFG68Y1LUQ7E+pvPw3TAz4GjciTR2R5Cf3VZBmLE9liUYy2u2ZTy9MsqC
	 aeijxaZqUEZu9KbPQXri/50Ma1nuzCo0pmyHIHPy3h1Gf0//sMl5rHNFutO9CtPJ7J
	 TkQD/n6votEyYsGpZMpdcSNI8OSZemRlVyVIyVsA=
Date:	Wed, 20 Jul 2016 19:45:59 +1000
From:	David Gibson <david@gibson.dropbear.id.au>
To:	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 07/10] Convert cpu_memory_rw_debug to use
 MemoryAccessType
Message-ID: <20160720094559.GA12087@voom.fritz.box>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
 <1468990980-4598-8-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <1468990980-4598-8-git-send-email-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: OFYRIUgePF2A


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 10:02:57PM -0700, Andrey Smirnov wrote:
> Convert cpu_memory_rw_debug() to use MemoryAccessType as a way of
> specifying memory reads/writes. This makes caller code be more obvious
> in what it does (previously one had to interpret 0 or 1 and remember the
> semantics of the last boolean argument of the function).
>=20
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj0hXAAoJEGw4ysog2bOSoSUP/jQeRD9qCcXnNwrBB8x858Rs
THhJYb48sBUHYSupwKIyUY3lT4sagCxyO5EhfB2rFx3f4oEDegmPrTOrfI8KVQLp
TP9Ex0bprzI1CVUjBOPhLQNx0vsys0oa/On6NR18DBULj6Tixfpvapr93qAfQX4v
Vn3kZvyX1qiy++8NLiXZaXenIw5qh/Zmzh/jEl2tMqk8hY6GdDiKAxZLQGTXvInx
2cgzjYgnQiIaqVL2zP+WpQxyVlajKlFzY5oRg1P7Poj3V74f53Tg9NfQvO3bSjco
Wx/fg3MnVgKMmxccHmPZBSGJjI7rULfWM0p7ggawe994c10NOZTaupT1T+WuZdyn
/7XoFFlG5pvZ36OSn5f2kr8093F7NqrhqqX3w3PRMaw6oJ5M7Tj/9f+0C7Yd1ePE
QDytN4NozwC1MnU9PZPxtSgGo9YVBYGTBw1ANE/vmu7PyHUN3QRsa+0VkDAqjSlb
x2krrwmjhr3BM+Ytlz45y6t+F1umIZXNXHJeJAzGnKZq/w5N9+6xCMGgUcZVuBqQ
0tgE3zAyTQOO3gKNJ8oRCbEPHm2NX5Z3a8wSFuQYXzElFeuQzyuC0OKdpYX3f9a3
JVulJdShHuLg7iVc7yCFCOpeavZi7s+giZ8NCqYTwyofY0dtMXEbLxutR1ZdYD8X
wwnhdiVlkmPyjQCDv/Ut
=mRmu
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
