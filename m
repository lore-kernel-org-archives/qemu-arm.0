Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp504231njb;
        Tue, 4 Feb 2025 13:34:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwcdlrfqKYLzQpdaZ/Bt8MCwRs0r0Nb84+Smh5PMxZnAITLWTrkP1j+V/yfztEga6P46paMjtqS0uvEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVVdOMfikeoOadmTXOHoShzyakMnDp+9/aqSbUPC9lRkNwyoSSce0v+7GoygPtX4j3IbuT
X-Received: by 2002:a05:6214:cce:b0:6e4:2988:bb4 with SMTP id 6a1803df08f44-6e42fcaceeemr4818296d6.45.1738704898035;
        Tue, 04 Feb 2025 13:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738704898; cv=none;
        d=google.com; s=arc-20240605;
        b=Gf2W3dHVbCLGvOOZOU3F3N/ygChKSEvLjmz2ophE035Ou3ZGdhz1KHnOBrCjNwqCaX
         U+IyWyCPY3PKGyQZCfKmEAZQQRmjth4sc8oBqwxYYm5Q1n9pfiboMY38ZGREYgQUgiId
         cf2QpV1FbRiEvu/Q2ABVkFoFy9h0ZZd5ZKc95OxS5rdPiGJHuxlL2Myeejo0oZqTOMLg
         xSK5DepIldlYWptBkZnDCo6a1YQH/v9Fb9Iz1RYPsXiV8dnhBNK3OvpWl+8a5lp8mdT8
         8WF7feIOV/l56SO7e5QcGnl2/CuJXmDFvvO6yg9I2eNLuEU0ilmE/lEsmNHjAS7FNcye
         SGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JZd6lZm3wur9Q2MoFfzKgFC7LsjWq642M+ueUKAtHoM=;
        fh=8JhNnT1tT9DTf0GOTzafaJkFGpk5NOQV6Ys4WwJDoOo=;
        b=PoHVOeMyy/VE8iwaG8Fgeuc7O0OLRv/e2J7+qpKKRngFI5kV5yvkPdBPiT/nLBvT84
         DFDP0U1PFcDLtUtSY/fTeZ5JWmFPYJujfZoDwoB20mv84u2Bc4xL174GmBEuhA+4ooWA
         LKcSL98LdUbKK/jlPsjt7QxYNO4Q3QgX7v9aqn189fcQPYXdLzbCNhoaVdguo4IIBHp0
         ioLJAwVT3WfHiBkCHllS/FQLNdZhlZBMFRjl+jpwrIbxKbyeQVqVSGWm4kWSMiz9vrEd
         bILShRP7h/sCTsB2+mpE9bACHcmI+obVAF4IuZPYKqh9zBoq6dh3jDtpDTy4Bte7br4C
         nHzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MGl+ZKww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41fec5dd1si39598136d6.312.2025.02.04.13.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 13:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MGl+ZKww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfQZ9-0003Dr-EI; Tue, 04 Feb 2025 16:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQZ7-0003DX-TV
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 16:34:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQZ6-0003Bc-4O
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 16:34:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso1274575e9.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 13:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738704878; x=1739309678; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZd6lZm3wur9Q2MoFfzKgFC7LsjWq642M+ueUKAtHoM=;
 b=MGl+ZKwwxhRioG0PTZb5hxN5CSH7woJJY+2w9GxepawFmudQlsR1Cbd9+HUPFqRy8h
 d5/gkbv0SzI2MAQRe5l3t/pJKbNeKAFfe+VyKabJaRhmQLeD2GSTcI+UE9sezjmKJxs/
 UwcHXLgoyhWZiZCf1bPOGx68xtP4zssnNceWU1vVBA/FwTY6Rrg0PC+7rgrq3nWI/Ujl
 9WtgBB6g3Oc53hwMbhZOtW3JAZycxuj8BUKGrAgH95n7l4Ihi2CJeyr/JIGVfDLKGXUD
 CAooLOgv0OKpAGjmu1Q+7QdZRPZvAWlC/Mj/aHU1utduloQk7eX/dMHvRz0chV26+7Ms
 whxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738704878; x=1739309678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZd6lZm3wur9Q2MoFfzKgFC7LsjWq642M+ueUKAtHoM=;
 b=v03dNHg5cWQBdldQ4K/d0/DTR5yc5q8TBhePD4RaVoDCP7/LTxt2VzLJzHvQZqo+VJ
 QGBNlf/qg0pSxip6YYJNg1jpJejmwmNW8NY5D2DWNH/rN7jH2p0wHvU4DuxuFNVd9yEE
 RirRBubA8VWzhCPsTnbb6zQd8fNoGw7v3KFaaO8SV/v5nM4eGCE5by89CdWoP1+vp9m9
 kZt48+SC+JCWBjAnO+abQWxoeZNmsYbvLdHB8hDq/NinDODjgN6O8mvtQy9jiZWC+NIL
 h5nXQDyuTAfKb5N3WFw5oE+6A10iboKlP6ezPAOxEMJ9M9/C90l9jT+40cJwrmhUU5P+
 RQ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7En1PfQSDQHqcc85/I+59ICVnFdU6WEKC8ePrkFp9zYo4HAn5uGgWgIiT5aHtcPMMMniuI8ahQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEksHENtL/Pe7BTp3AfUV9NPjhqdaq6mqgI6VrUTkgSmJ+WaiT
 QsImfCgnFVHTuvnjbbjeBx7h3Igm1cIVE2ALUMvAgVHAayQwmNKb8JC78hfktTA=
X-Gm-Gg: ASbGnctWeSQm+XswUeYrDkEAdrfht6oCQulVKm4adakdaZiU00JfUzqdIr1TsW4t2l1
 /eWz/Pr1CBnAdhCtfIr+rs+QWRDas2xCjPRmgAZSoNGVDcihrN692LnglM8HEtwMEDWlhbnBY5/
 Kgm8aSFBFU3psDhBACIlRdQWfdsDpVgQkgKE6mcR4u3VC5N99id0A5wGPWgOSiGuIG0SFuOM1QD
 XDMwamNsQK6s/ljlvWcS4SxYOx7s/2dnErKBEEc1I1ufVqVsOpfc4AuTJgW36Ek/kuVTXRX/Ip1
 BohQ1jX+L40TounE/FxjKAxvpz5xqtwy4wXp6AX7O+XBzE0jC68PTRqd3Kc=
X-Received: by 2002:a05:600c:138b:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-4390cf5f8ebmr3133985e9.8.1738704877969; 
 Tue, 04 Feb 2025 13:34:37 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933789sm500875e9.4.2025.02.04.13.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:34:37 -0800 (PST)
Message-ID: <34a2d961-738b-423b-9ef1-5f4a85915e67@linaro.org>
Date: Tue, 4 Feb 2025 22:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/17] hw/arm/xlnx-zynqmp: Use &error_abort for
 programming errors
To: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-11-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241108154317.12129-11-philmd@linaro.org>
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
X-TUID: 3C7gZNsgUCOu

ping for trivial review?

On 8/11/24 16:43, Philippe Mathieu-Daudé wrote:
> When a property value is static (not provided by QMP or CLI),
> error shouldn't happen, otherwise it is a programming error.
> Therefore simplify and use &error_abort as this can't fail.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/xlnx-zynqmp.c | 44 ++++++++++++++------------------------------
>   1 file changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index e735dbdf82..1770fb5402 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -689,16 +689,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>            * - SDIO Specification Version 3.0
>            * - eMMC Specification Version 4.51
>            */
> -        if (!object_property_set_uint(sdhci, "sd-spec-version", 3, errp)) {
> -            return;
> -        }
> -        if (!object_property_set_uint(sdhci, "capareg", SDHCI_CAPABILITIES,
> -                                      errp)) {
> -            return;
> -        }
> -        if (!object_property_set_uint(sdhci, "uhs", UHS_I, errp)) {
> -            return;
> -        }
> +        object_property_set_uint(sdhci, "sd-spec-version", 3, &error_abort);
> +        object_property_set_uint(sdhci, "capareg", SDHCI_CAPABILITIES,
> +                                 &error_abort);
> +        object_property_set_uint(sdhci, "uhs", UHS_I, &error_abort);
>           if (!sysbus_realize(SYS_BUS_DEVICE(sdhci), errp)) {
>               return;
>           }
> @@ -714,10 +708,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>           gchar *bus_name;
>   
> -        if (!object_property_set_bool(OBJECT(&s->spi[i])), "little-endian",
> -                                      true, errp)) {
> -            return;
> -        }
> +        object_property_set_bool(OBJECT(&s->spi[i]), "little-endian",
> +                                 true, &error_abort);
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>               return;
>           }
> @@ -767,14 +759,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       xlnx_zynqmp_create_unimp_mmio(s);
>   
>       for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -        if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
> -                                      errp)) {
> -            return;
> -        }
> -        if (!object_property_set_link(OBJECT(&s->gdma[i]), "dma",
> -                                      OBJECT(system_memory), errp)) {
> -            return;
> -        }
> +        object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
> +                                 &error_abort);
> +        object_property_set_link(OBJECT(&s->gdma[i]), "dma",
> +                                 OBJECT(system_memory), &error_abort);
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->gdma[i]), errp)) {
>               return;
>           }
> @@ -815,10 +803,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0,
>                          qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 0));
>   
> -    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> -                                  OBJECT(&s->qspi_dma), errp)) {
> -         return;
> -    }
> +    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> +                             OBJECT(&s->qspi_dma), &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
>           return;
>       }
> @@ -837,10 +823,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       }
>   
>       for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
> -        if (!object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
> -                                      OBJECT(system_memory), errp)) {
> -            return;
> -        }
> +        object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
> +                                 OBJECT(system_memory), &error_abort);
>   
>           qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "intrs", 4);
>           qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);

