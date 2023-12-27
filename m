Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1182254ejc;
        Wed, 27 Dec 2023 13:43:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrYd1vhncOkRUqnl4opkNp7TVixj1GWD5kCbW2GXJihkxi9X4yDj+zn/vPCaC4RZVIMYj
X-Received: by 2002:a05:620a:8905:b0:77f:be54:f365 with SMTP id ql5-20020a05620a890500b0077fbe54f365mr11355254qkn.78.1703713399313;
        Wed, 27 Dec 2023 13:43:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703713399; cv=none;
        d=google.com; s=arc-20160816;
        b=eBW1YzImyIuT/DNLSdb5aUXExtgMgI/RegUY0vDjaxS1XII7kFfqiTywERxpMUgmqM
         mxupkz3tQI1Is/E6ij0qtxiA6h4jFxmtCJf5/E9b+Ac2FQEXUYzadj1c4mQVx92jI1wI
         71KD8Lr6iHAgFfWHdVCe2XVEoPMgOTxNEYbB9JPp8ShdY4zZzZjnINVfuV66xIdde3EV
         f2sVXNi/e/YouzIYC5VdAwBM1IfNCRdgXEGbVbl+EuIA5OCrvXv4iZPdk1Zw2NxwXcLJ
         Q9z4EujBql/GGIeBsDqDA7H4/89ANDcio1WTATutNFPyehEKvYZeCvALt0zeBDfKOjmH
         qo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6VmdyWbZtc844E440P2xTgzkhKdKUHFYrBtvlgi14z0=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=qrNXeFzR1wxL28liF+8p1jXaLS3zj/+nPjikudeuALwN3Kyd6+XUpGLgljGW3iG0/a
         z5xs/ubbbWKICRaUuYo5GzxhUtkvxXt6DNTGt/blsvbrUJLPhfJ7qkGWAUfAfNOSC3l+
         rOxNjmtp2GZoHRgF3rBq8cqsHHtDvnPhBwYEfX+j5p/GCvTmNXT1vWOFLyFFF3dzxk4o
         Up3umGuKthpLsgXx90nRIKkslHc/yRlv32DnvG9Zu/ntkgWYk8/FZRcZQU2O+rHCPhX5
         tHOgw/iwpT+ni5MOMyz9GOlQKkqN08+AQdnS9HaQXLOm1NGsoQQLE6wPG4XDkUk+ovvk
         jfbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=um1aHK7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr2-20020a05620a390200b007814aa8eaedsi7469156qkn.108.2023.12.27.13.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 13:43:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=um1aHK7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIbg3-00083r-0V; Wed, 27 Dec 2023 16:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbg1-00083U-Kn
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 16:42:57 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbg0-0003I3-5b
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 16:42:57 -0500
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3bb968c02baso2485522b6e.0
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703713375; x=1704318175; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6VmdyWbZtc844E440P2xTgzkhKdKUHFYrBtvlgi14z0=;
 b=um1aHK7qL9ozmCpmB6P4jgJ2eSzACGpz/b+5gunMp0GfPGxclWTkb2ZHKOupdL9jP/
 EwzHaDc55d6RyUhitdOwAn98nd5PsFdpCVgXIMgCCcfw2FHGL2IaOK9lskEB3WJd3uE4
 YUHwOQPkrkc6Q0TVRk/nhafGK3x4ORDsS8nnR4G7q7y9P+R4v71YqsXFMTbmr4ayteTe
 Z0fJZIxxINPBWGg2Sds9ejC8pWc4E9hrKGe6dAD9pYwjki5WQ6uYzUS3lIxAWDdtbv10
 QD7OH0onUZ+0enB9zeZ7BpR/JaKxx/dATSVlJFy7vBs6lYDIozBqJVdTrVoyn9doPC2F
 siHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703713375; x=1704318175;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VmdyWbZtc844E440P2xTgzkhKdKUHFYrBtvlgi14z0=;
 b=cYsGgwPfaDWBwZoCcuunQWaoCfRvZF0G3+FM+krQlxRh4hJu5B/InqJ0vIiTcP8wAM
 InNouyQTd7sokSXafLROg5oTjtf/dd58vgbSsyKJGzsEZAT50eJ8bMzUmHKGNknU4HSI
 sawSk8yjXrfIkZTGgIYnAxpGd1PKTB+DM6OZlhMgKYoICLnaIpAGYJr3Vq7ulpiRaxLD
 sL53UAhbB9CaE1v9lPvnAFuI1Y5b+PGK1HHI/1Fw8z8J0q6W1Rp8gpJs6Aqr3ar15Pvy
 BGUb6tE4jruxOAIvMIGHwVD8TH7khmbTXF3P9DCv/MNqVuuPSleMuiDLiJL/9OzGnbV+
 /gCQ==
X-Gm-Message-State: AOJu0YzLAMrZrrJ87XXT7e0uUpTDfIJbGdrExwWFqUkMTyWBIGk54gQx
 N9ZLvtjSj+RV3XnHzXyAgXzv4Q/MQbKtbw==
X-Received: by 2002:a05:6358:63a7:b0:175:42:e60b with SMTP id
 k39-20020a05635863a700b001750042e60bmr2571461rwh.5.1703713374681; 
 Wed, 27 Dec 2023 13:42:54 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a056a000b8a00b006d9b30b33b0sm6683592pfj.196.2023.12.27.13.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 13:42:54 -0800 (PST)
Message-ID: <9d289bc2-d050-4348-98ca-cf86140be5e5@linaro.org>
Date: Thu, 28 Dec 2023 08:42:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/35] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NV
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GoOthymygztJ

On 12/18/23 22:32, Peter Maydell wrote:
> FEAT_NV defines three new bits in HCR_EL2: NV, NV1 and AT.  When the
> feature is enabled, allow these bits to be written, and flush the
> TLBs for the bits which affect page table interpretation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 5 +++++
>   target/arm/helper.c       | 6 +++++-
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
