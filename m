Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp964101wre;
        Fri, 1 Jun 2018 12:13:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLslXpaGJm5+HvxwfwwYbDhrco7wCUwkGCx2etiWXAkdqJoMcQnqAPjkqa3ImM5KfcK51mt
X-Received: by 2002:ac8:3511:: with SMTP id y17-v6mr11959192qtb.205.1527880383707;
        Fri, 01 Jun 2018 12:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527880383; cv=none;
        d=google.com; s=arc-20160816;
        b=Tp1pgAI0bmGlmggWK1apgSO2uvzLJdXP30RKTM1O8ZsztXYQXfoC0LanRg18CC4J7v
         guwxgIoCg0Yr84n40v/G4m6Ay1zajRQ6VP5HWoXwHN+bCGy/rXnHOT19ZYl8mtEyjUFg
         HH2U33t76Eai+VgiU1vR7BYoWkFf6IU/33xNmKkGUaI9mpUgbJGH4iAj/9uZwJ1wizzq
         lJxoNlxSyWEsTKBq0hffa6RqvbaqgXWrcKEFk32ba63bqDz2C3DuwFrm2L4qZ9TRGocT
         Ivm+3A4LJBAk3sF0CU+3aenxy4eKqkGxSS9KOUNLXzxzUfNwAOgFLd4395bQ9YwmE08/
         Gd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=q3/QHu4K59OR8BUUtcv2B7h9uRZx0US+fBQ1co+cOgE=;
        b=X0wKr+ot6AOxBLkDjNBJ5t2FB3nDaSumGz4KUDa5S5gafscEn0hYqBrtWlACKdy7+e
         OExxNqvqaqkGpQmWAF3HVd6ku+bYjWpusir3WPdYrY1Zx2m/xpJNnHZjMDREMEz67Gyp
         sF29uUOTA+yiThMK5r6rD/7JzWy6P4B9CJMOsiJNl2BTEFKs173I4CKJSH5u4H6JSB8P
         J1qzQ2Dl6nYh8jHc82Q/2jWiK3kPt7/PAeo1USeudphKQIIkbwv5FD3YojtgqgoYmwZq
         i/mAN4MBkmKFB/vS4jK3jDiLsmUdBRAMoKvEo4p5BvsvihLDJ7A1JU4f2LGkK2kJfThM
         xVtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=k40Etoaa;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=IDXlZaGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si1713508qtj.249.2018.06.01.12.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 12:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=k40Etoaa;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=IDXlZaGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOpTz-0000E3-8Z
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 15:13:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOpTt-0000Di-5k
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 15:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fOpTp-000734-U5
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 15:12:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fOpTp-00072A-L5; Fri, 01 Jun 2018 15:12:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7BA2B605A4; Fri,  1 Jun 2018 19:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527880372;
	bh=FsBwMbUJMH/rW5b355Q7rd8/wQbRXTAkJDXrHHcl7oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k40EtoaawZzvcSMrBmS1gXXiwJmMqrX4lVMvNkIpDQfbiQFwK6GiUjD9BryA6HIeP
	GegqUGOSM48nhddZuqB51Wf5cPttxHthXrQt3LfBXBuVJ6C3AcQ0zWCBBbiqGatows
	GfzHR7QxOpSH0wwW34p+sCWHDVRz5rsFYShJ6MvY=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B476605A4;
	Fri,  1 Jun 2018 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1527880371;
	bh=FsBwMbUJMH/rW5b355Q7rd8/wQbRXTAkJDXrHHcl7oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDXlZaGunUL0HSgbagK9QIGb1FwAyPznDcZpdGthVlTOyPu9iUNNgyOrVw2464++h
	FfeZYhaYiA96FqsyMlcUqJYIK64CaNRhYd5Q9fg2bb3OfUEjoWKK6w8Vsq4qP367dn
	JUJrlK6civVYm3VT3PVxpMBqHvKP7W7aTXK8gt9k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B476605A4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 1 Jun 2018 15:12:49 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180601191249.GC12424@codeaurora.org>
References: <1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
	<CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
	<20180531203906.GA12424@codeaurora.org>
	<CAFEAcA_2z-2utCiPQM0DtZGXgiE2qbVsB=Nn81j9DP7Z8keRqw@mail.gmail.com>
	<20180601153423.GB12424@codeaurora.org>
	<CAFEAcA-A824jUKK1bTg4-fVs10iotYu0wMkSk-tUfj+tZkpbug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-A824jUKK1bTg4-fVs10iotYu0wMkSk-tUfj+tZkpbug@mail.gmail.com>
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
X-TUID: E7N6WW6NcNvv

On Jun 01 16:59, Peter Maydell wrote:
> On 1 June 2018 at 16:34, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> >> switch (extract32(id_isar0, 24, 4)) {
> >> case 1:
> >>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
> >>     break;
> >> case 2:
> >>     set_feature(&features, ARM_FEATURE_ARM_DIV);
> >>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
> >>     break;
> >> default:
> >>     break;
> >> }
> >
> > Should this switch/case be removed entirely?
> 
> Yes, I think so (and also the id_isar0 variable and the
> idregs[] entry which arranges to initialize it). We should
> just set the THUMB_DIV and ARM_DIV features explicitly.

Okay, thanks for straightening me out! I sensed there was some
inconsistency, but misjudged exactly where. I'll include this change in
my next patchset.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
