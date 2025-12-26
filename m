Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B01BE8FDB8
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Dec 2025 22:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vZGYk-0003pE-16; Fri, 26 Dec 2025 17:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vZGYf-0003ni-GT
 for qemu-arm@nongnu.org; Fri, 26 Dec 2025 17:45:19 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vZGYd-000571-EW
 for qemu-arm@nongnu.org; Fri, 26 Dec 2025 17:45:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477632b0621so47444585e9.2
 for <qemu-arm@nongnu.org>; Fri, 26 Dec 2025 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766789112; x=1767393912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1ZrpH1Qd4eaaZUqwHF2Qx8uvchxCk6mcwGTUh6GbcU=;
 b=w9s0CMYo+Gys/4IZECATxGcCiifhdMmF7ukn27iu8V84nzCgFzanRnZi4/v21yMJaZ
 05ipaNcNf1s/YVU9N4r/VdyjaosaDwdGrHaZvpshNykhwxqDx8ippGaNcbPSWJlKhO7v
 LS4TK3vMCcCB3G57PcbmfoSqJnOwWz1i92YBqN/cbM+oCSLhXr9cIv43bu1TEFXltdKn
 ZlFTG0kkm5Vr+yF8snxXPEhO4J6M9C/ok4zEhwLDoQJNqA6/gHdoWg9vFJRt14AKReIP
 Hx1GwFKwfzVDO9FgVKVw+eFXdYFO3i/xWJBIWuhcTSjmco9zOlB1askulUKRft7MIoLH
 LFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766789112; x=1767393912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1ZrpH1Qd4eaaZUqwHF2Qx8uvchxCk6mcwGTUh6GbcU=;
 b=SlTc0csZEgs+89inbK41y+h8SF6iYyew4zLtDjsuWpzNg0XnmLB1nEG/nDGbO84CKy
 rY4fxPqCngsIltp7S3hjSbbpJCUmF9krk9NjKvkXFtmmMXgw7nJlQbuxgpPKdlBO5n8/
 CQmjLzxr/dN3Mpo51cRYFXmm/RyVyJerGwtNv190hlqqHhNW0S0fAgHub+9oo4xt0fOO
 Qr2I83V7xhI+hoaPf+L2zWHW6eJ9HQxGeeEv1PsmTr33rqmDvqel4/TMjRih103872Yu
 q17pdj1GQSrHTC2xvSIDVnjfX8Tbka7l00FRAONX2UCjMyMEn8/EhauhmXaxDUhD8PIh
 r3nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNS5Taa/JsP/E9MZXFXWa6dVBjap/RRhiIUY2CjYS7Rffe57GQhdH/2Hwhz6z2dcxqP1GLwjmXug==@nongnu.org
X-Gm-Message-State: AOJu0YzcUuDuH5hTFTYuxmE+b6PWmESREB1LlR+nzUTgrQk5dpi33R5J
 VjFDWZlm6imcFeNIMetNQUGUDgTU2kLv0K/mpxL2LlExfeWNRWYkZmCCRxfufILHxFM=
X-Gm-Gg: AY/fxX7HNk23fg5G13RTHTfOr1IgjRMdJ9TyCisGw86694DilIypm5khz7zQhJzpukw
 BDlu/3uZMF/ZRfneRy9y0N7+XC9CTskVnK85OvXxCowah5LQUvxplJiHnHf/FHreAvSN74XoBvS
 zro6hNt2WjbOJikr+ARt+Jd6jahR2Qnh9hrFzXgn5ll7MNWNLA3AsuGyiqQWQLEz411Ietzxm/T
 dCGptvVkuPokCbek/iahwe6qZXBTH/EXGz7pQNEPYs6ttIlLftg62O/BM3U5v4cbO+BaRilWA7Y
 KvlNBTIzaCI2vG2Qd5ZvgvJkhSQkyxCFI7C0YLMoAq05wOwtF/t44ghoriozG/0NDR6qIs6sd3f
 mV/h1vohPEM7GgpY3k8aPqwKJ0uCLyOJqXk4WazM45vKYzkXCwWlAwvvF8oP/XSzPRnqgtBsX36
 xedTLU2eJzLt+QrmkdqtZo05e9CLQ2E2r3xDus/3afJ//qgoKZ/XKjyFzjIxspELj0sWi6GG7z
X-Google-Smtp-Source: AGHT+IGdYt2ecIcHs8+aoYjOXznpt9W5u3YM1q3S96kC+Pj+r6zfKZ4hyNYcAHLoH52Z2e5hWfq6yg==
X-Received: by 2002:a05:600c:4e42:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-47d1956eb65mr212684195e9.2.1766789112605; 
 Fri, 26 Dec 2025 14:45:12 -0800 (PST)
Received: from [192.168.1.15] (alyon-655-1-564-32.w80-9.abo.wanadoo.fr.
 [80.9.105.32]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be279c637sm444421425e9.11.2025.12.26.14.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Dec 2025 14:45:12 -0800 (PST)
Message-ID: <1c56c2d4-d472-4ec7-b3f2-22c7b4e935fb@linaro.org>
Date: Fri, 26 Dec 2025 23:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 1/7] hw/arm/smmuv3: Extract common definitions to
 smmuv3-common.h
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-2-tangtao1634@phytium.com.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251224034647.2596434-2-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 24/12/25 04:46, Tao Tang wrote:
> Move register definitions, command enums, and Stream Table Entry (STE) /
> Context Descriptor (CD) structure definitions from the internal header
> hw/arm/smmuv3-internal.h to a new common header
> include/hw/arm/smmuv3-common.h.
> 
> This allows other components, such as generic SMMUv3 tests or test devices,
> to utilize these definitions without including the specific SMMUv3 device
> internal state.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/smmuv3-internal.h       | 255 +------------------------------
>   include/hw/arm/smmuv3-common.h | 268 +++++++++++++++++++++++++++++++++
>   2 files changed, 269 insertions(+), 254 deletions(-)
>   create mode 100644 include/hw/arm/smmuv3-common.h


> --- /dev/null
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -0,0 +1,268 @@
> +/*
> + * ARM SMMUv3 support - Common API
> + *
> + * Copyright (C) 2014-2016 Broadcom Corporation
> + * Copyright (c) 2017 Red Hat, Inc.
> + * Written by Prem Mallappa, Eric Auger
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_ARM_SMMUV3_COMMON_H
> +#define HW_ARM_SMMUV3_COMMON_H
> +
> +/* Configuration Data */
> +
> +/* STE Level 1 Descriptor */
> +typedef struct STEDesc {
> +    uint32_t word[2];
> +} STEDesc;
> +
> +/* CD Level 1 Descriptor */
> +typedef struct CDDesc {
> +    uint32_t word[2];
> +} CDDesc;
> +
> +/* Stream Table Entry(STE) */
> +typedef struct STE {
> +    uint32_t word[16];
> +} STE;
> +
> +/* Context Descriptor(CD) */
> +typedef struct CD {
> +    uint32_t word[16];
> +} CD;
Pre-existing: should these be QEMU_PACKED?

