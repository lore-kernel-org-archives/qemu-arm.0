Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0132CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ9Hn-0002PP-OW; Wed, 12 Nov 2025 06:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ9Gr-0001zC-Vp
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:44:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ9Go-0006Pa-Me
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:44:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4710022571cso6315015e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762947852; x=1763552652; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mkqehCx9KgP9OGG9kKTzY7TnQIwijMHUv6d8vGDQBmk=;
 b=GMvs0wvZ0lYHGw/+bzhuKSJFQmx3dCPZOFMltiPDWkDXCstfiwfFxigTQ7pgflgz1+
 hFRM7E5mFkgliQ6hWY6QD96l2BiiR6sRl9Wzwmlm9jdtU3+6oKawVzNZ0+3QJyi+ATyy
 LwMVqKw2bo/Ou7KyfQFW1EDGGogh8OCoMjAEKREsSiMZVKzz/9ZbD/kcoLjFLYb1PE76
 zckqJywY+d1yfvguxd2ILTEaf3IHUpfknXyqjutJnFtgsTJh8miT2qKzWcguvdUN9pkm
 nx1JWpVJMlGHahCJDPTJbMx5Xreq50bPrGs0rLHpaJ1IT9xJ41mNlazS4FeIF5/CTj7d
 cuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947852; x=1763552652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mkqehCx9KgP9OGG9kKTzY7TnQIwijMHUv6d8vGDQBmk=;
 b=rAWhmQimYqdEzrkrbi/dmjoZ+BjyyHwtFrErVWwFMmdzJiCUvIFPiYiv8qQ2dh/0pA
 AoaquCg64PaYuTkN9b2nEKGLYWUYYceRdn9SopwkbJ1iigL59HBGyqTWJB0ro0c2nUYT
 glTCkM7V3KIaQc3Xr+AHZNbIozCtjdub/Is9yk4GxXlaigNTXudVJEndhZsXjYHPF302
 WTObAPHt/1VjzC1wnVdPYG3HE3mu90luca2pOxrW/Yjne52rkRNZ3qM+PFSFmTl32H4c
 tvpfMMphRQBABCIML0qW4PkRyarYD/2yXCV5g/O++B9BYwibpW5TgEyNVFBleVPkNloN
 Bu+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkT4xd7p/brPDLSy7XOFyM449ET6tpO0CzMBue9FVZbYsYbTA11wrnHvH6QDL/sYpw/QJvfbHXtw==@nongnu.org
X-Gm-Message-State: AOJu0YwSNAvLUcgJdyP2Ktz234R6/TNu88BVbqzIEtaWkDZT6/vB81kc
 XkmJ0b/AQo7soOyAEst/kRGRZ9SSyM/yn4ohCPU3ZCj9kGlZOocllJm66QpzIZwL7iM=
X-Gm-Gg: ASbGnctn6yLvMImV9yL2nqxUCR6zFIRTGALookvWXkvv4b4okR9cnZ/zw+dEhf8fxw4
 OJR6l2dZUV0RgHTlSWzAUvBswtoUBjPK9eXO/yVjpshpHwtNup0CvpwOIO8G51djdzdAK8OOZuv
 Hkke28Tt+Z0YdxrACY+e+vejXDTZ+0KWdVxFOePvlMPt2UZfXLu3u7qOwHQzJudEfeSE+kr6Gyt
 PnQhRdkGe44CVFIag8Bj7gqQxQnFtpt/Vf8YidviMENX/VEOwC70pkMJ8TXpnBR9YELYPYf2mpu
 Wm3z0sUPJxVu7eveiGRRnOFIwq/8NplbWWE7wewbTFvzdaNwB4z107D4hRPdhsberqN2EdM5EtC
 Qmop5He4K7wOK/yCrwYnBWxPW7rMue8rYe1ia1aBeLy5IFB/52mXBM5VBHYifBoRDAQs46mQZ31
 RVHtgSuBqcIFH/wTyI3iF4Wr+QPWe2CEbQdEPh3mNpuNfw1gHiv5yFwRfjjxE=
X-Google-Smtp-Source: AGHT+IF3wH8GByi82OeaO026oyfWz3r6pdl6MJgn8nE63GBqpUgdfDA0MR3M97Io2/Op/i2b2E1iLQ==
X-Received: by 2002:a05:600c:3145:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-477870718cdmr27043695e9.2.1762947852564; 
 Wed, 12 Nov 2025 03:44:12 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e52046sm29769185e9.9.2025.11.12.03.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:44:12 -0800 (PST)
Message-ID: <dae06a78-2afd-43d0-ae88-2d2401d97cdd@linaro.org>
Date: Wed, 12 Nov 2025 12:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] tests/functional: Add a Beckhoff CX7200 test
Content-Language: en-US
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-15-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-15-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> TODO
> ---
>   tests/functional/test_arm_beckhoff_cx7200.py | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 tests/functional/test_arm_beckhoff_cx7200.py
> 
> diff --git a/tests/functional/test_arm_beckhoff_cx7200.py b/tests/functional/test_arm_beckhoff_cx7200.py
> new file mode 100644
> index 0000000000..a7fb88ac30
> --- /dev/null
> +++ b/tests/functional/test_arm_beckhoff_cx7200.py
> @@ -0,0 +1,19 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a bare metal application on the Beckhoff CX7200
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import LinuxKernelTest
> +
> +class CX7200Test(LinuxKernelTest):
> +    def test_baremetal_elf(self):
> +        self.set_machine('beckhoff-cx7200')
> +        elf_path = '/home/yannickv/git/build-TCRTOS/FreeRTOS/Zynq7000/DriveZynq_Fsbl/build/CX7200/Optg/ZYNQ7000S/CX7200_Zynq_Fsbl.elf'

Could you upload this file in some git forge repository like github?

> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', elf_path, '-nographic')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot mode is SD')
> +
> +if __name__ == '__main__':
> +    LinuxKernelTest.main()
> \ No newline at end of file

