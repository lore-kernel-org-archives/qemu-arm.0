Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1271849wrt;
        Wed, 23 Jan 2019 15:44:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4ezciE+O49pYO8zByK/Xdejcec983Dc608wdmSKFB2otKlsmt0KbWp+nkjkGOaG7zgXcoL
X-Received: by 2002:adf:db51:: with SMTP id f17mr4482111wrj.90.1548287060121;
        Wed, 23 Jan 2019 15:44:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548287060; cv=none;
        d=google.com; s=arc-20160816;
        b=gSYv2SlaUQcM7266PPSsGcuTs/1P9Y8t/nV30hJ6NH2mRZKOUzgQQTGQ55/yBYNSCM
         s4LWy1fZdVaDLCNt6QBdqZhzkkL4a5S5CgtyB/MSa7c5f9U5etKtu8s34uEhTCaxYm2C
         jvIBhJw1twONuNmcwtWgPD4QY/YdsxIbWoepqzr/Nh6LXMqmGFvMi5QTy6ZcZQBwWAXE
         N5GXM+akRHZe5arMHux2mHMPgjTWn8y8x/IBChr/uWF1o09+TzUj1sCuX3gJwUgaMgmb
         iXCln2VHlSDk5XgWk4nNEGsnxUNvjW8VfshZn2RYOIfjUZUQivQ0skhCU9L6otCcSDxf
         l+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=AEhDUxoEU4I301W7odhRENuzpOeSxdjkMOROV+TzGT0=;
        b=laMs6oDdAg+QjdjqCqMWxbbqe6SnoksDX45sCxvktvIwERnjGey7+NBVipYY/hS2At
         4i87XggXlZc31h1c5K1XBODwMnDZc8iAWY9LNlfObHrCtWazYNhEJDyAdAxwG6ikSO/Q
         0SGzd8EdVq1aISTR1U3TiDAMgzO5BIZbnfY6mtNIWQT9msDNdGC5M4583sAAwBskAFpx
         cY1syBzndn3jLGCXtmLm3lqq0CkvqcSDaxkrv/JdOKl9L70Invd4ONxAtUzNj9oUp1mB
         bM58LT0Iat5LLV8xkzw+aB63ao8GhjNchDmO1MDkonITQA803XnLKfiy0hQwFFVmaes9
         g+Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0QwfFql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p190si38083363wmp.80.2019.01.23.15.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:44:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0QwfFql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmSBv-0006ia-7f
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSBl-0006iQ-Ng
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSBl-0001FR-05
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:44:09 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmSBk-0001EI-Q9
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:44:08 -0500
Received: by mail-pf1-x435.google.com with SMTP id w73so1979361pfk.10
	for <qemu-arm@nongnu.org>; Wed, 23 Jan 2019 15:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AEhDUxoEU4I301W7odhRENuzpOeSxdjkMOROV+TzGT0=;
	b=j0QwfFqlDmIs5rZwSA1Va5T3uup29/EpyA7NY8g2/XbZJFi3b95r+MilIZ4L7/jv3Y
	pdJ4jNxWhEhAMj9e6ym2Uv5RPbdXnTeNNNNCvPlOQlhP3GiXrhRCFk92Spx/xYKS8oiW
	ojC+eijihs9YMSwSe2egz2B5nVqbRuPB2PUaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AEhDUxoEU4I301W7odhRENuzpOeSxdjkMOROV+TzGT0=;
	b=SlppPIIKYUROdMCZPsdMLe/bPocli5i3w+Qqn8nUqtjU8SQPlBMR7gZHGwynhdYuaO
	/cyCz2qnlXySgV+LoFXmWq/Rw7L0rQ4xrZ6wsACRuFCGBmQWr2Bo2+21GuxgaquJ3tul
	XgfHi2b3jYxEFZCEzFeFAy32WYqLUhXQLx9IeYcfosJSCqIAigoSRQxJnL2z+LLdYjW+
	wYGeqAdNcWxizNptbSFkwNSTc8mcITA/lR4m/J3RKWSMNOmL9QxSybfvL9li4PsHAqxc
	m0tTUpnoGm2NSJqyfD3j9WZlopjCP3w1t0wNPRDbYw3UPqVhO2jhA1Lc1qGWHUu8kgsY
	wDnQ==
X-Gm-Message-State: AJcUukezKp1eYSgMx3o3JwsGR68NFHy1SfYssJo+88Sj356MFNL1qTN1
	S65B0siIjkYaoBacN7CXNs07lA==
X-Received: by 2002:a63:ff16:: with SMTP id k22mr3896849pgi.244.1548287047410; 
	Wed, 23 Jan 2019 15:44:07 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	b10sm28873650pfj.183.2019.01.23.15.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:44:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <125e6614-4126-71eb-0d88-78097cb3df7d@linaro.org>
Date: Wed, 23 Jan 2019 15:44:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/23] armv7m: Don't assume the
 NVIC's CPU is CPU 0
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
X-TUID: 4aEBjUFG6Zvi

On 1/21/19 10:50 AM, Peter Maydell wrote:
> Currently the ARMv7M NVIC object's realize method assumes that the
> CPU the NVIC is attached to is CPU 0, because it thinks there can
> only ever be one CPU in the system. To allow a dual-Cortex-M33
> setup we need to remove this assumption; instead the armv7m
> wrapper object tells the NVIC its CPU, in the same way that it
> already tells the CPU what the NVIC is.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c       | 6 ++++--
>  hw/intc/armv7m_nvic.c | 3 +--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

