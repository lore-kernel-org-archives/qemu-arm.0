Received: by 10.28.91.67 with SMTP id p64csp5187649wmb;
        Wed, 21 Mar 2018 08:17:24 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs44EmIbKOpdTd3bxBB9qbDBfoSo/jb18N8OPJF1DDR3wQMTQF+MxUFM6eQZhP6qoRThUIc
X-Received: by 10.200.49.99 with SMTP id h32mr30224899qtb.299.1521645444727;
        Wed, 21 Mar 2018 08:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521645444; cv=none;
        d=google.com; s=arc-20160816;
        b=vz+ncgWTiV0X5AnY5Lr48fu2J8xufhcJAJhV21fTSQ0lHPc1fZDQ3/qybTz3JVxyc9
         zJBwfMgv9Aii+pK4LrnZrfCV7pU5jl9HWYMSEBt8lpjuKD3OCYZBJBDwJNmObuwgtoDn
         RUaeuBGqBSGMHiKuqNuFe4TrVLOHd/URB0wHFr65bR4b4O7MOVE/NZb1KwRnPnJYHANj
         +mocD6Y2MDkmpIByWnmuDe8G2pdKmtscmGquOxs67ANSjmaLj1yuy53vwIngO87kgCal
         VmQRleNv+dRbMvhmTRE0eqin798S6AGR32rfFBD2t9WtLjjtDBlL80HGoAQ7rFtF6PXS
         fg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=BoAN0s3i/0t/213CPe3FJkt30iZXlDwRbvx5ZByZyh8=;
        b=Yha0WEhXJ/RLYX5sYMJMChO1WE183rYavbFpVseQ50/fKxKWmn2YKE+359OgLtL7Iu
         YVW/TE3DSWIG18f48rYtnjneWy82/LtzILN5BP1JAcCmisCFLIMEwJIXVaooCG/TIO2V
         /DWhMrSIBd4xeto/AGaBgnwJaDHadmaoL/Y44xjhXAkW/OztQR2+BO/YjkWtaBaRZ2SK
         yg7+4Fhu18EIJJjKF0hNqkArmOCAE+ZtkNC5RFJy13rNCYtBZAss6LcHJmjK+8HPSAcf
         5ARuEmB4V0Hrd+J6f6805CssZcyVnyvcl5w/x1MnOSkwhAcBkHUCZaO9BDxs19ew8lxt
         FWFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=hGYt3PbC;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=QaY+ZNyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a27si814281qtd.218.2018.03.21.08.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=hGYt3PbC;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=QaY+ZNyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfUS-0005s7-6Y
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:17:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eyfUD-0005pW-Sp
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eyfU9-0007Or-TW
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:17:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eyfU9-0007ON-JM; Wed, 21 Mar 2018 11:17:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5B26F60C54; Wed, 21 Mar 2018 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521645424;
	bh=9EIgKmg2Boh4iD93w48tiVD8F3YCEGugXtAMVMDFNbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGYt3PbCkiOrS3KM82je9b3js8UK/2xCfexzeveK+g//z3GemJt6bUEjOQqsO25QA
	GwUflsGrsmK5swXM/tAjZJqy/5KYm4jC1LeH+wqcyk0M3BMqtqz5ioFUC5t7+63Qkk
	mlOySrieE2IecFJxsAz5Q3NXAO0xiSqd4Kn5FdA8=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B4DAC60128;
	Wed, 21 Mar 2018 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521645423;
	bh=9EIgKmg2Boh4iD93w48tiVD8F3YCEGugXtAMVMDFNbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaY+ZNyDd1LQ7ogKZRSiJXi0chVNqKnvuhb91Tu0n7Jxu99dLwV9MDdcQMXiVNpwk
	CtT7pnQGMP2ESawvLaAEk1oNlnQ7y/r/3trmC2ony6ze/Uh/O50Vav2Z91gca6cl6k
	2tQF5oQgUHES9QdP1S+yFYQd5emNfekR+ECpY/ZY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B4DAC60128
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Wed, 21 Mar 2018 11:17:00 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180321151700.GF24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
	<aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
	<20180319203509.GD24561@codeaurora.org>
	<3e12e8ef-e5ee-d690-7d01-c074b6145566@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3e12e8ef-e5ee-d690-7d01-c074b6145566@amsat.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 01/22] target/arm: A53: Initialize
 PMCEID[01]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LDIWEmsoi0EL

On Mar 20 02:03, Philippe Mathieu-Daud=E9 wrote:
> On 03/19/2018 09:35 PM, Aaron Lindsay wrote:
> > On Mar 18 23:35, Philippe Mathieu-Daud=E9 wrote:
> >> Hi Aaron,
> >>
> >> On 03/16/2018 09:30 PM, Aaron Lindsay wrote:
> >>> A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
> >>> pmceid[01] are already being initialized to zero for both A15 and A=
57.
> >>>
> >>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> >>> ---
> >>>  target/arm/cpu64.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> >>> index 991d764..8c4db31 100644
> >>> --- a/target/arm/cpu64.c
> >>> +++ b/target/arm/cpu64.c
> >>> @@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
> >>>      cpu->id_isar5 =3D 0x00011121;
> >>>      cpu->id_aa64pfr0 =3D 0x00002222;
> >>>      cpu->id_aa64dfr0 =3D 0x10305106;
> >>> +    cpu->pmceid0 =3D 0x00000000;
> >>> +    cpu->pmceid1 =3D 0x00000000;
> >>>      cpu->id_aa64isar0 =3D 0x00011120;
> >>>      cpu->id_aa64mmfr0 =3D 0x00001122; /* 40 bit physical addr */
> >>>      cpu->dbgdidr =3D 0x3516d000;
> >>>
> >>
> >> Maybe we can move this at a single place in arm_cpu_post_init():
> >>
> >>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> >>         cpu->pmceid0 =3D 0x00000000;
> >>         cpu->pmceid1 =3D 0x00000000;
> >>     }
> >=20
> > I like consolidating the initialization - though I think it can go in
> > arm_cpu_realizefn() with the preexisting PMU-related id_aa64dfr0
> > initialization since it is constant once you've chosen a type of
> > processor. One of the other patches in this set actually already adds
> > some PMCEID initialization there based on PMCR.N.
>=20
> Indeed, arm_cpu_realizefn() is a good place.

I've consolidated the pmceid[01] initialization into arm_cpu_realizefn()
for v4.

-Aaron

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
