Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp362139wme;
        Thu, 17 May 2018 12:31:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqB0J6ZkYbjdZkHEBWTG+6UM3OFQAnvJc5IOonf4T4gFDSr2p4OotEtXZgepkBAsr/oBqkv
X-Received: by 2002:ac8:7217:: with SMTP id a23-v6mr3961891qtp.243.1526585483132;
        Thu, 17 May 2018 12:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526585483; cv=none;
        d=google.com; s=arc-20160816;
        b=P707UOY6y6UnQm/mQPxxC3Go8LfeddkXfV6y/yy0FcxpppPLMMUuhwLJCPLxCh5OKi
         we+RjOLhmtpEkGHGUD7uDrRK8y0TavQ8i2jnm6LMiNbc1wW5x47xMzeVEVD5Uih2x0jZ
         JbmGothK8eBRlJMI6WOKTEIoxBR3bWZLpXavTrbHiPsN9WZ69JLdvHvSa+Lcama28PQB
         sV2LjKluUH/HlbPjvgzS9rbtY9/MG682flicUWD7LeVfUpyHVWDt8IjhCAI+YGtkt9IT
         ADCqIexVYQ8WLcs56Fy009xiGPBtqUrVTSZbA4TTH6cBYwp8fR/aJK8rWvnQcaa+Mnb8
         8Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=hfSTuE2WDIeFxlxgHOF6y2EQnWlKUtXwaObxUw/lGHY=;
        b=Y+OYxn4K2RW3YvkCOt5md2D0ixKq4wzcqQRGQ7BiBAqZlRffa74VVa5O/wSBkM/STS
         4xcpkYWFCujkrrdxlK0kFYFyUHdZd6L0bsPBjyOI+fm5u+6jY5B88F8FqLGuZYFmVp7t
         ciVAtDdDdBLIuIXMRhimdfGwtCgNqOLzniosXx0G8OjN66CRBEs6upMHymPiWfNc1PFL
         UtZlF863EXTB2qGzwptSnPH41ljgAHYRi5s4WNK2UxZB2w8S7O/JDRpgNbNBywzZdK5b
         4scg31MbD2rKIsQQWoRieW0r8co/+1zSdyJdElNaRxxuRwpsfAdx8is0fnW6uU2Nt26a
         TTZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Vlrl3R63;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BgS6glT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6-v6si4347611qkh.243.2018.05.17.12.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 12:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Vlrl3R63;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BgS6glT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJOcU-0003sD-Ly
	for alex.bennee@linaro.org; Thu, 17 May 2018 15:31:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fJOcM-0003s6-Mi
	for qemu-arm@nongnu.org; Thu, 17 May 2018 15:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fJOcI-00063p-OV
	for qemu-arm@nongnu.org; Thu, 17 May 2018 15:31:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fJOcI-00063T-FK; Thu, 17 May 2018 15:31:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7AFEC60C65; Thu, 17 May 2018 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1526585468;
	bh=iP023a5Fts0I57L17bWNH5WpsvmZTKCzgS296mpdnxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vlrl3R63NfyrWATMO+k7lUSqjZCvWnB4XzmZyYWOP8KspV7nVE/3tRYSiNjhWUSjP
	0h/jZRZR0O/yd/6sGlJ+3QpDujIvfQXYZX+jtUipcxy791zUK5vgLpiFzhW4LNHLvL
	DWKjJ4SS9/L4SEvXrydLbEoiAg6J+e6bMNCWTObA=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A934B60131;
	Thu, 17 May 2018 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1526585467;
	bh=iP023a5Fts0I57L17bWNH5WpsvmZTKCzgS296mpdnxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgS6glT7PmDweu1epOzwjxyJjo+9VXSeqCp2thz2Lv3I2A/s6mNSwxiDhyO6v7XIA
	nDjgkNSnzciOghIax1uPvpK/txLRQrreQ78VBxcAGD0w/GrSd1AdZbs/FCE+u3OWT5
	XDWiz7hMXQct3lqgCtJpmFXYc43CgrChmzU9rh6s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A934B60131
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 17 May 2018 15:31:04 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180517193104.GB4771@codeaurora.org>
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
X-TUID: Q5oYy0Kqy6EY

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
> (b) define an ARM_FEATURE_V7VE for them
> (c) define separate feature bits for them individually

From what I can tell, using ARM_FEATURE_LPAE to represent all the
almost-v7ve misfits won't work well because ARM_FEATURE_ARM_DIV may be
supported on some platforms for which ARM_FEATURE_LPAE is not (Cortex
R5), and ARM_FEATURE_ARM_DIV is read from ID_ISAR0 in
kvm_arm_get_host_cpu_features() (and may be set/not set independently of
ARM_FEATURE_LPAE). It appears there is a need to independently
distinguish between them. The same reasoning also seems to rule out
option (b) "one ARM_FEATURE_V7VE to rule them all", leaving me with
option (c).

It almost seems silly to create ARM_FEATURE_PMOVSSET, but I'm not sure
what else makes sense to do here. Am I missing something (I'm almost
hoping I am)?

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
