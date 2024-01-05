Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp866358ejo;
        Fri, 5 Jan 2024 09:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/1XJCSQUGJ1cbtDa1BMH7c9pyN22XTWyJvSTWrDZ8MYD8T2wJLgWgDeRW3u4uIkVkWvBR
X-Received: by 2002:a05:620a:5609:b0:781:2299:6b0c with SMTP id vu9-20020a05620a560900b0078122996b0cmr2435534qkn.10.1704476901045;
        Fri, 05 Jan 2024 09:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704476901; cv=none;
        d=google.com; s=arc-20160816;
        b=jyOQ0tqb9L1yCkG0cuNK7GzJCfOrMcsMecq/XhxqJNau+vuiSWYgtyGO1oYv+Fetgt
         +m6yUnucIkTr9pSXASHfxb0huqvLjgsIJhVgGlqNuar3GlKJpY+HCVqts9zCw4PabJEr
         TCZ5fJmuO55jWBKLhXg3KiidzHzkKjTMSCSMCVM/olE7LeZTHUfq2zqijrkwQLEjNGpd
         SaXOpi3tDwTw74S0QpgKFR0gL9zqYx0zPHaXzuuI3bhUHx1yR1wZ9iOFanqfQhAzk1sW
         GHZgTfNuV9dr7TMTH6QTaMWRcCIYSUqtvUqbkMWUvLinETOFcOP3TQNqLOnh0SVPHCJ+
         ORbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jT+1Fj9CgUZMOGxV3spXXzP+plgpceBw8GIXbcRQ2n0=;
        fh=qdExgS/EC9wfn+jhDNphFdE7zpmUpTklI58gaAWmHTw=;
        b=sBNbGmRPRgpJfuJW2/PNZ01Zw6KY/hx4y6kFYLPQ7bmcEhOYX/gDs27oRu+61Osijc
         HNnFfoemYPjoq4jeUsLqA1BRMHq+OeFBuG2i7xX3zFhsMDscaHepdaXsyPVqBwC/e4cb
         pi5kTBlylsvZx+C6xebWv0XzwWUCdA+78WnqGFJ18BFvFNmhH7FhN6pjTF5UR5B9ySQm
         P//Pndf0DZlXIYjNJSXNUVIlScsFCPBQchwcFS1b+xPW5zaPSZjR8JLD6b1C5bvWzRDE
         GlEImpnTZGwLdsb7eMCZwi0LgH0ShkoQLXlKoeEKIhcgeDgf6O3KZGvGBbW8vw19zmf5
         e6Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6ON2kyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a05620a288800b007819e1c8594si2279236qkp.129.2024.01.05.09.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 09:48:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6ON2kyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLoIr-0005oE-3Q; Fri, 05 Jan 2024 12:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoIq-0005ny-9P
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:48:16 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoIo-0007e4-7R
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:48:16 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso2241262a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 09:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704476892; x=1705081692; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jT+1Fj9CgUZMOGxV3spXXzP+plgpceBw8GIXbcRQ2n0=;
 b=W6ON2kyPuy2kKj7bRL9RkjkOjtENoMGf0dTG6+470lADw/2f4ZEqD6scy35AYO0CwL
 S/SXdY97XgzasM/qaV8Q6tubMk8Aq7chByAA+FlJidoMG2uHyDpclyqy0bcdPDb24eAI
 AxEpRAfGp7duPZd/skWgzL0zexItwYryLqp4eKtqMMusVqbmccUm0j2VNX74EbrAaHoB
 Od8g5xta85moWDSdrQdTbPum3OAa+YWmEFnXxmM9q47oy3mBdMrd6iFUDq/VnZBgdDea
 WhuAZj+ZyyNTkw5y0CHnmg7jGvLufXiRdHRgXDCnCoV4Qk8dzrWxSyvVFc2f10gaxB8Q
 FNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476892; x=1705081692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jT+1Fj9CgUZMOGxV3spXXzP+plgpceBw8GIXbcRQ2n0=;
 b=nEkvfPpQwo84iL+CVGuIOTt0xxjiXZG/kbV9HDejgGAdBqWg/0tlIF/wBJg0WTXnlq
 UcUP7FCDoTgeFiH/OzqjeoHBs7Uej1vWkWmJga0lXwUAjcaEh7lndRgl6TWVjbHevmc4
 U4+qCbecQWK24fLhmocv4Vn/fHiyFPMlr7N9CsscpiobjZcXNPUYnm/fT5uYtODR/Ian
 0q5SEeoMPUMKhgayP3tvXT3yTyd/q0Y+6dS3BN3MWydqLwAM8vYusPDnn4fq+b+Bsa96
 it/0adyrubiFj1yZw+uaHx8ACzMvQb26jeKACaZ3fgPvZTIcgy9+8ttzjjiJMI+674wf
 yXwQ==
X-Gm-Message-State: AOJu0YyEQgZW5I+6nyMM61r/ZGvKzDSnsZQLbuNtq3SLnS+/7HJEGbQe
 cHxilSIj435kQ+UOOYlnSXM5yQw2ihrn6qHtIRWlgj833Uahdg==
X-Received: by 2002:a50:ab12:0:b0:557:2029:de30 with SMTP id
 s18-20020a50ab12000000b005572029de30mr635559edc.27.1704476892521; Fri, 05 Jan
 2024 09:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20240103155337.2026946-1-sam@rfc1149.net>
 <20240103155337.2026946-3-sam@rfc1149.net>
In-Reply-To: <20240103155337.2026946-3-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 17:48:01 +0000
Message-ID: <CAFEAcA8k22X+8Ypw_gvpsFHVAm=pHnB2-_iVNwyMrHhhyP=JRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm/armv7m: alias the NVIC "num-prio-bits"
 property
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hxF0xJ/RnbPN

On Wed, 3 Jan 2024 at 15:53, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> A SoC will not have a direct access to the NVIC embedded in its ARM
> core. By aliasing the "num-prio-bits" property similarly to what is
> done for the "num-irq" one, a SoC can easily configure it on its
> armv7m instance.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> ---
>  hw/arm/armv7m.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index d10abb36a8..4fda2d1d47 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -256,6 +256,8 @@ static void armv7m_instance_init(Object *obj)
>      object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
>      object_property_add_alias(obj, "num-irq",
>                                OBJECT(&s->nvic), "num-irq");
> +    object_property_add_alias(obj, "num-prio-bits",
> +                              OBJECT(&s->nvic), "num-prio-bits");
>
>      object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
>                              TYPE_SYSTICK);

There's a comment in include/hw/arm/armv7m.h which documents
all the GPIO inputs, QOM properties, etc, that this device
has -- that also needs a line adding to it for this property.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
