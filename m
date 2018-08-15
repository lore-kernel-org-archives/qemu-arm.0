Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp469032wru;
        Wed, 15 Aug 2018 02:10:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwTN3pMD9jWMv9t+8Euc2u17LREPfGaLzF6XTUNixOYlPpnOY2Jeao9fpjfhVnLsCv53+BG
X-Received: by 2002:aed:22e9:: with SMTP id q38-v6mr25248795qtc.179.1534324258086;
        Wed, 15 Aug 2018 02:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534324258; cv=none;
        d=google.com; s=arc-20160816;
        b=0Nk6EgsGzR2uIm8EhHOEL+y++lshoPZemEPe9NTvVYMKNtRv5fbNOC2FM7TS78ojYC
         dGPvS25P8HZEpkwptRxFwCDjfNo45KO0h3ZAu5/p11B5REVz0oNdc35BBps3NVv2xSOs
         mXrOiUC59NpT55/ZVcpj355bFxVmrBAbwkZCJEQA3aO9bArwfA/VlBDbTvMYB9NY5P/o
         6FVcqvUcF4pq5mDmW8e9MJIcYp9NPjNyB6arZQOm/bCCGyRbntFQoeENw7qO4Sypr7N5
         5VJI/g80ZZ9lUix++xtvI/4XrNbq490eNl6Qc8W+6yOksu7wN55k3ScUJjgKViygFrZU
         uRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=7KWENwAiqNjSsll/BMcuPCoD6L4HibzVg7kC2R1T9U4=;
        b=fz1543vUtRHQoxwfEhYmtuT7n5BRLw+rwc8p3Y/YnNtkj0Ug+mhY+KAYw8mjtmz7a+
         5TIbBhipMMRrGajFI+uhxb9VxyiDlFJOKAXFQ3vPPeXGCtj18nNNqKW5HicH3Kp9mLky
         9hUHHM6Y/iuFoouQReAN2jsO7BWtr4+dknmjtrEhFAIJuWQw/JoT/41CWhLzuqG3DMhD
         zxe98FY/Sp/YFjB6mHRAP20mcbiLugJgHYvv9KOtrN3JMLhFi63O2ePhw7IFlF3L0dFK
         ztRaQp9+mxYQikYW6k6g6u5yGi80GdlfM4Sa36N1cLN/ISASvCnRe7OO006678fsdqON
         8gQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RgFzHpHx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xxVUCciY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xxVUCciY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10-v6si145351qvm.97.2018.08.15.02.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 02:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RgFzHpHx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xxVUCciY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xxVUCciY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fprpR-0003nb-Jf
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 05:10:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fprpK-0003nL-Te
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 05:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fprpH-0002f0-H8
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 05:10:50 -0400
Received: from greensocs.com ([193.104.36.180]:60492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fprpG-0002dA-M0; Wed, 15 Aug 2018 05:10:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DCEE1238732;
	Wed, 15 Aug 2018 11:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534324237;
	bh=1Zw05YOBZdp6/6SDb/1h52s+DcTNmO+TSldnMJEJHRU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=RgFzHpHxG/Ur2CNTnPVbC/p8Cx9Esf60N6AeLXft2ZRPA9gO5RBYzC+DJF9jkauVL
	eclYmv9TEAuUMn4M1WSB6R0xumOY6g3QfDh8ML3SGBt8F6MyuzjW95kA4Pio0sViBm
	U+zTOeZOYj9bMkuBzNkr/9cbnF9QDJFg/WRO5WsQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xxVUCciY;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xxVUCciY
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_GTabFAdBFV; Wed, 15 Aug 2018 11:10:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D9D1B238718; Wed, 15 Aug 2018 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534324236;
	bh=1Zw05YOBZdp6/6SDb/1h52s+DcTNmO+TSldnMJEJHRU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xxVUCciYyV/u2Ql0WH8HUzTQWKiIe+Tl00UWdXTrb/t/k3XiJhwFkUNG+z3gxUABT
	5h9kM8MKPpWTS6OANAMJ45tlUwdblXotGIWnsZEBZUOW4YL2fSMaOLIMLvvZgKvcKm
	p+Y19kvxS0SIORmP2cZT5G3H3Wkfk7CXogJo0byE=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9294D2386F5;
	Wed, 15 Aug 2018 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534324236;
	bh=1Zw05YOBZdp6/6SDb/1h52s+DcTNmO+TSldnMJEJHRU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xxVUCciYyV/u2Ql0WH8HUzTQWKiIe+Tl00UWdXTrb/t/k3XiJhwFkUNG+z3gxUABT
	5h9kM8MKPpWTS6OANAMJ45tlUwdblXotGIWnsZEBZUOW4YL2fSMaOLIMLvvZgKvcKm
	p+Y19kvxS0SIORmP2cZT5G3H3Wkfk7CXogJo0byE=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-3-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <40cb6cd0-0a77-53d9-38fe-1c6786d1dbd5@greensocs.com>
Date: Wed, 15 Aug 2018 11:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-3-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hSkkQ020v1tV7MfegIP28u01v2zCgzXlI"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 02/10] target/arm: Add missing .cp = 15 to
 HMAIR1 and HAMAIR1 regdefs
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
X-TUID: 3L5fPVew1zHR

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hSkkQ020v1tV7MfegIP28u01v2zCgzXlI
Content-Type: multipart/mixed; boundary="iho1VAGdUmPxdI543GGgCirVx1cCw05Ei";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <40cb6cd0-0a77-53d9-38fe-1c6786d1dbd5@greensocs.com>
Subject: Re: [PATCH 02/10] target/arm: Add missing .cp = 15 to HMAIR1 and
 HAMAIR1 regdefs
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-3-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-3-peter.maydell@linaro.org>

--iho1VAGdUmPxdI543GGgCirVx1cCw05Ei
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> ARMCPRegInfo structs will not default to .cp =3D 15 if they
"will default" as suggested by Edgar.
> are ARM_CP_STATE_BOTH, but not if they are ARM_CP_STATE_AA32
> (because a coprocessor number of 0 is valid for AArch32).
> We forgot to explicitly set .cp =3D 15 for the HMAIR1 and
> HAMAIR1 regdefs, which meant they would UNDEF when the guest
> tried to access them under cp15.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
> A quick grep suggests these are the only ones we got wrong.
> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2c5e02c0b1a..466c8ae492e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3767,14 +3767,14 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo=
[] =3D {
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST,
>        .resetvalue =3D 0 },
>      { .name =3D "HMAIR1", .state =3D ARM_CP_STATE_AA32,
> -      .opc1 =3D 4, .crn =3D 10, .crm =3D 2, .opc2 =3D 1,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 10, .crm =3D 2, .opc2 =3D 1,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },=

>      { .name =3D "AMAIR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 10, .crm =3D 3, .opc2 =3D 0,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST,
>        .resetvalue =3D 0 },
>      { .name =3D "HAMAIR1", .state =3D ARM_CP_STATE_AA32,
> -      .opc1 =3D 4, .crn =3D 10, .crm =3D 3, .opc2 =3D 1,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 10, .crm =3D 3, .opc2 =3D 1,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST,
>        .resetvalue =3D 0 },
>      { .name =3D "AFSR0_EL2", .state =3D ARM_CP_STATE_BOTH,
> @@ -3917,7 +3917,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
mair_el[2]),
>        .resetvalue =3D 0 },
>      { .name =3D "HMAIR1", .state =3D ARM_CP_STATE_AA32,
> -      .opc1 =3D 4, .crn =3D 10, .crm =3D 2, .opc2 =3D 1,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 10, .crm =3D 2, .opc2 =3D 1,
>        .access =3D PL2_RW, .type =3D ARM_CP_ALIAS,
>        .fieldoffset =3D offsetofhigh32(CPUARMState, cp15.mair_el[2]) },=

>      { .name =3D "AMAIR_EL2", .state =3D ARM_CP_STATE_BOTH,
> @@ -3926,7 +3926,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>        .resetvalue =3D 0 },
>      /* HAMAIR1 is mapped to AMAIR_EL2[63:32] */
>      { .name =3D "HAMAIR1", .state =3D ARM_CP_STATE_AA32,
> -      .opc1 =3D 4, .crn =3D 10, .crm =3D 3, .opc2 =3D 1,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 10, .crm =3D 3, .opc2 =3D 1,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST,
>        .resetvalue =3D 0 },
>      { .name =3D "AFSR0_EL2", .state =3D ARM_CP_STATE_BOTH,
>=20


--iho1VAGdUmPxdI543GGgCirVx1cCw05Ei--

--hSkkQ020v1tV7MfegIP28u01v2zCgzXlI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltz7gwACgkQd8knW3Qn
Tr69kxAArFluoL30P+J9/ql3MCcnF0PNu44YX8kGil5ho/O1tFKQ+KKy0ewMZ9Ed
8JiwSTUlRvCVuykM45vuq+T2KGENCbYlgUSve1MQlg70+dNiPlCvzGM5be+okwLT
+ScKB86fzkZYxEbJrHu+Qh1QYA4RyfjT42+eIx6d+xhq6I4/qvXJEz+u7hjbBLuB
XN8RGBP8o4+Jgy5wqc6Q5jH1KGrjRvL2/7NBXnknWOhamWr+tcK82VhqfTEetBtN
N3zHpmhL4H7zrE07NwkuOgzC4eDNtSHTDJsx+HVE5ZfBIgc47O+GV7PqCfZEvO/4
IJL9OCTctsAf8ha4iknLRMXPfzQIkmuHwqRUwvebg3FqbVxGJGTyzFeQEZ1XDPHr
/xQCwDEqDYzy53AT3jn4iD83ulFHVoJAmXDZGcXbtgfXn322mdC5Hi0iT7Nt3BAr
oQd94+sMVNom4Kfekona8zYUee952FQ/JOcnDJG2UV5YpvKLkS674nJ8Ce6a9IHb
bhHQV5JHd7AjCus3tmS7AVhlZd/mO9kBFrnjXp4ttiWKVdpx2ACehyLIeyH7kiwA
PsUNs7djpqENHeCAIsGT+qopSEshUZxNBF1zgEIrIVwYaqnAEKRc2zFklS0GbMXw
lFvqk7sU2MzlYg2bCXxt8SHONtl5M40GPo9ij/T5tL2WPgN0E60=
=Mu9L
-----END PGP SIGNATURE-----

--hSkkQ020v1tV7MfegIP28u01v2zCgzXlI--
