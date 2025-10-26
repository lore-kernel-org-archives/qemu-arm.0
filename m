Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D9ECCF9E9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Oct 2025 17:35:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vD4dI-0003c5-8r; Sun, 26 Oct 2025 13:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vD4dD-0003bE-Pi
 for qemu-arm@nongnu.org; Sun, 26 Oct 2025 13:34:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vD4d8-00011J-7u
 for qemu-arm@nongnu.org; Sun, 26 Oct 2025 13:34:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so22275965e9.0
 for <qemu-arm@nongnu.org>; Sun, 26 Oct 2025 10:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500046; x=1762104846; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/Flsg+QPUqTm9NbPzQewbPA5XMvA8jzLroYCFqLMAw=;
 b=IxTqj3tvaWdkR6HhuAasqisJOb/N2/RQcZfLYdfrK2ZJ4qSptYo4TjNmmb20NlHPPL
 n6lIAmx55SYVkqa54Fpzsxsniiczy69bFYCp4rqC58m5mLAUbeLiDXsQtRw2bi7VJpyV
 U9o4LmeLcp3lN2/s0z/2kZt4LGvr7jrSalnLGu940LwO5OqZQ5iW7Bw5MVsCGqrVUZqU
 AzcUzZdhrEZiwQCma23QCniGsrHo+ycGdp2EFmhkiGA4YGXo4QuuKonQg4m1tC+vFowj
 ktI+dr0YhT/hfxRjzegPJco5p2F6fVIWIrURQS11Q3GeKwJMPPgU0KcW19nCcGerz59k
 aI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500046; x=1762104846;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/Flsg+QPUqTm9NbPzQewbPA5XMvA8jzLroYCFqLMAw=;
 b=t6jOjrKAA6FpMGtB25gCM/txeKjkorp2QCA9Xg/f924wstnak6StmvGgMuNupeYUz7
 GOrHsd5BhxNg9KCj7tQVOV1tta+E2uzOO9jdStChasud1eE5CO4oxgKnGKvWrcxI6SQf
 ffp3rJuyG99U3HThi4lWbeDCBocXFwal47Ao9SwjgKPNfc8KvcQPDJrjOYfgf3Tk60vb
 aXk9276KtfCGAETe7LD+IXSKvRaPNWKfKttntBD4KlHIp27iypuLxRyOxcnF39rNhd3V
 iGAVbS7u4n3tDDxdurXPQfPRYdY6fYKcbL2Umb92aZrw++p7T7n3I3DLZZh3vhPqn85Y
 Kkfw==
X-Gm-Message-State: AOJu0YzaWb8DlIUWTt3yRGeTuxM3A1BRLakNyYAOTHJO/dqDDHM/x3kN
 W5ED27xkEzpEgDN72PHFWMTUXo87PRC1ZxreAdpaMZOqOyzKmlMncPmGhihWl+larg0=
X-Gm-Gg: ASbGncu1/alsFbKzdtfBlciUY74hrixqibgAcj57r0F4a365TufMGL08yjrabj3y5Ua
 xDZqSwWXzcD4KX/rInMYh5S7m1fXJPPD1RK9mP/BFyRgVAZLg510nWwhPHKUZYAmhvP3LAdCxap
 qzTVVJHbh1cPonQUmv4tbXQd+ZM+pka41gagxkMLQFQiQUCTJcuJJY2e85RAPB++NmnyYAlhk19
 cGDYmssONz90y4a63z0URpLrwLe4vjVXHMWjAjZcWh4ZuKSl9dbOT4qlBRmcYmdwqRFnMVwyGX8
 Y6YeaCxFzQ9WFM34IzNIwVZvsdzX4PHSxifLQiaMXcMe8uFne/vS/KMcA+Ob7LkH+5LXXk39HBp
 pHsK3Lw5ohNJ5QRapjE51xQ3XfMynqfZIGHU0eAgrSuIH9+u6t+VsQmr0ugtb8M/DNiAz+IG+Sc
 zbrx4Z+uHQGxY2YCQNbcoJK/X6s02ene1HrcRlcQ3J6M7Ct41uDy767JvvM8g=
X-Google-Smtp-Source: AGHT+IGf8RGtn0Fuc2gxex8/KMi3A6hB/J1PgBazk4oLCvXcGF1de1F9kydyAwCHni6J5y466hZXOQ==
X-Received: by 2002:a05:600c:310a:b0:477:e09:f0f with SMTP id
 5b1f17b1804b1-4770e0911d5mr24246135e9.8.1761500046082; 
 Sun, 26 Oct 2025 10:34:06 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm9746531f8f.24.2025.10.26.10.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Oct 2025 10:34:05 -0700 (PDT)
Message-ID: <9db34e4d-1c8a-43fd-8810-b113ccb2ede3@linaro.org>
Date: Sun, 26 Oct 2025 18:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/27] hw/sysbus: Add sysbus_has_pio() and
 sysbus_pio_get_address()
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20251024190416.8803-1-philmd@linaro.org>
 <20251024190416.8803-8-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251024190416.8803-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 24/10/25 21:03, Philippe Mathieu-Daudé wrote:
> Similarly to sysbus_has_mmio() and sysbus_mmio_get_region(),
> add sysbus_has_pio() and sysbus_pio_get_address() for PIO.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/sysbus.h |  2 ++
>   hw/core/sysbus.c    | 11 +++++++++++
>   2 files changed, 13 insertions(+)


> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index d33be6b2b52..1dbc345a3ef 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -206,6 +206,17 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size)
>       }
>   }
>   
> +bool sysbus_has_pio(const SysBusDevice *dev, unsigned int n)
> +{
> +    return (n < dev->num_pio);
> +}
> +
> +uint32_t sysbus_pio_get_address(const SysBusDevice *dev, int n)
> +{
> +    assert(n >= 0 && n < QDEV_MAX_PIO);
> +    return dev->pio[n];
> +}

Actually not needed, will remove in v2.

