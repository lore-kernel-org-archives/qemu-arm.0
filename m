Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A70606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zdKAKpiG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMP4S-0008H1-Hl; Thu, 29 Oct 2026 08:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4Q-0008DP-Qx
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:17:27 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4P-0000Md-2h
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:17:26 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-53dbe9b8d6eso603299b6e.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276244; x=1793881044; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HwCspv9KVpeNpKaoIMyOBsabutmcdbAvFeFXn1CMntk=;
 b=zdKAKpiGCn+ruCUDZBqZo2W+opB6yZ/uASd+VA80HaYeCOISeEnahrQv7Wpdz3Eg4s
 0zA1aXDt3qMKbhw5Zu4voTRcIhU4xU2hSxL26E8rCNcG6eDzv+AOJahyzBIDnXGqgAOI
 JWR28n5WX8MhAwdnMGWN1veYdQD2KKp+1ct0IewiVS+4P+UeY1VeD85+0OplHNWyXnbU
 0OGwYfAuvUykm/E+tWqIWP2oIP+QWvTCzGcbN6COCAvn2hxxsjo1PZPratB/gyzGe4da
 f7qeTdr6tqLnJb/xqyjmiB7ScqYDl09WCGRIo3sVnFaTe68DQDJc1lt7S5U+pPahO1Fa
 aRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276244; x=1793881044;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HwCspv9KVpeNpKaoIMyOBsabutmcdbAvFeFXn1CMntk=;
 b=BfJfqt2v6cyTEClHzxXp97KOOZOchZ+SOQUsqQKfAzQeX2jZg0VArohISPlLTMomTb
 mo8K6S3dxAvgWYqTLwsHLctw5Ga8lvQ3JeEK6ah5pwL2/hiUGw7hZ8Q52TJ7FeVWHSLe
 /vi9/Hhco3vfSgA69A/9lJCjN2l6xULkYdeit0GV0YtCp35EmDorokov66blKrrbe3D+
 9Wnjq0V72VpuLhjZdmIMOfbmxanfLP027v4cdO99nI7/QibSSY8SM9oCgT2RC87I/yUK
 MqDKAOyqmW7F/37sF+/yZzGrTr8odY4g6SWV+wW9i9ujPQPDuYUJo+Ab4CeVPMP7pdsx
 Z3sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxA3DKgbiA5cSNxcW6pk1EK4f9aZHjjYo1u164zWS004AsFROwmxKG0+hBEcoZa5aWQKj8DklZD1g==@nongnu.org
X-Gm-Message-State: AFq9FYIKwQ2EgGuXELRnkT/a2Kh7XCbSdTlxSfNGupqHn6aTUMVgAeTS
 czu0ZjYEyuXIVk6sJ4f5w0hNs9fzJCFv4lhfW36jXvFuG37aslJIR2RRIOsvTjsa85c=
X-Gm-Gg: AYBFou1us7BhIwGqdegSM+7c9Wo1jFyQeuNzjJX5Ot10HxDrXYGRoLpAawhaqMCvJmq
 fKaO5tmTpx9qskTD4IKq4mVU3xyjUBqBhwmt0xtvGz1nQ1pzGRdFn2hJ9s7m6YKNIxyu05teOTg
 wtVXdHrCUpTpFr5OIkr4KB+oRkixlFnzpJaeB5GAZEUPti2YbnbsxanynIrp2oajLAqst+OQGRI
 FTesMu2iS52NKg0z9VYGDvl12pxcsZdyqMbqWb41+/E5c1vVe5x5QA7HTWzYBWvIeZqfsPbibzu
 LfvMgOJy+QPhKemgWYG4M30TcjIbPmO8HuDKQs9rWUtMQHqFHm3qnVp5TrmgHWEFI2ITQHRhq5z
 a1DaPP9vO4UB1KBAsp72t3c8iYCZVKct+uenZJP2c99sCpUAlRT+dqFodzTBFMaVtwxCBA73XbL
 W72x/PrKoVXhxgwleKV6NEAs1iTbgv5bXY/pxlYkyTVT3OqG55c8jE1txzeoo3PSiKJoAwCKMwG
 jf/TWn24I2vuqGSI5NIxJ07AQVWUmscFOOjpE9y4a75Xy2U3k5Y0csAzJ4aJvwoNw28H+pRa04B
 UjUCLBzT2nPOwQFihuzKHq3zAzWOihfkZxNqhN4IXKzs
X-Received: by 2002:a05:6808:250d:b0:496:976:acad with SMTP id
 5614622812f47-563ef5c1674mr1205981b6e.1.1793276243814; 
 Thu, 29 Oct 2026 05:17:23 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-563c5a4d8b7sm3302136b6e.8.2026.10.29.05.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:17:22 -0700 (PDT)
Message-ID: <31a583fe-d71b-4b50-9e5b-c4acb138117e@linaro.org>
Date: Thu, 29 Oct 2026 07:17:21 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] tcg/riscv64: Fix constant handling in vector
 comparisons and selects
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-5-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-5-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> tcg_out_cmpsel() takes constants as TCGReg and passes them to the
> encoders unextracted. In a release build, "cmlt v0.8h, #0" emitted
> the illegal instruction 0xffffb057.
> 
> Use TCGArg for these operands and extract the element with
> vec_imm() before encoding, including before the LT/GE adjustment.
> 
> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

