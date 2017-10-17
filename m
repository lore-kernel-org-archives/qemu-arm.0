Received: by 10.223.197.9 with SMTP id q9csp4953132wrf;
        Tue, 17 Oct 2017 12:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T3AvVY3zWuZWOoOebjir1Ia3O+u+pJ47xE2bcpp3BP0ZyQlVAxBsc/FoQ0qyEUDbrdK3b0
X-Received: by 10.55.186.71 with SMTP id k68mr8316470qkf.100.1508269974627;
        Tue, 17 Oct 2017 12:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508269974; cv=none;
        d=google.com; s=arc-20160816;
        b=NQPtt7l1Q9ZpAqaU6+0c1EWhnkGOwEUUFNgb1Dlm5xtr4uZFziOelGAmLXbfGULzXr
         OCXpF5V62y+NpxEXvmxJSpoaUYY865hierTzO3LTTVVfgkFC32neP4JvdeEqLX86XZQD
         SSjbRJoNDMWoAraLLapK93xdZ+qxRD5GMh6ltXYR36ULo9EeTxsnXoCPXuTcNMIWhLEi
         qrA+VMSE4Tqo3DIlVkiMwFI5rgIdlwMCcs+Vg4/Z7iWvE/4xpIi67qoWJ9tH1EiflQoy
         r/Z3KOvJo0UGmqZvCZRgJfLx9qxhuKdsj9HqNyhhjAPA8vio6ywI1wO9AMIOfDFFrz3u
         V5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qFYmvxQjZ9VOn3xMRZ2PvrJzPwXSktBZiaBKkoPxqLA=;
        b=xb+RmzWP0to6upHNYsTNHqhzdYTLrb11l07iSF8BMTovWEpvmHegC+LEm4CgWkUl4B
         9aW36nHPLutXhYHvX/Xa9Sy23mVYcWjSJmMT2kkA9iPjfrhUlF5O8dER+nq28IKNOkTp
         MbWrUVj0wV5640HybgOkuWAAGSkfKouMKfKgeMwxnWWwzWUwKyVuIREok9mna7J/Q+jT
         wbVEIZHp4nsvhUw5i1l8XiaA1EgsssqSy58/arFidl5DYsV+aP20x0x5BMYTxJvqJSmJ
         HjUKX2Jg5T0Mu+9vna5nCJGHNrHwY7TdK9dNzyIS9E32pO4fYXmIp4KxFvNAArLRWNp3
         JmCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fIYSRSXM;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fIYSRSXM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z57si3312445qta.43.2017.10.17.12.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 12:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fIYSRSXM;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fIYSRSXM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Xv2-0000Df-I4
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 15:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4Xuw-0000DZ-6p
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 15:52:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4Xut-00004q-47
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 15:52:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40320)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4Xus-0008UH-Qp; Tue, 17 Oct 2017 15:52:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 90D83607EF; Tue, 17 Oct 2017 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508269961;
	bh=mFTvbtNmDLh7NA6VrqOZPrpMqD/3Khzz3hwyh76RbD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIYSRSXMIr57ucZIo1JPQhhD4WmbpfuuZ6oIJgOkl4FaKtpIPpOYOCh/GjnB6vNDn
	Vpy8ybMb2ebPyjAmfMwxWnxResJHNHuj1f9+ManKyC45SrK/HD31VvKSgJseZCpg6G
	3JrGtldtr6rFPTNnxkNidzaWOBzSgrL9XUOXBBck=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B42A607B4;
	Tue, 17 Oct 2017 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508269961;
	bh=mFTvbtNmDLh7NA6VrqOZPrpMqD/3Khzz3hwyh76RbD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIYSRSXMIr57ucZIo1JPQhhD4WmbpfuuZ6oIJgOkl4FaKtpIPpOYOCh/GjnB6vNDn
	Vpy8ybMb2ebPyjAmfMwxWnxResJHNHuj1f9+ManKyC45SrK/HD31VvKSgJseZCpg6G
	3JrGtldtr6rFPTNnxkNidzaWOBzSgrL9XUOXBBck=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B42A607B4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 15:52:38 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017195238.GC22177@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_f=7XjUs7BNQksidnBKofc8SxYtfjMtmfYMuPeo8NXug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_f=7XjUs7BNQksidnBKofc8SxYtfjMtmfYMuPeo8NXug@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v2 00/13] More fully implement ARM PMUv3
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
X-TUID: gcaeyIotsltK

On Oct 17 16:09, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > The ARM PMU implementation currently contains a basic cycle counter, but it is
> > often useful to gather counts of other events and filter them based on
> > execution mode. These patches flesh out the implementations of various PMU
> > registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> > represent arbitrary counter types, implement mode filtering, and add
> > instruction, cycle, and software increment events.
> >
> > I am particularly interested in feedback on the following two patches because I
> > think I'm likely Doing It Wrong:
> >  [1] target/arm: Filter cycle counter based on PMCCFILTR_EL0
> >  [2] target/arm: PMU: Add instruction and cycle events
> >
> > In order to implement mode filtering in an event-driven way, [1] adds a pair of
> > calls to pmu_sync() surrounding every update to a register/variable which may
> > affect whether any counter is currently filtered. These pmu_sync() calls
> > ultimately call cpu_get_icount_raw() for enabled instruction and cycle counters
> > when using icount. Unfortunately, cpu->can_do_io may otherwise be zero for
> > these calls so the current implementation in [2] temporarily sets can_do_io to
> > 1. I haven't see any ill side effects from this in my testing, but it doesn't
> > seem like the right way to handle this.
> 
> I've now reviewed the early stuff and provided what I hope is
> a useful direction for the mode-filtering, so I'm not going to
> look at the patches at the tail end on this version of the series.

Thank you, your review has been very helpful - the next pass of the
mode-filtering patch will be more maintainable.

> > I would like to eventually add sending interrupts on counter overflow.
> > Suggestions for the best direction to handle this are most welcome.
> 
> Check out how the helper.c timer interrupts are wired up
> (the CPU object exposes outbound irq lines, which then get
> wired up by the board to the GIC.)

Thanks for the pointer - I'll take a look.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
