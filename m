Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4785004wrq;
        Tue, 26 Jun 2018 02:20:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfQIwNR3W0xFxz7NX/NCBI3rBt0xq4SOouNVarrwSOF0hsM4w1mGRS8LwzQ44f/rvt7vw4f
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr535865qke.12.1530004822316;
        Tue, 26 Jun 2018 02:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530004822; cv=none;
        d=google.com; s=arc-20160816;
        b=hUe/0loAyFFo6M6BxINbpS94eQp6ip+eGhwBt1nntkJzmsD20acsiIAQEcfOTYgTN7
         e3ruCCql0WYlcZtJ0qi7NZ+67samGwAJWUnw9XR0TAOcCva4cHDEEwwCD0/Vrtib0lvm
         dK8dGCmARedGaaXBvHwZ0kWsj161TbI2SxlsdpayIpzOG7qNMq8SV1FgGWZsN7zuckqg
         4Z0k4LIlohrHeqnnrKg+D8VzT5lKtglkEAxTS8s3gly9SNnlsub2Yak9ci46gc1bhEFb
         5yXFwuscBPst2KjfzPR/BpH8weh99LXw9GaeAoHoXJXSV+ZRxFH0hpBUUVg6jlRui0Aq
         H2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=myzOx0NOol2n1Ri5YpCPtx0f0uU6dNqmLhvGGiqjSXY=;
        b=vXIH8E0bEnVsXuxvMMjf3kECXAyekGjfGW5a4zUM4LKhOsGCsMVgHn+59OfWKUvQh0
         f2Fnwuln4gIWB+PwOZkiFmzkaN/OypGYbLYaJWv1OXLcKkOqCgICzlLLqK363PJuhrid
         vv40TAERobS616PO+qg6YlyUdyb9WLM32z/sE2lbehM1RdjDhpLt7L2TmARXH/5z0rS7
         NqqDSX5mifVDs6X3GDYdujY00FdEg+5jYy2u4lrg5+3uJpWW4sIH8Yh68AUSDQNJlGSy
         GeIZInw4bD29cJ69g/NCSSpVpf10D5E4iq69Vm88zcrApPDGMwbjB6AOXSI5chXYH0Hx
         P3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=dXXTLTRB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=LLXMPD2m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=LLXMPD2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z35-v6si1195477qtb.115.2018.06.26.02.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 02:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=dXXTLTRB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=LLXMPD2m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=LLXMPD2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXk97-0003MW-Ry
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 05:20:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fXk8z-0003Lx-0E
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 05:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fXk8v-0000iG-SS
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 05:20:12 -0400
Received: from greensocs.com ([193.104.36.180]:52188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fXk8v-0000gd-I6; Tue, 26 Jun 2018 05:20:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C295644A0E0;
	Tue, 26 Jun 2018 11:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530004808;
	bh=myzOx0NOol2n1Ri5YpCPtx0f0uU6dNqmLhvGGiqjSXY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=dXXTLTRB9sdbacuJMnjpu8TPXd9Yg3PJ/ql8hK7syuzJ1hvNTHacRNW2jn90U7QyM
	fl0p1NtKnv3ktT9XYTGkiViwVtXRFDKG37BASbiIo/jOxPaUkrjieSE1LJFrortauB
	C7FEzeK8t18yychZSeiGP5jouUs/elGz7OiIawt8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LLXMPD2m;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LLXMPD2m
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBfZyfSsE55o; Tue, 26 Jun 2018 11:20:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CE0C444A0E4; Tue, 26 Jun 2018 11:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530004807;
	bh=myzOx0NOol2n1Ri5YpCPtx0f0uU6dNqmLhvGGiqjSXY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=LLXMPD2mgddhcaUxQZs5JDeafyFLyh9w+nqXMGs6Mk9OFqyDiirvZiFicEsQfCbpc
	3VN4gf3X7QBVuwXdh+0mu+HSyIP3cRRVRz+CUgVWBFR0UPsV3oDZswhkjjoQLnhy6Z
	9D7ZHLjSo4UuN2cLFNAOlhdlqOi76wzAu5HYP8u8=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 72AC944A0E0;
	Tue, 26 Jun 2018 11:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530004807;
	bh=myzOx0NOol2n1Ri5YpCPtx0f0uU6dNqmLhvGGiqjSXY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=LLXMPD2mgddhcaUxQZs5JDeafyFLyh9w+nqXMGs6Mk9OFqyDiirvZiFicEsQfCbpc
	3VN4gf3X7QBVuwXdh+0mu+HSyIP3cRRVRz+CUgVWBFR0UPsV3oDZswhkjjoQLnhy6Z
	9D7ZHLjSo4UuN2cLFNAOlhdlqOi76wzAu5HYP8u8=
To: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<d3c05355-4eda-f501-8f04-d808f416393a@web.de>
	<CAFEAcA80O-6ycsVFEkfTSYCakQQZyGy9VV-+2rx6dE3-Ffd-Ng@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <cfbf6580-61ef-f586-2f9e-5ec9d999de8c@greensocs.com>
Date: Tue, 26 Jun 2018 11:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80O-6ycsVFEkfTSYCakQQZyGy9VV-+2rx6dE3-Ffd-Ng@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AV15jx9VyFl8lB3t2zxgIIhJZkkqk0WWH"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v2 0/7] arm_gic: add virtualization
 extensions support
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P5rR1qkr/trB

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AV15jx9VyFl8lB3t2zxgIIhJZkkqk0WWH
Content-Type: multipart/mixed; boundary="Mvyf51fNFVXYv6tswRbhi94tovNLcb1mW";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>
Message-ID: <cfbf6580-61ef-f586-2f9e-5ec9d999de8c@greensocs.com>
Subject: Re: [PATCH v2 0/7] arm_gic: add virtualization extensions support
References: <20180619093124.24011-1-luc.michel@greensocs.com>
 <d3c05355-4eda-f501-8f04-d808f416393a@web.de>
 <CAFEAcA80O-6ycsVFEkfTSYCakQQZyGy9VV-+2rx6dE3-Ffd-Ng@mail.gmail.com>
In-Reply-To: <CAFEAcA80O-6ycsVFEkfTSYCakQQZyGy9VV-+2rx6dE3-Ffd-Ng@mail.gmail.com>

--Mvyf51fNFVXYv6tswRbhi94tovNLcb1mW
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 06/25/2018 01:12 PM, Peter Maydell wrote:
> On 25 June 2018 at 05:55, Jan Kiszka <jan.kiszka@web.de> wrote:
>> On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
>>> From: Luc MICHEL <luc.michel@greensocs.com>
>>>
>>> This patch series add support for the virtualization extensions in th=
e
>>> ARM GICv2 interrupt controller.
>>>
>>> The first two commits do some refactoring to prepare for the
>>> implementation. Commits 3 and 4 are the actual implementation. The la=
st
>>> commit updates the ZynqMP implementation to support virtualization.
>>
>> Is it enabled for the virt machine as well? Seems we are missing some
>> mapping of GICV and GICH there.
>=20
> I agree that it would be very nice to see this enabled for the
> 'virt' board; it's a bit tricky for me to test otherwise. It
> should just be a matter of mapping in the GICV and GICH,
> wiring up the maintenance interrupt, and advertising it
> correctly in the DTB and ACPI data...
OK, I'll give it a look for the v3 then.
>=20
> I'm hoping to get to reviewing this series this afternoon.
>=20
> thanks
> -- PMM
>=20


--Mvyf51fNFVXYv6tswRbhi94tovNLcb1mW--

--AV15jx9VyFl8lB3t2zxgIIhJZkkqk0WWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlsyBUYACgkQd8knW3Qn
Tr7YpA/+JZrar53rJQo1GnNfr6ZS+EDirClfbBh4Rff8KJLMF5BELu71Va8jCkeN
4eDL93f/CurhQHVHjT8mj1paWpMZDxdl5Vnv/dQB9VvsYBRaohacFbbyGFu53Roy
n7hu0+2qCmobAerCdXIAos8GhFHMS0RUxHXNt9IT2FeeEhR+BGcMw2H/R7sN92tk
SiUrY/4zahUrSKsrei9cC6cHzijgAKIDVhPM9B2fVFKGM79qHA8Y/amgGVHy1/sj
TxBQLPzEls2cvzUJ/ISsRJdW499fbBwJ65bAl6P8ZaTNevLTjuxEEZqkzGXeY2X7
RAOo8/kfTaA6vlXcdDmcpHTUwSSRRNYdmRSysl30A0pC7ygd4QxLAfnIcH0CA0WA
JaSsNe3semWfdBcDpGFC/lCWZ14bV0bSTMh1o5bYTCL/e0EjN+2SabTrn8hJyODQ
b+oPnMAH/7MeG5mGdNW6klGCZjquv9dAtmRr7u/R/i2nxZVvhozsoPivei7r4IYH
bjfklyFlZCXnkpj35Rmhe3m8h3Gt2L5958oneYD3YW1qcUOlStOZ4kFx0SNV8fUV
riy+RRaPpufBk1VdvBqAZpqx1z/DLKPnMJvWv4+fhfeoYY110qpwL34EH/yBSkUS
507RoKD3vNQSZf5fKjeghBACwu5qRHEtNEhVA5jDmO6gSKiQ5Fg=
=X4Ob
-----END PGP SIGNATURE-----

--AV15jx9VyFl8lB3t2zxgIIhJZkkqk0WWH--
