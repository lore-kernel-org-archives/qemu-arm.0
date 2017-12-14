Received: by 10.223.159.74 with SMTP id f10csp6596353wrg;
        Thu, 14 Dec 2017 09:46:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBotdLf1ZmvIfkYoTm4aN/w0R+hgOZ24/2llVYXRMRYB3fjuWnoKzzijKYrQDXYE/orN5It+u
X-Received: by 10.37.198.9 with SMTP id k9mr5051895ybf.79.1513273567383;
        Thu, 14 Dec 2017 09:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513273567; cv=none;
        d=google.com; s=arc-20160816;
        b=RDILc+gcCxq8aoXXQE4BFVDLjVa+4YpuIKdlUkWkZruv+NKs8H6ZorS8L2OrczIAiI
         VmpVo96vEn2tmNqo9xzr1EQpvO2LmQbFlWidUv78KkBPgh07/goU7FBzt+TYKc1Um6Gg
         dLG6b/WKZfu7O8oWA/ro8aypQunj0LR2UxSi+3QrogYCiWDYrRzQeEWSmOXEsx87roCp
         i6kaOP1xUo4UAtgzLFz0jx+cV6A0akzJBaIAYvhBQwQ57ooyiuqBkCoqcWU6veEiPaKA
         8JNZcJIv6aObIzFPAX2v78Ts+jWa2VuNagbjRy3IhB00mP0ryEBBPbdAXwRxdNc1H+ZX
         CEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=s1nFoWVl3Z17//zE7PAyDGof71QKOc3UBH+qGuQvrN4=;
        b=Q9UUYkCOKZwk+6ndBQwX4EaM+vIXInGHO9vZyqvCE+8iuKi3DsQ3tDYNUjVEE0q1yo
         HgnM/OeQZ5eK34r+iJp5jKyX4NS5+6A22Ffj3XJO+h/YLWISjLIXNBBAMTBPgdjEknDH
         VpfdspCPWb67AajSbHeAkvOWa6dqJbxs2CgebOEOLOe41/dy+OE8rlxYYpYxrGCCXolJ
         585UpQsFqlzZnedHO1ML2EetD27qogtZJs6rxWgvtOw54H/K6hRoF7SVOU4YLD5T3cK+
         k52iHX/m2n0QvKmc3K0sLVkMWTgvVyssUcZFjdM8FLnqiKn9WQxgaMkAavkDZgIqBMa+
         L6kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si941965ywk.588.2017.12.14.09.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 09:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePXaA-0003uv-PG
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 12:46:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ePX9R-00066L-Tq
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 12:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ePX9Q-0006P8-VN
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 12:18:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1ePX9H-00069C-9q; Thu, 14 Dec 2017 12:18:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75FE3820E6;
	Thu, 14 Dec 2017 17:18:18 +0000 (UTC)
Received: from localhost (ovpn-116-163.ams2.redhat.com [10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5E1060C98;
	Thu, 14 Dec 2017 17:18:11 +0000 (UTC)
Date: Thu, 14 Dec 2017 17:18:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171214171810.GA18098@stefanha-x1.localdomain>
References: <20171213213557.26561-1-f4bug@amsat.org>
	<20171214093907.GA14433@stefanha-x1.localdomain>
	<7bc179c8-5699-98b0-8a5b-b4d8e6843b25@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <7bc179c8-5699-98b0-8a5b-b4d8e6843b25@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Dec 2017 17:18:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/6] QTests: use Python to run complex tests
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1YgzcKBXm/+r


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 11:33:03AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 12/14/2017 06:39 AM, Stefan Hajnoczi wrote:
> [...]
> > Device qtests are better done in C than Python.  Python is not good at
> > binary I/O and porting this to Python 3 will be extra work later (Python
> > 2 is set for End-of-Life in 2020, see https://pythonclock.org/).
> >=20
> > More importantly, we already have libqos in C with a guest memory
> > allocator, PCI, and virtio support.  Fragmenting the small amount effort
> > that goes into device testing will delay libqos reaching critical mass.
> > Critical mass is where libqos provides all the infrastructure you need
> > to set up a device and focus on your actual test instead of machine,
> > bus, or device initialization.  Starting a Python device testing effort
> > will just lead to duplication and 2 underdeveloped device testing
> > frameworks.
> >=20
> > Is there a specific reason why adding SD Card support to libqos is not
> > possible in C?
>=20
> Short (joking) answer: Would you write tests/qemu-iotests/041 in C? ;)

041 is not a device-level test.  It doesn't poke device registers, it's
a functional test.  In my email I said I support using Python for those
types of tests.

> Now thinking about the specific reasons...
>=20
> What I intend to do is add qtests for the SDHCI implementation.
> There are different revisions of the standard specs.

It would be great to have SDHCI support in libqos.  PCI and virtio are
covered today and support for more busses will help reach that critical
mass where tests can be written for most QEMU device models without
first writing a new device driver framework.

Please post your SDHCI test code, so we can discuss the details and
consider whether it's more like 041 or more like tests/ide-test.c.

Stefan

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaMrJSAAoJEJykq7OBq3PIzEwH/2UjYhG5egHJVC51jcUE7sY/
LccTWkm8yHGnxbKQWS2hCZcjDKVNTHCgauTqD2vLxGx1s+WDAUuIqLjp04LU4ax8
CjNfSCuB5JJG3BZFj2ExFq50TOUKWavcBcbm7TC18VMUl2LjienwwfYvl6S4dgzo
SLqh+8Xq1Tb/GpnQgnGJyOEi7n8lziZHSyMPzeN5mCKgEkLVTfyAfH+pBefqFOTZ
xFfAwfH3+lCM0FF1ZxqRIExWd4AoUZcjDq+EaxhOlyzvpiLsuolxouahEtxMSR7K
Dcq9rSyh3xku2Nv0eTYoqUfeQATFXAi13XXQb4CLbpa/BFad7y/QL2jOA0jpszI=
=6UhA
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
