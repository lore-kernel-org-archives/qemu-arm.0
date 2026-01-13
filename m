Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC98DCF45D4
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 01:23:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfT7X-000882-1P; Mon, 12 Jan 2026 20:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT71-0007xE-37
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:22:24 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vfT6y-0002IN-Su
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 20:22:22 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso2922675a12.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 17:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768267339; x=1768872139; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jCvS7XEtfIsL2qW/ps7EGLoEp2/j94ldKbW9Z93ZUI0=;
 b=zpSbIHY/etgCa0l6uK83wwGxirjHL7J7u4lp3Md7QX/Q4q7ABAV15MhlIjnEdypgA6
 IuqI1zvjTuGMIYAQhJ/Ij9njPjs7zoaCMNGzsqGFBFOdm2BCQSoze5ev1t2b/mFo1GQK
 xf5SKQLWQgoJAIi227d7VEYPH73Q0HBsB07nlixhESO/nE08BiJCdyCm+SMz7Y8uG31m
 UFOVFPK2OeLpu9z5x39fP+orG5gYi3febJ744N7jYJuZKW2HIvmRMmbxcunIqtERvKC1
 CbOFZ9Nj1v/xUA/l6Usn0f5iiDnenAMkQdRYZBmX1vfUxh7W11/n5lMP26TiHWIrSJ+c
 NMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768267339; x=1768872139;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jCvS7XEtfIsL2qW/ps7EGLoEp2/j94ldKbW9Z93ZUI0=;
 b=EHlDTxHaabyHO6rm/io7/mvRwW22ayAaztxPdbtKZZ1prDbF26vqq9fiZKAvLD8ZUl
 RHcBpQP3ZjFcH0TXJOyUgEH1wSOb6q5c2mhw1qqpVDM+4dIaTtglTiXJpMseCLyaTiXg
 oq8VXocABA5dTjEz90xPT34T4gyI7V/R7PDXOMEfW3p1mkArUR/3CNd/5X4BML5cDCM+
 8g/IYHAh8jOPu7CLS6aNqR/mo2vrKjjMu5x8n+IWe4Q3ynkHc9ZfknutZKt5YUEzgJya
 BwYHaEQxH9ag/xwuXyZy4BdNukaha53Ye5VuVLdCPt22AWISIXi8ndW3znQcLMFutUyI
 IrJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK5LHsfyg00UGGRNpfHUFVtIzIBVkOa+1LalnqnNLnrTP38633JEcyv5zPai4SeL745IxijLZy+A==@nongnu.org
X-Gm-Message-State: AOJu0YyaDAJThEwUrMlD07Wjjt7TT1uCydLg1yXppKRNJLSEurJRH3js
 5qQC0bw+ik2X3o254KEPXcXhts+w4esz/gRvgnAnj3qwcnvLxPb+UoBm9e1jkQ2vzDw=
X-Gm-Gg: AY/fxX7qDS6hNYmfT9C0637F1uh9xJdz4gF8sVkOoOAW716n4KPf5AEgBQMfLZdLye3
 N/tkAqXJUk/BLfo0mwt0iXl+0IgmfQt/yoz7s9vw7y0FciuIbR8/ss2NYka0WsB5JisfvsnsXo1
 b5LtFyWik78WlBbsWuWd007FVqWKfO8EZpmXok2Xrqlz/XpU5oruIls8rgL8MsVJBcRnXU1qSXI
 FbOWsYZKNswp5IxliWbz3oru3plcoGsxAcLV0EeoKGCO8nFh9pqNp8Y6jt40wus8rYIjIvDW+IF
 BnXhE7BSJUtT9AwnFjP8NQvlKKFSSqg8t/opH0PQ98E2Qp9pWW6xSm6zQMq09USGz9w2dwe/7eK
 uybLosXliCWE28tNxZJt+McBZt7kwG7RvgsDeTVk4ZTWYDWa++TJitdgIKUqURQpiNzFISYUz2P
 pr/xzo5xbc4Afxr0cSTdU+B5w+fmY=
X-Google-Smtp-Source: AGHT+IFMFJyVciz+5hfbj2x0yId/SxZyshu8AHWxCtf1h7ZiQ6fGA49pWlb9k/v6fR0b6XQz2U+Iqg==
X-Received: by 2002:a05:6a20:158b:b0:364:131c:40dd with SMTP id
 adf61e73a8af0-3898f9b997bmr18620561637.37.1768267339074; 
 Mon, 12 Jan 2026 17:22:19 -0800 (PST)
Received: from [192.168.15.8] ([101.187.175.172])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c57a50da1a7sm7735375a12.36.2026.01.12.17.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 17:22:18 -0800 (PST)
Message-ID: <f3bde800-cd1c-48d4-8613-4fd8c53006f4@linaro.org>
Date: Tue, 13 Jan 2026 12:22:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] hw/m68k: register a an5206_cpu_reset handler
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108143423.1378674-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 1/9/26 01:34, Alex Bennée wrote:
> As the mbar/rambar0 values are currently fixed we can migrate the
> setting of them to the reset handler as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/m68k/an5206.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
> index f92a5d6a339..918c376a384 100644
> --- a/hw/m68k/an5206.c
> +++ b/hw/m68k/an5206.c
> @@ -15,11 +15,26 @@
>   #include "elf.h"
>   #include "qemu/error-report.h"
>   #include "system/qtest.h"
> +#include "system/reset.h"
>   
>   #define KERNEL_LOAD_ADDR 0x10000
>   #define AN5206_MBAR_ADDR 0x10000000
>   #define AN5206_RAMBAR_ADDR 0x20000000
>   
> +static void an5206_cpu_reset(void *opaque)
> +{
> +    M68kCPU *cpu = opaque;
> +    CPUM68KState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    cpu_reset(cs);
> +    cpu->env.vbr = 0;
> +    cpu->env.mbar = AN5206_MBAR_ADDR | 1;
> +    cpu->env.rambar0 = AN5206_RAMBAR_ADDR | 1;
> +
> +    cpu->env.pc = env->reset_pc;
> +}

Don't mix cpu->env with plain env.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

