Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp617474wru;
        Wed, 15 Aug 2018 05:15:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxuQmuYk+c2dqwBMeNQ4yPfsbWmemYPpJQxZTEL9X2rZBYfEvwHhpPP8XlFjl9NP64iSKLW
X-Received: by 2002:a37:c0c:: with SMTP id 12-v6mr22752411qkm.59.1534335306052;
        Wed, 15 Aug 2018 05:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534335306; cv=none;
        d=google.com; s=arc-20160816;
        b=O+6vceNVCQ7hB6iYIvhRWpedLN6kAzljx5pqjWbRlV8a9R+/r84FK+1KU96ZdRxmh8
         HbB3UTqbWp/k7jhYUfreleUUJeZh6kZkgIYbr5EHVGXzgqXgQHXrM678agHKgVBYHJI2
         bDvJiLm75bT/IbRl72ShpdW+IiMhKmKrTFMFKF2k60ZNaRIEaNF2B4EwAq7ds2Z8h5Dq
         OLjfgyHyBFmNlLrVgMIDOa/UW3M8uBDjJKVora3dNJrZ2zvTPIlUWGmevZPyd/vONJV/
         41PXV4n8dv2ETJ7kh1Mu/ybYWGkJq1IHjHX/F+tpaAfcF93C3E+QIehBWx7Ak9UyjvNB
         maLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=+qC+fTHQ/QCnEzbMLautJ6YYVD8I6wFlVoivGLaI50Q=;
        b=WsUJ4xLhCwOW75EME5s9nYojkxwezEXfORzW6/higwx2/qVX7m3AkAv2c4UKpN28KX
         WkDaxbVqyUM63rDkIYNNcLGE7QxrIF5ALynPU5GHyHqw5VWRfillulFTLMWJjxWSIZPa
         L+HPLYpo0rbfewo1E4gZPZpM8bIhjyOaxhw/Yasg+9trGmkf9j8Vl3rHzCl8DK/y6h2s
         NJ8ejKwSJPIQ2BWD99j3Z0TDzDdee42Ne8NUbk0C3W7YNC7zeg3r9mbj2fIB6c6mfTX3
         CwQ13h0KKIzk2NbEQfrkaHM9yHqdDiZODr3/NGVaqM+0QYDUeaixvAt42+jaNibh55gc
         9wlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xFhN50hc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kaLgGx6x;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kaLgGx6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26-v6si3340308qtl.339.2018.08.15.05.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 05:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xFhN50hc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kaLgGx6x;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kaLgGx6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpuhd-0005OX-J0
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 08:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fpuhQ-0005MM-Ed
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 08:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fpuhM-0006yp-Ca
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 08:14:52 -0400
Received: from greensocs.com ([193.104.36.180]:48226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fpuhL-0006tq-C3; Wed, 15 Aug 2018 08:14:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 428572386F5;
	Wed, 15 Aug 2018 14:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534335278;
	bh=XaV9SHFDqZUOXCcMNnPD41dKV6syj4mswLftZVyg/h4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xFhN50hc64FliaSGsiMZfa3DXa5pIMOmloMsnLRHPry7t6a7/ohFiTsGqazDAKF0d
	5abhwJDxn37/akKeGHRkIwG6AMRiZZYe4aEI5vqJL2pJFCIx7UhwQEcsc3HyHnBkWK
	6t59+T2/2B3oAKgFLbslNZ6NcP5tkExxgsivi7Co=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kaLgGx6x;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kaLgGx6x
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wrsfv4q4ooir; Wed, 15 Aug 2018 14:14:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 25932238711; Wed, 15 Aug 2018 14:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534335276;
	bh=XaV9SHFDqZUOXCcMNnPD41dKV6syj4mswLftZVyg/h4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=kaLgGx6xhQP5ee5N2YMGkWaBBRCD+7PYPrb9GgFZmcu1widtPVMZnsLXJXj5o6VsF
	afYcpJXndlzU2to26brcu/miOwjY8YuJSe8Y5nM7Gv4chnOb2aYblnwBSAizI3j8Mv
	mJCZ5pLFtS8nlKsx0ka0IVv4lINmfBWqB+9YOu6o=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D4FCD2386F5;
	Wed, 15 Aug 2018 14:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534335276;
	bh=XaV9SHFDqZUOXCcMNnPD41dKV6syj4mswLftZVyg/h4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=kaLgGx6xhQP5ee5N2YMGkWaBBRCD+7PYPrb9GgFZmcu1widtPVMZnsLXJXj5o6VsF
	afYcpJXndlzU2to26brcu/miOwjY8YuJSe8Y5nM7Gv4chnOb2aYblnwBSAizI3j8Mv
	mJCZ5pLFtS8nlKsx0ka0IVv4lINmfBWqB+9YOu6o=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-4-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <34cc09b5-a2bf-a79e-9087-60ec7006686b@greensocs.com>
Date: Wed, 15 Aug 2018 14:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-4-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="JGPG30PmuVuXrvSHAzGJVnf7nFfubDN06"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 03/10] target/arm: Implement RAZ/WI HACTLR2
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
X-TUID: StjNnh3YNtgs

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JGPG30PmuVuXrvSHAzGJVnf7nFfubDN06
Content-Type: multipart/mixed; boundary="Z3eTFHW6U7osw4AR2cuYu60mPUdieX8Mz";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <34cc09b5-a2bf-a79e-9087-60ec7006686b@greensocs.com>
Subject: Re: [PATCH 03/10] target/arm: Implement RAZ/WI HACTLR2
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-4-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-4-peter.maydell@linaro.org>

--Z3eTFHW6U7osw4AR2cuYu60mPUdieX8Mz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> The AArch32 HACTLR2 register maps to bits [63:32] of ACTLR_EL2.
> We implement ACTLR_EL2 as RAZ/WI, so make HACTLR2 also RAZ/WI.
> (We put the regdef next to ACTLR_EL2 as a reminder in case we
> ever make ACTLR_EL2 something other than RAZ/WI).
Putting this regdef in the auxcr_reginfo[] array makes it defined when
the ARM_FEATURE_AUXCR is set (starting from ARM1026 ARMv5 I think).
However I believe this register only exists for ARMv8, for AArch32 mode
to be able to access upper bits of ACTLR_EL2. Should not we check for
ARM_FEATURE_ARMV8 being set so we don't define it for ARMv7?

--=20
Luc

>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 466c8ae492e..14fd78f587a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5436,6 +5436,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 0, .opc2 =
=3D 1,
>                .access =3D PL2_RW, .type =3D ARM_CP_CONST,
>                .resetvalue =3D 0 },
> +            /* HACTLR2 maps to ACTLR_EL2[63:32] */
> +            { .name =3D "HACTLR2", .state =3D ARM_CP_STATE_AA32,
> +              .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 0, .opc2 =3D=
 3,
> +              .access =3D PL2_RW, .type =3D ARM_CP_CONST,
> +              .resetvalue =3D 0 },
>              { .name =3D "ACTLR_EL3", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 6, .crn =3D 1, .crm =3D 0, .opc2 =
=3D 1,
>                .access =3D PL3_RW, .type =3D ARM_CP_CONST,
>=20


--Z3eTFHW6U7osw4AR2cuYu60mPUdieX8Mz--

--JGPG30PmuVuXrvSHAzGJVnf7nFfubDN06
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt0GSsACgkQd8knW3Qn
Tr4VoA/+PjWyoHT8W1Jr35O0kiHRvOveDdO7Pq3gNYG6rL5zpCtIEypHPKl3j9Xt
9IEVDNiuaUl4fuThhhquTRdN1ZVyIEqWkRBsGzLfs3y0DwAoel4yIMYC4TDI0EgC
H8Kvnf37lP7Wxypa4vrTiiFCw9NJ8uyUjCOXotxcd8fo0hE9Pd13tLJs4+hnSDFD
e2TJXQKLVX7yqX85Xf8TpPdQDLTbULL0TPAWSqsgm7yDDCEt3QBRepffgLaYuOLa
kVkGfAJFh5AUwWnDl42kObFNPDAR4qDHCILtREAguFjmFhNC4wZpOsL1BrMZFYHr
xVcy4XNNbi9f2UEwqspF3leieRNVXSWxWEYhy+5kM1828YYKIBtUqCDfU9qHJP2h
X6owyWGRs1nTIRWvzdwpHYrpUW3Wc3jQtkb2LzCTWp9qix+3OjjCZTl9CFJ6mHhS
rCyYVKlHfKW4rP7HOwmJJD5l2HcFyzhMdQUczehR4xtShRLHzHFSodmSAgnxy5Bl
xZzD6bOT0YzrMlUx/TZs1PRnFoGuUKHth36SQd3NHnwtPJ+d3dui4sP+XUYLZFC4
PXqXDWSiXK/Vv/Y5xFrUquLJxyiK+IsKzcXKsVcyPjRePq/Gk+l4QDicpk44sI+w
VRvpVYFwAK9kfziwd07zFsw+JPCg/l61UuANqZ1MLJM6BAshD8A=
=0jw7
-----END PGP SIGNATURE-----

--JGPG30PmuVuXrvSHAzGJVnf7nFfubDN06--
