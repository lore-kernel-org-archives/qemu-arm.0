Received: by 10.223.161.27 with SMTP id o27csp4008706wro;
        Tue, 31 Oct 2017 11:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T4FgLMvMgXyTM/ZGl43NHOR/SsPZAPkB/Cb16jzjY/hb3FJLv9LRkHqaUMgjnxTa/+igSZ
X-Received: by 10.37.201.5 with SMTP id z5mr1843482ybf.297.1509473335309;
        Tue, 31 Oct 2017 11:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509473335; cv=none;
        d=google.com; s=arc-20160816;
        b=OABKLXk4oyWlB6i5Dl5i+f9tPnRMVFUBUkpy2QwbeRvVCCmIoBz8zoPll7N9dzYRyI
         5UB4n1cD2CSnQHNsAyWwDty7ouNy3VI7n8Ghp8tJnuC/wXP7uTbqVg3eIVc4f6KlxhKA
         tuijGWeI2qqyjVeZD6oWvK3ppSer9I4b5ErVKpZk2sZo9pDflGxD6Lt9UyGNjJeDGSAX
         TL98lznI2aMWURd3oLzlTlOI7LCpoM/sYRSQS8OuK9cSYCQD0BR1q8zvVY8QHKqgZufR
         yh3ec/4I2VRYbJqOYAgyMe2iwWnbYi2XNFwOYlqWfETJIuU256ypncq7LX9TzJV6ER0k
         OSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=vXEgb/91n8yDwjmcBB0cIggIEoPEYJAkjTmHPm8brkU=;
        b=Voro84585sTd5exTkDeuLeMWcHu54se+UMqRWN75ZJ8HpMbZocEY6lMO8uCGaRm6h3
         q06SXrWAcK++rG03b98xdet9vb366mgC4pDKS1ikCNlZT1mtbi456CplPO/PoTgVXln9
         sXiFsIh26Yzo0D1HA+1H/Ac3O+e2opqXbnIlTnrbbxh8IZZUmtAdO29eDiYhBXd72lRM
         f6bmZt27SoHbrELSfEH9fUWo7yyq+CZy58yyNoMCJr5UDBvMMtorcE2Sl6r11qID49DQ
         m4z0Ahg4o1T+6VT80MgTx6Qt/AkXW6Vyru39EZtcV0hlOxc60HfRqRGyXjVmLFH/q9BW
         Hb7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20si516870ybk.748.2017.10.31.11.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 11:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9ay6-0000Oi-Ox
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 14:08:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9axx-0000OW-VO
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 14:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9axt-0004T9-WC
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 14:08:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9axt-0004St-Pv; Tue, 31 Oct 2017 14:08:41 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 699C521903;
	Tue, 31 Oct 2017 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 699C521903
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 31 Oct 2017 11:08:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA91kisKT_wCj8swwJzUn52YycpigpGwv9Djsc-Q1Sq2SQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710311035560.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
	<alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
	<CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
	<alpine.DEB.2.10.1710311001380.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA91kisKT_wCj8swwJzUn52YycpigpGwv9Djsc-Q1Sq2SQ@mail.gmail.com>
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
X-TUID: kTTTEtIqfoLl

On Tue, 31 Oct 2017, Peter Maydell wrote:
> On 31 October 2017 at 17:07, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > Sorry Peter, I copy/pasted the values from arm32/page.h instead of
> > arm64/page.h in Xen :-/
> >
> > Xen is running at EL2, 64-bit (aarch64). The ATS instruction is "at
> > s1e2r", used to translate Xen virtual addresses into physical addresses.
> > This is what breaks.
> 
> Thanks. OK, so if we change the line in do_ats_write() from
>      if (extended_addresses_enabled(env)) {
> to
>      if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
> 
> does that fix your problem?

Yes, it does! Thank you! Are you going to submit a patch?
