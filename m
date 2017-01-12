Received: by 10.25.205.13 with SMTP id d13csp1331320lfg;
        Thu, 12 Jan 2017 08:34:19 -0800 (PST)
X-Received: by 10.200.35.6 with SMTP id a6mr13240863qta.210.1484238859789;
        Thu, 12 Jan 2017 08:34:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68si6436689qkc.173.2017.01.12.08.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 08:34:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRiKQ-0005js-Jg
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 11:34:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1cRiKC-0005dP-Sz
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 11:34:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1cRiK7-0004se-Ve
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 11:34:04 -0500
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:35776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mdavidsaver@gmail.com>)
	id 1cRiK7-0004sN-QS; Thu, 12 Jan 2017 11:33:59 -0500
Received: by mail-io0-x242.google.com with SMTP id m98so2919832iod.2;
	Thu, 12 Jan 2017 08:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=NdAXgiEgPkWczCMUAV6bGFJjJRGQ7UYic1/6qVjtnl0=;
	b=gNT+nn+RwCEy68pRpsL5U/GNJ+QIewaVQy9da7EoJOb5ZgutOpy1RZW89l2UrqPwV/
	BXO/rMElndxCNOefhcNrOLURBEYZTtq/fYdHEUZtOfCec8OyIzlIYORCUlDBxq6QIK7G
	geA9v0d+SZFR/DMGnsD87+s3b9BStsC2vT7O6JyncAbJaR+JU+Alz3XfXwRrRPPLSxio
	ubUMgpoTeWh9jrDSo8puP7ZX+3rT0yTP5fCw/Cjsc7skOdUuxrn70fUH+qL//7oNx5dy
	KISTwOSBDAxUbsazrb3o821Zf49njF2st/yzY+cU7gr7cHzKmY9jouJWasB1i1M4iU4f
	OtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=NdAXgiEgPkWczCMUAV6bGFJjJRGQ7UYic1/6qVjtnl0=;
	b=nG+J04z2l95nHa9JWSHFQmyXpOO3wvgnkXgy+7OFMWyf/jxA2dBHtUJZXAEfODOoTZ
	GLPH42SEiF4P0JSJXTLCk5NTkHEZ34nn5zUK4CqhIyThixQsbCeuf99gzduD1T2Mx7qJ
	qiZIl+fvCdzlA10H/AQjzmpWZ1nfDyBFfuU5b7IKNaqpeq+MNBHAvG6gwCGLaEEExBqJ
	tgDLO3siyxCJZWnrfGl6aMOuHyWP/MW9yN7uRgHR+fQti3dJGde8V1H2OLorBUodQMs1
	T8FAKwwbU3RmeAeXHgh8MGGZZXyucxvqMWqvPMZOA8Ef4nNIDGbQRR254vQmNvvDi+tU
	0iFA==
X-Gm-Message-State: AIkVDXKhR2uFcI0L6+UytIwaERyGw2pY5FZKz4yEad+TavtulTsVtLr3q4upSMkdKe85Pg==
X-Received: by 10.107.154.135 with SMTP id c129mr243554ioe.168.1484238838871; 
	Thu, 12 Jan 2017 08:33:58 -0800 (PST)
Received: from [192.168.43.106] ([172.58.136.5])
	by smtp.gmail.com with ESMTPSA id n3sm1316963itb.2.2017.01.12.08.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 08:33:58 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_53j-DGqW7WMzWaofUK9zFmeORUSFNAdHUPFKTZyqZ+Q@mail.gmail.com>
	<CAFEAcA9u2MPh7tKoaMwfeMf04VOWnR-ScJhBvnpBNO-7-kkywg@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <b0a0b17b-fff1-cac8-b6e8-b1b7dd6904ec@gmail.com>
Date: Thu, 12 Jan 2017 11:33:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9u2MPh7tKoaMwfeMf04VOWnR-ScJhBvnpBNO-7-kkywg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qJBoPSopOsRNk5Uw5WuMqL5jpOb62lTB6"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
Subject: Re: [Qemu-arm] [PATCH v2 01/26] armv7m: MRS/MSR handle unprivileged
 access
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+ovE5W0E0+K

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qJBoPSopOsRNk5Uw5WuMqL5jpOb62lTB6
Content-Type: multipart/mixed; boundary="tb468IRoWWVpoOJnM2R6KXIdjVQ1ojpbE";
 protected-headers="v1"
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>
Message-ID: <b0a0b17b-fff1-cac8-b6e8-b1b7dd6904ec@gmail.com>
Subject: Re: [PATCH v2 01/26] armv7m: MRS/MSR handle unprivileged access
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
 <1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
 <CAFEAcA_53j-DGqW7WMzWaofUK9zFmeORUSFNAdHUPFKTZyqZ+Q@mail.gmail.com>
 <CAFEAcA9u2MPh7tKoaMwfeMf04VOWnR-ScJhBvnpBNO-7-kkywg@mail.gmail.com>
In-Reply-To: <CAFEAcA9u2MPh7tKoaMwfeMf04VOWnR-ScJhBvnpBNO-7-kkywg@mail.gmail.com>

--tb468IRoWWVpoOJnM2R6KXIdjVQ1ojpbE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/12/2017 09:14 AM, Peter Maydell wrote:
> ...
> Michael has confirmed to me that this was just an oversight.

This was me not knowing the process.  (just to confirm this publicly)



--tb468IRoWWVpoOJnM2R6KXIdjVQ1ojpbE--

--qJBoPSopOsRNk5Uw5WuMqL5jpOb62lTB6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYd6/lAAoJEJQB5ss9fxjqwz8QAJobiOzExMvHV7PQ86i0uPNx
hFmaeQzIee1J2fq5ma20qgjLFWqhgEOivnn/gm/nJzBVKB2HLHFIS66RtB4r12Dd
iaLknvPS+ZVhKWjQy+/wVg7zzyJodo3GQ71mdmGf0Zbr51BL17MHu9gt79uvfgL8
kD3H/bZEXDVb48GjNktkBPjvLFdJIGEPh86gieEncGi3jwQpK/8SnHj7hQLMk4Yj
USfgImHiaZgjLBGgGSrvKqO0EvU7GcPU1n/OkqFxdxwxCgASwXyYj6o2TPWc6H/T
cSWTWE0AVvTbLagKhzCokB0TXZr/dwvXsqzaaMHocjpuJeB7nA1xy5nupmmYFgT0
bTiZj0+0M3ETCqbGvgoMhQIgyt9mhKd3IloTQqbu9rJoE+DMgdSxp+oc1ucdDcsz
k6JaiHqZ58C4mQLgdywnbMfzlP0N1y3rPJCnbY7zEYL1VS8XRbFhWBYNacUgHHNh
q9HXSxJ0ezqBKBZQdboc4omPyD8/FRz2dVzEW49TKvfrWyCyUECZn/BA4VHslhYh
5M1phmtLNTPoVB280u1XnyTcTnvnjUPxD3B6XqXz3JtK7bPOhRGTA/LLDhyw48Sh
0jL05MWC3O21z+tm2tunsuiC12mNTf72dWeADEjnn0f+ING/Xz60azhfEzSKh2xQ
XhKlTbaMzeBtD9coh4qn
=19nq
-----END PGP SIGNATURE-----

--qJBoPSopOsRNk5Uw5WuMqL5jpOb62lTB6--
