Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B04F531E3
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 01:35:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCSgW-0001fj-A0; Mon, 13 Apr 2026 21:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCSgT-0001cx-UX
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 21:35:21 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCSgR-00038w-Jp
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 21:35:20 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-35f9ab079bdso1155414a91.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 18:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776130516; x=1776735316; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/6iN49mWnUgv5H57b5T7X6O5t497bfzvx5B1ZSYIkfU=;
 b=iXPHHkKCR1Ma8NE0T4IiyMJCTYma3yt5n7oAcTFZlmytEdpy2LswiYiBFPjHyzVFH/
 TmCFQY9e1Vpn2Cp3s80E1Sw+nz9iUE1OIdchv7CujgNyA3uZeYoCbjQX8EGUgPxlC/vh
 1Gk2oma0vCSMi5qPEdZVzQSMcarHJGdYZ4rX2ut2NtJLIDfy1Sx7gY1f/2aiuXbmLfub
 XZSw9PgIyOt3aaqQvYCorNihfg4xdDXS2PddRLwcSfHgw56qq96ArpDO414LcJXRyejM
 46GMinTI+ERw0VLMyslMb7r4yAcK++aMFkjby2ivHj1h1k2J3QBjYp3QEzUDBe4zNLXs
 lBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776130516; x=1776735316;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6iN49mWnUgv5H57b5T7X6O5t497bfzvx5B1ZSYIkfU=;
 b=XZdcDWhHt1Z4CSJ6PAoOpE/cLyhtDzCVRuNUqt+D+NEgN4LShmyO+2p6ilG5h8U3s9
 I34QC04MGKwsdAtYKI4nKSMnRdgNbh5+C4g0XyxTsMRxSstpXfpyVC840LZm2xyp1qOl
 Dy3Mb9trQsqq20LYgGb8Nbf5+XthjurZ9au4DzfghcvSZY+kmjTdG7R9V2EHeGaTXGrS
 QhcacJz27NrdPfqZgbTH+AY58SbqBkPDLdytohfEYhTrAxXeM9n4gy0JiC+pj3pbGmpl
 xTLDiZqYkEEY40LgUlrJyrxU6ZHRQIoJUpjPpXgRmhMoX9CSPZbOMHsQ3mzZ4cNorW7P
 7I2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WIZVUG+8lOx7Q3dlEB5G2mL2OkKG8/kp4Drk8bONIwMfbOFMx1/2a+PNaaC4I40YnBhPMk91tew==@nongnu.org
X-Gm-Message-State: AOJu0YztV5ZB++jz29s48kzunRyb/4tA/1RXbD8ud3ztJqTaPUL1/st6
 3jFsbQQp9esR3GgHIGjE8WPwsuGGiXGt5x7JQP9FT+gbp2jFRaqiO6EzaWk/Lxrbv60=
X-Gm-Gg: AeBDievkABLy1GwPrEn0qgcqK0a9t1a5uWKtN1BAjc7Nrha5cGaV8DsDazIhpFhWP9b
 uFrOcQRqCQPIwq98qt17yJgnujzVYzhNDQ8YF4fIubecaDgiRRSZC2QskFFl2Om+jt9IKxjJdb7
 i0xwBLfQJMVf8loc6xAsltvxo0ZfBnVlRO/N4WLkWeNAb72y/+ug7ZxN0Zx98JoNFAfnQGg4zdu
 aDAbhhWPspGmUBrsnxY4zcsyXKlXfcTY2H+PwjmzM4Im2WAM2faTf/NltvWD+o25MifKsAeODSB
 GBuVmCeuFlicxoUv9/zEuDSkvQC9p7h1FDxXv8v++OfMNYpmzjjnyZ8K/CFUBkZ0lcouOz9pqXI
 TMFZTgsg6MzO6wkOEp5XLVNbbXzxhAQYNaMqRHwMDuOyL9iGt0DJw+WC36O59mFZaSU3m67z6+X
 MkOHzKyQZSpSWdAqjxIjAj6dvr4IhIk+DdxcDamk1iFZhe9s6XN4Np4KvWYgRW0R9zRBqTyHLVO
 cR1y5ePguT3QPedoL1GhQTjKnULBeN8qbUgcbcsa++BWCeRWB6SKLw=
X-Received: by 2002:a17:90a:d405:b0:35f:c46f:2b0 with SMTP id
 98e67ed59e1d1-35fc46f0468mr1302453a91.14.1776130515900; 
 Mon, 13 Apr 2026 18:35:15 -0700 (PDT)
Received: from ?IPV6:2401:d002:dc0f:2100:377f:61ec:6edd:e205?
 (bg30dhzrtpvfdxnnygb2.ip6.superloop.au.
 [2401:d002:dc0f:2100:377f:61ec:6edd:e205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35fb87d0361sm2305447a91.0.2026.04.13.18.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 18:35:15 -0700 (PDT)
Message-ID: <0a95eb1b-c9c8-4da7-a9bb-dcac36c51e59@linaro.org>
Date: Tue, 14 Apr 2026 11:35:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] target/arm: Introduce mo_endian() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
 <20260414005348.4767-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260414005348.4767-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 4/14/26 10:53, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/internals.h      | 6 ++++++
>   target/arm/tcg/mve_helper.c | 3 ++-
>   2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index e92a967f575..e65014af1a7 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -28,6 +28,7 @@
>   #include "exec/hwaddr.h"
>   #include "exec/vaddr.h"
>   #include "exec/breakpoint.h"
> +#include "exec/memop.h"
>   #include "accel/tcg/tb-cpu-state.h"
>   #include "hw/core/registerfields.h"
>   #include "tcg/tcg-gvec-desc.h"
> @@ -46,6 +47,11 @@
>   #define BANK_HYP    6
>   #define BANK_MON    7
>   
> +static inline MemOp mo_endian(CPUARMState *env)
> +{
> +    return EX_TBFLAG_ANY(env->hflags, BE_DATA) ? MO_BE : MO_LE;
> +}
> +
>   static inline int arm_env_mmu_index(CPUARMState *env)
>   {
>       return EX_TBFLAG_ANY(env->hflags, MMUIDX);
> diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
> index 4bea0991de9..a5a23c97056 100644
> --- a/target/arm/tcg/mve_helper.c
> +++ b/target/arm/tcg/mve_helper.c
> @@ -299,7 +299,8 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
>           unsigned e;                                                     \
>           uint32_t addr;                                                  \
>           int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
> -        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
> +        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
> +                                     mmu_idx);                          \
>           for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
>               if (!(eci_mask & 1)) {                                      \
>                   continue;                                               \


