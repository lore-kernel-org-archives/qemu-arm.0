Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp660716lfg;
        Fri, 5 Mar 2021 12:19:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytilZpatuqklbXnbmfBF6YLTFXQOjf6PjHA+UKNZNH9FwThNfzreiC9u5/q7P7//6TTrvT
X-Received: by 2002:a17:90a:5d87:: with SMTP id t7mr12145706pji.175.1614975558743;
        Fri, 05 Mar 2021 12:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614975558; cv=none;
        d=google.com; s=arc-20160816;
        b=W5VSu50eS/oh2J4fsyEzV6pfrUhenTKwpocpCYC7SNvNZ4oKkkYkuJQiFb0J5Tnvj7
         z8BfjVQXftXm0fg3bV3tjJ4CuHk/H4oEWCyztx24P8rCBOu0fqHKGVox8yAqfeK1KqWl
         gAx5x2JstK/l8A66HlGD7bZAeLHrpp74jbKx9m1UkxloLM9FyyV1dLTJUFhqBHTMuH5f
         d5xdlN/Sged1Q+OJ04SEcjJxwO9YaBcA8B0W9DTohc+JhlwWvPQjAr1HRScEbVGcYwUB
         YdP5P/GN4gWU1IkD/VfIQrUjN2+Xvds2KNsnhybHuEtisXBTuFR6J1fm28g4v+KBKr1D
         9awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=Ane6Z/iOYdLzQEYJ1l+yME575dvok5HTBcejFsm2kdE=;
        b=E6XE0cy3LOXFgMJbxfAfLQkq+zRXGagKgzndsw8itqObpCVxtYH4mzAj3iDREp9xe2
         rsReXNPyjAoQHeiCShaAZDk5lNVN8le5RNZDbQQtWMuGc9G3DVmXjcdQvhW5GY/IqtzM
         4JgdVgzUuiJuOIIWgNGy3kDLzkEzKm2pSozRXQifeZ1AQ5fR7IY5bVxl8G0erBRGD22r
         h+yhr1Vx9edwOpoSpqgc9WAARND/yWAtz2tXrAn+1ZIKOdqEcGC8ISvB60B+YmHi6MEw
         ngw+WBU6l9FHxNl6bSrLN4adjpGDzeM3h7gb5N4JbmW1vWK9KK7JlVxMGuFoEvyCpMpy
         A4VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=F35daGPr;
       dkim=pass header.i=@keithp.com header.s=mail header.b=RmS6hyxk;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id bh4si2060271plb.435.2021.03.05.12.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:19:18 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=F35daGPr;
       dkim=pass header.i=@keithp.com header.s=mail header.b=RmS6hyxk;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 2DCC73F2EE3F;
	Fri,  5 Mar 2021 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614975557; bh=Ane6Z/iOYdLzQEYJ1l+yME575dvok5HTBcejFsm2kdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F35daGPrBakhHFqXEvzw8ZwZXl7iauUYj8OKDHRL/hxd0vOtHVC9sShTeA7Octcw4
	 MfR3s1gw+BD9rg5RX8dr1EGlnJRCdiMl6Lse8TEztBPvQ4hbZVlJu6k4xzJQsYcRTg
	 qMu8jC8xRSkKH/aWuYHsycPonIBbnCsQRkT8SN6qoxP+7ww8TIN/mb8UugTBO7JZ0t
	 3cJzxXZWkttA9EswpIYmEYWPMFKltilJugU+kFWw8/LFgEZ4DKsiKv1H7LF2qsagrr
	 tkkS9DaCf0HhyJ639TZ4+9GvJ/dprkem+gduX9x7c1FnBkRqJ7u7xf9CO1IZYZyCyB
	 ERgJHjKYgZSfA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lCDKVBfi5HNK; Fri,  5 Mar 2021 12:19:16 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id C0DBB3F2EE21;
	Fri,  5 Mar 2021 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614975556; bh=Ane6Z/iOYdLzQEYJ1l+yME575dvok5HTBcejFsm2kdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RmS6hyxkYPgcAcR7ivjPlg8uV9hrFA2irCbdaxdTJwGKSY9emvROt4BILfZZ7qrOh
	 CFcOrGd2qbGqwTa0HBJjiX3T9nKRuG+jxGSwu11mxFG+foM9mB0BXJNplOrf58Ntut
	 Aig5p8B/oUC9xGPfxiqYprzg/mIHL7kZgR5u2tnMRe0n1EDnzQe3dg8619CRvCpjOU
	 buHqviXiGGTOnNE2p0xvo5MDdjIExr2SDbP+i47whFnMGSHiHr4YKa5SVmr7x0LsvE
	 N3wj0tU1FQ54/uXjWTHeZCh8rEbmtUwX+X+dJLK7Cgxq0ugqQx1/ZSVECav2wDLkty
	 DbS7TwVF/y5bw==
Received: by keithp.com (Postfix, from userid 1000)
	id 98A9D15821A3; Fri,  5 Mar 2021 12:19:16 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Bug 1915925
 <1915925@bugs.launchpad.net>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <20210305135451.15427-4-alex.bennee@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
Date: Fri, 05 Mar 2021 12:19:16 -0800
Message-ID: <87lfb1gxq3.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: mPZQ8YMRK+HC

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> I'm not sure this every worked properly and it's certainly not
> exercised by check-tcg or Peter's semihosting tests. Hoist it into
> it's own helper function and attempt to validate the results in the
> linux-user semihosting test at the least.

The patch is mostly code motion, moving the existing heapinfo stuff into
a separate function. That makes it really hard to see how you've
changed the values being returned. I'd love to see a two patch series,
one of which moves the code as-is and a second patch which fixes
whatever bugs you've found.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCkkQACgkQ2yIaaQAA
ABH2vQ/9Hns9A12xQi4WE/5uRF4/KHbPczlCwwrrmCIYkllMzNQ9AtlXLSZZIDgD
dBro2yHjBzYWY0WkmgQS5qrsPSAfseWdRTmKukSHJWhxK5sSN8TMe/NvnQ2nN86Y
cCm9QHam716TF+b5mZgQjqTm4RdwHo6RWFhnlxj7M+FfUAKsLo5o9rD0+CL+WHW6
rJycd0X45M7FXVUQqfpZnbmKVzW7wFUeE4PEpIDZvtwU2KOLurYKyIXb+T6xVMdh
qgG9kaEJbYRrrKJXom62yaX+lD+/zwpuU9GUiQ73zrs2oYk+wo0XLXefW7wSDLgy
8HlIHmhplruKQJu3ly0vbqzO7o5QSGvRjsjfvKFe2DrOR5KXBH5bcGRjQ/6Xv7M2
BFh5fjkSs1fcN/LVlxZfug8xP7rsEjsjBfH8FV4j9gOp/qmMdVcWWAl/znuAJUoH
pNnVSsFQ5wVlpTRiYPplDQuzveiUBSXFfcLVnB+SgIIX4COmsI07bj+Z0exRQOqR
UUnVkgG8OUu4u877DOPWJf9v/ly9kkmwJMaJ9VPnvcioJQcxsosHCQgFN3KwI+wb
QUgUrQ0ZrR/stzzqlWjHdBPJNFYt/m0JXguKkHvzSMXYzfaf4LR3h1o6uk+q1xA6
vhYNON0fZ5QJPWGVBk0U+d9LLJxCNsUBOWX+L3ZpGL9yglVvdO4=
=GQC+
-----END PGP SIGNATURE-----
--=-=-=--
