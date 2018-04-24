Received: by 10.28.4.212 with SMTP id 203csp22628wme;
        Tue, 24 Apr 2018 13:35:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/vPyCC+LZxTWfGCGdYNAwxrCYxDu/4YFWwMJfhlVR7G2EhiavdMeXO24ZDWF28CyHJ905M
X-Received: by 2002:ac8:8ec:: with SMTP id y41-v6mr30358944qth.26.1524602141494;
        Tue, 24 Apr 2018 13:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524602141; cv=none;
        d=google.com; s=arc-20160816;
        b=ClIEjL+t+XwL/5CMyL2fDYR1fInRdR/xq6bOfyu3CJgYAz6dcRD68FO/3v59BkEa50
         9zKoalNIAgS/XG5W/7Npvkq8pdCNguy3ofMvxVUMWhUMXv/nYF6SDsu2EDjtT1FZEsJ1
         MbpnjWbQbRb3GqMW/v9Er/V/nm/VCo0pHVtg4oIkR5xJR7DHwHdTsxC01PFy3ajYFztl
         ER+iRkfyhi6F02ibzOsTxkfFhAN8UT62SDR8Ds5kKZTFvqVGrUeiLY/FgrGaS/kWkVz8
         Bx7uhymly3pY94yU1lnELDgvf2AyA34sZGs9C9tlaoXBfr5sbvInAXV2soykY5XThoHb
         Pjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=63MddOL6yiQ0sCQNSsDVeWaXurelA4clAdwZcXzV02E=;
        b=BhCLp2KFqkFNXYlBdGcJJT372OTIx4GwEBUr1tx5+1QnXRy5yRDzbXf1Yp8sT2itVk
         FSrK2ro4IrBQJyh6vD3xnPzm83xWISNO1uqpD8tWD4/QHqviO+oCN5rxZr+n0Rj5oaN+
         29s5e9nFEhNUNdADNP8bfGF3Sa7CBbeNtBUbN0B/amTo12o7rb6xHjosG1QRCDob7hMy
         2fhj9l5TE8MXzIOkVkPgLYHi/PWt8I41kPBkeXzacy2c7sidwyIbT5CqljDAJ6RVVjQa
         Kwd7g4/Zxf0lc/yllmn3JeWwXJD9sREV+i4/B6RmJws/XeFULkSqke/c5tDUXzXV0q4L
         2FiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Bu/GQDUh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Yhul38dz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si3501598qtp.80.2018.04.24.13.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Apr 2018 13:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Bu/GQDUh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Yhul38dz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fB4f6-0001G8-W7
	for alex.bennee@linaro.org; Tue, 24 Apr 2018 16:35:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fB4ey-0001Eb-8p
	for qemu-arm@nongnu.org; Tue, 24 Apr 2018 16:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fB4eu-0001xN-AY
	for qemu-arm@nongnu.org; Tue, 24 Apr 2018 16:35:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fB4eu-0001rc-0V; Tue, 24 Apr 2018 16:35:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id AA121607E5; Tue, 24 Apr 2018 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1524602125;
	bh=Y2CrvC+icXWBpK5tf/HBOoPaNNwg4RZOR4TFhb/cre0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bu/GQDUh3BlKKa8acBy1Ct2J4TQTlTV2oKPhCN449JPjxx5Pk8AujzL1C5bHt5Vcr
	JYAUK4txGCk1ib+6NytCZSJC6QTGyKRzcpXePZ/AZyk7tjlw5thWQ/2AoO29zjxoOH
	VB0riFGyLvJwEjU5+6467Y8fPOXOQXNR93+x/GYA=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 964B26070B;
	Tue, 24 Apr 2018 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1524602124;
	bh=Y2CrvC+icXWBpK5tf/HBOoPaNNwg4RZOR4TFhb/cre0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yhul38dzauQQzbRbrdpDIsnLpRUMpQKMn3CHgh7uqKuj37rg6U3iPp18MxeXdyb2Z
	JcDgVt4LU9TCHpGusWhHIzzBeFXyQpC4vhVUnAHTmWlZiVm9RhFDsFh54OR3O1OC9R
	EAcIibzQ0lQTMyD+T5doS5xuBf1p34YBIcGm+228=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 964B26070B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 24 Apr 2018 16:35:18 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180424203517.GA4771@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
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
X-TUID: p+YIHXVecj5h

On Apr 17 16:00, Peter Maydell wrote:
> On 17 April 2018 at 15:23, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > On Apr 12 18:17, Peter Maydell wrote:
> >> What's the difference between this and ARM_FEATURE_EL2 ?
> >
> > I use ARM_FEATURE_V7VE in a later patch to guard against implementing
> > PMOVSSET on v7 machines which don't implement the virtualization
> > extensions
> > (http://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg04917.html).
> > I could use ARM_FEATURE_EL2, but declaring that v7 machines supported
> > EL2 didn't feel right. I don't feel strongly one way or the other - how
> > do you prefer to handle this?
> 
> So, the underlying issue here is that there's a QEMU specific
> fudge going on. Architecturally, if the CPU implements the
> Virtualization Extensions, then:
>  * it has Hyp mode
>  * it must also implement the Security Extensions
>  * on reset it starts in the Secure world
>  * it has LPAE
>  * it has some stuff that is not inherently tied to having EL2,
>    like the SDIV and UDIV instructions, and the presence of
>    PMOVSSET
> 
> In an ideal world, we'd just have a feature flag that turned
> all that on. Unfortunately, a combination of backwards compatibility
> issues, the order in which various features were implemented
> in QEMU, and the fact that KVM can't emulate a guest CPU with
> the Security Extensions means that we want to be able to model
> variants of some CPUs that don't really exist in real hardware:
> Cortex-A15 and -A7 which only implement EL0/EL1 but still have
> all the v7VE features that you can see from those ELs. But we
> didn't really properly lay out guidelines for how the feature
> bits should work in this case, with the result that we have
> a bunch of local hacks (for instance get_S1prot() has a check
> on the LPAE feature bit, since in practice that bit is set in
> exactly the CPUs that have v7VE; and the UDIV/SDIV insns have
> their own feature bits.)
> 
> So we should probably sort out this mess first, either by:
> 
> (a) state that we use ARM_FEATURE_LPAE for all checks for
> features that are architecturally v7VE but which we want to
> exist even on our v7VE-no-Hyp-no-Secure oddballs
Are you implying that this would only involve updating the comments to
match the existing implementation?

> (b) define an ARM_FEATURE_V7VE for them
This seems the most attractive to me, though perhaps that's partially
aspirational - it is closest to what would be happening in an ideal
world where QEMU fully supported V7VE for this hardware.

> (c) define separate feature bits for them individually

I'm hesitant to formulate a patch for this - I'm not confident I
understand the context and interactions of the pieces involved well
enough to contribute productively. That said, I understand your
motivation to fix this the right way and am willing to try with a little
more direction/hand-holding.

For instance, which CPUs are we talking about here - I only see both
ARM_FEATURE_ARM_DIV and ARM_FEATURE_LPAE advertised together (without
full V8) in cortex_a7_initfn and cortex_a15_initfn. I'm assuming that V8
implies the full set of V7VE features we're discussing here so whatever
we come up with as a solution would be automatically set in the
ARM_FEATURE_V8 "Some features automatically imply others:" `if`
statement in  arm_cpu_realizefn.

-Aaron

> In any case we'd retain ARM_FEATURE_EL2 for "and really
> has EL2/Hyp mode", and we'd want to do an audit of current
> uses of various feature bits to see whether they followed
> the new rules.
> 
> (For AArch64 things are a bit less awkward because the
> architecture allows the idea of an implementation that
> has EL2 but not EL3.)



-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
