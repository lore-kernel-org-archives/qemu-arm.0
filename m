Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2890637ejt;
        Mon, 19 Jun 2023 09:08:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6I6np/n/A/TK1Yln3sSaOmg8Kwh5ZLdB41pTvGaWEud1c09cflQ/awsP3VOtJ8kCEHMwuU
X-Received: by 2002:ac8:5716:0:b0:3f9:b72a:f0fd with SMTP id 22-20020ac85716000000b003f9b72af0fdmr13353074qtw.63.1687190907024;
        Mon, 19 Jun 2023 09:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190907; cv=none;
        d=google.com; s=arc-20160816;
        b=qJvIC3cA+5RfhwNMgKQbm9hKWTgAMsLmB4UlaqV0w1ZebVhLlSvE+DXcGicg1lbstV
         nwwRvBiNSN5oUKxmrfgqv3W+qNEFtX4JvSdtFUTUQfjRF/eMjsndFFK1zMuXKVnFV8bZ
         JCvhBZvkRQsIxnxp0av5fq4FOQePrKIBkddqSYdivfOWO913fKWEWlyY4RgXCZmOsR8X
         GXVnwmKoImWdaT1p0ctRUyr6qrZtSKAkT4bvTGEJ4S3xIwz2iBNnb5q7Ia5YnDimjBax
         hA/00HVRwKy/Z7jwlmLIvCvSzEmmKcv9CA12HozW+ZO3hVwyglDnCTzwghfh6IW5paKm
         YLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+zpWvBfPNwZY5Dtg089q2fFN02loHRdVAjbeqy2g/pE=;
        b=ZYgI3Gn253+5dprcp+W2SVcuepDHXRJ0DP4fTb3eAv6ZsxvRLOyPzq/2PjP5SckdIm
         /6lGycY/BhsmkBcbEpjzZjVnjwptLqjxY3oDTR44U03fnl6kBgCfXs3rw/sqrbp1wZq1
         /53OiNSRv5N+9AZ9zeJoaxxuET2ZVWoVeH4wbBJHkuhVjpc0YwQUAdu/8NxnfQUR6KvY
         /DaQSGJCJJE60G2lxNT6ZfxII3dIr9fS1cQsPwcAsF6WToe9rChT1bAYhiwAJn7XF/L/
         I5HQ3kFDXIfGj4JGYPPNHWVb+RABaOddNrX6rD8bXqP7PLnfCeIeHWfYAsVngxRe3+J/
         aZoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J04a85E8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a05622a028e00b003fdebf1a40dsi35901qtw.134.2023.06.19.09.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 09:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J04a85E8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHQA-0002RN-Tl; Mon, 19 Jun 2023 12:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHQ7-0002QY-Te
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 12:08:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHQ5-00005g-FI
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 12:07:58 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f8c65020dfso39657035e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190875; x=1689782875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zpWvBfPNwZY5Dtg089q2fFN02loHRdVAjbeqy2g/pE=;
 b=J04a85E8AeXw6K3gn9ulVYQ1pXN/mtEQ/tyiZv0p6I/LziHuZE7KM1f72R9Sd1SxY2
 bVhpzRjLEbjfx+kRJoe6S5X//Nu7Zsga7XbTgB+xap8yyox/SX42w/ZYCY9gzYp6QH5S
 Sn3tdU7oIT5GicqPiCYpu6YbEfeAufMp0eQdicCfC0UMF6Zu9PAeMSNVgRVe1IQh8RD5
 KCdX+dEDjosKWTZ7J5kN7W8fFwB4LJqC/riNzenh+QMv6R0aNtmVM0PZQFEY9hStQ4ET
 WnKrYKKWhzUM9OaX7ospNZBjhFErwufmfr/JCDJqk1R6Z/2knIyXmHc//nK9swqtopUY
 Qh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190875; x=1689782875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zpWvBfPNwZY5Dtg089q2fFN02loHRdVAjbeqy2g/pE=;
 b=K5PFEVDWEveDhEdwBn0XGqO6/y+vY9HlZ09Gu6tXCWFoHqmriafuXXA1A4sMD0Jgsx
 3mCzhhWZLXH8L/mWBKycch/7lniKUftVXk6CU3GqyMMOUwLcbhpxzGVnX699yjjousAe
 pwREIhFW9E9c0WsxKqI8oLjQUGTaPI5MxA1dEvB1MNT8yQl4doNICxOWUflRV/R0QVyQ
 gKSPMnIwz04Ze6xTrAfKMEJxRe3/s6c2/bl6B6Y9UdCF6BTP3ilRCG753nJB6rJId9i5
 qyktCnjUCCeKDcjRjCbD6mTbwlnjaqHNc2ZmHczNC8pC8VrVVoX+Rwo/gl05HU5Z7+gm
 Kv5A==
X-Gm-Message-State: AC+VfDwqFeGkulGEfYHdsEKnfREMBbiN4Gb6kaqlVEDKQnO6cHI5bcTa
 Wy4K84F/okEN97bhE5g/tFba5w==
X-Received: by 2002:a05:600c:2113:b0:3f9:b4b5:e000 with SMTP id
 u19-20020a05600c211300b003f9b4b5e000mr678788wml.23.1687190874889; 
 Mon, 19 Jun 2023 09:07:54 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b003f9b3588192sm2066686wme.8.2023.06.19.09.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 09:07:54 -0700 (PDT)
Message-ID: <13aa9c38-1887-bf9b-f034-b0217308ab15@linaro.org>
Date: Mon, 19 Jun 2023 18:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>
References: <20230619140216.402530-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230619140216.402530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: faH82wbZsZPF

On 19/6/23 16:02, Richard Henderson wrote:
> One cannot test for feature aa32_simd_r32 without first
> testing if AArch32 mode is supported at all.  This leads to
> 
> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
> 
> for Apple M1 cpus.
> 
> We already have a check for ARMv8-A never setting vfp-d32 true,
> so restructure the code so that AArch64 avoids the test entirely.
> 
> Reported-by: Mads Ynddal <mads@ynddal.dk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

