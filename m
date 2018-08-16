Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1623936wru;
        Thu, 16 Aug 2018 02:16:41 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwlfxR6mITHzCBivEQmERM7MfSAEsbdSDAP6D1tNs1IOmANPD0NtjL9T9mRRNArPXORPaHN
X-Received: by 2002:ae9:e007:: with SMTP id m7-v6mr27152514qkk.268.1534411001068;
        Thu, 16 Aug 2018 02:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534411001; cv=none;
        d=google.com; s=arc-20160816;
        b=wHqyTmKT3PW2/s+HHIhXRSU1tsp66cRJt6iF999mJxxZv5Jj4i+cccS9oMX4GnjnfW
         J2RPbZGi2NH4pEuGbmnNFCblCeyunPlTNl9QMFjoyAr2mqg3sMoBQ6FOThIh95HzC25K
         3IVEctmneU4rDzIQxCGkmIP/USaGvYzRlWa1t2Ec57ILFlDavXAZBwdHOss1V4lNF8+r
         wBiKcoFL7x/d57FkGE58A4uc5KDMlgBlqIQNK1k22Gdp9Q9YLVr3axZLLSXTQS3B7SEy
         evIXFHeQpe2qrCpEQXQs6WgV6VTUo8fPEXRIs2iEV66pUz0M3gUcCSdkOF4D8S4tBpLx
         wnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=TH7jMc9oAhhuheG00ECNabYuDhl+h1DArCSDV3CsM3o=;
        b=HgU5lUDPAlXuu4xjubVgoVO0d49aFfkG3DQpBdnPr/dSUTTQxdUkAHGE5k9ubpqZUh
         KNp71oUWA1TTIuo3J3HV9ngQCpqRcBKInWh8Rf8NBsS7oQ38rhgeKwQ/PxWAl/Hfgccu
         NC4mIsZgT7N3/3irZAxY6yRWn89JviUv6uz5bWk4RBTTNjlwKAmmj66bK2fFGgUBKp2h
         0Hw8lj11l8uL4Oy4AXvQBzJd1osXRZ5DGJRmO9ZJkmNIpNWrXngTcD2TTRfcGomUtzsu
         xQMB3Xxv67DSFz30VH0ms26DMppjNUM+1OA0eM5flYAmirNOZdj3rzGPjX2rxdiRCkSp
         1h6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xDFAnAco;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="wy+CHZ/O";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="wy+CHZ/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41-v6si8550115qth.214.2018.08.16.02.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 02:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xDFAnAco;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="wy+CHZ/O";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="wy+CHZ/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqEOW-0006pI-J3
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 05:16:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqEOP-0006p2-2O
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 05:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqEOJ-00011t-JB
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 05:16:33 -0400
Received: from greensocs.com ([193.104.36.180]:51661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fqEOI-00010S-FR; Thu, 16 Aug 2018 05:16:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CBA41238723;
	Thu, 16 Aug 2018 11:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410975;
	bh=B82nrph7J30UnJIh3pt2j/dwZ1r9pr36wRyvvLBbdKE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xDFAnAcoLmFjnjSjD/SO9BLE5LXUaqTO3+Pay0Sbs+n0bhbh81sJp8kH023lZ3dt3
	R+qTRnZyTjUArpUyC2Bz0QXQWWpk4UK23dOZT3FzpgJPXYW2C5wiuwKjEXErcTsJ1V
	FyzemD64EM+vtHRwvZxAs7bEKT89eWOXmKifnfPc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wy+CHZ/O;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wy+CHZ/O
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_CMu-MwlT50; Thu, 16 Aug 2018 11:16:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 70ADD23871B; Thu, 16 Aug 2018 11:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410974;
	bh=B82nrph7J30UnJIh3pt2j/dwZ1r9pr36wRyvvLBbdKE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wy+CHZ/OnWcwhr+Ad1jV/FfcfjsQQhObKW7ZaOue6G7CU6LMK7gKUhIBWX7GUXHoU
	VhdfT1ZLmWB4xFosRcTe74tMuEKcyTELVSNObZ88fFDjittDD0/WSah3UCRt+PE6Ep
	Bn2vnZ2Yg/aFcwapfW1FXrDt4LRvWBUTMKHo30q0=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EF4892386F1;
	Thu, 16 Aug 2018 11:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410974;
	bh=B82nrph7J30UnJIh3pt2j/dwZ1r9pr36wRyvvLBbdKE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wy+CHZ/OnWcwhr+Ad1jV/FfcfjsQQhObKW7ZaOue6G7CU6LMK7gKUhIBWX7GUXHoU
	VhdfT1ZLmWB4xFosRcTe74tMuEKcyTELVSNObZ88fFDjittDD0/WSah3UCRt+PE6Ep
	Bn2vnZ2Yg/aFcwapfW1FXrDt4LRvWBUTMKHo30q0=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-8-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0b5b7ec5-0955-95ff-8967-503f639c6171@greensocs.com>
Date: Thu, 16 Aug 2018 11:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-8-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AopwHDsiapTafFGpOWDxis63yaKWlpbu8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 07/10] target/arm: Implement ESR_EL2/HSR for
 AArch32 and no-EL2
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
X-TUID: Bok2G/FASsuj

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AopwHDsiapTafFGpOWDxis63yaKWlpbu8
Content-Type: multipart/mixed; boundary="ZITnWXfrYn2F1nZXeSBvwV6UVxLv9YUkR";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <0b5b7ec5-0955-95ff-8967-503f639c6171@greensocs.com>
Subject: Re: [PATCH 07/10] target/arm: Implement ESR_EL2/HSR for AArch32 and
 no-EL2
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-8-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-8-peter.maydell@linaro.org>

--ZITnWXfrYn2F1nZXeSBvwV6UVxLv9YUkR
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> The AArch32 HSR is the equivalent of AArch64 ESR_EL2;
> we can implement it by marking our existing ESR_EL2 regdef
> as STATE_BOTH. It also needs to be "RES0 from EL3 if
> EL2 not implemented", so add the missing stanza to
> el3_no_el2_cp_reginfo.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/arm/helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d6e98e9d606..80855302089 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3763,6 +3763,10 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[=
] =3D {
>        .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 4,
>        .access =3D PL2_RW,
>        .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "ESR_EL2", .state =3D ARM_CP_STATE_BOTH,
> +      .opc0 =3D 3, .opc1 =3D 4, .crn =3D 5, .crm =3D 2, .opc2 =3D 0,
> +      .access =3D PL2_RW,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
>      { .name =3D "CPTR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 2,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },=

> @@ -3926,7 +3930,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 4, .crm =3D 0, .opc2 =3D 1,
>        .access =3D PL2_RW,
>        .fieldoffset =3D offsetof(CPUARMState, elr_el[2]) },
> -    { .name =3D "ESR_EL2", .state =3D ARM_CP_STATE_AA64,
> +    { .name =3D "ESR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 5, .crm =3D 2, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
esr_el[2]) },
>      { .name =3D "FAR_EL2", .state =3D ARM_CP_STATE_BOTH,
>=20


--ZITnWXfrYn2F1nZXeSBvwV6UVxLv9YUkR--

--AopwHDsiapTafFGpOWDxis63yaKWlpbu8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt1QN0ACgkQd8knW3Qn
Tr4dtA//auATy1uk9vkFotcKoKXE7FJ8sLKPvghVxGxYearGIa435seo4hhEU911
or/G9g5jiJyqiF1+ThdVyZ1vMDfyRJVl3NAYgoUkQaX4jMZkkxcSpSGQlnZGuKkk
Ks+yjbER401hDL18Hr3gKTdpjtaNGFY2qKM6sDtFu0qzlf5+uMCdTmyv+6emKaCx
WpMMU+EMWCFsWTH6h+40/wNqZAA9LSMK+EBqmfHdVqAmpAvWgc2OW0CVOhmE9/G8
e2ymJPzEHgVcL0Kg5dQhr2PmThBUeCYD57AIQNEax+mcQF2GECo3r75S/Ss9AmYd
0LDUSHOlgfltE/+fEXGnZgJ+iEv7XHsk7aYufqQQZnDpshqf/SSDRbyVmeSgjdUI
+dhJ0NkuVUfEFtXNZ0wUoIPFvefBYMtLl7dsiSvPnfnekBWevvkpqNaVgNgz9/f2
odT8iKJrk5/5yBlQdGloFV4W6aFt5akc0KtyFAdOwy6M1WlAH8NO2yGRKRhExqt7
FpkZulHoBFjRigT0mP6+ErDzVJRAuB3ebYu62oP6GYCMO+OvWqLwQj0/RwActXUa
I2GCKx2tQxf+B9FWK7EbbaG+V8IGDUq4ZuCRmbnxldtrLEZ6qtY/pjWeV4ameGTx
BVBraglvzi1sVAHfPS1jYL/RkRPmP844d1BewlnAvypntJ0duPA=
=QMwA
-----END PGP SIGNATURE-----

--AopwHDsiapTafFGpOWDxis63yaKWlpbu8--
