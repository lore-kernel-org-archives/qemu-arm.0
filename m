Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp662648lfg;
        Fri, 5 Mar 2021 12:22:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweXvSImy71b+uHJwoVwue5N+Mw3v+WsifBsICshJf/woXltnKXGEsch9Sm9DYrWnamWZ5p
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr12139240pjq.211.1614975731948;
        Fri, 05 Mar 2021 12:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614975731; cv=none;
        d=google.com; s=arc-20160816;
        b=km3y+mxvIbOU3QylQs7SY6VZD+ZlOiowCaxOz+cdythWFCObY45sVLM82tb+bD13aq
         DKTmx8XYe1rpjW33MrI3k3o5NKhtrdFwVXEaRYk81gMBeXjHUMUKV69ROV56zCZaxOjJ
         9fV6961kpH9hD/xWCr8exVGbTKKZuUjdpuL3KbLSwNSLGfdYO39wbaegOoGncYHg5Buc
         YI9E73gUAmH73+U9Oyuj3lPmbg6QGqDfbu+n2CZmOoMdcNum2bguRev4sSEXRAeDCkvw
         +qcArM+tZHrD99iimUZ512lY0q7G9j9SBRNE7EmqSxbDtuS8QldfSnUXRxmFTwtf+DR6
         Ua8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=M5sx0VQLPo9KnQno/BVZlGjB4AZ0Grv+jZJBHAAIizk=;
        b=dY3mUdmnB/dj9j6dSbZ1bRBuI4+gxNxgxptp2EO8Tod5Z0CXVxcOCpHU9I3t5iE2W0
         sqhtIO065FvDAkU2tYZ4+IsOPCY+6wqLZycFKv4JiDxjpyJzXeXJW+sWTSwAf1Nksijw
         1rSthal34JY0qeKI7dNlHOOhz5z5qejgdWWe91rqmMj/0whnGlD3PAuyOktwmyWQw0JP
         3ZMx0PNH4KTT1ZYB3LpRz+wSNnQL1TJ1eGUh/CbT8YN+ZnscWNoAjm2z4ubPZ0o6RgXk
         Kk2AsI+Uo+dzRFS53Y4F3LoR4rn5bHA1jozxPYATEtdyRXsyUmMVKhqUbUEkmHAIexJX
         jXcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KHquymD8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KHquymD8;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id a2si3785527pgw.291.2021.03.05.12.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KHquymD8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=KHquymD8;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id CEC273F2EE3F;
	Fri,  5 Mar 2021 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614975730; bh=M5sx0VQLPo9KnQno/BVZlGjB4AZ0Grv+jZJBHAAIizk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHquymD8GClsMbPNelw3JIPoMhksxqrmPUd3cbEUgNEdL8SvwlY/JD1ZFNzazbFkH
	 nGIcEhPoXWyZ6EbOP3cWkaDVWQLVG+I/9ZadO8UzOcDDDVNHyVl935Z0rMlvOMWJHT
	 XZIH32I5wOZip5VoMlwETXixgIeMrpD/+SfE9d5R4MKsvQL2FH6ynzko+qzDn3b13+
	 ieBpebInP72NbfPvkqjdtW9aF9LnDN2CSDbo3rY8IdXfUB+Z77h9o1Oa4bg7dAGVuy
	 /CZ+yxMogIIR3w52u30b0MHNAltm+Lc3v1Egi8gr5KytGNyOFmC+mkSpuCvAQG7Vh2
	 PFrguVst4Dejg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sfMXdzvMypKq; Fri,  5 Mar 2021 12:22:10 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 569D63F2EE21;
	Fri,  5 Mar 2021 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614975730; bh=M5sx0VQLPo9KnQno/BVZlGjB4AZ0Grv+jZJBHAAIizk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHquymD8GClsMbPNelw3JIPoMhksxqrmPUd3cbEUgNEdL8SvwlY/JD1ZFNzazbFkH
	 nGIcEhPoXWyZ6EbOP3cWkaDVWQLVG+I/9ZadO8UzOcDDDVNHyVl935Z0rMlvOMWJHT
	 XZIH32I5wOZip5VoMlwETXixgIeMrpD/+SfE9d5R4MKsvQL2FH6ynzko+qzDn3b13+
	 ieBpebInP72NbfPvkqjdtW9aF9LnDN2CSDbo3rY8IdXfUB+Z77h9o1Oa4bg7dAGVuy
	 /CZ+yxMogIIR3w52u30b0MHNAltm+Lc3v1Egi8gr5KytGNyOFmC+mkSpuCvAQG7Vh2
	 PFrguVst4Dejg==
Received: by keithp.com (Postfix, from userid 1000)
	id 3B7E015821A3; Fri,  5 Mar 2021 12:22:10 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925
 <1915925@bugs.launchpad.net>, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
Date: Fri, 05 Mar 2021 12:22:09 -0800
Message-ID: <87im65gxla.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: wY1mfRDcmy70

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> Also, you don't seem to have the correct "is the CPU in
> 32-bit or 64-bit mode" test here: you cannot rely on target_ulong
> being the right size, you must make a runtime check.

Do you mean whether a dual aarch64/arm core is in arm or aarch64 mode,
or whether an aarch64 is running a 32-bit ABI?

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCkvIACgkQ2yIaaQAA
ABEd/g/+O+tWkZiYe6wLv+EJByIAwxVAQWLgzjF5jXa6TkcmyFKHj1NqpzFZTL9e
6DhGN9UOOQTw7YYjFZu/s9QDDkdXV4k5BX+ELDAWuTVdGM4tAWnakrrX+dNCmCuB
d6GEaehzDdB1Mu8KJyyKkMSFKSXV35X6fc7Mo1teqfa+cqLYPHwToreTzDpwt2MI
XFFv/Ud8NAJSncfDyvdOaDXzWU4k22uOZ9EjAkrMO/7q2ii/aSDo5x9s4LHnF58n
v1p+JhwiM/F9xkugkIh99r5OiYIP8K13MlS6VZONE/y89iNdhokG/BfKLjo9XHIu
H/GqeGoo39dr4zEnWo9C/rZ+HVjjxHHh4aGOT37UM3tMoumGL1mVXCHKNXt9if07
0KuC6tvJQpKyAcbUobLLqKxKmZWRt/+AbYBwLN0L9PRINAqjHmPkj7EUw0V0okqa
M8e4TPf13PmpmeOk1WPc39B4jdnzO4+7jkcqIHd1RSKWTH2P/tlKQC9Y4y2ypEDb
fhgCELRRKFZT7d7TCtVSHO/yYMdHuY7AmIVlb8PouGYYIVKvnrDB5t4wVGuzClcv
sf9Fn+yBUtG+MYr+KIgN1d9ZZaLFCHbBT44ZHmBQghHjvcTCa7bnttzOlph3AqPr
1WktDOc3MKFD/dTW+RInYoscou9zQZMXBttHSc57fN9Qo0Ke0Sc=
=PmUx
-----END PGP SIGNATURE-----
--=-=-=--
