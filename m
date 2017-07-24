Received: by 10.25.44.15 with SMTP id s15csp4403261lfs;
        Mon, 24 Jul 2017 16:06:09 -0700 (PDT)
X-Received: by 10.55.170.77 with SMTP id t74mr21067032qke.201.1500937569360;
        Mon, 24 Jul 2017 16:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500937569; cv=none;
        d=google.com; s=arc-20160816;
        b=FPL69dYfEreTntGwlVvzamh3YLnwZ/252iNV1rWV1Nzp7fazZbBRiWhlHV3QB58ZME
         wxCo0HMn3gBdTT3Jeo1DyFUJ24bb6aX/yib29nI8ZRqK7WlQvePV8+Fm2GFEvdts9sW5
         sV0DzRzJd4KB3G+0lEMHLeI6Ha+2sCQG2J5RDj8+JczpXeyy1s6tR7BZnZR/xxCxjnum
         H2fILkcmn4Zt1E52FVVaooLyzzefHiNfgWiVvR4SUPqTFRMIsvd2a+qKfoSrJO7qdnyo
         mjksFYW909UTE8dWZBpFS/s6bQGoOTSf4JunCVUzfWofPj9OR6ZdDbBts/sGL8OY9LZm
         w/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Rk0aPlOhybW+iR6XOAIXrXy7AUnssn7pQZDOFH5BHfQ=;
        b=JT71bChgKJYzrKoL2p8rvSOh2bW/dW8gNGdVbsxUwaRZ9OmF4ZgrgO/yvdDS/0lriP
         OpTt4T3fqSlh3iULcxT7oxg3ml92LDpBfN7bPwzOpP3C2iP8Y1jMaIcz4X1MrPdGQjE+
         tuLwT+xIrkQLeuQWZ9g21+NAuz/ccGNW/kzqMmCV2L6YpAdkJqNaqza9YDu36NbTf6dY
         LKFCCewi+QPlInN2fGnqizAUSDMeLqjtfxIadbjODJf0BH0NlY3gqbfcEyghOLveKw95
         +ZNWZ5lprQeYjHHy+lW6M80KYq3ZC85B+nRg7uUTg948G06m6AOJBMuBltWA+n32RZdy
         5Ivg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=n41J2goq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b144si6934390qkc.237.2017.07.24.16.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 16:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=n41J2goq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZmQQ-00086R-L4
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 19:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dZmQL-00084K-KM
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 19:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dZmQK-0000Ub-Sk
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 19:06:01 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dZmQF-0000Sr-UW; Mon, 24 Jul 2017 19:05:56 -0400
Received: by mail-qk0-x242.google.com with SMTP id q130so11264375qka.4;
	Mon, 24 Jul 2017 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Rk0aPlOhybW+iR6XOAIXrXy7AUnssn7pQZDOFH5BHfQ=;
	b=n41J2goqNXwx1Exh62uX6+FY/WDccO4xo/FMDyyKL0PLPV/zxKugKIApOqriTvGfS7
	ymAOTPk8LY4ucTsRZkDX0Y5cYMajdlb1jVCrftTRQSh7O2Mn4wcLbWuqjkZ1ez3+bdfI
	1TD2bcwDe0RqWaAErLUqKzbnOa3IMcpQr/L3Svt41EuSaZa64QxjmYxSD153bC4DDCxV
	+hL5ljz9nHW9NNufUYMMkhospq9rV+smTZahA/B515ARCG5aY32bVWk2pS44eVX4sZrY
	1WzdWrSm4pfJOXvjVnJrzlrftYEjxTiYmiEboc3Fan1tceNvI3niluZcqRojPtIwgyfV
	aN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rk0aPlOhybW+iR6XOAIXrXy7AUnssn7pQZDOFH5BHfQ=;
	b=cNENeW3/pX4RpFhH/pe6poy8AXjIbOjN75m9RroRUNgz9Rc5WNxPqU2MZl65iRHTEI
	ENQU5pDiaEWwA2l86FEE1M9VO+QZv/xCNB0JbhqD42SllsddX9CWeCTMlxA5m3nOaimx
	La8IGDYbx3nQ6F8GMhcH2ERJTHFPi6sWcqXXHNFv8AQd3VvkMqPs5N23nv8pm0e2GYhV
	6r+gyEBlc0N0vafPy0sAmjwgEwuxHKfpW+R9g85ZZAaF5khPZN+0tmXweE9IyteMY+FG
	A2slpbv0SqKnH3Mma44u7TpqKktc4D/4Yc/AsjGLTASHGCqGODMsI8ok2mQTAp3rgR+V
	2JhQ==
X-Gm-Message-State: AIVw113NaefKXJGvVIBVc6sJBJcXde7dRzRt6CiCWjQiuf48r2UfGwyu
	U1oKj+KMG94XAA==
X-Received: by 10.55.133.195 with SMTP id h186mr11261123qkd.21.1500937555376; 
	Mon, 24 Jul 2017 16:05:55 -0700 (PDT)
Received: from bigtime.twiddle.net ([71.217.194.233])
	by smtp.googlemail.com with ESMTPSA id
	11sm9550831qtx.6.2017.07.24.16.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 16:05:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1500906792-18010-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4b60c814-d631-f768-9c6b-a3cdb85d076e@twiddle.net>
Date: Mon, 24 Jul 2017 16:05:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500906792-18010-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10] target/arm: Correct
 MPU trace handling of write vs execute
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
X-TUID: rW+kI0VUNfAU

On 07/24/2017 07:33 AM, Peter Maydell wrote:
> Correct off-by-one bug in the PSMAv7 MPU tracing where it would print
> a write access as "reading", an insn fetch as "writing", and a read
> access as "execute".
> 
> Since we have an MMUAccessType enum now, we can make the code clearer
> in the process by using that rather than the raw 0/1/2 values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
