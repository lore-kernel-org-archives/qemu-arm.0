Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97437C83F17
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:21:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctRw-0005z3-0V; Fri, 18 Jul 2025 18:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsr3-0003P0-Dc
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:42:57 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsr1-0006ph-Ro
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:42:57 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-748e81d37a7so1772960b3a.1
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874974; x=1753479774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ufdx4xxhZMofN0dIAo+3KTserIonnoVFQtsNEaBzaCg=;
 b=Y6FqkAbWATUUJTa3UFI3xvaCzxDKgtws7y9ZWH/nE3g69KyvZpWAux69HvvkiJHHUz
 CEg6inKhJ+kf27ZTP7KZlRXJbngJSSinxxZ0MBwX3ogkzbUchDzgOtuGtompjdFbQ2Kr
 WzloXY6/UrINi1s0P+ZqX+sHjlu4Lhb2gkCAK9lLwP+cWLT0tconHLkY4dMp2FSRyc3G
 Tkx1yu9IhNl1rl6iQHS4cazH6znP5AjeFqANifbLX5IShhgvMi6MiyaT1uC07NijqJxx
 7agZRRR282wbwFVMpOaxTeBwaLk+bDpvKSs2fmaFlWgIZ1O5FfG8zx4PoCzE1AZGLnro
 0WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874974; x=1753479774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ufdx4xxhZMofN0dIAo+3KTserIonnoVFQtsNEaBzaCg=;
 b=pySKt+U0zo/sR7dd6p973SNPjF+QWF3p9PlGcRSY5KHU8CoNlCIQ7yMfWSV0st//e8
 u3WTl0XXRwYrfHSFa2rw6YrJEs7j7oebQfn1zjnZeGY6EBGi2qEeJcDvYNuhs6Q20KqZ
 VkxKYIevM5xobnpuj1fxLN80D6RGXZks/ldZladsnP3xH9RtX8izW1Z1XZDU+IsGSkBi
 /2X8GohqfLmWAz2JUp1uPYoL2DUh8F5YH+Ppot51w+2LUR7VZM/9jEquoDXL6eTGiK49
 SSZv28TvOjvmWyfLSrwIxqxrwa8WvRwaUOzDaPrbboR0Jq7BC403wvY08kwtsO9uwdFK
 cEog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDcR/9SofLEaCeok5DAee0s+6gK67QjvGpYqhXL12KL/8+4V077Lm9t0Ai8BrgL5OVAKoXCI3QJA==@nongnu.org
X-Gm-Message-State: AOJu0YyW1i145dOUXQY3PiGTxQuBQ23ui4Uisio8AhGEn88jJZ5NZKrW
 Q9emAIIz7wIJjvtAgIyt4wHtLRttkoV8QdhQtOW8hUv9f3y9IhmFEm11mfqbY3jnCr4=
X-Gm-Gg: ASbGnctL87IjPpS7aRtt1IO9O+CxjyYQli/or8stNG9p+4gaRY5M0pqJjubV+N9Ej8Z
 UfvmZnhdekkd/db3eFjy9MIE7HTDH/0BVVH4sG3871ZEJ9LJnE4vISfSxKjoUq0Ga1p7cdJwuVy
 U7oFUSB1sLxG5NMv1BsBQdfs56/++Hr9eS6a3F8+8ARV1bUKY5NUPOX3y+wFa+7JHAGuNCzvpT5
 9levpm3TLp36dKUZbEHB3uSHUTq+LBKwPDzhTrPCTx8US+Exp3hd73X/Zfr8sjMxaf6sL3wxdJp
 WjpZNAc2p5D4bd6BNt27+kQ0+aupx0ugcLmspbihtJls8M5jRGB/njaZx9Mm4Wv2BvOaGA92NqV
 Uqce/AA9Q+RWKt457/KJAaLyEPpWQSGdbgU7+rGf+xA==
X-Google-Smtp-Source: AGHT+IHNDbxxoZTE+28o/ABoJ51dTPcYV0FCOaJtZKmPadychhrimyPsPK3o0uZSyQXOvFt75rz3uQ==
X-Received: by 2002:a05:6a00:1482:b0:749:bc7:1577 with SMTP id
 d2e1a72fcca58-759ac028ba6mr6470382b3a.9.1752874973866; 
 Fri, 18 Jul 2025 14:42:53 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbd66eecsm1769772b3a.142.2025.07.18.14.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:42:53 -0700 (PDT)
Message-ID: <55901ee6-0df8-488a-8d38-bb88b6da77d7@linaro.org>
Date: Fri, 18 Jul 2025 14:42:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 06/10] target/arm: Add BFMLA, BFMLS (indexed)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-7-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
> FEAT_SVE_B16B16 adds bfloat16 versions of the FMLA and FMLS insns in
> the SVE floating-point multiply-add (indexed) insn group.  Implement
> these.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/sve.decode      |  2 ++
>   target/arm/tcg/translate-sve.c | 25 ++++++++++++++++---------
>   2 files changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

