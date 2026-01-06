Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD07ACD042A
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 01:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcw2b-0002xX-Ru; Mon, 05 Jan 2026 20:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vcw2Y-0002wI-Q8
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 20:39:18 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vcw2X-0003PF-BL
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 20:39:18 -0500
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-8be92e393f8so55118385a.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 17:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767663556; x=1768268356; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ug2sH7XEPHxKeX9YiZItlFjKWujIjaN1UMm65t2RKnc=;
 b=mT7zOXiMUH2N7DDYgGHhkyPltI7tWyxza0v5yjearjfzsuMEUuwDH1AsgVyMxsoblO
 tN0Kik1zDDFdxjtAQfTGPHo2eSOU1NZekLnafHgnqz9Ye0buKKh7R5/txgHG4cA9pHG3
 IBdsx4J3XLYywXFxnYvL5RDD3abve0gR4r0eEjntIxcO8lhXCGxYpCe6OkmMRnz2VAJV
 bwFdW5QaNRjOt0BbCL/UzgKbM0n/jztkDX9iy1P+XoBV8SJ5jknmncVmYAUMp+ORjKy0
 MPtqWO/JDENeEinf+Eo+xjeyCP0ttKsagmeaFYplfSa0VJDkXGxB/wHJ2ZuVE5iZxKCE
 y0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767663556; x=1768268356;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ug2sH7XEPHxKeX9YiZItlFjKWujIjaN1UMm65t2RKnc=;
 b=aYBopLYcqHqTc6gSJEZsGDZxkSNUYuzcGB9TDnrpIgJvY9jJ9Zd7AtUcj0D6gr427K
 eoWuIEJwE3k+5l0OCIuX02STapyXZsprRC/9hf66XenRCmaLrD3pCyGv1yCKXQ9j4La2
 NGZFlHfCLHs5ZmRl7LjjbesTCWh9Z/NMbF2eG3QYLND0x08/7arqepn1Yikgk68hE/Ow
 WOPo/QrCrhJI/G8/cE7O2ou3sc3wqAyb0K+yrrenKeNnHg6cGhK/1FhbWKRhQfF1LRr9
 +ZSrVSMIYFhAOFBwY8naT/lFGyohYP1tQBQrcr2prS+XdBbmxTrZqkCVQ7ajwrPLG/FU
 bJOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyF6xmpz6ntbLGuE45gpvQxk7ZTIPbdmlqYAhmdoSMuIDf9zKMn1f14RNaBD4jHQKYrpRzNRB5kQ==@nongnu.org
X-Gm-Message-State: AOJu0YxY/2cVd6fz4eRcIGBH9ezAoqO/BqO1Ke1uByl2CyS1s556+21M
 6ODtzPk7x1GB5GdojHh+3YEib11MuZdeOhq9Qy3CjUnEu+vgmz2Wn1AaYBiP5ui1qEw=
X-Gm-Gg: AY/fxX4idfvuwPmuuT6jp/BYQteVXghcG3HZA0E3KyypGgBQR+05HM65TafgRfg+gPV
 wXBMeYCmAJEwi8cqQi2rwEyI+6D9DXUCyrFfB/xP90oazqDe/cZYUkJH+GAKF0sOv+wUrbkvVfr
 WeHA8ZeCCvjLt/8myDQKaaCMXx+VA0GlGDwfgBddkNuE5Iv7dyY/ZxFnt7OdJcRsOtj1F8X2qI4
 j0DITTjutM/i5w020bzn+kD2Ug7j9sgAoigjfafjGkLKhaPMmMlqGiDodEg9/lKmkVCvCLIw8x7
 YlgGibaxFP0jJ0xRQbyYGz17hx09nnwWrn6uJ/ilrHvoklB6/8McBzNjGFeFTKoQOQSvXSR3WHc
 Dn1k1LBR8z3+O9kP1uTWERRyV+tkkCa0tkU/ad6guGqWb8Smb7XFwQeBw0jkTilnDrD39W4KM/E
 cXTP5Fost0VTHg0Fw9QMTjM3oqd5tfbOVpXoSMGj2DkADMuyndjqxjW2FySMrOqaNVo/xqzIs9D
 3g0dWkO
X-Google-Smtp-Source: AGHT+IHZfdZBPPaWxaIxt7cwRyvurfMD+9lgoVdWZcxDQFY1TCf31FAZn1VxqqbTpRQSjdswbiYBAA==
X-Received: by 2002:a05:620a:2548:b0:8bb:6a17:cd62 with SMTP id
 af79cd13be357-8c37f4d72b7mr174119785a.15.1767663556024; 
 Mon, 05 Jan 2026 17:39:16 -0800 (PST)
Received: from [10.212.166.227] ([172.59.187.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89077253305sm4994996d6.41.2026.01.05.17.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 17:39:15 -0800 (PST)
Message-ID: <2a8b62ca-efdd-4b40-b3e2-41c446c72479@linaro.org>
Date: Tue, 6 Jan 2026 12:39:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 08/12] target/arm: storing to canonical tags faults
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
 <20260105-feat-mte4-v3-8-86a0d99ef2e4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105-feat-mte4-v3-8-86a0d99ef2e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

On 1/6/26 05:14, Gabriel Brookman wrote:
> According to ARM ARM, section "Memory region tagging types", tag-store
> instructions targeting canonically tagged regions cause a stage 1
> permission fault.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/tcg/mte_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index 795a5ad20b..8f06ed3162 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -227,6 +227,20 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
>   #endif
>   }
>   
> +static void canonical_tag_write_fail(CPUARMState *env,
> +                                uint64_t dirty_ptr, uintptr_t ra)
> +{
> +    uint64_t syn;
> +
> +    env->exception.vaddress = dirty_ptr;
> +
> +    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, 1, 0);
> +    syn |= BIT_ULL(42); /* TnD is bit 42 */
> +
> +    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
> +    g_assert_not_reached();
> +}
> +
>   static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>                                      uint64_t ptr, MMUAccessType ptr_access,
>                                      int ptr_size, MMUAccessType tag_access,
> @@ -363,6 +377,11 @@ static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
>       int mmu_idx = arm_env_mmu_index(env);
>       uint8_t *mem;
>   
> +    if (mtx_check(env, 1 & (ptr >> 55))) {
> +        canonical_tag_write_fail(env, ptr, ra);
> +        return;
> +    }
> +
>       check_tag_aligned(env, ptr, ra);

These are mis-placed, as the alignment check has priority, as does pte_attrs == 0xf0.
Compare S1DecodeMemAttrs vs allocation_tag_mem_probe.


r~

