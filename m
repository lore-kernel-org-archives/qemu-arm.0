Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5D3CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 22:34:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulxZc-0004Bj-L6; Tue, 12 Aug 2025 18:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulxZa-0004BO-Oa
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 18:34:26 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulxZT-0007yJ-Nd
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 18:34:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b427094abdeso5520175a12.3
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755038056; x=1755642856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PWC+aCiajLIkUsSi2Sg2yhdD17cXc5LvpLT7GpRd2fc=;
 b=rjtd1D0l9etpsPLOk88zlhzq1XDzmpofOk43vetB/QETvO1KcbwgYsKqL8UKTB3fkD
 KG+lRruaEps56DIUQvQJPNQwKZqYeOdhg58oD5XauH5jCONCf5REMgDB7fUFKs3mYZaX
 EdhuBf5+j20tQlAVkaONYCi+qLqR2499T0W/Yjc3cmnRKtMgSFi57Ph2Z9GwYQj1ORmh
 T9nMy5oEQmUHqXbOQEdYZrtKk02bwiNNgOduEWynsbMq4AXGkYksvYYHMcJRie4GYEAW
 JQEdnB0PPPLBsV4peA9jiTw5ukzB9zds807OaiBnb4R2qdCWsaKCZ2rsSf/wNnl9jit6
 66kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755038056; x=1755642856;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWC+aCiajLIkUsSi2Sg2yhdD17cXc5LvpLT7GpRd2fc=;
 b=TCOO790nvUnJDQNsgG/JZICqAvssmcs22r+3kwETSneNweMpPdlxtLQvvZUc+w0QGw
 vnLw3D79gfUvgpUVYIE00vGQK+masOJTPC9Rn4izt7Zgo425ugGiYR+qGDtt/tInA0gI
 7GIL86KodUy+6cSB4gYYDSZwX8ZmU2XshN1g+8Kxk0q3K8LFsXfTZR2IJ6YfQue7y0wp
 oY+wGGCw2VLtJU0KilZHLk6rOMyS5ghTKUKlzRVReo1k6L95dsynoHeOhhTgDoiwhC7z
 9thRw8j/RbY7ShTHsGxuiACcvOJ+2HLZJfjl+TXCszNwjUmF24QJtmmkznthQ/wtRfzu
 7rkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFTQEef8OKw6SNWdjQlAAYbuvfBXt+43PWCUHZqKjEM10rWqVKbq4VD6OCSMSX3knjR3PfbY5lTw==@nongnu.org
X-Gm-Message-State: AOJu0YzS7+spd6DpaWOSa0j9jc/kaIT43PwbaPkILvgThGgkwMo0NPX5
 R7QdrU8FAThNvLobMJDfp0wHlgq0l7qgjBfTyyAXJyqUEz2x8QTZm1oJuXUWBbFXiK0=
X-Gm-Gg: ASbGnctJKn6FrVk2rcBj94jlrC9CtIrlUEAs0rjWNDo1OXjn5ueLqaT5mBQUzesN1aM
 2pI4Xemm0IgCxKD1wSqgUxhUIRdNYcQP1O8BdmYt7XkGMHDO/+94s6kN2Net+WzpiZY/k4D40he
 PRq5sTTgLZ1D5zlSU7qoZtN6VfFnVVP7aFNIkMDPwroagcsxtWyQbAhA3uQD5AGyhKJIqiyyOiU
 Zb1GZupkHX4DryfvaYC9WqytaMqa4l+b9sM+Pij06iDFTwjnMGguR++SNSdXGuSSw2S3y473KHt
 /sLaVwQFtC7Ze9+TU/LvYZA37EEahr2J/B2laIiRQTOadhApfQaXTIFbUe71W6t6WHTmjvaQz3s
 16hHM/BwyPe8kL3wFGwXiF81cAQwGvoRf/Qejaq+v
X-Google-Smtp-Source: AGHT+IEaAZYsQzG3av03Qd8vvWCVm5F/8hOBLKzlErUcTWShAJkEjzJh4eN1hJKsn5EtEnyyqcrraw==
X-Received: by 2002:a17:903:234d:b0:240:14f9:cf13 with SMTP id
 d9443c01a7336-2430d23d29dmr11754095ad.51.1755038056083; 
 Tue, 12 Aug 2025 15:34:16 -0700 (PDT)
Received: from [192.168.4.112] ([168.140.255.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899a8cdsm308788855ad.121.2025.08.12.15.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 15:34:15 -0700 (PDT)
Message-ID: <2f3cd701-6051-46e0-b7e2-e807b29afa28@linaro.org>
Date: Wed, 13 Aug 2025 08:34:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/10] target/arm/hvf: Allow EL2/EL3 emulation on
 Silicon M1 / M2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250812172823.86329-1-philmd@linaro.org>
 <20250812173234.86970-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250812173234.86970-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 8/13/25 03:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Another API PoC.
> ---
>   target/arm/hvf/hvf.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

I imagine this waits until accel/split is present?  If so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 84c0c0275d6..df63584f456 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -17,6 +17,7 @@
>   #include "system/hvf.h"
>   #include "system/hvf_int.h"
>   #include "system/hw_accel.h"
> +#include "system/tcg.h"
>   #include "hvf_arm.h"
>   #include "cpregs.h"
>   #include "cpu-sysregs.h"
> @@ -585,11 +586,14 @@ bool host_cpu_feature_supported(enum arm_features feature)
>       case ARM_FEATURE_GENERIC_TIMER:
>           return true;
>       case ARM_FEATURE_EL2:
> +        if (tcg_enabled()) {
> +            return true;
> +        }
>           ret = hv_vm_config_get_el2_supported(&supported);
>           assert_hvf_ok(ret);
>           return supported;
>       case ARM_FEATURE_EL3:
> -        return false;
> +        return tcg_enabled();
>       default:
>           g_assert_not_reached();
>       }


