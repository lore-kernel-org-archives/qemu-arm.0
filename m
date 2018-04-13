Received: by 10.28.4.212 with SMTP id 203csp30415wme;
        Fri, 13 Apr 2018 11:16:04 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48OQCszPLH68ATon7Y0mBi2B+AHzCL9LYJoE/wfin4BYtP6Nw6tzQskqrN2R9YuDDjgvpDx
X-Received: by 10.200.37.85 with SMTP id 21mr4287202qtn.270.1523643364623;
        Fri, 13 Apr 2018 11:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523643364; cv=none;
        d=google.com; s=arc-20160816;
        b=sxowYYnN+h3l3kidMeSnBBqPT+z6aSbpkbrMb8dai2Y7rFMs5UhkhbEQWhW2899Qmc
         1lYnfDm52zVx6Mqp1B/WErNVx+jlzLfpNu7824BoyZpp9s/FAXLsBpMFBAUcgAWOvt+Q
         1MzJunYESssgnw25rsEeFEafH/7F2rJDwWpU2ImMeaTS+GfW8DwuPlLd/0u1OmYm0i+e
         NRSUHnfviCbqQ/71PjsPKMxJP+uvWN/wU+olOql1ivj4VYPIm15UjDhRYi2xFQn5R656
         YDmomFQaok2Laquqgqv4WlzqcIapMrmyr5HqgPYsk6HNTbSARfWqPRZIQE6QAdiRiQ0g
         Lfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YjKK67PXNM+zxkjmKI2PE5b/S7TdvfQfCdZeynRf5eU=;
        b=IGOkEZu86YIbztALZmFEoII4luM8fWV5hyssri7vHpRVkIo5if0vcPWrtoFD+QdOC5
         BKcrJVwXf9AdcC9wj4LRhxJjZT8u3jVvt5/w0O/eDQaJicI3bN2UG90b0u9iydwldiuZ
         lJmYFaAc4gsapsBlJQpEQdx8wEMupWHW44IgkOi5XZvzXnZ1jvWydAy3MM6/A7sPBV3y
         UU6izUR7WZMAcK02Cl4nbXDkW3dNG27QlYdJ30rwc4mA4Snz6F2S1KUwtCikpSyTOw5A
         gpuWNV0kx4bXCUMhKfvSuVTozvNPrZ8ac90WMQyxDe7gCFUAldI43fdai/ZeVzbOpVD6
         nPKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PLZPAPmx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=cd23C2Am;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si7262795qkd.80.2018.04.13.11.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 11:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PLZPAPmx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=cd23C2Am;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f73Ey-00077D-1j
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 14:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f73Eh-00073v-DM
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 14:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f73Ee-0000JP-81
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 14:15:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f73Ed-0000IZ-VP; Fri, 13 Apr 2018 14:15:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0F2856090E; Fri, 13 Apr 2018 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523643342;
	bh=CwpqdSC7YprvVqyw+8P09GOvW7iRXjBywc2eLqKx3+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLZPAPmxYM4AgFrPBl0f7L7Q98/BSnukAA8S/hM6ore6+WGk8rUSz4I6Kttq+CoGy
	kqGhtRxnfCeVc9VbKH2YitfosmgQLU7h9S+ptTg7N2pVB37WfkGT8WOIZ4iRDcuOr9
	/Xc0JdKih/1tCvZgcl+X8RRL2uBivKBcvU8ScUGo=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C04160C67;
	Fri, 13 Apr 2018 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523643339;
	bh=CwpqdSC7YprvVqyw+8P09GOvW7iRXjBywc2eLqKx3+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cd23C2AmA5almhMvxlqqqea1AyUck1wrRPKXZae5m+uESUQXwi2lu/zXDjYKoS0LI
	cwqCQohPPlviryTX8tzL8K0mWLUUBOiahqQ47hxrc7V2kaWLX72xuoxkRO2do1MP6g
	pRHQoDN5+mFIZRtA5n/yvuAJ53rbBEnI/9oEdye4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C04160C67
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 13 Apr 2018 14:15:36 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180413181536.GN24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-12-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8pBXYQjbqOdSt5g1kwHbiax6iuirLOZZ0LBNxH9Ne5WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8pBXYQjbqOdSt5g1kwHbiax6iuirLOZZ0LBNxH9Ne5WA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 11/22] target/arm: Fix bitmask for
 PMCCFILTR writes
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
X-TUID: RbG17R9I1PWy

On Apr 12 17:41, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > It was shifted to the left one bit too few.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 50eaed7..0102357 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1123,7 +1123,7 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                              uint64_t value)
> >  {
> >      uint64_t saved_cycles = pmccntr_op_start(env);
> > -    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
> > +    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
> >      pmccntr_op_finish(env, saved_cycles);
> >  }
> >
> 
> I wonder why we got that one wrong.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Strictly speaking, bit 26 (M) should be visible only in
> the AArch64 view of the register, not the AArch32 one,
> but that's a separate issue.

Right. I addressed this when I added AArch32 access for PMCCFILTR:
	[PATCH v3 13/22] target/arm: Allow AArch32 access for PMCCFILTR
	https://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg04910.html

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
