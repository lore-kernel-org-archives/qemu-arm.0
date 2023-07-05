Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3661367ejy;
        Wed, 5 Jul 2023 08:36:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzG1cbjgjAQo6ONHWAY5U8UGEafeS0oBGIwRgBWmn1Ole1+BSUXE81Fak7So3lCe1vWm/w
X-Received: by 2002:ad4:5cac:0:b0:635:e25d:7eff with SMTP id q12-20020ad45cac000000b00635e25d7effmr20419068qvh.6.1688571377078;
        Wed, 05 Jul 2023 08:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571377; cv=none;
        d=google.com; s=arc-20160816;
        b=fR3lrLAPwvbWCC9DBwDRwlmlfhcznYL3hdl7yMn9m9j3QyeK5lbOrN/edqElsiTvHH
         qm9drKvTByouRkjzM3+OlG/9ZkwLCxylJKfnFYF8ZvxD1sSqq7g9nOz59ns7ws7Hh4x4
         uyI1QHOIj44yDJQMJ8GWMxrxn2yjG6yIKpX63MlGLj15G2bCKURcTO01S5JDyQoUe84B
         bQRMb5NsNnIrkytKpct2haPgkLDzzyyJa3U+q6500M0YYo4fnPNwP+LvYEwe3DrAX6BM
         jZBDEnnlaNL30cES0BKcRqD6S3TGA2bgLyNSZosHTm1CG91NqEY0ORmAhdqM6A0stMh3
         J7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/1P1T8jOCfAGQ8DJzT/zpsYSziVzWO3nB2roOeoQ9a0=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=j29H4W31FT/D2ca0zK1bfMj6Hs1EPetV0f7aOTIno34q+2ce5aV2yktqxxKECrZMx3
         KmfkleYANmullk/TiPDh/JNdQeENortOzEyHDebQ+nXTt8K2HKH2BgIK8skisq2pL4gy
         wCW06JuGO0/KP90G7wPCD9qYYGdLRLRD7dXjDYjrxZ9g7iDn5tP0RdyGevemhCAbpC86
         tNFoJxFXLoLhlx84A1QpjO8oUqDDHEUqERHlr/3nG9uIzXMrATaGvR7xLECRz0R4w4gJ
         rM0VUY9FiWa4OShKtRRKi+EEdbgMCHDPBf5gLIL8W321d7eKPp0Q7LJ8RiCAhjil0+ny
         6V5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tbH/CP0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey7-20020a0562140b6700b006260dfdc73csi15948998qvb.26.2023.07.05.08.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tbH/CP0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Xz-00042y-9w; Wed, 05 Jul 2023 11:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Xy-0003xV-4E
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:36:02 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Xw-0007mu-Iy
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:36:01 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so10782277e87.1
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571359; x=1691163359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/1P1T8jOCfAGQ8DJzT/zpsYSziVzWO3nB2roOeoQ9a0=;
 b=tbH/CP0/TDI/4O2LlTJB4qUr22WBOPwp8wtdEAMl/6Dcu7fqASm9Iteo9rrinf53za
 eBi9HFm/8Rnm02d84OHvgQz3N5w+Qi15GuoG0OfcfSaioVK6CeofuQ6sPJnrgd91VdXr
 J1bOxN+hQXsiBqMTAX/hpcpIybre+Zl7cmByuNYiAgYWNneZklfb6c7IFnzrz43eUTwD
 wOsM3ivK5D/OcNceUPrQkNyV9FET24RlslKvch1Ltt7Mm9QtlqVVPN7qaByb/bJI4fmm
 9YwQnEKtpv7c48OxQezQeMZrLkTMP64mcvmMzobKRGJVIH30U5rX+etqPcv0/5y1ejAH
 71gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571359; x=1691163359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1P1T8jOCfAGQ8DJzT/zpsYSziVzWO3nB2roOeoQ9a0=;
 b=g6NLcTZy67B+ASyfoCz54M2hmYci6pLZRYJXMuJ/ooZmuDynPwZudHq5nSBCeaMZDs
 eefBjgvgAmvB+nE4RkBsk166VYteoNCruHo4EKeW1g941OeJbQ/+8t7efkQWMMhPfRmw
 FmnSI/TUfjKfVaW12GF8AsJJlqDAjCDiISuJGvRVqZmnQtwaq+e6F4C1RWDkxSy7kOOq
 LvjWZadxPYNRWRo9uh+IiHa6h4ZciwNl9ZuWhcuvSGHgJx0eH99vDJW2Sq9rCDiNBZSG
 uI+T3JhLRjUnnd2eG8tBfCeAXeocM6hd3SWgplhN6RKhiGdAUMaBJz+6rjgfmfiqUwrG
 yPpg==
X-Gm-Message-State: ABy/qLa0D56/Fo7C7I8XKMA84ofiMP4Kqnp23eorbd8ULlHJ20PE2Axf
 P9bmY1R5EmDvuy8mFk/BxjoIZMS6hhqAt95msRiz4g==
X-Received: by 2002:a05:6512:3142:b0:4f8:75cf:fdd7 with SMTP id
 s2-20020a056512314200b004f875cffdd7mr10070942lfi.22.1688571358809; 
 Wed, 05 Jul 2023 08:35:58 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056512040f00b004faa2de9877sm5353340lfk.286.2023.07.05.08.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:35:58 -0700 (PDT)
Message-ID: <35e86604-cd60-529d-90ca-8824dd66a62e@linaro.org>
Date: Wed, 5 Jul 2023 17:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 11/19] hw/timer/arm_timer: Convert ArmTimer::freq to
 uint32_t type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: 8mgqxh5oI96v

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> In preparation of accessing ArmTimer::freq as a QOM property,
> convert it to uint32_t (so we'll be able to use DEFINE_PROP_UINT32).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
