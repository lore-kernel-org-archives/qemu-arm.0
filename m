Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B413FF8855
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 14:07:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKcoD-0005f6-J3; Wed, 06 May 2026 10:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcnz-0005Io-IM
 for qemu-arm@nongnu.org; Wed, 06 May 2026 10:00:56 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcnw-0000at-N0
 for qemu-arm@nongnu.org; Wed, 06 May 2026 10:00:50 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7dcdd23fcdfso3498147a34.3
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778076047; x=1778680847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iDA+dq072yUY0/2j22IQWd02WnCyJu7JuO7vogkNwzU=;
 b=P8YL5mMeaDFQY7s+yOaBql7MKD8rMRm0VhASRExNpnWs04IG6K0s7MyRwCTZ22Evp7
 ZPPmeSTR2hTnBboKhB2WR7Vk8Rxg+xBh8WjFr7K6PRUKDdL5vhrbVAHFIW4gIpGDwtL0
 hZ2HFOcpNui+kp6q4W6JvzEaWGMrxgMcAYLHS+1tocqER+jqBh55NAZd9u338ydQgJfi
 bSxrYAnRm96j6ceT8yMGpTZhLNIB/bJsw+g4B4li2bgDFHD2tKN9OR1HK4iUWSitvksG
 WEqyxVROKJU0aoQAUbOzcZcWwE2J+Bvl/tBmg30diovs0PHSPGSevqMy6AwSi0AQIYF4
 nkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778076047; x=1778680847;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDA+dq072yUY0/2j22IQWd02WnCyJu7JuO7vogkNwzU=;
 b=DQltpL1gjRVeNQGhDxSnpK6pR4V6XZaAwknd0wrMBN7UoxHdIHlX5f7QqjpBhEeYSE
 JhBy9gqL/xvyFT0dChb71LbHO6h8DJiUE6j1N8U/e/jPVBoKxzdav41pjjOFo0WvHtQU
 PniQJuLZVSPkUj4Jdkb9PmuzXbEiQHdWe0hpRcIdemZwzS/Co5QhjeHnJsHUmCUbZ9lz
 4/QnSfje2+xmPFQzT01FQKkAM/EfOATXsOmxVuVB0xzsfzr84zTvyRSQB/XZ4dMYxdoM
 uXd9DzTEJ4pjVtUi5Zi3lf0aj8wTV0VY7L4fKbg3O9bVgrxSIpkkQk0dIZdfZMx5c02C
 2sjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nVZpvRDtFnnfIgwgT3jHppuh2KZzvUhksDYOhnsUQlheB6tKg13cYExomivRORJYe2jvmHHutsg==@nongnu.org
X-Gm-Message-State: AOJu0YyY0gcSVDZEH6eL5KvQusWx+ELR69MAfsWGG1ZRc2l7u/cVsCEi
 qZ9odQh0vyMri7CZZ1ysg4thx+i0h27gbAPeoBN1hLGr6xGBuin0xZ5R8/PZSNy+E80=
X-Gm-Gg: AeBDiesB07sFWlg3B1OIplwQQG/5g3JeccqhtO+d4u5vuoLoxXtNS32FM0CVcCMyN1a
 AS8jEqX09O1YqDkR87Q8amoroNMQmf2Ex6XG+3D19zHWF+tcsOpOZIUbs5dHRsWB9wfIdz83Br1
 uU1YgdjnyUp6Zw+1mFXUHc0egPYpRutzfAzgiEzHyc6X+Ew55ckg+/WIwp7dzD+djCpnME9DOwf
 2OSMZArvKRR6Zvg5kaj7+TCpq98AblKndal6rNKVHzmKgWIqBXF80zHUK6Bvs05dZQeHltEvfw8
 YJkjOMl/RbSL+Guvx4EYUzycr3xhzoZ42bxqvkKp/4+twIUGj2yMtQi13OilP8pIGkkw4tbonTp
 /rRHANOh7aXvz6herrkGU1iSxruw3bs7FKytLptUQDSw7j75x7m9e7SVR0ZI3sCzvvUgBJ8joDU
 Vnr9n873V1DFzcINOHBVc4KbvvCDMRk2HCl8z1YlARP7K38Q5PjN8SJhusSmf5k1ucsTvVbfXa5
 JMRWCokBjqf5eIwhfQy
X-Received: by 2002:a05:6830:d86:b0:7d9:f50f:968a with SMTP id
 46e09a7af769-7e1ded2af42mr1658654a34.5.1778076047102; 
 Wed, 06 May 2026 07:00:47 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a5e75sm12040005a34.2.2026.05.06.07.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 07:00:46 -0700 (PDT)
Message-ID: <eb2e62ba-085f-4d2a-b339-d8113853acf8@linaro.org>
Date: Wed, 6 May 2026 09:00:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] target/arm: load on canonical tag loads ext bits
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-9-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-9-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
> @@ -304,7 +304,7 @@ int load_tag1(uint64_t ptr, uint8_t *mem)
>       return extract32(*mem, ofs, 4);
>   }
>   
> -uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
> +uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
>   {
>       int mmu_idx = arm_env_mmu_index(env);
>       uint8_t *mem;
> @@ -317,6 +317,11 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
>       /* Load if page supports tags. */
>       if (mem) {
>           rtag = load_tag1(ptr, mem);
> +    } else {
> +        uint64_t bit55 = extract64(ptr, 55, 1);
> +        if (mtx) {
> +            rtag = 0xF * bit55;
> +        }
>       }

Better as

     } else if (mtx) {
         uint64_t bit55 = extract64(ptr, 55, 1);
         rtag = 0xF * bit55;
     }

>   
>       return address_with_allocation_tag(xt, rtag);
> @@ -458,17 +463,19 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
>       }
>   }
>   
> -uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
> +uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr, uint32_t mtx)
>   {
>       int mmu_idx = arm_env_mmu_index(env);
>       uintptr_t ra = GETPC();
>       int gm_bs = env_archcpu(env)->gm_blocksize;
>       int gm_bs_bytes = 4 << gm_bs;
>       void *tag_mem;
> -    uint64_t ret;
> +    uint64_t ret, canonical_tag_val;
>       int shift;
> +    bool bit55;
>   
>       ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
> +    bit55 = extract64(ptr, 55, 1);

Sink all this...

>   
>       /* Trap if accessing an invalid page.  */
>       tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
> @@ -476,6 +483,35 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
>   
>       /* The tag is squashed to zero if the page does not support tags.  */
>       if (!tag_mem) {
> +        /* Load canonical value if mtx is set (untagged memory region) */
> +        if (mtx) {
> +            canonical_tag_val = -(uint64_t)bit55;

Down to this block:

         if (mtx) {
             bool bit55 = extract64(ptr, 55, 1);

> +            switch (gm_bs) {
> +            case 3:
> +                /* 32 bytes -> 2 tags -> 8 result bits */
> +                ret = (uint8_t)canonical_tag_val;
> +                break;
> +            case 4:
> +                /* 64 bytes -> 4 tags -> 16 result bits */
> +                ret = (uint16_t)canonical_tag_val;
> +                break;
> +            case 5:
> +                /* 128 bytes -> 8 tags -> 32 result bits */
> +                ret = (uint32_t)canonical_tag_val;
> +                break;
> +            case 6:
> +                /* 256 bytes -> 16 tags -> 64 result bits */
> +                return canonical_tag_val;
> +            default:
> +                /*
> +                 * CPU configured with unsupported/invalid gm blocksize.
> +                 * This is detected early in arm_cpu_realizefn.
> +                 */
> +                g_assert_not_reached();
> +            }

This doesn't need a switch.

     ret = extract64(-bit55, 0, 1 << gm_bs);


r~


