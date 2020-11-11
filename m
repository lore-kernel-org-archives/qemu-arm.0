Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp838611lfb;
        Wed, 11 Nov 2020 14:55:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlDbLaQtcFw3p7gjctIp6MRNEYCk1qokA4Kv2CKSnbJzRSQjUgl0yIpIXx7CtdKyjlEBSD
X-Received: by 2002:a17:90a:134b:: with SMTP id y11mr5770466pjf.182.1605135314234;
        Wed, 11 Nov 2020 14:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605135314; cv=none;
        d=google.com; s=arc-20160816;
        b=XZGONoXs5bQIv67DNRrHji4Hn7jFkqzHqL5DaZaHtgwsqfCaGaFMOdxFqZJimJwDHx
         C8xo33JB7cF05VSeSJuWqvsfpbhhYOL8b748/6LYxbjUB7kGFx2oNJF41GlriVs2IJhE
         479JqZY5WJ/0krcGFwl8e4oOYnDiQ5BMImwUiP6qLh/MYN1p1Ps85aq1tihx9CiOkhlH
         RqKJrnJVQ+JIry6+qKKybOs+js/ZUjtyZJMcUFU1GZ/3rbUzwPtfNR/P3x/K2kkTq60h
         Za4RAYgoxWLV3w7WJSEJVFs7lzTJCMkdFUvt8sHMWxbOR1fQd7d/MGuA7vc1bTDiJ8Ek
         1OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=JZIe14bRwmP+C00P4oHG7KgMsfDy0gkTwlW10qLs52s=;
        b=uU8ocDejCw9u/RVa99RitBxFqq2zduPdof7kbedxS+n5tNIFPejvXSOWchwlCR9Lpz
         nE1NK09Dp1FxbcaaREhgRfw3ti/jq+yeiBug6HWDf1fUmEWCMpxqCcpkWmkGj9V/m0/l
         /IT4/nT+qHpvBi+/ZiIpbd7eepMsa0Up++SYeyc9GxZDVI3L6uOYgPYAAs485GgIctek
         1RII8JYPlycLAz3ANfnk7TcmC323oFyVEvFeY7vnLIz1ewo7LATLlQhDIcmIH8sAZD8N
         coxIkR+mkX+EzfYa2XEzYJoyvKfcMfKemVbsimVFi8CzMq0Ej8KpwIjatIxBIgjixrBF
         SdwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="u6/e4+gz";
       dkim=pass header.i=@keithp.com header.s=mail header.b="u6/e4+gz";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id n23si2942240pff.286.2020.11.11.14.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="u6/e4+gz";
       dkim=pass header.i=@keithp.com header.s=mail header.b="u6/e4+gz";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id CFDBA3F2E04D;
	Wed, 11 Nov 2020 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1605135312; bh=JZIe14bRwmP+C00P4oHG7KgMsfDy0gkTwlW10qLs52s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u6/e4+gzuRFJcuSFj9mOTyfYopxNZWSPQs7PWE8W6nxOpMfFAaE40U/vDba9Xxm4O
	 C6Yxrszy2J9UNA4AqSU4q9G3n6TOF9tm8d+Y1LvauK0sMHf36MjFzK0QDlonKm+RfR
	 WfrCWxAHkgRJth13A/pbSBXt1ADz3jerTan56ixgEGHY7jcKq7depQ38cszO+ie4lg
	 T6FKZfom/FhxyBfcAp619QLEPoTAn0/JFiaO5cChroy7e7TEbX6sjvXrXR1aT/Zh2+
	 aJ+KwGHwc4Du8CCIQ8UmzCG9BZ41YqelpSeUqlnZUhDCQTJnuCqTeoCHa21pw5VhIN
	 +nh71w5C6hXlQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o7VeoGUfkPt4; Wed, 11 Nov 2020 14:55:12 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 6D9653F2DFFB;
	Wed, 11 Nov 2020 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1605135312; bh=JZIe14bRwmP+C00P4oHG7KgMsfDy0gkTwlW10qLs52s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u6/e4+gzuRFJcuSFj9mOTyfYopxNZWSPQs7PWE8W6nxOpMfFAaE40U/vDba9Xxm4O
	 C6Yxrszy2J9UNA4AqSU4q9G3n6TOF9tm8d+Y1LvauK0sMHf36MjFzK0QDlonKm+RfR
	 WfrCWxAHkgRJth13A/pbSBXt1ADz3jerTan56ixgEGHY7jcKq7depQ38cszO+ie4lg
	 T6FKZfom/FhxyBfcAp619QLEPoTAn0/JFiaO5cChroy7e7TEbX6sjvXrXR1aT/Zh2+
	 aJ+KwGHwc4Du8CCIQ8UmzCG9BZ41YqelpSeUqlnZUhDCQTJnuCqTeoCHa21pw5VhIN
	 +nh71w5C6hXlQ==
Received: by keithp.com (Postfix, from userid 1000)
	id 4AF2D1582210; Wed, 11 Nov 2020 14:55:12 -0800 (PST)
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
Subject: Re: [PATCH 3/4] semihosting: Change internal common-semi interfaces
 to use CPUState *
In-Reply-To: <CAKmqyKP5JpriojRqDNy=SqqkXtg=y39P5xNoMrSsoWhfz8xeaw@mail.gmail.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
 <20201028185722.2783532-4-keithp@keithp.com>
 <CAKmqyKP5JpriojRqDNy=SqqkXtg=y39P5xNoMrSsoWhfz8xeaw@mail.gmail.com>
Date: Wed, 11 Nov 2020 14:55:11 -0800
Message-ID: <874klvh5bk.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: W5H5LGWNLOEr

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> writes:

> I'm not sure common is the right name here, as it is really just ARM
> and RISC-V, but I don't have a better name to use.

We've already seen some interest for other architectures; Benjamin
Herrenschmidt was looking at using this for PPC, for instance. He got
stuck at the same point -- attempting to split out this
architecture-neutral code.

In any case, naming is hard, and if anyone has suggestions ...

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+sa9AACgkQ2yIaaQAA
ABEsrxAAqMjpV6wVK7otXM/sddT6+yG/AvGM+oWDHu45Oev9s3Q0TFW2pYkYQZ5O
uOHmTVeKAPsGC8YcobtIUgk2dpAX1B87kAKug3BKWBAB8xTrcFUYQc4b5/viclKU
lJie8lkZR5KkRXiMA7gCab8MECY4cj5lBjwN4W18bW/SVDZjnuuRu6P0EUKbXqsF
B+JOiiICHKamVFoASWlzdf3jXTYOTZk5g6N5HIngTRcjpqQl7RvycOm6Ky+dkvrB
ZmpTDdp8UzPsbuyWd/9uYaNwZWmGWh/jodd3kNnG0APL5Jb0ANzI9/165faeyuuY
44XCWT5MRMwwODOgNmzpBpY6r7pJYaltzSzZUu/IKqZKAPCPxIihe1rzSJ5jNFEQ
rwFp+RlmboxjQP7iPvkc1XCbmNpk2yEXFLnS3UUIqtrorysCdwU+59lbRcHBms3X
MwU0oBrYZgamNCyUiJGTmEvwqK9f5O6vEEF3vQWGESsO94h16lZBG2Yo64KvxTCu
E9rLq661bFKwcMxUAzHIamZHncrbT1AF07K2kdiRE3KPgwCaQTUqMwIqgTRpnNXv
WufvK/v1L27/i2HmFYV0QKDm7GfRMhjqtY/NTABZmJqtTDvnlTqvRvY9LyOo5Z1j
cYLp/OpsPudDLxtrqP1o85JXeanMMMxfhUg3A2DmNOVDFzTx1yg=
=DSes
-----END PGP SIGNATURE-----
--=-=-=--
