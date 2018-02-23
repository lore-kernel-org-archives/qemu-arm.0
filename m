Received: by 10.28.71.27 with SMTP id u27csp802573wma;
        Fri, 23 Feb 2018 08:42:14 -0800 (PST)
X-Google-Smtp-Source: AG47ELu8R8+5OEGMe9YMIsnhO3jXzubqoli2rXL2A0znoOWIsXgYJDVsEwEJHeE8TXuZoG4XV6nb
X-Received: by 10.13.254.194 with SMTP id o185mr1444909ywf.180.1519404134744;
        Fri, 23 Feb 2018 08:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519404134; cv=none;
        d=google.com; s=arc-20160816;
        b=slOJXNZCRxdENk4ItxOxjp32kg4MN2GhxVVpa1jLtAYpjAZn4GbX0Q8gLK7CknlTpd
         xmTnFXw6zicxs8aG1q7P56OFYlyaynYLvvmwsSA1A5arObRmiWUz1mFLK8MTXQmEWvOk
         KmaMpP2UXdVvRYSxFZPCVefhkHH0UWpCkpb7Yy07jagBMMOJSiIffO1cpzjT7C1suVX8
         ifqVhD6BQM+xWsSLrZ+1HLxqCDr3q0LOiwhp2cwkpfDkrfiaAv+OqVEAaFkJyRjfCBxE
         GZJYxtVS+S6ZUSNI3B4MD0bFkvCS1IbIi3nm3nR4rGHkmGW3oaGa2lOZLOlwW+ylgOT6
         VGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GqGCpX8S9ip26G9X/6vtrO03hGDZQCYoTBawy5tsVIg=;
        b=b54XDEeVioxyMiaOpUgYeEK46BQ0VUw6Z2wYxzLahetxJM7mMzQxXiJjIA8F0aVBJs
         zuY/hYQys6nzCFsd2WqxqQqElvMk0bxqcZ79Cn7oEuwrHrop5cTnw60Lp7swi28p8VLj
         T9aKGme7lUHjpLn+Yu7pkI9TAgx7i09P7IbRopesq6sjh9ArHxWeYp10ISBf6D+q/WhF
         6Y8UjO2b1Y2opjzNM+xE5M7EOEJhDSYdBUIy9sm/HKy3/msbuEcHIimMNny38hRbQoIh
         uvIMSOD5a4fXy8YXudaZ0DJAdCpu4DrFZCg3roOXGlVuj3HaD6EL4fqXEHfKjReJSXBz
         16Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXbWrU5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67-v6si464549ybb.384.2018.02.23.08.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXbWrU5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGQI-0007JV-76
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGQ8-0007I6-DS
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGQ7-0002Zm-JH
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:42:04 -0500
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:42597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGQ7-0002YM-CL
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:42:03 -0500
Received: by mail-pf0-x235.google.com with SMTP id t15so3719871pfh.9
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GqGCpX8S9ip26G9X/6vtrO03hGDZQCYoTBawy5tsVIg=;
	b=iXbWrU5pMvLKbnjvO7KX0+f19aBAI41poH0h7HT4FMXDKhpYjWDrg1dEhzTG6Q8YOm
	dtHuE5Nn9L7/lXTvb6k+mOGhI3UtaZY46KKGoIQ8LmtTU1dO3QPcXnLsFFQFPVDJQpUf
	myEtGFQzAj9CtO+vL6BziBlgMMz5pHGD7OaHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GqGCpX8S9ip26G9X/6vtrO03hGDZQCYoTBawy5tsVIg=;
	b=Jn8Gx+2nKvvbM6nnpb8d2VIvf+18Tu5U9R7A0Yu4OV39bcyr4uTB+URBc3qYtcaIcf
	QhDxf82+ZS90IF8qlu5cfmMNdHxE+Ui8KgEZqKX4EsxnzY0rqjTwJJnbU2qoEFLyKq7U
	T6Q5ZBfu2Cnd6cXTAc4bBav8Soq+dpOuXpeiNc5h3zAV8OxEcogk19aowdkqDqx/MxDD
	acmb6JsgPkc6pROQmm+0tTU51Fer2srTutOR7NO+NhRo2HBArjmDriBULKOL9z15HPma
	D97u/aDBM3V4tQi03VoEZnIszW6wHLafp6tGWIz5ADBD+pzVUiou8B7r0O4slnpvdYDN
	Yu6g==
X-Gm-Message-State: APf1xPCqCg4cJgAN6W3wA8Qpd45q0jxZ6EyVSMzv2YPzS76GbOOZF8dA
	SGg5qMYVqF1dZU8t9GXlTJI5Hw9I/Tj8tvOXePBFXw==
X-Received: by 10.99.120.13 with SMTP id t13mr1921754pgc.35.1519404122292;
	Fri, 23 Feb 2018 08:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:41:31 -0800 (PST)
In-Reply-To: <20180217182323.25885-39-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:41:31 +0000
Message-ID: <CAFEAcA8pcZL=zkjQBZjswznKdU6z4L7h5-So3Wwkwfpg++jPAQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: Re: [Qemu-arm] [PATCH v2 38/67] target/arm: Implement SVE Partition
 Break Group
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
X-TUID: YWzo/GSo25tv

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  18 ++++
>  target/arm/sve_helper.c    | 247 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  96 ++++++++++++++++++
>  target/arm/sve.decode      |  19 ++++
>  4 files changed, 380 insertions(+)


> +        b = g & n;            /* guard true, pred true*/

missing space before */

> +/* Given a computation function, compute a merging BRK.  */
> +static void compute_brk_m(uint64_t *d, uint64_t *n, uint64_t *g,
> +                          intptr_t oprsz, bool after)

Comment says "given a computation function" but the prototype
doesn't take a function as parameter ?

> +{
> +    bool brk = false;
> +    intptr_t i;
> +
> +    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
> +        uint64_t this_b, this_g = g[i];
> +
> +        brk = compute_brk(&this_b, n[i], this_g, brk, after);
> +        d[i] = (this_b & this_g) | (d[i] & ~this_g);
> +    }
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
