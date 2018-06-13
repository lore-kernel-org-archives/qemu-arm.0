Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp783017wrq;
        Wed, 13 Jun 2018 07:39:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLwtd+8rrpqPo5u8S0mhvDml/D3MFPVdu3cFbxIkfARg1p8npfMaHXLTdCMBdVJBPLx+af9
X-Received: by 2002:a0c:cb13:: with SMTP id o19-v6mr4633426qvk.216.1528900783756;
        Wed, 13 Jun 2018 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528900783; cv=none;
        d=google.com; s=arc-20160816;
        b=jSE4bvoOO7Rpnoqmzo09Q6eoppV8pfC4CPJSs343+5HJ3DJtBQCQXtvtjJaBQSTf5q
         DzSkAQ2vZe/Qfb0ew6ICRv6hSbfEBDOYyAVteHvRVH/C+AToYcDodj83VYMgyP2HWk4N
         jwCNIN43vTFXN6tVW5Jsqy4ZF3v/Ha0xHMZvSzcqIQZqdZTylJZWok27fZG0Uv81SonB
         VkAmedlKEAt5oTvlrvNphlX/4ZZwTAw5hfDNxeny2yzechPbritmAv/RIGb4r4NfEX0w
         esqnTy7IhPNv6m22XWYBl/NPq7O7sCLkxpR5KEIGajJT6EP7njBWg2NsAqofOXRFVbuk
         OLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=EvtWU9vD/Z+Qt6lsHIdSHRLgr/0VuoOLXOQGGAhrrSY=;
        b=UcHvKjMzNAan2S7tyEVEW//uSd6qiNp4IKby9NBieU7Ir1uRSGqnEd2elrfXFoBFcI
         BdC9DwUfx7rAZZhkI8hRmAOq0isl0CNh48UufV04Fz09omwlByIkhnobRrXGwcEOjJtK
         OZv5uJj492iQOQeRdwUr4iF9DR1ACx3u8opDczUPyhmMh1UdsJw/ftqKN78Nvy30bo5R
         Pf7EXiLyLCrqSyxAD0USiRo8jFTFwKlDZJ+tOc/lx/AUo0hwvNGhA6Fjp93lJaogOj52
         HCwHDAjkAn2xm/s93PkAyglafHNyDDwWBevkKK2gpOOslxPDqd1KWO7pOERfw6gRwQs6
         dDCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m129-v6si438608qkd.87.2018.06.13.07.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 07:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT6w3-0007F6-9w
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 10:39:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT6vl-0007DN-Ae
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 10:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT6vh-0001xQ-Un
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 10:39:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50128 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT6vh-0001wc-QG; Wed, 13 Jun 2018 10:39:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 485C44021FCA;
	Wed, 13 Jun 2018 14:39:21 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8C0A2026DEF;
	Wed, 13 Jun 2018 14:39:20 +0000 (UTC)
Date: Wed, 13 Jun 2018 15:39:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180613143919.GZ24528@stefanha-x1.localdomain>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
	<20180601144328.23817-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H7BIH7T1fRJ3RGOi"
Content-Disposition: inline
In-Reply-To: <20180601144328.23817-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 14:39:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 14:39:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/armv7m: Remove unused
 armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dD0HCjZRsjpt


--H7BIH7T1fRJ3RGOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2018 at 03:43:28PM +0100, Peter Maydell wrote:
> Remove the now-unused armv7m_init() function. This was a legacy from
> before we properly QOMified ARMv7M, and it has some flaws:
>=20
>  * it combines work that needs to be done by an SoC object (creating
>    and initializing the TYPE_ARMV7M object) with work that needs to
>    be done by the board model (setting the system up to load the ELF
>    file specified with -kernel)
>  * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
>    arrange to propagate the failure outward
>  * it uses allocate-and-create via qdev_create() whereas the current
>    preferred style for SoC objects is to do creation in-place
>=20
> Board and SoC models can instead do the two jobs this function
> was doing themselves, in the right places and with whatever their
> preferred style/error handling is.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/arm.h |  8 ++------
>  hw/arm/armv7m.c      | 21 ---------------------
>  2 files changed, 2 insertions(+), 27 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--H7BIH7T1fRJ3RGOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbISyXAAoJEJykq7OBq3PIOs0IAKAH2H2D5E5P5jGpKM7t0Fb8
H7ohNN/GM1Xeyzny2FqaGZQTEsktHTpF52YwryqazQO2oZdjw/FuEMfsHaTQEgtb
6F3XnC4Hbrw1CaRrv1wlUlMmVxlJqcuWaeal9dbVr++X7son3l3itn7oGOMpQQwT
yPFGwHRaxLaVtxEYXW02avXgj+Q64DXWNqN75Mckn4wYfGk73R1TWUVB955+K2zl
lmc5M5pyWybeBNbRdF9o6FU7oykPU2iFveRZrqTzU5aoWesob55Hxt4z7HqBhGOn
o1wGjkIghJDBsKnSbkPvbekxQ4cSUuiq7gWi2wPpl2Mrsf8rMlVGJqG93XUVOXE=
=3dWH
-----END PGP SIGNATURE-----

--H7BIH7T1fRJ3RGOi--
