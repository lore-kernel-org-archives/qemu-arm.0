Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1816113ejb;
        Fri, 4 Aug 2023 08:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnPX/VaFPiUqS7QJ+lv/utUOTmpOL/PnIilyRxY2VFgBwNaVfMUwaO2c3H9O1TVTHa03gY
X-Received: by 2002:a05:622a:250:b0:403:e9f6:e222 with SMTP id c16-20020a05622a025000b00403e9f6e222mr2908250qtx.46.1691161762570;
        Fri, 04 Aug 2023 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691161762; cv=none;
        d=google.com; s=arc-20160816;
        b=TAOYTzVlD9b2EHYL+qlNxTprNPC/XdRsTaRAKwZGoNocMORX0tO0h6yKoP5AwG1qew
         ORf6wtiSe4sRumFAqWDwQZRAVkoYxXhMz8JQ+/lc2qQgNYShcsR/SFr0S4obb3bADcGu
         trN3eGe/CLwGK3TAu3E8QnPBwQHVXLIirioWAg25QzG/t+F+LJj8Tr0NY8HCY5pU9Zrv
         lVuA0YAzEmUGLqF63kZZPFl4xn4UkP2WHpQGY0ZelmbpfcD6s8FeJZm7vwjEFcIe5Lk7
         LOz0iDBoLN+Ka+shofGYLaCGVj2dICCEFJEvNDvhoHu/s+x9xopK3cJ7BfihQhyQbcjW
         yrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PSIudIEBCIZ1jyWuudsIo2x6qf9/8HsT8NqufiyED7A=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=GoP+xkSNQyT1ZL5ywEXhZwrKhzOuY8QN8r5fgEcjkHikoSaC0/MGk1sOkL7n+ynuDj
         lUDIgXIg1sOgtyaW06Yg3Fn6Pic1IuZkHZ1rXkg+NOgZGAZAsbZnEvB7vtHPqfho8OkB
         fXlTpLc9MyAcb3ISWNFLT8IbxMV3CeWm+SASrAyyE1Q5ESpFvO6kFoigsE5I77OW0Ceh
         oeUZHe2nUbWGG/LTHw/HiHO/GoyWlmLYSP+Y9QCHDVStIRpvzrqUNv/s52i6x7fEKPbS
         tOD86Ld1Y7eMraY+V2VN+Gsd3sjhxqVYewqjHouYQLU3N+oHeDlp+gXh6hcWnK3mHl2e
         Wdlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPdNvch6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020ac87f04000000b0040fd3340622si1408939qtk.161.2023.08.04.08.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 08:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPdNvch6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwQ4-0001lJ-L8; Fri, 04 Aug 2023 11:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwQ3-0001l2-E3
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 11:08:47 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwQ1-00060s-17
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 11:08:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-522462d8416so2781200a12.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691161723; x=1691766523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PSIudIEBCIZ1jyWuudsIo2x6qf9/8HsT8NqufiyED7A=;
 b=gPdNvch6Ax39li7dyprI3R5YptFG15bWhhdWBrORRp0RnomWPadtIpYf9GXqZKUL/c
 myhIdriZB3tGcgGjZIgmNNJ8uF9psenO3M2w/XRKdyyoBv98vyBW+qZ63NiS6wPdyfbS
 2PXtI4oJu5ioavMdE7+Mux1YU551BwSZvP4lE4CWUhdesxKaAHosjnMo3yCtzcq5Eqz+
 taBw6piqq0GpP2zmMX7LutYshWZwpDVdxME9q0FpbFmxUGfPR7xgIx6S8dCvd40/LT0b
 0o+45VYA+eCnHpjqeBIG4HUCwb7bh+h3U4qld9SIFt7dJpHw4Exh0IPHMkB3sExVKthA
 95Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691161723; x=1691766523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSIudIEBCIZ1jyWuudsIo2x6qf9/8HsT8NqufiyED7A=;
 b=b1MO1e/B3vzKPUxld9l2EyIfNEWM6uKTrwMBCzwra7KwkirtSoyFhoq9Zxh4Vt/5Ap
 +r+pacjA5kbhfd3dHMIuIIbAH0ADwfYOK5BWyvdICPqv+T3MQg0FLt6NN38jaIk+RNyq
 J00XW9rq6EmcKLs0noEnrm/aycmRtuwqTOZYG7oPrWPT4e0FR7xwTag40GyIo7yqQNwJ
 2sYEHNBUogoS4DWo8BNozlUYEQHU3nWWGq74n9Io+pUGv0bMUsJ+lzq+dXO/pSUWQIE2
 /o+ibnHlibn/hkbyPRB/FJBwpAwZx7ien12ai0S+A4v8er78gY3Ay68c93sUMweRFr7A
 OQFQ==
X-Gm-Message-State: AOJu0YyZWmvs56/dqDs/8Bi742IJiVOsl6pH6Y/mX2LeGxeslzBYBvYz
 kGEP74R2MEqBfMig5N9elWS8q9WMZIKp7f6aUKzmYOwuQ8ZIyStr
X-Received: by 2002:aa7:cfc6:0:b0:51d:95f2:ee76 with SMTP id
 r6-20020aa7cfc6000000b0051d95f2ee76mr1445463edy.27.1691161722929; Fri, 04 Aug
 2023 08:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-44-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-44-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 16:08:31 +0100
Message-ID: <CAFEAcA_-gHqH_te9qLDDvFHKwLPg=3=-kYxraT8ddrkxTJfQKw@mail.gmail.com>
Subject: Re: [PATCH 43/44] Add missed BCM2835 properties
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: RHwTUQ+ofYsn

On Wed, 26 Jul 2023 at 15:24, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/misc/bcm2835_property.c            | 170 ++++++++++++++++++++++++++
>  include/hw/misc/raspberrypi-fw-defs.h |  11 ++
>  2 files changed, 181 insertions(+)
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 4ed9faa54a..7d2d6e518d 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -19,6 +19,31 @@
>  #include "trace.h"
>  #include "hw/arm/raspi_platform.h"
>
> +#define RPI_EXP_GPIO_BASE       128
> +#define VC4_GPIO_EXPANDER_COUNT 8
> +#define VCHI_BUSADDR_SIZE       sizeof(uint32_t)
> +
> +struct vc4_display_settings_t {
> +    uint32_t display_num;
> +    uint32_t width;
> +    uint32_t height;
> +    uint32_t depth;
> +    uint16_t pitch;
> +    uint32_t virtual_width;
> +    uint32_t virtual_height;
> +    uint16_t virtual_width_offset;
> +    uint32_t virtual_height_offset;
> +    unsigned long fb_bus_address;

'long' type in a packed struct ? Sounds fishy...
'long' type for any kind of address is also generally
not the correct type.

> +} QEMU_PACKED;
> +
> +struct vc4_gpio_expander_t {
> +    uint32_t direction;
> +    uint32_t polarity;
> +    uint32_t term_en;
> +    uint32_t term_pull_up;
> +    uint32_t state;
> +} vc4_gpio_expander[VC4_GPIO_EXPANDER_COUNT];

What is this state doing here ? It looks like the property is
supposed to be changing the handling of GPIOs, but in that case
we should wire the properties through to a gpio device, not
just keep hold of the values written here. Simpler would be
to ignore writes if we don't care to implement it properly.
Otherwise the state needs to live in some device and be handled
on vmsave, reset, etc.

> +
>  /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */

> +        case RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_SETTINGS:

What's this one doing? 0x00040014 isn't documented in the URL above.

> +            stl_le_phys(&s->dma_as, value + 12, 0); /* display_num */
> +            stl_le_phys(&s->dma_as, value + 16, 800); /* width */
> +            stl_le_phys(&s->dma_as, value + 20, 600); /* height */
> +            stl_le_phys(&s->dma_as, value + 24, 32); /* depth */
> +            stl_le_phys(&s->dma_as, value + 28, 32); /* pitch */
> +            stl_le_phys(&s->dma_as, value + 30, 0); /* virtual_width */
> +            stl_le_phys(&s->dma_as, value + 34, 0); /* virtual_height */
> +            stl_le_phys(&s->dma_as, value + 38, 0); /* virtual_width_offset */
> +            stl_le_phys(&s->dma_as, value + 40, 0); /* virtual_height_offset */
> +            stl_le_phys(&s->dma_as, value + 44, 0); /* fb_bus_address low */
> +            stl_le_phys(&s->dma_as, value + 48, 0); /* fb_bus_address hi */
> +            resplen = sizeof(struct vc4_display_settings_t);
> +            break;

Shouldn't this return the same values as the existing
RPI_FWREQ_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT etc etc properties,
rather than hardcoded constant values ?
> +
> +        case RPI_FWREQ_FRAMEBUFFER_SET_PITCH:
> +            resplen = 0;
> +            break;

What is setting the pitch supposed to do? At the moment we
assume it's a fixed value depending on the xres, xres_virtual
and bpp (see bcm2835_fb_get_pitch()), so if the guest can
arbitrarily set it then we need to change something in our
display device model. Failing that we should maybe LOG_UNIMP
any attempt by the guest to set it.

thanks
-- PMM
