Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4848485lfa;
        Tue, 8 Jun 2021 15:23:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmScIjQoehhjzWh4JWEb0hgHe3+9JmsEZba6miFd+jwFJGJ66SbF/gTC8cN3k137LvsvQE
X-Received: by 2002:a1f:1cc6:: with SMTP id c189mr2536043vkc.21.1623191024235;
        Tue, 08 Jun 2021 15:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623191024; cv=none;
        d=google.com; s=arc-20160816;
        b=iS7G+EEu/0EV1ACMIF3hnwDJr3kypFYM0kfoBE/n0znO4vieTFo/ebp2TkXZplDDV4
         RYCro4t6MAxy4kz+si2I4tQUZ8yun8qLQoGyLw7llk5xWTCGFclJYlZCtahqS/6NLWwv
         OMxcWZwikUvsEH5x2tbYWyItVLHAfIhN/0rLRmAr8KQ6y7gf4+UCJtsJfDRan8HN6PuH
         8RkVKa3XrXOmmQGDOvjGn4itOGDUHVIuwfb5Hi5AuiNhGhdB/3BNDzPufd/ptv6wHhqy
         lAC/tfU0m7qEojmQ9y0Osm5zxko+ZiEUXYUMgpMH0ObaVGwpNOxBBOK/BO8NjroYHyMX
         FtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0CxNvhaSjHkMlrZQCqF9ME3PJvka4xXExulfNpCmYtE=;
        b=RJUkWA2zTEUR4//rMb6AonGBIYYH8/9hyZYCSMFAwcK5vhuvY3HngeKu/jNJBzIhRU
         pFc0VvLybhxmceJV1bUleIfovBnLz2R45NVaDhfD6BWt/yCtUrv1MfLYKo6f4Wmn2qyb
         FXlhEi6P8F681np2nAgUUeD1LhTX9TK1c1LMTuoO5JTzE86LBr5lo2WwBFeuSHmMsWYe
         hl8oYuS3do2n2x8TePbIKHzYefCK//yetNchjeYq0sthngDE+/wk3xeiUHPrHT87xQws
         1dNj5UhWBGxMIWvVyJ+FPBr0hF5n2DzlrHA2pT+BZiWnn2aTKoRZWUlRNEQ5+6yXcozz
         ELPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XTR67y51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si1241592vse.337.2021.06.08.15.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XTR67y51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqk8N-0007P0-Hu
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqk8F-0007O8-5Q
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:23:35 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqk8D-0000CC-LO
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:23:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id l184so2193635pgd.8
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0CxNvhaSjHkMlrZQCqF9ME3PJvka4xXExulfNpCmYtE=;
 b=XTR67y51xQUOXgZ8RTnC44UNaL2aIQhhVG7mJLDCcnwNvfpOWO2dtV+Vm0wnQYPMO9
 7AZU2mKepf7CtoPGKpl0vtGy/UFpoPd1Lcawpmon5CXVL9JM3YjD+jXl3o3qMzkJmBhW
 QrTNpXdzuU2VWgjZ6sGjBhHET4itkZpfNz04TBHIwhwopdRYEdXZg99woVzGGHVMmJCA
 aNfiIqyRcoFgeymNgAj0wyjylKpC5zg+perkV57Xj6MU7rBVeCgfKq+pCCkzVYpmNhBV
 UO03vAKYBovik3MQWoHkhJFCh9XqBxPhKpiHJOF8QaGddIOXObuWmXQh4E+b7XmUBLD6
 kXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0CxNvhaSjHkMlrZQCqF9ME3PJvka4xXExulfNpCmYtE=;
 b=AF9OGKAavtwm9lGt+wVfpq6X7kfOYMfo38OEzfS8scv9ziw0/4KMVlSBZf/is+/BkZ
 Arj0oPemPjxug/8e16wn44VIF5DrWaory8nks5+uEYjFp9VXm/VHuiIOy5ldS0yKvPWT
 mQUEj/J4BgqOuaq7uvcczvQ4PLdIaw/AQGp+xtxHpJZbsCwkIBNb6c7YDQfoHC/+dl8Q
 E4K6FLDuZ+VnZn4AsYDudSTg7hROPNR8cEKZ4n6EN9D1sWeu2DHOxo5H9GKtqixS06uC
 QdC76tNG4wja0DWaVeTDGMHHFYdaArTFrJEsXWub0eLqlmedUf1dSpJsS27ybcsoVxiH
 uR4Q==
X-Gm-Message-State: AOAM533p2NyOZ3fsRieUaOMyOdIWgGoi5CnFS48AeIqXNr3t06ch3Ehg
 pDlI+XVwebig/lFT+Y42mzPOQg==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id
 y139-20020a6264910000b029028e8c906b16mr1975424pfb.24.1623191011725; 
 Tue, 08 Jun 2021 15:23:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i2sm3091290pjj.25.2021.06.08.15.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:23:31 -0700 (PDT)
Subject: Re: [PATCH 16/55] target/arm: Implement MVE VREV16, VREV32, VREV64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bb8e0ca-b9e7-7342-8b79-604737daf05b@linaro.org>
Date: Tue, 8 Jun 2021 15:23:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /y9feaf5Eva7

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static uint64_t mask_to_bytemask8(uint16_t mask)
> +{
> +    return mask_to_bytemask4(mask) |
> +        ((uint64_t)mask_to_bytemask4(mask >> 4) << 32);
> +}

Again, suggest to share the array from expand_pred_b.

> +DO_1OP(vrev16b, 2, uint16_t, H2, bswap16)
> +DO_1OP(vrev32b, 4, uint32_t, H4, bswap32)
> +DO_1OP(vrev32h, 4, uint32_t, H4, hswap32)
> +DO_1OP(vrev64b, 8, uint64_t, , bswap64)
> +DO_1OP(vrev64h, 8, uint64_t, , hswap64)
> +DO_1OP(vrev64w, 8, uint64_t, , wswap64)

I've started to wonder if we shouldn't add a no-op H8, just so we don't have 
the empty argument for checkpatch to complain about.

And in this particular case I suppose we could H##ESIZE, which would then 
negate my earlier suggestion for using sizeof.

> +    MVEGenOneOpFn *fns[] = {

static const, etc.


r~
