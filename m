Received: by 10.223.197.9 with SMTP id q9csp2533558wrf;
        Mon, 9 Oct 2017 07:54:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAzaHRW2HDF5bu6FPklrkbMRWvfvq2Yg4Q8Nt/T8I9Ma0IIngjqpMVJVleSWOW9Y+l/2fIQ
X-Received: by 10.55.74.138 with SMTP id x132mr7285807qka.239.1507560866087;
        Mon, 09 Oct 2017 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507560866; cv=none;
        d=google.com; s=arc-20160816;
        b=ujhPWzAfb3nFoPstu4a+83PTQxUQxRYy6JPpSg2CaE45qqcOEhkIjOakmzXhSvdsu1
         pMFdIPIzaItJZ1uNNyNp1pCXIf458ZixHphSUE7FfCqZuZEjhmGnLTiyg5aoHI3evgIK
         RAaJhmT8G7UlOubqlPZGBGA2ARVbVL7t5uHfKyjCWvsktC4ra1uPjwA4uncWp39oItAH
         mK88SkCySWEGBJygOsEHMpPDaVsHbo3Er2+u25znf8PfzhIZUeW4+0ar0ZP78gyj5NPk
         NXVLKXAEdQSTNqxF+5mrjEwWU+ZaxC83He3FPCPhTitqfKN9ogONfDDR65/N/kZ2WlsP
         xjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=kRRLlVRlBJxo78lOCOsXBsQsAEsrsAqAfMHzZqiyLh0=;
        b=UzIuksaBRLxQaruV56Zw8W5NmdycN5sc0HvKzle+9zI2pUNetUaNT0FuEzwJUjS5PE
         sbw4xif2tD3p2cMWH3tiARbW+501vMWp17SsS/LwqPaXAHAwXWzcd0ZkhNg0mJCeXwbr
         MezL5VTcBAi0j193BxEu1d2yQYVUE5SmAgRCkoN8FFfxsaFWqjuPFF7W+Q9gnufqi6fu
         VxOSlYREAyyzNsauQCnzeO4+YrhGqrhN2sWyxh7T2OYJ3BgKPQcrsTCWFYwL1ajjhOIw
         h0FffWcn/C+jbFbLPCtNJpqS6eTFT24XMZ9cg7FBCLZegFab5JJarKm23QNR9tKL/oM0
         X9sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=SYRstFMp;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=OLZ+ZZdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si4812989qtf.422.2017.10.09.07.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 07:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=SYRstFMp;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=OLZ+ZZdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZRp-0002DC-ME
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 10:54:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1ZRi-0002Ct-ND
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e1ZRf-0000mJ-JO
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:54:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60012)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e1ZRf-0000lC-9P; Mon, 09 Oct 2017 10:54:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id AABE66330B; Mon,  9 Oct 2017 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507560852;
	bh=HcDiFJruxlCuac1rcI7d+SxoenZr5/LGA+xdjTl+0Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYRstFMpuga3EoGRNtWu5yo8s+6t2ofiNsxS9nf+e9lWTtbe0W+cU0DBmDnitdD8B
	ECsvO60WTqt8Bc2tgQYw4q9Dv5vfQWYs0gEsXLX7zaRwq6UcYYCnqvhxhdyuBoTwDj
	GEVVKBoQK+TNvlx0LNmstqOwqaotZmCAe82Fbfco=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A46A63038;
	Mon,  9 Oct 2017 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1507560409;
	bh=HcDiFJruxlCuac1rcI7d+SxoenZr5/LGA+xdjTl+0Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLZ+ZZdy1dgxXYYvpUxIQ8FWaP7oqzgU0v5+mF4vxPuKo19XgzfKgaEdEtMCwVSYA
	vO6iE8+JZeDbklpYM9bSvzFZ7OZypi2ycG+F6OEHMg85Z0w5OvDeLdoFCN5TJ4nEmA
	8Ik/PwyopnT3do8zLhNHJymd6zINjp7j8bX2ydF8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A46A63038
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 9 Oct 2017 10:46:42 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Message-ID: <20171009144641.GA3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPSPPnUgPQPV

Ping!

Unfortunately I'm not sure who to add other than the current recipients,
but I'm eager for feedback and would love to work this into something
that will allow for using the full ARM PMU. 

I've also updated Peter Crosthwaite's email since the xilinx one appears
to be stale.

-Aaron

On Sep 29 22:08, Aaron Lindsay wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but it is
> often useful to gather counts of other events and filter them based on
> execution mode. These patches flesh out the implementations of various PMU
> registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> represent arbitrary counter types, implement mode filtering, and add
> instruction, cycle, and software increment events.
> 
> I am particularly interested in feedback on the following two patches because I
> think I'm likely Doing It Wrong:
>  [1] target/arm: Filter cycle counter based on PMCCFILTR_EL0
>  [2] target/arm: PMU: Add instruction and cycle events
> 
> In order to implement mode filtering in an event-driven way, [1] adds a pair of
> calls to pmu_sync() surrounding every update to a register/variable which may
> affect whether any counter is currently filtered. These pmu_sync() calls
> ultimately call cpu_get_icount_raw() for enabled instruction and cycle counters
> when using icount. Unfortunately, cpu->can_do_io may otherwise be zero for
> these calls so the current implementation in [2] temporarily sets can_do_io to
> 1. I haven't see any ill side effects from this in my testing, but it doesn't
> seem like the right way to handle this.
> 
> I would like to eventually add sending interrupts on counter overflow.
> Suggestions for the best direction to handle this are most welcome.  
> 
> Thanks for any feedback,
> Aaron
> 
> Aaron Lindsay (13):
>   target/arm: A53: Initialize PMCEID[0]
>   target/arm: Check PMCNTEN for whether PMCCNTR is enabled
>   target/arm: Reorganize PMCCNTR read, write, sync
>   target/arm: Mask PMU register writes based on PMCR_EL0.N
>   target/arm: Allow AArch32 access for PMCCFILTR
>   target/arm: Filter cycle counter based on PMCCFILTR_EL0
>   target/arm: Implement PMOVSSET
>   target/arm: Split arm_ccnt_enabled into generic pmu_counter_enabled
>   target/arm: Add array for supported PMU events, generate PMCEID[01]
>   target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
>   target/arm: PMU: Add instruction and cycle events
>   target/arm: PMU: Set PMCR.N to 4
>   target/arm: Implement PMSWINC
> 
>  target/arm/cpu.c       |  10 +-
>  target/arm/cpu.h       |  34 +++-
>  target/arm/cpu64.c     |   2 +
>  target/arm/helper.c    | 535 +++++++++++++++++++++++++++++++++++++++++--------
>  target/arm/kvm64.c     |   2 +
>  target/arm/machine.c   |   2 +
>  target/arm/op_helper.c |   4 +
>  7 files changed, 500 insertions(+), 89 deletions(-)
> 
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
