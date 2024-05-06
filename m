Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1443025ejc;
        Mon, 6 May 2024 02:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrGWsly94gZtziazztUic6TN0STKezC9OhQr5TTKIivH5zmC0THKty2+nBlIHtVql2FKWNrNTjJecFOVTwLV+OOAUDFtXq
X-Google-Smtp-Source: AGHT+IHMVwYRTKmkqStDhorKC8KM/Bz3zGizcgL+dcgXpRzPl4+qtF9SG/G90SV9vAqxDv5vwUtx
X-Received: by 2002:a05:622a:53cf:b0:43a:b2a0:6e01 with SMTP id ef15-20020a05622a53cf00b0043ab2a06e01mr12400491qtb.21.1714988098015;
        Mon, 06 May 2024 02:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714988098; cv=none;
        d=google.com; s=arc-20160816;
        b=VbVJ4NCazVhBGyDUtFHu1ROpXGoQq/CMQJkTMMipp/YWDzXV5H6MjJE1wCy6CyXWW8
         94fk04hW9CWkKuN9s8Sfo1fEZLTxPfutt+pIXblF9onCAMjI5s+YfK4RSgueKUaBdz7R
         y2I3RMgzeu4toCqvgiZR9PG1V2Qa3n9EXg6Pyv7titbwxT6v0oH5fIrA8v44KSSeQqaw
         USdV61h3lLFk1xy+Ggw3OpnB1NYndFadxWWql1HUpWv03kly8UholaACufGQuIM4h/Tf
         PqwdfV8tKweUcZjI09u0QiBVeCYNuySlBuxBgnEm4azLZhVLZYCgRriqy+YnD9v8z228
         S8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kfoPd5lIV4bqhuA9i3A1ge+qoho79nPaXq5HjCBEwuQ=;
        fh=HkoFwvQ4i6O/6jDQ3yNvgWkk4ointHI2LhZu8OVY3Mk=;
        b=Rio2rz6PXgu+k7K8bc05rJQmKtUg61s1c/QPSlPA8KgEkNtKi6Ch+G28qqSiJOoImh
         otXXZ6MYovdfiY5INmSWjZUK/8CuabJPXeUpPQGmAoRK4WPJM8GHdUwQURXmP6AUYY1u
         B3cupEjN7lFQJT2LZxTZjC/YadCSb6STWAgOo4RWv5S16NbZNyjcjUH1aGdZRyiDqWfI
         nhbgjGglV9XFjrhBwEc57VFuy6mcwtAinDTvbgTkh5j/MFo3UOFdx6BBQZO3/9Bi8F9h
         WqQodBXHFBqGaTVTJeLwc7bIL+VNEtqQufxo5cXXZhosrW6qtnD6gneG817uCixT1Bvh
         CCLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qscxZZpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05622a164d00b0043cb229801asi9205756qtj.181.2024.05.06.02.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 02:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qscxZZpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3ukC-0000Sp-7B; Mon, 06 May 2024 05:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3uk9-0000Qc-UR
 for qemu-arm@nongnu.org; Mon, 06 May 2024 05:34:46 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3uk8-0007CI-3x
 for qemu-arm@nongnu.org; Mon, 06 May 2024 05:34:45 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso217284266b.2
 for <qemu-arm@nongnu.org>; Mon, 06 May 2024 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714988081; x=1715592881; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kfoPd5lIV4bqhuA9i3A1ge+qoho79nPaXq5HjCBEwuQ=;
 b=qscxZZpuWpNLAzHeBgJPr8rV7EvgtXKbqOmBywz0iSIPtnv7COi0NfphGgZz6rksdy
 Gqz5vA5DGzBXNTihOw+gCVIkhcf/DNeUle8K61AYV5DTjn2rFaHKlJoOA64fXwf9MPD7
 siqcQRxoVejz6rVx/RQ0VkmmbtmSrBpnATDlqfysI/2og/zCwxcxEhuMe5PPuFdBMrph
 8nlGhvJ+YFI4tFITDmMaZw+wA6zPUgk70Krr5dzqul1fNv67Mazzkjhp3L+eg8zazWD6
 vVZfuPE7io0TkPrMnCx0x/ghsV8hK84GgJP3O3sabU1GTIfeRfOkPdRRW9KpY/QJtbgc
 tCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714988081; x=1715592881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kfoPd5lIV4bqhuA9i3A1ge+qoho79nPaXq5HjCBEwuQ=;
 b=tqgRTnRwrU3a5vpO/CCqY5XcalownKs5FUDEwcfvnVwKcYo3epB9kNFHc5ZnNsHaBM
 T6ADQ0qYOa1Vtjn9N1uRBmDJhU3+yvHzIDfNqLzOGOpwESjvGnkAd7L6biwUcwrsUH//
 Z1AR4vFODrk5oyUppws9xVobxeKbC0yp3xYaXss7tu8nQqQyzH6F50pCs7aF+R/F/pV9
 AZBxiIS+n9gxoN8YB22lRCVwddm7R2g+qme9v2OLoNT09rHJbZIfTpeVyKQ0FQMbn/J8
 JPoBNXtszB0fgiOADNYbBtoao2PCd3c5VQXprGnaqBjRDFv9/X7Z22gdt6B1J58hnW2I
 ITcA==
X-Gm-Message-State: AOJu0Yx2lLf3Uf3FNXsZyYpj43D8ai9XPmWJP+no6CTMhqTSSLoJrIol
 NpkuydU5MoYnLYT5FmmxhnA7HmvyTffXKdub0JvkRASc+OJtBonYGWGSvYx8QUo=
X-Received: by 2002:a50:bac6:0:b0:570:c8f:1a35 with SMTP id
 x64-20020a50bac6000000b005700c8f1a35mr5812355ede.8.1714988081223; 
 Mon, 06 May 2024 02:34:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b005725de35790sm4977627eda.61.2024.05.06.02.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:34:40 -0700 (PDT)
Message-ID: <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
Date: Mon, 6 May 2024 11:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/char: Add QOM property for STM32L4x5 USART clock
 frequency
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
 <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: dRQAIDVkybPs

Hi,

On 5/5/24 16:05, Inès Varhol wrote:
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/char/stm32l4x5_usart.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index fc5dcac0c4..ee7727481c 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -26,6 +26,7 @@
>   #include "hw/clock.h"
>   #include "hw/irq.h"
>   #include "hw/qdev-clock.h"
> +#include "qapi/visitor.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "hw/registerfields.h"
> @@ -523,6 +524,14 @@ static Property stm32l4x5_usart_base_properties[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +static void clock_freq_get(Object *obj, Visitor *v,
> +    const char *name, void *opaque, Error **errp)
> +{
> +    Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
> +    uint32_t clock_freq_hz = clock_get_hz(s->clk);
> +    visit_type_uint32(v, name, &clock_freq_hz, errp);
> +}
> +
>   static void stm32l4x5_usart_base_init(Object *obj)
>   {
>       Stm32l4x5UsartBaseState *s = STM32L4X5_USART_BASE(obj);
> @@ -534,6 +543,9 @@ static void stm32l4x5_usart_base_init(Object *obj)
>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>   
>       s->clk = qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
> +
> +    object_property_add(obj, "clock-freq-hz", "uint32",
> +                        clock_freq_get, NULL, NULL, NULL);

Patch LGTM, but I wonder if registering QOM getter without setter
is recommended. Perhaps we should encourage parity? In normal HW
emulation we shouldn't update this clock externally, but thinking
about testing, this could be interesting to introduce jitter.

Any opinion on this?

>   }
>   
>   static int stm32l4x5_usart_base_post_load(void *opaque, int version_id)

