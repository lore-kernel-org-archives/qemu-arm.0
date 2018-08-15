Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp628842wru;
        Wed, 15 Aug 2018 05:27:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzB/6+nNB5swaG51yiTLKvDz7TzMERG3ghLh1nLzq+Hk/zTUr7rNkZJoE54E9QYUDymSL6x
X-Received: by 2002:a0c:8485:: with SMTP id m5-v6mr22505744qva.222.1534336051341;
        Wed, 15 Aug 2018 05:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534336051; cv=none;
        d=google.com; s=arc-20160816;
        b=VEuhtio9Cq7LnjqvCqURdDLR1oJnarqA1srkOwqEazSGqA1/ocm6t08v61lnmbYnWa
         oowINOc8eb1g6uD8J78KTJFDqa3TUIe4ahkNpeTzY9wTRJ6xR4DY3zvRocyuabxOfrZN
         wxS3q/oK1kn2rTajsvYovrATcp/OLtjZQEHQW002owHaV+J1JaBmYmCt64uTRrVIFNYj
         mJRccKyA9kTEnD0d0WJpAqc3FTUrKpvAB5+dPyFxBaJNQYHjZVYTXbycuxaKmmgLbrHe
         PuTlVjSS/FjBzVszvD8AxlAy9YlXc/qGFxnBmZ8pc4qnhYPLMv6tcmXS+N15iYPkZEqn
         sFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Jv+U554Hyfnh67v4llg6zVZK6UDTqD4paaFEwEkta2k=;
        b=L7m9ryCLBAJD2im1OPeh7V5nuPG7X1nvQn+XRgPAobhbKqk3/7dKUqDBQrahCyUsf4
         czLsuTpyxPVz3100Irv9c2zWJAbhiy6ya+LzuMpEpwaktCoNs3g8mNOXyZeXm83x5JZZ
         baTMd1EM5oT62clFHpCuC+mRqag27zAYAAaJDv9gNMECBNpUQ0HiSStKSEFlB8ityhVe
         wOyESq0Ro5RT09DDqSvOb5su80JusQ4CSKHcYMAi2uY5powbQ+ZGLPNGitnoSgKlWr5c
         ZYu4+NLzZaGUoyNLnoCCtOaYacryHUdE/0J1YnngZKlYNuWejFwvf88vXyncNIVOL8PC
         75lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vzDo/dIT";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xdkYdz3d;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xdkYdz3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m27-v6si8141225qtm.216.2018.08.15.05.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 05:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vzDo/dIT";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xdkYdz3d;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=xdkYdz3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpute-0000HN-Re
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 08:27:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fputU-0000HA-Kp
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 08:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fputE-0003Xs-GZ
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 08:27:14 -0400
Received: from greensocs.com ([193.104.36.180]:52835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fputD-0003UO-S3; Wed, 15 Aug 2018 08:27:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7B5502386F5;
	Wed, 15 Aug 2018 14:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534336017;
	bh=Vg9ReQrB7uyXbdzLnZelYU+YuXdOhyVBMcyHT7utVYs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=vzDo/dITEBIpCrqlzGaunk9V0R9xTShUqAVTaam0MiDG5yMMNebUfxWrz5nxa1TlN
	e15V1v8pM3JeJLuz5q/uG/r47Ih8Gs1U8Vb6oR/xxWGNbmHjNqF8iiQ2b8rVTRHgHt
	zVfi4AHeDhZtP05jVR/5+kVE9S4MiM1a3N3iIIN0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xdkYdz3d;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=xdkYdz3d
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkhhejakGSDB; Wed, 15 Aug 2018 14:26:56 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 83AD1238711; Wed, 15 Aug 2018 14:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534336016;
	bh=Vg9ReQrB7uyXbdzLnZelYU+YuXdOhyVBMcyHT7utVYs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xdkYdz3dXsmji2sNjptL9hraz6o1lZlYaVJCK+kszDDcH0Gy0uCNTXLVTlaj7Zsz7
	qHc+5Va9/VmR/sJKIzF41MpfjhIaoWm0N//Izue/ZX/Pk25KUrsyGL5e7LCLFk6faz
	rrXvOQ9Q5P+6LuuPOKpS1deVc7AzyG7HoItxhckQ=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3B5BC2386F5;
	Wed, 15 Aug 2018 14:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534336016;
	bh=Vg9ReQrB7uyXbdzLnZelYU+YuXdOhyVBMcyHT7utVYs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=xdkYdz3dXsmji2sNjptL9hraz6o1lZlYaVJCK+kszDDcH0Gy0uCNTXLVTlaj7Zsz7
	qHc+5Va9/VmR/sJKIzF41MpfjhIaoWm0N//Izue/ZX/Pk25KUrsyGL5e7LCLFk6faz
	rrXvOQ9Q5P+6LuuPOKpS1deVc7AzyG7HoItxhckQ=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-5-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <714f9631-163f-8a8a-f6bc-171ed0e2c6ed@greensocs.com>
Date: Wed, 15 Aug 2018 14:26:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-5-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lRC9tqZOOPNk1nQJ9uk2wINBknlQmrn8N"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 04/10] target/arm: Implement AArch32 HVBAR
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
X-TUID: eadoqMKeHwSk

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lRC9tqZOOPNk1nQJ9uk2wINBknlQmrn8N
Content-Type: multipart/mixed; boundary="kq3I3b3V9tr7W5sxRl0OIMKIkLUpsc35m";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <714f9631-163f-8a8a-f6bc-171ed0e2c6ed@greensocs.com>
Subject: Re: [PATCH 04/10] target/arm: Implement AArch32 HVBAR
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-5-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-5-peter.maydell@linaro.org>

--kq3I3b3V9tr7W5sxRl0OIMKIkLUpsc35m
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/14/18 2:42 PM, Peter Maydell wrote:
> Implement the AArch32 HVBAR register; we can do this just by
> making the existing VBAR_EL2 regdefs be STATE_BOTH.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 14fd78f587a..b6412fe9d1f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3750,7 +3750,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
> =20
>  /* Used to describe the behaviour of EL2 regs when EL2 does not exist.=
  */
>  static const ARMCPRegInfo el3_no_el2_cp_reginfo[] =3D {
> -    { .name =3D "VBAR_EL2", .state =3D ARM_CP_STATE_AA64,
> +    { .name =3D "VBAR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 12, .crm =3D 0, .opc2 =3D 0,
>        .access =3D PL2_RW,
>        .readfn =3D arm_cp_read_zero, .writefn =3D arm_cp_write_ignore }=
,
> @@ -3899,7 +3899,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 4, .crm =3D 0, .opc2 =3D 0,
>        .access =3D PL2_RW,
>        .fieldoffset =3D offsetof(CPUARMState, banked_spsr[BANK_HYP]) },=

> -    { .name =3D "VBAR_EL2", .state =3D ARM_CP_STATE_AA64,
> +    { .name =3D "VBAR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 12, .crm =3D 0, .opc2 =3D 0,
>        .access =3D PL2_RW, .writefn =3D vbar_write,
>        .fieldoffset =3D offsetof(CPUARMState, cp15.vbar_el[2]),
>=20


--kq3I3b3V9tr7W5sxRl0OIMKIkLUpsc35m--

--lRC9tqZOOPNk1nQJ9uk2wINBknlQmrn8N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt0HA8ACgkQd8knW3Qn
Tr5tGRAAhvi2IS6EwzLtlafPxQsXkp+/qWqwZwgOYMIHdKVJ48QdfmCalW7vMhr1
MWzaucEhTUHOeUOz08dem20FcVJYchUTl+uN4N9weojRPg+ZX+GPN/SIsITJURGB
CsWAYXv4vccP/2KfJb3tbsrE+Qv2ij625pUXFrCxDFqO32JTaXXSl17ac/soy9SN
EBD4JiLVnsJAPIklNIPcoMx//Twq8xOCzOyWKoW8GGYTX+zyj0LBMkBfESSXKEZn
23DjruRBbqFHEKNJ8UmqyuOsjp7cCERrpg6M4ateQhtKcHmDlqy5JMW/B0eKyWKG
C92QggE0Pw/qVC1gMHN6UOfZYzm4OipY6tHnfx+H+aYLYybh4E3M4wFgG2Ug8O3S
smkSZAMygKTkaHBfBuxueatWLdotbQJJeLfOg+QRO9x+W8e/4X437nxrQ90taxas
x/uGj5hAnGwlFYJ4gzrYkYRy4XnVllpFyCoPh6P8Zv5Yqh0zQaHObWq62kZoj4E1
doNfShAmR+PefYkzbPvYmHT7jtPh9rBNqcbVXkz6Wp1BakSFsjZYmXqQQepfxibs
MrQYM+Gmhn9ogVuN+wOfItxnzoC+0oXBuRLLPbzrN5CzNo63HdUK1Bn7z5V92QL/
SVLtHSmdB8AyFqaQI7+uO8OYhKROGNfO+jy4NyeLMq+IieB+K/M=
=Q6Ie
-----END PGP SIGNATURE-----

--lRC9tqZOOPNk1nQJ9uk2wINBknlQmrn8N--
