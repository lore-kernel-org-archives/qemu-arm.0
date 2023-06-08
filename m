Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp341868ejb;
        Thu, 8 Jun 2023 06:34:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kwfyB/SVIiIptAfB0Zrnb77kQJPqfDQzSHmAVqNLUzPl/+Gz2gdMdDpFV9T/aVyHmXvK5
X-Received: by 2002:a05:620a:2ae2:b0:75d:4ee7:f489 with SMTP id bn34-20020a05620a2ae200b0075d4ee7f489mr5122160qkb.23.1686231272153;
        Thu, 08 Jun 2023 06:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686231272; cv=none;
        d=google.com; s=arc-20160816;
        b=C2rnGqQRJ4HMCbNY9o7E01jLJCCna4ZZh/H93abLDBHT1cbhpM42VPn+Jdnf3cmnk0
         Dvpt7aOWGczdRUPJ/2mvOXYOYkFC06CkIOUrEwGmp3DhkNelkHd2Z9v1nzJ04GL5X3kt
         l4KrPeeN4EasHx3fy7EjopNS51avYhvIvifIVDMg1oFMIzeWger8FiI/Na2DfqdVkuzh
         LU8Zemz0YRw5kcyxjSfNwvcoW1n16Tl+EOBjne1u7UEtlj2p+IuroC2m0Na4yBXQ4GkL
         D5UOVr6iQ2e3pOK6dPiGkhsl9QXVzP3V4Zm1Zqe2FT77qHD93pV+EfuhHEpInNZb6Npt
         /D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ng8czX/rPWnhz7zc/NWQ/lu09zS0NPFurTxHK6zk5Dg=;
        b=UUYjMX0Kylo2dfATzo5u7yMdzKZ9xu7VTmjLOJcSKTCyZdDynJDwVFUXW3woKIxZ97
         2zemSSQybKfyYwCp6igbN4qznEgAAvlKns7URfBuP7UOqIhFK6DUbu9bK+azo3VaZwMp
         Dhkozmgq4f4J2NG4n9nQwi0sjSrXDd8XAyN5XnnnMTTH8AuJ3v2IbvUOzPECg4I1SWeU
         DMxpSvZmEEUX4AQDAh+4SSXSyjTnjBzoxyv0yrwwtZQnSHvd0U7wNUEce2qRJ8nohyh5
         DDNxIpne5McSb+KLJjhGmmqFJmDcuLXXprlKWpfWFV8ulrENJr+Oa3VNLIWVsgk1mEx8
         JuZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdmYJutT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a37c444000000b0075ec568570dsi608111qkm.136.2023.06.08.06.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 06:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdmYJutT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Fky-0003ra-Ik; Thu, 08 Jun 2023 09:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fkx-0003lA-3j
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:32:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fkv-00068G-8i
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:32:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6e1393f13so4109875e9.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231167; x=1688823167;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ng8czX/rPWnhz7zc/NWQ/lu09zS0NPFurTxHK6zk5Dg=;
 b=MdmYJutTLKX7pmwg34JehTXAaBuSm9j+gOzCmmCZL+3zSfvibE6ZzESg/spuiUq6AM
 DjiOUo0btHa7hHYu+MoR/QTBNQirC6MA4THicyCIdnZ8mf8/sT73bLLqXtdiBeuo9vP/
 0z6hgBIaVLIrTgn0mfE2YZ9MuED+hVIYdPi1/FvTVTZqOVQRc6UidQu3cylgIVyjHCuo
 ULhwCFRTERY/W7nMmCwDBq368WP45cjAaD0uWf+mKm0HuFWj0aDLQXOWcZTQIxNbvVI1
 r+C3zjCWWjIuEXBLL8jvcG5Cpb4roqxS9FcFpJmMF462pEa/TC/sMq3tGDZOVziNOFZW
 fQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231167; x=1688823167;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ng8czX/rPWnhz7zc/NWQ/lu09zS0NPFurTxHK6zk5Dg=;
 b=GaRdBXhzVJpbc8BK4/5oxWarTxUfSIPjtA7Q2EJpx8fx1oo6LwWDGUdmkYAcb0OcKX
 rn+DhAPr81b2Wxgskp9PTKqMv1lXzW3/MBLrP7gIJSRssbueq55GgTL4RaF0S9qiWWyh
 5PIDZKgnfeDegYkL9Sa7E2kHu99YsucgH1ZhLCOIlVuHI86MNVjFUIFeoJxM+aHzeEbb
 5J3LgnqQif4ROkHk720P9Q4JydHkg7V0WxCnEAWQEPx+NvvuOvKrH8d04Ch2kfb9S0S2
 KifV5B0UGWAsvUvzbhGaNWhMyOIvQcJHFoqCsp78iqCd+mG6ajc3rj19amfsIhVZJLcB
 Fyvw==
X-Gm-Message-State: AC+VfDz98/D4CpzDhoSio/2T51vAyQcJEuUvV2/6JAxSjCNFABEGuzA8
 gyqnPT2T2+Va8Yi6GVPCGVSG9w==
X-Received: by 2002:a1c:7717:0:b0:3f7:34dc:ed0d with SMTP id
 t23-20020a1c7717000000b003f734dced0dmr1404330wmi.25.1686231167296; 
 Thu, 08 Jun 2023 06:32:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f7f4b7f286sm3595167wml.12.2023.06.08.06.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 06:32:46 -0700 (PDT)
Message-ID: <22f84ca4-cd6e-88c5-ff0e-02632c416677@linaro.org>
Date: Thu, 8 Jun 2023 15:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/5] hw/remote/proxy: Remove dubious
 'event_notifier-posix.c' include
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
References: <20230608133108.72655-1-philmd@linaro.org>
 <20230608133108.72655-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230608133108.72655-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: mCYzrMkQHvzO

On 8/6/23 15:31, Philippe Mathieu-Daudé wrote:
> event_notifier-posix.c is registered in meson's util_ss[] source
> set, which is built as libqemuutil.a.p library. Both tools and
> system emulation binaries are linked with qemuutil, so there is
> no point in including this source file.
> 
> Introduced in commit bd36adb8df ("multi-process: create IOHUB
> object to handle irq").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Note, --enable-multiprocess doesn't seem to be covered in CI.
> ---
>   hw/remote/proxy.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 1c7786b52c..2052d721e5 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -22,7 +22,6 @@
>   #include "qom/object.h"
>   #include "qemu/event_notifier.h"
>   #include "sysemu/kvm.h"
> -#include "util/event_notifier-posix.c"

Err wrong branch base, please discard this patch which is already
in Paolo's queue.

