Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7F0C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEHN-0002SX-7J; Wed, 30 Jul 2025 17:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEGl-0001Ai-ST
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:23:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEGk-0001Y7-DJ
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:23:27 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so275599b3a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910605; x=1754515405; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BFGy9NrK9pvXAIOHSataagHdALqFKL74LCum85+/wR4=;
 b=QvXuYKClu1Y8YvjjocMpgVphU6Vovb0Gf7ink98FMHVJhVNhSjfCUybkpcDO02a3H7
 DDQZO3wVdjKmhwE0yib4Fi1z53QT0VcR+S3JQ++jfwCvh+2dj2LUvuimo8NKkrtaKCLc
 WeGUkEqkAjmhWe+eaPdaYBcq6Mqz70cZrdT1CVHvkUYg4oKGe8LLHyhC3TTOWLjfInhY
 1fctsbniMnHq3wjGhO8LNa++En1YICagCinXvx74BTNgL/7D73TQ2NQk2pUER6qq9g7X
 uuiS/GqYbvajDjc0r22vwM+xKed5UswF76p9Rfd5eWCiR7HQcUqApfVrp1h9aHtG4Cn9
 UhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910605; x=1754515405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BFGy9NrK9pvXAIOHSataagHdALqFKL74LCum85+/wR4=;
 b=OsGy8tPrn/qfb3sNn/6IXZM8CaLLavmG38+QqC21pwL9wwEagLDCzG4OgxDmalZKna
 r/as66WMz0qZQAopzhD3IBkwZZAS1cfMeiAFf1wg2csKf10RqRjpJMFc4AVWs6NkyU+F
 mCkYrQq8QHij/q4Xl7dG14KiomH+zyCi2c4m0T3YRKEd0UhBaq9HL5Khz6VRk3LAvMvo
 DASbWiNJm2O0F9oAwKaBnQuJYrXTE7EYU+H80IER1QSt7GUNt8/s8/xWU0eXNv6qc0kV
 8XzibGMRK5cbzsrLALrDpoCzQZV3l512ylDEIc9aGK5ZHJ3PyQt1UBK/HDvkosnjWKLV
 M69Q==
X-Gm-Message-State: AOJu0YzDOJn1sww1UFg8YKMZCVrCM9NNvbTrcIyIk01oabzwjRrbFM0D
 zEqUowujoJJ4RB6OuYXKRnfO8rvDH5Ow7JKsVCr8DiHgi8b+t429sIFuw+n9TAE9V3dgSR04tMg
 oYt+l
X-Gm-Gg: ASbGncuDVCdfm4rKuhuILBN0LA5DSlCgSQ31YPZFAtqvfozM8RzMcweSLQ0KAcEVg3b
 OmXRqOJTWHN0Zix3av4eOfe1M8LwS2gMIUwOO2Zb+/Nkkx93AZpdzvL2K8pcGdAAMznwDo4TppZ
 XbUYSvS4GJ2ST+LoVPez/MI1JLaO/vyCway3kv3g/z8dYCx8CW8reYWjL4q4HssEQQFiVbNqeC8
 qxsSkTGz1tQegvi+IE1BUDRegm3YOyT0SNacakhdbiFC6O8IdfCKDdo0QouOJxyikFWogAmFrHJ
 Wn8D5G6mNBHZvgVkILPxOKhc5BqICB2QK5nvSWEt1s2luBCqfUHyPuKFzZ6FsgpcaKVYmRxKqzP
 +bUOWKA48JT/59A3GEgtA4rXoCrghXXsbSJE=
X-Google-Smtp-Source: AGHT+IEdVAsY0qc6XGQMbDFrJuiTT+Qeb3V0NjYhmaJpJ0RgNUIE9wRdjU2r1DCEtksM5Q86/ZRcAw==
X-Received: by 2002:a05:6a21:514:b0:23d:c9ce:8863 with SMTP id
 adf61e73a8af0-23dc9ce88d3mr5736508637.46.1753910604804; 
 Wed, 30 Jul 2025 14:23:24 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfe5absm10725894b3a.69.2025.07.30.14.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:23:24 -0700 (PDT)
Message-ID: <0d162634-f6a5-4896-be8d-f6495ebe07be@linaro.org>
Date: Wed, 30 Jul 2025 14:23:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/82] target/arm: Convert arm_mmu_idx_is_stage1_of_2 from
 switch to table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-39-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 19 -------------------
>   target/arm/mmuidx-internal.h |  8 ++++++++
>   target/arm/mmuidx.c          |  7 ++++---
>   3 files changed, 12 insertions(+), 22 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


