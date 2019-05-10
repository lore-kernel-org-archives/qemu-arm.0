Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2204846wrh;
        Fri, 10 May 2019 09:05:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUPsCU+Cw+cnarn/XH0T6k2iOwRNu5kylD9ZQYByEjHyuUq1mCl1CsqUbWhygft0kUtc5E
X-Received: by 2002:a17:906:6b01:: with SMTP id q1mr9447899ejr.34.1557504355912;
        Fri, 10 May 2019 09:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557504355; cv=none;
        d=google.com; s=arc-20160816;
        b=N52s21qDOIHLzYusvdPlhS7bETtiUFnzy4xcL/5MSnEk29DUt/5XutLuz3gcsjUbjO
         J279YbrkdbSTCgHyLfIiY+uLZP05uAeROaDDlb9eqKSiKoWM2nFZHWxQ9kFJoj07rvkB
         /PXm8dyfKwfvcas4xIrf1u6j+oks+i6Ja6gCRVKVIyFDLbnbn/L9iil0HI1kIXuBijIk
         CkvK3KouIiw108pBQ84C1IpNAmlteR5FjrV1K4khDd0SbIlPEvRZtdAXQygo1u575yX0
         f9vtju6PXkVnHSLQJxTTW+OSVHunIacHe0WLkfZk7AoaLsSgZRwJAvYrhivQMZJGDJoQ
         Kwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dy8EhEUL2zVhXDJiWFjxCwIcgr3gV584fPxJ19AkQfE=;
        b=rRlpUuYQ9rSvcqAaRx3YVUQ1TSgSY+YC4Vx8OmTDQn95J/K4Kk2SwEXJ/dra094JQc
         jyc0gPH0mtlIJgMs9d6oYblfTIzRUWzmJMSF8MWbEjgF5lGP72zVAobjh71PLthWVVAe
         +ulnJ2yFrBNaUSUS1JLjkLWwDTAHTcTPVIvJlnPBDx40m/E0xaKw+uK3lf1AWd2jlTgT
         /ib8594FFISkmtHwJPx/jqxbVfR3Rccv6HxforzI453fMHADHjWjIwz06Ji0WlxtrUgH
         Y/ZWLuH20jm95G0D6UOE0AvKc9o+2qSFzQ+G6CpMyc0nAE2t34Q9J2BvDT79vG+zY95V
         6AGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TJlQqWMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt1si3245397ejb.95.2019.05.10.09.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 09:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TJlQqWMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP81z-00065Z-0k
	for alex.bennee@linaro.org; Fri, 10 May 2019 12:05:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP7xU-00036r-FH
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP7xT-0004M9-Ha
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:01:16 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hP7xT-0004LH-9s
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:01:15 -0400
Received: by mail-ot1-x342.google.com with SMTP id r10so5296871otd.4
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dy8EhEUL2zVhXDJiWFjxCwIcgr3gV584fPxJ19AkQfE=;
	b=TJlQqWMuDb8BYcqOW6x39cfka8o0a8zS7/dVoGofIqyfy6bZm21Okfw5YbQ05kVxb/
	J6De+Tj/9hnaX8WUbxLBpZ7fvz4Hr8AxS2xwPp5iYxmNPpDOCNno29nqQwiyFgd88NkZ
	7AZJaW+3N5o51mLvvV4foxsDeashWN7qCnAu1ONBwwTCl2UUaHhf1Krht9QmCoS3Qo16
	/A5yrMoX3x0Sa4Lg3wJEXZl2rmghTWdIiBxOR+hjRB/AObuD1YY7+eem7WE4Rpxl+Xaw
	PZkpBjkqUWisw3Sf3Rnb9bQMqS+LpTZLnw9RjeBUYG5G93uqUnUlq8mzQikfnlEK0Hct
	V8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dy8EhEUL2zVhXDJiWFjxCwIcgr3gV584fPxJ19AkQfE=;
	b=Djo+KX8OQ7bsbI/7Fm9hEmIhWiQQumU/Jsj5CV0itTi8hCA0OOLbXbmabXjHfUUjng
	7I7lFf5byTTnzwjHLJONxxY21hXZZwciOBJwWh/bHhUqtPLvOe8klrrhJx9SWmT+29WC
	8X8G1P/Ar4RDk2sOyLO2Nv2te9emPLucX18JGAtoGPq/6ReitZ9isfE3rXz8vy+0uHnh
	yJjxBYeJq/Rmr/e0iCwBqLrSNsZmFalB1CYrxf5ICm7b1HQfAzhrjpEztDpUnh3V1btx
	RtS6PyY3awOTl/nW0CV9Wl2qsBxbXUZnuFihQ1/hRAVdxDfdKruQhjh98dqbJCm2jJWS
	P6UA==
X-Gm-Message-State: APjAAAWEFdU9xGHF6QQIeXOGzG6IFv8NThr1z6qRcOkAwcjiE+T/GuKz
	Ou77P1r35DJf+v3wHii5kYQOzqGhcMXn3yUp7IuXCRs66OY=
X-Received: by 2002:a9d:4793:: with SMTP id b19mr2871763otf.238.1557504074140; 
	Fri, 10 May 2019 09:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190510012458.22706-1-richard.henderson@linaro.org>
	<20190510012458.22706-23-richard.henderson@linaro.org>
In-Reply-To: <20190510012458.22706-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 17:01:03 +0100
Message-ID: <CAFEAcA9uwaev+Q=BgLBz+fgO6C7VGmw4Nxcozg2vm6TOm+LJww@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v5 22/24] target/arm: Implement ARMv8.5-RNG
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
X-TUID: lkslg4zrMb3i

On Fri, 10 May 2019 at 02:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Log errors with -d unimp, for lack of a better flag.
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/cpu64.c  |  1 +
>  target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)

> +/* We do not support re-seeding, so the two registers operate the same.  */
> +static const ARMCPRegInfo rndr_reginfo[] = {
> +    { .name = "RNDR", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> +      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 0,
> +      .access = PL0_R, .readfn = rndr_readfn },
> +    { .name = "RNDRRS", .state = ARM_CP_STATE_AA64,
> +      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> +      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
> +      .access = PL0_R, .readfn = rndr_readfn },

Don't these need to be marked ARM_CP_IO for the benefit
of -icount ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
