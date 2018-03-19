Received: by 10.28.91.67 with SMTP id p64csp2735592wmb;
        Mon, 19 Mar 2018 08:24:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsQYxw/BNLZpQnCIU2XiLW/nXHktgKaO+f+6gR7cN/x6mawRXohYx0t2E1eiOP43JR3dLpQ
X-Received: by 10.55.33.144 with SMTP id f16mr18563305qki.158.1521473084340;
        Mon, 19 Mar 2018 08:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521473084; cv=none;
        d=google.com; s=arc-20160816;
        b=W/+fSEVDEgJNZtMLeRbMqegnOlqCa8vT6RQ67urG3Y28qVXg0n4fl6lVMSH66AgWwP
         TLIDSHL/ADUMfPWbZb36O91nGfC2YQqRDiGCDQnDdk4BbDw3UeXsQW1M2cOJl0ddgrbQ
         8QEWtNf5JYUYwltIBl+IpSvqsGKbLSFeZx7hkvyPaHGiROlkcrYFv82lN5YFQXR6z6vS
         wA2pMJXdG55C6xw3v8EIswZ8ME529JhJr6rvF4qO1hDSLfdciP7oZQz75xJZVUE+janU
         v6ah63rLWUxUfk9oXTy7hnnLRiasd5EWP095KQSBrs3Qou9ma2QU1mcQ06bNRL+gkUJ0
         b/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=xWnvoNzHSnCQV1IWXS55EKpHgDS8SHuCYjpc4vOH5y4=;
        b=y3JxFbpX2cR2P4UxtqCmU3v6a106xhN53QWp0SLvf5XZt66FLm96qni5xdKMym1T5C
         /IU+S7u8q0ExzM6Uyr67XIyS5MwRGwSh4PbaZOKT6G2gSVERIGtNm3GQeoirzF7WcUXU
         XVYuk/qWFByhumJGbmQ3ca54A8tWrHSSOIQVVUh1Qtp4X4fQPr/XxTCSYxIeQnoOrwTi
         P3bmYAWxQTwFj8KmPPUoMMRie83d/1J3mu3tbYC0fmiC2vrtuc/Jw8NvxAEvDB7z/sP0
         O3M6XT/gDiR0D8G3L45EBPje4nwyfrsSeV2iWWC9LhJR17/Wf2VxW3a9ncZKYBTZ0ym2
         QcKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=HlR8DLbe;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=NHImUd20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q22si273212qtg.158.2018.03.19.08.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 08:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=HlR8DLbe;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=NHImUd20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exweR-0003eh-Rv
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 11:24:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1exweK-0003eU-9k
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1exweH-0002AM-5L
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:24:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1exweG-000288-S4; Mon, 19 Mar 2018 11:24:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id ABECE6016D; Mon, 19 Mar 2018 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521473070;
	bh=Um9vOyAJnMnrJcH1Wc/S+txY8cUqNUYyrGedNIJ0qWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HlR8DLbed2MztVsrPzVDPCUFeOxInxprVN4Y2IX1WyecQseyx/2Kpeis/DdQqOldV
	6mYYpGWRp/vMx2OADcyFZHVJb4zSLQJF9ef7DqZpOTCqMfWTpnp1Z27zDEFLIUdmvz
	GuWDqQB8hEpPkqHU/fY2KEB25jDWEjQ2OkS+qL0c=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D17E26055D;
	Mon, 19 Mar 2018 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521473069;
	bh=Um9vOyAJnMnrJcH1Wc/S+txY8cUqNUYyrGedNIJ0qWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHImUd20uOS3dOkLYnntP7HuAd+ZspOdw0hB9rntBqwn2DMwkK921De3aB0WiSs+V
	wk60RmwcjuQvJ4pN62rBJjq95CQ+6NrGLfTcGR4s+zGahDfDSotkaIGTGMyh0Op99V
	j9u1VYZMB4alTsAA81lv9d2Uz/+JswE2WcGAFm/o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D17E26055D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 19 Mar 2018 11:24:27 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180319152426.GB24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
	<9af89876-bf5d-4696-a430-664fcd5a02fa@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <9af89876-bf5d-4696-a430-664fcd5a02fa@amsat.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 14/22] target/arm: Make
 PMOVSCLR 64 bits wide
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
X-TUID: xZBDdDhDd/tQ

Phil,

On Mar 19 00:14, Philippe Mathieu-Daud=E9 wrote:
> Hi Aaron,
>=20
> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> > This is a bug fix to ensure 64-bit reads of this register don't read
> > adjacent data.
> >=20
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 9c3b5ef..fb2f983 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -367,7 +367,7 @@ typedef struct CPUARMState {
> >          uint32_t c9_data;
> >          uint64_t c9_pmcr; /* performance monitor control register */
> >          uint64_t c9_pmcnten; /* perf monitor counter enables */
> > -        uint32_t c9_pmovsr; /* perf monitor overflow status */
> > +        uint64_t c9_pmovsr; /* perf monitor overflow status */
>=20
> This doesn't look correct, since this reg is 32b.
>=20
> I *think* the correct fix is in ARMCPRegInfo v7_cp_reginfo[]:
>=20
>     { .name =3D "PMOVSR", ...
> -     ..., .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
> +     ..., .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
>       .accessfn =3D pmreg_access,
>       .writefn =3D pmovsr_write,
>       .raw_writefn =3D raw_write },

Nearly all of these PMU registers are 32 bits wide, but most of them are
implemented as 64-bit registers (PMCR, PMCNTEN*, PMSELR, PMINTEN* are a
few examples I see in this patch's context). My understanding is that
AArch64 register accesses are handled as 64 bits, even if the register
itself isn't that wide (though I haven't personally verified this). See
an earlier email from Peter from v2 of this patchset:

https://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg03983.html

Does this still look wrong to you? If so, I'll take a more thorough look
into how these accesses work.

> >          uint32_t c9_pmuserenr; /* perf monitor user enable */

Whatever we decide should likely be done to PMUSERENR too - I think I
overlooked this one before.

> >          uint64_t c9_pmselr; /* perf monitor counter selection regist=
er */
> >          uint64_t c9_pminten; /* perf monitor interrupt enables */
> >=20
>=20
> Regards,
>=20
> Phil.

-Aaron

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
