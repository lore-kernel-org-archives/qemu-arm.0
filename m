Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp761499wre;
        Fri, 1 Jun 2018 08:34:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJQ8xRgWm5ZpVwOeLpRqS81GxFp5OvCaHfLE2SIFfilTx+cLtMIGejET8CPnxb9HpDoHg4V
X-Received: by 2002:a37:6188:: with SMTP id v130-v6mr10954824qkb.43.1527867299174;
        Fri, 01 Jun 2018 08:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527867299; cv=none;
        d=google.com; s=arc-20160816;
        b=x+bVY0HcRyVczkc/qeLw4OdWBi3D5lB3KEP/A9CarmUtXzh7fcE+9kJUQsKo7YEeno
         SYT1sI3Bzxb2BaLdhLsawPx/zzdPA1EIAgXX8Q/bw7wPAvVKjdQxdnhPeM0jYHp0wHWW
         8VDUKlqMTYe3nyo0m1/D8WXX4B2B0qrcMkcZT4Qn/RKMkYkwn4CHeIhaNhwRPHI9Qydl
         N9ZwpwdhgGUIwd42YM2BBEN+iTLNxHuuv5tTAtDbFD5A5zG+A9w+udR4Bp1GZVYyU6mE
         ysFrdr1Zu4YChyr/W+Ide1m7SHrDR3Zt3nJN9peNM+0ODj6phTP5E/kIozhX2A4iIuQw
         Ze8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bCFYx/wTf2aZWBNpknUIE462LHq8fAzGmhdsVMaROEU=;
        b=KIGzWF+12m9GZjZk5LnMkC4KdqngMeObUKvUgqipzuKRYz1MBKLr0SHnv5OXW74U/9
         IgLtYTD9NHSTZ1aKzlZsLm7/fGWqlSX4H9WobBf6LDW6bnRKT3uWokc9LeRR/IwQ9WZp
         eaTS7aPVpedOytVY5NHh8cWrD7k4gqK4v3VlcyyZT3+n3xtDhYmRnKb5QTajNAGB13zx
         CldAiBufqKywJrxLjtObSmfhldJVDF+ajyS1/N6doxzzumeetczFPgUgAYAgiodLsfud
         bMe4tJEiIyJTr5bRF0e+ZXXFayB/NW3zzUVJOrhjlOUlv66oTxMR3ScszwdUfQCdXtRb
         sgfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+EJ8Qs1;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+EJ8Qs1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si2652030qtn.23.2018.06.01.08.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 08:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+EJ8Qs1;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+EJ8Qs1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOm4w-0001Ff-Nr
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 11:34:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOm4Z-0001EK-Cy
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 11:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOm4Y-000169-G3
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 11:34:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fOm4R-000139-QF; Fri, 01 Jun 2018 11:34:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 9409A606FA; Fri,  1 Jun 2018 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527867266;
	bh=mZuVFs6aobYANUv9OXonPJjpTJupuqXr5P3kEgkE1UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+EJ8Qs1u/ILCGrCHEh0Sa/qNNlVmAkou8wIL/HvaCVSv5Iv5mmQXAERCOGaTxbYI
	Dwu/o0AFqX1Glb0CYsYMfCpE+nP+fJD6Xz7ciHIU/d5nPpaEBIqddzGvPPnKHrWDu1
	+wZXNPEtQkqaO3LX/HL4Wo4tQEPOwMTcysSUAeDM=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 721D260251;
	Fri,  1 Jun 2018 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527867266;
	bh=mZuVFs6aobYANUv9OXonPJjpTJupuqXr5P3kEgkE1UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+EJ8Qs1u/ILCGrCHEh0Sa/qNNlVmAkou8wIL/HvaCVSv5Iv5mmQXAERCOGaTxbYI
	Dwu/o0AFqX1Glb0CYsYMfCpE+nP+fJD6Xz7ciHIU/d5nPpaEBIqddzGvPPnKHrWDu1
	+wZXNPEtQkqaO3LX/HL4Wo4tQEPOwMTcysSUAeDM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 721D260251
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 1 Jun 2018 11:34:23 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180601153423.GB12424@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
	<CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
	<20180531203906.GA12424@codeaurora.org>
	<CAFEAcA_2z-2utCiPQM0DtZGXgiE2qbVsB=Nn81j9DP7Z8keRqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_2z-2utCiPQM0DtZGXgiE2qbVsB=Nn81j9DP7Z8keRqw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-devel] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDpIRAGPZVG5

On Jun 01 09:57, Peter Maydell wrote:
> On 31 May 2018 at 21:39, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > On May 31 15:18, Peter Maydell wrote:
> >>    if (arm_feature(env, ARM_FEATURE_V7VE) {
> >>        /* v7 Virtualization Extensions. In real hardware this implies
> >>         * EL2 and also the presence of the Security Extensions.
> >>         * For QEMU, for backwards-compatibility we implement some
> >>         * CPUs or CPU configs which have no actual EL2 or EL3 but do
> >>         * include the various other features that V7VE implies.
> >>         * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
> >>         * Security Extensions is ARM_FEATURE_EL3.
> >>         */
> >>        set_feature(env, ARM_FEATURE_ARM_DIV);
> >
> > Is it safe to assume from your comment above regarding keeping ARM_DIV
> > separate from V7VE that the inclusion of it here is an oversight and
> > that only LPAE and V7 should be set if V7VE is? (and that V8 should
> > now directly imply both V7VE and ARM_DIV?)
> 
> No; V7VE always implies ARM_DIV. (ARM_DIV doesn't imply V7VE,
> though, which is why it is a separate feature bit.)

Okay, then I'm confused about some of the preexisting logic in
kvm_arm_get_host_cpu_features. The preexisting code in that function
sets ARM_DIV and THUMB_DIV based on the appropriate bits in ID_ISAR0. If
we already knew that
>    (by definition a host CPU which supports KVM has v7VE.)
and that all V7VE CPUs have ARM_DIV, why did the code there bother
checking ID_ISAR0 to begin with?

> switch (extract32(id_isar0, 24, 4)) {
> case 1:
>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
>     break;
> case 2:
>     set_feature(&features, ARM_FEATURE_ARM_DIV);
>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
>     break;
> default:
>     break;
> }

Should this switch/case be removed entirely?

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
