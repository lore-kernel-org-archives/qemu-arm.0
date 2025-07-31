Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93301C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:57:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbGS-0007p5-Ax; Thu, 31 Jul 2025 17:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaz1-00080X-6O
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:38:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhayz-00015o-89
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:38:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23fd3fe0d81so9445025ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997915; x=1754602715; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPTXtdiLABpycOyzbsco6f3LVVm7p2zbNmbCS3oTBFc=;
 b=IEFFeFSOZqRuy4AE38nYfc+mF6J6SB1dUL5Sziga1/1GK7KNG/aL8KYYx3Aa965hPa
 7q65NMkOfH8VWXvyEaKEJfacglMQ3E8d3PyOfIvJk3R0vJ7perj7YTvfLztbcrH61HUF
 SixxFEUuHSKl6exYeBZbepe+I71A6oVZ2HjtKNslYlT6XwjuUC19QB7caUPUplxg4sfO
 fIZcsil0Nnfk5BhKoSumunGuQQ/15EnYRjyc/gjdwn4E9mP4pgCmbvL69dPXptkeTNMJ
 7M2WCu6mSzOmGkGe4eVO2ZSGrViv3ymDzihkYoQgPyYArzzN3gE5QBQIknwTZE0KIFq2
 HBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997915; x=1754602715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fPTXtdiLABpycOyzbsco6f3LVVm7p2zbNmbCS3oTBFc=;
 b=mZViC2CdOMcU/5ZWeJlT1EyKG24OQaKUbONcjE4NytYLnNwao6sUMveAP14QF/VlHr
 9DweRWsNQ/bGmi7AY6zkcVTPGQLW11uhKMZ+VeuMJh9Nvg2VTZCfD6lAaTX5LF+vnQ0G
 WrNaNB5UM+jmrQzVGrklBlMJIwkuub256wgm2w/dJ3VNOUxoMUaYCHy/nUg+ns8ggXrA
 YB8gFejWy8TUIO5hAhtazw4himmoj+hbOp2/kNcZGLEQ/hVUJZulDHd+e6Hf+6t7V/9P
 Ox8VwMspPAt758DSWOygdKVai6yyBnCWIFnR0xKKFGct/kxyLiorzYIvrl2vujNG8X+K
 NOCQ==
X-Gm-Message-State: AOJu0YwIIcepgL/d1+C/REJnhs0KXpfdkTiTkIpxD/h5FC59Y+T5dWP8
 ktDTzHABBHSSRiyz3HPh1hZM+uROkGy6j29ZN/gPZ9lydr8SlWxHp033t7MpEMjnM1qBqdirqy8
 nWAbc
X-Gm-Gg: ASbGncvRfEaHpcAF47EIqDIgdDt2E9DS0ItRQN4M1ymGn4H8xPMo+A7b/ICShfohqvA
 xkkM+Ujbj507muVfdBJQqiHX7l39ehrS+inGIIawvP70FL8Yma/DoCBLOkEOQ+VChwqHvc8tD+E
 u7zgOWSvc+nMEjF51g9VOo0anZAXXQdrRpRUdNpCdtYmc81j8FweM56nyDyUioyt/zkfm2mmMMW
 14oybNvFmxqOQ7qzuHZ9PBmdG3RkhQaZmVQbT1lmq8rG6Ewp1atYuMUgeLV0+8AE2iNN1pnNxro
 PYSS+zxVfavjcQ2f2LU1IzTN94bXuPIbtbFbgeI1Ni1eNqmX9ApPuU5fV8OhKE1Sh+B92ZoqVsS
 mzwHu8r0mIZ/uP0JDm9M8KYk+gTY07cblayk=
X-Google-Smtp-Source: AGHT+IFlfh6G5ztsT5v9B3mKCBSEDxifsPA5p32wEHVRFknE9jBoBs1wi6VDtKpweVpQ5fQv+n2O/A==
X-Received: by 2002:a17:902:ea12:b0:240:a8c8:5f6f with SMTP id
 d9443c01a7336-2422a6a7c11mr2620495ad.27.1753997915495; 
 Thu, 31 Jul 2025 14:38:35 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef66fdsm26299475ad.38.2025.07.31.14.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:38:35 -0700 (PDT)
Message-ID: <0beffe53-1f6b-4e9b-bd9d-95ac5ffcd92c@linaro.org>
Date: Thu, 31 Jul 2025 14:38:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 60/82] target/arm: Implement GCSPOPCX
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-61-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-61-richard.henderson@linaro.org>
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  1 +
>   target/arm/cpregs-gcs.c        | 17 ++++++++++
>   target/arm/tcg/translate-a64.c | 58 ++++++++++++++++++++++++++++++++++
>   3 files changed, 76 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


