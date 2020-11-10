Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4270067lfb;
        Mon, 9 Nov 2020 21:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXOdssg6OOV1VJamc9ypO4VcTYNBG6oozYI5SmyvS6Cer+yvbKfBtqr496wtaQawGVG8vm
X-Received: by 2002:a17:90a:1bca:: with SMTP id r10mr3272227pjr.4.1604985951012;
        Mon, 09 Nov 2020 21:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604985951; cv=none;
        d=google.com; s=arc-20160816;
        b=u8CnyToHRaD5n83mVu3nhsqYm7ESAXnHu+voZ0fc5JdrsyLRwM91fwrq2DIZDr15KZ
         tebcl0C96ZzZUXgbVsJKO2/Yy2eDARLhgWUXrgGTaHWOh3zSf8TPJLlz0twS9mwvSKhG
         bBwf10+8Mpj7BHe+GnWI1S19mKWkZGTvrFR8NwYwUcX2hFePLSMJHGeD6irQoY4rsAfe
         99OIvVMpO/zRNJKBHgXj465CYiDBKXPDCQOiwNronKy0BLzfk9WT1ApqFZx70rYnAHSW
         sSO/Yzc9gOS915Bsl0hvavhqlFZFDYeD/Lw9h5DroqQp5TorlFWeP41g3tSPbHzB2hO4
         3A4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=CvBn1kIY6yIt26ziS6u7MA97/yvtqjOaIPmkpfO0cC8=;
        b=aJ3FV6tEUJdTBjhRuZpPLJrLF1Q4zG4XKe3MDlEQc0ApVG7YfR122xH6UZz64IANHZ
         D/jHeEK8WuPbtg/A1NkYvqF2rasGIOwK+hyZ14qaZpfJ3bM5dTRyhyfo/uWLZoszFN18
         vNSTxabJBAfNTjnHi/chr/qJwqYtpMflb688lAaDaoqrG9TVeZd1Ce+sPji4sgMMRmcl
         6oGuLt/wV1DzBobZwh1BRemgboKy172hL7HupZ7HiMCdWv+X2Ferf4HEgZY9ZZDBsUql
         crzn2gVJzcv6E88/tfJtdYXH9nr/jp7507f9lzSyGbpvI7BpkWL4FlkZWqR+bgmbObVx
         FchQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VJq6AvVm;
       dkim=pass header.i=@keithp.com header.s=mail header.b=i0C3pXOt;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id v10si1392186pjt.62.2020.11.09.21.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 21:25:51 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VJq6AvVm;
       dkim=pass header.i=@keithp.com header.s=mail header.b=i0C3pXOt;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 5C72E3F2DFBF;
	Mon,  9 Nov 2020 21:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1604985949; bh=CvBn1kIY6yIt26ziS6u7MA97/yvtqjOaIPmkpfO0cC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VJq6AvVm4Ge39R+KsjCGKQvcUmLwGoJVFqZBmP9vLL49PbZunDuBfgDYI3GK+awLE
	 QiRmmbZZu81rR5W5Op1n4bS6pYiLXp3Q+MDWYTEZTzb1OuzCyv/x48yCNLknXBm7lE
	 c+BqSeMNDnEuGbM4Eb3LBftPGB6OBNPiTPrlg8i6UYyZs8W7A6SH7852U4z+6UPo/s
	 eG/e8QqSArr+FgBC7apBRD76IBRsbgk00+CDtlzKKJ39lVauPYFqzSywpzqCrG6ZwR
	 DWXeqFO7nlcZrIFxBlf/mACZIV3bcBkZDif9gl4djFNrWFIyiDpcijv9ZitJWjwWNB
	 GLcFnAylNa0Kg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fgFGcXTwhPAd; Mon,  9 Nov 2020 21:25:48 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id DE35C3F2DFBE;
	Mon,  9 Nov 2020 21:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1604985948; bh=CvBn1kIY6yIt26ziS6u7MA97/yvtqjOaIPmkpfO0cC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i0C3pXOt5FEBLkUp6KAPKf5nqZQ9Ywe4G5gyMMQtGJXyyE4+Ex26S7SQk45wLwG4t
	 zJubRYpQ+U1XZYgsMXW3Vj1Erb3NVa+MWk+6oeMt/e/kZxf3kBjymV+PMzgvKNa4F8
	 sCYdDBLUUxzNB8qjBYAuOqEf4Klfpt49A7RmA1Mg2vOR9gObg9j/JjYLZT3WBRP5ty
	 jDwgSD3lqhWco2a2brExzTT0VVRbuID5SU0TANqXW5pnlR7Z6PchnU3LBMK0MhbZYG
	 99I8zz/jklpcMwkoN1+kMQeGTjOJ6i0/62zeopAYeAWTZZ9Jmlt/wN99rVeNXjZYkB
	 GIDTte9oKTLPw==
Received: by keithp.com (Postfix, from userid 1000)
	id 930A21582210; Mon,  9 Nov 2020 21:25:48 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories [v3]
In-Reply-To: <CAKmqyKP1kiitjexn9jPxNq=qrC3sm88++a_LF5rjNEcxiU1C=w@mail.gmail.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
 <20201028185722.2783532-2-keithp@keithp.com>
 <CAKmqyKP1kiitjexn9jPxNq=qrC3sm88++a_LF5rjNEcxiU1C=w@mail.gmail.com>
Date: Mon, 09 Nov 2020 21:25:48 -0800
Message-ID: <87y2j9hjfn.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: LQTV5LTW5e3D

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks much. I think we'll need some help getting the next two patches
reviewed; that touches ARM code. The last patch is also RISC-V only.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+qJFwACgkQ2yIaaQAA
ABEnQw/9FJC672E2IYKXA4l3sZsmOX3yg15RtekRKSaXZqUCimaPX6OCInztCOA2
4ocQ7VZ9KxhhWyi0tA++xID8uWgJgzTwxPGL+/nbW+IHa8Myu33D0ibmo9inQL+R
miu1tA9mKorGvfZ8cDoaiy0wrZNJyuqiGJDpSMDABbNHBvKiG/QkE7qBhi0KIX/c
+9IGA+JkrNTtfhw078e1GSArFqJqVzFCx0PZ2mrw6MT4E2SVBEs48022e9W3xisR
tR+PHek2dTTNfvsrMUzRfCAJ9I0SAPbO6vzGDeesDmFawFmqQ0Nwg8JGVAeK4dH7
HwbuF7g48DfPEiCSN/npEpAiQFDL86DPHid1uvOVx/hT00VrhJnmJGVTuq9Vy8nI
hWUYbbQRgHD4Ua0pS9TjJLCl2FkRRjRlCNGr47Wgx1qduL3NhDSWga0QMWBf7Egf
D4dDDDPJC/6y04U+LewHZy+DzuOWn8xkWNLireq4aZBh9CNmPPkRjdGU0i/F7i2u
X7u9JI4x29nQvUyCvMd0qhn1zp7zDZBp6K1tfuCvlAnNsebLEICPA5ti+PuAsBFZ
vC/nMrYa8NMjjpl15PKwevuSlBGJi07ZZojGK9lFj7EiF2PiLiQFq1l8mvRBBkGx
xxfOdOlq07l2phoHAC6wHyTCEJ/+uf9l+vXHGfSgipMdaNEU52A=
=ZV06
-----END PGP SIGNATURE-----
--=-=-=--
