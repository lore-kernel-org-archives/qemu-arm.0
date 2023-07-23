Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1230113ejb;
        Sun, 23 Jul 2023 03:27:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFM9Knk8WiQ3q4cqjpfCOna6p730FYGLScXX+NALZKuXWrbHcttDzqo2GalZ+byQGF4AEtG
X-Received: by 2002:a0c:a899:0:b0:5ef:5e1b:a365 with SMTP id x25-20020a0ca899000000b005ef5e1ba365mr4540549qva.10.1690108020795;
        Sun, 23 Jul 2023 03:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690108020; cv=none;
        d=google.com; s=arc-20160816;
        b=KoD5pixPzazWifDuyCCo+K+q0SrlTAai2wkwGQqt6YLfbaRTFf2vtfiloIHoqQTLOg
         6pzD8OHCIH7dMcrPXXCKwluZwNcCMoHNE46RdIEC9592r0h21wJai9bS3wJShhs7p7zA
         u1gXhNICJVe3hBAuJp53FJgkZThd4oMF1qUj+abO2A4gatAeFCkIpGjIsWmXoaxrIuP4
         HHlBsnZuJy0z4Ma9Abphtadp65oUxleoh0cMFm6NnwDwm9wlJMpfa1TSwPJscnuUwvPR
         aNJkyHg9gVyf96QbuqEX+h2E68QOeMa71HyFF/Q7NTePxdYFWOBXE/Ty+ShaL14tHDGn
         R5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qvPBiWYuHTwxKTsuDYlxGD0Kx/9gHBIQ65gjkU0jUIU=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=hY31R+Z9/PWpKgkmh8buH+PvCq3HBnYG4/J2ZB//3rg0HDEknqlcWv0I/H7+/mxd7V
         xa6qK0lrToZg33/IXZC+MAmUdzaHfqn7PNHdwt0pNh+84Od12zW6SaQ9clbddwERdeL1
         Y42RumtlZ/S+KStHoRH08yhATFj0RsWMDdjbFrpoWIeDBgeA+E285GKUe//RUITgK4ua
         2Yf3AHtaIqTVOchqDcai7CzNk7ndltrtdJ7+ExA2okkYFT6EBFMy/9R2jEY0Jr52pF7f
         Sx/y3Lq3r86OLm8VEZtCYp9RCjauMqtmqsvUNrS9kLkVSnvSDWoLqm8OvRA/G0at2Yxd
         pMpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0P47sWY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a0cf10d000000b006060526a818si3783870qvl.294.2023.07.23.03.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 03:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0P47sWY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNWI7-0000zK-So; Sun, 23 Jul 2023 06:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNWHq-0000R5-1L
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 06:26:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNWHn-0002HC-VV
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 06:26:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31757edd9edso158282f8f.2
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690107958; x=1690712758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvPBiWYuHTwxKTsuDYlxGD0Kx/9gHBIQ65gjkU0jUIU=;
 b=V0P47sWYlLJuHM+RuO25QywVtILs8IPWuO04RqjnyUAbrcn/FALZUaIf8LhvmTu7oF
 uhlE2SnXprAhms7t55A2Ri45e8fzYsa1d9Wce5LmOlUq/BLNk8MWUnYzyYtlKXeFkYM8
 XI7IQxxH4ecxwOKxfq7l1WCLsgIFHK09kSHMOns6jDUA125M65bhBTlZvD0+ypc12As5
 /HphPyXOuicvqQaYlLVJwHd3QAXVQvj75nNCE6Ks/l6+1tiHYSQ0vUA4k6ubgLyBwfdj
 59PeeOBuv0zBP6fXFIlqP6vxcmWppj/tE5YfdT8NZGZ8lRhfCA0FDGKejZVn0RMxwKsu
 p/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690107958; x=1690712758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvPBiWYuHTwxKTsuDYlxGD0Kx/9gHBIQ65gjkU0jUIU=;
 b=OjEm8XsTSx130NQJ030zxkhek3BlJdM9g8SBftqyFJWiE6d1n4tMgU9onMF9wv3W8w
 J9VnpkBm/q2a3QwuRq6UL1ABHhzQ8WIvu+392vtwigfj3MWJd7g/wd1jcrw4KFazTH3X
 DBIpqHYvMfbPGe7d7ha/X6gqL8fM6bARaODyNU09J8SSRhx6yRPPaOvMycyMpqGw40PN
 LCyoSItiEkxjLpoIo9TSuZ/3wViEtWGapDXpFoffnB5NXzLRuKcJqT6iJUlwIzWI2g4J
 MNKukl9qaaO/EeH5eb/H/V0O0W+3HY9/50npo8up3Kd/UsPKtUB4V7OBb/5Api9My2AO
 4Heg==
X-Gm-Message-State: ABy/qLa8j42HzeMIpKtCIFU3/H3Bf2O96mLtoSJByEFqdwXy39Or/KCv
 7Yu1t3XF4bYOFQEHcae1f3sUxg==
X-Received: by 2002:adf:e94b:0:b0:315:a6a5:fe95 with SMTP id
 m11-20020adfe94b000000b00315a6a5fe95mr4496982wrn.52.1690107958261; 
 Sun, 23 Jul 2023 03:25:58 -0700 (PDT)
Received: from [172.20.13.111]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a056000014b00b0031437299fafsm9294675wrx.34.2023.07.23.03.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 03:25:57 -0700 (PDT)
Message-ID: <abbf5a84-d06e-b2de-c105-276bad2d8500@linaro.org>
Date: Sun, 23 Jul 2023 11:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/14] target/arm/ptw: Pass ARMSecurityState to
 regime_translation_disabled()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: m5YZVqCrF2iN

On 7/14/23 16:46, Peter Maydell wrote:
> Plumb the ARMSecurityState through to regime_translation_disabled()
> rather than just a bool is_secure.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
