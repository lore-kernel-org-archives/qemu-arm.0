Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4701300wrt;
        Tue, 23 Oct 2018 08:47:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dDKUZAm6CzItAih2Bv25+693bOxDSuMQME8QnbZ19HwfLECRwccpRfc38UTAzXmF+ftdwc
X-Received: by 2002:a37:c653:: with SMTP id b80mr6857783qkj.245.1540309642083;
        Tue, 23 Oct 2018 08:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309642; cv=none;
        d=google.com; s=arc-20160816;
        b=d0q8dbRlApWuOTpg585x1T4DWSY9LMi6epMHy6keFQa2afGDXWTxOKlej5Myv9Kur9
         DYA45DbEgnumSuSmTVlDDTxe0q3Pr+IMxVoNnveQne+BuGolOCiYPIG20SLLbWzXBB9F
         lyPF3woDcVznO0xQSGSfJH/Mlccenxzp0dgZy6GuvezEZoW9zqA9RHOmRUVH+QscPoZO
         0c0liyebeghIYYMVtjBm8yGT20ra4ooHJZ4Re+EqSe1qLoOPI5dV5X3IQUoQnn+hDBfk
         XGfQG6Af/RZs/wkbf91cgh16LShDVfRxVcD71VpWEWGqn5BckEURgxVVTrh0+8hp77Pu
         ++Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=iPULf/mCAd+fWugSn+cUwwMNfh0bTlHaqn0utcAZCNw=;
        b=rWhe0KyVsxI97SVdZ85A3VBZKztpWolcbZxoD3gGyL1+TUbd6gvbeXxbHhXn01qFlA
         aLaSyg333NoLj8loUNEkvw/Kg6A75RxZWB7xWW1t63J++t7/Fd67P5m1ZQeIf/qwTxWx
         W46IA3ZOq/ogRowu21ObaFuKH5Or/FZ3Wr+UIP7KILwCwrrf2ClLpcvG3I2kyztLExdX
         7Xcm1zOPxzb2jv+vDHVQQBMzJuo0cg+z35CGS58dgszRXYrm4I70eHyeG5A4jExg3oxi
         Zxfe5tkA41uRjlhNzsxAApzJDlMxBtAzd2kG5XmGuuS+akx9Yq9wyO8ePAHnqvY+VZpT
         NiAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=fADzpqIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m20-v6si190425qkk.38.2018.10.23.08.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=fADzpqIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEytt-0001tt-Fq
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:47:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhh-0007I5-Hp
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:34:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybR-0006g2-Ko
	for qemu-devel@nongnu.org; Tue, 23 Oct 2018 11:28:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44371)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybP-0006c6-35; Tue, 23 Oct 2018 11:28:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj63k9mz9sCs; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308490;
	bh=PgNRBtNdxNFdiD45kveSU5HWE8HI7zM70DOuI00H3Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fADzpqIsL+dMtI1JOwxomdM8ejyHBg2p4xgitBfYER4Uy/QLVpS1nbh0+uJ4DKHGe
	bwsgNkgGWpSE19YRgNW5rNqDi758nqoe6MHXrgxFR40ZIngg+pKxYSjR30sWAmBYUZ
	Tj6Vnc2149mAVRpbXcC8bUREZ2LE2sW86eHXmrfA=
Date: Tue, 23 Oct 2018 16:08:13 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023150813.GD12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-6-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-6-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 05/45] trace-events: Fix copy/paste typo
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
X-TUID: vrmIFkposj6P


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:42PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Missed while reviewing 5dd85b4b486.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181002212522.23303-2-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/timer/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index fa4213df5b..ca9ad6321a 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -56,7 +56,7 @@ systick_timer_tick(void) "systick reload"
>  systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read=
 addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>  systick_write(uint64_t addr, uint32_t value, unsigned size) "systick wri=
te addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
> =20
> -# hw/char/cmsdk_apb_timer.c
> +# hw/timer/cmsdk_apb_timer.c
>  cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CM=
SDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOV0ACgkQbDjKyiDZ
s5LzKQ/+JeGuzYfQU510G1hxIW1ZS17M5QYhQkpELWUAIXY98JHrlqbyOvH2to16
6QjvpsEkbJK5eJNMh7eTYRCiySlNUaVALarclyC/adkhn9j9HcP8gJZ59jpCheoe
C7nte8GH14gMDBCMLXS5yLHTOyAiVRp8fHH9L7Ljs+jDtIu4aIWQkNqVMn5gjxTS
Hs9vUfok6PtRbiyudKpPjDOg1gTyX3TqhmDRwtbYaxCZ8zEZ8JWTmXKGEOTXq1j5
uvRrXMujvBS+2g0DReg6FyeJokjadEnBMjheDPrNY3gWNYm4m3oCkLGMkbkq+ESU
HSp98b54dXH1lRnHk+4VOMCqhxPY67UWr4LX0t3mRxIu3OIN7sEEg9kMCKo5eVDt
5ZWlxz+KengLZUzoa4YbPzOOTV0VbkQOGYgfTF09g/JLjH9ImAo5SE0ijnTfTptv
iA2c3+Jst+qokJ0C8HkzbmbS5eCi5NpLk/tx/OZG766KgONHnafozCJq0AAPSKgz
IVAViNVfVKpayRJS1zCeUdVf0xNV3pip/vIayRXM67d2xOUQtWymJVhMB75PBXzr
qgbj3gkqzaKJ70fdxTe9M/Osdy18EKuNNfrJoPujuiqXGbl1IuHzrH+b2viIfM52
y+CPI9InOLujfhqqp4Dg+jCCZDCCQv4rp4MuYqyrw4wFAXZ88Sg=
=OmoP
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
