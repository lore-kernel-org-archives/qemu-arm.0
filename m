Received: by 10.223.159.74 with SMTP id f10csp20519wrg;
        Fri, 8 Dec 2017 14:40:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYUOfqvF1Wk6wfcoWmVi8Vv/fSUK7Aa1mzYqDHe3tc4EsheRiuMgPBoXjTcV5Pj+fL1g0A2
X-Received: by 10.129.53.11 with SMTP id c11mr21149622ywa.82.1512772835485;
        Fri, 08 Dec 2017 14:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512772835; cv=none;
        d=google.com; s=arc-20160816;
        b=HkG7Uw685rYPrnzsmHUeoAsweK4fd+tXrYH8hjAbWEXYpwLEEX3CjhQzl1osvXrhu4
         CR5b62HvizH9YMkvgiGy2CwUAPFOMwKGR/Hl19s3AcAaFuAWkl7Qag7y8bDKa4Yi04we
         jWFp/X3hcyQxrwTfLo4hS2f/tT42qCh+D8haqSvqyNH6hdmIfKZ0IyHbjXKInxEMAVIF
         d1GKPP7xWWRm13Mca7RKsgYZEtLrp7oJsY93rAdGAOLtyYYSxtUv2cyPSR9fQbZPwodT
         o94jBsOFOpl7DsBE9iY8PM1qpWrVuxpIadAuTRDCcDdfPRnkDrbbuMCx06iwwOqlckFS
         inYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=kf9O0ze1N8O1GTJE14Z98vftTLnbe6TJGM5QiC59+dQ=;
        b=VcIh84IvZj+82FQaOZ6FqwyqM3Ur2e3KohY0l3kv1wInBqGCdut8gGy3WAysW3yoCg
         5uluGTrkbxPgpOS9TMmcls6RX87RF3WFYAXnaranDxViV07I8eqZPg5Q4LuJRss0Sg8N
         fV1EaCO7IbvUOv7lIJspEnc4WM3Mp4gkXkuD/AxTvdrEvw20G2Jga30zdZkUO+gadynV
         HfU3EcLkm32xKvwrHny+w03dOsu1nh0TSVKBNO0f/Lt1hL35WCitMY8VDdNlBjuB3Fyv
         j/bEGrpUqzBk/EFmhcSqpcQ0rX3yiqDZvdqXjzAKjBeZaWWKTZXTRpWM1NMoUtRDbJQM
         HKgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b9si1861888ybe.425.2017.12.08.14.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 14:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNRJq-0006kd-V5
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 17:40:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eNRJY-0006iK-71
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 17:40:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eNRJS-0002cC-UK
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 17:40:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:39242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1eNRJS-0002Ws-I3; Fri, 08 Dec 2017 17:40:10 -0500
Received: from [10.135.48.227] (104-6-24-213.lightspeed.sntcca.sbcglobal.net
	[104.6.24.213])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E2DAF2190F;
	Fri,  8 Dec 2017 22:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DAF2190F
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Fri, 8 Dec 2017 14:40:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
Message-ID: <alpine.DEB.2.10.1712081439380.8052@sstabellini-ThinkPad-X260>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/12] Refactor get_phys_addr()
 not to return FSR values
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cHNe+NYmLNPO

On Tue, 5 Dec 2017, Peter Maydell wrote:
> Currently get_phys_addr() and its various subfunctions return a
> hard-coded fault status register value for translation failures. This
> is awkward because FSR values these days may be either long-descriptor
> format or short-descriptor format.  Worse, the right FSR type to use
> doesn't depend only on the translation table being walked -- some
> cases, like fault info reported to AArch32 EL2 for some kinds of ATS
> operation, must be in long-descriptor format even if the translation
> table being walked was short format. We can't get those cases right
> with our current approach. (We put in a bodge fix so we could at
> least run Xen, in commit 50cd71b0d347c7.)
>     
> This series does a refactoring of get_phys_addr() so that instead
> of returning FSR values it puts information in the existing
> ARMMMUFaultInfo structure that is sufficient to construct an
> FSR value, and the callers then do that using the right condition
> for whatever they're doing. I've included Edgar's patch from back
> in June that fixes the handling of ATS instructions, which is most
> of the point of the refactoring.
> 
> Rather than doing it all in one massive unreviewable patch, the
> series is structured as:
>  * patch 1: add fields to ARMMMUFaultInfo, and the utility functions
>    that return a long or short format FSR given a fault info struct
>  * patch 2: stop passing an fsr argument to arm_ld*_ptw(), since
>    nothing actually looks at the result. (This breaks a cycle
>    arm_ldq_ptw()->S1_ptw_translate()->get_phys_addr_lpae()->arm_ldq_ptw()
>    which would otherwise make a stepwise refactoring awkward.)
>  * patches 3 to 8: for each of the different subfunctions of
>    get_phys_addr(), make them fill in the fault info fields instead
>    of an fsr value. Temporarily we add calls to arm_fi_to_sfsc()
>    and arm_fi_to_lfsc() at the callsites in get_phys_addr(), since
>    the callers of get_phys_addr() still need the fsr values. These
>    will go away again in a later patch.
>  * patches 9 and 10: change the callers of get_phys_addr() to use
>    the info in the fault info struct and ignore the fsr value.
>  * patch 11: remove the now unused fsr argument (and the temporary
>    calls to arm_fi_to_sfsc()/arm_fi_to_lfsc())
>  * patch 12: Edgar's patch for ATS PAR format
> 
> Arguably it would be good to push the "create the FSR value"
> logic further, into the point where the exception is taken.
> (This would let us correct the oddity where for M profile we
> get an A/R profile FSR value in arm_v7m_cpu_do_interrupt()
> which we then have to convert into the appropriate M profile
> fault status bits.) However, migration backcompat makes this
> tricky, because at the moment we migrate env->exception.fsr,
> and so we'd need to have code just to handle inbound migrations
> from old QEMU with an FSR and reconstitute a fault info struct.
> So I've stopped here, at least for now.
> 
> This whole series sits on top of my v8M TT patchset (which also
> had to touch some of the get_phys_addr() code). I've pushed it
> to this git branch if that's more convenient:
> 
>  https://git.linaro.org/people/peter.maydell/qemu-arm.git fsr-in-faultinfo
> 
> I have tested a bit (including a Linux KVM EL2 setup), but more
> testing would definitely be useful. Stefano: in particular it would
> be good to check this hasn't broken Xen again :-)

Still works :-)

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> Based-on: 1512153879-5291-1-git-send-email-peter.maydell@linaro.org
> ([PATCH 0/7] armv8m: Implement TT, and other bugfixes)
> 
> thanks
> -- PMM
> 
> 
> Edgar E. Iglesias (1):
>   target/arm: Extend PAR format determination
> 
> Peter Maydell (11):
>   target/arm: Provide fault type enum and FSR conversion functions
>   target/arm: Remove fsr argument from arm_ld*_ptw()
>   target/arm: Convert get_phys_addr_v5() to not return FSC values
>   target/arm: Convert get_phys_addr_v6() to not return FSC values
>   target/arm: Convert get_phys_addr_lpae() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav5() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav7() to not return FSC values
>   target/arm: Convert get_phys_addr_pmsav8() to not return FSC values
>   target/arm: Use ARMMMUFaultInfo in deliver_fault()
>   target/arm: Ignore fsr from get_phys_addr() in do_ats_write()
>   target/arm: Remove fsr argument from get_phys_addr() and
>     arm_tlb_fill()
> 
>  target/arm/internals.h | 187 +++++++++++++++++++++++++++++++++++++-
>  target/arm/helper.c    | 238 +++++++++++++++++++++++++++----------------------
>  target/arm/op_helper.c |  82 +++++------------
>  3 files changed, 342 insertions(+), 165 deletions(-)
> 
> -- 
> 2.7.4
> 
> 
