Received: by 10.223.161.27 with SMTP id o27csp3947943wro;
        Tue, 31 Oct 2017 10:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TgKfjV9wW4LQ3X6qT8lnXF9r/Zcq8TsME9g6EXbzaKMMScRi90S7PRGHc2soT3seuym4BS
X-Received: by 10.129.98.9 with SMTP id w9mr1748708ywb.274.1509469651943;
        Tue, 31 Oct 2017 10:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509469651; cv=none;
        d=google.com; s=arc-20160816;
        b=0P+jR62+P1jIK6uzErHVABhPrPLQMAxNCCLQfGxePPaKzBV7HW/mkDjQXuSW23jQpN
         cSBpA+G4PNjTXF3+wMiEU1b13K92dHE4qKbY6/zAkw9EQYZtNczxEJTsoyMgHOGX/X/q
         arSFimOlB68lZEDu6dXpMVkHwoBjzUQFKIgi80+aIRg/7BNUyP5css8JKqzWlzTLUpFc
         Zw4g3x36vl44Kg2g16Uj/xXLzLZ/rJzD3W7JaRX5HDIQNN+GK01MbEo5FIVXuRXh3eXk
         59cW7NKVqsY/IFzegNscz8VDH+GXe7h1g5kKvvnAzVESLOLCshcqCyrbuoCfqr43JQqU
         AbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=RpOyvBgP6qylN5Mg4JpqaURD/KN/HkLSbSwD0/eFVu4=;
        b=Q7DoqPgyPKJriN67ChXKFbDxt7V5GURfOBrP1SYIF9/6UsZktcvuBJCyF3h9ayNM6L
         1+FVFJm4M7yexr1VxQ9lBs6sqxVeMWBC8yBJhl0WFc+2J6ZsXlrAHkYpyeA2TT6qGRuc
         k3nfSxuYprroFwLYvNvy31slf6kU08RVzZiGarOMOYHE1RpaunONmE9KXlDRexK8Cy85
         815ucEUtadgB44K3V7GR1SKWc15BO90fpHfAQYvRZem3cW2x5yPwPy7b5hZsAhNjIJIa
         jLq3Y+8ZmCzzB+SE/7udoQu1K2Yi34iPZRQsKLlCbkx0BUgSA/cQSkh10tELCTnnsIt9
         a+eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si474108yby.570.2017.10.31.10.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 10:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9a0h-0005Nw-9b
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 13:07:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9a0N-0005JR-Ik
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:07:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9a0I-0004zv-LA
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9a0I-0004zZ-DD; Tue, 31 Oct 2017 13:07:06 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3CD5A21881;
	Tue, 31 Oct 2017 17:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD5A21881
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 31 Oct 2017 10:07:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710311001380.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
	<alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
	<CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14BDCeZ2iMBH

On Tue, 31 Oct 2017, Peter Maydell wrote:
> On 30 October 2017 at 22:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Mon, 30 Oct 2017, Peter Maydell wrote:
> >> What's the specific situation/bug that you're trying to fix with
> >> this patch? You don't say in the commit message.
> >> We should be able to put in a point fix to deal with whatever it is,
> >> but it's hard to suggest what that would be without the detail
> >> of what exactly we're getting wrong. (It's the PAR format stuff,
> >> right? But which ATS instruction are you using, from which
> >> exception level, with which register width, for which stage
> >> 1 page table format and stage 1 guest register width?)
> >
> > Thank you for understanding, I am not really up for heavy refactoring
> > in QEMU right now :-)
> >
> > Yes, I am trying to fix the AT instruction, which is used by Xen for
> > address translations. Xen always runs at EL2. do_ats_write takes the
> > wrong path because extended_addresses_enabled assumes EL1.
> >
> > To go more into details, virt_to_maddr translates a Xen virtual address
> > into a physical address. Xen implements virt_to_maddr as:
> >
> >   static inline paddr_t __virt_to_maddr(vaddr_t va)
> >   {
> >       uint64_t par = va_to_par(va);
> >       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
> >   }
> >
> > Where va_to_par is:
> >
> >   #define ATS1HR          p15,4,c7,c8,0   /* Address Translation Stage 1 Hyp. Read */
> >   static inline uint64_t __va_to_par(vaddr_t va)
> >   {
> >       uint64_t par, tmp;
> >       tmp = READ_CP64(PAR);
> >       WRITE_CP32(va, ATS1HR);
> >       isb(); /* Ensure result is available. */
> >       par = READ_CP64(PAR);
> >       WRITE_CP64(tmp, PAR);
> >       return par;
> >   }
> >
> > This is what breaks Xen 64-bit booting on qemu-system-aarch64.
> 
> I'm confused. You say this is 64-bit booting, but the code you quote
> here looks like it's doing 32-bit cp15 accesses, not 64-bit mrs/msr
> sysreg accesses.
> 
> We definitely don't support 32-bit Hyp mode right now.
> 
> Could you please answer all of:
> >> which ATS instruction are you using, from which
> >> exception level, with which register width, for which stage
> >> 1 page table format and stage 1 guest register width?)

Sorry Peter, I copy/pasted the values from arm32/page.h instead of
arm64/page.h in Xen :-/

Xen is running at EL2, 64-bit (aarch64). The ATS instruction is "at
s1e2r", used to translate Xen virtual addresses into physical addresses.
This is what breaks.
