Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73040C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 17:14:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ued30-0000hx-Qk; Wed, 23 Jul 2025 13:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ued2u-0000gH-DE
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 13:14:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ued2s-0005xG-Tv
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 13:14:24 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso353735ad.3
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753290861; x=1753895661; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e885qokl/Dj5nbKl/OsX10/+RB/c22InHOgrvFRoTQE=;
 b=t1AiNPHauxqyqTI1M1aUBGb6F1nYGcCa6b3TJtIMTbqKHw+t3ZxyJvcujzwlUZGiqo
 s6eRzR2eHsCwbBl0oDFX7w8PqCvz5JWLx7MbaaW7U2TJrQ3kUbB229SKVWJxLlqJb2yc
 5TMDqJ8StO3uEsoyEnRgY29nqOYTmGA4C8By6F2LpnMPKXIGYSxlFUDMwKLbHz1DcA6r
 bfqZ7dBM9jOvIehS6EaKgGftraDjNapwoT9EQFC6mIJQ7Ac2wODtHjWabT6ZiQxjDoM3
 gOXnILJfPNFc1+MQN5xk/rviX/rUUIlUP7mCmYG/+AsJKrGWLRrcVqcXBszSqgrdWkQ7
 hDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753290861; x=1753895661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e885qokl/Dj5nbKl/OsX10/+RB/c22InHOgrvFRoTQE=;
 b=jKCxFlZpqMh8F9d7kCAaqtb+UBBpL+XlZZo5dy4XwreE+f9li4DnZGIqeUXh83sO/q
 RhMOCMKJyu9/QXT3+1FWmhuEnDquwC0fhkdzWhB5ha5e3T5dBUu8GbWmanYnTco0iMTm
 mGldnJnbcTxg3Wq7FbopTMN6CZ4hhnL4RM8z20vSd4ZFrY5gQnspnT+E42ilLQsOlGWp
 8fSGhJwc96RTc97fuoyx/xZiwYqDydS9iHvjCFT96PBdLc4u784WLnHNoBeFElUgZii2
 cOuUfN6g4RMuDAqD0e1Vz5KEd/al2W4G/DROw+tscshLJkYIDL8VgN2By9BmiAtaC+df
 2kzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT9MyMzDIk/J3l0RdQRBqXPoySG41Qmp7Zm62vOgPf8CRLvErjpx4Agndr9nrKOwaotqnCfj8j3Q==@nongnu.org
X-Gm-Message-State: AOJu0YzNUOD/MKWxztjLU3wWEpTH2DuRc3y/mBERthqP3xIeiOXNL5wN
 jQujy9gooUqSmKAEMUildSoWBXGySzDNz5YWMw4oaCzIWmUZ73qloWXdVF/rANqTB4Y=
X-Gm-Gg: ASbGncuAbtaXJ9XW1/43JtE9q7WrXnBVvWTuooOgSMEL6Zx+M+ZaCp96XMhwh36oBHI
 l0TLqijQDD2x9tLpz375pGzYRW6BkZGPkcsvNLw+yIOosjL0tzH3XQa4dUCLFjLbM+M/JGmjqYu
 QoD1ZCGe34rWYU2DPuz4hwpwuxMERzxK0YIOD1XqkaIa8Qj2h3gvv4dV0qYaUKQzhZEG8u75auH
 YURYjc7n7WFGxp1rmJzwwe3ez3RT56KGyQS0RcdXx63nAqEXV/cau0K5x9lBkmvctHvgEeaq8fR
 QMif1B10vcs5Uv2hAIhF6iaSJ1auj504JiWAizlyVVlY8Oz3SUwwS9k7+9bRohHqYRe/hklCBqA
 tkmtMzqXJoBB4UOHjW1DewfW5olJDF76162C2
X-Google-Smtp-Source: AGHT+IEBWmhyBzoe395q2/+evgAb/inFstpQzHziCz6yunVelrQGjZYFK8EOCpeAqYcI2s823Hsjhw==
X-Received: by 2002:a17:903:230c:b0:224:26fd:82e5 with SMTP id
 d9443c01a7336-23f9823502fmr54125655ad.48.1753290860764; 
 Wed, 23 Jul 2025 10:14:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d723dsm99793845ad.166.2025.07.23.10.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 10:14:20 -0700 (PDT)
Message-ID: <4a887ef2-6ecb-4311-9aa7-45002dfe2fe8@linaro.org>
Date: Wed, 23 Jul 2025 10:14:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 4/6] target/arm: LD1Q, ST1Q are vector + scalar, 
 not scalar + vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250723165458.3509150-1-peter.maydell@linaro.org>
 <20250723165458.3509150-5-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250723165458.3509150-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 7/23/25 09:54, Peter Maydell wrote:
> Unlike the "LD1D (scalar + vector)" etc instructions, LD1Q is
> vector + scalar. This means that:
>   * the vector and the scalar register are in opposite fields
>     in the encoding
>   * 31 in the scalar register field is XZR, not XSP
> 
> The same applies for ST1Q.
> 
> This means we can't reuse the trans_LD1_zprz() and trans_ST1_zprz()
> functions for LD1Q and ST1Q. Split them out to use their own
> trans functions.
> 
> Note that the change made here to sve.decode requires the decodetree
> bugfix "decodetree: Infer argument set before inferring format" to
> avoid a spurious compile-time error about "dtype".
> 
> Fixes: d2aa9a804ee678f ("target/arm: Implement LD1Q, ST1Q for SVE2p1")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/sve.decode      | 12 +++----
>   target/arm/tcg/translate-sve.c | 65 ++++++++++++++++++++++++++--------
>   2 files changed, 57 insertions(+), 20 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

