Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D84C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:05:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEZJ-0001Qw-U7; Tue, 08 Jul 2025 16:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZCPY-0002Mc-PS
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:47:56 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZCOa-0004Ua-2A
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:47:00 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-40a4bf1eb0dso2527567b6e.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996761; x=1752601561; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mzc1sOSa0wi9ySmpflggXiVzpPCSM/CTP/TCoAyaoyc=;
 b=ZyLpJH294SImabDia7F8Pni2M2PSS6TCMC7Z2jZlaGw806WSebh6oekZZNvE4ItMnT
 9Iza3f2kX6gXkDWGYkHt8WfVL+cG3JVEEkU2gnw3MPDp89viq0wK/S6IT2uK59a2vGLE
 7+fq0uSB2/vsw8bEcQFvMHuVO1zX9VIrqxNBHFr/YExv89JyNsIdUWnW6pIaZ9cEky0e
 5lmrXaC7OhbcNZdYFxAjRIkR7YxNrxC9V0f1+mJ3BS7sIoLsKG262sf/+Saf2tpjjH9m
 2KtVfhDNGPRsskyX3bUbzlpUebynm50/FmDxZ9o6KpmQrN1llFsrcOuHUomowBn7Ncvo
 viUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996761; x=1752601561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mzc1sOSa0wi9ySmpflggXiVzpPCSM/CTP/TCoAyaoyc=;
 b=O/IVQMPQKeco03pCWS8xllvwpH6/lxExwtwcP8Zl19KyzNljwYGwvNa9yyMIpwzEWR
 YGXiwuMss0GWdmTrXq5atv+N3OxuNsqfsjW3SFx5YyLFnB/ydnbQsENbxcPjE6ApfurH
 7rK0+xrt8CtVpaZ5Rx+l86+0l8AAwp2ydDXLVyQAWJYQoy4eZJrpw6LkKsvkjsMfsk5a
 JY/Of9lDC9GNmflj9hkkYOs09YevLchtOCRhtefr9yb70hdpusWlUljPIOX7P7QfVZGX
 4EbrQFwKMtZI9qvO4tviSf8rIWINgml+7rOscwDxiIcQVD2EwULQiXFTsL1EVhXFmogh
 J62w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSPED2wTL52Kb7Gwl1ZzYIysOcUY3sFju/FOc3vcpcyEufJRNdspEaGX2lZnrh+VQiaG/3Ddm5iQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyqw4AE3SPkDXaqx2y7EDttYA8Nv8Wy/Wqn1k6aWu3+imwoMcuV
 uk87PN4rUASbQbY95kvZ0NH46iN+3qgMA8cEStB/r6umT242FeFMUtt7jI+WbG7Iqx0=
X-Gm-Gg: ASbGncvThh6UteH3/JxRhckhWS0kT7Q+S1vvbCjG7Qy+hPBYzA7iZobHgBSVeLqAAVx
 MMVCjuWzvHrwXAFlP3SfdSB6uSui2NVqarP7VXoK3yemJ1hRiBUHKt83FrIop9fZKdVBsYgjCnn
 lS08DI82oev2iZuLUedQ4UGSw6Xl5YhvrMNxmLZX1isGWvY8KLyRZw47xGPjFvQ8orsxMlKP3AO
 1nfU+/H9DOdKVRvPGZVfc9kWYzCBrldXNvgnhNehWHag1aYk3l8MGslyB/wZ7vwYAx9iHgMnk91
 I+rOZCiCzEoMpSCyKYTS2QhZa6axgxo2qI0jEGKVyVKIaWyLpdKPQjTq7Ajh77zSphp5Wj2Bqm2
 ct3I9bty2lonIcorUHW5g7FqBE2lv+Yxy1SxLAD/F
X-Google-Smtp-Source: AGHT+IHcVUpdPlimuoJyFTlRNbFCLxvVh8PfULCpGXXEhAnlHQvJVlUli8jCcpmYxy40Plk2GqoZ9Q==
X-Received: by 2002:a05:6808:5285:b0:40b:15ac:df1b with SMTP id
 5614622812f47-40d072725c3mr13864950b6e.7.1751996761486; 
 Tue, 08 Jul 2025 10:46:01 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e59123csm1687912eaf.19.2025.07.08.10.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:46:01 -0700 (PDT)
Message-ID: <26f11120-c983-452b-bade-f06a35bfb6dc@linaro.org>
Date: Tue, 8 Jul 2025 11:45:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 6/8] gdbstub/helpers: Replace
 TARGET_BIG_ENDIAN -> target_big_endian()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708171949.62500-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
> Check endianness at runtime to remove the target-specific
> TARGET_BIG_ENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/gdbstub/helpers.h | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
> index 6f7cc48adcb..1411b136d5c 100644
> --- a/include/gdbstub/helpers.h
> +++ b/include/gdbstub/helpers.h
> @@ -16,6 +16,7 @@
>   #error "gdbstub helpers should only be included by target specific code"
>   #endif
>   
> +#include "qemu/target-info.h"
>   #include "exec/tswap.h"
>   #include "cpu-param.h"
>   
> @@ -55,18 +56,14 @@ static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
>   static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
>                                    uint64_t val_lo)
>   {
> +    bool be = target_big_endian();
>       uint64_t to_quad;
> -#if TARGET_BIG_ENDIAN
> -    to_quad = tswap64(val_hi);
> +
> +    to_quad = tswap64(be ? val_hi : val_lo);
>       g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
> -    to_quad = tswap64(val_lo);
> +    to_quad = tswap64(be ? val_lo : val_hi);
>       g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
> -#else
> -    to_quad = tswap64(val_lo);
> -    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
> -    to_quad = tswap64(val_hi);
> -    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
> -#endif

Don't split the endianness check between here and also within tswap64.

This would be much better as

     uint64_t tmp[2];
     if (target_big_endian()) {
         tmp[0] = cpu_to_be64(val_hi);
         tmp[1] = cpu_to_be64(val_lo);
     } else {
         tmp[0] = cpu_to_le64(val_lo);
         tmp[1] = cpu_to_le64(val_hi);
     }
     g_byte_array_append(buf, (uint8_t *)&tmp, 16);


r~

