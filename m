Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2828210wrd;
        Wed, 22 Aug 2018 01:28:59 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzETBHTI5v0FFf7ZzuH3z87SvVB5vJLxHJCCMHZxymjZJKZgyi9qxT8AkjJz0GQtswUGenq
X-Received: by 2002:a37:9306:: with SMTP id v6-v6mr48922429qkd.36.1534926539116;
        Wed, 22 Aug 2018 01:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926539; cv=none;
        d=google.com; s=arc-20160816;
        b=0oLVteBqnDEiqk341LE9DPDYYN46DEUCbN9NvyuS3P8G6yLYs8ARND1N13a2rUccXo
         bXpXUQFRIF/JwYetUMKGV/6d5ADfpbkDZBvtbwcGeppvGfHX6E1Y7TwuEFCLOGt3clUo
         aCwJuR/oZkHNgSk/XTTMINa61v3StgAKb497v9xSAb3dunosIVrxf0tGx8iLM93U51En
         92+2utSLNa/8ihTvbapMmctpTLWBpsvc7NbsxHx9Bm3/g5eVh4+3nCZ3LfShZ6v56Rly
         vGPOg6kTCbshiENTR3GL8ZOXA8CIxnsjEsRhrdbGj1DxU7tfDHJZkqecCg6Iav6JC58N
         QcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=iRNt/ocFxX03ww9NTxsbkRfpMnzwcjNIkc4hnxCw1Vw=;
        b=BVSJAm3TbUIEvlxVH8xwJUUiW+xlg0JHo8otAGIu+OqU/z5e+errDLLbvBfUTkn+XT
         SruRPmOOXFZ/hi9UdVnJx2K70y/jfAyVRqhw1M626+PHrFL/DSj1JNQM/5NOFhZ2wdMZ
         O+51vzb7MUhhXL89CSBJwM4r7s534u7o5ZgfqZYz3J6k9oRT/uUt7AKwVasJ2sTkEZUO
         JAgIMsqj2RCV6tgrx5orPhIgIHrq4S5nqDGZd/rMbPQvWPqQYxoGmA3MXeddSWwPh3p3
         i9VBMN+E+mnyMblq5i3W8EnrYSap84ZMg7rEPtgGWbvZQSppQA7H7AVyBs/jbUFPGuEr
         tufw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="R/YoSZxL";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SUCAs/7C";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SUCAs/7C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2-v6si1039073qvn.38.2018.08.22.01.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="R/YoSZxL";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SUCAs/7C";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SUCAs/7C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOVd-0008An-El
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTM-0006vE-4t
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:26:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTK-0001wv-He
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:26:35 -0400
Received: from greensocs.com ([193.104.36.180]:40800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOTE-0001u5-TN; Wed, 22 Aug 2018 04:26:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2AC8DDFFF5;
	Wed, 22 Aug 2018 10:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926382;
	bh=F3Tdehj8jC1FOGR2p5sHAOIx+di5dzO+QaoB/lTElqE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=R/YoSZxLvOgOUCiiDEUMtpdrMCqlOPXCat+51qzm1T7swsoY6lO4m3q9ShHuzTnIX
	ui992mc9J5KnmckrZKfAnA52e7OQITcZXFCatuP9XEx2/XaL79CPZCDk041kxb2Zak
	lt0YZ0XaDEgVu72TH2J/RZQnM/nz0mS+g/BFQpbg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SUCAs/7C;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SUCAs/7C
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 673XH-7qpIG8; Wed, 22 Aug 2018 10:26:21 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 422EE238729; Wed, 22 Aug 2018 10:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926381;
	bh=F3Tdehj8jC1FOGR2p5sHAOIx+di5dzO+QaoB/lTElqE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=SUCAs/7Cs6PPx/ngSnvUXZMdgRh/2TDS1Bo9S8fA3lkrCcvGMFCLZ7bnCfEmzXbde
	HODk4ySqhnpcdiHh4LTFZeMgDtD7DTnbsX0NpBvEzzFBBJHuZm8MB9lYpmfJJsTKco
	JEhmtw/JTYZvNT892X5gnLQpJAgZ1CYA4n3lUNFA=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 04D07DFFF5;
	Wed, 22 Aug 2018 10:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926381;
	bh=F3Tdehj8jC1FOGR2p5sHAOIx+di5dzO+QaoB/lTElqE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=SUCAs/7Cs6PPx/ngSnvUXZMdgRh/2TDS1Bo9S8fA3lkrCcvGMFCLZ7bnCfEmzXbde
	HODk4ySqhnpcdiHh4LTFZeMgDtD7DTnbsX0NpBvEzzFBBJHuZm8MB9lYpmfJJsTKco
	JEhmtw/JTYZvNT892X5gnLQpJAgZ1CYA4n3lUNFA=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-4-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e31f0f76-888c-d2ed-9e2a-b00dff2f60b7@greensocs.com>
Date: Wed, 22 Aug 2018 10:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-4-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lhKe1mfNMRmvFe62sUmPpklSqHXlBieuJ"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 3/9] hw/arm/vexpress: Connect VIRQ and VFIQ
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htjQOLMTvWsV

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lhKe1mfNMRmvFe62sUmPpklSqHXlBieuJ
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <e31f0f76-888c-d2ed-9e2a-b00dff2f60b7@greensocs.com>
Subject: Re: [PATCH 3/9] hw/arm/vexpress: Connect VIRQ and VFIQ
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-4-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/21/18 3:28 PM, Peter Maydell wrote:
> Connect the VIRQ and VFIQ lines from the GIC to the CPU;
> these exist always for both CPU and GIC whether the
> virtualization extensions are enabled or not, so we
> can just unconditionally connect them.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/vexpress.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 5bfe2e43487..dc47ed84c20 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -251,6 +251,10 @@ static void init_cpus(const char *cpu_type, const =
char *privdev,
>          sysbus_connect_irq(busdev, n, qdev_get_gpio_in(cpudev, ARM_CPU=
_IRQ));
>          sysbus_connect_irq(busdev, n + smp_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(busdev, n + 2 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(busdev, n + 3 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
>  }
> =20
>=20


--lhKe1mfNMRmvFe62sUmPpklSqHXlBieuJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HiwACgkQd8knW3Qn
Tr708w//bqlKb4V4zARkgA5EYV9FR61RfwEF2N2hCjoWEDyIfZfhyRGUZWZk2NHh
3aAVRuK6Yd2dzq2258AfOuJ0YLuLg1ZObpJF3KfYOCIctgY8IOJIpb601Q0bIJdG
o1zE5xmzWoyYJIssuTIqTfIqPvW2nHXt6mLf0OAaU/KdIehG/vYF+Pxv/Ix46bvl
9M5RxWOEUJ4B9w/PiOzmJm3d2Houq18THS0Lf6KjCtJgqsd9DQti7uR6ZQmaDFsJ
rfYWZIrm0IqunuRddhef4hhtPTeQ8ccGwJuyBXfCrdiY345sznSrEy28C+lFpIxG
ShISijkvpN4HbKv3RrBB1i+7rXEwf4PQ673LATIxZgKsnHoxstQCmnrLHtADojHM
sf1Y2c33p1d/uYl/NXRzD2xpR47ZdVqZRMJo9jIJ3rqfWMsSW2cDmEIeIQrFiZom
M2b7tXjzUqY6TYJhzTjZGtbzFO6xQ7XB6RL8S40IqKi5E4jk0UKpia6Kbp/uEWjj
QaTUKSBVqwrFriPChGTJH1AuUOkKU75DAThnCdFbFINL/p0cM88S7Wq6MdjWRcn6
AIhVGb/tbSuiJ3Zm1TK7uxwfU2T3peX/Fwxq//1xddL8Oc0kTd2AiOf5j7mswApl
PgLmTw8pVYmB9mLdsIXyOkCPoQg2KNld7fcrYKIjUVuPrmo4JEo=
=dLvx
-----END PGP SIGNATURE-----

--lhKe1mfNMRmvFe62sUmPpklSqHXlBieuJ--
