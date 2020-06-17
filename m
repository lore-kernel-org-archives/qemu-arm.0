Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp630025lfm;
        Wed, 17 Jun 2020 06:51:03 -0700 (PDT)
X-Received: by 2002:adf:f58b:: with SMTP id f11mr8656567wro.155.1592401863407;
        Wed, 17 Jun 2020 06:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592401863; cv=none;
        d=google.com; s=arc-20160816;
        b=Bjs99MAv4NenFGpT4BGn/h4h5ObLdYzA46r1G0R1hkVD1xYtSZw5GIQsTBs4pLgvBy
         agqKMaKU6WB6g8GzfkA7HvBREHB3g11bvyyUubMifRGctd3soMzSzLW52mx3IL8TmCph
         6MtuuU+XcJtAFgYqqGBzRGqbPhM9Z1XCdb6LpDX/0Fo3DCH5Fj6BZNEnhs5Jklm7xVBe
         h3OcB0tC6ybboPmXS/UqSQdxFx0rc7KnmoIDiv4rhXep6NpfuEz4NgPIAnOuBzZuMhX7
         GzPvWasrb1i66k71yQsJyY/x6d+drFDeZW1Mb2iyKWBNhpac+lr7Go/FY7DRbk8qK5S3
         adTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oszAfgQLcuqhw96CpCXHIlMh5eU8XN9EGCuIB+dl8T0=;
        b=GPMtUR0W8a2/KMt9zY3ATdXfqCFJUVG7uRJ1djGj4/FnZpkofDS49yNm0UTfhWMLK2
         CAq8zavLFRw/g+gAwS5+nEIKLOrSKDoe/ahbI2NcXQPNTqSRDQyCQLC0REHL9rhpe0mn
         tSqK/zsVagfDxm8a3d0k0T5YCK/lMsxMDXAJ5daDjd1FGXOtlX94gG9FnNiCoD9omc+s
         n4m4IgKAWxsHKtjULPXq8znxqpjPJsfGf+oWLnByiKLE+qoWHNwAyhsXCwc8bhZH1Yw+
         0ccI/rArQWg4txmln3HGPD21Z00D5stdfW7/bCIOV3SnB+QLAlzLEc7ykCYgBWSgfxIl
         2frA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kkvTnm39;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n126sor3972263wmb.19.2020.06.17.06.51.03
        (Google Transport Security);
        Wed, 17 Jun 2020 06:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kkvTnm39;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oszAfgQLcuqhw96CpCXHIlMh5eU8XN9EGCuIB+dl8T0=;
        b=kkvTnm39KAIdWfEhGWx3gXtqe37j0szQkOB/GQGFMIJblxtAefjYkvzPP5Mdk9p3eh
         37ZO0UYOPwCTnOp+Vp+gUcdEVSR0J90xiAMvNmMteRx2x+JbVyX8EzSHTWDFc2Xkw+qI
         Bk9X5uuRoAHdslzH4YOJgddZMPgoxhifHb/jv25pMJuSnEmtmC+R786BC4UEK/LVp/9s
         WF6AHHfIexR8NQTi8G3DBZhd5Y/wZ5eVMg2Nr5x3eoyiNd1Z0rXzkOTLvA+6OYuZnvug
         LJU7yecpSjcNxH38V1fmPMN9Xzi6MtUAwmwk+Q37yYBLDYcAT2xpUmFFsu3Sgrd2cck8
         plBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oszAfgQLcuqhw96CpCXHIlMh5eU8XN9EGCuIB+dl8T0=;
        b=NepPWlIwG+Y0NySHf5/MRGpUrB1hJ5opDBkoCWpHcomDe54use/EldfoR+krLn1ci2
         n2s3MJk0xWvAJdBnM5dNvgH1gdsRLgJrVNRFuJglKPdG/Vksvi5vdzqywIFtNFUbQJbC
         4BPbu0z89uRmRGds/wgNAPdjx/sTAYgZDMMCxHrhz0EYdTXJFW7WP7wtzPS/28RgN/J5
         R7EHhYBsPPZdZeYmNi38FMqpcvUW8iSpRg6V4HVNZ//bOKeYvrrrM7hzQD9Q1HsYDaiB
         +zq7aWDAJ8zG4V7DlPLyYTCPsSuymwI38suYeF/3TaIQhE2c2y1ea1H19BWcTWvg29/r
         ZqQw==
X-Gm-Message-State: AOAM531ASdHLaUQCFXC5a1rd3UD7+xXDdpHvX7yvTVHiiDtIvD4xWblq
	vHIE0pI5fUpf+bzBk1B+ESk=
X-Google-Smtp-Source: ABdhPJyqj18xoL/BMRiq81y/4dVUJzqEEk9W0yyA1V+zG4J/yV/RzOZjpd91BpTLbu/7u7qP/ayZXw==
X-Received: by 2002:a1c:8048:: with SMTP id b69mr8460386wmd.169.1592401863081;
        Wed, 17 Jun 2020 06:51:03 -0700 (PDT)
Return-Path: <stefanha@gmail.com>
Received: from localhost ([51.15.41.238])
        by smtp.gmail.com with ESMTPSA id u3sm464761wmg.38.2020.06.17.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 06:51:01 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:51:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Marek Vasut <marex@denx.de>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 04/11] accel/tcg: Add stub for probe_access()
Message-ID: <20200617135100.GG1728005@stefanha-x1.localdomain>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TmwHKJoIRFM7Mu/A"
Content-Disposition: inline
In-Reply-To: <20200521195911.19685-5-philmd@redhat.com>
X-TUID: iWF/4+UNqZXg


--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 09:59:04PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.

s/where/were/

--TmwHKJoIRFM7Mu/A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7qH8QACgkQnKSrs4Gr
c8h8sAf/YcnoLncBCaFhEPr9E4CrtTUYIuLHjpMYLgtyGMSmbPkx4NIzieUBOToh
jLf3y47bKlPFsqC09GBLuMHfhg1ucjCUuJyhd5x+APO63VgR7T+AgTFO6nFClt8O
NXzgvBOjJ/OYVWccc+tIOgxbIGDXzefZT6nGrtBx23AhIps5Ob1CskpOj7a077Dk
KJAcJ36zJ7QbRjKNw+U89kQkn8ogUm5XtiPN8eCP6SQQV4CcvXPTj+lbXDWJ4AIr
WEVcSf1/4ny2g5MFJmIoqbOCMzoV1+aZ4alZL0SFxaLeviRklInNVoWnMA0fX9UH
EXbzEXlSwv3omAnjea42v4NiEe7krA==
=YOPi
-----END PGP SIGNATURE-----

--TmwHKJoIRFM7Mu/A--
