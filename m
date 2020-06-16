Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2876511lfm;
        Tue, 16 Jun 2020 12:00:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPRgFhAKSL0ECbtP6SGqohk9WKcjBijWjL5Tm24kCx2nWf0m0+gVkFxssFlXABDet21O4B
X-Received: by 2002:a25:9c45:: with SMTP id x5mr5945382ybo.107.1592334032155;
        Tue, 16 Jun 2020 12:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592334032; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5fcpQncEE6rW0jCLtrgXbi3l0aJKBWylKUmnIwfhTz7RYd3txoP6FoGp2Rp1Wo8ya
         cLl2uBwdENqLOHdHiLu35eawjKZvbE+sHlJ1xx4NuDJQRPIV+b0d/+dl2YzgPePM1PBd
         rwMFekLPrRl1Vn89C2VYrzMmKeM4CeZelxWWy4uliM8rta1iCbBDuG5bsLxeH3gRKlL+
         dH0Jl7T4d6h8IfkgKlL8vlTPuD2J5SLdaSzW7Qrj/6Qz83+tCkdriq2qL8KY6H9yQFH0
         nBcpWWx2bm6Mz4O2iCzCIJ/eFPOaTsBbIHC6us64oVfFr43JjVgRuIO6/PKoxfp+6PWN
         r34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=o7ps3wGvKL1kZ4fCeed8jixQ/nEFktW3NRHBgvRpEDQ=;
        b=Svguhp+nRisV9IKdKSRxh0fHApLox+B2Bn1Vdwc9xgoI7+EvaQqUOsY/flb8VH4mQ9
         57ROQkrD5nGBm+isODWK+RBpthWHRcBvClvCJhqe5/CtQSkpjq0dV4m5lE1KgO7/iP8H
         vYN0oNVfN16HLI1ynnBh07MILSnQFy6pmdvOPKo51RpEQjOzmrXGj+1bOzodmKXwuhD9
         RHKcRPH9k55/ZAGuOg+6J7iyNj3ZS2AcT5adIHOcD7LUy616vix4gjfCURonyAqqvL5x
         jhVE+TIBQIOGtdXDIqyGLLTYJE/t8pXwZVkMVF3iBG3D5+WpmJZ8ZlJ5V4xeVYLXryNN
         4D/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9seZ234;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si18051750ybl.94.2020.06.16.12.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 12:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9seZ234;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlGox-0001bV-HS
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 15:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGoH-0001HC-SY
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:59:49 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGoB-0001dD-O7
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:59:49 -0400
Received: by mail-pj1-x1043.google.com with SMTP id h95so2023502pje.4
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 11:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o7ps3wGvKL1kZ4fCeed8jixQ/nEFktW3NRHBgvRpEDQ=;
 b=p9seZ234ejiKxnsCIyQW2QzMxHYnAnyl7BfK9fxdLOD4bw2H+60fFIFNfNjG08yIto
 X4Uwc5RAjUNiuaQGZwltT9SZ7oUdrECdLIy5JUTTA9OgedATppxylAUv+oFcuLZit/jP
 HPiT74P9fk8vLeaZU1W/mmxTTtj3C0FpUxqVHm6+A+cb+MvMKp+7tvBivguLOZwtmPAj
 K1zIYEHw8/JWfCOnUbzmnEDIR0WK2YKUv625na8T+y9CYAIrmkIK4Nktp3lsD4yxW1wG
 RY5yG8mzsvEgu59QPF4lS02HQXQ9PvyzG6IhttvBxPoBzcdfEQvIEQG5H3nTDUeoa9SJ
 3PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o7ps3wGvKL1kZ4fCeed8jixQ/nEFktW3NRHBgvRpEDQ=;
 b=BdjaO8BPSxXh/WA8GoJpsBpZ8xjk6qd8kP0SUKpBYR9jNKZUzX/RwMOBbUOurGUyHF
 carb/8shGS96XC5ViW4ITruXAvEjWu4CMLG6KVsit/1t9wdFB8aD69RY8LnNQhQOlDU5
 dFL1WDQglqOemYAlfIrzxVlq/OgziodjW7QNhex4ror+v1bPQRaMlhXGG5vIgYzhfJZV
 Wd+k+6TOpwLdv0s7QNKTdSKKW+6xHYAFoPFQP8tqVRek32LX3KQV1KOokWRwUIptuLBA
 eexfqKaQowSt+rGADVF39Hsp9tev95H+e1jqpvJql+jafuLV0s+g4hoAeShMKl6UeNbN
 WDAw==
X-Gm-Message-State: AOAM530KKIgdhNKtqIrFHmI3d1GfIQul8IhKwBNLTwLT4K5HXJExQAZ6
 boxUHtfNxlwBvYQp95v0Q5ve/g==
X-Received: by 2002:a17:90a:6886:: with SMTP id
 a6mr4721617pjd.170.1592333982246; 
 Tue, 16 Jun 2020 11:59:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m7sm18295967pfb.1.2020.06.16.11.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:59:41 -0700 (PDT)
Subject: Re: [PATCH RFC 3/3] target/arm: Implement SVE2 FCVTXNT
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200428174332.17162-1-steplong@quicinc.com>
 <20200428174332.17162-4-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1760d76c-068c-4842-f5dc-5f4b3f3719cd@linaro.org>
Date: Tue, 16 Jun 2020 11:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200428174332.17162-4-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ij2HyDdnLdMd

On 4/28/20 10:43 AM, Stephen Long wrote:
> +void HELPER(sve2_fcvtxnt)(void *vd, void *vn, void *vg,
> +                          void *status, uint32_t desc)
> +{
> +    set_float_rounding_mode(float_round_to_odd, status);
> +    HELPER(sve2_fcvtnt_ds)(vd, vn, vg, status, desc);
> +}

This is incorrect, as it leaves the rounding mode set to odd.

I've adjusted trans_FCVTXNT to the existing do_frint_mode, which handles
switching to and back from a fixed rounding mode.


r~
