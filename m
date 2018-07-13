Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp887530wrq;
        Fri, 13 Jul 2018 09:41:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdpppjyecmc4QGpBaDmkX/TBiWpBZEICnmEgGbwGdUGhL2i/7bgPijMIyY/TfgjjnFQd1gt
X-Received: by 2002:a0c:99ec:: with SMTP id y44-v6mr7892263qve.226.1531500097295;
        Fri, 13 Jul 2018 09:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531500097; cv=none;
        d=google.com; s=arc-20160816;
        b=MsOMK4K9ClHqm84Fx5roV7Fsu+qEw/754gWWTA3nGHoVksvCXfEIbg8QNdBSpOhfQf
         nalt4a6n3VowSNHwux80bPGVRQF9YEjFgq0Ztb/HUOyHaonLABn2EzL7/RwkjNMY0N7r
         cRoeVQ9/spgC7DQ2umcNf3znL+Pz3UbhSQeb4Fa0Mmx0oIHsMfj99f/zlkjqebWLZ/cW
         MPpg1hyS/ufHGv/LzPcWj/Col1blBcyq34JJiTGFmIVoHMs8vHyYXDUyRYBBiE/a/kkx
         Lhh1/9Hwpc8IoXiLUpSsnf0/5aX7HhcI+ikThXUWpzZ6s22HeGywrAD2D5lGpEA2oDy3
         ZmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=NPUnUf8vzaOqNP2/D+ymEXWvWK3leXjTQ+1ZzzhEEFE=;
        b=Aev3EV9OZLttqmbOXCsg+00l/rIi9//M8mMe5UIXZO0lZqY4SlawGI68glQ8MXP7tC
         XA9SytmjMNeq0U+bB3iWzLtYLxDmr8j6WO/Y3/0ghd1VQMRxEl7KZYG5lp11i0ebyyxc
         Vn79wG97QnzmcOcOaQIqxXHpbAhiCGeGCd9JhehVbpav8am1Y4AwAxlc6GOXkeD34EEE
         945aZ5d1kvevr2FEx0H7Lguiv7rksAlPznlScwcJr/qm9ZVcSsfQgQQ2KWnUQr3yrU6b
         aj4r7JpKcUeBOi5ap+sdYie7+bMG21mDyZad7LQHoB5Ge+vLgDQXpmHbzKfWDNXcMQ7J
         uNRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="US4zj/Xu";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=m410bY7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si315499qvo.110.2018.07.13.09.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 09:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="US4zj/Xu";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=m410bY7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe18S-0000SG-QK
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 12:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fe18L-0000SA-3F
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 12:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fe18H-0003qi-4c
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 12:41:29 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:32891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fe18G-0003pY-T4; Fri, 13 Jul 2018 12:41:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id ACF8C23E35;
	Fri, 13 Jul 2018 12:41:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Fri, 13 Jul 2018 12:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=NPUnUf8vzaOqNP2/D+ymEXWvWK3leXjTQ+1ZzzhEEFE=; b=US4zj
	/XuG3DSLFtZJ/TcK/9Xha9Pgxpp3CkMalRMKh99cdji/BPLYKGMHRezB0mH+xfbL
	Pf7OWfQJBFuxLFOJSLjT/pNXLkBas+zdVwjkuaflir0mlgSBhwoHM2pz3WlTsnc2
	JIUYruF2kukGxOTddWmWr+J//bMy8ohf/3zCK4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=NPUnUf8vzaOqNP2/D+ymEXWvWK3le
	XjTQ+1ZzzhEEFE=; b=m410bY7fYPCmbhiggas5uqlaJqcc1rYObImIhHxxLXMkI
	plIjRb69GxGXcgTw9JmCHXH+icYXGydGpFwhJs8xAANJcWjRHRB9oevDWhDmJ8pU
	VjRDIArOouGLnEKDKigGCCYvPMmIC0hG64wxzWqschbxkbbckYijcidldMiz0lpC
	oOu0qym3RWczcB2VAoIheI4MjhY9Tdpw6VbQ5JTWGAX1VqTnmOJSN4Q3UHUgKiDS
	MljPFv58bYANpG2BJB5QvEpOGGZG8GOcsv8Q+GJky6OTTC4wIUePY3Mab3xvOwNe
	PWdtP/kfF6oVHz9Qb3PLO1WC95YxTrkM4wlbCEHaA==
X-ME-Proxy: <xmx:MtZIW2EYDUVjtrctfTrcNZIJnLguQaL4VMTTlTzakX2qUVfWETmWeg>
	<xmx:MtZIW_o9qYEZHoRkH7dFGA9vWGAqwCWK-xb5h8ISD-CdXTs0M5GMnQ>
	<xmx:MtZIW6KGnLR9rUdVOWL7LDpKFV6ztjCxGXCiCNop9K1hB6HaCC5ODw>
	<xmx:MtZIW97IWjq9SEqO7H7AmxMQZsPRHuhfW_iYdIGVHmBA8_SA6qEdxQ>
	<xmx:MtZIW-QvaKygsGToRDIwqIZwI8moEZBTfvBoPnPon0I11PhCItTdzw>
	<xmx:MtZIWy1U5l8CFUsWNgz2t6623ZmxkNiLg7kwe-jsNDqr7o8AbiMAGA>
X-ME-Sender: <xms:MtZIWwD44vbvvYuGtl4pYmK8mpvRKALqJoRpwx8LXPDgYwZt15ar7A>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id CF5D51026A;
	Fri, 13 Jul 2018 12:41:21 -0400 (EDT)
Date: Fri, 13 Jul 2018 12:41:21 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180713164121.GA22074@flamenco>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710160013.26559-5-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 4/6] accel/tcg: tb_gen_code(): Create
 single-insn TB for execution from non-RAM
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
Cc: patches@linaro.org, qemu-devel@nongnu.org,
	KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WeY3IOLja3PM

On Tue, Jul 10, 2018 at 17:00:11 +0100, Peter Maydell wrote:
> If get_page_addr_code() returns -1, this indicates that there is no RAM
> page we can read a full TB from. Instead we must create a TB which
> contains a single instruction and which we do not cache, so it is
> executed only once.
> 
> Since this means we can now have TBs which are not in any page list,
> we also need to make tb_phys_invalidate() handle them (by not trying
> to remove them from a nonexistent page list).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		Emilio
