Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5093163lfb;
        Wed, 9 Dec 2020 08:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwopYDKxtH/tNznPdelpf3FwjdDHe38THEVLSkGy4jsGz/9NAr8+OuaHozp7oUhxFw7VqfE
X-Received: by 2002:a63:1764:: with SMTP id 36mr2627426pgx.177.1607531377716;
        Wed, 09 Dec 2020 08:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607531377; cv=none;
        d=google.com; s=arc-20160816;
        b=If2Iq9VZDScXLRESLPsbHwmIfQn3+fL53zTiKnAf3r1PLE3GuAQ+veG7o7ILZCSLq+
         7COsOCm0YmhC1sHTt57gnXfZLuUQbILGifww7ykL+6fLcZchWXRVxm6ZnYdcd++DbHdn
         Tk+8bzGkxPlNs6zecBLYfOq0gnvWbClaUIcOgS+CCOPN5fcaOhNlckjht4gSF/HUoevG
         uNKer/CYTL949sJQHb5+bOVsPAGODphSfhp64iTpxwj8zQ2woGhgD3yZkfnlNFIsVYSn
         036kLnudOkpe0e1u9hdML7QqI6Omz9bLeXGzvvMwnf6EFp9AALPx/sI51t/mBpGaiomp
         Efsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=NfvvG9R1oZHC0/72KAn4eRO/RbaxPTHZX0E9qTml3UI=;
        b=Tqh6TUKkeViwnsW8ieDHaxHsDlDjOxBsIH9s066w0SaNTophqqcy9UBsIUyib+DOAg
         OhKuZ7ZxNZHWGwcY5oDWU+pHmiFSf/ZEVxZ/BxQ9XnVUNd6znUZBqDMEWLTVfuPmiqGt
         ztoOXHQqGHsmU2w1jcc1RVY2E1PKPfUWpGy24kCch5B+eOi+l6EEcWaChy65aB7oy2s1
         HRGBzgGRS35EqEa3+qonsT7+2wOCBf+SU34fXETdnOc7U+4df3hjxc+xOcb0qF1hwEAK
         0vFUE6TJKoCoqHp5fIV9U80a9aSMWk+l682QWvWeajUIu96kDqmyh6Vwzvo/AG5qRi6a
         zyug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=syXM6nJ8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=syXM6nJ8;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id lk3si1590809pjb.0.2020.12.09.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:29:37 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=syXM6nJ8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=syXM6nJ8;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 72F8F3F2E329;
	Wed,  9 Dec 2020 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607531376; bh=NfvvG9R1oZHC0/72KAn4eRO/RbaxPTHZX0E9qTml3UI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=syXM6nJ8lwxL0amBETOnN1p1SckCQYDv5U4mPPW/2YfeTOArON8cCF/QOYDuHzrbs
	 CAVZNTkOEA01WyciO1sxR0S7pwbKE5eqUj2ka14ZzGxMgzChMZz/qhXn4LbHtJpiwF
	 oMXmkmrf50Y6mkeiO0F0mkozOtThwxrbuavVEV8m0r2zc5+EaXj+yfoKIClcusJB8q
	 vPpnni8NEPyMtrQZs7d3FOBE0Z8XJUR110eEMK7Imn8NlumNfPL9BR3MkHR9bXG4ST
	 YIV7TXhwjp3x9lvAiAqBP5yC5UgyXKhtsXR42qcnDn923N4N4jsYreuNxyx3LTZM6w
	 SQ/Li2sZe1ePw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6I6X17j2ur1b; Wed,  9 Dec 2020 08:29:36 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 0E6273F2DE35;
	Wed,  9 Dec 2020 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607531376; bh=NfvvG9R1oZHC0/72KAn4eRO/RbaxPTHZX0E9qTml3UI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=syXM6nJ8lwxL0amBETOnN1p1SckCQYDv5U4mPPW/2YfeTOArON8cCF/QOYDuHzrbs
	 CAVZNTkOEA01WyciO1sxR0S7pwbKE5eqUj2ka14ZzGxMgzChMZz/qhXn4LbHtJpiwF
	 oMXmkmrf50Y6mkeiO0F0mkozOtThwxrbuavVEV8m0r2zc5+EaXj+yfoKIClcusJB8q
	 vPpnni8NEPyMtrQZs7d3FOBE0Z8XJUR110eEMK7Imn8NlumNfPL9BR3MkHR9bXG4ST
	 YIV7TXhwjp3x9lvAiAqBP5yC5UgyXKhtsXR42qcnDn923N4N4jsYreuNxyx3LTZM6w
	 SQ/Li2sZe1ePw==
Received: by keithp.com (Postfix, from userid 1000)
	id EA9AC15820DB; Wed,  9 Dec 2020 08:29:35 -0800 (PST)
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
In-Reply-To: <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
Date: Wed, 09 Dec 2020 08:29:35 -0800
Message-ID: <87r1nz6iz4.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: UwQzBREKNJ6b

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for the patch, I've verified with newlib semihosting support
> which is contributed by Craig Blackmore from embecosm,
> and I would like to add semihosting to user mode, do you mind add this
> patch into this patch series?

I tried to add that already, but I admit that I haven't tested it in a
while. You should find that there are patches to linux-user/semihost.c
and linux-user/qemu.h to enable it.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/Q+28ACgkQ2yIaaQAA
ABGFNw//Ul4a0PbfO3j4ey6T6eC53q1i4ObgE0Bsatdm6xLYgMB7CyJ8Bn/T8h8d
/J31ZrEuRl3+vZhMZE4BGm6BuMEW/uwbrlKjfkTTep4T7JzXSDxUBaO4xa7OYnkI
6R/k9QYoOdvo31zfYG6zg6B1U8FtwnX1mSCUb+GjELEwKdea3yxa64yzapWnzsnU
TqkEP3Vux/M4M+z1LFkZfmvjhVaYcuNczuY3XbL1R7HZJGQktIaBh/lLvOPSL5u7
CQP6H7GZMJMrbJ4VH2KmcyBHFERlBsodXmJKf/ed7fzQLcuhKEYyuzzJ8JeQqwS0
IoHu6DCA5LbzNZQPvjxY2WJ8Rxzpq7uNbrioNC5xLIPvypzdVJUUW4u20bP8wJtf
jUvFNK1ZJYTGomlpL4p+5/f8M2MCj61Fz7wJaHRt12SIRYP0Lt1m4Obkglh9Aneh
PTvepH9BIqEd7FFoJMIFJ2bCcs6Yva8f5lAlW2MPxSs1s42iCVTyOHU/IrcX6e1y
HH68QwmxaJb9XoUV4luCD7WSXm3x8uyH3nPLsxxhTNd/EsczDK/r3q7v4cAjmPQm
URnGQx88afZnpI4xPmCPWI6IGmUta8gzCYw6BdcJbQOA8bxIyTFklV9ouzV25awT
Vnc0GlPGnSi6AjgdHv7wSi7qcuA2SWfLuc+wZZdHTXMyAKT43SQ=
=aNTI
-----END PGP SIGNATURE-----
--=-=-=--
