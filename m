Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp6340646wre;
        Thu, 31 May 2018 13:39:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI3A46ldd9pkoOuY1feYUGyLrHygSs2AQwejtxyxosS2QuqDwYaxIObEMFJBI3CyqdL8YUC
X-Received: by 2002:ac8:72d0:: with SMTP id o16-v6mr4437378qtp.7.1527799168572;
        Thu, 31 May 2018 13:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527799168; cv=none;
        d=google.com; s=arc-20160816;
        b=CLO4HCWfH5qM2lZZdnKQzL1zPiLYED8c+YdtJuzYQtUpNYkeNLah84w6VtEzDEUoO3
         HNemXlJAbpL5FP4pesa9M3H7gpU0orzMrL9dnFHKbcHrnSb5BviL0mDFf5WidAofnvb8
         u3o1YXozb9f8Vgdw2X8RvhCLJ2Wp1zN4ISyeih6tjZaMGL1R6B6R3qCORfMP006TEujW
         P68lQ63OE54dJXEXk7tJ9RGeD96Tz5uhryVJSQ7EjPIMfwxz6vPSnht1VsJuHx5ScMkB
         XZN8NqaGsQcxMNtzKNgbOWpTI0i5BVF6IONXLtX6ig66WIG785nUaj4SIRuXt6HDGsnj
         8u6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=AeJsJTqfIFt0IPvANR/UjAdW4AWPyfe9ijbRHp6ljsQ=;
        b=nRCFM6oExA82CrdTIrONEJ8xJzBCrmpBHCDYaPZJvwV86LPzEQgE3eM9ZGT6h1KQzh
         5VGrU9W/t0wFcJcEIks/Fj9e+zUKnFdzNTYX9psjrKbTecXU7d7VsvrLL0zfKq8Gvq2+
         r8+PZr/pnthysYh3uYdSN7ss2kNRYLqcVVKuiG3MDXj76KLOLm8RjiHorvtg6ucCZ6ml
         ZvxrnOioQ38WHDQ6/dmJ5HtorzUo2ObVJQbezzdTHED2NxU7UF+7Ed9gSrmtE5IKIpdd
         zlm5HnPDMN3SBQjgCTCKhGF319gFQeQhlcDtM3E9vBLO13M4WrRrFm7Zg8wFCma9psoS
         c5uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WwVtWVRN;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PWVbchEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b45-v6si9984237qtc.235.2018.05.31.13.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 13:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WwVtWVRN;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PWVbchEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOUM4-0000QN-3F
	for alex.bennee@linaro.org; Thu, 31 May 2018 16:39:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOULx-0000QF-33
	for qemu-arm@nongnu.org; Thu, 31 May 2018 16:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOULt-0007os-2Z
	for qemu-arm@nongnu.org; Thu, 31 May 2018 16:39:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fOULs-0007nl-PN; Thu, 31 May 2018 16:39:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 998B06060A; Thu, 31 May 2018 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527799154;
	bh=+zEENtOsv7Fhzyw+iE21/pOdHIaK0zOKdIYsTcQEV/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwVtWVRNz0Pb37uw5mz1jZ6uAwkshZc+E13St/LFGJSvX8vGJD4QFlBqVlb53TTug
	sp3wnT4HXvDipx0jOnyrNGi+R44X8ocpc8oallKHqhRuymKiw17K1HSKT7KGKSZwQb
	uoabQD54elV8wDtLrGFY/ZksgzfZ4bR1RS2yzOkM=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BBAB602A8;
	Thu, 31 May 2018 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527799153;
	bh=+zEENtOsv7Fhzyw+iE21/pOdHIaK0zOKdIYsTcQEV/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWVbchECqECKDV1E1Lb+/jXCX8s1lO7I0dsgEiXLOYfhwswqOM8iQ1tfOpbVMu8n+
	djCXcnO2GG3CTmHRTiUfoiS7tj1zgzNfr0oILJx6a9uBAp+h71Kav4sBkJknznMHIC
	YXMiPYchzZLUtXQsNk1OppgAVbqC4cZm0k9Y8Efs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BBAB602A8
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 31 May 2018 16:39:06 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180531203906.GA12424@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
	<CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
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
X-TUID: OTobLYqoS1tj

On May 31 15:18, Peter Maydell wrote:
> On 17 May 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > On Apr 17 16:00, Peter Maydell wrote:
> >> So, the underlying issue here is that there's a QEMU specific
> >> fudge going on. Architecturally, if the CPU implements the
> >> Virtualization Extensions, then:
> >>  * it has Hyp mode
> >>  * it must also implement the Security Extensions
> >>  * on reset it starts in the Secure world
> >>  * it has LPAE
> >>  * it has some stuff that is not inherently tied to having EL2,
> >>    like the SDIV and UDIV instructions, and the presence of
> >>    PMOVSSET
> >>
> >> In an ideal world, we'd just have a feature flag that turned
> >> all that on. Unfortunately, a combination of backwards compatibility
> >> issues, the order in which various features were implemented
> >> in QEMU, and the fact that KVM can't emulate a guest CPU with
> >> the Security Extensions means that we want to be able to model
> >> variants of some CPUs that don't really exist in real hardware:
> >> Cortex-A15 and -A7 which only implement EL0/EL1 but still have
> >> all the v7VE features that you can see from those ELs. But we
> >> didn't really properly lay out guidelines for how the feature
> >> bits should work in this case, with the result that we have
> >> a bunch of local hacks (for instance get_S1prot() has a check
> >> on the LPAE feature bit, since in practice that bit is set in
> >> exactly the CPUs that have v7VE; and the UDIV/SDIV insns have
> >> their own feature bits.)
> >>
> >> So we should probably sort out this mess first, either by:
> >>
> >> (a) state that we use ARM_FEATURE_LPAE for all checks for
> >> features that are architecturally v7VE but which we want to
> >> exist even on our v7VE-no-Hyp-no-Secure oddballs
> >> (b) define an ARM_FEATURE_V7VE for them
> >> (c) define separate feature bits for them individually
> >
> > From what I can tell, using ARM_FEATURE_LPAE to represent all the
> > almost-v7ve misfits won't work well because ARM_FEATURE_ARM_DIV may be
> > supported on some platforms for which ARM_FEATURE_LPAE is not (Cortex
> > R5), and ARM_FEATURE_ARM_DIV is read from ID_ISAR0 in
> > kvm_arm_get_host_cpu_features() (and may be set/not set independently of
> > ARM_FEATURE_LPAE). It appears there is a need to independently
> > distinguish between them.
> 
> We need (and already have) a separate feature bit for ARM_DIV
> exactly because it's present on some CPUs which don't have V7VE;
> so we don't want to roll that back into a V7VE feature bit.
> 
> > The same reasoning also seems to rule out
> > option (b) "one ARM_FEATURE_V7VE to rule them all", leaving me with
> > option (c).
> >
> > It almost seems silly to create ARM_FEATURE_PMOVSSET, but I'm not sure
> > what else makes sense to do here. Am I missing something (I'm almost
> > hoping I am)?
> 
> Sorry, I forgot I hadn't replied to this email yet. Let's do this:

No problem at all - to be fair, my responses have been a bit sporadic,
too. I'm working on putting your suggestions into patch form, with one
clarification below. I also believe I owe you a response on another
thread or two before I push out the next version of this patchset.

> 
>  * define a new ARM_FEATURE_V7VE:
> 
>   ARM_FEATURE_V7VE, /* v7 Virtualization Extensions (non-EL2 parts) */
> 
> In arm_cpu_realizefn:
> 
>  * change the existing "FEATURE_V8 implies V7/ARM_DIV/LPAE" to
>    "FEATURE_V8 implies V7VE"
>  * below that put
> 
>    if (arm_feature(env, ARM_FEATURE_V7VE) {
>        /* v7 Virtualization Extensions. In real hardware this implies
>         * EL2 and also the presence of the Security Extensions.
>         * For QEMU, for backwards-compatibility we implement some
>         * CPUs or CPU configs which have no actual EL2 or EL3 but do
>         * include the various other features that V7VE implies.
>         * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
>         * Security Extensions is ARM_FEATURE_EL3.
>         */
>        set_feature(env, ARM_FEATURE_ARM_DIV);

Is it safe to assume from your comment above regarding keeping ARM_DIV
separate from V7VE that the inclusion of it here is an oversight and
that only LPAE and V7 should be set if V7VE is? (and that V8 should
now directly imply both V7VE and ARM_DIV?)

>        set_feature(env, ARM_FEATURE_LPAE);
>        set_feature(env, ARM_FEATURE_V7);
>    }
>
>  * in kvm_arm_get_host_cpu_features() in kvm32.c add
>    set_feature(&features, ARM_FEATURE_V7VE);
>    where we currently set V7, LPAE, etc.
>    (by definition a host CPU which supports KVM has v7VE.)

Thanks!

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
