Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4053505wrx;
        Tue, 23 Apr 2019 17:03:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXxzH5o4kmPepVZBvrhk8wmWM/9lk+SDzej9lKY+0/oPAdBKk+jDk6mForJrTyvKvqH5+t
X-Received: by 2002:a1c:9e55:: with SMTP id h82mr4398443wme.134.1556064226652;
        Tue, 23 Apr 2019 17:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556064226; cv=none;
        d=google.com; s=arc-20160816;
        b=lqcdgY0pVBYaJBtP9tl00ngISS7eEje3V9GHgw9+rSBvk0eA8WzTIIipU+lqlAX5IB
         +oD8GBjr6+Xom5rixQKfImGTLUBNNvqNjam6/VaJb4rb98z5XM+zp9IHneB8P8UjcEup
         HnJFeErBye9m53iY/SrmuXfKXvIC67Af73Jw1E29R3RxlcTaB1VOTv88gOr3C8MY4KYs
         /YMYLzF42fmj/rD47LoHXIWrxWg8GMztRMRyp+DPebkqOp6SlJCxu06ACg1GpUIjw81c
         k+7EbDXYYOFlMZa+aPjRWczbKc5mhu2yZJ0Tc5zacTO4Dn++bU/4NgVRTu6m/uBRLdsA
         q6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=WjmnEuaV1BBncfxXRXx/8NM84A7K8NC5GvmkbhxiYUo=;
        b=Wnr+84PhMwqv2VpL3IlM7aiD3KXJl8d+nMlmeAt9ajhxNWeIz7C4PWSkfiNVTS1o4B
         f6QOBeJzXYycPl6edVNqB+ieV7HwDkE/E4u28O/QJDtQ/G8U5MXKGveqUnF1jrwxYPLH
         2tdSBfEi7MlCl6NYwFxpHZQiUiMe7Z1ZC0PD4xljveE3CT3/5q/LEVyYPjcyFpCJUUZg
         A3vY5IJcPSkDRwNGPAsdbJdlwNHVXL/QuGZixcq1bRuj8tQxIFBxcxQBlZ6AkYUCVkRv
         TEnal+Ds0+QufudQvE8tZOVH7rhaAB8iamQ+6hZw4ENnIxTMEOCXLnECFij2Rffo9ZRp
         zRSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+ct94am;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si12961898wro.242.2019.04.23.17.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 17:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c+ct94am;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ5O3-0001Dn-7f
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 20:03:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5Nd-0001DV-CJ
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 20:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5Km-0004Ib-81
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 20:00:21 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ5Kl-0004Ht-Vi
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 20:00:20 -0400
Received: by mail-pl1-x634.google.com with SMTP id n8so8289698plp.10
	for <qemu-devel@nongnu.org>; Tue, 23 Apr 2019 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WjmnEuaV1BBncfxXRXx/8NM84A7K8NC5GvmkbhxiYUo=;
	b=c+ct94am3LpvL613MVI+Z3pZXJ2ZJC9Avix5dMd9ciQ4xsw4p+isLVQW/e9GsqeJMl
	Hist8aWrWq248SauayhLj5DSs6u9S0Tzdzl2s9mWwMB2MtJtLtXDpMl5cUmyLRcLY6bM
	AsW9DaE5U/rBzW/ZfRcBoyPdtRVqtyjCT0DPX1NmuOAAYaHLSSL+7TXuCE8+AUI4HhuF
	KkcOnfEf6P9YHVLJgqx1L8Uxjd9iZ3JWD8xdvbYPlseLJYnio/IOim86h1nHKtlScy98
	IN1MGgge6G0G4OEkibjUmNAodQWLrE3ydLPyNXUQ+SEh5wFkAdM2Uw00MxYkOk2qSxV3
	Y76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WjmnEuaV1BBncfxXRXx/8NM84A7K8NC5GvmkbhxiYUo=;
	b=ex+pR+/cjd6aYJ0i7c23+9NscB8U9NCXoXB/hz5rfHfiz2krEE8v+oFBFDHZXLgp6x
	Aohpgi/PnKoutanQfYiBqeI2ZDo9C8aSYyBUmT9SHEPtHSjPXxWfzcaKPF6rLzn7R3+j
	+efAh0k5y6TuQlBJ9VgrV6pybfOUBIkJycF61atPwop9F5YjGX8qie+KblZb4bDPO2hP
	W8D4qCskZ9/42oEXdsSXy4qtixIb2jrKqPVXW61HGfikJj8zgn1KoXdLDjwneIhKtrFm
	I4gr5b14vzWbYHVWVloCk7Qjttod6/hxyXsWOz6Hi3+cqT+BUWkXF3BEoipjtfQoox+b
	Z4Tw==
X-Gm-Message-State: APjAAAWjwkmuy7I2uVgOcY2t6/W9Z089loAq6iv0p6pL7XMgZ5oYTHMh
	CfQbwGoXPQ7qpdEg10sqiKHrjcf+GTg=
X-Received: by 2002:a17:902:4643:: with SMTP id
	o61mr5710157pld.249.1556064018270; 
	Tue, 23 Apr 2019 17:00:18 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	d68sm40246245pfg.16.2019.04.23.17.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 17:00:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6b4ad736-36eb-a459-1510-09fb50b2afb6@linaro.org>
Date: Tue, 23 Apr 2019 17:00:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: Re: [Qemu-devel] [PATCH 18/26] target/arm: Set FPCCR.S when
 executing M-profile floating point insns
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IBrDyMVqFnox

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The M-profile FPCCR.S bit indicates the security status of
> the floating point context. In the pseudocode ExecuteFPCheck()
> function it is unconditionally set to match the current
> security state whenever a floating point instruction is
> executed.
> 
> Implement this by adding a new TB flag which tracks whether
> FPCCR.S is different from the current security state, so
> that we only need to emit the code to update it in the
> less-common case when it is not already set correctly.
> 
> Note that we will add the handling for the other work done
> by ExecuteFPCheck() in later commits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  2 ++
>  target/arm/translate.h |  1 +
>  target/arm/helper.c    |  5 +++++
>  target/arm/translate.c | 20 ++++++++++++++++++++
>  4 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

