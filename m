Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAB9E63FF9
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Apr 2026 23:17:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9AEr-0000bf-Ju; Sat, 04 Apr 2026 19:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9AEq-0000b0-Jl
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:17:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9AEo-0004mW-Ty
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:17:12 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35da01fc0baso1981975a91.2
 for <qemu-arm@nongnu.org>; Sat, 04 Apr 2026 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775344629; x=1775949429; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2/bKWFGdJReBNI3uKMwIq4NWSBqtjkvMq2rdgCS2V0=;
 b=p5tHwUBh677Adr/MTYgMZj8YzkNd02DvxQbhus/LuepSBnDnPHf8dEdNm9WZabIUYF
 QqWaqfUV6JH4bLRIPsGV7ALbGYSzMKZdwkxdx5b5qzaf5YcL/D1PNsnzjCSeLYvFSfjU
 f2EUV300b4+FPQKImvmSpe8IU5bk/897zXTVK8+3Wbk20C3G3cMlGOxk6lP4psdHZQNr
 49Q8KxuIinFfaJankXBKpb1bkoMBVLtBVUC+j97R59lISTc9JNMVSwgSkS20+JJjYv2B
 tzH4taNYU/BVgGOT877JcFpD1DzlXOz1GA6QuZaAz2o7zZhWf1U5iVfEQpmmPGzI0GG5
 kWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775344629; x=1775949429;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2/bKWFGdJReBNI3uKMwIq4NWSBqtjkvMq2rdgCS2V0=;
 b=ShKlLmtTL3XDCQRgxT/uEpVQfgLBRcFxArbz+BYb4wIGg5c6iKYD1wdrAXtBFxZZPC
 aL9KJorjMoEQ8N4wj9097c9WGsJPbfLxZRjx2A8kw81DRMxTFxs0gePg0mcEFbe86Xq/
 451QNFuc9rmv1xB4ndIhRM0rOtc9dwn+LFVpuw8Fb8yj5F3jNapOs1OhyiB303bXM4RX
 ++kYLGztpSYRA8jkZUKpl2gY5Ovgz3OnvphDKNcSfnTVnWvviIZiBT4GyJDke5M8dZcE
 OUtxH71mmIOJhWOhju0JO+uO/nQb8PQOAuFVlxAKYOoBbYI848FjtebYLFJGa+sBz/z/
 /f1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUNk00imgTYnnJmrrzmmEQ2FpVxF4i7yzXe3V5paw/Nm0FHA9aZWH5CglM9gjNCiDq5G65Kukcwg==@nongnu.org
X-Gm-Message-State: AOJu0YyTjESSBC6ZZniKSvfceBKXwpKU/BbVTQcZ5Frd6PCx9ukwUzwT
 AyfgmlObsJBfZO7DzJOnZHqgxsjBcQQJa6YvtUS3RNQwE8d6YV+F7+Nvy8xhuMZqLN4=
X-Gm-Gg: AeBDievjSj3uAjR1gcvm5Iv6lHfYQVijGC8vDq+oRg5EGo3l1Ya7vBT0RRGu1r0gU7Q
 ILmtsRnH5ekv2NIk7Uv6jCsY5+Ahg4Tw7Hf4j1HCHaKL/B4H1+pKYkDGXJDn+VS91Qr92s/hULV
 03ql7s35QfiiOzCXAHQajIlULEzc7EntkWOU9ivqlQY44MQvgrrHyHLE/vcXP0VvAvrQd3IzwZe
 wlhquNXIahc+/IjsrXNhrILI+tvoyytuvobzbx0+M3TQpjvzGbSnuRMQcXHOs231JBzQpT11rSX
 zlIJhJmAoSsjS7q+4lizNL9OuAKTDiqVY5S/1ImV7zrlm5kcOI/kaByDunv70vQK1MFTO/AgJj1
 kD9hH257SrfFYZ2eFAlH/vKSPx7NuDWNMaJ5QznQnVNh1F2GfLB444IpWTMMPtk0AjlyuWn8xOC
 6eznzRxt5g28xQUiMeTTSlQOz9pmuvLoSewhP/ZAe7PBcL961ljF9WFAc1Zc2grt9jM5M=
X-Received: by 2002:a17:903:1a68:b0:2b2:56bc:c6a5 with SMTP id
 d9443c01a7336-2b28188de3amr80970775ad.42.1775344628758; 
 Sat, 04 Apr 2026 16:17:08 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749b66aasm98861745ad.68.2026.04.04.16.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Apr 2026 16:17:08 -0700 (PDT)
Message-ID: <f22d9c56-c0c3-4084-83c0-748c950ad302@linaro.org>
Date: Sun, 5 Apr 2026 09:17:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] target/arm: implement MTE_PERM
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
 <20260309-feat-mte4-v4-1-daaf0375620d@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260309-feat-mte4-v4-1-daaf0375620d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/10/26 08:59, Gabriel Brookman wrote:
> @@ -117,6 +138,15 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
>       }
>       assert(!(flags & TLB_INVALID_MASK));
>   
> +    /*
> +     * If the virtual page MemAttr == Tagged NoTagAccess, throw S2 permission
> +     * fault (conditional on mteperm being implemented and RA != 0).
> +     */
> +    if (ra && cpu_isar_feature(aa64_mteperm, env_archcpu(env))
> +        && full->extra.arm.pte_attrs == 0xe0) {
> +        mte_perm_check_fail(env, ptr, ra, tag_access == MMU_DATA_STORE);
> +    }
> +
>       /* If the virtual page MemAttr != Tagged, access unchecked. */
>       if (full->extra.arm.pte_attrs != 0xf0) {
>           return NULL;
> 

This isn't quite right, as you're not checking for probe.

I suggest

     switch (full->extra.arm.pte_attrs) {
     case 0xf0: /* Tagged */
         break;

     case 0xe0: /* NoTagAccess */
         if (cpu_isar_feature(aa64_mteperm, env_archcpu(env)) {
             if (probe) {
                 return NULL;
             }
             assert(ra);
             mte_perm_check_fail(env, ptr, ra, tag_access == MMU_DATA_STORE);
         }
         /* fall through */

     default: /* Not Tagged */
         return NULL;
     }

See the block comment just below the #else that starts the system mode implementation.


r~

