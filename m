Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp687049wrq;
        Fri, 13 Jul 2018 06:27:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcJRznzoih4SRu+ZCRKSKcccsE9DqDgCWRm9GOaqdI9DwLV3Rg+7C30vvuyaEJUPYchrvol
X-Received: by 2002:a0c:bf09:: with SMTP id m9-v6mr7054381qvi.2.1531488434664;
        Fri, 13 Jul 2018 06:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531488434; cv=none;
        d=google.com; s=arc-20160816;
        b=FLYghPHMytUJCGgfhzLXMhygEwBrCtlbYTPejXCccpZSFe7Vptr+zji713ItUxfxpf
         Y84lkrnFLCSHO7RA6OUdZ2jSQH9gFQbzcw/n7M/BEnHNaSfaNdH3FnqFYkPzL+FPxv0z
         uFB54ICqaGo5hQuFM68hY7VnPAQ1n0Tj7EeZz++UR0vjYJjtcZV0nLZQ4vPU4hndrM0a
         9U6fwT9g9HKYUbLyIumQVh9MMv2IXKm+FOEnPoCQFL3Es6kvTsqF8queIPKo69R8DGW4
         JkPXth2iKxWq+inTUA4uZefVllkmNudIDrTRQsUBas5ae9hTZglwRWkFU9UtOJ8kyezE
         IBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=E680WfhL3F+0sZ2ATRu9j2vf0NXmdmS4t9VkMZ35Sa8=;
        b=eX0xRcJTrXpkMxXPHDFhoLhBa9DVfI+Isjhd/yz3N9/U9gZOVI4JWR06Pv3iBQPjRe
         ywDKFpz2TQBz1bWg6TTWQy3ePzXtATb38tWNRpbq93yL1zscZZl/3Qo+49Nu88IMTviY
         Jxwh4wqoOPRyXCpCzj9mNMxt6wnMMbXfKG5WfIOmvLx6KKQiID47GR8zuy/VDz3xVxxB
         /9ZOjYLJ+BlnASc72RZLXpKofQjEs37e3fqKfycKb4VITNd/LshlDu+4jSo6ZgIRK1tt
         ruYV/QzKci77z7v0DT6abHUYlyGrOYdRAvmjV8TjdYnnG7s7c+GONJeIp2OF75w/8qc8
         PxFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0DTi9hMa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pO9mlejA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pO9mlejA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si3031331qkz.366.2018.07.13.06.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 06:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0DTi9hMa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pO9mlejA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pO9mlejA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdy6M-0000uh-46
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 09:27:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdy3L-00079u-Fq
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 09:24:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdy3K-00026o-N2
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 09:24:07 -0400
Received: from greensocs.com ([193.104.36.180]:49061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fdy3G-00024e-0Y; Fri, 13 Jul 2018 09:24:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3ED7AC7AE0;
	Fri, 13 Jul 2018 15:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488234;
	bh=G6yzuvoSBhqNSRuep20cfBQlCG7dweDsABh6YNMsmBk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=0DTi9hMa6/aPugwa5P5hG/R02qjUS//wIpq1qNrjmz133+QaFUKf3/1temdEN6fhB
	WKFg01grbThlO6VrwuZU9fsAJfISK68XPv9E46VSwaUd6Yp53e/pd05SbYQNfj7u9t
	0JTnA3tKM1IUW715gzdDCuikkqNavQjrlAYtENI0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pO9mlejA;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pO9mlejA
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvORaDQC479T; Fri, 13 Jul 2018 15:23:53 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E9EA5C7AE7; Fri, 13 Jul 2018 15:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488232;
	bh=G6yzuvoSBhqNSRuep20cfBQlCG7dweDsABh6YNMsmBk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=pO9mlejA6UGqC7JMw594zD9/8nLtZMUf7GlEEqu0iSzVk8Yy7oSHOMMo+TEeHarr3
	/Ad1Ba6HiZRncouH1/F1KHOh0tcfH7FRTXuY/fABz0QdgvXwzAmhgkI+4BTmzlxYeQ
	5gkau/u8kw+oZSIM24U5troEPSn5tzWG7kV/sPKc=
Received: from [192.168.1.5] (unknown [105.98.62.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 671C9C7AE0;
	Fri, 13 Jul 2018 15:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488232;
	bh=G6yzuvoSBhqNSRuep20cfBQlCG7dweDsABh6YNMsmBk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=pO9mlejA6UGqC7JMw594zD9/8nLtZMUf7GlEEqu0iSzVk8Yy7oSHOMMo+TEeHarr3
	/Ad1Ba6HiZRncouH1/F1KHOh0tcfH7FRTXuY/fABz0QdgvXwzAmhgkI+4BTmzlxYeQ
	5gkau/u8kw+oZSIM24U5troEPSn5tzWG7kV/sPKc=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180712154152.32183-1-peter.maydell@linaro.org>
	<20180712154152.32183-2-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7450c9f1-2c97-4a49-ab4a-9c9ce6314eaa@greensocs.com>
Date: Fri, 13 Jul 2018 15:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180712154152.32183-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VomOzvduyhTSMxYlQmWc27HaL4TZkVhE3"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH for-3.0 1/2] hw/intc/arm_gic: Check
 interrupt number in gic_deactivate_irq()
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
Cc: Jan Kiszka <jan.kiszka@web.de>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNzy4Iqe36Lw

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VomOzvduyhTSMxYlQmWc27HaL4TZkVhE3
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7450c9f1-2c97-4a49-ab4a-9c9ce6314eaa@greensocs.com>
Subject: Re: [PATCH for-3.0 1/2] hw/intc/arm_gic: Check interrupt number in
 gic_deactivate_irq()
References: <20180712154152.32183-1-peter.maydell@linaro.org>
 <20180712154152.32183-2-peter.maydell@linaro.org>
In-Reply-To: <20180712154152.32183-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/12/2018 05:41 PM, Peter Maydell wrote:
> In gic_deactivate_irq() the interrupt number comes from the guest
> (on a write to the GICC_DIR register), so we need to sanity check
> that it isn't out of range before we use it as an array index.
> Handle this in a similar manner to the check we do in
> gic_complete_irq() for the GICC_EOI register.
>=20
> The array overrun is not disastrous because the calling code
> uses (value & 0x3ff) to extract the interrupt field, so the
> only out-of-range values possible are 1020..1023, which allow
> overrunning only from irq_state[] into the following
> irq_target[] array which the guest can already manipulate.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

--=20
Luc


--VomOzvduyhTSMxYlQmWc27HaL4TZkVhE3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltIp90ACgkQd8knW3Qn
Tr5WIA//R8P6oGehEDk90QywivlL78s33sBKCS6vZ9FZvpWS5idr93LKgsZeiTp8
z9AdgrnVXS1iyw6rCt4GiMvmFY4T8k33tf4Y/lZxdPbHYxOVDZCXO85vZppPfSgi
1gL1CgVddRdsoUdY9BF3sdJEa3IezbS8Bj5YR5DpXqvluLpsNxLbHZRue8THjfkJ
TjmrhAIMV8AHxTa1ECw9uzDRwVjeOHkPJRON4RtqoWJGnwQCCNLmAYaM5TXQy8yx
DsNrIqupf6p5vAF7X4ZC9Q8HZ7cRMAVaGPlk3a51ZVx7/UzoB7mwCJVA5tToFD2H
xr5KIAzYOisu2ysCWngAcAQeKVbgUma9BkDMQ7AexBH0vOj6sXbq9a3an+Y1lTaa
hwJtIv8T11hk6HGPpkEVN7IetOK/VGRgoR5IxfpXB5I0IHCBbsSVa4nc+kz0n4mt
bnPVwJziipyJbVH3d3iRSwPTieq3jB2ORxyxo1UeC1/R2fYNFp3ER5TRMQcHaZcy
rUTrvTTrLUQ/gtec4WHKbCdvOCLrBpD0NZQMRINJ11rV8hQbmbUdbCgvZslfgJM9
0O/G46A0Uf+V/F1UfRAi48jZuoqYmfcj8Dajsak4U2Lu1s31CaeJ1i0Jy/GRGV2R
edMtKytCAmFgF48RI5rRJdxPSZ7DVZX/v+/6ywIer9DSknon3os=
=MN4h
-----END PGP SIGNATURE-----

--VomOzvduyhTSMxYlQmWc27HaL4TZkVhE3--
