Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1107447ejc;
        Mon, 15 Apr 2024 02:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhFPSP4wKS4eqevA708zOI8PKKck+te/VPmMOXETFwfVsS3Fs+QKBdz1Lg2Z2TfA6PFcV7R+DHUITxUq86iGHsYMr3VqKY
X-Google-Smtp-Source: AGHT+IGQFXcglvZNjo9cI69k/WNH0fVNUWby34zfKAvs9o+glqYEBZiC6P//5437gBgAIb1iauu7
X-Received: by 2002:a05:6830:1d8f:b0:6eb:7d98:1117 with SMTP id y15-20020a0568301d8f00b006eb7d981117mr2858404oti.38.1713173878223;
        Mon, 15 Apr 2024 02:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713173878; cv=none;
        d=google.com; s=arc-20160816;
        b=pxiFpr5k00hjLlSE/hMbeJzKTsMCPSD40XyNthXGevx5FdB3ii39b4sa0JlbesPWJa
         4VtIk972xHUcUo56s9Jk/fpiROQSE2g+Gd3LwkzJhFXLUx63QTuUNSt/x1L1yps7VDQk
         QKqbs1TSDA4v3xLgS1LFXP/5qtaDXHw+aRZZc4YnXFkmt6NBREHmyASUbqTN5yxQNIeD
         ZBvi8gWw6Djr4PI0tVU+nqIpP0JJ03Ze2CFL8l9VBcrNNt2sayh5KaSGsebWT0f4oW3A
         1P+gDj8lhvfVwC8bfyKd5+FVvyWQqHa5mVsjwbWrYdpTKl8/FeHl/sEAr45l8zUTD3gT
         xWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xDZ/ro/K3R8/ot/wwkwB1RK3g02Qt8gfYMy6+gZwKq4=;
        fh=fq88hOe7mOAMkXyJCc0kxwjcRHMw9t4RMRLBIcpx1XA=;
        b=EwoJn45VNlaxMw1UsuOSo8nFutANLzqLMmvxfRJG380JSadCAavQKP2ihlyE8Op1a6
         XOmoBQ4o9b0tchqHHo/U04/hkz6nM+PbwBQJNSO7vyGvbY3jMaVCBq76NVT+RsMSnrNQ
         bPqYVSjVxdre6zgi4CNS6zPO3XJeBM52YA856F3V1E9cKaOCVpXJPHp+qz5SzRiEt+vk
         l2rbS4ZCxxnNzYVfJj5dv3uHeFQJeeuJTJ/tY58AiW4LFC2bGNEDHPCQybo7NsSzYDuU
         YIlKhbXGENjNQ79PZS7e6PqoVeJoKeDKOuk+q4bs6vQfR3KpVwKOBdi152n45WgA9vtU
         su5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiCQeiBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a05620a211600b0078d7760e1efsi9643944qkl.52.2024.04.15.02.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 02:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiCQeiBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwImH-0002ww-8X; Mon, 15 Apr 2024 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwImB-0002wS-1e
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:37:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIm5-0004mz-VZ
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:37:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-346b09d474dso2888138f8f.2
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713173836; x=1713778636; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDZ/ro/K3R8/ot/wwkwB1RK3g02Qt8gfYMy6+gZwKq4=;
 b=NiCQeiBbCFL12THN7zLVM3IxhYj6pbbxtIoVNhRR5FcSma8ThK53UfGO8WLx9NdA9a
 /Lf6G0M9DYLYOMrbKAoALSrKYrOU7eVV2TAVz91w9zt5fOcKU4w7zNKkVWlDsQn7i7mj
 bQhmKHVnHfReV1lyyjQ3km7GPo2m9fS+W+cc6ZgraCJX41rHQMeZ83Ke5yJhlVhEjPUL
 Q99M67ygKQ+3VC5F8pjEqm7aVGieZXD5jt1PMP2lE9cLml1RxADCNLZFGOLlgd8S9ce1
 moQcUWjad9DLwOanQm94kG1eUzyrZW8nj3qi05imlTuBEHEzPJJwTPqU0py5b3mFD5C1
 c5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713173836; x=1713778636;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDZ/ro/K3R8/ot/wwkwB1RK3g02Qt8gfYMy6+gZwKq4=;
 b=UFOH88FQ8t8/1SQP0VcHQYgtRLGW9cK7abG4QLdnJoEEeWOP7z7n9dHtwdkL5OFIkh
 J1aRBs+HjRdii4E2iwFgCqQPrYFN/MIdKMAJ0IaNiWOlT9QAqnNVDNuCGdnAF0AFjUzq
 ZANoWRP9o5WpGIqa87CU9fxVfZo6K0mqxGJ167jgOCAhS6wJfIrWNQjtOjLQ3MpCBDYV
 Gu+18vi6fwlnYGK9ax0noOHL2HrM7P5r0xVaxAwy1osEPWX1oQAvqNmX+v8xHnA0ZECq
 PCZXZFKfw2RAFe4RoOyVcKoII8AWfIdkrHlJBWxws3f49xgF+FP4+F34hTXNCVkGx97H
 TdiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRxKOFC/CTwoZJexoQUk+Lc5uU9DUTJSquz7okEZHYc+qIu++yZyGobA1NZKhunVX+jSQTzgIOFqsAu9/C6PdPc6Y1
X-Gm-Message-State: AOJu0Yz48FXys7wK4nzlocMty7ZLHLebcwFGS2RKwSsQr//vEos12+ka
 phI3AH0uknqllZ/pCe1xmk5ACxJ66DQVB/f4s71/qSw2PLdHF+Fp5O9xtilRAVs=
X-Received: by 2002:adf:ed41:0:b0:343:78d9:ebad with SMTP id
 u1-20020adfed41000000b0034378d9ebadmr7314683wro.27.1713173836319; 
 Mon, 15 Apr 2024 02:37:16 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.132.126])
 by smtp.gmail.com with ESMTPSA id
 bl40-20020adfe268000000b00346d886f3d8sm10468352wrb.16.2024.04.15.02.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:37:15 -0700 (PDT)
Message-ID: <fd8b5165-c508-4ca4-bd4b-d423feacda9d@linaro.org>
Date: Mon, 15 Apr 2024 11:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] tests/qtest : Add testcase for DM163
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
 <20240414130604.182059-6-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240414130604.182059-6-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XsJSk5ldtAMX

On 14/4/24 15:05, Inès Varhol wrote:
> `test_dm163_bank()`
> Checks that the pin "sout" of the DM163 led driver outputs the values
> received on pin "sin" with the expected latency (depending on the bank).
> 
> `test_dm163_gpio_connection()`
> Check that changes to relevant STM32L4x5 GPIO pins are propagated to the
> DM163 device.
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/dm163-test.c | 192 +++++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build  |   5 +
>   2 files changed, 197 insertions(+)
>   create mode 100644 tests/qtest/dm163-test.c
> 
> diff --git a/tests/qtest/dm163-test.c b/tests/qtest/dm163-test.c
> new file mode 100644
> index 0000000000..6f88ceef44
> --- /dev/null
> +++ b/tests/qtest/dm163-test.c
> @@ -0,0 +1,192 @@
> +/*
> + * QTest testcase for DM163
> + *
> + * Copyright (C) 2024 Samuel Tardieu <sam@rfc1149.net>
> + * Copyright (C) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (C) 2024 Inès Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +#define SIN 8
> +#define DCK 9
> +#define RST_B 10
> +#define LAT_B 11
> +#define SELBK 12
> +#define EN_B 13

(Preferably enum).

> +static void test_dm163_bank(const void *opaque)
> +{
> +    const long bank = (uintptr_t) opaque;

s/long/unsigned/ is enough.

> +    const int width = bank ? 192 : 144;
> +
> +    QTestState *qts = qtest_initf("-M b-l475e-iot01a");

> +    qtest_irq_intercept_out_named(qts, DEVICE_NAME, "sout");
> +    GPIO_OUT(RST_B, 1);
> +    GPIO_OUT(EN_B, 0);
> +    GPIO_OUT(DCK, 0);
> +    GPIO_OUT(SELBK, bank);
> +    GPIO_OUT(LAT_B, 1);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

