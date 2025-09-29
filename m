Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BFCCAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:38:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3BGF-0008TN-Ag; Mon, 29 Sep 2025 06:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BGD-0008Su-P8
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:37:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BFx-0003Wq-2L
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:37:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so4098343f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759142234; x=1759747034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHmGHuJT1zpBQ/Sas9LNG7FOWNeDyKz6iO/DCJsJlNU=;
 b=WJyRcbit9Jxw6azsqnm5uE4+bh4G3z4LtH3r9jvjU/xHqaE59tyT7OWIpbVNCkDLid
 vV/W5DS2OpQ3VfPfuSN2TXXdXOje9CgLVM22Q9IJZm+/JiMGZ3dCLcQvgfTS0cVSkun4
 XBqe7Y5YZgS88oGQOdvIOTEmdxZ5YC+RXi9pJv5tX1t0JsdNn4GZsBrhZXae+XINRsUW
 OVkWpKyRFzitVGOWHnZKaY9vnh6G7+jLKUcOZGJENcPNasN2kE3BhQO67Y8JVrpTfWK5
 tZh65/LWzg686ss970H32I8ohlPCJWJVn3NGW1PXJGyq+ynS4FrGgUzGu96iJpt4BnqX
 4UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759142234; x=1759747034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHmGHuJT1zpBQ/Sas9LNG7FOWNeDyKz6iO/DCJsJlNU=;
 b=LoqT87bMhSCjzgC+hXAfmAAyir5J65KCftQff9y2P3iepS1byYdEn319SG5+RH8pWq
 WKvzDgcFGEYphG0BcrmSzRSy8sPwjeYx+cSws7Svx5c4FpoewRtctg4b882amGb+hcQQ
 9fr3dXNH1ByXG+QTAwqHij+2GmW3jUOVNMZFKyk8i12Y8UxVlik/W6YxXeLzW3Owv5eG
 cA20AMxqfCbwnz9z0b6YYwRwdKoyc6xZeEOYBqz0p6nurivxbQiAeWuSzy3Hk8An2oO7
 paMaJm3poPk8PpBdxlLGVfPTAsdFrlosV1nCBxjPVlvQVl2uKu1vAMhzbc6g0UvW1G3g
 tcAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaCRNtzm91vECBWZW6WLUn5DsBMr5zjCfy6CnG2Dbc4CeVduql97vkcGN0gutZ776tfjLq+buQjA==@nongnu.org
X-Gm-Message-State: AOJu0Yzq7pysMkWUXZj4CDyRG0d+Ok01SVC+AxGE2cOo/ayDjdjIx5O9
 4O3g5qnInBAKlad6+FLR8IzvF9MSzMwTz8S/N9eykYI3EKoH3DFoz2lhHl8GoOB5ESZBhq28B9z
 0V9GylyQzlA==
X-Gm-Gg: ASbGncuS1gZscMf4LM5dlVyQQ2LfsJtDkii+Q9+GCSbZRilvs4af1gG6GOZW+aoJrxy
 7TRfKoKvAx9msUVHVp0UqmOoT9KmfhjrV1YHjV6uTjECJoW+QqMQmr+ZyaLi4cWG6fE6O6PQbuj
 pTbEA2y4x7/WLYJHGGUzGS9WeD+J+JjJk78aJj4yYpa4eds5WcDaZG3RP1j3jE90HQievanpegu
 QOPFgkF/W7RUM6y2S6/o/kvXqWZklgdkirqL6u1O3EPq9mCbrqi0UJGpTLrWvXl7ypZOvDrJz1/
 4ZMvfCY7CsvF1nBhWsrtzLCIedoSo2HrueGgyL80ZFJcm8wIONpfvWnfoRhxhKVbGG61ommJ+MK
 cJSK0MSpOqHfoG1vAh67SIpyPFiyxeP09atZYAEdnGaH0zvVsZUUG8xgwwmSlTUH9GKQMPHpP6M
 R2
X-Google-Smtp-Source: AGHT+IHGOr8tBv+CYOVl7o84jEjuG1JnC59qGA4jK26SV3wkJAdYg0Vab8EN5g3iYcugpZeyrxZMKw==
X-Received: by 2002:adf:ee44:0:b0:3ec:1b42:1f93 with SMTP id
 ffacd0b85a97d-413591d7997mr8460872f8f.37.1759142233687; 
 Mon, 29 Sep 2025 03:37:13 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f62sm221035915e9.15.2025.09.29.03.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:37:13 -0700 (PDT)
Message-ID: <fb099da4-19b3-48af-bf22-b08b0d42ce4b@linaro.org>
Date: Mon, 29 Sep 2025 12:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 40/47] hw/arm/xlnx-versal: add versal2 SoC
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-41-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-41-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 26/9/25 09:07, Luc Michel wrote:
> Add the Versal Gen 2 (versal2) version of the Versal SoC family.
> This version embeds up to 8 Cortex-A78AE cores (split into 4 clusters)
> and 10 Cortex-R52 cores (split into 5 clusters). The similarities
> between versal and versal2 in term of architecture allow to reuse the
> VersalMap structure to almost fully describe the implemented parts of
> versal2.
> 
> The versal2 eFuse device differs quite a lot from the versal one and is
> left as future work.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   include/hw/arm/xlnx-versal.h |  17 ++-
>   hw/arm/xlnx-versal.c         | 207 ++++++++++++++++++++++++++++++++---
>   2 files changed, 209 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index b6cc71f7209..e1fb1f4cf5b 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -1,7 +1,7 @@
>   /*
> - * Model of the Xilinx Versal
> + * AMD/Xilinx Versal family SoC model.
>    *
>    * Copyright (c) 2018 Xilinx Inc.
>    * Copyright (c) 2025 Advanced Micro Devices, Inc.
>    * Written by Edgar E. Iglesias
>    *
> @@ -20,10 +20,11 @@
>   
>   #define TYPE_XLNX_VERSAL_BASE "xlnx-versal-base"
>   OBJECT_DECLARE_TYPE(Versal, VersalClass, XLNX_VERSAL_BASE)
>   
>   #define TYPE_XLNX_VERSAL "xlnx-versal"
> +#define TYPE_XLNX_VERSAL2 "xlnx-versal2"
>   
>   struct Versal {
>       /*< private >*/
>       SysBusDevice parent_obj;
>   
> @@ -70,6 +71,20 @@ hwaddr versal_get_reserved_mmio_addr(Versal *s);
>   
>   int versal_get_num_cpu(VersalVersion version);
>   int versal_get_num_can(VersalVersion version);
>   int versal_get_num_sdhci(VersalVersion version);
>   
> +static inline const char *versal_get_class(VersalVersion version)
> +{

Not a blocker, but inlining isn't really justified here.

> +    switch (version) {
> +    case VERSAL_VER_VERSAL:
> +        return TYPE_XLNX_VERSAL;
> +
> +    case VERSAL_VER_VERSAL2:
> +        return TYPE_XLNX_VERSAL2;
> +
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

