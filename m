Received: by 10.223.197.9 with SMTP id q9csp2836008wrf;
        Mon, 9 Oct 2017 13:41:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCmkSfXZ96pWOvbRmvkUMZLp1YMAgbAMUzON/P7mWlUIkm+105q+YSTBpC3EQ5dTkHE3mm4
X-Received: by 10.55.137.198 with SMTP id l189mr11810871qkd.169.1507581671287;
        Mon, 09 Oct 2017 13:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507581671; cv=none;
        d=google.com; s=arc-20160816;
        b=drGXQZrl6XO+6oUJlsPfnRrm5Xd8pKXDaPKYQzxXqNvTJhTVcMpN0YWg70jTiZWDJu
         0lxdkcpH0yRkTj1UT46fuU0Q7jIMEN+aJBC7JAPrgdjkQ1AaWSfyIQ+kG0dTqfl+davJ
         PJuozhLTX0SGZ90b4g4aPizJ4Bym6h1kzIA3EuEPZKuaprs4+hKCOGFXELYHT5fU+wk5
         /rLaK3SAEHFcp6JVjerAszwlspFi+Eap/PDs/adcPZxriPJvLQSo9UUklReRthr94WD6
         f3lUljTaxwvhOsooie486n4TmiF4dRX/LY+J1VvUE314U4pU2NmAxgtg4qqkL5K9kHu6
         LTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qeZH2+lrLvegQhXr/b9zc6GkMcvF0tGjetrM9rL98Zo=;
        b=d27x1PaXwgKkduInnlOoB6t4AGy9INBpiTjFV9Q1GvKaikhc6BE7Uqx9oJg7Jt81Zq
         hVrQhoLbhSDQtteFjdGVIExO+iQoNFe36/GSp4Pwpzdoeu1pfyNKg5n71rEX20eNDhuM
         0omAdB+JTnPvLJ7us92tiUfyWYaeWfIqAkoa/0nKFNlj4/y8Z2fNqv9sQ6FlpyrqjJAB
         IwvPcTK9NScKQZ0L0XeeSmkfikQ0NHLUoxekddIya3pXYN06vYxng5V5fqrfom9weeoc
         wdUu3W5AWptfa4YOIiP4+5CoXEE5fU4/13fEAeomzxYz/pTO48oRq/5mmkejvSzesMzm
         I+1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Q90FyeOW;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gitFPOxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f101si7544842qki.297.2017.10.09.13.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 13:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Q90FyeOW;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gitFPOxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1erN-00013Z-7S
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 16:41:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1erE-00011x-Cx
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 16:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1er9-0008F7-CS
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 16:41:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e1er9-0008EO-2J; Mon, 09 Oct 2017 16:40:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8C7846073E; Mon,  9 Oct 2017 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507581653;
	bh=ASIMUTPITzCv+XMWzn9FNmB+ZqFeUS5NBgu7WlMK4WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q90FyeOWE48mRkI1FU8wmhd20Lk6Opmn9fqeAeTE+G+QkEojsdfaFL8hhf28tMP7O
	PwXgvKRZA6qCwkF+wgo9C1E77+uP0vjXgp1GBlU3kxpqD8stz21SPKaQ020BN73K9Z
	1IXcOiKA1eMEdMmW1BcM3GmN/cZa4SJGmiG0J/nE=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 61D4560159;
	Mon,  9 Oct 2017 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507581652;
	bh=ASIMUTPITzCv+XMWzn9FNmB+ZqFeUS5NBgu7WlMK4WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gitFPOxbR0yRg7ZQ6FgpuSOiskoIXXtt94SpGe7e/ExQ9bf2J5W8OBaDh9C0M/gkM
	WwQdAT8bic2Lr27W2YacOIZ1u45H5rc3e5oo4Q6KL1qHN5GWAdH1Xftml9eLq+nb7m
	1BEH77tYrXPNGCqfZYwoyonQvOGUHAXxkgreRaMI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61D4560159
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 9 Oct 2017 16:40:50 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171009204050.GC3676@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
	<1492623684-25799-2-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA-18f=10NENHVpqmhobf2camcqxVaq8KzquCSkJGknoZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-18f=10NENHVpqmhobf2camcqxVaq8KzquCSkJGknoZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 01/13] target/arm: A53: Initialize PMCEID[0]
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
Cc: qemu-arm <qemu-arm@nongnu.org>, mspradli@codeaurora.org,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UYUhxzNTZGo3

On Oct 09 19:19, Peter Maydell wrote:
> On 19 April 2017 at 18:41, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01]
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c   | 2 +-
> >  target/arm/cpu64.c | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 04b062c..921b028 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1342,7 +1342,7 @@ static void cortex_a15_initfn(Object *obj)
> >      cpu->id_pfr0 = 0x00001131;
> >      cpu->id_pfr1 = 0x00011011;
> >      cpu->id_dfr0 = 0x02010555;
> > -    cpu->pmceid0 = 0x0000000;
> > +    cpu->pmceid0 = 0x00000000;
> >      cpu->pmceid1 = 0x00000000;
> >      cpu->id_afr0 = 0x00000000;
> >      cpu->id_mmfr0 = 0x10201105;
> 
> This is A15 code, which the commit message doesn't say anything about.
> Fixing this code style nit should probably be a separate patch.

I'll split this off for the next version.

> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 670c07a..7b1642e 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -198,6 +198,8 @@ static void aarch64_a53_initfn(Object *obj)
> >      cpu->id_isar5 = 0x00011121;
> >      cpu->id_aa64pfr0 = 0x00002222;
> >      cpu->id_aa64dfr0 = 0x10305106;
> > +    cpu->pmceid0 = 0x00000000;
> > +    cpu->pmceid1 = 0x00000000;
> >      cpu->id_aa64isar0 = 0x00011120;
> >      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
> >      cpu->dbgdidr = 0x3516d000;
> 
> Does this actually make a difference? The field values should be 0
> anyway if the CPU-specific initfn doesn't set them to anything.

Perhaps not. I thought the omission was accidental since A15 and A57
both initialize them to zero (added in
4054bfa9e7986c9b7d2bf70f9e10af9647e376fc: "target-arm: Add the pmceid0
and pmceid1 registers")

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
