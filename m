Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp784168lfa;
        Wed, 28 Oct 2020 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3/j55R6uAjDwnqp/H91PcIUt/201IZYxERBdzdXLe0M1cPJyd55N9qfVl9br0IOoiGUok
X-Received: by 2002:a05:6a00:dc:b029:162:2aab:41dc with SMTP id e28-20020a056a0000dcb02901622aab41dcmr773867pfj.54.1603912498818;
        Wed, 28 Oct 2020 12:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603912498; cv=none;
        d=google.com; s=arc-20160816;
        b=cOKVsyOWqXyVYKajDuEtFFqcj+sNWAOoe7DgKsGPciahBwT9IWwtcLHvsK7FelzXGl
         bMVuVzXOugUTIVn+bCCIfXcP0yuiYpkZA0pFFzHYYKdf/mkV/hTn9w2gcFiSkwG8MQ9+
         1uPZ0dsryqXMMy0Su/3o9SUEQ49U5ogaNdlX0DaY1pGX9/n2UGGveeggszTc7mXjH2tT
         3WO92u8nr6xhEi7Tms8XHPfXeKlc2/7c7QS0Mfb5oU/6sTx58vQJTPLToaB2FjaMRYgH
         aaVSCn/1XZuyEZAE6Lg6/RkYJm8feFdJkvxUmtE7yaCEB7x2uKqKH/6AuiYAwLKIgtHk
         nAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=F3WbULWDdUjJCrXSUslzisiza1MBoe4xUfkmq+73EwA=;
        b=ZstPvj4F4vPJlRM/3bYlluA7ZPbzTZfvrNWDsnRD/4GBhZNk4O0CS7hnOIOJnhveYY
         lNRyV0oS0ZS4PTPZNgVb+JukdYYVrmZT+sJGB+vCzQCuDSAY1F08WAXXLvMml+Hme6C0
         YSXsog7IKRRb18vxhcmPEFtlyVDl8TJ/CUAQUiuqVYse10axnT7jeAdjhhyd9ZbaxfGi
         LwrdSCoiMasW0GX5j4IjBWNUtU/iQOlZ9PAHJL6CPS7N8ipu3/y4bO1WY1ZM9AUSOAvB
         +WILc+DwAEnk8OHP5vGJns72nlvNkie5GfeT6Ldk8pQcmxo5sLHEzG7aiZe3DJH+Y/dh
         eRlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=dLey65VJ;
       dkim=pass header.i=@keithp.com header.s=mail header.b=dLey65VJ;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id d9si249420pgj.241.2020.10.28.12.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 12:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=dLey65VJ;
       dkim=pass header.i=@keithp.com header.s=mail header.b=dLey65VJ;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 9DCB43F2DDAC;
	Wed, 28 Oct 2020 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603912497; bh=15AVrp7vyPKovp+JUmmgOjjbkG5b36Rdgg5pRySikf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dLey65VJwjuSS+DXkhpBWfbyHvLyQiOAeGulUDSP+Mang9Lldm3/qbzWrUha60GBY
	 cAVHpxeU6fQSkLwWJpx2CiahvXOE1w3C/VBIiSjQv0ba0lnLe/u4SZiVEksGrw51FG
	 UqgD6Bwy9gE3O2x9vo3OIE6ZEQI/1FpGWoA4y6pOmd8RmgO8l1lJSfN9YWeeNbXgZD
	 T8NwO9c5N43A8DrmNZUtJXVcRvo6p5J1QXgFnPhBqONqaCBIVvm9yB4yY8+fTo2P5J
	 /YRh77kr4eQ4SKCfWJtOfI3rRCHZBEmk1dlOJ34cCpGNu9Tb5fZfQm5cRbUjwB+iC/
	 gLevWNNJeVIrQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UGHBryi3ZMdv; Wed, 28 Oct 2020 12:14:57 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 37F213F2DDAA;
	Wed, 28 Oct 2020 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603912497; bh=15AVrp7vyPKovp+JUmmgOjjbkG5b36Rdgg5pRySikf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dLey65VJwjuSS+DXkhpBWfbyHvLyQiOAeGulUDSP+Mang9Lldm3/qbzWrUha60GBY
	 cAVHpxeU6fQSkLwWJpx2CiahvXOE1w3C/VBIiSjQv0ba0lnLe/u4SZiVEksGrw51FG
	 UqgD6Bwy9gE3O2x9vo3OIE6ZEQI/1FpGWoA4y6pOmd8RmgO8l1lJSfN9YWeeNbXgZD
	 T8NwO9c5N43A8DrmNZUtJXVcRvo6p5J1QXgFnPhBqONqaCBIVvm9yB4yY8+fTo2P5J
	 /YRh77kr4eQ4SKCfWJtOfI3rRCHZBEmk1dlOJ34cCpGNu9Tb5fZfQm5cRbUjwB+iC/
	 gLevWNNJeVIrQ==
Received: by keithp.com (Postfix, from userid 1000)
	id 074E41582210; Wed, 28 Oct 2020 12:14:57 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-Reply-To: <87lffqmwi6.fsf@linaro.org>
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
 <87pn53e3ke.fsf@keithp.com>
 <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
 <87k0vbdthq.fsf@keithp.com> <87lffqmwi6.fsf@linaro.org>
Date: Wed, 28 Oct 2020 12:14:56 -0700
Message-ID: <87pn52cgcv.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: iOenRuvVso/C

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

>   specific_ss.add(when: 'CONFIG_ARM_STYLE_SEMIHOSTING',
>                   if_true: files ('common-semi.c'))

I've sent another version of the series using this plan. It does look a
bit nicer as the only changes required when adding support to another
target is to place this option in the config file.

Thanks for the suggestion, and thanks for helping review this patch!

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+ZwzAACgkQ2yIaaQAA
ABFKfRAAoNNSBmk9FrsTXQWVoNV5Lee3o2z3Azr2etFFYs/2piRt9f0ewsZPJNn4
sZKOI/G1ShBYsPKulb/JBWPsdh6uN7+8cr9GE8MGr7VIRsDZOxKJNh1cDSACVhva
yxu8A4r4tjNDfTG4L/J8HPpOlTpqM459F3fAwEQoPkOtwOp7J9mMHKKcPgCCVoUe
QzZHZZoDrrK3VQSvzgZPjVuBeFqrWrIyy9LETeMD6PYl7gwz+EJmjm+1/VbKU8dO
pJ70JO7tECiF4ZMw/AjZKtPkl4HDaXvbn8ajyyJuUnKTpP0uywtw9vHyQl5za7ep
b/2QzJF+HxircBU5t5VtPj6xT2C40KetqJBOB1ADroAQ2Xp5DJsQhKf+jxVulBv+
qGIR/pK6ToGYnvUFxTP345dywInUp8WOcZ022ElnhFEdDLMz7iZUeCxTdg+QxXr4
2GJewp5ij+bU8E4Py51+4r5MzuVVJwVnfQtt/RW0u2c78fj3Zzuk26yj4T1KkFQc
3K+W9pqmxsJWlPbAto6OYz+ek/+VeG3wSu28KPclCmJE66Qmp3IEG6cPBamvcb2R
cC6K3QEPpTjT2/nYSLRVisy+zsuWcjLD5OnLIhg/HS90Ge050r7pSWY3qmLUfPVA
hbPUAb9QadLefOnbkjRhXbproOGEd90NJX+8gI+bqlYTltWhZxs=
=pnGw
-----END PGP SIGNATURE-----
--=-=-=--
