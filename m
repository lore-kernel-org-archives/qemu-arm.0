Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp231176njb;
        Tue, 4 Feb 2025 06:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZiMDrGhnCOh+tkhkCkLn84LgmA3tBTeVtevuKt+4Kc4oolkkQfqfQe6fkvfTc70HoTD8qI9yrOaqlmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFUheOD6FQp6KpznvuXbDpiUjdpwAGKlm24vCdbI4yC3X30E5Dupxwt4cuLtYEqqRm/WHcc
X-Received: by 2002:a0c:fd88:0:b0:6e4:2bc8:fb79 with SMTP id 6a1803df08f44-6e42bc8fce6mr13988916d6.21.1738678031673;
        Tue, 04 Feb 2025 06:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738678031; cv=none;
        d=google.com; s=arc-20240605;
        b=C7i1c4bGQbQah33+TfyO7+UIvowbB3ltwmXSkTdEl+HqgQh+9SYumuIgLGG48n0Wzl
         ROVLVTFY9Pqply4dD81I86BC03xj3YUADNhXfWy0SzlvqbZTwms3q/NLfiv/chA0jmLU
         r867rFjtF4k8yX5yX6o8BLDQTXKGI4rDMY7KfDllkfdpUpqZpdsHLiUX3oF3pgrUOZeI
         8PamefZ5PhI8ixmVWnLHOe23j6RSGlwk3D0P0d9P9JN96g6zNAUJy/BJ4xom9J8cOyuT
         o4KOgLC0gD3kAMaIeahB+HmDLeGVvfGS0h7sq/dT9cXC/e1m2uv6FsV620WESGprsS7l
         JlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MACcLVUvPHFSmaM75iDzb/OJiwypkatS7rQSxHk9umc=;
        fh=PeCzNsFqcftn3CxKN8FLhbdLZTUiffVGhRKxANpxa1E=;
        b=TmoFqe/aZaz6qUds57izrJlfJ6Mpem2xNXpNCnhyCCGW7qeMFYeYoIasVry8xPUXaP
         JQcxPnpO8QA+wALzuFpUAEjPFWH8ocWNXVRKr73GimOBC/4hn3aBOcI2KBwCUTwXhwb1
         wvGAdVvAGWySEStXxBpN6k8D6Ldi0wHXMx4CAOgYrUcSL6R/siM2M+A1+tfdQiF9lN3+
         HbKAmXJAXe4f8PcIOxSos2vD+I4OiGF0527dqE+grPvADFwH653Po1K2bRTnLiojNj0n
         7W/JystyNARiizvYxmt0R22hYTu8gPwt3Try8eRgx+UOLwUngqj+z2HtuaId6Wiu4uH9
         W/2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuZev0oq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4b823si264267385a.47.2025.02.04.06.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuZev0oq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfJZm-0007cu-71; Tue, 04 Feb 2025 09:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJZj-0007cY-RW
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 09:06:51 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJZi-0001qN-5P
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 09:06:51 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e46c6547266so4926298276.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738678009; x=1739282809; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MACcLVUvPHFSmaM75iDzb/OJiwypkatS7rQSxHk9umc=;
 b=tuZev0oq70T8WOV8uaUrcrMEPgGziymXCQCFBy7PLphMLZotVi4SgYtSnHOqP7lr05
 QX08jGqh/8cFxfg+M4Ea/9DGN9zAAGniD+Edz6PIPsjpRv2IhWxghrCu3GX3z2UEvQk1
 IbcIM6XHm+jGjpKNWqPn+LlFoL42h04QfuSBk8bIyjvW2/Buh0rDmjm81gsf6n743Boe
 ftchjG7/Rh7Ic42qAk6+uG4jp5fmM/JA2A5JceuAhPyGZs+NDBUQO5npyTYL4bs5FCHY
 X3G2UBbVWVFhpPwlALX/b02u7z8fhUCdYmq15sslY7TZ3cqnA75AlrSvRiwXHzJuy5E2
 GlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738678009; x=1739282809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MACcLVUvPHFSmaM75iDzb/OJiwypkatS7rQSxHk9umc=;
 b=fLX6A5CYm/f2s7lTdG+2isYU+N6d0VagRGNgxr/XfeXCjrWzZvyhcubeB9zkqhNZne
 ySJIp46ceK4p1kQMyTPMjxN3XorlYZyHS+bryou94987gOEmGCwSpbFuw/siNKCA2yDM
 BJb65fCypCmHq7GvgDIa1hcUtiCDah4mnmTyCcr7L4lN6cWpwdoHIavVUHrF6UE63PDq
 OF+byCN06jjhL+XeNdIcFpCaETltUysQSYYSc4Nw8wc1EzIsLdbTpbmVHzxANJXB1WSO
 XAZCP7d2aMSdq2N8WKKSRbBRFXSDF3JVSkNFSoeriT6Rz91hrKjejnbYlCycQxj4sy4G
 nYxA==
X-Gm-Message-State: AOJu0Yw7szsI7SQo6LAT8tuEn7eXzQ8x3vkN9wMf82jpSYZR9u9z4CCW
 uscClv9kEHLuYZOJbrXCBmdY402lj7kpNzs/1cSO8UppJxeuNB6GK5f7kUqV7xbL5k1G0qXFVbn
 KFLIYBZgutRp1bFGWSzAoVFWEvNA1JFKv0lxlgQ==
X-Gm-Gg: ASbGnct96TJTQumjrDWDFdqOz7sKugAwaQQrtNq98ax/c5kYzTBRT4HP22gpJsjyzb1
 Z7NKGKD8uUJzJCW9cf1wGCToU2l5JNASRz4nffuYLSMESMWCaXv+JKv3Gqa1SwMtFAFbmMRDK6Q
 ==
X-Received: by 2002:a05:6902:c10:b0:e58:11f6:db86 with SMTP id
 3f1490d57ef6-e58a4ab07e9mr19334137276.7.1738678008893; Tue, 04 Feb 2025
 06:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-2-philmd@linaro.org>
In-Reply-To: <20250130182441.40480-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 14:06:37 +0000
X-Gm-Features: AWEUYZlp-eRg0Z0wMl_MkXyjljkOhAz5jlGVHMiTfbvt6Hzb0rUo-Y28nuktWOQ
Message-ID: <CAFEAcA__sgLzm6XQZEkw2suXMyLqRzj5N1Kh=ZL5r6p-__AKnQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/arm/exynos4210: Replace magic 32 by proper
 'GIC_INTERNAL' definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wlqzx4nLCvCf

On Thu, 30 Jan 2025 at 18:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The 32 IRQ lines skipped are the GIC internal ones.
> Use the GIC_INTERNAL definition for clarity.
> No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/exynos4210.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index dd0edc81d5c..99b05a175d6 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -393,8 +393,9 @@ static void exynos4210_init_board_irqs(Exynos4210Stat=
e *s)
>              }
>          }
>          if (irq_id) {
> +            irq_id -=3D GIC_INTERNAL;
>              qdev_connect_gpio_out(splitter, splitin,
> -                                  qdev_get_gpio_in(extgicdev, irq_id - 3=
2));
> +                                  qdev_get_gpio_in(extgicdev, irq_id));
>          }
>      }
>      for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
> @@ -413,6 +414,7 @@ static void exynos4210_init_board_irqs(Exynos4210Stat=
e *s)
>          }
>
>          if (irq_id) {
> +            irq_id -=3D GIC_INTERNAL;
>              assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
>              splitter =3D DEVICE(&s->splitter[splitcount]);
>              qdev_prop_set_uint16(splitter, "num-lines", 2);
> @@ -421,7 +423,7 @@ static void exynos4210_init_board_irqs(Exynos4210Stat=
e *s)
>              s->irq_table[n] =3D qdev_get_gpio_in(splitter, 0);
>              qdev_connect_gpio_out(splitter, 0, qdev_get_gpio_in(intcdev,=
 n));
>              qdev_connect_gpio_out(splitter, 1,
> -                                  qdev_get_gpio_in(extgicdev, irq_id - 3=
2));
> +                                  qdev_get_gpio_in(extgicdev, irq_id));
>          } else {
>              s->irq_table[n] =3D qdev_get_gpio_in(intcdev, n);

A small nit, but I think I would prefer these as
irq_id - GIC_INTERNAL, rather than changing the value of the variable.
Otherwise the semantics of the value in the variable change
mid-way. That doesn't have a practical effect since the call
to qdev_get_gpio_in() is in both places that last use of the
variable, but I think it's a bit confusing.

thanks
-- PMM
