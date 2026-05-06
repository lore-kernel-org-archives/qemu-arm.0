Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB1AFF8855
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 13:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKcXx-00048q-5K; Wed, 06 May 2026 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcXv-00047k-KQ
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:44:15 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcXs-0002BB-DT
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:44:14 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-651d692e833so6857362d50.3
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778075051; x=1778679851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fI9JpdPlkioAZvqoyFS3ftYkVDPhNASi8259Q8zcpN4=;
 b=IGHK3FCnM/v1GzR+XNtloytiUpLqoUPULBGn60FVg9jNaqoOQkXhb6BMvSwXIEN7ny
 TUgxHFaLw9EV18J6bw1x8YahLYXzb2iRCpTsDpUP2KzvqbXUkQD6rzJePiBd6C6i54jk
 NaQe7hbO9AKWTelD5C3UsDH/rq2X6pjOnMSzVsdNQV5ceIA/d3NTghvtbswwImoYWIrY
 /c8/kbOpRrJj+KUIOYjEtZQ+iK9Yn6nDieuIc85P0tl0SKyc1cZXm3rK/RvftOajFbB/
 2sUKt1/3r9bGTxZoUMOoD9uxZO2uFIajHPm7pRn26GxhjMhymrI8PufilbqN6BojA3P0
 bpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778075051; x=1778679851;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fI9JpdPlkioAZvqoyFS3ftYkVDPhNASi8259Q8zcpN4=;
 b=F/lOXZ/vCuybWUnVX9pcQ/80h0lnefqBkEaVzv51VSTRwgyyf2hMEO1tlkBBHULVX8
 Q0881bHpicLAyEZYjXL5q+XFqL3SE7PlRuoxVoW7u/HYnrQw2zvVVhFSBTlcAwebCVJo
 xFnWhQJeALIJIr9UyqEQmCF4tWJ6PrhtmY6yHfJgVmGArkvSUGVlyKIhZK0ibg5vCkQO
 /ItJ/oTSratKlkXVyjlTWQB6y5juEzcLRQZGURteSjbIgzqprQRriVtW9VsBvF+VtcI5
 C2KNi41atoxSWCb286A2SkiQA+Y/us3ODjNd4unFtqXEI4TfaueYGHcpm/j80G6dPHak
 HHtA==
X-Forwarded-Encrypted: i=1;
 AFNElJ89I0JuMoqUobN3d7iRu7Al4HmMjArf/Y1A22TKTFRai41/+cTVDCA30AWRnxROMDrkmh0Kr2QfKQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywarnw9MtEZHmrfHcKfYYddG1mjHHEKjnWyNqMjY48iZFJtpjdI
 RIQeYzD2rGFNVV7Qa9oNnp+LLTzwTr++4ihcDMYnxPqcVdcxdBCkwkjt/Hhk8jNYh9c=
X-Gm-Gg: AeBDievBfxK+q08HNFKsaiJKD2V9BJ1aeItDJGjZ8c1z4elQXJ6UvsY3zPapt9uEIGo
 nKmOPwC45NsuV0PIOAI0nNZEhGDKBA70YB2kgh2PqliUI9kY2hV81faTvs/JNe5MFnZEQLZuLie
 NM/VpMGmfHmppGFtfCOQSmI7gu6WYhoW31jIJvl9PAxIx1cKRqQm06aEnwEgjsSCoB/QQTc7J17
 qO1d5gs2o+JHWS0yQggdkID8IEDpL0kvYZay86d8PhFM6ffvbSL13lBBw9fYx0Hv0SUSKkjigLN
 kxx97Ex10aJGm0O2R6/w6uae+3g9fi8JXoIKvIz14r/yRQOXWOohepalu2jJcURGPnPZK4rJQ38
 iezHkBxsU92hxCHawQVcunXcbjvMWyZcYap97Q2DJ12C0cmYse40FpcyUpNE2H5a9wmDZWe6OzE
 cxaCbtG3CBgUqxWf5E6oB+J62YtFM5eDgxC6oZq6Yalfi29UQrnxmnzguORuUibN+hNcFjhZuvp
 RQju+EFeExZctabTquu
X-Received: by 2002:a05:690c:c189:b0:7ba:ee75:f119 with SMTP id
 00721157ae682-7bdf5dc7b82mr35430647b3.15.1778075050931; 
 Wed, 06 May 2026 06:44:10 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd6683794dsm79926517b3.27.2026.05.06.06.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:44:10 -0700 (PDT)
Message-ID: <39d0700c-4185-4683-8249-1d014c579c59@linaro.org>
Date: Wed, 6 May 2026 08:44:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/15] target/arm: add canonical tag check, mtx helpers
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-7-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-7-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yx1-xb134.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> Add a helper that checks whether mtx is active from MTEDESC and a
> helper that checks whether a tag matches the selector bit. These
> helpers will be used for the subsequent commits.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/internals.h | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 6df2c547c5..779eafabc8 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1629,6 +1629,12 @@ static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
>       return deposit64(ptr, 56, 4, rtag);
>   }
>   
> +/* Return true if mtx bits mean that the access is canonically checked.  */
> +static inline bool mtx_check(uint32_t desc, int bit55)
> +{
> +    return (desc >> (R_MTEDESC_MTX_SHIFT + bit55)) & 1;
> +}

Unused, so belongs to some other patch.


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +
>   /* Return true if tbi or mtx bits mean that the access is tag checked.  */
>   static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
>   {
> @@ -1636,6 +1642,12 @@ static inline bool tbi_or_mtx_check(uint32_t desc, int bit55)
>       return desc & (mask << bit55);
>   }
>   
> +/* Return whether or not the second nibble of a VA matches bit 55.  */
> +static inline bool tag_is_canonical(int ptr_tag, int bit55)
> +{
> +    return ((ptr_tag + bit55) & 0xf) == 0;
> +}
> +
>   /* Return true if tcma bits mean that the access is unchecked.  */
>   static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
>   {
> @@ -1643,7 +1655,7 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
>        * We had extracted bit55 and ptr_tag for other reasons, so fold
>        * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
>        */
> -    bool match = ((ptr_tag + bit55) & 0xf) == 0;
> +    bool match = tag_is_canonical(ptr_tag, bit55);
>       bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
>       return tcma && match;
>   }
> 


