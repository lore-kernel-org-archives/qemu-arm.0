Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp714015lfu;
        Wed, 6 Apr 2022 06:53:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyxWEBEAJzJVVy846x6Nwjsl6ykp8b4awVHFPLBtMf4F9EkVpCgTnYGIkij2RQVyMZUPzJ
X-Received: by 2002:a05:620a:4092:b0:67b:31a3:881b with SMTP id f18-20020a05620a409200b0067b31a3881bmr5772406qko.710.1649253204772;
        Wed, 06 Apr 2022 06:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253204; cv=none;
        d=google.com; s=arc-20160816;
        b=Mjp6R3/4G0QtyYL6oXSO54v4IDDoj5ZDkLsA1r4fy/n0lnz74Rwb+e8i/kuoA1dHoO
         M8Y39yR3VQW6yPFxbpI4nbI909uv/aFN8ALvO7UwljXqvtn0wH8bpZOkDHbPEX/qNLq/
         4gA5pGrPa9SS+VCv5bxshs6dHQjqTCK0Mu+sqeZNHwYuupxKSylk9TMmE56Z+XqzZ4qh
         M5zRxggTMNcMCwG/aXd9sZm5Kn4RuRDzPtXBbdV85VNBNKslPR1uoSWrPnoXFnk1XC3t
         BaWrJlvHdLiNAlPAYO40bJE6tFBRTuHpST+Byg3IZ44DPl5IF2qBuzr8eGf2UhFs8WJB
         LrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Eu9q923+4mh1ex17Ktmti+jtR1M/Zz7kkNryAeOmTuQ=;
        b=agfpdSWOwNhHsEVObT4RKgKwmweQMdUQaBxv+6PmdtuwqjbnO805ZChPa4Ryf6ybHS
         GErWr0W9Ddp+WMQAZdXRkILQjiUffy2/6nDEJbdd6ISa0DFBHvuoyBWj1pFJ4XS/Rb/M
         kO+q6aDwRcsnEYLwtjoo6uKyizMFYsreYB12ZzqqIXpHzyJ/otnmbZSepVz9K2zkYnLe
         d0ZRk6AA+5CpgKnkcZdX61QTZXhd1guRkR0yoauLbu3eNT1rHv4nRJDohBLJNBap3Dlr
         byEXQ8alRNghJCEuEzGiZVJN9vlJHiBT1myLaAucPOFjJhIVa3XMzaCNhG7EQHnNigoF
         rmoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U2Z++Eih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020ad45c8b000000b00443f8937314si804101qvh.19.2022.04.06.06.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U2Z++Eih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc668-0000aS-3i
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65f-00009P-KQ
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:52:56 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65c-0003vm-N0
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:52:55 -0400
Received: by mail-qt1-x82d.google.com with SMTP id o15so4312620qtv.8
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Eu9q923+4mh1ex17Ktmti+jtR1M/Zz7kkNryAeOmTuQ=;
 b=U2Z++EihF6WGUTTrHjn+PlaOzjhwwfLOQB3o/xScQEcvgPvdkX2wv/RmmXhTTQsCgD
 EnYU63QbBkCDg2YbMdu0+Axds6/YDgSuOgtDw2s2kZptEXaQpQuRAAn88gi0H2z4Yv6k
 cvo+uYu51X+Cf2HZb4HHBZ53eL8vT6u1FU9m2ki2z5UxL2d5BfpcNVfZJEqv70eAwMmI
 Mpt3bj/s9AW30OWcxYKkShOMfh0TolOTv177jY+P4QpGwvfn+qgSb6UJOOSjmOC8PRKA
 BkiyU9oLpSaiQ5MRw1hyoV+pR696o0N17R9S5Lb4a8mySBthOACSyqbgYWkcB5vDnhj0
 8OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eu9q923+4mh1ex17Ktmti+jtR1M/Zz7kkNryAeOmTuQ=;
 b=qDt3Yt0yT1Yq+ZL39jnNEusaiFUGIHTQBVpyGoS2GzSY5qlTSLj7ZzROHSJlPzrjee
 cvLBL8x88Xvg7xO4cKurMv2tRlkvRHsHZryNUtGhrf3XqXuk6vdbK8BdIjyh/2yoiNJ8
 a9cKN1RfVXnAob25TmtSxNzBb7ufRCgx9rBr2ebfcHhDkQoAQSc5EuBLssQknREVGP1V
 9i23r1qY2mJNsegnPow+V+RjxbYq5MWXAfzj+ENJkB3EEoob6YCwNNfiUtQIgmVicZPN
 2g9yM9rctzqSugEnB0CaNbCpP3zgfCQ1pai0gbqEZNRV1ghwC1HUJCaa4xwSmMHOOHOl
 YKNQ==
X-Gm-Message-State: AOAM533+oRU8CF6PQ+4jctdJN4+MMKmb9nlzSeOjv7usJdwdhtWC6HKU
 p8YpLbYjwUZaHBgnsb3i3ZEAiQ==
X-Received: by 2002:a05:620a:1371:b0:67b:303d:b5cd with SMTP id
 d17-20020a05620a137100b0067b303db5cdmr5794619qkl.320.1649253171208; 
 Wed, 06 Apr 2022 06:52:51 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 u21-20020ae9c015000000b0067d4b2e1050sm9543140qkk.55.2022.04.06.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:52:49 -0700 (PDT)
Message-ID: <be2a2b37-5cdb-3283-055e-764c49b70d8e@linaro.org>
Date: Wed, 6 Apr 2022 08:52:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 11/18] hw/arm/exynos4210: Delete unused macro
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 64TwrbpZOGj7

On 4/4/22 10:46, Peter Maydell wrote:
> Delete a couple of #defines which are never used.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
