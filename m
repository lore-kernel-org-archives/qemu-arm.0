Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2088486lfy;
        Wed, 29 Jul 2020 18:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsDV6gch2QG/CtxZT54qnSqsYn8aqPdZiHi9vx0St52knsM/yDblym3RZzn018+1lPdqs3
X-Received: by 2002:aa7:9813:: with SMTP id e19mr694306pfl.285.1596070802822;
        Wed, 29 Jul 2020 18:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596070802; cv=none;
        d=google.com; s=arc-20160816;
        b=NVWbg51oBCB8DBDsKITgIcSuwJ/aM0Kgf5L3Ebenl0XBZfaTxgyOGJSZbySQMCXFrq
         V7vwCfhOcreWP9r/UTC/iw4l1KEFadlfcqlHhLJNHo2oUKbxi9xhJ8yj480aGW9dOc2q
         T0GkbutApbbtUm53/2iOziSNAyEya+tFwCJgm4Q1tRp8oHv/MDvd1W7TQG+z1G1oEewe
         3y8T9My2d4PRqHVXXO0rIhsotcpLl7+BSPmzBjBd+IYLvzkJ/oxYQfgzxPLxDwcMd6QP
         CHkb+HN9bVmoMRJuOIOluL+yc3G+iIi3NoBowj4lc7uKp71pCHAjw3T0dEm6sqPtCAJz
         06qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fHrzEBvM0Z0rZZei6w8qBwjw+qSRtC9NfavwwKoqMFE=;
        b=xMvncIHCSzm2L+m0vzFZ0E4kdJ4PIzZKcltPjnFkaBHeHlZx67s2Hnd8dScWTrv9//
         X/jKKJ7OuTXuCDf97bU/V9Oto4E+hXFeErgW5nDXpkOQUc9YPZ/3zZCCAIe5/UaQsvy0
         5gRDuHxezjnZN24KIotsz3VLe8CfXFebiCPqgTWkLUL3LaTsCilZTpv5iGe46Z6u1k9B
         ztcNbVzaNZnXx4f7ys1vFTJOvsN6VNKCminHlXXb/MZVRtvZuLhbxC8gK0TQv1R8b/YR
         S60cYz26tW/F4+W6Uv0t3uVXYVXgvfM/xVMkCszlzQuDyub8KhMt3/8DveOMQ1rQpAd7
         GEbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=BkgzC6JE;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id r21si2732751pfh.169.2020.07.29.18.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 18:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=BkgzC6JE;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BHBsC1RPyz9sRN; Thu, 30 Jul 2020 10:59:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1596070799;
	bh=N2A3QinCPcXfIXYlyWTtIuIP8c79od3Ol5bcww38GDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkgzC6JEWlUYrzHr6/X5wgJd8DMKfkx6HjuEJnHl6uG5c5Z28+qYfosdxlAZLHpQL
	 2YPNGuGvUjyJ7cMNMO+V4PHpQb8sGdS/9kMIkKgYs1TW7+v9CaXMT05i3gMZw0hoWD
	 IQAMzb9tKmq432y7bD5knKCdexuY84F9bCzd13HU=
Date: Thu, 30 Jul 2020 10:59:47 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
Message-ID: <20200730005947.GO84173@umbus.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <878sf3uojf.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vNrHrykRFvLVX6W3"
Content-Disposition: inline
In-Reply-To: <878sf3uojf.fsf@morokweng.localdomain>
X-TUID: 0ZQoYzOve2D3


--vNrHrykRFvLVX6W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 09:56:36PM -0300, Thiago Jung Bauermann wrote:
>=20
> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>=20
> > The ARM code has a start-powered-off property in ARMCPU, which is a
> > subclass of CPUState. This property causes arm_cpu_reset() to set
> > CPUState::halted to 1, signalling that the CPU should start in a halted
> > state. Other architectures also have code which aim to achieve the same
> > effect, but without using a property.
> >
> > The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
> > before cs->halted is set to 1, causing the vcpu to run while it's still=
 in
> > an unitialized state (more details in patch 3).
>=20
> Since this series fixes a bug is it eligible for 5.1, at least the
> patches that were already approved by the appropriate maintainers?

Ok by me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vNrHrykRFvLVX6W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8iG4MACgkQbDjKyiDZ
s5Iveg//aisagDLxRmaDf7/etcVy4HN1kI/iGlxxbZLocT+xUb7bXLcYA/ZDUCJ0
T1v+xN5a5e4c2S1JBOqrBnvqP8MKhFtV4p8ZtRCR8mGIKahMrDwJkKjeD6mexioc
d+Lbe/lwilT8d0dmRHGt/W6u0UVocboMLoNfx567Rqd22EuUB8CsVjthZ6ZXvsr/
QFNYHPqfnnzANLr62kvf+DHW8TppOEcbUPrG4pmOYaQCBy7Tj3NRsYnnikohTpY4
4QpUoO02Lny1TapaGFYObTYP++65i/hbWjgS+qSwVZvsfF0nBjfvjUp5nt7tH9A6
aV0o/4WlIY5FDpsnrqxj2TIBbbH0uFpg1/OAorrcNnwLArJylJ2/vqpUv81p/qlk
LUL7ZVYAhEQkhmNh/cRWT9v71jcdx5RNwIpQusoXNbrurP8qGyeGh9NH3ZrPaLA0
5hEyg2CMxCZ7xF5ZhLrLtTYL9rHgA5mDvw4FmKfpVHHymKa7u956xhP7YF9hJwrh
Yr5uc9CsM24THQONchQuXfmTl55cbZFOocI30qSvYRy8f64tjfMcrRJyL/4hsXZR
kwYBzeQUfwyzIlf4zhYhFQIA8+FBHqKs0/hyuNfZGEMZatzoSZNdjxLnWy0VTnkf
ob+uofgZYTol74NZYvpYmV4PVEk0iKDr3bMgIsfDggv7yFkvKeI=
=TTOn
-----END PGP SIGNATURE-----

--vNrHrykRFvLVX6W3--
