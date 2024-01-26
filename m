Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp791384ejc;
        Fri, 26 Jan 2024 02:44:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH81o15JI0ThPOG1VkKhl+TCQFziKO5seRap7Blxb0RLq+QPy5mspINmxnZ3tV/3VisuPDc
X-Received: by 2002:a0c:ac0b:0:b0:681:1197:e7b8 with SMTP id l11-20020a0cac0b000000b006811197e7b8mr879585qvb.40.1706265883024;
        Fri, 26 Jan 2024 02:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706265883; cv=none;
        d=google.com; s=arc-20160816;
        b=S5TfZydjEzr3e+XLqhIQM2a0pnHnK1VnVx26vVKbbpZuDunKwvGvLbUZLhr9w3s6Bt
         pwWZdpZhhBTHWaKJwgVd8UJgRkQv3olL5U7qHOUItbLpN9BvfKsXlFnitQRkAQbHWHzz
         hSnSE2Ji/GSjpmctcUrxIULvRXWTiqVUT4djON5IC3GSbF7+APHnYwybtqQBFF9Z0zG9
         LF48Qx/m2DgPzeJmSBPQL5bkJ4GIMgDyWPVpg2BPIMjJhQsSfSF9RZQ/mJB1w3ECmkZK
         ARMYfQewHfoK5Y3L36hnrYup04bKHeeHVouAJw2SZXqgDvSJVGvGZmrgFLYe0weikXQI
         0RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fauZjtje0U1FVRMrKjMx2UjITlVsoiQwgqcFx8wHmk4=;
        fh=A14TZK2WltwKOPCjCQlK1VAMb6dkh0Jf9NprWwmOMcw=;
        b=f0+R/niO69q33AWQufXbGtuOiX/kbqRBSwDezi/EdJkJoFv+4aFy+dDJA/PLZ9Zx9w
         ZhdPDllHUltPVYSPkC34HZtwIjk5UsKmdGUL5GfVr5q90ENBLEDl3i7MbXjIdQXwNWpW
         8gOKW+D1zGJGJtZC/DDvz5a0CbXv10Jk+PtSUn0khjZ2Nk6p6hqLRDrH46fCBPehDb2H
         XkiqxMEW7zTn0nngkVbZBDwYCewJ0iP3bgSUx4T66aPElxY6rdiyar+8AwUjL17cB6ep
         UVRxadBBeLmqgOsgxBLL1ZgC3ae0ImDJsuNC+zxo2DIwe9HeGxYy/V/eN5M8L5CxLldr
         WHXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CuPEWkA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs6-20020a056214226600b00681955dd564si1042026qvb.17.2024.01.26.02.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CuPEWkA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJhH-0000bQ-4E; Fri, 26 Jan 2024 05:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJh9-0000ao-RN
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 05:44:25 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJh2-0002nC-0P
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 05:44:19 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5100fd7f71dso984106e87.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 02:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706265849; x=1706870649; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fauZjtje0U1FVRMrKjMx2UjITlVsoiQwgqcFx8wHmk4=;
 b=CuPEWkA/KHjOx0L8koyqP9az317GZ7FOqGnRNd5oPAHCR3xddIdoqttSvK/ec99PJD
 whspO664m+lKOW9SyAEtXaYmcrl/ISVQY6S2UsgZVceaBHCSBj5t093dhwrrjyiB8a6L
 SNH3z3XOQJqpAbCvbOkSMtCxggTOLJe8lYSBHuxMYElHRAxrymIQ4LJPNbpjJE7q61ho
 N+ibHvxsL8Y4PllCFT9Pk3KDL+NBVFX2+eJtYRxgMiks33T7EFyfwfOc2fF4emf0LfrG
 kXyzJ4BZC6ZGeEN4hG7R917YcOZHTDSqq6XsuDoGw/C7l5dyF8EBZz7zUiV8VoL5Mc8Y
 E6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706265849; x=1706870649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fauZjtje0U1FVRMrKjMx2UjITlVsoiQwgqcFx8wHmk4=;
 b=vvczusi+VQ5sNAxD3PQdj8TVM12aXjb1oo4qutvBZvASrPaVe8clQ4EGScof+R9E6j
 PNZ6jmheJGjEOzZ5ne5Ajgc3M0iRgX++IGYQPy5d6dZUYvqIQjgB3rTR4ehl30NbKuhj
 Tww/nAr/frxr+HnBEg8tT7/V5MCWPQ26x1BfND8ojgiahfb+uCBsYeg5WNs+DGl1qaXt
 X74NA02lZIJoNQugqpg870+01qY+Ncsd3UCzI2NMkIUIYJT3GpWMaUAAP6m4/yfgb2Pt
 ypTCk2gUylCp74fFKxaXVKjwMHt+dMYxTbRDVBUwwm/HqQkxeRfJcDJ14J3BGzHusazy
 XRgQ==
X-Gm-Message-State: AOJu0YxlC+Mgie2nljlEPNyWpL4MO6M1Iiax84qQHb6BuFPLTzdr8IzN
 255f4APuGwo0KlfJyDxcyaYl3oIA6RXfc1fxorL2mtceedAWB0V7LMlrjdUvJfk=
X-Received: by 2002:ac2:4555:0:b0:510:16f3:8087 with SMTP id
 j21-20020ac24555000000b0051016f38087mr583321lfm.32.1706265849153; 
 Fri, 26 Jan 2024 02:44:09 -0800 (PST)
Received: from [192.168.69.100] ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ac25dd4000000b0051023513d8bsm140051lfq.258.2024.01.26.02.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 02:44:08 -0800 (PST)
Message-ID: <17455043-25cf-4978-afdd-147e689a1abd@linaro.org>
Date: Fri, 26 Jan 2024 11:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/arm: Move v7m-related code from cpu32.c into a
 separate file
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
References: <20240126084001.879548-1-thuth@redhat.com>
 <20240126084001.879548-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240126084001.879548-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: y7t5f58ygM2r

Hi Thomas,

On 26/1/24 09:39, Thomas Huth wrote:
> Move the code to a separate file so that we do not have to compile
> it anymore if CONFIG_ARM_V7M is not set.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/arm/tcg/cpu-v7m.c   | 292 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/cpu32.c     | 261 ---------------------------------
>   target/arm/tcg/meson.build |   4 +
>   3 files changed, 296 insertions(+), 261 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-v7m.c
> 
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> new file mode 100644
> index 0000000000..d61873ab6d
> --- /dev/null
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -0,0 +1,292 @@
> +/*
> + * QEMU ARM V7 TCG-only CPUs.

s/V7/v7M/

> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "internals.h"
> +#include "hw/intc/armv7m_nvic.h"
> +
> +/* CPU models. These are not needed for the AArch64 linux-user build. */
> +#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)

Could we do that in meson instead?

> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 6fca38f2cc..8c7f6b43f3 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -52,6 +52,10 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>     'sve_helper.c',
>   ))
>   
> +arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files(

-> arm_system_ss

> +  'cpu-v7m.c'
> +))

