Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp565791lff;
        Fri, 30 Jul 2021 13:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ5XNAP389b7RyUZiDQ2f5mHP77ga8NB/I8yQ5n3ForBCiRpodnu/lz/SDLxsC1cHzMa0U
X-Received: by 2002:a05:6102:a8d:: with SMTP id n13mr4141062vsg.17.1627678103773;
        Fri, 30 Jul 2021 13:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627678103; cv=none;
        d=google.com; s=arc-20160816;
        b=xBqEcIadtnIebuA02XQX8w4M6wCTlTOSduTn9015uDITk+ljHLgzsWT6kEk9XtNQwH
         HiejsaBIpxTnHot32viS7PpqtrFngOGrbzryL/YuW7wYc2Sv2Y6W9KzUhhQW4Gluw29O
         QmepK0e7EnIN+xt+D9f7c851w6k9sAiy7hnIaDb9IY8bi2sRz4XWiUNAPhJ44cCqyhIJ
         S0w30xSzrjuACkZPdUdaID5BeeaYK6xz1EnYNk7XSSm4q6fshix/Pa/JqVGn75nZNs5r
         9WcVXykqwDe0RhUCXWHxiCBQdvZPBozzumXEGuXhg+uLvIwDy9MrP9iwjmdyLuwzgDtN
         7hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yz5OLg5pGlrSKGa0UcEVeZkxigk9Rt5OTZ6QsYt5eIk=;
        b=xm7is4BmQBlmcETJacUhKEcYtCQcN295jQjt1k62Vrs+Tj1YkpWpUmABC2aMajNwB2
         g+k9Al7Kgw87gjHdpzIK9KJ7HI2OrEHHbj3joiQzDW+Wl8nCZzBjN8vEBHmqubTGutK5
         VIDGnUsqAkO0ytuBX2922bzgX7tLKraTM/GJzGhWZUgdIiG2q5iGh3KYnW27qFQ90Y6+
         ydnDqWFArRlR6ylKGTj99bDVHW1ALoSzLFUkooKX1oRNOln/Bfji3RQqYV1gKZq23Hqu
         DinVTljqUxKS6k9aIbG9hDrv5vqrfkhIJz5C5KdTnXr4qg/0lJj0M2WKNIBiMNOcDnvR
         3NjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLYMKzQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si1793742vsf.2.2021.07.30.13.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLYMKzQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9ZQd-0005iM-3i
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZQO-0005fV-5Q
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:48:09 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZQI-0003GG-2o
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:48:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso16066624pjf.4
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yz5OLg5pGlrSKGa0UcEVeZkxigk9Rt5OTZ6QsYt5eIk=;
 b=iLYMKzQn9T0OCKJAjDV798lG1O0IHSOJ/y8mRFSwYx3J7YH4jrqU6U1x1BnurttKln
 wocX/VyulevDa95XE9PGMf7KxH+pWbHbGmptn6oId/AXB1E/NFAaie2/IMYLSttJjq2u
 4sIYJrEsTUN38PIC13U896UclN1iWVpknaOxTQtdZF0th3SbbShPyj+j9FqMQzd6BpwF
 0/ieK82Ex5jMQAm1oAOwyYybr+61+S6vZkWPr9+qedtLh3f48ueu6iistDPOZophXi/9
 KPDUbIfQpcSK1AkJnq2rCGFmAgvXTodAWtF37RLs3IH713uqOTYCdvKDDDSfjcI+k4HG
 Po7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yz5OLg5pGlrSKGa0UcEVeZkxigk9Rt5OTZ6QsYt5eIk=;
 b=WSemw7h7u5cfR8EZI85NiCEBRBzm6qHuyQnU0i7HLLm8X0NLHvVL24VhAv/xnWGoL0
 lnzPOGUCe9YGkWAVUxVSSBdgwgfjXPayZphquFpdMNP+4Jb09033vK+/TbyOvM3ZJonG
 JFKqNOILze3dR7aOOnLhG+HeueSTP7W2l0QTyB0jzyzVSRqvQ0V+Pr0ONzzNWYwfC0v3
 w/i8TvIwoQ7xW9ClVlAjGuPscnTJI+iCIP3GfVXU1tTl2ghsYZ7BbTWlKJUk43BoM6AW
 FvToviVa7eqJgWtBTsHMq+nTRMJ9ALFo06qktqMN3k18C1e/Oqir21+OTkVcw9rlFaZ7
 zHvg==
X-Gm-Message-State: AOAM532pgZt8wXT5fxQPqSR9Rp1Inpu/u4/xiqmRW2ZzyagH6v34jKWC
 awHbbqUaF6Hf1k9kEWlacf1mzQ==
X-Received: by 2002:a63:f961:: with SMTP id q33mr2407142pgk.82.1627678080348; 
 Fri, 30 Jul 2021 13:48:00 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x26sm3370055pfm.77.2021.07.30.13.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:48:00 -0700 (PDT)
Subject: Re: [PATCH for-6.2 52/53] target/arm: Implement MVE VRINT insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-53-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56cb11e6-d169-1139-3450-b0be815d01db@linaro.org>
Date: Fri, 30 Jul 2021 10:47:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-53-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3b6SJNUjWxJF

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VRINT insns, which round floating point inputs
> to integer values, leaving them in floating point format.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 +++++
>   target/arm/mve.decode      |  7 ++++++
>   target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
