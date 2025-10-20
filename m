Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1577ACCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAz7X-0003C0-B2; Mon, 20 Oct 2025 19:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAz7W-0003BM-9Y
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:16:54 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAz7U-00078j-KN
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:16:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-33e0008d3b3so120939a91.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761002211; x=1761607011; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/8yStAvkW0oGQ/5TyFOpnzmT8UGmTer1uPM3qhfTqDs=;
 b=uyFYYlMXV9RHrIl390qc34NEPHk7dDFmYZKzRfpyn5mAGHIJMVuUTnS0fOoa7IboZW
 FOQa7QgEWQ+MWbTQAq8d5iWJB2618JOThliv01MJxwb5uB/7EpFEQ9atgsA6pM5EaEvn
 8V673Aj/fXKEUptTP/xQDA6aZ8e67oJPpNwGk+WekuJuOoSm+oa8RiJ8HbgV/2AK7v5H
 QA1j+RWAyMQ5/I/s7ZWkxtXfcgg3QcfrAmlNOR72/ujFJahpbv+eMi5cPcuTWYHDsF3i
 W+vLauTYQgD9arfBTdc+7YF5J0+9MH/2McU2S8DwJW+lLH6LHzUyD3T5dDMXWbCPHU6V
 CRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761002211; x=1761607011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/8yStAvkW0oGQ/5TyFOpnzmT8UGmTer1uPM3qhfTqDs=;
 b=pnsQJwX9jOfHM+yOeQgP/r60DeTksh0loHip4dNUsqWAhogq/Pd4R6JNKgBctWwkZa
 iVYCEwh2ch7fiN8XJzjhZfpdd4okivY3EBXCspEuAGluYs6fxI6V7Tgv1kJz3yk+jTjY
 qJ6IpUps46Flmix6tUKO4g3PwxIiT5wgxZKT0pWlePchTn1lS97i3pe5XDRZpslZLPxj
 BrGNsx2UNil0n/QBsvSRpCd7/dxVezmR43tFbxC9RUj1s566HBSLofaoI1WhWs9MWEkr
 JTQdhATfGNCyZ0iZRsPdR0eDc+FlSRat9ssRZEkP+kgniIIu2ItdMavqT06gBZjS9I+4
 oX8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoEUffFkhA1EOJku7xiiVZOiR/l5OlMggEpG2pQjGypC37PGh7YP3y6rt5ovuEmYhHzdnFWV4uXA==@nongnu.org
X-Gm-Message-State: AOJu0YxESSINSHyPaWT0gUqrWtxfif7h4NeXXV+cdP3Doi9SVUQ2vL9S
 fF8ee20V6tVzDcHg2NQ/gJ31WSoIzvSsjF4bE0Cz675BekPV+8BKjoZebqNKSCRue4M=
X-Gm-Gg: ASbGncutDqZdGzyQw7YJX6q4wJpA9yI080Xaq/ivdV+nil21gWsnggxfy5EbSl812Ny
 EsbpBnzswKUU1w0k/c/v5cZL8ftJKm4qfEW2xS5ItJOASRVuMJ4202mIs/+8Kc4alie/n/juAV+
 Iu70z0EPzVdIvfsBblWRuSvrTe6ig1IjC79VqgeVXX7vuW0fgqAbtmL9vNoW233s/Du/Gvw/rm3
 yEPQ9uGWToAACzbMFLkh9XUxoLwCV0sB7XgBTlDClFmOU94+A8ERmv745HG2IIfZQaCUk53DZlK
 DyaiyfGcZsWzMOCPbVu0v7fLz+7xtVxm1l6C6ciu/GNQJzzJ7BvrMAWKwFq4ikPqbAvDChtFame
 BMtN0an7z+QHkjqG0TqAIrYTEnjtFvwQLpfuNICyWbCu90RFqiv0xT4S0DFqNXuaA9Us9AyR5+W
 DeUmIezxJaGE3ecn6Iba5DSkHk
X-Google-Smtp-Source: AGHT+IF38Xi50afvx+5RLZzIHXPnvtwaw42G1kifuOepNH1Swg4855sLwKp074kFkHPWtGfppmGSPw==
X-Received: by 2002:a17:90a:c2c3:b0:32e:4924:6902 with SMTP id
 98e67ed59e1d1-33bcf85a829mr17506516a91.3.1761002211054; 
 Mon, 20 Oct 2025 16:16:51 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5ddf1f7asm9023037a91.1.2025.10.20.16.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:16:50 -0700 (PDT)
Message-ID: <338c9465-e2c7-457a-b2f1-25f3dd6ee283@linaro.org>
Date: Mon, 20 Oct 2025 16:16:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/30] hw/arm/virt: Replace TARGET_AARCH64 ->
 target_aarch64()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020221508.67413-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

On 2025-10-20 15:14, Philippe Mathieu-Daudé wrote:
> Replace the target-specific TARGET_AARCH64 definition
> by a call to the generic target_aarch64() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/virt.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d3809754460..dda8edb2745 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -32,6 +32,7 @@
>   #include "qemu/datadir.h"
>   #include "qemu/units.h"
>   #include "qemu/option.h"
> +#include "qemu/target-info.h"
>   #include "monitor/qdev.h"
>   #include "hw/sysbus.h"
>   #include "hw/arm/boot.h"
> @@ -3263,7 +3264,8 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
>       if (tcg_enabled()) {
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
> -#ifdef TARGET_AARCH64
> +    }
> +    if (tcg_enabled() && target_aarch64()) {
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a55")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a72")));
> @@ -3273,15 +3275,14 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
> -#endif /* TARGET_AARCH64 */
>       }
> -#ifdef TARGET_AARCH64
> +    if (target_aarch64()) {
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
>           g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a57")));
>           if (kvm_enabled() || hvf_enabled()) {
>               g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("host")));
>           }
> -#endif /* TARGET_AARCH64 */
> +    }
>       g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max")));
>   
>       return vct;

❤️
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


