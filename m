Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55579C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 08:34:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhOjN-0000RJ-7G; Thu, 31 Jul 2025 04:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhOjH-0000LR-KX
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 04:33:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhOjD-0000Jd-Fu
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 04:33:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso390735f8f.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753950809; x=1754555609; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KnmvQSXuC60PRJdaIJSREmzTD/ja2xfMhsheb+/py+4=;
 b=Lab6PU3vj00Z8FwY1t3+FafdORVRi3L46AXZU2MsPZVqPtjQpche8/Bk6pnwtYRwvZ
 sMx9+wMY6ZVcYLyp6MukHWm1NLacxG+dWF7tH4JO5T/dk8zy/iH415BFG3v5KhI2nwI7
 cxGQRvVzjPOj277CKgbxc0wpc0zaSboPvXaCjkqRYLO6wNsfuXiAHPcv6OTuyb8ihO/P
 F/2wNIB3Yia9a+am3FV5O1myC/8TrOQ5BoEYt3dALcHzCVEJQ4pIGFW5OJSbM5mSHYFw
 BLl3A+sv6/rTgTqOnFhATT+4dq7iXnpx7mhUlhCb35wnt/0Qe7/YvHv5WLG3h/m63M//
 2k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753950809; x=1754555609;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KnmvQSXuC60PRJdaIJSREmzTD/ja2xfMhsheb+/py+4=;
 b=FjUqbdFsFRhA/MBzlkfNvGuSE15ORapsXss32Hxq70sGkQVl7INDFbW1I6def8n8ga
 PEcCrY9flTe0HDZoHtjNlaVSlxRMSfa/RzC8JuRbNhHZdfN4sNouXwb9a00JLUnOxwBK
 5sY8HAXAwBv+7iRGHEjIZeM2g1ktvW+GEOGhDAyV5/zioa9g8aKSpkjAYLet9cgPTmzk
 fMFevNzvUjM7N+JOhsGk1de19XMbYV1g4tYP6ZZEoOSyIllxdZ7dSKAu2DfL4ZW2waoE
 tvV+FkkpcPuFD2bnQNPTSApdMCfHL2AK7bTnWY9lIZmavOB7CwPTQhBTCjZPF5pnWMar
 BDCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6XWny5Pz8zk3umRqLqgFmX6myirJfJUW3lTtY8hql4K58c7ENcW3zFPfrNBKF9VqU4kElM0aebw==@nongnu.org
X-Gm-Message-State: AOJu0Ywy8iHWKS0KuLFEjt2C1ut9Ac3wdSygjiI18Z3pC7cA88lGRZOX
 6auJzBmW9mAZXOlPJuvSIeVoFAh+qLaG1xVlJpgCJB+IVI2JZMQGlLG33DSUkmQ7MpE=
X-Gm-Gg: ASbGncuteOaln85T7HONCbRzc7yvhwEzkNOqXP+O4+V81Q/5jvsotcZMCBCrgUkBKwH
 fgCJ9ZLMgpHmE4SxyOf/NMPbPJD4MjqsZjfn1X/f+a6vP8CwCyQWzhih0L2N3qDFHBsT1F+ptzc
 6XW+Wv7dvCK5sxDjIilx4z1ZLnxHTAgkBWvVdUboX3c3xGR786NVwiN1T9YRsBktbl9r+J9w3Zy
 Sv6ZEWdi6wEuejFTRdu0ixWHtGJ8ay0ZdoKsEtgw68zif/cqHJspWvGiIpeyMGuJHziFmirCw/V
 CxQGkx5qa3teuqtzjp6Lcc9y/6+p/mskWP2f2XFdBINTME5ELt12XghF/7PvAePkqfQW5Shj9YG
 gOZ3xT8/eF6ct5ZrsmZSIor7K75uC1pxMhpju3fV2gVZe0ZCIdhfMagZh3U9gz91L3w==
X-Google-Smtp-Source: AGHT+IFJM2YC4W5Aw8DhfKJiGfcqSAgxgdoUOJbZSw/ZEHR14mtoiBKk3jioYqESXbWMeCWbrewwqQ==
X-Received: by 2002:a05:6000:430e:b0:3a4:e238:6496 with SMTP id
 ffacd0b85a97d-3b79d4ead74mr911189f8f.18.1753950808745; 
 Thu, 31 Jul 2025 01:33:28 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4588dd375e0sm67449225e9.2.2025.07.31.01.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:33:28 -0700 (PDT)
Message-ID: <24ca71d7-041a-4d21-8ae1-5f6976fa589a@linaro.org>
Date: Thu, 31 Jul 2025 10:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 6/9] hw: intc: arm_gicv3_common: add whpx
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250731052753.93255-1-mohamed@unpredictable.fr>
 <20250731052753.93255-7-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250731052753.93255-7-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 31/7/25 07:27, Mohamed Mediouni wrote:
> Redirect to the platform-specific vGICv3.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/intc/arm_gicv3_common.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index e438d8c042..a83b075517 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -32,6 +32,7 @@
>   #include "gicv3_internal.h"
>   #include "hw/arm/linux-boot-if.h"
>   #include "system/kvm.h"
> +#include "system/whpx.h"
>   
>   
>   static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
> @@ -662,6 +663,8 @@ const char *gicv3_class_name(void)
>   {
>       if (kvm_irqchip_in_kernel()) {
>           return "kvm-arm-gicv3";
> +    } else if (whpx_enabled()) {
> +        return "whpx-arm-gicv3";

While you follow a pre-existing pattern, here I'd prefer to use
TYPE_WHPX_GICV3 (after defining it in hw/intc/arm_gicv3_common.h).

>       } else {
>           if (kvm_enabled()) {
>               error_report("Userspace GICv3 is not supported with KVM");


