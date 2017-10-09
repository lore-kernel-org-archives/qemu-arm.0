Received: by 10.223.197.9 with SMTP id q9csp2825124wrf;
        Mon, 9 Oct 2017 13:25:55 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBXZO7BiqIvT46uFX9ueIz5OGvhFZyWCYneN5J5FvE5sAPcID9woFCGuQZay7b5ufAB2g8+
X-Received: by 10.55.197.194 with SMTP id k63mr11214583qkl.208.1507580755234;
        Mon, 09 Oct 2017 13:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507580755; cv=none;
        d=google.com; s=arc-20160816;
        b=EIbO96P5so7nvwNCb5Upctw5+gnDXJC350DL9C/w9waJZ4O0Kp1V1Ydp32D49ae9Gq
         btscW8jBsZtaNOeAFBRDQu8qEK5nwcSgLTow9gT9cm1Sp2neAQt0f9xRQ6dNCSQzlkPV
         +gyYslK9Cv7Ri9xo/wI8mGrMIalfc/IqIW+ei29j/auiCtXK8MoTeDIYiHIjLwqvTcFB
         TN3d7zdbun3QfxW5tYpFIt3YpAszofZwxUqSPLQ14QwYZOKQjPjS2Zw+EEJmlvxnAQUW
         pr0sxol5nEp+U1B+w+9BAiQUBvDv64LZGhX98pbYBFDAgm6OUZbbtEQri6LF58rm91Fr
         PjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=6hrwAs8tQ8pNVaXv9AqjwN6kWZq+dZHPED3vdiN0Xzk=;
        b=P06uAO9C/HRdy12H8x+PNTcrethOcDXnK+g6SsCVtBmE2tL4Z9zQOD86wPK5eZfsBW
         4X+YJOblDuZVTVZ9e8o5IwoHa0zE0cjXuxD058LhvEix0l5v3l2RNErItkR59s+JWhHq
         RxOk1D9lm2ag7IfxSUJdhw0R5JWBAJe6NZdRL7rLl95E6f+OmV6S1LWygmSAKV8CTpub
         ATTqmVmazgXi7Dc1B19Ml47yU/omyEN0HAu4lc5W674OYrPrltkRpYTqCbl0zvwFJd5Y
         fO4kW/EiUcFte/qgWqoKFG+IJbQDFYRLHoHFXjTjxDUcwQfFzNUWT4nR19kh54YyJIrr
         p/vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YB6pBg3n;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ly009IxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si839927qkd.54.2017.10.09.13.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 13:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YB6pBg3n;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ly009IxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ecb-0007pS-37
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 16:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1ecR-0007pN-Bz
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 16:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1ecO-0007Hm-6J
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 16:25:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33246)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e1ecN-0007HA-SW; Mon, 09 Oct 2017 16:25:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 36F20609F2; Mon,  9 Oct 2017 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507580738;
	bh=Is6KMXCE+cE1AHiVdh2cB9xMz5vG9XrMsFLugnRNE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YB6pBg3nh1mC9TmoX3gXDG2T+3aDpkn0TcBeL5PPcI9KhYfhrPCX3E7TweOXYKQEy
	xsXESM7fJ9JD11YGcBh47P0NF8uq1JOs/f7l2m169PcOUC5D2xhPVoT9pOYCppv6lP
	YxWNH9D7rgwbyZQAyY2rBB8C/NofjhJxt/fMkI9w=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E3CE611A1;
	Mon,  9 Oct 2017 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507580736;
	bh=Is6KMXCE+cE1AHiVdh2cB9xMz5vG9XrMsFLugnRNE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly009IxQVtSVtw9qqeERQ3hfJB0tafcAtuMNHLkIZIac75KfV7Qvc9qlylJIWCmJX
	z+J7c5+gJCAlwEghY47WIyD+fGyvTb2pykmW1jXGJSuIXJvcoRq9dlVMz9ZFbpU1p6
	jh77PDKYBMXu356j2FRFMRFDQaE3poozikcjBZCQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E3CE611A1
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 9 Oct 2017 16:25:32 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171009202532.GB3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<20171009144641.GA3676@codeaurora.org>
	<CAFEAcA9xYJVy2mSo=CmmHDTfELLaEpzbDx=SubsmJQQY9fwxeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9xYJVy2mSo=CmmHDTfELLaEpzbDx=SubsmJQQY9fwxeg@mail.gmail.com>
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
X-TUID: gqDaBrvPbnpE

On Oct 09 19:27, Peter Maydell wrote:
> On 9 October 2017 at 15:46, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Unfortunately I'm not sure who to add other than the current recipients,
> > but I'm eager for feedback and would love to work this into something
> > that will allow for using the full ARM PMU.
> 
> Hi -- I do have this on my review queue, but unfortunately it's
> sitting behind some other fairly chunky hard-to-review patchsets.

No problem - I'll wait my turn.

> As a first quick "is this going in the right direction" review based
> pretty much only on the cover letter:
> 
> What extra events do you want to try to support in the emulated PMU?
> Part of the reason we only support the cycle counter is because
>  (1) a lot of the events in a real PMU would be hard to support
>  (2) it's not clear to me that exposing events to the guest would be
>      very useful to it anyway -- performance profiling of guest code
>      running under emulation is fraught with difficulty
> 
> Giving more of an idea of what your use case is would help in
> evaluating these patches.

My goal isn't to expose events concerned with microarchitectural
performance, but rather those that can help characterize architectural
behavior (initially instructions and maybe branches, but perhaps
anything in ARM ARM D5.10.4: "Common architectural event numbers"). We
use a number of platforms at different points along the accuracy/speed
trade-off continuum, and it is convenient to use self-hosted tools that
we can expect to work on all of them.

For instance, implementing the instruction counter allows us to stop
processes after executing prescribed numbers of instructions and resume
them on other platforms for further study (using CRIU). It can also be
useful to get a `perf` profile based on instruction count to get a rough
idea of where an application is spending its time.

> Some of what you're doing looks like it's fixing bugs in our current
> implementation, which is definitely fine in principle.

Yes, I believe patches 1-5 are fairly straightforward fixes, with the
later patches getting into the more invasive changes.

> I haven't looked at the icount related stuff (and I can never remember
> how it works either) but fiddling with can_do_io does sound like it's not
> the right approach...

Agreed. Perhaps part of the same offense as the pmu_sync() calls
scattered around - I was unable to find a better way to drive the mode
filtering, and am more than glad to pursue a different approach if
pointed in the right direction.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
