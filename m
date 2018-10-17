Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6658560wrt;
        Tue, 16 Oct 2018 17:05:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63de8OsjbKAr+xfCqp1/AGbVDwRbPp5/BPqGk/+qc27947oMoCKjKaDmqoVg8CdrTqlozyd
X-Received: by 2002:a37:1b67:: with SMTP id b100-v6mr22637742qkb.198.1539734713446;
        Tue, 16 Oct 2018 17:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539734713; cv=none;
        d=google.com; s=arc-20160816;
        b=GfOYuhL5BRFUXETMCOgdT/9pKXvLWgmMzj6iMjwqCtGz10PewJAD70WfJMjielDwHr
         H1E6UF7jNBzrrVARXXQKlHCctA+3+J/c6XXIhqiXQAN7FLKmirQ7plR1DGM4Yi9/lny7
         f0xLqWZlZJmCgI9bux6JNpqjOQ4apXb/ysdvUl9HWOcWF+0C/B9AtKff2SwndtY9+Xe3
         dY8OxAJEh/eleKsPJczFc/bsJuD3uR6ZL8Scj3P7dJMixmqSykBtU81IDMHs1rz9c/If
         2hjXn2waNksgg+TkgpAdqgY6JtV4r13JbVJYkPGFT/EBU0DKZ0KscncI3XbcmjBmoGiD
         jwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=bKsDtq3dmvyN1yaQ0i4qcc6hQhP7MQtCGzQJp5pxD7Y=;
        b=rXClvuwVr/IJOhASSXkDc4ReRYYhc7LVRvlA6S+RcfevEN5Ke0AUtEnzQa6p2gjLEX
         NIPKlyNlilWMMm8y0uoNwWQ/yPiw4cXv6e5WSPWhPruAusW1ADr0HzrRlcNayH5nUa2f
         KIu5Dt3KFfi0CXBgx6+LvBXSdXVoCRZSJXn+3Syme1szTU5zcVBKx4onqITq16tG+tne
         e0JVDH4uxRFqLj4uPPC/ZUp15os5a+UGm+bwpqGJY5l8GVDOA3s31P2Kkw5/B5KrYESA
         M4DC8D95vBI6m+OlWBx4K40cDNL6x2exXqtL7CKIET/qfL/kfMV7AJ0Oq3R9fklP/n2e
         K7HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N6Os1+Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13si6903030qvs.14.2018.10.16.17.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 17:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N6Os1+Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCZKr-000190-1g
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 20:05:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZKg-00018l-Bq
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZKd-0007og-4t
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:05:02 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCZKc-0007o5-T2
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:04:59 -0400
Received: by mail-pf1-x444.google.com with SMTP id 78-v6so9867349pfq.0
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bKsDtq3dmvyN1yaQ0i4qcc6hQhP7MQtCGzQJp5pxD7Y=;
	b=N6Os1+RtH9OVhaJv2PJss9XnAWI3Jxi+qUATjiQsQ545GAXxot0LGQaQhCZHt4kJZC
	I8gf0FY4D6i6YB9+7nQuTXYbUUNztI+ic9+IDOiI6Vi4jzSWsvf35jqs58ao0ntbdy3h
	5nQ6yHtIZLRCdJkFSqxnDrRp7oal8IAbrfJNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bKsDtq3dmvyN1yaQ0i4qcc6hQhP7MQtCGzQJp5pxD7Y=;
	b=rsrB6i5yLCS7I3l2k68kr1Szu1vB8af1SNsm8bdMq1bLZgt/oppWfCBK5ur5cI/XCb
	IrLjF+QoaC72I013Nrt7iKt2Nn/hWOjy9I7zrsXJDYlxGgx9MGfXyy1T6KHAxZohh8Ed
	BJCW+DSNBWhh4NQSoD848vOdw9s4PbOM4O4q5xPxMvDPRNhYBlymYdCd2yrAJfropS12
	WDT2cKkk0D/Li+MKcIaWCfHICs5bIIoEwRG6Gbl8HyW+rnw5AjjCqJQYwWkljkR+yQ1M
	jbuNG5pTw1/5wf6FygKJ19C9zKFD8zJshvcHNLW1XjOr8KtBOHs7CWM96pVUbdgV+C6l
	0A1Q==
X-Gm-Message-State: ABuFfoiLLG5eIwJB1mF7V6AiOa8mCRMgjUYzsZd9tdsc/IAcORXM9pRR
	xLrHSxPTtIsHJN2YR2gQCG3rLw==
X-Received: by 2002:a62:4dc4:: with SMTP id
	a187-v6mr24233811pfb.92.1539734697855; 
	Tue, 16 Oct 2018 17:04:57 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	a1-v6sm24082799pfj.38.2018.10.16.17.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 17:04:56 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-12-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <be878ed3-509f-8ed8-8c28-71e3d0214837@linaro.org>
Date: Tue, 16 Oct 2018 17:04:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-12-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add
 instruction and cycle events
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kBNdhvR8SiVv

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> + * Return the underlying cycle count for the PMU cycle counters. If we're in
> + * usermode, simply return 0.
> + */
> +static uint64_t cycles_get_count(CPUARMState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> +#else
> +    return 0;
> +#endif
> +}

Usually we pass through the host cycle counter.
See cpu_get_host_ticks().


r~
