Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1609616wru;
        Thu, 16 Aug 2018 01:59:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxMZKWNsA661p81280lAUKsKEwxVRwBC2XoVdj+KI96kTJPahru3qLVPUFO20MDoqk7NfvH
X-Received: by 2002:a37:7185:: with SMTP id m127-v6mr26492997qkc.10.1534409996387;
        Thu, 16 Aug 2018 01:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534409996; cv=none;
        d=google.com; s=arc-20160816;
        b=MhIsHbVH/zB0EpfAY6zUI1TkGdErz3RpC4r1NB75B5lzc0C0+hC7VsESYkdefpXkk1
         L5n/P5dzpCtX+ZSbGhkzNugOL+ZODcY4bLqZPVFUvlL3f4d2ykDYILWMDKshBZtbs3cu
         sxTJg6ztJk5lPf23X2p7x3TsEmuIpaVyBYOtGzVqAJYITRdiB4HFCLTyEmrvyDD7HvWt
         wYId9yWVJOnP/4ttrdxHbRcJ1XICFrBJhGlpFJjpdCR4uJPhieIdn8a9dgwDKGsGFdW/
         9uhDSOHJEjIJyYKDADncfE8atOJT0+2mgdGzC4m/M0bjjmh0E2470kz6UI2pes5i1tpy
         rW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ZsBsJ9DbL9IaoX0OXf2v6Xg03onOfJm+dzvCBkQmCGs=;
        b=Usep2t7dXihEC1allqmUrhul81XaWb1R7l2YYDlIimGF549CBljxaa+RHKWljHjMK3
         u7KYF1dWYJIPwGTY5l1wUSpSJPz80zJVxwU7XME5+Ea2bo0pF3GfeJYt5V7RzBkmmGrO
         GRAq7RQD27FaJhkzvhg/K2SN6hxh45RCB9BT3jpiUOh5zUIG+3f7S4IXZwlGv5/VMVup
         V+baX2+f8WRPZc+Qc9a8ugAUD9AUIeevtSzhOhNm1vGzvKUE6FtbZy4copevMQgxVVUZ
         +08FwNtwalSkUBScXTDnRXIJOIXxDgTqCdA636uCV+B/5aNyFMP9s9nIu7Qncxw+vdyi
         SLIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KJ48yLuT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=szdFu1Gp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=szdFu1Gp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v85-v6si20552431qkb.147.2018.08.16.01.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 01:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=KJ48yLuT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=szdFu1Gp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=szdFu1Gp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqE8J-0002l8-QE
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 04:59:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqE4D-0007yI-8Z
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 04:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqE4C-0007jQ-BK
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 04:55:41 -0400
Received: from greensocs.com ([193.104.36.180]:43301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fqE3t-0007UG-Mg; Thu, 16 Aug 2018 04:55:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 19E4B2386F1;
	Thu, 16 Aug 2018 10:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534409712;
	bh=efNa6psQUrBq80nAk+Rm1Rtkbc/TiRFxaqbj/EdR0oY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=KJ48yLuTtzIpfhgndE8wumy1qExURnXb5xfxsYHZr+fSvLIqOL3o3qtrOrnZqUWqK
	pT/4mpQYwZTnRwZo9O0BvnoZ3OmaxLc+EJEcLVcuC3x6vQThFGYedRzHDa7Pz4UR5M
	7ZVdPZmHrD9VmemGZog5X0zs8iG4NKp7NpNM3tfk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=szdFu1Gp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=szdFu1Gp
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4n4SVWQjs_Qm; Thu, 16 Aug 2018 10:55:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id DC978238721; Thu, 16 Aug 2018 10:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534409710;
	bh=efNa6psQUrBq80nAk+Rm1Rtkbc/TiRFxaqbj/EdR0oY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=szdFu1Gpr2O1UOaTn3rz2Zgjl5tKjlyuIELQYMCm/FM+epzhwenBy5Ywe8awXTuAY
	832Oj9/XSas6sFwKBTD0kYcu7FagOrJpjvULApQBbvHzYtFGAlvbhwPEiBeJcgxCCA
	WX2of5cg0s+uVOwp0sxelTmAd0av5qiIO823GKpw=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 69C062386F1;
	Thu, 16 Aug 2018 10:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534409710;
	bh=efNa6psQUrBq80nAk+Rm1Rtkbc/TiRFxaqbj/EdR0oY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=szdFu1Gpr2O1UOaTn3rz2Zgjl5tKjlyuIELQYMCm/FM+epzhwenBy5Ywe8awXTuAY
	832Oj9/XSas6sFwKBTD0kYcu7FagOrJpjvULApQBbvHzYtFGAlvbhwPEiBeJcgxCCA
	WX2of5cg0s+uVOwp0sxelTmAd0av5qiIO823GKpw=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-6-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <669fdbe5-4cac-7866-e227-300e55eb1285@greensocs.com>
Date: Thu, 16 Aug 2018 10:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-6-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ofn3oOVlJJfBe9va1QXLv0blqDuwJ9CuO"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 05/10] target/arm: Implement AArch32 HCR
 and HCR2
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
X-TUID: CkLzAg+NYW9M

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ofn3oOVlJJfBe9va1QXLv0blqDuwJ9CuO
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <669fdbe5-4cac-7866-e227-300e55eb1285@greensocs.com>
Subject: Re: [PATCH 05/10] target/arm: Implement AArch32 HCR and HCR2
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-6-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> The AArch32 HCR and HCR2 registers alias HCR_EL2
> bits [31:0] and [63:32]; implement them.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b6412fe9d1f..9701e413859 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3754,11 +3754,15 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo=
[] =3D {
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 12, .crm =3D 0, .opc2 =3D 0,
>        .access =3D PL2_RW,
>        .readfn =3D arm_cp_read_zero, .writefn =3D arm_cp_write_ignore }=
,
> -    { .name =3D "HCR_EL2", .state =3D ARM_CP_STATE_AA64,
> +    { .name =3D "HCR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .type =3D ARM_CP_NO_RAW,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL2_RW,
> -      .readfn =3D arm_cp_read_zero, .writefn =3D arm_cp_write_ignore }=
,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "HCR2", .state =3D ARM_CP_STATE_AA32,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 4,
> +      .access =3D PL2_RW,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
As for HACTLR2, shouldn't we avoid defining HCR2 for ARMv7?

>      { .name =3D "CPTR_EL2", .state =3D ARM_CP_STATE_BOTH,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 2,
>        .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },=

> @@ -3872,10 +3876,26 @@ static void hcr_write(CPUARMState *env, const A=
RMCPRegInfo *ri, uint64_t value)
>       * HCR_PTW forbids certain page-table setups
>       * HCR_DC Disables stage1 and enables stage2 translation
>       */
> -    if ((raw_read(env, ri) ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
> +    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
>          tlb_flush(CPU(cpu));
>      }
> -    raw_write(env, ri, value);
> +    env->cp15.hcr_el2 =3D value;
> +}
> +
> +static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
> +    value =3D deposit64(env->cp15.hcr_el2, 32, 32, value);
> +    hcr_write(env, NULL, value);
> +}
> +
> +static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    /* Handle HCR write, i.e. write to low half of HCR_EL2 */
> +    value =3D deposit64(env->cp15.hcr_el2, 0, 32, value);
> +    hcr_write(env, NULL, value);
>  }
> =20
>  static const ARMCPRegInfo el2_cp_reginfo[] =3D {
> @@ -3883,6 +3903,17 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {=

>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
hcr_el2),
>        .writefn =3D hcr_write },
> +    { .name =3D "HCR", .state =3D ARM_CP_STATE_AA32,
> +      .type =3D ARM_CP_ALIAS,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
> +      .access =3D PL2_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
hcr_el2),
> +      .writefn =3D hcr_writelow },
> +    { .name =3D "HCR2", .state =3D ARM_CP_STATE_AA32,
> +      .type =3D ARM_CP_ALIAS,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D 4,
> +      .access =3D PL2_RW,
> +      .fieldoffset =3D offsetofhigh32(CPUARMState, cp15.hcr_el2),
> +      .writefn =3D hcr_writehigh },
Also here. This one could actually be problematic as it allows ARMv7 to
write the upper 32-bits of HCR, since HCR_MASK in hcr_write() is greater
than UINT32_MAX.

--=20
Luc

>      { .name =3D "ELR_EL2", .state =3D ARM_CP_STATE_AA64,
>        .type =3D ARM_CP_ALIAS,
>        .opc0 =3D 3, .opc1 =3D 4, .crn =3D 4, .crm =3D 0, .opc2 =3D 1,
>=20


--ofn3oOVlJJfBe9va1QXLv0blqDuwJ9CuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt1O+0ACgkQd8knW3Qn
Tr4tbxAAjfsVqeGjb1ZypWqD5NiKI+IEjAQDHLtwkIfEiFjPfknt5R244z81EJwk
b0IGeajLeKhVS+kL+dN6YcLFdvcusd7HMQ1daDA/W2l+QLQJRSbQ/z9xzFFk5KjN
FctY2HrMMPss9m7RFyKnBghVjPr+DHI2s+bZ9nZjUdmY2pJxGErKo7cdtG0A6naS
PKHJ9bcTYn10JYCBdapJplVRllHi21SbRbw+pn4E75m+ezpNMaGuUGa+b+MhlgQ0
gCWxLDR6EL/Nt/CMBm1DsOC/rWIoL5aYnHPzZiscORxoKoBhdEOQqHNI77di97wz
tWymHYkmyGqm5fxbP1TCb7Usx2Hpz1Ufbg62l/BH8RF29XDcJ10/4TttjkiogJ0s
mpHk2bwnyZoO9FP8L1D+vjHjxO+pCULeI6j1MuVVVlcIPk250b1OdfhHhPZ4y20r
pjCFWpMgmCBxqaz2+E+Q6g3OyhoxztCQF+AxyBlZmF3DTXxgQSvh9MKTPSb3fABv
njAmtnBMdEZBeIayueeX+UCGyMqCxK3Y/gcHnwySzsnYbhFf8juVtbwehhHrjS19
HlSomoUW0OlVgN2Ou6KNO9pMCHm0in/3RZr0s0Uo8iIsVmGEgJMe+FPSL6T/C++G
P/NUpu2+YgVHsUQ6EJU4zJAV6wPynP7SfEtI/wboF7opxnWxguM=
=US+e
-----END PGP SIGNATURE-----

--ofn3oOVlJJfBe9va1QXLv0blqDuwJ9CuO--
