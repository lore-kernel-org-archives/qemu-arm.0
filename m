Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4212006lfa;
        Tue, 27 Oct 2020 14:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx14p6gD/FyPAecHNPvb8stFDlbP5XfY9QtecAC3Za56We0+OeCyg8DQMNZvIfFUVxZDWEP
X-Received: by 2002:a65:51c8:: with SMTP id i8mr3641565pgq.142.1603835763966;
        Tue, 27 Oct 2020 14:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603835763; cv=none;
        d=google.com; s=arc-20160816;
        b=EE+5DnWMYeGipIjI4DHbHinLGvttmKy9XtNeqnmy58nTFO5mqrEkyuoe0ugYWJUvK7
         X5DR3HdGWflwHtg9mTv6kD4QUqjNytQz6+LwufGt9xlAPARcVJSEy7TbZp6O3RxUEjpi
         XM3eKmanKHeSWzeu/Pwel0gei+jCuCjY9qPIgF/t+NXlGlzRpVFpQKW2P5FrDjP1SUmh
         u1psHkH5r7AheWCQDdkWNsf025BvJiiHIfXMYr6Hb7pdd16vgzDkVj8R9CAucb3yyuHQ
         pIo2adYYUX4w9JJkMTli0U+u2GqnCb0f4XoQQcMSb0cyDQapHya5Wcn5vakPYOXV74QR
         itWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=Sz74ry0FfCdAGhiILIHiuiAdWUtHfrG1cZXfWE/3Znk=;
        b=x0+1uLCwQi6l+8ztV846QFu3QBJksNv8Lc4o2rH4giumTHlogtWEhnW0Rb+d87tGYB
         xVCQkcGnTGSUIiVzGYEKZwcFz02lUerTnGkKgyhZu0wF7XqofxnZ6mCt5ynYpqWFpMJA
         9OVdPz7PJdSszwfCbpn6/rC5VTSZqHdJG5ZK3EcRaeFWmKKEvyII6jZNDU58LgSD94HN
         5LFdA2btESoBWOk09vhZp5HQa5QrZ+GD3nuiUYIyN+q+XLfIMKvbH9E3giWTY0YZfayj
         D4DwC9ufj8dDnJG0jT07jNik9y+A2EF2m7kNUuAOyE3Up/78rnCEKob9yOXAC7Bm6bML
         oKHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=cAx+ERVB;
       dkim=pass header.i=@keithp.com header.s=mail header.b=cAx+ERVB;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id f14si2459564pfn.212.2020.10.27.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 14:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=cAx+ERVB;
       dkim=pass header.i=@keithp.com header.s=mail header.b=cAx+ERVB;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id D45213F2DD88;
	Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603835762; bh=LFRed8aLrEhFr9/H0YfC2FHgLemVaokq/v9X3p0bp+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cAx+ERVBgsVYaJnPv1wxQ10jPAhBgdInxCU9S6Dw0zhIeHuZd78D4Y3YcHRUDVrJ5
	 dVF4t29HTGEOm9UpWQBKqT/p4q0i63o1wizr80O0d7oCm/2U5Tq4sdfnvsjGSLJH42
	 T0qQpkbgiBvA+rmLU+kyeTLVQPigF8n4fdFmtjgM6kiAYM4WDAfUlsQmZp5w0vdrXQ
	 ZJ+1fFrsUuO7N0BzPofOaPjRyMqENXReCyBLDgm/D9ewYvt+C1IC7weuXWTMMck0Qj
	 ECsQTciR8kdTOB3c3YwVzqZ6pVoJBaOVXcdBntyzdeZ8bbi5E9XhlRZPrHOq1DnRB/
	 5ZTbLTNGETOSg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q0jRHPqt_1AB; Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 6F4573F2DD87;
	Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603835762; bh=LFRed8aLrEhFr9/H0YfC2FHgLemVaokq/v9X3p0bp+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cAx+ERVBgsVYaJnPv1wxQ10jPAhBgdInxCU9S6Dw0zhIeHuZd78D4Y3YcHRUDVrJ5
	 dVF4t29HTGEOm9UpWQBKqT/p4q0i63o1wizr80O0d7oCm/2U5Tq4sdfnvsjGSLJH42
	 T0qQpkbgiBvA+rmLU+kyeTLVQPigF8n4fdFmtjgM6kiAYM4WDAfUlsQmZp5w0vdrXQ
	 ZJ+1fFrsUuO7N0BzPofOaPjRyMqENXReCyBLDgm/D9ewYvt+C1IC7weuXWTMMck0Qj
	 ECsQTciR8kdTOB3c3YwVzqZ6pVoJBaOVXcdBntyzdeZ8bbi5E9XhlRZPrHOq1DnRB/
	 5ZTbLTNGETOSg==
Received: by keithp.com (Postfix, from userid 1000)
	id 419C21582210; Tue, 27 Oct 2020 14:56:02 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm
 <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-Reply-To: <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
Date: Tue, 27 Oct 2020 14:56:01 -0700
Message-ID: <87pn53e3ke.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: H7ppNiHBgGqp

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

>> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>
> I think this adds this file to the compilation for all TCG targets;
> you only want it for targets which have Arm-semihosting-ABI compatible
> semihosting. (Various other targets either don't have semihosting
> or have their own ABI.)

Right. These should have been target-specific source sets so that the
file was only added to those targets:

        arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
        riscv_ss.add(files('common-semi.c'))

This appears to work in my testing (building arm, risc-v and x86_64
configs).

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+Yl3IACgkQ2yIaaQAA
ABF23hAAshIh90c2syeOD7e72vZAmKyR3UdxiwRRaobis2M5HEosF8bVTuuYoP+Z
TOE4wV1NK5Z0V2tWcLQ9cJwqwG467Idw5ZGQxgXwe/4D1jf7x9QZZiXhqgqdcb8A
+4AUkGLjFVZMn/hoOt7MWLhLSmBIu2AeZmEfdxEwZN67sb5db8kj1nL429+2g8J5
8bYpoOsbWSGkrYWvm30QbLNiyzndSau0rErgbLf5cRbFDna/saKTKu+t5S+zXt1R
BVu1rFUAD7QgICp8eTOtdmBIt5coNGbk6oQMBlj/TRVatWPl57L34rA+6l1/mrWc
fQjBwe8+BHYxjNaSRN6mMYs/5CxcaNlPNXUTFI2TLIpy9IS6DzzuY2IjHw6qoaz8
y5krhOXkkBQ3Q4riz7zpF/VlH+MEn+Ipmc1wMAgTT+3OP8cKropWIwk//qF00HMy
oAkJpZrYNfTvyMVfHGseg3HvrySxsomMWq6X8StXqSG9Y99f3jCOvpL1bF2UCX0m
lsBNAfU2F3kFcv96lB21tMy+ED9SgagV6q/kVzgiDOarGlxDr9MwHs88LvI2J9JL
61pV/LIQIp1RueHtExqxQ5427e9uEP0f/c57gFUY/J296pDiVqwhe7aGPjlpZ998
SMkwmYTRz1N4SPnnd9Bd5THWOyVtM/znBBmWXAd2qGRf+oQHXlw=
=/2q0
-----END PGP SIGNATURE-----
--=-=-=--
