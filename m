Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29736C83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uct7L-0003Sj-AX; Fri, 18 Jul 2025 17:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsee-0002OD-6e
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:30:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucseZ-0004JY-Li
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:30:07 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso2382107b3a.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874202; x=1753479002; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SQQ5xIVD/yvCKQ3QdErieZqMSJu7Bnkl0YFpDSNRV7A=;
 b=aoCiVyjN0AoF3tBO9fo2BRz7FEF5PDLGjWhRpfqJyrdfQBsIBsxxypRxbgaXNB3EeX
 xoT4cX92GwiCY6WW96z10AUcytL1SRaeCcOEtJhbXSCq0NXIDEE3chImrR1VXMrH34sm
 xBzel+Isn87HqUvryzNCQV2b621WcE65SCQmA9xCpzzIahl5qHrXLWyMejSw7jEsVgmt
 uHtp3aDGNvGNuH7Hsos8Frsb0ou/KDaZWqDnxUZsBvfzFrxRcMXa1f1ev087DxL3J1t0
 oBpXHaXok6Ti1Ud6U1nO6Ndxi6xYRJiiDxHFHwMKRT9M0CC509coU3VrfxB/93aJ4nG6
 oQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874202; x=1753479002;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQQ5xIVD/yvCKQ3QdErieZqMSJu7Bnkl0YFpDSNRV7A=;
 b=OFWPB18YTr3fbqB9hlMfPThXG9CZYqkx5FSIpRViY4ZUX+rw4GVRS563ODFM3ypq7u
 lHrfmSJXPCuwXZ4fRaD+G9vKyewLVP0W2Xa+8tJB1+YxT31xkiK9EbzkeIhobqN+EJdI
 3p8O2+jv7iQxUuUXeW72zD3z2wjCo7I9sCM44pxV+v3QE4GXCwze1nCBx7TUe/Ur3lMf
 +stNNgiEphZahyJNjKO137TmmEZoUEJ/mO7/vk946xsBxJRnh/ykQTBQqz0qyVo5iX2l
 0zg0Oic2ervjs5BM0gOr4KjSKt5lZ5vXmr7/xLR3UK53UzagcDIN7Z7Ml4Nb030AFTdN
 IE4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5F8KgP5qFly4V6RNcy4nSY0NZJH8XioQENn4kw/+MgXHkBT523sLWNzI4I075JyVQJizum5VJbw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc00q8JTugFJjuUswwajgD6YwAJ78xVMiAeIbQ79+T0HqbH0k5
 +jmtXIiEpqe4Qsm1YEdUg/234VQDzQyYpIv8DEDLmrV95dQK+H4S2WWAkxk+9ydZL7M=
X-Gm-Gg: ASbGncvV5RkEEwQUr7fOnBySNVrGnyGz+cf6jh/8Ok0fWWd0cNzjvrH8zNqD6kLpCLi
 di/rZwfDyx/9CXqv95NXoLG9pC0aR+P6y2S9SsHHNsXkBVuCNhGgdTebjjpPyLqygQIrTUNQqee
 JSMqWCuLdvZrilq7vPk+UAdiiundq79PsldH4yyGCFwFiKDNG5wWVn68MHi2q2QkoHSIKGqgGsR
 QLgSHEZT87K1NEFDdLVK3grs9sNmuZtcNRIauSkmOaugbUtyPNg/iyea8gQwbU9jURgP1xH4QxY
 ikCaH8rwaZUI9tV+nNtu/O1sO6FlI2jY6XK6YgTUSzDpwo0XJoN7kgpXUA8nkTxcfTXvgzs0SMU
 FHjRQ5dmU5HODelPr+3ZRXQw12svs0G00BxuY/Loz3Q==
X-Google-Smtp-Source: AGHT+IEmVYJ/Cru7O04xlQ56pCxjA236cYlxQlQjy92VlYFTagCsW5ARRCIiOuIf9byO+puNHybJgQ==
X-Received: by 2002:a05:6a00:2350:b0:747:b04e:941a with SMTP id
 d2e1a72fcca58-7572427c3f1mr13923324b3a.17.1752874201616; 
 Fri, 18 Jul 2025 14:30:01 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb67900fsm1760330b3a.101.2025.07.18.14.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:30:01 -0700 (PDT)
Message-ID: <6ff7f979-6112-4705-91b0-bfa7a9e25a14@linaro.org>
Date: Fri, 18 Jul 2025 14:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 01/10] target/arm: Add BFADD, BFSUB, BFMUL
 (unpredicated)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 7/18/25 10:30, Peter Maydell wrote:
> FEAT_SVE_B16B16 adds bfloat16 versions of the SVE floating point
> (unpredicated) instructions, which are encoded via sz==0b00.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper.h        | 3 +++
>   target/arm/tcg/translate-sve.c | 6 +++++-
>   target/arm/tcg/vec_helper.c    | 3 +++
>   3 files changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

