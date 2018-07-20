Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2950854wru;
        Fri, 20 Jul 2018 09:18:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcaPOvOKfYb5sdFnsvy5mP1HrVACcZYW5dDYcDvwMyfpNa7OxbyF2A374PFsQbnPheVfX4T
X-Received: by 2002:ac8:3692:: with SMTP id a18-v6mr2625236qtc.406.1532103482365;
        Fri, 20 Jul 2018 09:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532103482; cv=none;
        d=google.com; s=arc-20160816;
        b=JnNgYvpmtxtdS0jok4nkeIHC2s0T7+edK/vo5YFoUMaKyGv2+vFRq2I4k4jaYS+VMI
         YykDKDSldPDzAELMgaviSiyV6+zS2gQFCpqg+D6HYf+RVwv30QoeaqznYVWkLAhy6NJa
         JIrr+8dADqe05WGxKE1bPKc1Kg1892aRvLyskCwl2NKWicmPK9fQw+F1ol0R30eV3YkZ
         AuogjGyhGtWrxTZbzlbQhPi+8fnUMAIfYbf00VvNv+eJhCIJdClFqEU5r0T3xt7rBeDe
         EtPkE1eV706kAtUXcZPnA+q5tOr2VelwzMnXBc4K9Suvhe8ANRvPh+M6rUJVaU9ngTZj
         mYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=qnAUXsPjt01WGHt4tQRI50owVr2D9tKrdDG2epfRTbI=;
        b=N9UYqP8St6M/iL1lkbAsCo9S0Ldb0HJ4BLsSwqSEP/LFGcGTefuUJs7lIC0j0axi45
         WCT4plWoHjsG9DNiOtv9mZi6tL1I8IIhoDnvQEV/3ch39C37xgr64mSfwIL2jbHTO0Fb
         FCF5stEqDjGq/gFh/U9HpcKoLdF4pohQH0zbofNkB6BH5+iO/nMccbmbYDL/Ron3AauZ
         8DnYpWaAoUH4A4Fz8Mc7T6JDWdnFCncMtMeGI0zcJvhkWrHbT3D1uz40XiAyLjPUfruO
         t+dqT91aEYjuzHgnVBf5j6EDNPj880v3NmnuCBnJMZfVM66Ip98tGwf0wxcQoYH+vTuR
         wWMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U9339xZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2-v6si2213162qtj.99.2018.07.20.09.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 09:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U9339xZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgY6T-0001sP-Rf
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 12:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY4B-00018P-Lb
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:15:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY4A-0007ww-Q0
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:15:39 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38186)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fgY4A-0007wC-Ip
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 12:15:38 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k3-v6so7277890pgq.5
	for <qemu-devel@nongnu.org>; Fri, 20 Jul 2018 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qnAUXsPjt01WGHt4tQRI50owVr2D9tKrdDG2epfRTbI=;
	b=U9339xZv6jLQtTps/4meEfkqnAo3r7tbkUfBQx8xKdMYeq7wZvQwXGJl2y1Wah9GYS
	jsWz047nyeUu5ASfrvmlPvpkGUZISRBYdHJ2Y2qpYcitxmH9PBp9nwuFS60qXND80NGp
	fs0uScHNYYxZ2aqAY/q9weNhavAGfOeMhqSng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qnAUXsPjt01WGHt4tQRI50owVr2D9tKrdDG2epfRTbI=;
	b=Fr1Iw+fFPzgM3K9kN6N7Xk6VsZ1k82rXpIFcuA5UwqUD/4dyfci4Rqhn3KDT2EEQzX
	GFSeNkKnfWz9/66zxgXjvDjT2ufirk9ZzOANyhedKJj6NeqLRAoYLc5bm4sBso2A/4/a
	Styh/vAiGbbsvh7wNK+tDKJarLj7Aq20MELNl9LbKwRczKY6rAkKgchTUH0/uukGHGwB
	e7QOYOVUCUbrvV3/QdLW8FkmiZzTWjFurtWn9bkLIZynt0K/4T6HDR2ZapJjB1TUWSTO
	771oHw17SjlooO6iCvAnsJ2bF2a8/s2OgAlTmMRIjeWToiNFzSejqYK0NFGGs0Pluwj+
	bVjQ==
X-Gm-Message-State: AOUpUlH6AqZcM87DAiz8W2NZumZeGfxXNJhJsFcuKuakWgvQyj4dhzOq
	VJD7IF0hReRuKV1xgEMEfECYbg==
X-Received: by 2002:a63:d244:: with SMTP id
	t4-v6mr2682627pgi.335.1532103337696; 
	Fri, 20 Jul 2018 09:15:37 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	r22-v6sm4615215pfl.112.2018.07.20.09.15.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:15:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b4983d9-e6e0-c97b-3868-f923bc13def5@linaro.org>
Date: Fri, 20 Jul 2018 09:15:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: Re: [Qemu-devel] [PATCH 1/4] target/arm: Improve exception-taken
 logging
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8Qvre7qd2hx

On 07/20/2018 07:56 AM, Peter Maydell wrote:
> Improve the exception-taken logging by logging in
> v7m_exception_taken() the exception we're going to take
> and whether it is secure/nonsecure.
> 
> This requires us to move logging at many callsites from after the
> call to before it, so that the logging appears in a sensible order.
> 
> (This will make tail-chaining produce more useful logs; for the
> current callers of v7m_exception_taken() we know which exception
> we're going to take, so custom log messages at the callsite sufficed;
> for tail-chaining only v7m_exception_taken() knows the exception
> number that we're going to tail-chain to.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
