Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468BF8D76E
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 19:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDSoO-0006AP-W8; Thu, 16 Apr 2026 15:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSoI-00069v-F9
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:55:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSoG-0005et-69
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:55:33 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso2473751f8f.0
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776369330; x=1776974130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m/tjUOO76sJoTge/fDdhDk866bjwglaInC0oLYRmy7E=;
 b=WvqtM82zFeL4pjdqU1dX4s+VY4uKmFKISNOu+cuzZ9gN80B+fV79FtmZXDXUi0FRbZ
 WAIM+hWaIZeiYzR5Kog079+RjHMTlcnGMc1nWA6TmESESKTy5ZRXSQmOBPa1O9XCTvw8
 PRKRziSPM0LfKdHqGRJwvN3QdLTLQBGv4Uj9SonF+MPwElKcv7NXIZOatHBv5AjB4JRf
 XuAiKJQ8OKC9ak+lbJM5hPZrVudp+LvFRmKOwSB+6TDhbCbv6FXKYiIYTrC1EIz6kb6w
 U6LmRmJ9d3d0Sk9W9WN0zWqesTp0uIjLWAgtiD+hGzT3dx5BHwnEg9i2lGz+u0B4jCZD
 QR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776369330; x=1776974130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/tjUOO76sJoTge/fDdhDk866bjwglaInC0oLYRmy7E=;
 b=nHNkAz8bHcGiQVlPbXDGZmMku/7FqiTfk4MbaFz1CqimjJl9fQs43597wB8nsLM3uJ
 UZUgdb6eawTDbi8A45QLUJoYAPhTEq7zpDgXOQ+7NtLlrlNN5f6GLcBHJw2eapNtSDLj
 X4A0nf35CWPhnGt8ocs7vajch7orTIHMVpSl/gOwWhSbDyRMJ0Dp25T4eA+I86hl9sB7
 P4fjGyhkUPW00FHFRx1CsB+bW03+t21pW5QPNzHjtbz35wSNClGcbJaWFZjYYrbjyNkT
 MO5H6vdyPg8V6rCgxCJi0TjXn6lHFT+bZJ+B2S5oMoCAtZJF38M076ZtPekzfWpeKhpI
 zxEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XAY1TXFnyi456vbqp8UMx4HGNUwowqQbRXo5l4kICkypuQSU6V8IyGqg+YlZcbd1VfkbSFtRwrA==@nongnu.org
X-Gm-Message-State: AOJu0YwkHhNF908wA3Qd4N4Ou7HdWgqCDpnXJkGLoAglkHXm5G1u50Ac
 Gh5wQPRIPudRBrEc9k2LFscrRK4fAB/HXh29atdNLBfcMatOaC5RL4WEEY285WgJfL4=
X-Gm-Gg: AeBDietbFQu93eyQR9LU0NOck/7IcyegKn3Qm3I8dMyK0AVjRM1AdoyDHoOGZCRckCW
 yu+UvXgZ+eifH0TAQqcIaUcq5up7etWLS5zh9dJIVdOjjNeKJEFBqXxak0HWTPqFSYx5m9wXzCK
 Oo7Cag2b35sPRX0t+3Vs138BYYi9nUjCL0lX8j/XSMuLSJHnR/LFszH8UoEh+gLO80pzJGwH7BH
 tEt8DaMsHDdztfFsgFPqU+28DM6n7YlQWbhnEkSCRL7W67CuQspALs1tlWwgDIZm86uoYwf7C/j
 r3IRaAlquuMJ2p8Unagpsmo6vmxzBT7ZpagwIA4GlOXSkYlSKa078i1OKdwuQr5+AAXIZcHI3p+
 i8t66/j5HFI7mplyMeDTX4cW/X495t5c/DIkJYNfnSNHIK2v36hfb5j5WgfDGC3FU0pFQb40AYI
 zWkV5HBtueMzQtDLEINLgN/Bp9+uGaWoTvGOzRiyKUpXVwmQI81eA63Gg7SgJOgFShQYlDIefGM
 N4i
X-Received: by 2002:a05:6000:1887:b0:43d:de4:bd25 with SMTP id
 ffacd0b85a97d-43fe16a5e57mr1074505f8f.45.1776369330375; 
 Thu, 16 Apr 2026 12:55:30 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3553d7sm16040724f8f.9.2026.04.16.12.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 12:55:29 -0700 (PDT)
Message-ID: <dbf19914-774d-40cf-a9f7-0d75d73fe9b1@linaro.org>
Date: Thu, 16 Apr 2026 21:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/arm: Allow 'aarch64=off' to be set for TCG
 CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
References: <20260416165353.589569-1-peter.maydell@linaro.org>
 <20260416165353.589569-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416165353.589569-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 16/4/26 18:53, Peter Maydell wrote:
> Allow the 'aarch64=off' property, which is currently KVM-only, to
> be set for TCG CPUs also.
> 
> Note that we don't permit it on the qemu-aarch64 user-mode binary:
> this makes no sense as that executable can only handle AArch64
> syscalls (and it would also assert at startup since it doesn't
> compile in the A32-specific GDB xml files like arm-neon.xml).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Clément Chigot <chigot@adacore.com>
> ---
> v1->v2: slight tweak to the docs wording
> ---
>   docs/system/arm/cpu-features.rst | 10 +++++----
>   target/arm/cpu-features.h        |  5 +++++
>   target/arm/cpu.c                 | 36 ++++++++++++++++++++++++++++----
>   tests/qtest/arm-cpu-features.c   |  8 ++-----
>   4 files changed, 45 insertions(+), 14 deletions(-)


> +            bool aa32_at_highest_el;
> +            if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
> +                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el3, cpu);
> +            } else if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
> +                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el2, cpu);
> +            } else {
> +                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el1, cpu);
> +            }
> +
> +            if (!aa32_at_highest_el) {
> +                error_setg(errp, "'aarch64' feature cannot be disabled for "
> +                           "this TCG CPU because it does not support 32-bit "
> +                           "execution at its highest implemented exception "
> +                           "level");
> +                return;
> +            }

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


