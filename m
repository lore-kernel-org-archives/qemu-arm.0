Received: by 10.223.161.27 with SMTP id o27csp2498236wro;
        Thu, 2 Nov 2017 12:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QWAplZ3YIOFu5wZ5FUGgDnoLcUdUxMhoJwaZmka2Q4/ZKuBfo4xval2WZrnQOZ/7eNNscV
X-Received: by 10.129.96.87 with SMTP id u84mr3245690ywb.329.1509652396395;
        Thu, 02 Nov 2017 12:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509652396; cv=none;
        d=google.com; s=arc-20160816;
        b=NJhit9mxNk65ZNF1kHQWXX3/QJrG7msd+4nhN6CroIfC2ejOAGFyHgBo/WmM8KBLXw
         327W9xc7hlNo+aSlxJ9F/rHj2Ja+dmy9TUhRib0it9cgJC8z6zydOrgbuH+SpvAASs8/
         vdOo351cMbNHsij1t9DQcAys708U9FMMzAQYN8Cmzft4joLHxEOnXLcToS5MA3WbPs07
         N/EArxgMZKwQyAHsPdEpbnXnll33V1Fm8bZ5kWvHlRyWHik/tl2Jfdd2kNIEzKPFAoL8
         hzEFGWgYEZQxe7JuQzeiXl4E40PFvGZ4PyUuQ/hLXxlkAAsjFChRev7WAbIOCK6mNFnQ
         pauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=T8BM+1Xv861IZaK/1uZsc9F+XDjR8z6Os7a/X0Jf6n0=;
        b=TjSB/RcqEtAOeEspNk8Z33rHXFAg/plefjRQCtT+XwIvQXPfWDDuGF5gVFDFbqm5Jh
         N6qk1qiah7s7bJ0Ck1aPHtiHjHoWAYX2jRlT82gExxJhMg5OwMlW81G/jf/+06rSYawx
         u6X7s5MjI9NiHkMpfHdOn6qi8rDdXyGk+ynrKLg2omoB7yknaj21t+eepp9eBNKEtxAe
         fSVaSDyB8gwGWdY49dMF6iC1UFsPH2QYep6vuq2bd4jB1SJFrTzViIRYgnBnoByOKCXx
         mA7ng/w1odO2YpBuW7h4gGSBPNXnPOVWvC4tDq9B6TzNg2FbHVbW4Kne61B6Dt8RV5FH
         5xgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=LL6p6mYX;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=WCEag5DH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j128si963782ywf.334.2017.11.02.12.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 12:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=LL6p6mYX;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=WCEag5DH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eALYB-0003Ht-TS
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 15:53:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eALY5-0003Hm-F3
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 15:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eALY1-0001QO-Hq
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 15:53:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60851)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eALY1-0001OI-Ad; Thu, 02 Nov 2017 15:53:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E0AD720E50;
	Thu,  2 Nov 2017 15:53:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Thu, 02 Nov 2017 15:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=T8BM+1Xv861IZaK/1uZsc9F+XDjR8z6Os7a/X0Jf6n0=; b=LL6p6
	mYXcZ8iB2RQ2ES42lA5/jegDHn7aJvcgY4jej8WKLzTxJ3LnzBQjMaL6XBUDUuZc
	7ro5vrpr9obue4acc1cxIMJ1ewZUW//Lm2KdzCn8EmTQQEJ5ll9QWWOZzIWol4Hl
	mQCvKpH9TvGsRIYq9aetaehMaX76tv0jFPsLZM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=T8BM+1Xv861IZaK/1uZsc9F+XDjR8
	z6Os7a/X0Jf6n0=; b=WCEag5DHn1RUG7whfm71rjNbqb4d0Bn8FeufU6huU9uTw
	JDqpchTMGBfZwHEU07Yh2v3JSTU4vvhCB9QLmshC/BCNgs5ASHPicfI24hBeEJxr
	+vWaI70CoY9aHOoRWVLh+gHsaKBU3LIKTcR//s/KgN2AZboH0IC2SBg5hZN0YBzZ
	7Bu8GYmReyPK+11s+rA5wFg45nD04IW5q7TmG8vzpSpckIcPSwHWtZQuokdwah8o
	RZmBLitXJ9gUx2+kvaT/q9QvCteqPgj7VuhSzjPlUtvzHMQUNFuIFa3R0Wywyrgv
	y4NldzGtMlYCnx0XmBIXnesojO7x7JXnJF9Q5EbEw==
X-ME-Sender: <xms:n3f7WYZBH1WgltFhHEjB1isJ0X6zBGMmHMVViGJSPQq9hrkDj99xZQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7AF977FAEC;
	Thu,  2 Nov 2017 15:53:03 -0400 (EDT)
Date: Thu, 2 Nov 2017 15:53:03 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171102195303.GA25452@flamenco>
References: <20171025093535.10175-1-richard.henderson@linaro.org>
	<4ab3bd81-925c-a281-614c-2cd87fce38b5@redhat.com>
	<20171101203620.GA17963@flamenco>
	<CAFEAcA-CX90dLbR8ypEidniFmORRZ8u7Pzc3fcaKJSeF9zTK1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-CX90dLbR8ypEidniFmORRZ8u7Pzc3fcaKJSeF9zTK1A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/51] tcg queued patches
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QwiWOi8e6SHm

On Thu, Nov 02, 2017 at 13:38:07 +0000, Peter Maydell wrote:
> Maybe we should allow machine models to specify:
>  * max_cpus (the most they can support; 1 if not set by board,
>    as in current code)
>  * min_cpus (the least they can support; 1 if not set by board)
>  * default_cpus (what you get if you don't ask for something else;
>    1 if not set by board)
> 
> Then:
>  * these boards which always create a fixed number of CPUs
>    should set all three to the same thing
>  * boards which only create the CPUs requested by the user
>    can leave them unset (as today)
>  * the generic command line parsing code should stop with an
>    error message if the user sets max_cpus smaller than
>    the board's min_cpus setting or greater than the board's
>    max_cpus, or if they set -smp to less than the board's
>    min_cpus

Shouldn't we just print a warning (like we've been doing in some
boards, e.g. nuri) and upgrade smp_cpus/max_cpus to whatever value?
Changing this now could qualify as a regression.

Also, just noticed 4bd2f93 ("exynos4_boards: Silence lack
of -smp 2 warning for qtest", 2013-11-05); I don't really know how
"-smp 1" is built in qtest code, but doing as above breaks
check-qtest-aarch64.

		E.
