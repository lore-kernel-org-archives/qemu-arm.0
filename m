Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4444293njb;
        Wed, 11 Dec 2024 16:03:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0OkMVrzIyN9uNVhGeAJf7RIdguGsUFfJijPQ2/GRF2mBf48qjKDtOoIJDSZgxGnLK+GNtshmvqlnSSA==@linaro.org
X-Google-Smtp-Source: AGHT+IHwSPgQjWfE4klXPwSQIPrgrOTqjsRbbalfgvHHVnOqRliiyrDz7gSePHvjWVyrK4MqLI9a
X-Received: by 2002:a05:6102:26cc:b0:4af:bb06:62d with SMTP id ada2fe7eead31-4b2477cbe5cmr2686576137.11.1733961780723;
        Wed, 11 Dec 2024 16:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961780; cv=none;
        d=google.com; s=arc-20240605;
        b=cE9n8LKa7CVGKRyujt/TySZnwPhjL4p9Q5BA29Yax9OIeKIRiWs3bHyVLnFDsEBIuO
         1hvGkKXOPJ+o2CPpfv3EVM/0PrW4Z4YljHkLilhodT9cWeTfY18+3sG1dkc7C2C2f+O/
         cns81kjM+ykWlYTulKMBXmCOUeshl9powAyif0wuPI2J0K80ygLDx4pQA2gWoHL7j0Ip
         tIyfxM4DJc0hqybSElqyICXiAJVxB1iSwVvpNO1RslZvmS7ZkH4PRlac5f4zaQ+AQSMv
         E947hnKfwdLjuOusG9vTCxW1wyWV6fjjswWeTwgY66Cb7CbvwhZ40hIeAUKUr3jwdxad
         T7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XD6rH8e4DcKBxo5nQAKAM3oIHGLg0tbYPGNozz874ic=;
        fh=8NkqYchWK3241JzTiko26l0isDhDJAb9r+fnL6D7BJE=;
        b=QCEO/sZPJByN4WIK8N6ACvSchB5xRYbQ2cHzQzlSis00JrvlwbUhRvMFBfoOF63I7K
         Fa0nUV2kaRHG12x/vJEOA1ZBRUjVhQKgr2iV9EvhmnPxoiOkGIkn05iZwXvkoOQebSqZ
         VDQps5HCmtM4ACEfugc0A9RIfIXwv32/nPELfw3wtBNj+gPptx16LrzCZBptqRqf8h5W
         DvZ69V3eCGtlSzBZWG/dHAA8aCxGfHXBG+Krz0GiTkr03gR25GbhoFqf/h0ZOguw0n/K
         /+dFo2n9sRf0ryABc88uL1yIKW2a8T7NbedsGhJXH6PiveWCo1/GnySjC/0MrCjsHJ1j
         oxtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIiW1idY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4affd4b785csi1968118137.234.2024.12.11.16.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 16:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIiW1idY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWfM-0004rx-Sz; Wed, 11 Dec 2024 19:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWfI-0004eS-0h
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:50 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWfG-000389-Fq
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:47 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-71de8fa1d47so23790a34.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 16:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961764; x=1734566564; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XD6rH8e4DcKBxo5nQAKAM3oIHGLg0tbYPGNozz874ic=;
 b=KIiW1idYOSIu2A8bNh9Xd/ahleJv2GXczmFAQhj7j6BnywsT4LXxrwq4qcaORRB/Ao
 +zW1eqo9/LvnpXS0IUGuo4WoIePuZPKguAL1vMUExjXrVi7GTXqXEpK2b/tBT7ekxbON
 O/nTavvkk1QpHnV/glnnEnOIvsfDmdSBRXa2Ya7y2y/2JGokmiSirj+aqgR/mIDYpRbf
 BnJJkPFaPHJW+hITZEWWtDtwCixUQDmRJMf2xxsYosOQExKarTdidZuEAU2lz8Rm5W75
 BeV7ZSt8TXy89Q6etgW8fC63nZ/ThLLB4ZYcWP32o+makUOuntS7Yp5XHS/5Q1ktWuFe
 whbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961764; x=1734566564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XD6rH8e4DcKBxo5nQAKAM3oIHGLg0tbYPGNozz874ic=;
 b=e4vCfzUmuaLQnPKGvMHnZll63spHeLWYOJqar0dXXYwWFAZaCGxZlsQmPKPNKrL8Tg
 KfW3eWagdKGsB8nMKe/HNfgmApdBY2PFev1cttje5fq2T2h4sYIbbXz004HDyaIlxKDk
 Wqg8mDHaQPkXSlUwhnvZDFSg8srQ4maOUSUY+5X7zWd/M7qlaenmzHGWOJK2XYxTRbul
 MRqAraxJMF79hTRYcJX+oZ00LJ2GHfV+TutnChYW9E+1dovcFt4Vkz596BYcN9mR8nbb
 HiUDGXAPVulKlYsiw/JuQudz4G+BuVzCUuIsTeNnaTogLYgmmeKyOgFa3TvXRvYUi5AJ
 QZeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1rSU3BtN8IYdVKnLNOccd/pkgu+BBCS6pEyS8pL2kC8bJbJo29t4MRzPIi2CRtsHxOqIkTV2noQ==@nongnu.org
X-Gm-Message-State: AOJu0Yypy6aH24Zknh1Bwl7hiMxYHpq8pMDGT+olkZtSykv7HVUWMQi9
 So4J2wZ8Z/zqCvVGqHUva1f3AjCuvXR3UNWT4iYCXsjl7oHXfSl/0LxWdVwYxmU=
X-Gm-Gg: ASbGncsBc7xmcSxF3d3VP5Mr2Kpm7w/0PXPUYkaZeE0BVWZ46ISeJDAJApYdMTeAVzR
 cEUaCfOGUhvWFI/ElmyzLk/xowLcAUjW5FHeEwqbpNSH4fBEGypAxcMrK2hz+eMtpKkd8CaXUQ+
 ZZQiINxegKOGYt19/UjmElvm8SME7WlMUEPwcM2gJSzYIOf/uOTufWpZF44pilS1rZDj9jCXtl6
 sCLG8wnivAasdKjw8QWjfE7/qiSqTPqcHR9jNUd96wKExCj9sVC4EvHPeNGRUXYeUZ5ny1u9Qmd
 OTRnTklVAapOZ90K7nxUZsRb0cOOCiVg
X-Received: by 2002:a05:6830:908:b0:71e:1fbe:db2a with SMTP id
 46e09a7af769-71e29bbcd30mr795534a34.12.1733961764292; 
 Wed, 11 Dec 2024 16:02:44 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f2bc5e42aesm1643560eaf.3.2024.12.11.16.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:02:43 -0800 (PST)
Message-ID: <1c8aa2b0-f6fb-420b-80a2-424c7c723280@linaro.org>
Date: Wed, 11 Dec 2024 18:02:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] exec/cpu-all: Do not include 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X2P6vzOR55a4

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> Nothing in "exec/cpu-all.h" requires "exec/tswap.h" declarations.
> Remove it to reduce headers preprocessing and poisonned target
> definitions polution.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-all.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 45e66769380..b45defdbf43 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -22,7 +22,6 @@
>   #include "exec/page-protection.h"
>   #include "exec/cpu-common.h"
>   #include "exec/memory.h"
> -#include "exec/tswap.h"
>   #include "hw/core/cpu.h"
>   
>   /* some important defines:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

\o/

r~
