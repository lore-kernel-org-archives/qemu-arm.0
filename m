Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D420BC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:20:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x62r8-00021C-It; Mon, 14 Sep 2026 05:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62r6-00020I-Ci
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:20:04 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62r4-0006V8-Q6
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:20:04 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab20a33so1393920d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377602; cv=none;
 d=google.com; s=arc-20260327;
 b=BvF5kcpNxONdieUMa99BsDUt8a64DKLDPjZv/MMg2c8mqgiZ3be1SEBKw4xevqcQlr
 mlZQh7dNsu/Lq5WqVsI1EdrvwvO/wne3yXM66SigWWCLP8DI3Xa1rkIn25IA10zou3oB
 5OEBgl0auCr6i2w0iAkgGU64ZxSifSNhJL7yYAiT/L7HVVdNajfFZWtFRbKtkRCAHo/g
 OTQqnNfGwBG0XeXNi62yX2QfzyekBswbGF4CFIt4BXetmmFtHm6MjLOgD0Adl5eTrVT9
 EC2EqMwDAsLovMIysLDZBTbd/FEJc/Bgg+Ins4yLW2/NnDpUu5nyy2A39VL9KrayUt6z
 8tqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ChMphz73oEhFFunIG6+zJrLDiaHO4nPJODvJSHKWxV8=;
 fh=X29cdk10FGASJ86MXLw+0crmbM3r+5KgaaQPkl7jP3k=;
 b=TkA/yllsPUsi3gpJu/RpY2+D86LlOwb1iCtwZtQsyCs7cSfq6V88TOAtQPdrREEAU9
 RF6MqWUyJsTcOORWgiual3jSNkbd2JTb1yBYzriBWRz91TuDhaFuTrFgk7HBd/TXhMc0
 KCrl/z+srDx+WdZQPHeaNubyzF4MVowOdLQ+ORCU2VB5R0DY3Ne4GWAEnGWL5EaKmxP2
 fNhazxbxPiuOERaPsE0kfze8vjIoZa/KTzuD+mrh1+XKKBzeer8t/Ve1ev9Urn58YPSx
 IABX/XHhmxreG2NFOIaAcdT/+34airygc0rQ5RYqLbInssNHNTriYQrlUG91cvporLD6
 Hhlw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789377602; x=1789982402; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ChMphz73oEhFFunIG6+zJrLDiaHO4nPJODvJSHKWxV8=;
 b=D2V9XOSwzFOOGOZqXBF+xkKhQuvQDTFeJVKwGcEHRBjO10ZJoN0LD2BFqzAQn/NJzj
 CQ6NNJ+cHVAF6hykDZeiCweeBrAA5/MrwNgUhzMOR7z9IHuKAsejmO4KNFdd4I+MhCMb
 A3icoxlzChVoD5OzOCPIz17shf/k//QgoxKEzpmwBRYWGx8v9vk/9sjSaCZNOMr6oHJh
 LFLD0HbLR5WJ/g8SjNg/70P4xLahbPaq9oFxMs35oHxPkKuriaVb+uTqSfXHt4A65nnw
 O29dbAYUiLFP3mDqLE5RG83fFzTn3vuUGI6oheG6Kg+oSwkYrX4BZ33xuYzqgQgxwycM
 FeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789377602; x=1789982402;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ChMphz73oEhFFunIG6+zJrLDiaHO4nPJODvJSHKWxV8=;
 b=lCQs7wmCthNNSY871h0Cn+tZ9IBRpLAPtjHJJ/sjJSsGLMbejjKrWmWCE8SK3lQCwl
 S/CbR1V4HzB86WrQrUYn05nEyRmLHOLuFYFWDRjmoLMpsKc2iPRSi9UMJ04tjO3DsZtl
 ZTAPHwtFHr8KWWTpT6tiIwWkS+TQxLnk9DuT3YqFhglfQYf5ukHuvNMumQBBJI65Gl18
 R9MFBXY7OI5Ii6WxbePqFlE24GA4xU6Vn/JfyScBvLB6/TGl6mcLluOs5hYae/8GYpAf
 R+Lfqa4WqhmcnulpjfSaTyorKSaho7oKvXEfvHaKyaYjqwrAiRWsoMUfZ4DyqPn/azFZ
 CLrA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzn8wudjK7NhzmA9Rp6xScgHIkjo/S94fSGttDH9fFKH/WMTHwFevgWQZvITwAw+ZEW2cYCCscvVA==@nongnu.org
X-Gm-Message-State: AFuF++mc9RZCVTnM7w8BhLE1T762nQKWYXzaYl2Wcg7z6DKGt2w4pPgy
 wDjdhqmDbzshCaCcPN8oQnUxTe/p7MudRvk48uMDld4+dA+Az3vR+aFTJdzi8Kmu1hi/t/bpZM+
 9fYCmceDc4YMLr8j3UdgyQYF2tjBBW096kIAWnubYyw==
X-Gm-Gg: AYBFou0/N2jG+Ltfwuqle7tE9RewzQ54PiUAEQXd9gV7PL1A5PEL63Nnd24qQjXD0xx
 XrfKS/K7DxueeO6nfWX7bqTcpdIJECDSGHrGA29xaslJnKuhm086z6qZmMUNwHNfSeHmDSJoHfW
 Lf8wlM20mRFZK7TNSi5SOsCHohabXTJ3eY0WlGhfFIOR9BmMG+hwxH1qf8X+49JW1QzEJoaCmNG
 ugTAajCSoWjYlzO+cW7ByuDJilRS+L+WATcyBH08dy6CeEe6ZGKeS5UAS+DBtOq8lAoyTE7D0D/
 p6R/Zoow8omHslfkoNG0onO+Bq13ZnIHLF9m8NSgcS1SROUgRhYn4jd0FS3XCJs9+6cMUVE7RH2
 pwb5YUTJQNVJu2IPEJnsRZQIc0oqRAK2f21PN8+4=
X-Received: by 2002:a05:690e:4882:10b0:66f:c1bc:4086 with SMTP id
 956f58d0204a3-6714e07b20bmr167358d50.73.1789377596759; Mon, 14 Sep 2026
 02:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260904161438.3838261-1-bin.meng@processmission.com>
 <20260904161438.3838261-2-bin.meng@processmission.com>
In-Reply-To: <20260904161438.3838261-2-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 10:19:44 +0100
X-Gm-Features: AcwNN1XoQo60WGsTHuz10GYgcVA4-gqaXOKPsU1Sp-WlezIu1ocG451tdbpPBak
Message-ID: <CAFEAcA-p=UaNk-Qddid99o7zeGS4WqmvqAugxtjtBKZwv9ie8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] hw/arm: fsl-imx6ul: Add SCU compatibility window
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, 4 Sept 2026 at 17:15, Bin Meng <bin.meng@processmission.com> wrote:
>
> U-Boot's common i.MX6 CPU identification code reads the Cortex-A9
> SCU configuration register at PERIPHBASE + 0x4 even on i.MX6UL.
> The value is only used to distinguish Cortex-A9 i.MX6 variants.
>
> Cortex-A7 reserves this address and reading it causes data abort.
>
> The same U-Boot abort was discussed on qemu-arm in September 2024:
> https://lists.gnu.org/archive/html/qemu-arm/2024-09/msg00072.html
>
> Map only the four-byte configuration-register address as an
> unimplemented device. Its zero read result gives U-Boot the
> single-CPU encoding after the low two bits are masked, while
> the remainder of the reserved Cortex-A7 page stays unmapped.
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
>
> (no changes since v1)
>
>  hw/arm/fsl-imx6ul.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 1863558a0d..d6f662efe4 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -187,6 +187,15 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(mpcore), &error_abort);
>      sysbus_mmio_map(SYS_BUS_DEVICE(mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
>
> +    /*
> +     * U-Boot's shared i.MX6 CPU identification code reads the
> +     * Cortex-A9 SCU configuration register on i.MX6UL. Cortex-A7
> +     * reserves this address, so provide only the compatibility word
> +     * needed before the console is initialized.
> +     */
> +    create_unimplemented_device("a7mpcore-scu-compat",
> +                                FSL_IMX6UL_A7MPCORE_ADDR + 0x4, 4);

What is actually going on here, though? Why is u-boot reading
an address that's only here for the A9? Has this been reported
to u-boot as a bug? What does the real hardware do?

Whatever the answers are, I expect the correct fix is not going
to be "fake up this specific 4 bytes to ignore accesses in the
imx6 SoC model".

thanks
-- PMM

