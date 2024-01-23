Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp170165ejc;
        Tue, 23 Jan 2024 00:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEORqfqBInuErlLurXJn3YX8NL9480IMTdsYrTVhFxVmJqDuGDC0ERAIBusTxbDsM711RD4
X-Received: by 2002:ac8:7f93:0:b0:42a:3cf7:e72b with SMTP id z19-20020ac87f93000000b0042a3cf7e72bmr410120qtj.16.1705997439080;
        Tue, 23 Jan 2024 00:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705997439; cv=none;
        d=google.com; s=arc-20160816;
        b=nPzabJnac+lTmhNfsGT/i2KsYtLPnxvywOQ6Th8wRdXlR9CsD3Lhagh+3+SBAVo39K
         tF5Fu9/9Xk2W9UlHlHiGff8S7iLumw7r+sArwX6PIVfjJElI8ahyYDoYFU+xOaJGtZc9
         0jIw5oZuGoH8S7sHEJT+FOgu+DpKH26XKLJoNYLokwoAisoFk+kwQJCj2V/Y8Ic6FyON
         dzAQRr7ZdRXeuvoDCt3LFoqKIM8fDQf85mXL2AJCGehFE5u9NxqDuQS/2jZjveAWsZnq
         ptqutt0m2UWm8AGJ7O+kRS7Na8X8cLsu/AHKLIjFh74anaN2ZVU/+vQIKdEucaEBlYaM
         BYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HTpOr9bWP+WOfbDkoEe4Zizbi0WuDHZ9gtbs03jHZvQ=;
        fh=LuBrjOnPg2AQzByUiQJ2q3tU9SumU9v9/984Lgd3Ato=;
        b=xaWNi2Usw/w7GgYMpa4mqmh3SlDEcEB0o5RgMUUiXdKZUSlfyLksIt8g3OTKPBzejS
         +ryDPiOF40nxpy8PU7u+4UGQZ5laq34CAuij9p7tUyPFuCtqxd3ugq/drCFjuFS1HQoW
         PQUGb4gIcDAi6J5gbbVJx7xOqJXXFWz6FNMod8gYKBIchuxRZkU1qSegyvNP5yTxDbWf
         cEZK+oP9wWIyFlvOIHPGGnnURs/FmhsyiUwPHGPOSTo/80KjSwY0Lf/CfTVUGQnmGc4I
         k3hFpqBElu3eZo8b9/cH1Ul7r3A0fyhSGmpADAotFDPAJO6mBDorhj7SfKfrbkufEORK
         zk9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1RvuPiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05622a178a00b0042a1f274b03si7638607qtk.490.2024.01.23.00.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 00:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1RvuPiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSBqo-0001R0-R5; Tue, 23 Jan 2024 03:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSBqn-0001Qo-CK
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 03:09:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSBqi-0006oF-Fn
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 03:09:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e80046264so51275605e9.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705997374; x=1706602174; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HTpOr9bWP+WOfbDkoEe4Zizbi0WuDHZ9gtbs03jHZvQ=;
 b=B1RvuPiy0A49EFP7KkX8u0txY/9Cv7i9mIbqYuei47RhGZROmjp1et7EgFB/CX9WYt
 MYn3u5z2jQtdstlDQEHPXqFsdxTGZ+QyC8f7q0jB2YaJR2q2o/pdYwA5HrHP+NYnQ7Dk
 9R0XpZCe4/olpbi8hXb9y3TQxoXP26+T2yQSSDEZDtDf/7H9yrUzL1ns5ju71KVB7tSx
 3G+8ujrv87gqj8yBQCl4if5Qhvyu/cHBB7pxzYaP7AxhbH20Yv9qVF+n3APcUwIHuxWr
 VxYtUpxgRJQXZizvxINkuHmlQKDxyD/MURYlrdBj/8Nf1oMlPgw+AdKulSdR0y3IvkA9
 fzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705997374; x=1706602174;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTpOr9bWP+WOfbDkoEe4Zizbi0WuDHZ9gtbs03jHZvQ=;
 b=C+1+K8cku+odemFIRuPKhAUCg1dYza+PCEkekEd8T1XsIDLm40AM+XraRaAQ/MD/XH
 v2wSLk0voty4dTYaLd957RZut6JACVlR9SrAbtF9J/yVrXL+MdogWdg4RLN+DXwQN7di
 xyMu1LwGBL9pg2r1FWPHgiPbeXgmaHKWoDZK4EJdJ/LpncGEouyRonC3gFpzKdL+yJx5
 mEiGVR1qB/Me2ZvqP8tttd03eerUy6mEVH5Q7RqPqY9SIBHWyNvoY7rrW/hR39vDbVF8
 /+aK5eTph3RySKpBC4+17ymEfhoXPrpZulF8R8VxAcgPu9Ou2xEYWKurPddugSzRjxy/
 Xh/g==
X-Gm-Message-State: AOJu0Yyh61lSvA7YhZIfabpmmHJRpw2OkDMrPJyCClR5XWiv0+QvPea3
 z8a6ajtHN088+63EULLewwQbXXCyLlONJdfhtbe5gP/6adZT9rcgIyj2BW+WFKE=
X-Received: by 2002:a05:600c:cd:b0:40e:8fc6:763 with SMTP id
 u13-20020a05600c00cd00b0040e8fc60763mr316849wmm.77.1705997373922; 
 Tue, 23 Jan 2024 00:09:33 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b0033935779a23sm5114372wrb.89.2024.01.23.00.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 00:09:33 -0800 (PST)
Message-ID: <d62f9bce-f86b-42db-8c27-6565cf1b8159@linaro.org>
Date: Tue, 23 Jan 2024 09:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hw/arm: Connect STM32L4x5 GPIO to STM32L4x5 SoC
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
References: <20240122210829.127691-1-ines.varhol@telecom-paris.fr>
 <20240122210829.127691-3-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240122210829.127691-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: k6/hsRZdn7RJ

Hi Inès,

On 22/1/24 22:02, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/arm/Kconfig                 |  3 +-
>   hw/arm/stm32l4x5_soc.c         | 79 ++++++++++++++++++++++++++++------
>   include/hw/arm/stm32l4x5_soc.h |  2 +
>   3 files changed, 69 insertions(+), 15 deletions(-)


>   static void stm32l4x5_soc_initfn(Object *obj)
>   {
>       Stm32l4x5SocState *s = STM32L4X5_SOC(obj);
> +    g_autofree char *name = NULL;

        [1]
>   
>       object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
>       object_initialize_child(obj, "syscfg", &s->syscfg, TYPE_STM32L4X5_SYSCFG);
>       object_initialize_child(obj, "rcc", &s->rcc, TYPE_STM32L4X5_RCC);
> +
> +    for (unsigned i = 0; i < NUM_GPIOS; i++) {
> +        name = g_strdup_printf("gpio%c", 'a' + i);

           [2] // alloc

> +        object_initialize_child(obj, name, &s->gpio[i], TYPE_STM32L4X5_GPIO);

           [3] // expected free

> +    }

       [4] // current autofree

>   }
If you declare the variable to be automatically free'd in the
main body scope [1], it will be free'd when the scope is leaved,
so in [4], meaning only the *last* allocation ("GPIOH") from [2]
will be free'd, all other are leaked. We want to release in [3].

Similar comment applies to stm32l4x5_soc_realize() in this
patch.

See https://docs.gtk.org/glib/auto-cleanup.html for context.

Regards,

Phil.

