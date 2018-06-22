Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1279591wrq;
        Fri, 22 Jun 2018 14:13:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJMh2loEYzAgq9UDUboxkovvkCHWeDy9UJ4Y/4qtBrxB39Qt2xW4pNl6nQO8aYHkbWTT+vK
X-Received: by 2002:aed:3025:: with SMTP id 34-v6mr2923713qte.182.1529702037481;
        Fri, 22 Jun 2018 14:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529702037; cv=none;
        d=google.com; s=arc-20160816;
        b=KIlzOqy2qdHWhHx2V2rG+8Be15ip08g5SL5xMtILJnNQaUEB4NAg+fP/IP+TOX0YuV
         +/h2Id3+WR0/BvIF5XC+ecLkX7APIfm6qufEk8VuF1Ma03XX2fB7mEkTCE93Vs6EFafY
         tSbVjXguyXtOGC+w28ewgJnVl5fDV9KGlXrG7h4uiQFNG6UydPQlOzoe3BYW0Z8YeKFD
         nah19A83K4bQMdIxOEct3vpZ3DeTAiNF4z9CFKp9jFuaoA5T0ZtjTvvXT8AwKd3BFdzx
         MfeCtqIVnqjPYQg26LIdYb7tpPeLvZ02d7LKBajRf+CiqWXqSp7LyzMG29Gh0Nw60cug
         uvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=pAonXuwlGeLITCqBRlwerrIszJkDvczbw2dcWQVEqro=;
        b=r2EUdspHJ+/F81rVvGi0osrMQ7l61OX1w6Ll3snGmqQ7Ept7slXDMyxo+hyCZ5yLIz
         pHgaEjmqCY1WU7Vo86GLw94BOnpBL+kKSiskziIpT2unrFNAnq7CiDvWGRudLJfNvAnE
         mbGSxYs53r1RJO54nbp5+KgbyqE09aAMQ2lVgs8FICM8Voh85Sj8YMETrOutuHokBWt0
         DS/XWHwVVaePiGVkP6+U0t36BBtqkQf40DdpGJtkRV/3n2HgN/TLwkXE1+8EBtoXo/i7
         0vnqRmIefwe8M+/auUjysZJowP76HwmV47gh+L3M47v2yWPmiU8x5aEkkh0oRda6BPCL
         lJPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=D1BLvLP0;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=UTVOrq2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7-v6si3564823qvi.12.2018.06.22.14.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 14:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=D1BLvLP0;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=UTVOrq2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWTNV-00051Y-1N
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 17:13:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWTNL-00050e-7l
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 17:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWTNG-0001iD-8S
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 17:13:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41491)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fWTNG-0001i1-3Q; Fri, 22 Jun 2018 17:13:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D005520F29;
	Fri, 22 Jun 2018 17:13:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Fri, 22 Jun 2018 17:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=pAonXuwlGeLITCqBRlwerrIszJkDvczbw2dcWQVEqro=; b=D1BLv
	LP0f05emRgXCZR8xJWJ84f9ls3qwA2egUtqiEJ6hsNrqETuV0W/Wd7+kkscqdHAQ
	vxZzcxdrpsvudo7X6CWjH5HHC1i+SrWnd2W+arzLia554jG06pMqGakRKrcxsA0Z
	fb2vSB0A1uEz9QwNvg1ILlXtmR/DzTEnDZD7Ok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=pAonXuwlGeLITCqBRlwerrIszJkDv
	czbw2dcWQVEqro=; b=UTVOrq2JYlAWQIarvQzyiZQG29ZQOYXQw7Pi1npZl57At
	rFcLuvp+cZ8GjCbEyrWC9X3MXxEiadCAqD9+nK+/4rAv2QIMj4YE8ip0zl5n+L/l
	wOtQbVvq7rK/rkkQ7G/4DSx/kzMEMon0HiZJdS5QA966CLmydxh8b715ujgIqDXU
	X4s2SaDHIk5wK3T3DOWPRk15rn5J/9toAA3PoP5BIfGWeoJ32IjTpbRlsJmUnw69
	9VGCPcnnsKl1l16rFCBb/DvZIBCsdyAHQA+5Qe8fj980Q4uQ+qImEfTvx67rXVS3
	EGeyCub10u5RrgddHaKNqQ7sfpZQFFEDRpiil42vg==
X-ME-Proxy: <xmx:hWYtW4CmdwSWHIRQ4UGXwzkNveZvkRyW8p5EGDX86WxyLUmi3lJriQ>
	<xmx:hWYtW1cDuXPqt9_xACRbYXNqvsOh9LiuV-Ud4orVRxeYzbF9CHC0pQ>
	<xmx:hWYtW6kMAxN2-f0VEL5Q39FcV1cCSSvnPPAeiIMJwPAYG6miV1b0bQ>
	<xmx:hWYtW0E-Rg7UMgKzcGEX6lQAhZQooRvGOCXrrpaN5LonJuZOo3EHeA>
	<xmx:hWYtW67DBt1mvsABuw1uFzgtfZA9oiZ-ojU_OkVhE80YmB-EY_BBJQ>
	<xmx:hWYtW7tPAtIKAR0QTmYaZMRKmAEFzGYcs-l-0CvXU2Pw_E0cP1297g>
X-ME-Sender: <xms:hWYtWz3APt-_AKr9KVduFjP4NJPO4OezwGu3ZZYk1A3MpvpFBDhqSQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 84C1EE446F;
	Fri, 22 Jun 2018 17:13:41 -0400 (EDT)
Date: Fri, 22 Jun 2018 17:13:41 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20180622211341.GB11346@flamenco>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
	<20180621173635.21537-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621173635.21537-3-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 2/2] linux-user: Use pthread_rwlock_t for
 mmap_rd/wrlock
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5NpLSqm8sgpw

On Thu, Jun 21, 2018 at 07:36:35 -1000, Richard Henderson wrote:
>  void mmap_wrlock(void)
>  {
> -    mmap_lock_internal();
> +    if (likely(mmap_lock_held == 0)) {
> +        pthread_rwlock_rdlock(&mmap_rwlock);

s/rwlock_rdlock/rwlock_wrlock/

		E.
