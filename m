Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2032741lfg;
        Mon, 8 Mar 2021 09:28:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyds2oJ4ZCqpmgEGmpnEY8EieCdXL+I/trLKpCpuvAQ49DJR4p0JhuI/MKaekAyVLvT5ztx
X-Received: by 2002:a17:902:b70d:b029:e3:6c97:d180 with SMTP id d13-20020a170902b70db02900e36c97d180mr22064085pls.40.1615224486506;
        Mon, 08 Mar 2021 09:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615224486; cv=none;
        d=google.com; s=arc-20160816;
        b=pHVo4/WVgCOeY+a0gHi5/+mM1Mxr6VsDgj6KNWVc41JBu/XtHs0R4ZbBEMjb+HPPLk
         4TAU05C2SqPykpUKqgMRy7yRLFhTtO0cqh1JndEZX9cM7wBgrOrTH9/TTMdNu1NSIZnz
         S1yYQsVyW6J3UDA5gRRPaBF2DADN1juUyBNgHbecwI4Zi8qfIbCHTK91b0rX4FUHwOtG
         4zoQFp6XUOxomnXEmR8et7w4Y4ebX7qZlu9AfZWxfP5qA5YM8IZWWCt34dhgV4P5Gr6m
         HCE0Ukd3MKiaqfxXhC0ltciRleEhilc9/UzWYovNjioiAczhuTBM3AZ9zTCfQ1Km7cm3
         QOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=m+sw0Zt/ees661/3Rr4sQMtlM3GlrM7DNfMqo1u+8RM=;
        b=xQ6r+v9V0wNjYMTJf9vBdEssd/ira3qF8v+ukhTwIbqkdTLRoaAcrwMLWCzunx5dlx
         PgbhyXpyWCtxQZlsAo4tsV6Py/vJIq3Hj8BmTf9g2qm7+srGggRb3eGbWCeAKErFld6d
         bA05N5D1vwyD7ygU5vqgFf/ZIv8wUypremU6lvCRcT+/kqFPgKgL32hmXy82dE2j7AkA
         jxlWn2zm3GQxyDLjtptXEXCn/+ja+XEmTwklg2Zc1NlA7LnszUYIFT6hApaZ1Fua+zeS
         H1Wr0tLTZp5PJWWP/hk5iPz8szbblax3rL0IE6LDADSNUJyJdw2DttqcRWtXv7XDBOCd
         uf5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="YG/ZVXMG";
       dkim=pass header.i=@keithp.com header.s=mail header.b=RO8IMNND;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id v6si12602227pff.37.2021.03.08.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="YG/ZVXMG";
       dkim=pass header.i=@keithp.com header.s=mail header.b=RO8IMNND;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 048203F2EDF3;
	Mon,  8 Mar 2021 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1615224485; bh=m+sw0Zt/ees661/3Rr4sQMtlM3GlrM7DNfMqo1u+8RM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YG/ZVXMGmDITTxUCT2GXnlZoFpKkAAp/PBRZkjxVYwtrsl1BcFaKFvdrzBLmAmHh7
	 pl7vp9SqctV7r0qPpxWXWA/KYzLKOy9EEfMy4HZ/gcgQRaii42gRnuBvEU1/3Vbyul
	 D5dM3gOZ2baZar4I69Qo9nKF3w4IX9dDdsguGIgiD74ez9h8dHtV30B5A5xG1DdK0a
	 HkVHkM0NlTeWpkfnKZERQltSxc3Uwv253xCBfbmScoRc4rKfwqy975W7ElHbknxGcr
	 5weFh0XD87jihSm4fgLdirQVE0m4UVZ6M6mysqpESIESJ8ENp46DA6Z9Ekwa8KIG/S
	 2cWRgaWqurrLg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GqbDHdoCU_hc; Mon,  8 Mar 2021 09:28:04 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id AF4643F2EDEC;
	Mon,  8 Mar 2021 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1615224484; bh=m+sw0Zt/ees661/3Rr4sQMtlM3GlrM7DNfMqo1u+8RM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RO8IMNNDZ51kjFPnj4Wdn5F8wnDaCPXbBY07C2ztSR4rr6a3pdLt/visRgSY1Zz8k
	 UOxHNlWeOsyk8kSsU7vbKC1C7D6ugw1FuvRiZiyHlrf4XIwvMrLpo7zX5tn0t6oiVu
	 I9lQDGh/0OaZkPra24h/gxFRYCyWTFiQuCnyLJieRzthz5U5RanSgz9CI5K/R/Nelp
	 81/0Rg4nV3hila0fjeNuscU430t/dbw9UosTptpPZSpwsTcqTUhrnW5rmrHbn3zeUk
	 3Q6UOoOS79vsnia9wgDyXgBwFXrz62LtFfeTYvBneaD39ht+w2kUspJ37f5XDNIG6t
	 jJ/jd7PXOkAaw==
Received: by keithp.com (Postfix, from userid 1000)
	id A7F7A15821A3; Mon,  8 Mar 2021 09:28:04 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Alistair Francis <alistair23@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
 <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com>
 <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
 <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
Date: Mon, 08 Mar 2021 09:28:04 -0800
Message-ID: <87czw9ftcr.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: x6Q8ZdfGrlhp

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> I have started on the effort, but I have not finished yet. Adding
> riscv_cpu_is_32bit() was the first step there and I have some more
> patches locally but I don't have anything working yet.

That's awesome. I think waiting until we see what APIs you're developing
for detecting and operating in 32-bit mode on a 64-bit capable processor
seems like a good idea for now.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBGXqQACgkQ2yIaaQAA
ABG7Aw/9EA9NUbXRwNYs14zkycnnoFVFGS6Y3NmnDBeJ4h6WqQaAvMVFg/jVB2AX
4q4SZsakKc35H+i9icj/lBpBmdVySUI/kJ+elElE5IVYM47msBBGYb8KmX1f1n1F
twgWduMjHi4KoPbitIl1OtCr8/oNkddBKmPsEG/kYdxmZU1bdKg+YYSNjUZd80JV
JHb1uAyAZLLBGLKEjm6ZrfJGgDPDzik+nuLieVn9pAkPUhUSr2/a+ZGjcMFIJMxv
ws1OOQmsjgR25yHk004yRqXgueS1MneXC9ri7cN/NbkbiKFMKrzvJKP5susTs8wi
ltZ0CLiYmKt/VaNnEx4xzBUwR/o+7ML4bxOSjxaWCazRQPi/HV3b0h/+XzLl0LjM
KEGDLpVLEw87tNIkRBdQYvAuZbFG+WwqOBE+y0U+JhS5rZzLJijZUnOs48Y84kVE
dpBdHZiOclU9b1p1zTLi0+Nv/9dFZBZOPXBWwdsGvn5ExYU4oFLutBxws3UP9TBW
r5LuqphhzvHN70yu56hSH9Clbhi4k5NacZft/7PS+v2K9lszQs9ndbvmFqr8T1qY
SldfyUI1hZixUMyQPMFcaSsHq5Xo4PJOdgtNdBsSO03wv7cSla7XaqeRBdAcVScw
ESl3K0bO7sZRlDy4xGuYOu2xNcRt2tLctYjZiRZvpMsYo6pxFwo=
=kcrR
-----END PGP SIGNATURE-----
--=-=-=--
