Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6B2C83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:59:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDst-0007Jw-VN; Wed, 30 Jul 2025 16:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDVz-0001PY-C3
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:35:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDVx-0005ep-LJ
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:35:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so4262785ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907703; x=1754512503; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=83iMmGOym2u/y7T61DrKEIvLaUsK7Fe13OpXjZFMAXw=;
 b=jWIchY7HwpMOZzWeovKIJSKVUevoJZlFEVdnDUHCBkTL2rPsmU5Y++ybx1F6E5kIKG
 PiWbKV9VkWZhxFOh8PrtUANOaX7yhbAQ8TtN6RMqmRe3elq3KNKncm2O/N9IWKyfS2Je
 hruY082h+bFwJInvQZqe4dw7berr3vRE2AuqLfkJ77rySIQMLaTouW5AYR5767/VOSOq
 4m7M3e43C+eLQe0km6c+UImbRpo7a2QM8pRlndFzEDFygVaH4I/k4/UlNlX/QFlHTCPZ
 JulMFq2LsDenSDjZiF9ShYfeGAO/BbKj2RSccHkeUTPhbS4iJ/ZUBgs+m2ABvZNoZGNz
 Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907703; x=1754512503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83iMmGOym2u/y7T61DrKEIvLaUsK7Fe13OpXjZFMAXw=;
 b=wFBg2nR8DulXtroEff4KGVKhHMxo6NeCo6ePfZnCUQuwLQzC/jGLOektQRANkk7Q7v
 2e/zJ3q4T7A6+en2DyM5D+g/XHWdjtJ3+3V5sQfG6r9ArLniE0clG9xtk98Fvjkya5AQ
 8s01D/0Kg8oXV6j9nFE5vTlfp2vmBLanzBJ7TMvax4gbwq6psCu3iedPBAiK2Ib/0Abv
 9NplQAcv3YlULTLplxJqgcsZh9pCeWxe0x6xfT9fVAXZ5IyUmAwoEA67/56y+LWb5r34
 rZau00xcw60oSLdZpi8jwBPwkf0AdRiUseE8ZK2WMslC//2vV4SPHrmz3TdHPAJZj/I3
 HbsQ==
X-Gm-Message-State: AOJu0YxemrDHYg2/TDYjAEZSRliSD9f/KdxBpqgq8zxuIEU/fcMnsY+4
 jAf35cUtOHj2Pz+YmSKdhHT6Ep1+PPYwsD+kdWgacKHtID4O5Qq46U+N4JSdWAFDvjI=
X-Gm-Gg: ASbGncuX4TRIAC8S4AvwKNOFVAi6WFIlL/5ayTPIlyr7FpyHSOqdEMZ7snNpK4OYDSg
 r36NrsZX38mtjCAcz35RVPYJJycPlcBmX3XfyjCj6pgyMNnTGmZYIZ+TKT9NK++QFmoQUdTx7Pp
 lOQiSrQ2aeWP7K5vc9wlUqL44F4Lr4zKpohWDZWcpYfwOGL4RcK+8KrSPxAqdLoC1T1Uq5hNEQM
 UhEcTK/+hf0qlCQV9TsxUNY5X9lqM7VZLL+FeNbmt0FIq0HhboCfozivDIeB1V5kRJ+f+pswFNX
 qurlniW+9hGvuVhprFhAjf7yKOlE1RyUcJ7QtM0+oEufDeKwryPU/5NMb5C36H7fAJf9wUaCEuE
 jyI/0Sixbs0Wz5Qyyo9VWV/rQeHN3eEw9g9c=
X-Google-Smtp-Source: AGHT+IFNFLCjDJHBHAQKFXqxsQMSLziaAJZBe4+kwHkbcFJx1IVsm8+2rrJRr52PTpZ+PKQR/xzLqA==
X-Received: by 2002:a17:902:f686:b0:234:b123:b4ff with SMTP id
 d9443c01a7336-24096ad15edmr76658715ad.21.1753907703430; 
 Wed, 30 Jul 2025 13:35:03 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f1efe8sm78305ad.69.2025.07.30.13.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:35:03 -0700 (PDT)
Message-ID: <ba3dc166-07bc-4909-82cd-1c52fe513e99@linaro.org>
Date: Wed, 30 Jul 2025 13:35:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/82] target/arm: Add prot_check parameter to do_ats_write
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-7-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Separate protection check from access type, in preparation
> for skipping the protection check altogether.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpregs-at.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


