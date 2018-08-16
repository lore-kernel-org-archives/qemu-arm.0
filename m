Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1612691wru;
        Thu, 16 Aug 2018 02:02:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzytRMIgGDCiFZYk0sflmbIsIWPHvX5eNVpT3KuYYfDS79hwy22MeoCoZkKyeBAOytUp/Nh
X-Received: by 2002:ac8:2dc6:: with SMTP id q6-v6mr29576753qta.178.1534410169797;
        Thu, 16 Aug 2018 02:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534410169; cv=none;
        d=google.com; s=arc-20160816;
        b=kqJS+F8vjn7xK7GFq3QgwMKDvXwJYQOx+cPiZGuynLsG/5GsPUo/uvL00qS7oELsC/
         d9qAzRvpaA23pCrl6TwxEfT2/JsjOWG8WtDwo6tKne0KoGU3TBDQIh+rU4xvaKA5JCEA
         zUdK3wGVa/4QCjm7kjGbXNWb31rkomeKf3s15tk2ZX0QpOvbT5u/M8al1dhNkWpFbaEo
         fO/k29ddG8McFni/IQnGVisWXqFLxOJvkANdEHpFnHSZpPj6ydMgxf2VRKkXUK9BB4X2
         7fbCPu0weXFybHqm7mNCl7tvbDkiYKW5THGCo39frchZCSE57tNvISX2YTO4lM1Tp1Qz
         gkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=DS8Dsc1iY8PMGjIKnlUeVK0QtLFp3wS9QvI7s3vcY7Y=;
        b=QO7aQSwqWlnAKN2Fm4AY1vGyuLBLdDsmF6A0IVJPC+naFYyk/073YphLm7cpC5zDbS
         ba1mygPnhycW+D26/rZhL2sirPi5lnYSGfWgxeaJqgnFH/awhFT9saSxg4efbN4cYPTZ
         6owYukBJkxNSaNmErJvsHdOW6ZwLC0gSWeoHddLidrbfxFFdaHtFWEzAbbKby/obGw97
         BJ3cYxd4UrDnRNIssZccQRPgdGtr1l9I76biRQHLSW3i+lEZbdbR9V1FLNRe1Xyh6Lta
         ZPXnLlusx028SsUVcgBJYLyWRK/TrWOkk5W1m9WQGo54bBHVgcnaV8AwXbw50vJ2/zQv
         fNZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Z7Pytd7b;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oAOtNBdI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oAOtNBdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13-v6si2027635qvk.152.2018.08.16.02.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 02:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Z7Pytd7b;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oAOtNBdI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oAOtNBdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqEB7-0005CT-7E
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 05:02:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqEAP-00056L-43
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 05:02:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqEAM-0002QD-PQ
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 05:02:04 -0400
Received: from greensocs.com ([193.104.36.180]:45936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fqEAJ-0002Nl-CO; Thu, 16 Aug 2018 05:02:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BC3F42386F1;
	Thu, 16 Aug 2018 11:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410109;
	bh=jgGZz0HinZnMkzPlDg2p4LYnm3+Y66fMxlD+6RnQ3k0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Z7Pytd7bazByvM2RkGfM+OCLs2DyOmZV4gRW1swKcE86Okkt8FgLB8BQYLnF3pNWr
	Igc/bgxNQTNwuPGlpGHWWesR00pQt8lmRgHY5GwCdZt/eFMwzkQCxKbwdijVoNXHhd
	u+KFGEZsK+EbWB3vzd9G0K2u7BRfwDXxuQLr5IE4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=oAOtNBdI;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=oAOtNBdI
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYnl9oJDiTaw; Thu, 16 Aug 2018 11:01:48 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B2FE0238721; Thu, 16 Aug 2018 11:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410108;
	bh=jgGZz0HinZnMkzPlDg2p4LYnm3+Y66fMxlD+6RnQ3k0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=oAOtNBdIVkDGfI8HhFjeZVOk/olLk72DrmxhukOcLunctgujRKmYnvYQghaC64Qeb
	kR6cP/+xQ1q0owd4N5Rb0tK7Vk8vl2R6Oj1+Gfg4Z+MkN7CipYljSEcC0QaBUjBpc4
	YBge1ZPucHVY4soz5S4enSBt/mzFi8OkCut1JDYU=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4660A2386F1;
	Thu, 16 Aug 2018 11:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534410108;
	bh=jgGZz0HinZnMkzPlDg2p4LYnm3+Y66fMxlD+6RnQ3k0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=oAOtNBdIVkDGfI8HhFjeZVOk/olLk72DrmxhukOcLunctgujRKmYnvYQghaC64Qeb
	kR6cP/+xQ1q0owd4N5Rb0tK7Vk8vl2R6Oj1+Gfg4Z+MkN7CipYljSEcC0QaBUjBpc4
	YBge1ZPucHVY4soz5S4enSBt/mzFi8OkCut1JDYU=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-7-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9eda9e5e-c01f-cd4d-2680-a74648d0c094@greensocs.com>
Date: Thu, 16 Aug 2018 11:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-7-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eXwLfzYnKyUkURC7RnZ97II4EqaAP9iuQ"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 06/10] target/arm: Implement AArch32 Hyp
 FARs
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
Cc: edgari@xilinx.com, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEwaTzJ6H+gB

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eXwLfzYnKyUkURC7RnZ97II4EqaAP9iuQ
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <9eda9e5e-c01f-cd4d-2680-a74648d0c094@greensocs.com>
Subject: Re: [PATCH 06/10] target/arm: Implement AArch32 Hyp FARs
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-7-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> The AArch32 virtualization extensions support these fault address
> registers:
>  * HDFAR: aliased with AArch64 FAR_EL2[31:0] and AArch32 DFAR(S)
>  * HIFAR: aliased with AArch64 FAR_EL2[63:32] and AArch32 IFAR(S)
>=20
> Implement the accessors for these. This fixes in passing a bug
> where we weren't implementing the "RES0 from EL3 if EL2 not
> implemented" behaviour for AArch64 FAR_EL2.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9701e413859..d6e98e9d606 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3847,6 +3847,13 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[=
] =3D {
>      { .name =3D "HSTR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 3,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },=

> +    { .name =3D "FAR_EL2", .state =3D ARM_CP_STATE_BOTH,
> +      .opc0 =3D 3, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 0,
> +      .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },=

> +    { .name =3D "HIFAR", .state =3D ARM_CP_STATE_AA32,
> +      .type =3D ARM_CP_CONST,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 2,
> +      .access =3D PL2_RW, .resetvalue =3D 0 },
>      REGINFO_SENTINEL
>  };
> =20
> @@ -3922,9 +3929,14 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {=

>      { .name =3D "ESR_EL2", .state =3D ARM_CP_STATE_AA64,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 5, .crm =3D 2, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
esr_el[2]) },
> -    { .name =3D "FAR_EL2", .state =3D ARM_CP_STATE_AA64,
> +    { .name =3D "FAR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
far_el[2]) },
> +    { .name =3D "HIFAR", .state =3D ARM_CP_STATE_AA32,
> +      .type =3D ARM_CP_ALIAS,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 0, .opc2 =3D 2,
> +      .access =3D PL2_RW,
> +      .fieldoffset =3D offsetofhigh32(CPUARMState, cp15.far_el[2]) },
>      { .name =3D "SPSR_EL2", .state =3D ARM_CP_STATE_AA64,
>        .type =3D ARM_CP_ALIAS,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 4, .crm =3D 0, .opc2 =3D 0,
>=20


--eXwLfzYnKyUkURC7RnZ97II4EqaAP9iuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt1PXsACgkQd8knW3Qn
Tr4ZNQ/+INvL1wYD9s4zTP/NSWtD+MEjhaNM+r75wfP9NGZk/2znda8Q/6DP76H/
FPae/XlW6F1VvfW2FCv+sER45wUeG0Cyf0sKOkGDjSWjAFa6gOiR8ryeku4Lu06J
ErPFvxpiV1W2BFvOBq/jMpj0WieVnYMDS+4yI/GTMG2tgHSCFoeb/CBvasVSBOFn
5SeF8E+9x8Ztnp+erP6TVxjGvvx/nzupfhORNLzy8sVSM4QCkhAM9i+sya6hH39w
G/HpqTr53hgACF0Q/y1rB0sYSH75kL9oOZ4hBjzevDNmwr2x80O/NaELbrn1CrwO
h6Px6MoFpPnqfd95BapQwqdz4gBWCunfo0waZfFpyt0j9laFFGcWqWOGCzLOAIlI
PixbI8tSKHJ9gQRJhuexkCz/UAChtumYEZUHH1EbXsIN7Z94qSJhupaxAsjp2WFf
NXRKp7Lo1ZSH98MNE5K/N5Xng1ZQlFo+zolM6p4MF1wkbaJkEc7HcmvZjCflQ8LR
Jh1ZiwQCCwSw8v/AkHYOSrUhkdddLeI9xdfjjbc7qiy07X2ig0NhjDFTK2r4ML+Z
+X15ophDquXXKQSCu59cRd+T8cFLCzNN/Cf3trLKZ/dlSgIzQ5SMWenpaRpEJwcy
QN+WQnzt7ZME/NA12DJWFH80wB9FUsjGwEPElr7Lfvs2SmZvieo=
=4img
-----END PGP SIGNATURE-----

--eXwLfzYnKyUkURC7RnZ97II4EqaAP9iuQ--
