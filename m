Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4845172wrx;
        Wed, 20 Feb 2019 10:20:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ias1nhHfzNxUC/PuRJHWs5JEHbifzShuc1qurkUsez7+YmW4OavcGrW+/MtT9fbQIb0VB1H
X-Received: by 2002:a25:4682:: with SMTP id t124mr29508700yba.249.1550686832870;
        Wed, 20 Feb 2019 10:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550686832; cv=none;
        d=google.com; s=arc-20160816;
        b=fp8H1JF0dKIZiDovIKLSZIpvCLZG8vJPNzWes/eJzPoGYck0Fn/vS8eKGYOjOE8LX+
         YTG0d6+JS//LMg+CHtukRHlYvTT4mRljaEP7HNa9tIsRlRcsQDLP5ZdtWxpGZTC2PegG
         fV7bZteorkRXFsxt8OtsUhh+WJOn9x0IFUAgZUJjtqDIhhtTcCH1U4qpu9ZObaDtfeBN
         MHp+6wEWjqKX7ziiXcYyUVYAxqqeCNyCe4T8q+Irs3PgiZcvoun5TFEZWp98NrfkS3PD
         AzNaOtMU2PfezptchryxNuBz10opUzbg/rUR+7Od9jCGXiO1N7sK4WiAtsM03X4eYLsx
         Nd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=/vhgoD7qxfm3zYO92DyWHYSWUSHeNGNy81/DsHOEgso=;
        b=nbVXY1L5fs2ffjPdo6gtLmBeiQXM7lS+C30iLWmjoDHkcy/jybmUl83DLdwOMIwG2F
         KfPWwrQICDuyNLb1IuWbTmrpk7fp/YP0/4+nvSvoYQBW2AtMrBLFte3yT6JbHcr5fNFz
         E1GfJbcckicG4hU7PCvkx+KkeMmee9MhoobY0/kKlmW6ZPvOfzQb+JdUoLFkvOZhtdaB
         unN16cuNQeI5xG9QxKvSBawfASu6hmjfLoFf35KlKfYvBsu9JQMvSAszQWG4HBb3HWgr
         vPWTlUoPGRAdPXyVydQ+vBvhkJeTLGpXHSVy5N+70rKAg+xruWqDsWACGO3nIUvqTDQi
         MbpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UWHofPhz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si11575914ybq.112.2019.02.20.10.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:20:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UWHofPhz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWTw-0006CI-Bh
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWTa-00069S-Vk
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:20:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWTa-0005x8-8X
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:20:10 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWTZ-0005un-VY
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:20:10 -0500
Received: by mail-pl1-x642.google.com with SMTP id o6so12622787pls.13
	for <qemu-devel@nongnu.org>; Wed, 20 Feb 2019 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/vhgoD7qxfm3zYO92DyWHYSWUSHeNGNy81/DsHOEgso=;
	b=UWHofPhz9Pi3duBD5vHHeZGxax4Bc+osvy66HxilUiOJbdOgeVm0dW5/y7waGhJzOW
	T52cXM0L5CFMAyyzlcEVkk9AwyJQ2aaIl8I51OCRmVj2rSdkoHroQaovtb/pl8acd6d9
	BPEz09joPnBSIVJN8J0gvgcbAD6pQsN5sCXwShCixW2GRjZIzczdUxnoUSAJOhSknlqF
	dn57jm0aQBEdIZcIrfC5raI6XCTMxyZACnUg3yq4cV+24a6+ZFvCXM3lc9yfG0Su6myo
	yD1SUhM9ZINlIrROh0fMNGQOev6tEM4yihNKcDvFZgbydCPr09qZEO0Prc+vNl6KqBE1
	QYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/vhgoD7qxfm3zYO92DyWHYSWUSHeNGNy81/DsHOEgso=;
	b=NRuUoyyHQZNetsJsJQYDYH5Xji9DZlM6CUIIz1QOARQ8ZAIsyR60Fb/GQ4EhBspr3o
	X1feFbMtQ6Ek0w/uswBNGZOna2s1hNaL6ggLSfAl9+/ENkqhKHEUcYtqpyCGceyw0M6V
	nWLBufN5HghQ+GXHcYDn+sO00f63M3h3K+3IQkbIK4ss/HvXw5lJZoGYaMao0FCWdbrE
	JPpR7WrPw/EQrsg+6MDUbgHFFXwviIHaO3nyeTaXJYS/XfWw/iYqkB61j5C5Wz+mVlvK
	q/TSAmZBfK/rLw1olWHjMZQjeK92q2GdJzeauoghX6ZtGaAQI6OLqX/LucK8SEFu73Tb
	iicg==
X-Gm-Message-State: AHQUAua9ZEln4xptyAp8cqCbAG5ixjuRb2j/3czXMOQQwvQK3lVDUb8m
	Hdnj2VGefjqcmaa5am8T9L7LBA==
X-Received: by 2002:a17:902:1a2:: with SMTP id
	b31mr38455975plb.87.1550686808565; 
	Wed, 20 Feb 2019 10:20:08 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	k71sm30074460pga.44.2019.02.20.10.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:20:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <70f7f6ea-162c-997d-6658-79c66e90e850@linaro.org>
Date: Wed, 20 Feb 2019 10:20:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH 4/8] target/arm/arm-powerctl: Add new
 arm_set_cpu_on_and_reset()
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
X-TUID: HaRVQf9Odh/q

On 2/19/19 4:58 AM, Peter Maydell wrote:
> Currently the Arm arm-powerctl.h APIs allow:
>  * arm_set_cpu_on(), which powers on a CPU and sets its
>    initial PC and other startup state
>  * arm_reset_cpu(), which resets a CPU which is already on
>    (and fails if the CPU is powered off)
> 
> but there is no way to say "power on a CPU as if it had
> just come out of reset and don't do anything else to it".
> 
> Add a new function arm_set_cpu_on_and_reset(), which does this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-powerctl.h | 16 +++++++++++
>  target/arm/arm-powerctl.c | 56 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
