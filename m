Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4497326lfb;
        Tue, 7 Sep 2021 01:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBofm4z4FttSTwC8ucg1U+68XSXDtjW0oqwOuHMxuqcEEoAcBdvbcpm2UwRR5cGsnWWBDN
X-Received: by 2002:a25:540b:: with SMTP id i11mr20926082ybb.139.1631003127404;
        Tue, 07 Sep 2021 01:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631003127; cv=none;
        d=google.com; s=arc-20160816;
        b=erRwQ3PpXk5ZeH6Be+9xofojhfn6FaUGsVmwVV/kDWn6IcUZ1u0fXjsAfuEmEvLp5/
         aIshbOZ0ExQ0t97REhc28z228heWHIjo6en67vViTNALcWfholW6GEqmAd2XwUWtrqVR
         tv3ELta8nEBhpdW8N/XFp8vIqd6hvyqf25UlXuHnNDVNM0n2shR09qGXttyPxfqqdq2L
         u5r1ixwIf86Prenymq0yF9PTBS5Ii6BPmsiTNO99WFBKk5qoWoB1P4yua5rNwVn0Mebr
         nfP6i/CBex+WVSIaQ8Ukxxz3kKEpRQ1bPPgZ75gY8b0O8Vq6qqUktcyeWGqcOFVerU6q
         3FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4WdERIj4yJIC2Y4OE0YBud9k/nAUYxJqXzOQljQUMg=;
        b=GkZG+TtyvUnwgA5rYov098d16gK7C2dvL3hOeh0NWh/3zj8CkVN7XlzceoaTs7Y56b
         1PoNTzJsueO7n1M/mjYQ+w1AW4A2aq22jqR39SQN5t2ePfoBXhvR0Pk6liSPCohhJzrW
         tJZ5PV/uGV4sDzjgOVzPm9CX7fHEfkjxBzCtAf9pv+3f6RMk7qkRbFCPu30ru9DoTBoR
         UVplhvj9OFm+o3uQNCzXZiRdRTD6/+wugU2RjoirSymZvLgleN6ZdhOva8tjX1aci/PQ
         6x5OD+ughPBicpGat+LUQFbZWMek5xTZxyUUUpRZRXuUSWbLYPWYDBT8KTZVjNeaicmo
         V60A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ShuUjM68;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u81si10293399yba.217.2021.09.07.01.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 01:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ShuUjM68;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNWQ2-0000GS-En
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 04:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWPX-0000CN-FP; Tue, 07 Sep 2021 04:24:55 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWPT-0005wy-QW; Tue, 07 Sep 2021 04:24:55 -0400
Received: by mail-qv1-xf29.google.com with SMTP id p17so5318209qvo.8;
 Tue, 07 Sep 2021 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4WdERIj4yJIC2Y4OE0YBud9k/nAUYxJqXzOQljQUMg=;
 b=ShuUjM68xxosBMmxc4VhUkUPIwc1rFJowKZhDPR+norBwHo0I8pxuUhov+sVkudK23
 CjlW3XOewEhLozIWUQbF2ox0R/mMx9xl+4E3+/YPbklwuAUSTIaP0zFBlidtN2pIKyMP
 z1ZXs6iYTRJvYeAuIoNMLJvoSZ2OJg8YwJCZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4WdERIj4yJIC2Y4OE0YBud9k/nAUYxJqXzOQljQUMg=;
 b=OnXPgyLSbYsa/r7E/KxobFVO9Pweu2WFrT++G7+glhEKulrzeo9lFxVO/ZHgrKQT71
 jcQ3gwx47Ji0TK2FWjg89Ua0LTR7IjdeFtFlh9x1cziV8X3aBXg6KsRf/6bO2IJYbcjf
 HtBLOIvbSkxObsq21mibMQwNEzuSVfVc0f6u3U0OxNTcnR0H0fuy4eCuOH6ATp8R9J3a
 1XgZU19oqNL5beW5PqcUU68FLwkzKz9E0gMEVFkf7+s83lPhI+dPRtvpnlSsbZ0bmnJy
 ikry4OsGimHRRxR7azDbuwHmVFJ/SSN69aIvy3jYcV2pyO9hm5eWDg9EtiZ+VTJqUPJZ
 +giA==
X-Gm-Message-State: AOAM531njguIuYEj3g7c25e6Y96ssXJfcoDTUy9326AOM4mm1pDF79Py
 hSRrmnS/m5e76FIID/G0hnlLe/RIsPxje248KZs=
X-Received: by 2002:a0c:ec02:: with SMTP id y2mr16022934qvo.43.1631003089997; 
 Tue, 07 Sep 2021 01:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210906134023.3711031-1-pdel@fb.com>
 <20210906134023.3711031-2-pdel@fb.com>
In-Reply-To: <20210906134023.3711031-2-pdel@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 08:24:38 +0000
Message-ID: <CACPK8XfyxtB2v8i4hprSgJZj3Tm9P8e7a456UKv=64gHZs-jiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock
 selection registers
To: pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4aQeuegtJt+

On Mon, 6 Sept 2021 at 13:40, <pdel@fb.com> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> UART5 is typically used as the default debug UART on the AST2600, but
> UART1 is also designed to be a debug UART. All the AST2600 UART's have
> semi-configurable clock rates through registers in the System Control
> Unit (SCU), but only UART5 works out of the box with zero-initialized
> values. The rest of the UART's expect a few of the registers to be
> initialized to non-zero values, or else the clock rate calculation will
> yield zero or undefined (due to a divide-by-zero).
>
> For reference, the U-Boot clock rate driver here shows the calculation:
>
>     https://github.com/facebook/openbmc-uboot/blob/15f7e0dc01d8/drivers/clk/aspeed/clk_ast2600.c#L357
>
> To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
> 13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
> "low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
> are configurable themselves:
>
>     UARTCLK = UXCLK * R / (N * 2)
>     HUARTCLK = HUXCLK * HR / (HN * 2)
>
> UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
> HPLL clock rates, which also derive from complicated calculations. Long
> story short, there's lots of multiplication and division from
> configurable registers, and most of these registers are zero-initialized
> in QEMU, which at best is unexpected and at worst causes this clock rate
> driver to hang from divide-by-zero's. This can also be difficult to
> diagnose, because it may cause U-Boot to hang before serial console
> initialization completes, requiring intervention from gdb.
>
> This change just initializes all of these registers with default values
> from the datasheet.
>
> To test this, I used Facebook's AST2600 OpenBMC image for "fuji", with
> the following diff applied (because fuji uses UART1 for console output,
> not UART5).
>
>   @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>        }
>
>       /* UART - attach an 8250 to the IO space as our UART5 */
>   -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>   -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>   +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART1], 2,
>   +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART1),
>                     38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>
>        /* I2C */
>
> Without these clock rate registers being initialized, U-Boot hangs in
> the clock rate driver from a divide-by-zero, because the UART1 clock
> rate register reads return zero, and there's no console output. After
> initializing them with default values, fuji boots successfully.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/misc/aspeed_scu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 05edebedeb..a95dca65f2 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -119,6 +119,8 @@
>  #define AST2600_CLK_SEL3          TO_REG(0x308)
>  #define AST2600_CLK_SEL4          TO_REG(0x310)
>  #define AST2600_CLK_SEL5          TO_REG(0x314)
> +#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
> +#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)

It would be consistent with the existing naming if we dropped the
_PARAM. Not worth re-spinning just for that though.

>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> @@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>      [AST2600_CLK_SEL3]          = 0x00000000,
>      [AST2600_CLK_SEL4]          = 0xF3F40000,
>      [AST2600_CLK_SEL5]          = 0x30000000,
> +    [AST2600_UARTCLK_PARAM]     = 0x00014506,
> +    [AST2600_HUARTCLK_PARAM]    = 0x000145C0,

These match v9 of the datasheet, so they look good to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>      [AST2600_CHIP_ID1]          = 0x88884444,
>  };
> --
> 2.30.2
>
