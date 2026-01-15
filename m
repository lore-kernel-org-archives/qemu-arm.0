Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EFD46607
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 17:46:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgRQ4-0000R8-Gk; Thu, 15 Jan 2026 12:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRPR-000078-Uo
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vgRPP-0007D4-8e
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768499121;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwuuURJOphYbKG+K5Cg50gwJY5ISiq0Af9cSrz+ssII=;
 b=T7aGKkaygW1//TcY6PQFgYu7IIjWhLCVHoqP+6cJNnD56PwlmOx8cH0KmcOWyo+CdoKIFs
 Ypctoat+DVY80XSKIof2eV2tEDGsF0bRRJlX+LiivdSWadnr7PVn0s9yLevKfGYoUUr6y8
 YYcU1H1c8BST4/zowPhleIdnx1uXm6Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-CJmpbYcmPOqyHvVeJz0_XA-1; Thu, 15 Jan 2026 12:45:20 -0500
X-MC-Unique: CJmpbYcmPOqyHvVeJz0_XA-1
X-Mimecast-MFC-AGG-ID: CJmpbYcmPOqyHvVeJz0_XA_1768499119
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-431054c09e3so1111761f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 09:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768499119; x=1769103919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwuuURJOphYbKG+K5Cg50gwJY5ISiq0Af9cSrz+ssII=;
 b=oZbs87hOnqczVyO9YEh6WUlx1JwwdxQVGgY0lJycti7hIowJEpKEMA1dtedM9GGAfJ
 3bN98f9kGtSgzast+M2BgHvIxP7BOkkBwX6vFQTjIdqU1YNADkzYZnHzAsrXZxND2u1H
 NA96P0uYpK123Ld6OToUHLqoA8kQafOLIkizmNf5j479s5BlVSZoqk+cpfLWn9s0SzAE
 OPSrXhhATIZtb0+32ywEZHTF+66o5F3o+ch6owmvBjqknIuHK3Jsmz9gUU0RJJsmjAGy
 Wul0GUtUIcC6upc87DuBHUANCxWJSKps0XzxYZE1ZRXRTvhttMmUW7JnELWV+ZFwD9u/
 x4Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsfm+5B6Y4b3dW5E4qep06jYzBHbJEjOxLRl3vDdAejd6nbsfp4z3o1DFU6SzttRw70YcJ3Yq/EQ==@nongnu.org
X-Gm-Message-State: AOJu0YwRCiT6w2n4Ckwf8IvoVPSnToe1Vouz5ynGgMoogIsxqclhUG7W
 Jiiv8pO00ZnfV4wSBtv6c8mnzIHYXym6LYR5KfOTDfJEenp4s2pHPPZ3kEiRX6rvS3JXaVSQU0E
 ac3Fx9ID5sUqLcMu+MYJs7/R91sBj68NM2XFncnjvGScxk74xyUEFKQ==
X-Gm-Gg: AY/fxX7DTPk5po770N6j/nZTbhyI/by6uYs0i+JB/v241ekInx4PfpmAZsBioGpHnjJ
 Ngqp10t9us6Otfc7+OOp1AKLK95NjjXZhjxsW9Tm5X7JRmyxvWAkIG0LQWiz30C+MKp0d2Z1DO1
 vqs9c4lnCCHd19FxhEDr25JWSS3+km+SUYckWeNfK51PfyIL4UizXnrhndYMIyLb0VaHOI0VJ4z
 53LWNZM/Q981Ya7Pp09/Kdb+I++K50lbLjvAlBAg6+myEiO8Z87X4dvt+fV9ZjFDBxEoCA+ckmF
 i2zSqeyeEG8grg50y5aknw09mrU2/OrUbDn3Ca7Y/UJ1nzEnw+jaotq8zaqv+O2D0CyeON1TjQ5
 TjfcNtfFKL4Eqt9USuDXmGaVVW81gL4C3CByr0NU3U99eVJ9WPgmp0UU1qw==
X-Received: by 2002:a05:6000:24c6:b0:432:bc90:2cfa with SMTP id
 ffacd0b85a97d-43569bbd3e8mr230596f8f.33.1768499118997; 
 Thu, 15 Jan 2026 09:45:18 -0800 (PST)
X-Received: by 2002:a05:6000:24c6:b0:432:bc90:2cfa with SMTP id
 ffacd0b85a97d-43569bbd3e8mr230563f8f.33.1768499118565; 
 Thu, 15 Jan 2026 09:45:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dedsm295479f8f.9.2026.01.15.09.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 09:45:18 -0800 (PST)
Message-ID: <eb30eab5-40b4-4635-aeab-6e7b62c233fe@redhat.com>
Date: Thu, 15 Jan 2026 18:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 5/7] hw/arm/smmuv3-common: Add STE/CD set helpers for
 repeated field setup
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-6-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251224034647.2596434-6-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bXtBFqFyp7ctC4VwkXBS1OM10anRaE4Mxa1Omx4sHek_1768499119
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/24/25 4:46 AM, Tao Tang wrote:
> This change introduces STE_SET_* and CD_SET_* helpers to centralize and
> simplify repeated field setting logic.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/arm/smmuv3-common.h | 79 ++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> index 7f7dd02221..0c6c162288 100644
> --- a/include/hw/arm/smmuv3-common.h
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -100,6 +100,37 @@ REG32(STE_7, 28)
>  #define STE_CFG_ABORT(config)      (!(config & 0x4))
>  #define STE_CFG_BYPASS(config)     (config == 0x4)
>  
> +/* Update STE fields */
> +#define STE_SET_VALID(ste, v)                                                 \
> +    ((ste)->word[0] = FIELD_DP32((ste)->word[0], STE_0, VALID, (v)))
> +#define STE_SET_CONFIG(ste, v)                                                \
> +    ((ste)->word[0] = FIELD_DP32((ste)->word[0], STE_0, CONFIG, (v)))
> +
> +#define STE_SET_CTXPTR(ste, v) do {                                           \
> +    (ste)->word[0] = FIELD_DP32((ste)->word[0], STE_0, CTXPTR_LO, (v) >> 6);  \
> +    (ste)->word[1] = FIELD_DP32((ste)->word[1], STE_1, CTXPTR_HI, (v) >> 32); \
> +} while (0)
> +#define STE_SET_S2T0SZ(ste, v)                                                \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2T0SZ, (v)))
> +#define STE_SET_S2SL0(ste, v)                                                 \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2SL0, (v)))
> +#define STE_SET_S2TG(ste, v)                                                  \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2TG, (v)))
> +#define STE_SET_S2PS(ste, v)                                                  \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2PS, (v)))
> +#define STE_SET_S2AA64(ste, v)                                                \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2AA64, (v)))
> +#define STE_SET_S2ENDI(ste, v)                                                \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2ENDI, (v)))
> +#define STE_SET_S2AFFD(ste, v)                                                \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2AFFD, (v)))
> +#define STE_SET_S2S(ste, v)                                                   \
> +    ((ste)->word[5] = FIELD_DP32((ste)->word[5], STE_5, S2S, (v)))
> +#define STE_SET_S2TTB(ste, v) do {                                            \
> +    (ste)->word[6] = FIELD_DP32((ste)->word[6], STE_6, S2TTB_LO, (v) >> 4);   \
> +    (ste)->word[7] = FIELD_DP32((ste)->word[7], STE_7, S2TTB_HI, (v) >> 32);  \
> +} while (0)
> +
>  /* CD fields */
>  
>  REG32(CD_0, 0)
> @@ -169,6 +200,54 @@ REG32(CD_5, 20)
>               (((uint64_t)FIELD_EX32((x)->word[3], CD_3, TTB0_HI) << 32) | \
>                ((uint64_t)FIELD_EX32((x)->word[2], CD_2, TTB0_LO) << 4)))
>  
> +/* Update CD fields */
> +#define CD_SET_VALID(cd, v)                                                   \
> +    ((cd)->word[0] = FIELD_DP32((cd)->word[0], CD_0, VALID, (v)))
> +#define CD_SET_ASID(cd, v)                                                    \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, ASID, (v)))
> +#define CD_SET_TTB(cd, sel, v) do {                                           \
> +    if (sel) {                                                                \
> +        (cd)->word[4] = FIELD_DP32((cd)->word[4], CD_4, TTB1_LO, (v) >> 4);   \
> +        (cd)->word[5] = FIELD_DP32((cd)->word[5], CD_5, TTB1_HI, (v) >> 32);  \
> +    } else {                                                                  \
> +        (cd)->word[2] = FIELD_DP32((cd)->word[2], CD_2, TTB0_LO, (v) >> 4);   \
> +        (cd)->word[3] = FIELD_DP32((cd)->word[3], CD_3, TTB0_HI, (v) >> 32);  \
> +    }                                                                         \
> +} while (0)
> +
> +#define CD_SET_TSZ(cd, sel, v)                                                \
> +    ((cd)->word[0] = (sel) ? FIELD_DP32((cd)->word[0], CD_0, TSZ1, (v)) :     \
> +                             FIELD_DP32((cd)->word[0], CD_0, TSZ0, (v)))
> +#define CD_SET_TG(cd, sel, v)                                                 \
> +    ((cd)->word[0] = (sel) ? FIELD_DP32((cd)->word[0], CD_0, TG1, (v)) :      \
> +                             FIELD_DP32((cd)->word[0], CD_0, TG0, (v)))
> +#define CD_SET_EPD(cd, sel, v)                                                \
> +    ((cd)->word[0] = (sel) ? FIELD_DP32((cd)->word[0], CD_0, EPD1, (v)) :     \
> +                             FIELD_DP32((cd)->word[0], CD_0, EPD0, (v)))
> +#define CD_SET_ENDI(cd, v)                                                    \
> +    ((cd)->word[0] = FIELD_DP32((cd)->word[0], CD_0, ENDI, (v)))
> +#define CD_SET_IPS(cd, v)                                                     \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, IPS, (v)))
> +#define CD_SET_AFFD(cd, v)                                                    \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, AFFD, (v)))
> +#define CD_SET_TBI(cd, v)                                                     \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, TBI, (v)))
> +#define CD_SET_HD(cd, v)                                                      \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, HD, (v)))
> +#define CD_SET_HA(cd, v)                                                      \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, HA, (v)))
> +#define CD_SET_S(cd, v)                                                       \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, S, (v)))
> +#define CD_SET_R(cd, v)                                                       \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, R, (v)))
> +#define CD_SET_A(cd, v)                                                       \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, A, (v)))
> +#define CD_SET_AARCH64(cd, v)                                                 \
> +    ((cd)->word[1] = FIELD_DP32((cd)->word[1], CD_1, AARCH64, (v)))
> +#define CD_SET_NSCFG(cd, sel, v)                                              \
> +    ((sel) ? ((cd)->word[4] = FIELD_DP32((cd)->word[4], CD_4, NSCFG1, (v))) : \
> +             ((cd)->word[2] = FIELD_DP32((cd)->word[2], CD_2, NSCFG0, (v))))
> +
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)


