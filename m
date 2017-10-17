Received: by 10.223.197.9 with SMTP id q9csp4938323wrf;
        Tue, 17 Oct 2017 12:32:52 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QVYMbrwm2qXqkt898CIeAUavqnwTmfdn8YLi0zntg/W3B0NOjb/31/lgDrAfud53tCrI1Z
X-Received: by 10.55.128.7 with SMTP id b7mr2517479qkd.246.1508268772022;
        Tue, 17 Oct 2017 12:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508268772; cv=none;
        d=google.com; s=arc-20160816;
        b=mwvQ81BmRzNmwdzg3TQCFuWV4nIck/HHzG1zdOwBFAqJi9Xhe+h/Lm4rE5YHZuJHrZ
         uqHFyh28m4kS+d/JHuM5Q0jwQMLiPkk2jRjLhrxy76GeXxErJrswogm0avTtVOFr+SLd
         d27LdHxWQrTuUYVg6EJ16sK6I5Ouqd2gIv29thdFv4p6px83oeK9lAuro/pRg64umQ0U
         0HldHWjcJdGnfyVZuUfPHoeO0QOdixHOeo8TpyOnh40W9wKGvuY8d1d2iZj2bLXj+zNE
         Pnak6wbmaE0MbSAx9Y1q8WAXdvwsKXD9cohzkDBzcDCFuCxpWUOmqT8mMTdD9X92se2G
         vETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=jb/BwJpRoV1delQrjCr6OMIZwuGlhjDdvtccwqimz+4=;
        b=FNKjbHMdG/Vn21gENAs8w1IOMW722SAt8/NPjYZ3nKTLIzylLJWAKzbWQfR4pX5KtA
         bVLxbg/B6RmBcg7ra2l1mU5ECRic48kfm38nBUzf+MWcfrTuPJQOCGTS5MBwHv9+DM97
         VOWmCLHgmnV+HpUpaqTi/6ev1gf06KGMw0yDJnCJrm74/0E5k8RRejislfEJP8BdC7mt
         FaO0DvfxM7ez83kAimvkei8ekR4Fio7RtCe9m/lE4xWQwNi+ovJggtUZsJprMOV6C8Kk
         dJ1+XhKBv1E/wOLCCluvUcjTJsfkvMS7XWRaEXnJPmW7Oi95qjUtddUvr/BOSwaQFds5
         730g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P7ako56i;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=S1KMcNV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d79si5413119qkc.32.2017.10.17.12.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 12:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P7ako56i;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=S1KMcNV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Xbd-0004pp-PG
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 15:32:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4XbT-0004pX-6l
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 15:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4XbP-00045t-UG
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 15:32:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4XbP-00044m-KR; Tue, 17 Oct 2017 15:32:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5545260311; Tue, 17 Oct 2017 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508268754;
	bh=VAl705pH82kIc1hpvitG98uBU1U//j8meFMuosnVGAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7ako56iZM8fuabNMcXwOjnhX9ny2eWfrFZFb8LS/RweUwEV+vQQ4DLdmGhSbkoct
	BJ/+qAvcm0PJZw7SM17R6eoaCLtnvjGmoHAnpIsE/9S1EIOgt1pL5zWL9N4Pji3pJp
	Op/tOcafgtjwslo7rMZCYHH/dhyfAKEnQCxLQosM=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id DAE266025D;
	Tue, 17 Oct 2017 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508268753;
	bh=VAl705pH82kIc1hpvitG98uBU1U//j8meFMuosnVGAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1KMcNV0vmgzN+6uvOy3+mSYlvw235Xum4YuNKxDX2e5EP/WqQUkZKcyDfGOKIclW
	0j4L0V9rAYNSeSjjKBjV3jmcwynyGTzK23ZDQ/O7nnUzsAGfpsh5xPK9IF+bMEx98e
	peOx9ehDO1LrlITCPFzHQcZn7hYBbT1AYSp39/94=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAE266025D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 15:32:31 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017193230.GB22177@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-7-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8H-Zv0HRiMTSYFqkR0Wx7npB_N_ze9h0oovVa1tMHDRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8H-Zv0HRiMTSYFqkR0Wx7npB_N_ze9h0oovVa1tMHDRQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 06/13] target/arm: Filter cycle counter based
 on PMCCFILTR_EL0
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
X-TUID: 1taP8w1Va61b

On Oct 17 15:57, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > The pmu_counter_filtered and pmu_sync functions are generic (as opposed
> > to PMCCNTR-specific) to allow for the implementation of other events.
> >
> > RFC: I know that many of the locations of the calls to pmu_sync are
> > problematic when icount is enabled because can_do_io will not be set.
> > The documentation says that for deterministic execution, IO must only be
> > performed by the last instruction of a thread block.
> 
> Yes. You need to arrange that gen_io_start() and gen_io_end()
> are called around the generation of code for operations that might
> do IO or care about the state of the clock, and that we end the TB
> after gen_io_end().
> 
> > Because
> > cpu_handle_interrupt() and cpu_handle_exception() are actually made
> > outside of a thread block, is it safe to set can_do_io=1 for them to
> > allow this to succeed? Is there a better mechanism for handling this?
> 
> From my reading of the code, can_do_io should already be 1
> when these functions are called. It's only set to 0 just
> before we call tcg_qemu_tb_exec() and then set back to 1
> immediately after (see cpu_tb_exec()).
> 
> In general, the approach you have here looks like it's going to
> be pretty invasive and also hard to keep working right. I think
> we can come up with something a bit better.

Yes, I am hoping so.

> Specifically, the filtering criteria effectively only change
> when we change exception level, right? (since you can only
> change security state as part of an exception level change).
> We already have a mechanism for getting a callback when the EL
> changes -- arm_register_el_change_hook(). (We would need to
> upgrade it to support more than one hook function.)
> 
> You still need to get the io-count handling right, but there
> are many fewer places that need to change (just the codegen
> for calls to exception-return helpers, I think) and they already
> end the TB, so you don't have the complexity of trying to end the
> TB in places you didn't before, you just need the gen_io_start/end.

Using hooks/callbacks is clearly a better solution. I shied away from
using *el_change_hook in this patchset because A) it seemed to be marked
explicitly for GICv3 emulation, B) the one-hook limitation you
mentioned, and C) it doesn't currently provide you with which EL you're
coming from.

If everyone is amenable to changing how the hook is structured, I don't
think any of those reasons stand. My initial thought is that the best
way to fix C) is to add a pre_el_change_hook to be called at the top of
the exception_return and cpsr_write_eret helpers in
target/arm/op_helper.c to drive the first call to pmu_sync() (or
whatever I rename the first half of that pair to based on your
suggestions on that patch).

If I don't receive any additional feedback before then, I'll do my best
to adapt the existing hooks to allow for a cleaner approach to filtering
for v3.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
