Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D761CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:58:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHL2p-0004WI-Vh; Thu, 15 Oct 2026 08:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL2n-0004Vw-By
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:58:49 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL2l-0002AH-N9
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:58:49 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-677af43eed4so4848230d50.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792069127; cv=none;
 d=google.com; s=arc-20260327;
 b=iIw9vViEh/CETtb4QA7/2oO0pCeILVFiW9ILzq1U20ltWd5WAaFnLGwX6MmAVEiU5P
 B8Jrp18JmBHFI/xQTkduCniKKrO6oa5Jdqt3/Gu0vPDqQSIum152Sqxg+hIBQFDJTbai
 ED6rajBaPv/vVu0G0m7TtK4+i7hNWMw8U5MxHbfstxhz7BzsEPXjzHxFVWONvFZLGPgX
 SqNjaZi21CRm7LIa60fJ4KBoMkVBt6LsimbWr1NnmurRzaVq4AcZPPXXpZZ3Pk8Ak6I9
 8UsZVLAA+S1dCO/QiwVTwE7MTpDw2nuYByp4ULr3U3GKV4KnxhFEyHWPVh68ncwxrvDJ
 fS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Y6dYryj+plDWbkbSNyxktgN1TwjBiV4Lix3Sp+BV40M=;
 fh=K+1T8CKMhM4b3q1gz625qdSMmA3t/cvjwELgMjBM0es=;
 b=EBnPZYClIeZKSDu88t/PXCGqXZoaHp2ur2eVFMc2C9OLzdPWcSsXxJLbewtOb/ETsh
 n8tkkC/SkFk1HL3Q7QQwihma6y9PT9DsoEEew04WSXpA/bHgvVqVW4leAAqQflxm9VT8
 0/ml8pDuIQi8pH0zyqs4GWjGXOv6IKRlPxoqV4s1fI8h09QkSNMVgzTUJSbzOyifSRt7
 NkZT26SX9MbhkVQxR5laQBpb6cyadJFsDVxZGWww7eETe/HlYjqmiGyF4SWGGlrvLZdC
 dR7zrnjTSFsMeAm97i2VVKOds51sN+lsMhhTkUgm2CN0PEaUKhq/xcjsNvZg/jmJOyne
 X1PQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792069126; x=1792673926; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Y6dYryj+plDWbkbSNyxktgN1TwjBiV4Lix3Sp+BV40M=;
 b=jm4WvL9UVqm8qU8Ku//R136s4SbOvZxks3vG/OAd8ppB9CLY1pkHWhvVFBxh/IfNvB
 MbTE3g5JPQaEBoZ2RISVJDaYare1r2siCW8FVSN56w8PBXa/6t7i7DWnapXfQYeklD+Z
 6dAsEVjEP4G56hSKDsz2E1lEeLaXpucdcB0rbQohy7bKyr4O0/tS31UuCTpX+meg9Miw
 oIYk7ozVmNaITpubepJTkkq/4bevJ0qCxrOUZe1WUvuRKHQ7bywsEDaINYtp2J5/O5e1
 9F6AUksnewwrZvxgvl7arXFHAcrTsRrAEZCuL9cCQB9zdoA3ikp0vOeYQYSs24sJr939
 /aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069126; x=1792673926;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Y6dYryj+plDWbkbSNyxktgN1TwjBiV4Lix3Sp+BV40M=;
 b=2i8RxFsSqCP8NL0K8mcK/9T60rbQC6ndn70UXM06HBoh5YxbtxuWNLpgKGc+mCCiMI
 ZrY2a8O8Vy7n4TXX5Tfrw3yrBWebtYxE706Ek4k5v8osMAcwFK3Qi6sD4/Uliov3D7CE
 WA7ZXXEvhtFMhabgCPi6/vmhPY2RfZyM5ECLDa5unJ0VICOBMmxAW+KtVHynDt53Qz7k
 X1uTjHYYndtUO2HRgzOX2XwHKG+DjO4qhW2n1UEZFgMEXD3u+cku+b6R1cp0zwgXx7Ee
 IIYzujdbwxQPPgGkz71CBr/VIDcGrubnxPwIqPKL3s7ZFjnn5zbZXPR8v2XfAxaCo3oB
 4D8g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwH+qQqm014okfES6JskZWc71QDAidfSrMJJWBP1b9oH6TBUtZDgh4fP/MjQc+t9pva9swTdK/0Jw==@nongnu.org
X-Gm-Message-State: AFq9FYJb/MzTcwGrzKWhv8TCLbEyhbFkMKcgh2Ic232raqsOvcgJbpNe
 8dMIsOhgocPaf73RwCS3nmINlFRX7HwJKuFEilhxLpcFGpzCTUTI+25b5a8gJeWEML9/JvVncj4
 XzLjVkD+VBzo1A7bP1Af6cj1JacL2zjkJPzNQ22qRdg==
X-Gm-Gg: AYBFou1yvPclUYNq6LCC/14V2tFcJMZ0IdNto/TM4nOJX/dwCpnVbZcanKdM3TDgS4n
 rc5no0Bir3+5Z2WbZ/v+RKp0h3ztoErBSm3Hlg1eIrNzl/Rx8dRfMixHuoxw7MUAZMfmouMwDAk
 9fsIcraaaopgVmrBqNOlkuKrPftazfdRc73+9ImM5uIQ7EvffToQEq+pOnw3J/XTuT6R/I/ArCk
 0liD9qaFVDmhRBZ4KWADEN9QM5ofG+RRGDfP4XTb8WbRCBWublJRu8PieYGucmzHu0kVpM1ieAa
 dXABA9JW1At76RlxkI1RCGxy0VxJzKl8IjLdg7XblgQ1kKy04RcYpt5+9R/j4onGMm+xOuZKXz0
 fwQBvhb41Jwh0BDiUlEtCcvj8rhn+kcluyGvaqBU=
X-Received: by 2002:a05:690e:e82:b0:679:a2f4:386e with SMTP id
 956f58d0204a3-679a2f43a01mr489584d50.9.1792069126353; Thu, 15 Oct 2026
 05:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260725012635.4925-3-marcelomanzo@gmail.com>
In-Reply-To: <20260725012635.4925-3-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 13:58:33 +0100
X-Gm-Features: AclHuK_2_79LIMsj823fFKwdwiEyEow-A-OBXYTjuA-vQWmhD7Ee4CCQ1lV0jIk
Message-ID: <CAFEAcA_BfVKY6eU_7O6uw=NDE0VYCU_ZVDdXcgZULnT-ztvfzA@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm/bcm2838: enable BCM2838 RNG200
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 25 Jul 2026 at 02:26, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Wire the BCM2838 RNG200 device (added in the previous patch) into
> the SoC: instantiate it in the peripherals block, map its register
> region at the real BCM2711 physical address, and connect its
> interrupt through both the GIC and the legacy GPU interrupt
> controller path (matching how the device's own realize() wires it,
> mirroring the pattern used for the older BCM2835 RNG on raspi0-3).
> Also stop raspi4b from masking out the "brcm,bcm2711-rng200"
> device-tree node, now that the controller it describes is actually
> implemented.
>
> Adapted from patch 16/41 of Sergey Kambalin's Raspberry Pi 4B series
> (patchwork series 829638) against current QEMU master.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>


> @@ -82,6 +85,8 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
>      BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(dev);
>      MemoryRegion *regs_mr;
>      MemoryRegion *mmio_mr;
> +    MemoryRegion *rng200_mr;
> +    qemu_irq rng_200_irq;
>      int n;

These are variables with the scope of the whole realize function,
but they're not actually used more than once. We tend to prefer to
write this kind of thing without the intermediate variable, as e.g.
  sysbus_connect_irq(dev, ..., qdev_get_gpio_in_named(....))

But we already do this in this function with the mphi_mr, and I
don't object enough to ask for a rewrite, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

