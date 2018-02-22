Received: by 10.28.71.27 with SMTP id u27csp2254363wma;
        Thu, 22 Feb 2018 10:05:25 -0800 (PST)
X-Google-Smtp-Source: AH8x227R0pS1l8IkDLsasRYnnSA9c4smTbtrMKy6dWnpEI1w6+uE8COqa+rFDzxN5JGPeBqE63t2
X-Received: by 10.13.222.134 with SMTP id h128mr5322119ywe.445.1519322725695;
        Thu, 22 Feb 2018 10:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519322725; cv=none;
        d=google.com; s=arc-20160816;
        b=mFzC12G5ufypkcJDDPn3MD2I7Jlv8u/Jc1jdMWmxB7s9iHjoVg7cEIt6m/a6r3LH+m
         YYPREHSrI3yhs5uULY/r0qEgZhZjctNxX2Yq+8ddn3SGljEqBhQLot/aytOCzTp426Ii
         DQsJqfHxRyBfOv0MtKVSFlidk2ehcBmG9bGXNw5U+YjBQ5HKuu+geKwx9rjQeEmLSbEk
         /sI+y97cuUXwkDuH2avejFm8s98c+crM/W+1GpJB8CXAPR5/LDiqYtrOEBBDTLyrJBzn
         iWrECS4QKnJdcnt+o0GxAu6SBYUT4oUlqXvL3TNVsw1gHG8MQWhVU8zgnEOmheGnIsZo
         LAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q1MqiSVbGXzSwruITnsJtHDF4M81ERq4rXgjl/ODN7I=;
        b=dlZ6AupuiuBjAcBxw3RuNaLEqgTL+v+1i2bba2Ut5rJs0Ta9UIgx94fY93n27zpK0o
         Un72YU0nADazOfrukE6eoUIhf0oCTHV3wrkf6LHrXTXNw86UNaXuTjhNXC4eIy3V7HcW
         VLEFfQoZuvF28UTwYDhkGrfqK19LhuKUrh/K8klt6pCDajZNuKLQ9m9uLG1X4RXsbvkd
         cB19Q1dP29WY7qWdIpNKYz1rCHai5iuRoVM/RGHgyU66biGW45VbZU+1fYe4rZmgjjMY
         XxbGJnvWG1si/wddLZtL/eNTABhJYHuCxsGCxjd1RH2g6OCDYVw0AanAdwpxBxpRp1z6
         qm5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHr5z7/u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b198si95940ywa.326.2018.02.22.10.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 10:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHr5z7/u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eovFF-0007W1-62
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 13:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovF2-0007R3-3q
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:05:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovF1-0003pZ-8D
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:05:12 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eovF1-0003ol-32
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:05:11 -0500
Received: by mail-oi0-x244.google.com with SMTP id u6so4345945oiv.9
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q1MqiSVbGXzSwruITnsJtHDF4M81ERq4rXgjl/ODN7I=;
	b=MHr5z7/uAXdbvZR6wHm8Ql1xMY4vwwEAusgYIaWnVXL1hQIAcINucvO7x6RNJOQ+Ux
	pKR1RkY0d06heZLWOB6SWhaOYEW8tP30Bdd/0e+qjf4XNe9Uj0waEPdaDanyut5SSS7F
	OsQQhmvUXAffE6BK4t8SN1Dl+6P9x2fJRzn88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q1MqiSVbGXzSwruITnsJtHDF4M81ERq4rXgjl/ODN7I=;
	b=CBckLDW8r/q7dJNGF/0ElXcZQc2A2PI6ML4ckZfcJNDk3BsvE+IbLFsIg6WChbWG9J
	oUq8gTjwmSKDgFTjilUil7GccXXQ4pve1BnNjbaIsaaemekffac2Mssrmlet0TZOh6Nd
	dQLueZvT591ZvRGTK06VLPTzLH+xQIo8Fa1XJCuk5sI1sdNLUdl9L2WDZuIVkTKWdJFU
	VlWwrJFn+SwOiR6CCWjpKq6lkNNi9XArQLe0HE3Ory5Wc20YXPFIpHMC0Yp873S1Opfj
	Ix6RGZ2JBndx7Huw5C1lg9RWnZDQBtLWJ4o7ni/eA7E+D81VNw9WREW5fKAlWeXB+B48
	BvUg==
X-Gm-Message-State: APf1xPAA8BsWm35iEgpqSf9M9Ve8YLwXsFDgySkZdagh+azK4lhZidlY
	npOZ9yk5uQUY+OifVi4ds2rnOUkyaDWB5Su0yLPOk4B/
X-Received: by 10.202.177.136 with SMTP id a130mr5222055oif.252.1519322710374; 
	Thu, 22 Feb 2018 10:05:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 10:04:50 -0800 (PST)
In-Reply-To: <20180217182323.25885-5-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 18:04:50 +0000
Message-ID: <CAFEAcA9Xy8z85KRuVUFLJtEwpUgu+cHGYe_A6ymxurWZL-N+RQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 04/67] target/arm: Implement SVE Bitwise
 Logical - Unpredicated Group
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
X-TUID: 2pIkduSUuEmk

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> These were the instructions that were stubbed out when
> introducing the decode skeleton.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 50 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 2c9e4733cb..50cf2a1fdd 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -32,6 +32,10 @@
>  #include "trace-tcg.h"
>  #include "translate-a64.h"
>
> +typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
> +typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
> +                        uint32_t, uint32_t, uint32_t);

I see we already have these in translate-a64.c -- put them in
translate-a64.h ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
