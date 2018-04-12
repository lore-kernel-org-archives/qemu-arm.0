Received: by 10.28.71.155 with SMTP id m27csp2134791wmi;
        Thu, 12 Apr 2018 09:58:18 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/T8u2zWET+ystF3s/GjyC/PCF6ed6U85cuAzKDOATaJpqNiXaIo1u4Ypi2VBB8cXwwAejS
X-Received: by 10.55.239.8 with SMTP id j8mr2242656qkk.6.1523552298031;
        Thu, 12 Apr 2018 09:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523552298; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4RALIuX/p5nZH68OP7VozNafwdw61rMdve6OTOp+dHFBevG2AUYRgyj7tYOyb+5+C
         JG1U6ZtbM5zYvVo6QUmDpBwgyB4uCMqSe7hB3S+xSyncW1MnNQ1is2ZQijjTK4UwcvyS
         8iSOPCTy3dgUZckCUBuuH0lv2Tht/S4nv5g8T1HWsjnQhO+DkmPwmDckAiO8U0O/wsKv
         YNveb608zrkhsiXzyUZe68jhYwL9kZCG1uiFp8SQJPry1VLi0w11NOLtiQidJrmZEDJo
         tT3FP9zlVuW8dHCgZolDeazXPS7Q+yqGbp/91ZcnaHuRScbp6Fpmb5CE76TCsJJf6YQD
         YJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bnSj/0GSVC++WYBB5EUosETGhOHQBmlxFzAFlY24iLU=;
        b=B+VVHfWIjaI/RtGf8Zjx0yUF32et1LWShfcgQappF6HRe5+DdJXMPqEaZCAiq5vc1r
         sOD3GxiHZjnHz3vnbxYwK/+yDZT9u4MuIR3+XNT+DcMneWEd6NcP2eSNeD4dwvUpTqoI
         /e1SBjbj5HwQQmMGoH2VUFyabJGfsaErXdU9TcbiEvPdFFTh0sPHOy3OSjihuLtYZN4B
         rMA17dmnJ0gpB6SPtwsxAJQxbcgkd2gVC06Gv7OB5qvNTg+GC5SuLsIduCUGa2XLQUY5
         nAL1mcj1MdfyKJWZW1+3k5LHaBS5WxUvKg/QBlmg25HmZWGRz/0KkorZ18RPKPVCQk4z
         DkwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AkT+YoPx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AkT+YoPx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si5156599qka.412.2018.04.12.09.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AkT+YoPx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AkT+YoPx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fY9-0001RO-JR
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fWO-0008Pn-9b
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fWK-0002fR-VM
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:56:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6fWK-0002bg-KF; Thu, 12 Apr 2018 12:56:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id CAC4B60C55; Thu, 12 Apr 2018 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552181;
	bh=wkSZMPNGFYh0yL5ZlzuKM/bzAuCKBnMZZzw+BN2jJvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkT+YoPx0AFxxsPlaNwhnqITjErJR5gbgFNroUlFpU5GaqZ08Lut9NJWyLzYEj+up
	ZVQSbMDXDMLzQDRpPHHoOthqn3cVpWHbaMBM4NTZPLVdltidMCz/y51l5/syxSnIDD
	jT+vUulU6/6Y/w8LY3GapAxLgSpYsONYO6TOAIQ0=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C4BD60386;
	Thu, 12 Apr 2018 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552181;
	bh=wkSZMPNGFYh0yL5ZlzuKM/bzAuCKBnMZZzw+BN2jJvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkT+YoPx0AFxxsPlaNwhnqITjErJR5gbgFNroUlFpU5GaqZ08Lut9NJWyLzYEj+up
	ZVQSbMDXDMLzQDRpPHHoOthqn3cVpWHbaMBM4NTZPLVdltidMCz/y51l5/syxSnIDD
	jT+vUulU6/6Y/w8LY3GapAxLgSpYsONYO6TOAIQ0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C4BD60386
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 12 Apr 2018 12:56:18 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180412165618.GG24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-5-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8vjBaExLH_EfbWZ3nwxksL1eY67V4gkWTmu3431Az_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8vjBaExLH_EfbWZ3nwxksL1eY67V4gkWTmu3431Az_Hg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 04/22] target/arm: Treat PMCCNTR as alias
 of PMCCNTR_EL0
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwkQpGmzvctm

On Apr 12 17:10, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > They share the same underlying state
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 5e48982..5634561 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1318,7 +1318,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
> >        .writefn = pmselr_write, .raw_writefn = raw_write, },
> >      { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
> > -      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
> > +      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_ALIAS | ARM_CP_IO,
> >        .readfn = pmccntr_read, .writefn = pmccntr_write32,
> >        .accessfn = pmreg_access_ccntr },
> >      { .name = "PMCCNTR_EL0", .state = ARM_CP_STATE_AA64,
> > --
> 
> Does this fix an observed bug (presumably migration related),
> or is it just something you saw in code inspection ?
> Worth noting in the commit message if the former.

Purely code inspection. I forget now, but I think I found it after
chasing down some other register issue in the vicinity and noticed this
while digging around.

-Aaron

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
