Received: by 10.28.71.27 with SMTP id u27csp1368024wma;
        Fri, 9 Feb 2018 12:34:44 -0800 (PST)
X-Google-Smtp-Source: AH8x224bSWqRSHF3PW9wfjoVNpSKy8mw1YuseQqlZx3TZ2XiGNFTbOQNviVKfh6Mek5HoFJOXzcL
X-Received: by 10.129.163.87 with SMTP id a84mr2952860ywh.393.1518208483973;
        Fri, 09 Feb 2018 12:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518208483; cv=none;
        d=google.com; s=arc-20160816;
        b=tHa62heN0GUrK0Xz3z78MI+X9hBP6wSvWAOwte2lQqsuwclC2VyfETyiZsgGluKOaX
         +4lZy3yt3WDsNkPkr5G43GtesK/jOyV0g+mF/DrcAD045HbohadfEZgfoHNRStbyfCwM
         rSbYhldIBBs1jVWYfYOodk1Vc0J6bss3Ux42QmcKVMZ62AwdoaHg36k09OwyB2+NHZME
         G+AeOrfAbuUFTZjDODGsJ7JAQ0618a0hRykI2nyr+kZaJwvs0B3FPgAq4nwRLH8T/uda
         QmQsiSGdZHNJO1gFC6/eszcgw+y59Qi4/SvsTqJIqds5HfS4dzaHenxqfDF3JN0G2hik
         kD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=M6EKWY/YvZEWYkMEOfWzewAMxivqPsDZhT8Jlv6PnhE=;
        b=s81I1ifQtEaHIGKBkOZbFnQQkAHPLhCgdLynxku3FQwHBI2BDfsFBePkBSgwCgYtle
         Jed8T6eBoO5Q5BzOoY5cQlQSLEOOF9WyF0ruoITjo66IGCJ82Z541DCQjLu9P3Swx3cv
         YneGV9xTRln4O6oS2JANZqQhSJfdpkJQVVfradFxJvwJU/dN14eAEB+/U0DvW9Hw3Jo/
         p0UALLuF0ZplLhH17i+I4nPeIHAHSP5K096png0RKf/BI2ReP6aCgKa+a3pkXWTHarWT
         5uOvV5WhdNzFNvH5wyQaqX2R5lb/4m9Gzm8GJ1pVYETu4cHyZ2FXiAfR32qUJfCf7W4z
         Uz/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ruw+3xkz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i125si537903ywd.44.2018.02.09.12.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 12:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ruw+3xkz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFNb-0006Lx-E8
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 15:34:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFN3-0006J6-QV
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 15:34:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFN0-0005I2-Mj
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 15:34:09 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:51460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFN0-0005Hf-HX
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 15:34:06 -0500
Received: by mail-it0-x244.google.com with SMTP id p139so12501649itb.1
	for <qemu-devel@nongnu.org>; Fri, 09 Feb 2018 12:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=M6EKWY/YvZEWYkMEOfWzewAMxivqPsDZhT8Jlv6PnhE=;
	b=Ruw+3xkzEfjmjFzbuhoOiGhwVZj8ikokx1FXLF5VAh5CVwDs3w6BmXHhOGisjyA/4S
	gHF+jfE79RSArlo8yKQjJbKYr9aq0fyxHelN6SBCOMZ8pT5+Ahn1tSqtFnEmLRPcBS9u
	JbvrrcWx70Bwmpts3eD0YoyN2Y5dPEm17FWwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M6EKWY/YvZEWYkMEOfWzewAMxivqPsDZhT8Jlv6PnhE=;
	b=PXok0iM24yF0BG4rpy3CpQoLDyyuQWII5/k55P+Uw72bqfRrzmExIAbKwija9p/sTD
	RLYN4gbMfJzjLTdwlHn0XIZTd1ace7eFm2svvqx4odbgOf2PkO9+gHSR/3twHtdCtnuf
	yrgTD6cUAnrV7utbn7xObECwi9rmLFjrY1wCDg2aWwKjMUbm9l9pmf1qaBxEGgVCMPrn
	z6BB7iYQJEMShLvUz+2ETKgvBEuL1p5JFBqrdDiht6EWvHc98vS++Hk+aUVYrUMUhfeg
	CEqNE4iRpT1qVo7tWsy5+SIvCT7GwA5G7RuyIid4uYimnHViVK6VHBTo9PXVzL8S4Q52
	g4Cw==
X-Gm-Message-State: APf1xPC++4tqt3RczeRshgdPz+Xs2yfNqm0KW/NIDjKSHfXQCtoSaXYP
	ISbgOeIMi9hzGj6UvPgjx0vKIQ==
X-Received: by 10.36.47.78 with SMTP id j75mr4999722itj.129.1518208445807;
	Fri, 09 Feb 2018 12:34:05 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47])
	by smtp.gmail.com with ESMTPSA id 193sm4384183itv.9.2018.02.09.12.34.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 12:34:05 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18537b84-7150-01ca-bca9-29abb99d7f58@linaro.org>
Date: Fri, 9 Feb 2018 12:34:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-devel] [PATCH v2 03/11] hw/intc/armv7m_nvic: Implement M
 profile cache maintenance ops
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
X-TUID: ql5v/5y9c35m

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> For M profile cores, cache maintenance operations are done by
> writing to special registers in the system register space.
> For QEMU, cache operations are always NOPs, since we don't
> implement the cache. Implementing these explicitly avoids
> a spurious LOG_GUEST_ERROR when the guest uses them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

