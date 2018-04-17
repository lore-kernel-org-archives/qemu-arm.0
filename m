Received: by 10.28.4.212 with SMTP id 203csp3883401wme;
        Tue, 17 Apr 2018 07:23:39 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+W3aJ/yX1x+NWcpjVcqFoWz1IRfbAa8oze72aIsQygmH6lOF4shU2DXN5dd9/JRAADLI75
X-Received: by 2002:a25:7242:: with SMTP id n63-v6mr1432358ybc.20.1523975019118;
        Tue, 17 Apr 2018 07:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523975019; cv=none;
        d=google.com; s=arc-20160816;
        b=IHzhPJbkgjIdCms8B52Qa3jQMh0UXE1KVDuQ3aqNleoJUxuCIt2h7aD49YXluQ4SZn
         V3fqlA+UQuyPlqIxvaMwTKYS2XNjKyzly/mCZMV5JyImISVG8M2IovKCWW6AeH3kro3P
         Bmfum29c6W3nRqLI4mAN++0WGU8BalZMNB7JBHz1lnr90pquUpjhyIg7IdBITtKLBDdt
         pTZgewcS+dKc/n4nNrhwAn8EZIOZjH8cWOHfwxKnZ8OENB/RPAoVlcY5LKwGsBHdMwFv
         ZFEQMWVZZb/LyVs4qjVDxVUdgS3ET8vwHam+gUaSeeOiunTJz3+onISDV+ZGKPMWNNox
         Q4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Q/QuUZ0nj8PjMoYafUHh5S9JsJGKo8GO2i7zjaxSa30=;
        b=sMfwTDzGWf5P39XDwOwPdkzNNDWHc1mDFqL4ck9enc+6YhcZW3k8oQm3lQO0F+ZuQj
         4NaEkMEP9VLxjT1SXLarLWyQ+o1s+B5YWWjHLWmAaASgmBq17LXXuXUizZrCw5rFHg/+
         jgcN1DVzHjG10DsJFIXZIrPfnyFRLrEyXdoBk6jR8HOBWfUrYVMpbs0KJMdCsyeY6z4m
         SNoh98TKhH2LNUkWt3xn/+0Z/yz3pCR3YuDeJQpEkGqF0l8MCtEp8n4/AVJtQA8zouiR
         bgGCq0BH7HqpFFkI0Xlu3memZde1uh6Xvn/omEGoo+W0HWKFlJyqK2itQg37UToPf/4L
         yTjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=R9emNFeJ;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MIzqtuyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p141si4314795qke.286.2018.04.17.07.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 07:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=R9emNFeJ;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MIzqtuyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8RWE-0003lY-KQ
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 10:23:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8RW4-0003k3-54
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 10:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8RW1-0004P8-AM
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 10:23:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8RW1-0004ON-12; Tue, 17 Apr 2018 10:23:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EC5D66072E; Tue, 17 Apr 2018 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523975003;
	bh=qyEaVW77V/nfJFf+TaQKxZ0KZRM52EQIplh3wjLn/00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9emNFeJLwGmjrxdGAl6jBCs4wkbR18/NCLgHoiyKDs2cAIya5FEQQ4r19sTs7MMX
	izF9CV9K2nmXPXhRXtgpY2tDWy0rxMNk+VT+EYZUo0Zbd6LLxXPTQ70gtQleUOIAy2
	5HgPuC59049xhmyFBnlHtZfeg7yraP94MGfoYanQ=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 61B57606AC;
	Tue, 17 Apr 2018 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523975001;
	bh=qyEaVW77V/nfJFf+TaQKxZ0KZRM52EQIplh3wjLn/00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIzqtuyUi445xaSIYaXxzSCfANiTJ/Zf2LYbSBpOAyCMWC/FghlYf/nSMQ7Evb4ON
	0pwD0LV1XJrHpyKk9UmOOM23nnreaw/4BDgwayaO+4cyA414DiQGQ+6dnGTQumMAuN
	LtiqQ0kpQAEY7PR1vUBV5gJehknN1qO8rF7qABSQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61B57606AC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Apr 2018 10:23:18 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180417142318.GO24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
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
X-TUID: dBOyEGBriP6g

On Apr 12 18:17, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c | 3 +++
> >  target/arm/cpu.h | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index b0d032c..e544f1d 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -765,6 +765,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >      /* Some features automatically imply others: */
> >      if (arm_feature(env, ARM_FEATURE_V8)) {
> >          set_feature(env, ARM_FEATURE_V7);
> > +        set_feature(env, ARM_FEATURE_V7VE);
> >          set_feature(env, ARM_FEATURE_ARM_DIV);
> >          set_feature(env, ARM_FEATURE_LPAE);
> >      }
> > @@ -1481,6 +1482,7 @@ static void cortex_a7_initfn(Object *obj)
> >
> >      cpu->dtb_compatible = "arm,cortex-a7";
> >      set_feature(&cpu->env, ARM_FEATURE_V7);
> > +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
> >      set_feature(&cpu->env, ARM_FEATURE_VFP4);
> >      set_feature(&cpu->env, ARM_FEATURE_NEON);
> >      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> > @@ -1526,6 +1528,7 @@ static void cortex_a15_initfn(Object *obj)
> >
> >      cpu->dtb_compatible = "arm,cortex-a15";
> >      set_feature(&cpu->env, ARM_FEATURE_V7);
> > +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
> >      set_feature(&cpu->env, ARM_FEATURE_VFP4);
> >      set_feature(&cpu->env, ARM_FEATURE_NEON);
> >      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index fb2f983..cc1e2fb 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1439,6 +1439,7 @@ enum arm_features {
> >      ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
> >      ARM_FEATURE_THUMB2EE,
> >      ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
> > +    ARM_FEATURE_V7VE,    /* v7 with Virtualization Extensions */
> >      ARM_FEATURE_V4T,
> >      ARM_FEATURE_V5,
> >      ARM_FEATURE_STRONGARM,
> 
> What's the difference between this and ARM_FEATURE_EL2 ?

I use ARM_FEATURE_V7VE in a later patch to guard against implementing
PMOVSSET on v7 machines which don't implement the virtualization
extensions
(http://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg04917.html).
I could use ARM_FEATURE_EL2, but declaring that v7 machines supported
EL2 didn't feel right. I don't feel strongly one way or the other - how
do you prefer to handle this?

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
