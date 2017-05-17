Received: by 10.25.0.6 with SMTP id 6csp363162lfa;
        Wed, 17 May 2017 11:27:57 -0700 (PDT)
X-Received: by 10.200.2.172 with SMTP id p44mr186592qtg.34.1495045676949;
        Wed, 17 May 2017 11:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495045676; cv=none;
        d=google.com; s=arc-20160816;
        b=qIJAJclTuY1S2+99L7HR8w8HLeTVnpO1gz8KrFxbQ1Yp7PDkwB6+g7DG64KU0HHpkZ
         YVPPh10pht+lpoSHwilFqQyrPZXDzz6kugqrKhKr7Rz6/jCtAT7wQsLtgYRzdc6Vs1XU
         tgF4wLFVarWPXMX9Niyxxh8HHshnIDBO4TWvcJslJFShiVyQGo9JCC5NKVKTO4orVj7D
         VJpCPhHPBOO2xDv9qgs+pYrZWw876zNBAQHWd3eO21pISjwvvL4QYw6M3F+Gbl3CnnCj
         9RIdcbUCplY77xUQsLoPcX7WJXOLibHGIjvqq1c2dHTrwKsEd7Nj+dkESzMlqGdLBIbt
         oURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=XLZ7Lzq3SJMPdqvCh0wyNEnSvSZ2Xz4x1of9ExyglUU=;
        b=fD3ByPY36nz5pvSZ+ZLrfGA2Wfk62+mQAqWmWcCGyqvdQRFhIm/8gfkKoP4E3NX45O
         xE3HpzdZ4vuScjxR3dNuZwf6cBrwp4zMO40gz26B3lSAOpZ1BgVjjPTvS/jt2OdX4575
         YWVxrSt9S2kTeEdfsEow0DzIj/D7RKMmjN9pCrhNEYx21lu95r5GHdeGo0QHiGZW6ci1
         +2sImHMsGbC7O2MrlfVbiHZvYb4q3hwRjCxV6ZyluiYdweHWrv0H+5wBFuPjRuO1+QxX
         5zSC9rpTAwFVg4gDcVT7coZkhtQ3alr54l57P9/PMsGU2Kca5nFO6/F6m+pKnI8/BFkS
         fdlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l31si2947826qtf.186.2017.05.17.11.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 11:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB3fw-0003U1-Cr
	for alex.bennee@linaro.org; Wed, 17 May 2017 14:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB3fk-0003Oj-M9
	for qemu-arm@nongnu.org; Wed, 17 May 2017 14:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB3fh-0000Wr-I8
	for qemu-arm@nongnu.org; Wed, 17 May 2017 14:27:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dB3fh-0000Wd-9D; Wed, 17 May 2017 14:27:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A65B3C0B39C4;
	Wed, 17 May 2017 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A65B3C0B39C4
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A65B3C0B39C4
Received: from [10.10.123.244] (ovpn-123-244.rdu2.redhat.com [10.10.123.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 022CD1813C;
	Wed, 17 May 2017 18:27:37 +0000 (UTC)
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
Date: Wed, 17 May 2017 13:27:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <684185116.2952708.1495044580181@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uJjXCVmMx1Cf3e0aVdCPKVgv5KENaO4Jd"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 17 May 2017 18:27:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Je88sf1/xFu

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uJjXCVmMx1Cf3e0aVdCPKVgv5KENaO4Jd
Content-Type: multipart/mixed; boundary="MVOvNfIlKBVtafIowCpkLjdUmE1gikqoO";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Bradley <flypie1@yahoo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: John Bradley <flypie@rocketmail.com>, Laurent Vivier
 <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Geert Martin Ijewski <gm.ijewski@web.de>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
Subject: Re: [Qemu-devel] Add Markus Armbrusters code for Broadcom Perhiperals
 for ARM.
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
 <684185116.2952708.1495044580181@mail.yahoo.com>
In-Reply-To: <684185116.2952708.1495044580181@mail.yahoo.com>

--MVOvNfIlKBVtafIowCpkLjdUmE1gikqoO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2017 01:09 PM, John Bradley via Qemu-devel wrote:
> Also available at=20
>=20
> https://www.dropbox.com/s/gwuquw0kirstw7a/0001-Add-Markus-Armbrusters-c=
ode-for-Broadcom-Perhiperals.patch?dl=3D0

This content belongs...

>=20
> Following suggestions split my original patch up. This the largest mono=
lithic chunk is=20
> additional BCM device support from Markus Armbruster.
>=20
>=20
>>>From 0b39a04030d5a2cea4fcd2159d365580ca155b78 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Wed, 17 May 2017 18:57:21 +0100
> Subject: [PATCH] Add Markus Armbrusters code for Broadcom Perhiperals f=
or ARM.
>=20
> Signed-off-by: John Bradley <flypie@rocketmail.com>

I would expect that if some of this code was written by Markus, then it
would carry his Signed-off-by.  Or, maybe you just mean that you are
splitting your patch according to the device Markus gave (in which case,
a Suggested-by: tag may be appropriate).  Either way, I don't see why
Markus' name has to be in the subject line (the patch subject should be
WHAT changed, not WHO suggested the change).

> ---

=2E..here, after the --- separator.  It is useful to reviewers, but shoul=
d
not end up as part of the actual commit message.

> hw/arm/Makefile.objs                 |    2 +-
> hw/arm/bcm2835.c                     |  114 ++++
> hw/arm/bcm2835_peripherals.c         |  104 ++++
> hw/misc/Makefile.objs                |    2 +
> hw/misc/bcm2835_mphi.c               |  163 ++++++
> hw/misc/bcm2835_power.c              |  106 ++++
> hw/timer/Makefile.objs               |    2 +
> hw/timer/bcm2835_st.c                |  202 +++++++
> hw/timer/bcm2835_timer.c             |  224 +++++++
> hw/usb/Makefile.objs                 |    4 +-
> hw/usb/bcm2835_usb.c                 |  604 +++++++++++++++++++
> hw/usb/bcm2835_usb_regs.h            | 1061 +++++++++++++++++++++++++++=
+++++++

That's still rather large to review in one chunk, especially while
touching other files.   It can probably still be split up further.

> include/hw/arm/bcm2835.h             |   37 ++
> include/hw/arm/bcm2835_peripherals.h |   10 +
> include/hw/intc/bcm2835_control.h    |   53 ++
> include/hw/misc/bcm2835_mphi.h       |   28 +
> include/hw/misc/bcm2835_power.h      |   22 +
> include/hw/timer/bcm2835_st.h        |   25 +
> include/hw/timer/bcm2835_timer.h     |   32 +
> include/hw/usb/bcm2835_usb.h         |   78 +++
> 20 files changed, 2871 insertions(+), 2 deletions(-)
> create mode 100644 hw/arm/bcm2835.c
> create mode 100644 hw/misc/bcm2835_mphi.c
> create mode 100644 hw/misc/bcm2835_power.c
> create mode 100644 hw/timer/bcm2835_st.c
> create mode 100644 hw/timer/bcm2835_timer.c
> create mode 100644 hw/usb/bcm2835_usb.c
> create mode 100644 hw/usb/bcm2835_usb_regs.h
> create mode 100644 include/hw/arm/bcm2835.h
> create mode 100644 include/hw/intc/bcm2835_control.h
> create mode 100644 include/hw/misc/bcm2835_mphi.h
> create mode 100644 include/hw/misc/bcm2835_power.h
> create mode 100644 include/hw/timer/bcm2835_st.h
> create mode 100644 include/hw/timer/bcm2835_timer.h
> create mode 100644 include/hw/usb/bcm2835_usb.h
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--MVOvNfIlKBVtafIowCpkLjdUmE1gikqoO--

--uJjXCVmMx1Cf3e0aVdCPKVgv5KENaO4Jd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZHJYZAAoJEKeha0olJ0NqnQgH/A8PYV3U6M2X8nxgSdQAvtFQ
BIYo+cTVJ0Zpi9Cds50OvfGJat1qyVH1K3Dj/JFpOdRf+rvenzccnyNMuFp24VgE
nnnk00Scki+JmdFA8lyWTpzdNJGEXstWyW1+iErJh+kXjhPnkIl/LeahVQBPTV6i
xHtaQy0IjXMps3jRR4kH9kOGceQaFtE2FyFom5sSpagvXk7CGerXoCwmhQpfB97v
hcF1b7II23M6DGgu/A4kQgpQADN6jk/NmYOIhVcZj8O18SohFyM26/uzMLpLWYkk
PxSrs3tK7Srh+8dkttqTCEFrd6Zi1Aj73bbHo0W51IOXFw8yTSESmd5T9z1/Edk=
=T771
-----END PGP SIGNATURE-----

--uJjXCVmMx1Cf3e0aVdCPKVgv5KENaO4Jd--
