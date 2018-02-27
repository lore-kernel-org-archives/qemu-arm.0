Received: by 10.28.71.27 with SMTP id u27csp4956659wma;
        Tue, 27 Feb 2018 07:38:25 -0800 (PST)
X-Google-Smtp-Source: AG47ELsxPvAydXQibVBe3qfGHSJLERF+2Rrzi3u0SoiFVlo4xbAU8ZwUpOKT0Rg0Xz7I8J4X5pCk
X-Received: by 2002:a25:ddc3:: with SMTP id u186-v6mr10033648ybg.492.1519745905613;
        Tue, 27 Feb 2018 07:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745905; cv=none;
        d=google.com; s=arc-20160816;
        b=s9jxj3+sEoh9Al93dVAC1StZn8k8JakuDVPHK4scoW6Tys1KIWBhVffmzSQKBbGdrq
         WzK/0EzRAenNmVeo1UaUifhl8Gw2kOAnCNz6txq8xWGxLxv6wYODLS5/vXV332rKzfMC
         mG5UwkSSeKWep/pP9oZwqq5LsB3RLd58kAScMz0DDrLaOC6AOg0zytPj4Lu0HkxFwtPX
         Q1mvWBBk7hh9+ioCtWqmDLVlz5J/aYBCYS0Os25g0ZZwlzWQuOxxmffPQINCM4HeYTZ3
         UgklngB4PT88XI3C1r60XVZdV3txxgM84nsCVy80MW4ye8t7BOB0wOTZrvZ/1ZfHhyWd
         VSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qnBv/5iI90731ZXjIXSLxmvsHH7ONc7Givw/68g3B6c=;
        b=CdhC41f4rKUtKrv9QeqLpGWmY6/0JzgUIQbc3LF4CAYuaOxUsmFcjT2LTtn73g8tNa
         FcyL7REm1/jA3q8aYJn3+IwrP81xoRGBrCXIro77hESkU2EjDWyOOZTHPLsD/TOBrX1+
         +lIwYYj79MiemQj8+oadzsLrO/otaCpyL9AZzJj0P7kNYupo/pYaDJ8iVrQCv/G9uIar
         iQ8gdFoNC1vY835fpo97lAqrkyTiJeTpZsiazZGu09n4lFnWVfmqq59aNPgSMomSItuJ
         DE0jjV088AM+d2txX4gjuaA1xn7rQ2SOETcNBaFM7pM+pWAjLyNa8usVHvYLNcWpeeUg
         wrYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GR1cweek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10-v6si1084484ybk.413.2018.02.27.07.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GR1cweek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhKj-0006Nz-2B
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:38:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhJM-0005Ta-7M
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhJL-0000xv-FS
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:37:00 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhJL-0000xL-AB
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:36:59 -0500
Received: by mail-ot0-x241.google.com with SMTP id w2so1583086otg.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qnBv/5iI90731ZXjIXSLxmvsHH7ONc7Givw/68g3B6c=;
	b=GR1cweek6QDB7uDIdT2hykHYVCy7BhlupubNuJVBGMTbGOpQkQYNmdGqXMoMAjRZKi
	zHX5v6W5xV3pTYrm+xAQbsQd9zjfOeo7+TgouSSClTcNTFXCKh1LvyeYSG1DIkXCuE3C
	VHfxOAW1PrR+RUCS3IFcQwFql+Ozzod1Z9QNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qnBv/5iI90731ZXjIXSLxmvsHH7ONc7Givw/68g3B6c=;
	b=qoQXmxzG0szbV5vJHvMRt25KJ37ERvlZR7yozh3f1fNPgUNhadIB5KtTE/MJkYP92f
	VoKb2FxuQomzWgwtjERolCNQyKcxqTEx7ZbkD2b6J1+uNW1UANm7XWDxjdWY9/UZkmpK
	jCsRuzN9xOHdJcCdUdwIgslP60jivpvfidgBHDb6UcDwEsz6EFSbVHa0HqZrSLq3ud5j
	UxlRHzjkF/gERpDpukbJT4z2z1jF3sq3WfLauXxnIwdYzfbxhqozbgoQFQ62TCrZzJD5
	Ia1dF5FTypmiXSuPSXi8Foug6hpVbyVlL8hHyYeiZxEVGKGHfVNmCXTnNKYokg1nuHr+
	et8A==
X-Gm-Message-State: APf1xPCArl0WQgsAFc9QCRNyWvzhQ/vhdDqhzM44ticqjiLVTQDw4ksr
	LTcz6zTY+sfNSTNiZRwJM8X+GMBwe0xsQd4gh2hpLQ==
X-Received: by 10.157.72.231 with SMTP id a36mr10892710otj.308.1519745818507; 
	Tue, 27 Feb 2018 07:36:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:36:38 -0800 (PST)
In-Reply-To: <20180217182323.25885-66-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:36:38 +0000
Message-ID: <CAFEAcA_1hmX9Rr7hLwCXAwrFg_CUSsNPsrAaESKF7JXNo2OqFA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v2 65/67] target/arm: Implement SVE
 floating-point convert to integer
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HwbXoyH1ykg8

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 30 ++++++++++++++++++++
>  target/arm/sve_helper.c    | 16 +++++++++++
>  target/arm/translate-sve.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 16 +++++++++++
>  4 files changed, 132 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
