Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B74F55456
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 04:41:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv6iV-0006Ky-IB; Tue, 24 Feb 2026 23:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vv6iT-0006JG-1j
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 23:41:41 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vv6iR-00085N-K5
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 23:41:40 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-679e5688b25so666039eaf.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 20:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771994498; x=1772599298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/Nom+KVULqQvD4Ii/ACL9Vg2BTAkzCkrmfpSSlipP8=;
 b=mNSkc+S+zMxBJX1yUoUeZYPwM3nFgp7VlGOtXGFOl9orVbryP1W3SgjCKLQkyCOhyv
 0Ygmz2h0ndvrNZW4qGqBdf/cahVwwEKf55vfX1BbAyDmj9OjOm+V8a16Uwfx0uVq6Cm3
 qPPNM35luQ4NX3jmL1+5BBIHAH8NJeiSJtiYpa4KbNfKICJT0RmEZG8yjufhtz4RTqjk
 brOnz5+f6ngwiWhZlffurbmqlnTxQTSeI4/PKKrLhRtu2YodVfbJZZaqyXYQ6zTGuj7C
 ps404C5r2N2fAQELXMNU16J8u46Y65Xb/EXIlVtAhecwZdKg6tTg81JblbgaGlmkSfSZ
 dZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771994498; x=1772599298;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/Nom+KVULqQvD4Ii/ACL9Vg2BTAkzCkrmfpSSlipP8=;
 b=uu/cx2hh3EGF4A29zsrKQIv7ueKfOeGcl1CC4P6vAjfeXJ92Jcod8/WCjFXD8/v52A
 +rn5aDeFnXLeOlFLpa0Fi6ux0+QSMDAxidTvXi3GQqd455RpeTLXvqkswIeFMymd6A1k
 MpgnP5CsBq9biu52B3sVhHQUSgox5wRJ2yDHRsHml79slBjYQ2r917U96C2gkiC0W9HW
 uuppWkft/M6Z4d8yZlYXPmDlrXiUiGYByWafVQ2QYdKiDOLRWgVtlp+c9DBCrPq3rKIo
 GS1cooXhLybWffPEbLXUp7539qA5p/3PyFM2DiNGMcoEwpUlh0c/kNkJ9EmmCcpKM8sb
 5Pjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBSRkM2jODrgbsf5J39RXtK4E8Zn4DEOZ7a7zeh2un72n+1Sl18pjLKMhbTDbMfzHVBzTy2U4ezA==@nongnu.org
X-Gm-Message-State: AOJu0YxO/5IFUbYIJJXFNcbghOurFGi9wWEyURhc49xyWk/G7xGiVCn3
 /xK3VodAw1Q8EwMgaD04eO0LeWApmeWIjYicB9LaztclzJ/P1+JAo3wlQzVEQnIgX6PvqWiMatT
 ZAshyly8=
X-Gm-Gg: ATEYQzzE+QKhWNPxgAdyddB5/OXAtoNTjxRuTIfe/CN3oUxM+VcDMVUfzLFQrla3O5F
 2ko/aezLSalzqYp2lLj6SWL5V1hgHuDZWbn/DvhCgzBuiPaKq9hAe33J21Hu0QsXW+iHSwMt2fm
 d2PMUbCPjf3R4S3wt0kcxRjUL8FWTbMiu6xQii3izmpInR0fcGWF4+LLAoBCVrLy9vJH31wt5rj
 jUXT69yQJnjA1aGnBXmbHqWew4vLGMVuougGrcrJZSaNpg3+h4feBHjth9sOOPCUwpjSFkQIH/Q
 GHlFojxWiyjMLxltMJUnfShe3TFZtblkQoDcZBZrNu0Em48Natfq4UVlbZer3RZqSLZ95wA/K6u
 xolUyOqY7KbmQkM6yyEhgpvex/uv41UGLrz5Jvrel8/k92fIqfbNG8pOaBkFHwm+FmDRbgu/ee9
 SY9cLl8cNEselGrZkvXspnTpJdFx+iU3Bfc7CvlYYxSFh8BQN/V9FbhiRvNCTjtNUX5ANxgfzOq
 /halPzIrH7phcWEkUWLkWSXiZp3Vg==
X-Received: by 2002:a05:6820:134e:b0:672:b25f:dfd6 with SMTP id
 006d021491bc7-679c4646732mr7645371eaf.2.1771994497660; 
 Tue, 24 Feb 2026 20:41:37 -0800 (PST)
Received: from [10.34.149.227] ([172.59.192.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-679c5630a56sm10429471eaf.1.2026.02.24.20.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 20:41:37 -0800 (PST)
Message-ID: <0578ac95-15cc-442c-bb1c-d1a23dc488d1@linaro.org>
Date: Wed, 25 Feb 2026 15:41:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/cpu: Build a15mpcore.c once as common object
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260225034451.41338-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260225034451.41338-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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

On 2/25/26 14:44, Philippe Mathieu-Daudé wrote:
> a15mpcore.c doesn't need to include the target-specific 'kvm_arm.h'
> header, it only lacks the qemu_get_cpu() declaration which comes
> from 'hw/core/cpu.h'. Include the latter and build as common object.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/cpu/a15mpcore.c | 2 +-
>   hw/cpu/meson.build | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index 28cc4b3a4bd..28cda55ccf8 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -22,10 +22,10 @@
>   #include "qapi/error.h"
>   #include "qemu/module.h"
>   #include "hw/cpu/a15mpcore.h"
> +#include "hw/core/cpu.h"
>   #include "hw/core/irq.h"
>   #include "hw/core/qdev-properties.h"
>   #include "system/kvm.h"
> -#include "kvm_arm.h"
>   #include "target/arm/gtimer.h"
>   
>   static void a15mp_priv_set_irq(void *opaque, int irq, int level)
> diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
> index 9d36bf8ae2c..9c1535ca325 100644
> --- a/hw/cpu/meson.build
> +++ b/hw/cpu/meson.build
> @@ -4,4 +4,4 @@ system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('cluster.c'))
>   system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
>   system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
>   system_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
> -specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
> +system_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

