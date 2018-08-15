Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp461933wru;
        Wed, 15 Aug 2018 02:02:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzP5hw8YA5vpY3LnywNHNccmIMagejbe8/Qfbg1P5nUJJURu1P6NbQ0Sx0N9Z1MUUPbZOMv
X-Received: by 2002:a0c:8261:: with SMTP id h88-v6mr22256650qva.117.1534323755334;
        Wed, 15 Aug 2018 02:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534323755; cv=none;
        d=google.com; s=arc-20160816;
        b=nTVkvy9zp0hXzkO8sboVxbnIsZme2FWRe8lrogeJSqTQGepgG5ZWlsUWiyctHvPBY1
         RLfoA8aKdNymPtxY2vdLxAHCqhsHvZf55LqCiWu99f9waVOgeATejTv5JV3Dnsl5nxdC
         pHa+T9L1WEd2TgJjq3NNP8Qmf/ofs3bDGcyjh8VkXUbYpzKMULjf3u5E1hcnp/YLM0Zf
         pqrV9lfuIkMpq0M6KK/BZzv4rE4YznJmUPtXXS9wq9gtsQzvgS1v0L3oiUqck288uIHA
         aaGt9l6UUImgaebNltvxNjole/CjDxGnLLoH0d1j8qTSh1yVuiQ/6hZkAoHvL7QPENB4
         jG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ebsu3LjVxUd9vCNC6h0q7h1HNZlQwd4mx4ew/b4FL9M=;
        b=c4GrC6KhKC5uwRqFnGQC+OrIDrJ18f0DizFBNGmNHcj+oVwN4MEIMyi8/BkZ/1tFOe
         kXui6/btl9sQeRwY3cAcLKV1wZx5e4/P71i88AP6Wh91zBh+BzqoBOtdtDd6XRZ5BN1o
         6jdcxw273RII4UDHDQKvZCSd12DGW7sWKRmvPbF5WGVY1vKrd0m5Z+TkFM4ygd6GKZKj
         NPRy+Jmdryn2eK7yM71eO1E3ddc4OZ0yAGXT3n330Q9C4DwMf8OUf31tjyy0PR+OIcfV
         JErez4i5ja5MwHhKgVNYzCzhCY36j6v9rtl5ZSy4kd3xsWQnzl1/zhqJYIFXrbryDugd
         B2EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ElD1dVJQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VgYycNl5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VgYycNl5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68-v6si2273372qkc.163.2018.08.15.02.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 02:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ElD1dVJQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VgYycNl5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VgYycNl5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fprhK-0001e3-TK
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 05:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fprhE-0001dw-J4
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 05:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fprhB-0007lA-6q
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 05:02:28 -0400
Received: from greensocs.com ([193.104.36.180]:57149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fprhA-0007d3-Jg; Wed, 15 Aug 2018 05:02:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 861B7238732;
	Wed, 15 Aug 2018 11:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534323734;
	bh=ebsu3LjVxUd9vCNC6h0q7h1HNZlQwd4mx4ew/b4FL9M=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=ElD1dVJQE2FQChj7mxYnz8SFTs7/QvMLA8KKFrAKLBUdyZTdkKX/YlSpGZ8NdJta1
	nQCQttHSy2ttNn4XEe0mzomFlWmYprE/3p25HH1ga+Ht4Gw9EAvqf0NmRwKrJL5sZ2
	YoNgxKTXkdISK+GSe0X7uLUDGCtBRYp58F8Pb60A=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VgYycNl5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VgYycNl5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMn4B_nmCtiu; Wed, 15 Aug 2018 11:02:13 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8C1E7238711; Wed, 15 Aug 2018 11:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534323733;
	bh=ebsu3LjVxUd9vCNC6h0q7h1HNZlQwd4mx4ew/b4FL9M=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=VgYycNl5gZGutoC/7gki5C0y3PldmpqNiPxJwv/+ET7x2YBIxOunSJEHJU3kRzrZO
	Z6VZ6Wxm9YaKzVtadzf0SOM9g9n67TcCZt/XxqUNmQnHoMgLqylK8k8jHE5dGKZkRi
	ybTpLtURT3VqnRzwV8SqNJ+R4oTR0zV+DI+LvnsA=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4B3642386F5;
	Wed, 15 Aug 2018 11:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534323733;
	bh=ebsu3LjVxUd9vCNC6h0q7h1HNZlQwd4mx4ew/b4FL9M=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=VgYycNl5gZGutoC/7gki5C0y3PldmpqNiPxJwv/+ET7x2YBIxOunSJEHJU3kRzrZO
	Z6VZ6Wxm9YaKzVtadzf0SOM9g9n67TcCZt/XxqUNmQnHoMgLqylK8k8jHE5dGKZkRi
	ybTpLtURT3VqnRzwV8SqNJ+R4oTR0zV+DI+LvnsA=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-2-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b36091d5-fd70-86ed-ccc1-e4787cc9e27e@greensocs.com>
Date: Wed, 15 Aug 2018 11:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LkgqzUjjsYqyMe2r1n6WQ7AdIHgVNbTc3"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 01/10] target/arm: Correct typo in HAMAIR1
 regdef name
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgari@xilinx.com, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BK6jVNTzeSia

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LkgqzUjjsYqyMe2r1n6WQ7AdIHgVNbTc3
Content-Type: multipart/mixed; boundary="0lI44xuC0Bhl1VyHDkrETTbdsTtd2ImRv";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <b36091d5-fd70-86ed-ccc1-e4787cc9e27e@greensocs.com>
Subject: Re: [PATCH 01/10] target/arm: Correct typo in HAMAIR1 regdef name
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-2-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-2-peter.maydell@linaro.org>

--0lI44xuC0Bhl1VyHDkrETTbdsTtd2ImRv
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/14/18 2:42 PM, Peter Maydell wrote:
> We implement the HAMAIR1 register as RAZ/WI; we had a typo in the
> regdef, though, and were incorrectly naming it HMAIR1 (which is
> a different register which we also implement as RAZ/WI).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>


--0lI44xuC0Bhl1VyHDkrETTbdsTtd2ImRv--

--LkgqzUjjsYqyMe2r1n6WQ7AdIHgVNbTc3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltz7BQACgkQd8knW3Qn
Tr69ig//b8y2CK1p3Zu1i/pLFnWiP2mn0fzvOAIJXM1GNzZf4bCsmVXDymZZd1pa
G6hmu0M7yVHScJZkQ0YKWliyNl+eW5TbDvtmLgYiE5sDlLMNokayFnf3uD/vAoIq
T31YtEPInrK3nzRubISqtppe9X5ARTm18cKpvrrGdZ8OhUzFl9Iv8LhXQleg65Oi
LtiXKfHmjR1sXUytcfDiSa/YXWRCNSXSJ9TkmVeY7r3o6iotQBXjHV6NqRBwxcuT
HUtnaoKa5B4wVUGnpmETbPbtrNZ3iBT7rEj7xL3jUsXIjAsvrLPMXmKc/XK7m5pp
5TbIibOLY/AMWFjtm+1nMfXyB7JRbG6l6q577uAxi+joto6cVSStTxmmQUCq+ErE
MA2sKYBQy/1y5cgNPZ3vdpW0/nIL6az4Ld2rOtM3ecBxfBBad7AxHvIOFAPhAE5U
wUi/S6ryUYgZ5Y8MWD6Ol/UNw6YPAQ9849qPES9eGVA5Mvs5gfpNKPpCIaikKQb3
SOzxet7Rkb3xJ8SULnjTJ+W+A1s2HDToICLAe2ZonTrMSSG4KBAHRX6Ey97YA1Km
ALkW/T3uVl5GfZAwiwHLOko9YhT31ykWtxYML58JfH16KIrwfPKQUXi1mY635Fvo
l6pu1PuOxRozldadNn8HNmuHrH6fJu1E0hfXFbEUvXgs321UJHA=
=N916
-----END PGP SIGNATURE-----

--LkgqzUjjsYqyMe2r1n6WQ7AdIHgVNbTc3--
