Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA951CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 08:08:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRmqB-0003nE-En; Tue, 26 May 2026 04:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRmqA-0003mm-4y
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:08:42 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRmq8-000271-KR
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:08:41 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-651c5d525f6so10236394d50.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 01:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779782919; cv=none;
 d=google.com; s=arc-20240605;
 b=N85WSYuOugm8OaogXlmBF20dpfmpidxh6N8z63fKFjEO4Q8cV1Qin039gMvr/lxYFX
 h4GR1lgrGPbH+SsLbJncBOIf2uklS1ElPP+3Qt8PzWrj8GFJsYMhfJmSlJG8Jm1toBAx
 iNrCbB0qE/EI7H1gSZNnLKT5CA/x0AXQ4e0CaYmxvPN+7PRR7LqXLr7uocZGli4h2Kde
 75FbgHJ6ojteWurCl9js4B9WPDu62zn1vkrX+qYStRAJ5OCCnXktkOpnQ+1kqvua1nRq
 2Ung+poZlCInZRujklRPdGLE9gyk366JX42A1LRSAAQvWSh3U30RlHr2qE1ZE4GFAHP7
 kLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=U5DfpMlxZVRYI5k81JFixfaDChV2TY4u44UT/G4IMUc=;
 fh=3z0T13svTYu/Ux0QedLTuuTP3oBpX+3MVkvK4PsRIeI=;
 b=eAgAWsWAIQIkU/nkEYUL6UisJm+PnfGScfQJy8FCqiJOnrKppbFfgpeXad3boS2LDn
 ml7sOJ6CNZRnY/TsUFTegHyySkgey8OX+P2a5f4ibOireUFcllru3TefF6Go29geUdl9
 Y/220PzB1fwLEaEY7IfnVF0MrkE0FCxApS95rq1y12BnHCil4IpSCJKeCQEzjxNnp3ax
 gjybkMLcKyb3KC8WXNyrmPOB9xf0LMKymZb2iGCG4J6io8RuZgpM6rK9PrGyC2GK6EQf
 Wv7IottduL4wZJV1IplZN5w/W1uuI5JDqdRBufJU5W3rZ/eit7pZ9wR37aOKh1TfO+6t
 5wxg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779782919; x=1780387719; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U5DfpMlxZVRYI5k81JFixfaDChV2TY4u44UT/G4IMUc=;
 b=N6/zhXHEMrxgG7ZYcl4ZIYynSC11YTxbrVfhwJF3Tcbd20ZNosVDrTBtleQlDUIODl
 a1l5dMiXzq9sGvI4RxeeAPbPogPizvWo1Saipre/wFWsMm94nwWWr10Zi2jNoP739y1M
 p/sqPSKFATlDuqEByq1njOJfKxbeJGpheUuEaHgA9J4abhjHj9sgDt3ra4zetHJIliUm
 UuPyAPyMRKFJFZceM9VK0mlojDbdIARtwUZGXPdAO8YXg+BZr7Ki1kN3BIC9kvOqcX5j
 rbnQwtNK4VS5BNeeiz0mwsLagDqiCTcthX7ur69Qh9RJFZoLdblEOZEGYbJvo+VB/sfI
 SB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779782919; x=1780387719;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5DfpMlxZVRYI5k81JFixfaDChV2TY4u44UT/G4IMUc=;
 b=d9F3R8pKdSGDXoTu2/0iRtdcZPAd0RFOEfkJHOAk9IdZRTGb6iBTDiop9AOLKFClfI
 YyuYSKvzFP67xulnRHyGki1DGAyBrXox4k3i8F1HZ/PdfGrtrEtvv+JPiZHVurLUD8om
 tCXYuyPFNknYWEdrDMlMxCBV8t1+q+ZJUIzxxRCRYMRiluRK0nqpTQUhmZUEHN1oNgeE
 Iib7TV4nuJHuKvM+VXJBCZ9rSNuCzxlrCkhI5s9JEHb+fcm4UWTKp7eqWFfPvoeT9+/k
 6KHVw81aW07lTo2OwU4VerzMkaGz5BwYTCIcAOZ43idWkwiwdvHg8g7Fw+I5PUrKPsN8
 lTSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+aZWTTfZNnqi67mGS/8Uc5ce7LEmXB/8hWzQAODFQY6IUpLJM+h3Audlpq1ZvlvMPd4vutlWnoAg==@nongnu.org
X-Gm-Message-State: AOJu0Yx83LN5HzFzIz4id5JfKaA2qXlRSLfR4taU+vB4035VXrD1YWKc
 oWk6Jf0eLcZ141SuLhlv4XJc/EI2moX1mgp8l87OS0Q3URfFHk59k2hnI5b+8hd+lX205ps4y0b
 QXfvMRaUFSqPpdCIf00L6e5misVmE1c0742cF2tt+0KQjN9Ebk3XG
X-Gm-Gg: Acq92OEyDurkfKqOHsnB4at03Y8y3Bf8PkrDS5NceetttQdsQAjGfMbWkIdE2Q27lYR
 PIpyCUJ+X5MO6X9now7Bk4CpmDcII1Qrif91JngAX8W3uSVwlNMebvdTuN98WsUsOXgoKuuslzf
 b8lD1i3vEbr1qgkBIYuwE+J7g39HDEJJsRSYfUnoicjh9qiMgBEKM9jqzKVHsc25LE25KAiWU9m
 3i6c+Kh7xn+slc9XY6zr+8KS+ibpigKtQx9XILMC96VCGkQtkjlv9mzWP/BmgENUCYZNvOpsbpi
 NcklxPl2rkOPqzlt2wIqCAgQbzkwLfYr4ejjFkGZilijp1cNCvW6173SwBRto7LC140=
X-Received: by 2002:a53:acd0:0:10b0:65e:14b6:b1ce with SMTP id
 956f58d0204a3-65ec96337c7mr13756559d50.9.1779782919057; Tue, 26 May 2026
 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260525032634.7754-1-nicholasrighi@gmail.com>
In-Reply-To: <20260525032634.7754-1-nicholasrighi@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 09:08:27 +0100
X-Gm-Features: AVHnY4IaJjBVqZSYxM5YT6vuritWXZQIawL5wLxbuYri-rsE00EpCcdn2BNIIb8
Message-ID: <CAFEAcA83RtkukDbExv72YztjHZkhLy8JyOc49gY3eaKoW-5jKA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2838: Route I2C interrupts to GIC
To: Nicholas Righi <nicholasrighi@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Mon, 25 May 2026 at 04:26, Nicholas Righi <nicholasrighi@gmail.com> wrote:
>
> The I2C interrupts are only routed to the legacy interrupt controller. This means
> that for modern device trees that use the GIC, the interrupts don't work. This patch
> re-routes the I2C OR'd interrupt from the legacy interrupt controller to the GIC so
> I2C emulation works out of the box with current kernels.
>

> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
> index c14a854046..6895f70385 100644
> --- a/hw/arm/bcm2838.c
> +++ b/hw/arm/bcm2838.c
> @@ -184,6 +184,9 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->aux), 0,
>                         qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_AUX_UART1));
>
> +    qdev_connect_gpio_out(DEVICE(&ps_base->orgated_i2c_irq), 0,
> +                        qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_I2C));

We already connect this output from orgated_i2c_irq to
somewhere else, in hw/arm/bcm2835_peripherals.c:

    qdev_connect_gpio_out(DEVICE(&s->orgated_i2c_irq), 0,
                          qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                 BCM2835_IC_GPU_IRQ,
                                                 INTERRUPT_I2C));

It is not possible to connect one GPIO output to two places
like this -- the second call will silently override the first one.
You need to create a TYPE_IRQ_SPLIT object, connect the
output from the device to the input of the splitter, and
connect the outputs of the splitter to the legacy interrupt
controller and the GIC.

thanks
-- PMM

