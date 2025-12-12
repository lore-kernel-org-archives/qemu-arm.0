Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B0D49235
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 14:57:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU4Zr-0005zS-1z; Fri, 12 Dec 2025 09:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vU4Zf-0005wk-VH
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 09:56:55 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vU4Zb-0002nB-M4
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 09:56:51 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3e7f68df436so948994fac.1
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765551404; x=1766156204; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C84oN1mOsr9iVWmQkyopN5rp6NKdG6qYiLoANha6GYI=;
 b=ACiNQbv84qUCKtJNv0Wtjwf/d0KTeb1HM4oodkfeRtIS6s2vlNBPuwSKS8MYCFzneB
 /f/v9iKSXKR5ksVyk4J7ZENSN3tWUjDV+LDNhUXdI3AdUeHdoFKSMDqWAWX+Vn1m85RV
 fmXSw7BByk5k+qK0oE0qxtizUS0x6Ap0aHDcgCcTcmYHaWsVjmCwRSmvcOu2RhiNZzAY
 HgDGAWrVXX1Wx01k7Kg7kIaO/aYfW6mQjhgh+d0q411Hp9Zp5K6IGnWnzkBiruI6pbFp
 92WZzlEG2LG+r70ZvGcDhkFksU1CewsA7V4PLKlADN0pAEGxaZzQBFZSmVwjBK6293VE
 qh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765551404; x=1766156204;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C84oN1mOsr9iVWmQkyopN5rp6NKdG6qYiLoANha6GYI=;
 b=PeB7NX6/UfixtzWmZLir/hjzsx5HukxACe1Z8cnMjM9fLiHyU09DhTr8h7yVEuradi
 sC/1Uc5RVRTS0YZIHD/zuxRGJmChgtkKQnK8E15d3SZJuoE9gMGE+sLLca2MROV5lh6p
 ipManC19WyIRxmNxsfdl1Qbmlmh+eMoItB0Z4AmvHRN4qx9K5bwyBcY69EoJJn2Vv5jR
 Qv8AecgEgJfZDJkhE6yKT0v1KAFJ49+hy+ylmqQ1nNe6ZrtdW9yohlGK/BqDZrCmjzUI
 5dtEuqQTwQeIXT+zjRnv8MKueSUzZmxw0UuMsLesbrA6RYxP+oO2QcXDWIYuBdrViZz6
 IKBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4uVWM1JCt4cvL6tkgMCu8lNKmgddxWDRDjjdsokyvPn7+JAH2f75K/iIWEv6knLlNxarJKHAJHQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzr6BYrugIxEsWRyQfrdhEK60oT9X5TA1Pfns0vO3xd1YFyNzQ8
 8K85/8uHvUVmc42I1DQtMoqTfoK23lqewOM0POxzDeYUahGjffFerqUYMk95MmbjHMA=
X-Gm-Gg: AY/fxX5YU/NZtkU1ZogS0aIfPfKguJm8/qxIAHvG+Bhb+V7LGsPhdZzG3DiDZ/pk1QA
 Dp0RMMG5dvT3j7KuXby0J8uZFWNjR8NthYSXu0J0Ai5l42ME9Pf7+nx7DZac3IlfkUrbnWTbRqO
 wWaEfwVgZFeZc/qmvZKQJjNAQ+oX613oyIPRxmvSc7aRVoQg+3LmQPvVOcLAFQmDBmw9i8t3ghH
 uh0RZffAa3EfgtZj/pkWP0LmxyiVOkuCnicdiOErIILLQaSYGx7c1bW7oGCFiTzluCTAwqVHZCe
 /lXzVSEk96zy9w98MDsj2EHeGauboOqMIEYItEP8I1mG+eXOKljUOuSwqkhNHOAl539qdkIgdTS
 gMLRUWmp4sB7ufkdKW/Li/u1+n0hMlMERkwJWRHpLUV7reya+imoyfuKaqRfUgM/5WE4NqiTUJL
 The0vx04dCIh+nuRwEZCVFGnl08UVaRBIJ7HZX+WAB7kPpzVoNxDUfDtfOCaH78u3+1DlWdhc02
 Zg=
X-Google-Smtp-Source: AGHT+IGmDxXtNG6i7M3hedvRmYmDIrAChwVlNiCEPzqpaM9qAcdeV5GZRH7lqxJ/eM6ubYTwDFFWEg==
X-Received: by 2002:a05:6870:9709:b0:3f5:b761:5234 with SMTP id
 586e51a60fabf-3f5dfc8a30amr2871894fac.28.1765551404279; 
 Fri, 12 Dec 2025 06:56:44 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f5fe59c583sm1104777fac.22.2025.12.12.06.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 06:56:43 -0800 (PST)
Message-ID: <a40ca4c4-b34b-4315-8e6e-46812dfd5432@linaro.org>
Date: Fri, 12 Dec 2025 08:56:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Move ARMSecuritySpace to a common header
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
 <20251211234426.2403792-2-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251211234426.2403792-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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

On 12/11/25 17:44, Pierrick Bouvier wrote:
> From: Tao Tang <tangtao1634@phytium.com.cn>
> 
> The ARMSecuritySpace enum and its related helpers were defined in the
> target-specific header target/arm/cpu.h. This prevented common,
> target-agnostic code like the SMMU model from using these definitions
> without triggering "cpu.h included from common code" errors.
> 
> To resolve this, this commit introduces a new, lightweight header,
> include/hw/arm/arm-security.h, which is safe for inclusion by common
> code.
> 
> The following change was made:
> 
> - The ARMSecuritySpace enum and the arm_space_is_secure() and
> arm_secure_to_space() helpers have been moved from target/arm/cpu.h
> to the new hw/arm/arm-security.h header.
> 
> This refactoring decouples the security state definitions from the core
> CPU implementation, allowing common hardware models to correctly handle
> security states without pulling in heavyweight, target-specific headers.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Link: https://lists.nongnu.org/archive/html/qemu-arm/2025-09/msg01288.html
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/arm-security.h | 54 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h              | 25 +---------------
>   2 files changed, 55 insertions(+), 24 deletions(-)
>   create mode 100644 include/hw/arm/arm-security.h
> 
> diff --git a/include/hw/arm/arm-security.h b/include/hw/arm/arm-security.h
> new file mode 100644
> index 00000000000..9664c0f95e9
> --- /dev/null
> +++ b/include/hw/arm/arm-security.h
> @@ -0,0 +1,54 @@
> +/*
> + * ARM security space helpers
> + *
> + * Provide ARMSecuritySpace and helpers for code that is not tied to CPU.
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */

Don't add the boilerplate to new files, just SPDX-License-Identifier.
This should have tripped a checkpatch error.

> +
> +#ifndef HW_ARM_ARM_SECURITY_H
> +#define HW_ARM_ARM_SECURITY_H
> +
> +#include <stdbool.h>

Already included by osdep.h.

> +#endif /* HW_ARM_ARM_SECURITY_H */
> +
> +

Watch the extra newlines.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

