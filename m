Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51077FDEE52
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 22:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG2aH-0000I2-Q5; Thu, 23 Apr 2026 18:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2aD-0000FW-BZ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:31:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2a6-0003bU-Pd
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:31:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso4291903a91.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776983491; x=1777588291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1o4FaqTB+7I8DZJNbE1PGjJjNsRMBM5Fc9kr2Z5+AXI=;
 b=D8eQ/U4AVYwf0Pz/rfCWE0vW45eIBvYlNH2HtM5lSkWhYQm/3o64dJ7ieJMb5B1iuv
 VqBnB4HLPooCytbX8yetlRGbbrsJqzB3VAunPcSfYeN6y+b5rPBPKT6OOtgolrrB7Su9
 m2ZzqgPIxBAn6wMZmfOBt2GPO3MU7eSQndoKesNZkqv42uh/E8L/MEr8/pC6oEZMIkwP
 sNQNvAqKcYaHBWN4a2W9cSLuT/+c7tR0EcofQKSh6rsdOdr/HxmjdvkWjWIf6jfPMFxr
 B9U6/jW096hySUbwdDQI28D/A02tZL1yPr6KZuwEaDnNdX4ywAmsJu2rWfBGGi5PHmlq
 lc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776983491; x=1777588291;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1o4FaqTB+7I8DZJNbE1PGjJjNsRMBM5Fc9kr2Z5+AXI=;
 b=nLoHAJnlkAfjrWKFH30/bPlnSQmAPV6KREDgwA9UHJKr4DeM9z51qBklL8o8ggtuDh
 AcE+AZbykmUnuh8ODeSm3LseArHIo6ZA2NhKh3oHG6O8F0/9tg4L8NSYt7rLrHiwsdAy
 YKBGEfG6w5cqrDHXFbr8eD1enlfMFb6WDcn7G8KsdSvSP1TGlpyirxkqlFefHEDH5jZp
 cqiIyiCxnn41pxhW21rWNhcaxdvbUtY2sAMowoNDd3imAq3XB8K8ZmgoUl9PKbbeIOiB
 5l8XjOcp0qe1Z0OaXVyL3XjdlNwGlrHh5e6g5tYG99WbJq+FBeAxiQzf7ISUQ8QEobh5
 JJag==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Awpe21aUKmhF1mG9B0N5guyg+QfiQmePvVWhbVHN3JuYck6ZpiLdDdPK0/CNZdYc1xzzSiTxAyg==@nongnu.org
X-Gm-Message-State: AOJu0YyvfmzfOusOs0UL3V0W/DJLtio7gOq6/mpvU/B/f7R2uH+NXnLd
 fjHkqcfuM+j/lEgHVy8EIM+dN0HR4aMm/ZR6S4Uffoi1XamSjLPgD1VVyh+17vhtvng=
X-Gm-Gg: AeBDieujh5L47HLQEW8zRxRzlhRdK8JtGcMbMGyogAfGR1o5941Nh9VoeKAv2K2fmmW
 hRW/vvQwcPEN8UaE4vDrF031B2T3LJ/lhIrZUiUGMljIs2psgR0PZXgJVSykrmiu+xhNmHyteGf
 CS9AZJKjeh3l72JRaBGIEBK1tJ7tkk8l1lD4esbc584wr7pRF1uHmP8dhXCdNG9nRXUe+7nmdqh
 c4fo1+bmJkuG9zqHqySlfgtKXbEZ6B7fUIfdK3Bsw+Ts1PEIN7HCrLdPl8opD5EMJhMMHXFyffz
 5SL+1t8xQP2BooBZ/nr2uNjzk20RbRxZ2KEbnnRm4aWbMt1UAnPxtd8l8hGhJEA2MGK5XwVfeYB
 MRr8j5pJE3O3obmwPG5t/JydqVOZDwOvsI17FjA/0S7zAMiX5NliDzzQEjj+PZpmINzRAGPa7lR
 q4/4fxB+bHtDmqqxO/fqcBuztso3oxIEaAunqoqlIVCYmOMi/qEg==
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id
 98e67ed59e1d1-361404af0a4mr31518063a91.23.1776983491390; 
 Thu, 23 Apr 2026 15:31:31 -0700 (PDT)
Received: from [192.168.1.134] ([110.239.0.232])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7976fa40b2sm15278886a12.13.2026.04.23.15.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 15:31:30 -0700 (PDT)
Message-ID: <866760dc-1b4b-4c22-a838-7e2ab033b68a@linaro.org>
Date: Fri, 24 Apr 2026 08:31:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] system/cpu: Reset vCPU %exception_index before
 resuming it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal
 <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20260423170229.64655-1-philmd@linaro.org>
 <20260423170229.64655-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260423170229.64655-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 4/24/26 03:02, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/cpus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/system/cpus.c b/system/cpus.c
> index bded87feb1c..b4c7f94332d 100644
> --- a/system/cpus.c
> +++ b/system/cpus.c
> @@ -621,6 +621,7 @@ void cpu_pause(CPUState *cpu)
>   
>   void cpu_resume(CPUState *cpu)
>   {
> +    cpu->exception_index = -1;
>       cpu->stop = false;
>       cpu->stopped = false;
>       qemu_cpu_kick(cpu);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

