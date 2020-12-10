Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5620018lfb;
        Wed, 9 Dec 2020 22:21:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaFmGsfJzwBqZhk99QGcmZnG4CXtY/ZRFA3vCyGEeZW+cTQ6bHIFQpD6cYHIDWTtiEab4V
X-Received: by 2002:a62:1c96:0:b029:198:1cb6:26bd with SMTP id c144-20020a621c960000b02901981cb626bdmr5419393pfc.33.1607581310807;
        Wed, 09 Dec 2020 22:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607581310; cv=none;
        d=google.com; s=arc-20160816;
        b=qvcVfj1X9tn1Qv+NY+tbnI2fagdxB+bx+Uky5UdTxrmeeVPQjC39Lp34racbH8CLks
         DWjwDsuSwAK7t16XnlL/CqDcSeY1j0piI3hIoIcazMdex8QIB2O65NAcB2OtsM41EGf+
         hPNUTjrpB7y7juILMvP+u/sGqsDVGD9O++86H2EWqY1rYq7Xf9k199Vo0D6vy9VHxbTP
         NKVK2fpUyHeOnVhAnZ+InjgEzsYmN84CPPx+Y0IjYCr10TE2lZvoqsFfhTl4GjapxH79
         jv1IcW8qKjaRbyEAh5+6X8az1QgXT69u7MtC6ehqfnOt0MiiQ+sgDHrf8QyvziVzdkjl
         cESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=R8a9p4KKXQBZTeeCezrmVyOtzYAS6dK/hO+KH74LShg=;
        b=FhNdRXICUqqeTEVNzEl+S2QOt76v1nphbnXXc5mmbs3EeeXXGek4H+zqeK9Sd5KzwF
         gV9o+WBZqIhTTQFFsSn5ZDcoUjGYaUSqe1irC8QOObUrkFfZ/54Q1QAOOrLAPJLMTFfw
         wL0kPsKlWuSdSxoXvl3A68rKMEH8XjnJ3McCgpPKfjV/bBgXgeu/8elJlcqZkr8S7HoZ
         OWKqIKoFXugnj55WBFsvQOuQsa4mTmbbFtY1xlw4NaKjv4As5MIa3JPn7oomdfEBenWf
         yf+PyuRwERdIMWvHnJF0SCnA6piB2TLo41gunfiCEMKZh14LzXowBM4fZBGkNtne1Ryi
         hmqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=bPOHgD+1;
       dkim=pass header.i=@keithp.com header.s=mail header.b=bPOHgD+1;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id a10si3527733plp.220.2020.12.09.22.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 22:21:50 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=bPOHgD+1;
       dkim=pass header.i=@keithp.com header.s=mail header.b=bPOHgD+1;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 7E6673F2E34F;
	Wed,  9 Dec 2020 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607581309; bh=WiZcTrRc8mRZ2nFBgQVmDVQ67kro6pXUo7LIKeVniBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bPOHgD+1pWkrER7VuUQkFhcx57PGa9uBAFSiPSLd6E6HAjw4VgtU6kkWa7olW0rG3
	 Ql0hmms5FtqPDx9UuSqXe1rj41TO/X2ib0JbjmAa7BQdxH0taBckrRp8D/g9kqXzda
	 Br3BqbqaERkcjHLgwpLgAT5l7QuClMLVBkl50HEU839peRF+Spfq3GeNJ6xc3etXSO
	 DY//iJOayO+az9f71iMLofjeHsd0yWktGfRATTcJE2HRnak6VgRmSNYEAe+9n9YBan
	 FahhLjbrxPIkZWZLeRGj0OyDMbhXY1Ofy/ng3hPY9TYe/yXNG4t7tGh18XwxIQhYEC
	 dykmxC46hjEfg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PIPf-FKm5K6w; Wed,  9 Dec 2020 22:21:49 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 1F7AE3F2D58D;
	Wed,  9 Dec 2020 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607581309; bh=WiZcTrRc8mRZ2nFBgQVmDVQ67kro6pXUo7LIKeVniBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bPOHgD+1pWkrER7VuUQkFhcx57PGa9uBAFSiPSLd6E6HAjw4VgtU6kkWa7olW0rG3
	 Ql0hmms5FtqPDx9UuSqXe1rj41TO/X2ib0JbjmAa7BQdxH0taBckrRp8D/g9kqXzda
	 Br3BqbqaERkcjHLgwpLgAT5l7QuClMLVBkl50HEU839peRF+Spfq3GeNJ6xc3etXSO
	 DY//iJOayO+az9f71iMLofjeHsd0yWktGfRATTcJE2HRnak6VgRmSNYEAe+9n9YBan
	 FahhLjbrxPIkZWZLeRGj0OyDMbhXY1Ofy/ng3hPY9TYe/yXNG4t7tGh18XwxIQhYEC
	 dykmxC46hjEfg==
Received: by keithp.com (Postfix, from userid 1000)
	id D92BD15820DB; Wed,  9 Dec 2020 22:21:48 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Kito Cheng <kito.cheng@gmail.com>
Cc: qemu-devel@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Alistair
 Francis <Alistair.Francis@wdc.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
In-Reply-To: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
 <87r1nz6iz4.fsf@keithp.com>
 <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Date: Wed, 09 Dec 2020 22:21:47 -0800
Message-ID: <871rfy6v0k.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: PUFYB6nOFQeT

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for your reply, but it seems like we need some more modification in
>  linux-user/riscv/cpu_loop.c to enable that, I guess I should post that i=
n mail
> rather than attachment :)

Ah, I completely missed the attachment! So sorry. That applies cleanly
on top of the rest of my series, so I think we can just leave it like
that unless someone wants it presented differently. Not sure why I
thought this was working before; I clearly missed the most important
bit.

Reviewed-by: Keith Packard <keithp@keithp.com>

I've got a github repo with these bits in case anyone wants to look at
the whole tree:

        https://github.com/keith-packard/qemu/tree/semihosting

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/RvnwACgkQ2yIaaQAA
ABE0Dg//R+H0GxY+Y4VCpnq8akZdTtLwCs06v9ziZQ+xmVO1qXZxNpWXNwPTLUQ9
/T3J0t3LATimH2kn+3j3Q5vqm3gwTYZQuTQPGd+62KwfDHE6ua4DcvXRT5deClfU
66ZdgsJkObDbX+peoE0NxDlyaWh1DZE8gWPojWXjcpoyfV+j/QRm16h7Bx5rwJdv
Fp/JaQ8H8TRdKtynnCMF5IWLRFGxnhOhZOhPC5z6PW2NcZVCKb4PASwW7wxF6xrC
8BA26oLrS9pOJvrgGsEz19i2J3C3lamdJ243Yu5wkndyVnxvQtPc2gA2NV8PZrry
JwwsX6oSo3/1lCXnlCiWnfxVorKbSdJx37Hz9rAsZYGgu/uLRFMrDpcx4jeBN0w2
oQhuxfdm8H5JoP7VEuPl6EG/fAk9hR8xMTpCkiixoWMk+8OV3hzzMScS8PbBVLKg
p5Nw5cwtwMs4BwSHPZ+A9Byd2om3tI+DZxwAik2mf/Pkw1hBm+uJb7ywKekL0QKD
8yEXckjRVmOLuzIQZ/fpwqwv56xJuh3/me3sTgH9njH36jULTs23cvbViJ2zI79E
P87GE4HCCSlM4KLj3tOIBZLySBbYAf4TqLSzUwTQIgPLoe7VuEMAPM2phm38QjIv
UPOdBLAKC9ZXsnt6+QJlQwAgSsesu66ngm2IcYaG4bV0z77/H54=
=a27Q
-----END PGP SIGNATURE-----
--=-=-=--
