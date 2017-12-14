Received: by 10.223.159.74 with SMTP id f10csp6386069wrg;
        Thu, 14 Dec 2017 06:33:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNonO26GcujOLdjkFrWRUjsTnRJS5i5i/L8aqjeqHuQXc4BSATP6vYiYsmkURe9ynRj6JM
X-Received: by 10.37.121.2 with SMTP id u2mr601335ybc.353.1513262019980;
        Thu, 14 Dec 2017 06:33:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513262019; cv=none;
        d=google.com; s=arc-20160816;
        b=TLroTBy2zVIw/pVFKDXfWMGxPajjoJUFN/sBdIPKo98Gnchpf/a3UKwnsqxI8ENEy5
         6PYUOXbR4aJlt+WjE/Lo73LJBAUts64auurmuaZl/IJZhGeR1mMnIsfaxsiptiadL8uM
         CDP8lMI5aeWTPFTcrKuKXmJlP1MwnNK2dgnX6dptoRuH7EE1G7KW/qgtF6URtO+/PeOv
         dvbLmSTjOyO3anS4RyaJrXaBnCpNE3o4XTaWCDHelpbhrYNvw6hlGv721IvRzUVFg2OB
         wAKttMI3elBFkrjWuVdbhyn7ttPK+3feiCDzm0/jAcxzqqP5ZFXCpcLz9aytDK6UPqaT
         fLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=DgzK34gWZzy0DBbadCTkANiiQg3zLZ0vcxmQHXcN8XE=;
        b=jHei15SAwGTfgfA2hszfWxlg/IWmmwV1BEsdFaQ/RObTy3XROCn70hSzGzub3wC/9/
         fdX+Hi19Z9CY5u6txl1500dl9wFkBBpbIOPNN1X2zOddrItFIvDE/NRGMujlkygmBGxP
         0i5s4U4X+LKMaykctgYziw5chgdMYJOOYSpBAqA0hNSQp/KOzchAqM5nY6x9FWJusFpV
         glMpE4RJVVde7rBPHLxZzz4vTG7Ayw+k8tPSLkHgmFSo+2baYJ3n4ohv4+JHdY3AR9yh
         UYiIbPXU4vPw1ME4YLCHtpOZDewlWfPT1tVxW/2DBBBthBaZtMbAeKPNUH4Isqw7rkMT
         svog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=urv5g4sL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si838860ywd.709.2017.12.14.06.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:33:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=urv5g4sL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUZv-0001N8-CD
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:33:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePUZc-0001HK-R2
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePUZX-000555-0L
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:33:20 -0500
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:35021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePUZW-00054M-P3; Thu, 14 Dec 2017 09:33:14 -0500
Received: by mail-qk0-x230.google.com with SMTP id c13so6435366qke.2;
	Thu, 14 Dec 2017 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=DgzK34gWZzy0DBbadCTkANiiQg3zLZ0vcxmQHXcN8XE=;
	b=urv5g4sLvYlzu/9y8XZbs9ePcL2W/o/ABM6q9kXh3OjkqQmp5UrBSjrjq3luWLvjFp
	cVRuJHV2s3P+V+tHdpafUi6EDf1PJMKJy4Rrf8etzj4hehQnailYY0gW++RtzPQFZHzN
	VryLO2jM8mfK+lwzHPpT516BpJRM4KW9xJ7izQ5sd3WlVML1dh64dohr+12eOvUezxt5
	PlfsAjLNKh5D0Iw1Cw1yyXKUvuFcwT4xdOgCxFxMqGHxf4aOKwjPGzEB8ERpU2BZOpAe
	DgNOoRAyvjOV+0AHNex/GBjitk7wncFnu8DintTQwPf4yCV8loASAU1Rng33A9BoCDci
	Jeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=DgzK34gWZzy0DBbadCTkANiiQg3zLZ0vcxmQHXcN8XE=;
	b=CCpVKKJ+zFFG7OPLj0+eqc4PRRXW5tqoCwvR6E/Uaw2Cqdvh9/2NPDcr/v6NcOx7FN
	QSu4iHZjN5CL6PF7kUSFWUkgP7fqAHNVWDq2yqIEWF10RfsQ0W30UQHcI6Yclx73B4F5
	ntjul8t7Y+fCcNSXy8oB0m7B9aCZ7DQGyk0a4UUql4yDcwY4ejuA1hjZZsSEzmHjkn57
	4HMKGCjasdTZLzO/m8GdurWRNrpoOAiAh1BvuhHWnhUJs1OWc+KkPtZ+4xfPuWBb+mgM
	Ewu5A3WuO++tCnsggEYgjM5ekzJQsOPl67YZ6XxcMdUa0Z4M0+GgHAeQMYJ6ECL/WSUp
	u5Tg==
X-Gm-Message-State: AKGB3mJNDr94um725ihoVDX3y3/PUAkD5jvOVSrAZn2AhZJOeC1p/iaV
	93lN3ev+FnZIxhXbLXPhksBt0zzxcI4=
X-Received: by 10.55.157.66 with SMTP id g63mr15771261qke.59.1513261993956;
	Thu, 14 Dec 2017 06:33:13 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	t12sm2711386qkl.41.2017.12.14.06.33.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 06:33:13 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171213213557.26561-1-f4bug@amsat.org>
	<20171214093907.GA14433@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7bc179c8-5699-98b0-8a5b-b4d8e6843b25@amsat.org>
Date: Thu, 14 Dec 2017 11:33:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214093907.GA14433@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="BsSxMXTeUgfa6EfP64fxc4AwwE5nuswTI"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: Re: [Qemu-arm] [PATCH 0/6] QTests: use Python to run complex tests
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EPlkE+QxBIp3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BsSxMXTeUgfa6EfP64fxc4AwwE5nuswTI
Content-Type: multipart/mixed; boundary="H2KGnfjfKk6ouNPDBtcpVV6xguCTEjWGI";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Cleber Rosa <crosa@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?=
 <ldoktor@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org
Message-ID: <7bc179c8-5699-98b0-8a5b-b4d8e6843b25@amsat.org>
Subject: Re: [PATCH 0/6] QTests: use Python to run complex tests
References: <20171213213557.26561-1-f4bug@amsat.org>
 <20171214093907.GA14433@stefanha-x1.localdomain>
In-Reply-To: <20171214093907.GA14433@stefanha-x1.localdomain>

--H2KGnfjfKk6ouNPDBtcpVV6xguCTEjWGI
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On 12/14/2017 06:39 AM, Stefan Hajnoczi wrote:
[...]
> Device qtests are better done in C than Python.  Python is not good at
> binary I/O and porting this to Python 3 will be extra work later (Pytho=
n
> 2 is set for End-of-Life in 2020, see https://pythonclock.org/).
>=20
> More importantly, we already have libqos in C with a guest memory
> allocator, PCI, and virtio support.  Fragmenting the small amount effor=
t
> that goes into device testing will delay libqos reaching critical mass.=

> Critical mass is where libqos provides all the infrastructure you need
> to set up a device and focus on your actual test instead of machine,
> bus, or device initialization.  Starting a Python device testing effort=

> will just lead to duplication and 2 underdeveloped device testing
> frameworks.
>=20
> Is there a specific reason why adding SD Card support to libqos is not
> possible in C?

Short (joking) answer: Would you write tests/qemu-iotests/041 in C? ;)

Now thinking about the specific reasons...

What I intend to do is add qtests for the SDHCI implementation.
There are different revisions of the standard specs.

Currently QEMU implements a mixed subset of v1.10 and v2.00, while the
real SDHCI hardware implemented is v2.00 or v3.01. I also saw 2 series
adding SDHCI devices supporting the v4.00 (not yet in /master).

With the current codebase we can plug SDSC/SDHC cards (up to 32 GB) but
we can not plug a SDXC card, so:
- plugging a 64GB card into the ZynqMP machine fails,
- plugging a 64GB card into the SABRE Lite machine fails,
- booting a Win10 guest on a exFAT formatted SD card also fails.

A later test create different cards with [2GB, 16GB, 64GB] and test if
the SDHCI correctly access them.
Machines using the Exynos4210 SoC which only support the v2.00 spec are
expected to fail with 64GB SDXC cards.

The Zynq machine has 2 SD buses, another later test unplug/replug the
same card between the buses. This test is expected to be useful to test
the custom SDHOST controller from the BCM2835 SoC (Raspi2 machine).

It is surely possible to write all those tests in C, but it resulted way
faster to me to write them in Python...

I could think of a bunch of I2C tests too, more generally I found using
Python for bus backend testing is much easier, as with the Block backends=
=2E

Regards,

Phil.


--H2KGnfjfKk6ouNPDBtcpVV6xguCTEjWGI--

--BsSxMXTeUgfa6EfP64fxc4AwwE5nuswTI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAloyi58ACgkQ4+MsLN6t
wN6Hqw/8CSQ38r/TmjVE3yt0mq8F3LPJ3QWKRZS1GgxXx0+dE/KgzGgRtsOuY8Ww
YguOLpmrh0j25f/wUyGbgTVArjYeGU09B8GuOFDmJ88cCoyUbClSVZZSyaBxLzc/
cfN+U9/oLW/SzVKxBxNv9AQlPccm+LaWbkKrHszlo+6gWVPyZZOCchAT7I1tT0C/
sVC5CwNAAwQ75Ji7bfdQeV16PV+9MAR6H0hLP8fImBO9qV5yrZcsMCL/q4Yll4TW
5tjjnFsXRrUrSCkJQbcTFUCpdnL+TrJGK4bep7Y7bPnEBTUNFEJ4d/Asi+q0PVsw
dT1z/npC5qoxlZfyA+wefCtu+apbRCn7olMVj6LNSIsDLueSADvBDn6Ztqxn0re+
+sEYxnDmFrNMqA6Cd2FSs8BDQP7lA205KC/odUWZvajeUWwBGO3dSmPKyL0IpIdM
QhWUV5dQ5va+FazHquLvBsVBrGSNoZR6G90LqoOxuJAAp0yfct06fFbVDz6HlHAU
tErJDAuQ19q7DNU7EJwxign1uBfXJCmCQqR0Xi5Eyq1qZOmUYn0akOevl0I3JY/I
Xj+lstQutPeVK6hFbqkYFYOTwMSUQlaXsEjzFNfVYA881a9jJDX4XYGe9JN3vj0s
9QsmfrknZDvXttEcZHlDPy0reMb/q2V6KZ6hzBWkYjFice4iBqE=
=/fH0
-----END PGP SIGNATURE-----

--BsSxMXTeUgfa6EfP64fxc4AwwE5nuswTI--
