Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp125288ejb;
        Wed, 31 May 2023 10:35:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63yZO5H4O3yEPLV9c7jHr4fGtvJXO7HmozyE/Q9dUcquCaXCuP3yoVCjgxvF0SwrAQ9ihl
X-Received: by 2002:a05:620a:f0c:b0:75b:23a0:de88 with SMTP id v12-20020a05620a0f0c00b0075b23a0de88mr7338453qkl.6.1685554506880;
        Wed, 31 May 2023 10:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685554506; cv=none;
        d=google.com; s=arc-20160816;
        b=Lli6Ykaebnd5f0vq0J9ZMaVJ4Y+scsz0F1NaAOyfCmgwcB9xBD86a+jNqqIBY0lukt
         D2S5GJADVnmrMGM/+CsrddW9CHHs5oQeaj+U9Akwq2oHkoappzH3UOSlzMYLCj+yTUuW
         lrwhQROCWi9yxY/CSs3LF2bBpFUvOd1TK6Mz9aw7dnt7xtuY2djIX9vv/orybknwyd17
         6U6TSG0Mb8wB2WIL+Ix+7gdQQIHWJsiCt9+fYbtAayYk+9wJfggldky7DK+8/fR96Byd
         zttI5qcnx4in6xPdKrRbexdrdPhIod/MGb7tuxluZMvnOkWxr64p43k4kRtYzn73xx0y
         zJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YWF1WEFVEDNFVwf4rvHb/PtCZTNHIffH0745yjINvOI=;
        b=QIbQWqhR/thjvFAlH2474vWmWUEqwsBDhemxXKrZZBCm1IuwAG0D16arLaw48pJfmw
         ecauDlKQMAP1gQ175qF4C2lumbr+a2eXac1ffwV/Z2+OdzogqDz5ljJypXzvxxnX6fHv
         ccVYh8P2eF2VN2RI8VXP6OGxJFBv/lcOnusmDYEJAOCPRjX1l/TH+a8yskW9Pdd8xmtT
         ET5/iGYx3ao2cOv4OCdpx1ZtpoS0hvdVbEFA9uENZq30AEzoDMqJwdisGGTXNImDmffT
         gZsHhupooaOgG8PPCyp9RLjEhfDNHEUDS0dfIusj9e+h+qN+BAWlnim5sVWQt7d6Vb1U
         xxVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5lmt6V2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020ae9f30d000000b0075ceee52ea2si4031083qkg.252.2023.05.31.10.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 10:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5lmt6V2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4PiO-0004bf-8z; Wed, 31 May 2023 13:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4PiN-0004ae-4O
 for qemu-arm@nongnu.org; Wed, 31 May 2023 13:34:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4PiK-0002AD-Gs
 for qemu-arm@nongnu.org; Wed, 31 May 2023 13:34:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f68fc6b479so62447395e9.2
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685554455; x=1688146455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YWF1WEFVEDNFVwf4rvHb/PtCZTNHIffH0745yjINvOI=;
 b=K5lmt6V2fGTilCiuNMfUZI4fLcEjGi1fy/LvB7i1uwgrNyfSDsZ5u4tqArPqAPJSWW
 M9GFpCLMrunGnWhcHdDuIhZHGrX+oNohpIe2fLfIelYszMCCqm4qAFUMk0j5qtbm4OIm
 FOhrY4CMZonE3pK78LZkCkJQwbMTt5L/GDKJH08FluG6hjN5177eW+qT8ZTcgH3n8izx
 GCHh4D9z64fQCTbDEF73p/kXJYR+YESA0iZlHu4d/9+gfyoKB+RzOxAraXLoLySNOGY0
 ht9JjkqQerxA7iqYZ6wzFJGGItIqdos03htvEIq/sJBv5ESUUvF6reazRBjeeJesBriG
 2LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685554455; x=1688146455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YWF1WEFVEDNFVwf4rvHb/PtCZTNHIffH0745yjINvOI=;
 b=QOsM76Lm2d+iDSIz9DJ/Im+Vt0+4d/xeLKhubi63s4cjvarnJu1FctOPiEKKqlA2Ue
 8SUzoYacFJ3Rg0bvljKzjHfjl35bbwyarY1Zspv0LtDpk0iy4ZBdxtJIMAyzyfidiuEs
 bTQCL3uQaKw3wCD59VaWcAVCFLYg3DB8WL8JCQ1w4raeQ/fmM978ou4FsGIcozaZxzSA
 zJ/klfojANN1Nm3wQB2KwUN1qm4WW3L/Zj+fZg7WpWHxsxuXQiicUVNd6JsL/N3hCoY4
 IHgfLM0ZgRVfQQQQkjD+10CsspJMTHAwGkRj3rbOccGhSSbZ0VmXaHwB9BqU0rnA6n10
 vt2A==
X-Gm-Message-State: AC+VfDzEA+5wONej2emW1JwOLCkUj2S5LTki8tdxBM40CQMsZRsvpwO0
 Gq2Z4ze//hCmFeSlLgefOUnY4Q==
X-Received: by 2002:adf:d84e:0:b0:2f8:2d4:74ef with SMTP id
 k14-20020adfd84e000000b002f802d474efmr4600532wrl.43.1685554455308; 
 Wed, 31 May 2023 10:34:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 n13-20020adfe78d000000b003078681a1e8sm7473927wrm.54.2023.05.31.10.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 10:34:14 -0700 (PDT)
Message-ID: <5b407848-2a4c-6447-6726-cf85f278f3e7@linaro.org>
Date: Wed, 31 May 2023 19:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] Use named constants in BCM props
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20230531155258.8361-1-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230531155258.8361-1-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: jV+okG3fEg3f

Hi Sergey,

On 31/5/23 17:52, Sergey Kambalin wrote:
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   hw/misc/bcm2835_property.c            | 120 ++++++++++---------
>   include/hw/arm/raspi_platform.h       |   6 +
>   include/hw/misc/raspberrypi-fw-defs.h | 163 ++++++++++++++++++++++++++
>   3 files changed, 236 insertions(+), 53 deletions(-)
>   create mode 100644 include/hw/misc/raspberrypi-fw-defs.h


> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> index 4a56dd4b89..92a317950a 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -170,4 +170,10 @@
>   #define INTERRUPT_ILLEGAL_TYPE0        6
>   #define INTERRUPT_ILLEGAL_TYPE1        7
>   
> +/* Clock rates */
> +#define RPI_FIRMWARE_EMMC_CLK_RATE    50000000
> +#define RPI_FIRMWARE_UART_CLK_RATE    3000000
> +#define RPI_FIRMWARE_CORE_CLK_RATE    350000000
> +#define RPI_FIRMWARE_DEFAULT_CLK_RATE 700000000

Are these VideoCore constants?

>   #endif
> diff --git a/include/hw/misc/raspberrypi-fw-defs.h b/include/hw/misc/raspberrypi-fw-defs.h
> new file mode 100644
> index 0000000000..4551fe7450
> --- /dev/null
> +++ b/include/hw/misc/raspberrypi-fw-defs.h
> @@ -0,0 +1,163 @@
> +/*
> + * Raspberry Pi firmware definitions
> + *
> + * Copyright (C) 2022  Auriga LLC, based on Linux kernel
> + *   `include/soc/bcm2835/raspberrypi-firmware.h` (Copyright © 2015 Broadcom)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_
> +#define INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_
> +
> +#include "qemu/osdep.h"

See https://qemu-project.gitlab.io/qemu/devel/style.html#include-directives:

   Do not include “qemu/osdep.h” from header files since the .c
   file will have already included it.

Otherwise your patch looks good!

I hope you are using the 'git cherry-pick -p' command to split
your previous big patch in multiple smaller, and not rewritting
the patches from scratch.
