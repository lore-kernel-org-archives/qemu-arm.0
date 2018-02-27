Received: by 10.28.71.27 with SMTP id u27csp5225270wma;
        Tue, 27 Feb 2018 12:18:44 -0800 (PST)
X-Google-Smtp-Source: AG47ELvWE0npalW7aC2WZtC/6S6NJuk+1ECL2NoWPVXskND6NaRDrimshKOuRFB1lVszYWnC3DKR
X-Received: by 2002:a25:c514:: with SMTP id v20-v6mr10138853ybe.405.1519762723930;
        Tue, 27 Feb 2018 12:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519762723; cv=none;
        d=google.com; s=arc-20160816;
        b=ORIHVTg00BsLuJcINa3fOtHZY7BIjmMAHpfJDUxQ6ZAATZ4nvmr6xlDOlF/0GWxBYK
         YpxyxqTmEu1wrC8+y0x0ZTKIdszLSvVycL7/ju1Fg/KWYAGn1xB34NNarvBZqvgMlv4M
         2JgUAHr6cKaiYlHAuIK6GBXvs4V1VRm4mKngYTEolnma5GpxSTyhaug8bjL1sP5YhHnN
         wrU8il++GOxTw8TkbHktUVDOdjYpYcAFfa1liuDIXaFrvs825EFMnCvcZT47DvUnt5sb
         ORFvc9MOvUAvJPe7szF0DgqGnyxeXTkfrL3ZwFvqSgxgHKF/E63WQsmwTytw4JsyAhVy
         90RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=cAhLHwRmnKT6Eo0JUfZS05TnS+sXbWckxwX+P/tHwyI=;
        b=iRd9mYktZ/fstLWiOjl3fUS0d+kNzd1zDF3L/+cKWqnYBqAEckXQqDA75IZVBuLfiD
         hpdjs68GjLjLGXb4xvxZM1+nvZLVI6ZNKIQePni4d/JTYIqKIUJx4y0Drw1xR4/2kZ22
         osvWIaCESbd7GhtoGZa+ezgW6zufxBLNcy+KeZNe+bIo8VLRU/XgMzy/4EffVBD2PsxM
         alkqDVokRzk9bOOeGHjMEWfjWs+MOCEKXb4y3378cvCofo5uDi/ilXqODShE3tvqjQx3
         uhG2tIHOws0JNactxzVpM5spWD3ep08Hawv4FY5SjylxbUbIbugh2hztWdJtlUVwSm5R
         zxbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwiRIpt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e79-v6si2048840ybb.164.2018.02.27.12.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:18:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwiRIpt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqlhz-0000dC-Da
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:18:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlho-0000cf-8r
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlhk-0000K2-W6
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:18:32 -0500
Received: from mail-pl0-x22b.google.com ([2607:f8b0:400e:c01::22b]:33476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqlhk-0000JN-Or
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:18:28 -0500
Received: by mail-pl0-x22b.google.com with SMTP id c11-v6so68170plo.0
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 12:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cAhLHwRmnKT6Eo0JUfZS05TnS+sXbWckxwX+P/tHwyI=;
	b=kwiRIpt1tABSdHbr5Sak3/luN11YdRwIbmfEcQoEf7ZBlf9N4CK+RDd82pVTxYvO5d
	fSPjwPib+WXKEuxigMT/HOQqiUeR/fsX4IOFhtJdHIFqXKBAI+0ZgC64OhKgMZJwkqjV
	8+6aHELstNHaU6PGkQfxN4neGDwZvT7+Is75E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cAhLHwRmnKT6Eo0JUfZS05TnS+sXbWckxwX+P/tHwyI=;
	b=V1ckCPiyD6M3QHD+OfsVFc3HkMEWOWpi7HBIQr18FDYQOh0d+6OnNjLKY5k62m/+24
	jaWIwwNg2hyMq7VIDURXCzAYJyI1svRrLM+0gqHrULr30fjqrU5P6KiloshQtV6gw7nQ
	ydpRRJOHmf2ilMzOQPEKRkPvNDZ2yZUMfZvMI35PcI1Ti3H7xWP9eHJDwoKor0JPHov5
	LtyVEJBSGQGMnBTd8K359Iq6kO/JB2XBLOgnVl9+M7uOIaF+sl67pHoB3CoI+u3qdfb7
	iZ9qxgBtQ2pktn8XwcMRYHBlRkmWGP4tkxmyTvTzZTT0xHrG52YbFl73XvCTB6gONihZ
	eggQ==
X-Gm-Message-State: APf1xPC4iFq4sR8GwpA0JcD3iQKXXXRK10q85NXjQ+lyoHtgkXQjrBIQ
	1g73WbHWYAp+SSXT127q/5XNtfCi8Uk=
X-Received: by 2002:a17:902:1c5:: with SMTP id
	b63-v6mr8972665plb.311.1519762707715; 
	Tue, 27 Feb 2018 12:18:27 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	c1sm24985336pfa.126.2018.02.27.12.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:18:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d63ab53-f056-9f86-4317-9565f1d8a792@linaro.org>
Date: Tue, 27 Feb 2018 12:18:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/19] target/arm: Define
 init-svtor property for the reset secure VTOR value
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SR4+BmyYS8I2

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> +        env->v7m.vecbase[M_REG_S] = cpu->init_svtor;

Perhaps & ~0x3f here; that part of the field is RES0.

That said, if the only setter of this property is within qemu code, and not
from the command line, then I suppose it doesn't matter in practice.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
