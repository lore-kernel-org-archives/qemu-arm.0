Received: by 10.28.71.155 with SMTP id m27csp2280112wmi;
        Thu, 12 Apr 2018 12:34:24 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48PwN2iHc8JdBb/OvmrjyuqUFdeFP+OQEAt8iRqlKv6umiHxdqAOdJnte1vgg76Bf0U6MLA
X-Received: by 10.129.118.81 with SMTP id j17mr1393406ywk.456.1523561664461;
        Thu, 12 Apr 2018 12:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523561664; cv=none;
        d=google.com; s=arc-20160816;
        b=Ro2rFCwEylGaamCxSFKuOqUlm+2FGANXgiF8vXsgPWDMWDSGclAcN8T8OH8M0+DhPU
         Xf+e1VbGMTXnlKah7uMW/JDivyQuaYtFLwtZAuRKI9pc+0xC5my8tSzBVczIGHT1uDnK
         iJjpcfbWXzcjf2EJWcsSWD6UWfaacZWbaWwpFNZpXFBOvKyCtqIQLt1N4wZwqjG+7z8h
         mNAY44C4tDygAaPNVaJtbrSxVmnbAm2pxwfgbyfv+/rid9A1oNrC0PNedlc4RT5J4nQD
         t0KqVplEkuYow8dgdrNWI/EXehpGXWlgZ45rJ2NzxF+oEan0rhnvltqOy7SaL/kWjm40
         ZnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=C1dqucLE5/PGshB8X2Kfh0e05YW+3vim7uc4V5E9a2s=;
        b=a1meOKOfYy2nXLaOyCZu9fz1PPJs5NYlIPPXYIxd0fyh+2ZGA8ZIUcabO3eu8/Zntp
         tYKhZRBtPJJd/eQVagAEze5R9qHRc4YWsGVHc0849/eF4j0yJL0q71DJFor5Kg0e2Eq4
         EULHbyD7OrrBjf6rx+AQf10NS201ZEFSK5AJCPYFQMcYFuNuS2wVv1TO8AzHtsZPBxe9
         vqi+SoMf9unV28zk/TMZbPwZhTLjsXVST+2nOuUdQEW9a0lYvGBgfbF2qRepaYjlLjIN
         isZRTHBbd0+TkkmQZeM6QQCdcOk8tMrgLRBSkGeWrLhFwgqwo03paAXu1b3F4qDkZOIn
         oKzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ahoMlGMh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=VQA6r/Zh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si4475716qke.181.2018.04.12.12.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 12:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ahoMlGMh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=VQA6r/Zh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6hzD-0001GB-U8
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 15:34:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6hz0-0001Fi-Rs
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 15:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6hyx-0003B4-OE
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 15:34:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6hyx-0003Ag-Fa; Thu, 12 Apr 2018 15:34:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 452F960F72; Thu, 12 Apr 2018 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523561646;
	bh=ykPfImhwfU5k/zJIivMbV4nCUDDNd1r2Shol+VIaT58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahoMlGMh2tSI5VmHFWB8gYaeIDDaafI6BwH8nY4yFvoKxBhEydDn+BsXPdX4QbqH+
	Bb9A+4Ot48S16Fmb/1IAtDK4ydfas+iklWHPxfoKpmZZaz7222R0MqM88ropSTgxru
	xS0IJl7McVY64Kpomi+BETOTS7PRo/Qoetmg4whI=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id BF3F960274;
	Thu, 12 Apr 2018 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523561645;
	bh=ykPfImhwfU5k/zJIivMbV4nCUDDNd1r2Shol+VIaT58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQA6r/ZhjyluyMSNdtTjlrXs8y+H7IIKU2hrcjuUzHaSuMXffkH7wpreZ1E+emEWk
	DyO+OyCmPr6fBl6CTcdrMpDPrV1RTWdI6ZhynpTwJ0xkQv7IOv8TmY8bwG/e9N2cJW
	9CVs73dGim/f8cwW8VzCpC2O/Yown+Awxk/cfL5M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF3F960274
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 12 Apr 2018 15:34:02 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180412193402.GL24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8G-WD2U4+NUzWYk_gwM51-mmDNj6o9CeeAjW+USSW=uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8G-WD2U4+NUzWYk_gwM51-mmDNj6o9CeeAjW+USSW=uw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 00/22] More fully implement ARM PMUv3
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
X-TUID: YHX9xuli6H7F

On Apr 12 18:32, Peter Maydell wrote:
> On 16 March 2018 at 20:30, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > The ARM PMU implementation currently contains a basic cycle counter, but it is
> > often useful to gather counts of other events and filter them based on
> > execution mode. These patches flesh out the implementations of various PMU
> > registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> > represent arbitrary counter types, implement mode filtering, and add
> > instruction, cycle, and software increment events.
> 
> Hi; sorry it's taken me a while to get to this (I've been focusing
> on for-2.12 work). I've now reviewed most of the patches in this
> set. My suggestion is that you fix the stuff I've commented on
> and send out a v4, and then I can take some of the patches from
> the start of that into target-arm.next, and I'll review the tail
> end of the set then.

Thanks for the review! I'll see if I can get a v4 out late this week or
early next.

I'll make a note of this when I send it out, but one thing to look out
for in the next version is that I had to reorganize a few things to make
the interrupt-on-overflow functionality work better. I think the changes
are fairly minor and limited to the later patches, with the possible
exception of using two variables per counter (because you have to know
what the previous counter value was in addition to the current value to
know if you've overflowed since your last check).

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
