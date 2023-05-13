Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5273861ejq;
        Sat, 13 May 2023 00:13:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5X5M9DXbjnVPLVD6W8wa9PUbBJ2aFnMv4GjEiSfsvPEqaEfawddPE8I9aBVQuoxDOpUd83
X-Received: by 2002:a05:622a:1115:b0:3f3:8749:74a with SMTP id e21-20020a05622a111500b003f38749074amr41482371qty.52.1683961985700;
        Sat, 13 May 2023 00:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683961985; cv=none;
        d=google.com; s=arc-20160816;
        b=i/h9zRPXNdOjRTuCwE6eZnJ4rL0hHyI/f7XLaJr2zeccC2SI6FvFjQhfz2hhz4Es3A
         enVFhkyLjW8Hc47Wv90qER/ar0eLhtsavY0idMVfA7PGfz77lijcSEM+xHUES8PZdhhk
         0v/uZQ/TpKfxuxeRs6Z73gfXQY/ex4AGLGhsfPMlJ2ZROPiTMWADZ9l89HyvFTV2v6+q
         b91/47+oR8FvNPveVUlepoXvN093TX+aPT/yu6SSweihIYkY4O3nFobYb9BqctfZ3DoH
         wP3wR2hKkwiaLcQj1LWsWGHWfRGf7xY25WNjEOFUkeJstSN3i20IURkqrr7FayOyTE2c
         y/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xY3LuMzgJn8hRRnGX90DqbNAadAx1G1L3Sd+GeVqc2I=;
        b=xgzzIzSAsgP6JSjn8gpQPZcWmecRZtTGhX2oG23knuRr9em4heDG81q5pC1+/66A5s
         GOtj2RPINeqJ8cSsotY1kPRiYoTIDqD3OxVyUngMUjy/RHkM3HCchRFzHyz58TyYHTD+
         BShQel6rR5x5CJii/GdtzKhftvg/dO3elQq/uvai296F9s48MuITo46SMsZBpmUuVwlM
         ZNTVQGFiS9qAp987yRd02oOz7I+iLVr8OkfoSi8g5+m7g5iCSR3bF1eH91KEnK45fB84
         uYJfceX4NQHSuajEMZtxiBJcC6LSRHV1O/X6X/aH2p9FB2ag/eqw3mqaOk1n+gcZ1Y5O
         fmRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vP9RWs++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05622a004700b003f21172b3b8si6698541qtw.542.2023.05.13.00.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vP9RWs++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxjQv-0003mO-0c; Sat, 13 May 2023 03:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjQt-0003la-F6
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:12:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjQr-0002rH-SS
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:12:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso44272535e9.0
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683961963; x=1686553963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xY3LuMzgJn8hRRnGX90DqbNAadAx1G1L3Sd+GeVqc2I=;
 b=vP9RWs++McFV8Enh3dKunshuXatGE9eCINJTtuvf2dXAQRcJVlIaKQjxfEwIXejQHz
 c80ATP9VuNEnfU81iOWU43IoFe/zcBiDCIqtU+V9Wrfli4SXjbFPZefJRrgFBtxn6dCi
 u5qymdX2BQ4cgLTCdRwKZWMh6eMp3SzLQoKg9gPD74aO+WNWV0zJMRYsqDawt+RtW+Fj
 7vnKK1gI/wJx71m7W7Z+K3IsQztaRwK42rp+2Hg1vTc8QUWAQhq0sruUpK9xDCrCqnQv
 KAOrXroYHjvacahNGIlsA6TWNZijmt+al7C65TcA96pdUEXI7heZxhAf7xjIIqduDFCp
 JiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683961963; x=1686553963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xY3LuMzgJn8hRRnGX90DqbNAadAx1G1L3Sd+GeVqc2I=;
 b=AlCOr/Jnjj+6dSGg0k6ve0BeiMfnCXcRKn/W5mHjE/dvb/teYgIDfr1baiNY+XOaT7
 w/cXWxoizfsbHTorilJg4tQZDISxvQQyTYoII2E7UFdQPi1wMzpojSM9coPQpasWEImA
 9UjO/0NPxWgmuAR3dIrW/EUnHTor8JV06W+jlF0kc4Tow3Av+r8FuDbfkRlYb3qctSe2
 rSLAU8dQNKwRyJ6TtF4ZbfD0uaPRP/gLqKcLd647ARQPnM1FGvsoMqYLDij/vOWSAKev
 K19SYaNC1NbZv6RcgaU84U4vfoqcr4h1hxnAZrjt6TSx8XKp7enuOiGur9AG2lfx6Nv7
 axuQ==
X-Gm-Message-State: AC+VfDyBV4J3GusOa+Dk3ZC8bUQiYsD+6YPRkm1RWlrAodzgtD5j4KnY
 LC1ysDmaXrbX2UyF3ZWAtzj6OQ==
X-Received: by 2002:a05:600c:22d6:b0:3f4:f0c2:127 with SMTP id
 22-20020a05600c22d600b003f4f0c20127mr5206857wmg.22.1683961963272; 
 Sat, 13 May 2023 00:12:43 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc7d6000000b003f42813b315sm15395072wmk.32.2023.05.13.00.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:12:42 -0700 (PDT)
Message-ID: <6c78cc26-ac0b-ea29-0f8c-f2f6538be749@linaro.org>
Date: Sat, 13 May 2023 08:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/20] target/arm: Create decodetree skeleton for A64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
X-TUID: A/8d9aLsJY3r

On 5/12/23 15:40, Peter Maydell wrote:
> The A64 translator uses a hand-written decoder for everything except
> SVE or SME.  It's fairly well structured, but it's becoming obvious
> that it's still more painful to add instructions to than the A32
> translator, because putting a new instruction into the right place in
> a hand-written decoder is much harder than adding new instruction
> patterns to a decodetree file.
> 
> As the first step in conversion to decodetree, create the skeleton of
> the decodetree decoder; where it does not handle instructions we will
> fall back to the legacy decoder (which will be for everything at the
> moment, since there are no patterns in a64.decode).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      | 20 ++++++++++++++++++++
>   target/arm/tcg/translate-a64.c | 18 +++++++++++-------
>   target/arm/tcg/meson.build     |  1 +
>   3 files changed, 32 insertions(+), 7 deletions(-)
>   create mode 100644 target/arm/tcg/a64.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
