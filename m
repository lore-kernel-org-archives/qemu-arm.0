Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1535CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:17:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliJw-0001P8-QG; Tue, 12 Aug 2025 02:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliJL-0008Vv-8u
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:16:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliJI-00054c-KA
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:16:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso49715495e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979393; x=1755584193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQQpPpv8WXEQc9zukuQOFNzDFXRFj7DWgsdGTibAnpI=;
 b=F/1qFcyRDseVD6Xn97BWZTWR47t+NGoiVizXN4Tv02YezkEXW1R9+7AzwCXhxz3TVo
 ch7eAhSnzFxm6BxSVBv7OgeGNfa1IynZE3n3YP/lUwX8p9cvPsEs645DwUAhlqw61scR
 bPXxxzDqu9YZ8qNbXN65Somwa2nIsO5+ChfaVgSVT79iYuEpWLPegxdUxLlE8T/69OhV
 9CmI4g7jm/kyYY1i7SAbZ1EiZG00TzDLsmh8vd9FyEUnFrM87y0en0kGTCe900UrmlXw
 xmcGEHwF/F3zXaZehasd6H9YQpXhxQhs6TP/kSgjqxGO+60q1XWI7f0ATzXiF6wa5SwS
 X4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979393; x=1755584193;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQQpPpv8WXEQc9zukuQOFNzDFXRFj7DWgsdGTibAnpI=;
 b=RU+dl4CQhEisN7HOxOXmjidKn1CNQ0WK5OizLi11xKJehDWUsPCvfX20wX0q6gurCb
 L7UP+d/0YKm88iVjbGf7AL3e4YAHXJpc2hK0g8GblzuALBBkErJJ674d4Xe8yCzzUXV3
 Tb1Dsa+jDgnDkLQyrvgaux26Ho2/vWVus5T7zrlMuund4a/JUlSO1XJU+Z8esLWG9Gla
 htGwOSNC3xq6j+F/53zm2xeTGYG7ljGfl6LBf7YCSX1LxovVc7ICA8+LsBwINr1bYg7E
 +6e+DSIozU9NyD/4f5uCrpRadLFtNknvjKhu8SPD2C9xsTk7Xo2/zVjYJsVHjxM/NAXq
 9lbg==
X-Gm-Message-State: AOJu0YxWZiEd4ARezSQGq7st0y4/9y/j2ByJbAVamlbbi+1DQktdrTSY
 csl6KpGjytRBD4nQ1TNZSRrBgRtQiHDKhen2djfaNFBr1QtLQw90H0/Hm4WDM3FzNX3oTv09OoF
 QtZs/
X-Gm-Gg: ASbGncvYkpUqplInBgmywrAUD73Cm7WbkJ5n1tuthYiSsm1c3+TzVXv0BV42wsozzBG
 oy38UbUIx3368n7AYXs27yd3DRMcydj/NHq84eGDszyGVihUqdgcsI1QKbCdF71jnXqsM+HUYMJ
 ZQ1OH+lRSqOMiDwokVGXmmzSsRoFEQB3R1CTn6b7dn4jVmp8ohQOFnOcY0CYE+JKb3EyaIEhUQI
 O9sC9kC3Z2cly/HN6aUR0GXVryiVg4ekpywOX7uvYm7TP+bnPVhy5puIDid6491cOoY1nV1FaQk
 08uUhvkafL6mCXYbD/qORYloudr+9vVOYDH6dPpkjrcbXPmYNx3xC9N/MzRdqxNHVg6i57kh0Yi
 Vh+bQYu8ESRZw+XMqC5Stu8Z9NNPj40YprWEyA3O4R/okM4qvQD05ungCTL4uzXxzJw==
X-Google-Smtp-Source: AGHT+IHIlMnM3fAxLGQxSjVcxHxvfIJCM0gKCtGaLdfY4udmqdO78YzoSj+3adLr22QWeqE30kqAPw==
X-Received: by 2002:a05:600c:5308:b0:458:caec:a741 with SMTP id
 5b1f17b1804b1-45a10c4724dmr17496215e9.24.1754979392693; 
 Mon, 11 Aug 2025 23:16:32 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b90d147485sm5304764f8f.19.2025.08.11.23.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:16:32 -0700 (PDT)
Message-ID: <b91de2ce-067e-4c06-86c9-82d1ce1304d7@linaro.org>
Date: Tue, 12 Aug 2025 08:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/85] include/hw/core/cpu: Widen MMUIdxMap
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-32-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 3/8/25 01:28, Richard Henderson wrote:
> Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
> but widen the map type in preparation.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 2 +-
>   accel/tcg/cputlb.c    | 3 ---
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 23eb849a9b..fc9a2291d5 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -201,7 +201,7 @@ struct CPUClass {
>    * Fix the number of mmu modes to 16.
>    */
>   #define NB_MMU_MODES 16
> -typedef uint16_t MMUIdxMap;
> +typedef uint32_t MMUIdxMap;
>   
>   /* Use a fully associative victim tlb of 8 entries. */
>   #define CPU_VTLB_SIZE 8
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 2a6aa01c57..416aaa1040 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -89,9 +89,6 @@
>    */
>   QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
>   
> -/* We currently can't handle more than 16 bits in the MMUIDX bitmask.
> - */
> -QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);

Maybe explain why it is safe to remove this check?

>   #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
>   
>   static inline size_t tlb_n_entries(CPUTLBDescFast *fast)


