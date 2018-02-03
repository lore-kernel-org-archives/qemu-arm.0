Received: by 10.28.71.27 with SMTP id u27csp891644wma;
        Sat, 3 Feb 2018 13:06:26 -0800 (PST)
X-Google-Smtp-Source: AH8x224PHzrnEL7PSQsELR3kor6fYIcyZoDt2cXf4cuk7ONu3HIrVhXUyHYhETAhDwfx+DiZxmxf
X-Received: by 10.37.38.1 with SMTP id m1mr28679766ybm.97.1517691986519;
        Sat, 03 Feb 2018 13:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517691986; cv=none;
        d=google.com; s=arc-20160816;
        b=NBIsTTF1//FQyR9Aqez754H6wHsblPSuv/xstokl7c7v4dpcbrbYGjORYY5BvEs8e7
         PSUrE8KKtSs/1sZG+UFw2RnT7Z0ndthF9lLzdHsQgD2GN40hO19Tm5ef85wAZrxK+hhM
         2GI7POikkt4qwOpsbJuHIPxvVWmr+FGXyCyLGHMeGKNmeahYN/x5DgcvYE+/RSlG7zKe
         WegFPkf2obFH+aRpKLxcCvKDKfAttYkDND2L3unTdYolDCPE2PQiFif27r8AKJUGR2V2
         3ek4ox9PzwOoSfrsnQoo8W2w7q3PomR/jj000pxNhJsXfXfpMyNzMFTHPZHHmVSC/gAE
         fKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=DngGeijO+hH2ennFTk1aQ10k4uLhwO8Tbrw3n2u+wws=;
        b=y9nR5d4+xFLVF/vLOmFcV2Z1q2DOMAWXPWtWOKicY1ZAHPlrI1woDGxxK4WeP4SCE1
         AugJA5oi1BlRFkgL+n2qdH4ZnXo87/xkftEs037skLg79i9fIYzJGbcDHAckLGAsMnxq
         liedzF2BFBGziHfh+Zn1l5oNBcFfWnXiFtVk/3hA9m0IL6CqDGVAPfobA8ZOpmbDvDjC
         3FMYdE626PtWTsXK0TPmjezE0xBt4DTMbp+cHfeyG33BX7uEya2dJfORB9YWzCDsZZk5
         S9Mg7zA3ATQgURFqLnqk7e09EcfYZCApQ5E2OHIQknkwUYT5NFA/4VENPQDClAqMvErn
         /92g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ShF4cPtz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si929336yws.159.2018.02.03.13.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ShF4cPtz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei50z-0003YL-U9
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:06:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei50n-0003X3-NG
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:06:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei50i-0001yC-Ot
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:06:13 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei50i-0001vi-IC
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:06:08 -0500
Received: by mail-pg0-x241.google.com with SMTP id s9so15720079pgq.13
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DngGeijO+hH2ennFTk1aQ10k4uLhwO8Tbrw3n2u+wws=;
	b=ShF4cPtzax8t0WsTyQ4Sr8+rZLYQ/I2ATHF71CFgFpDOyXtP+en9qEUEmN1ikzDLaO
	p0Y+LuQRXmsX/ZIyuAZQCmEDlsghXxRKrgTJQx+cFpHFZkC5A61agJGMu95aLdqS7QnC
	DegRVKeG6vm1WJFigxLZNAiR6aeE8zRvkDahQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DngGeijO+hH2ennFTk1aQ10k4uLhwO8Tbrw3n2u+wws=;
	b=S2xx0EtRRo5FHAPxC8jCAAV/oxdIoEVtrv3NfnYu+Wywk4OFYMgtA5nnk6WQV+kj5/
	HE9Mcm2jEG8PoOh0Yw4gdK+wuhNNJV0NUcD2e0REml+5aTe5Amwo5b3YG5optZgssrW/
	QmTdxObeUEqERgQlJQtOy+DCeKsr5fdbjceVQwa8k4qtUwd99GX9e2bWrYe6TX8Lcb55
	nhkMREUqZsaKl23at+u2ja8zXMUVdrF0ah5Nuw7/FQ9m3LB6xaKOLnrguqMKuDYx8A6t
	Bw6PYEj5KVHgeXf2WiGBri1PGJxGe2Sa07P/aJ/kvJqTlCXqfceMWi/U5ldP+4xJQShE
	CI+g==
X-Gm-Message-State: AKwxytck66lutlCi0PRMCUMVvjNe43R/7FTPVY9oesHS3rVxPCKZlKP3
	KCX9HFkKfvqKV36rD9eQy8wDLw==
X-Received: by 10.101.93.79 with SMTP id e15mr5029188pgt.129.1517691967599;
	Sat, 03 Feb 2018 13:06:07 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	t80sm7364941pgb.88.2018.02.03.13.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:06:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de16ce7c-ae92-e103-aa85-02006937892d@linaro.org>
Date: Sat, 3 Feb 2018 13:06:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] target/arm: Split "get
 pending exception info" from "acknowledge it"
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
X-TUID: ag51ZUeK2wqW

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> Currently armv7m_nvic_acknowledge_irq() does three things:
>  * make the current highest priority pending interrupt active
>  * return a bool indicating whether that interrupt is targeting
>    Secure or NonSecure state
>  * implicitly tell the caller which is the highest priority
>    pending interrupt by setting env->v7m.exception
> 
> We need to split these jobs, because v7m_exception_taken()
> needs to know whether the pending interrupt targets Secure so
> it can choose to stack callee-saves registers or not, but it
> must not make the interrupt active until after it has done
> that stacking, in case the stacking causes a derived exception.
> Similarly, it needs to know the number of the pending interrupt
> so it can read the correct vector table entry before the
> interrupt is made active, because vector table reads might
> also cause a derived exception.
> 
> Create a new armv7m_nvic_get_pending_irq_info() function which simply
> returns information about the highest priority pending interrupt, and
> use it to rearrange the v7m_exception_taken() code so we don't
> acknowledge the exception until we've done all the things which could
> possibly cause a derived exception.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 19 ++++++++++++++++---
>  hw/intc/armv7m_nvic.c | 30 +++++++++++++++++++++++-------
>  target/arm/helper.c   | 16 ++++++++++++----
>  hw/intc/trace-events  |  3 ++-
>  4 files changed, 53 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
