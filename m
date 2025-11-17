Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F63FCEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 15:40:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL1Kg-0005xN-A7; Mon, 17 Nov 2025 10:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vL1KL-0005my-8E
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:39:37 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vL1KI-0005ia-8x
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:39:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so30968755e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763393971; x=1763998771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4z1jh/Ha3QCCNXYfp7y5UhFkZykJVLI4/OdNGSZZcuU=;
 b=vuXrAK8PwRAUYr+MbpHbgXRkmg0TPfv4D7FNG8It3Pm5by1RI3LbCArP6mft7aIod3
 67g3GyF7NOOry8BMTD+nR8REc+f6X8N2JYUxYBs/5BPAgarc+JD+vGSFMf2uvgew9mL5
 Qo5Ua0F6K+8EFOgW0Si020+6JasrYbeT7YEHmLZpEz3NVz8K4Qax5+pjcJXk8jl26f3D
 gsJ2uoHy7nimQE+5PINbJKsyWtJBTmGv94dGkZKGGXoW+zhU7mF2d4+C6Xd83Tgn7+pP
 L6nT9kVDEC47V9J2H0JvTrVM2eHDVapVOAWVU6hmAbtArgnp+uVAWNj7ontGvG7TFSCO
 nKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763393971; x=1763998771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4z1jh/Ha3QCCNXYfp7y5UhFkZykJVLI4/OdNGSZZcuU=;
 b=TidzHcoA128gYR+jo16cPw1EfC4gprBKL11+VcT/9xPojKYyDN+B0Zap5ndoM8baDD
 opVxHVx2brgPfDSkHRCb6jxf5TWE5JlSBiFOs2qVIz2EtdbS6OP+SdriKvvfJSzTBp4d
 C0DLotW9KOApvpve/4nMWcxtty5UpZjjuivblhDzdQH9xA0HDf3ty/eOLcuzhaCHpFK4
 PXMF8mAiFfgqK1kjFvxjHnIOKgcqQ9AxLYMaM2OpdmNqcfN3Y5ON+UnZQSPLJHMPxeHD
 CMpkWg/2Cz7S7YHQKKItD6GpISegw1e1NADMYpER1ihZ1yla0niuBgEoK2i9Uj/Bk39P
 304Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMES4Rc6kWOb+anNUyS3bcJRNmmxpMhi2IlBlAfqksXZiFSktJlyRyRRVogRHX1meSQ+ir2besew==@nongnu.org
X-Gm-Message-State: AOJu0YxVyWjqh9/MkmycK+cJ4NgpdEj0+Kux0W4Xxv1QoUhQqNb14Waq
 v22DgGFbLKZh8xlqYEKq3xxt5TQ5g76p41iyIMSLykAzs73XxtVXIxMjZbVeHh4i5wY=
X-Gm-Gg: ASbGncstiuWnvWmLL+dfjJvY0ndG5S4FWLSAtvrDDQIv401xF3IkaApiuY+VOi20IEB
 e1FHkjDa7yZhFbMNw1aQb7WwXCYQsqQqkskzhBTPq134C6mZKktAOxWrNqqdZzzP2lAgvr9I7Cf
 RD1y9GHKmoVme5J7SuJ29om+oyswOJgt9+CC+b6q+DXn2HbRlCm3G6WgSxMzOM9vyfmeqKvcjmS
 LGi3dqWSFeOIedft3yrg0hTJld6vD/HPiHezfUMCS4q+wAUIKs67IDETCFX8gYmgzTsncwLoFJc
 NrogwXwnu/HRErHercPmHH7R+qPyxGWjt2RLnZ3jEbKGvoYQxdb6GRKQlLiitQifh0piuECcJhe
 zgYwuSAwXFUn9EXldOCFhN2Hl7Ncn8v/zj0eWaN2G2GxHkdRX9/RX5rKLRg5l+Qkbn9fK2htdq2
 cpPoDXiZNqYZsMwFgJThnCzW9FWgVla6HE1w6+L7E9ALeYctKXzB/DrtjKzRkQo9lNMTuu3TY=
X-Google-Smtp-Source: AGHT+IHOQf2Nme0A5MkSLy70RjfLQDNh69L8xkTQCcbQ0oQdMUBrOe1V+OZ9HnXjAKsvbAkdmV7oow==
X-Received: by 2002:a05:600c:c177:b0:477:429b:3b93 with SMTP id
 5b1f17b1804b1-4778fe63008mr131753845e9.18.1763393971443; 
 Mon, 17 Nov 2025 07:39:31 -0800 (PST)
Received: from [192.168.8.105] (66.red-37-158-132.dynamicip.rima-tde.net.
 [37.158.132.66]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779b509a5esm135298885e9.2.2025.11.17.07.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 07:39:31 -0800 (PST)
Message-ID: <22652ca4-0650-4ff4-ad55-4ad10e668bfb@linaro.org>
Date: Mon, 17 Nov 2025 16:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/10] tests/tcg: added test for MTE write-only
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
 <20251116-feat-mte4-v2-5-9a7122b7fa76@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251116-feat-mte4-v2-5-9a7122b7fa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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

On 11/17/25 02:40, Gabriel Brookman wrote:
> This test cannot be run in user-mode because the control bit that
> enables this feature is only writable at EL1.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   tests/tcg/aarch64/Makefile.target |  2 +-
>   tests/tcg/aarch64/mte-10.c        | 55 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index b491cfb5e1..6203ac9b51 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -64,7 +64,7 @@ AARCH64_TESTS += bti-2
>   
>   # MTE Tests
>   ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
> -AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9
> +AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9 mte-10
>   mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
>   endif
>   
> diff --git a/tests/tcg/aarch64/mte-10.c b/tests/tcg/aarch64/mte-10.c
> new file mode 100644
> index 0000000000..0fa3f97e1d
> --- /dev/null
> +++ b/tests/tcg/aarch64/mte-10.c
> @@ -0,0 +1,55 @@
> +/*
> + * Memory tagging, write-only tag checking
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "mte.h"
> +
> +void pass(int sig, siginfo_t *info, void *uc)
> +{
> +    exit(0);
> +}
> +
> +int main(int ac, char **av)
> +{
> +    struct sigaction sa;
> +    int *p0, *p1, *p2;
> +    long excl = 1;
> +
> +    /*
> +     * NOTE FOR REVIEWERS: to run this test locally, I modified
> +     * enable_mte to also activate write-only tag checking by writing
> +     * to ID_AA64PFR2_EL1. I am not sure how to modify the test so that
> +     * it works without that modification. Input appreciated.
> +     */
> +    enable_mte(PR_MTE_TCF_SYNC);

You must

(1) Delay the patch adding the test case until after FEAT_MTE_STORE_ONLY is enabled 
(currently patch 10)

(2) Implement support for PR_MTE_STORE_ONLY in linux-user/.


r~

