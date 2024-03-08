Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1806117ejb;
        Fri, 8 Mar 2024 05:28:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXq94lpLqExfBScWbNtXJyCr93SaraXLVmwqEjQbXewLyjJrLnb/XJkXRjXpcmxfuHMNaYePX05ZKkGm6M6KeAPz+DbKi2F
X-Google-Smtp-Source: AGHT+IFKECBr0OhIRrhOdBnc0OT9bm9dK8x2OH8w2AH3N2NXNrpDIULraCUKkCHvOta5ewOohaYC
X-Received: by 2002:a05:620a:24d5:b0:788:242e:b2d0 with SMTP id m21-20020a05620a24d500b00788242eb2d0mr14351813qkn.45.1709904480770;
        Fri, 08 Mar 2024 05:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709904480; cv=none;
        d=google.com; s=arc-20160816;
        b=L3z8Oqlmjro1KPUh7w1j/tEoBsdXzSZJmFGB7UUVTtjIQG6aZoRgmi7JOJTQSQTSFJ
         KxxOMeorsCuVcOL074IMhj25g9BA52kkQJ1Sf2lt3yt9pShYNYa3aezFE06kUHPSrBUR
         ynzIDhW7VkrBIPRhI4U+E/TA3raSLnepGwx1NhjYBJwOU9rnHkUXqJlxr/bn4g/Lw7YV
         TxvF4QZSMWuVHoC0LymULlpngiWqocuF8ts9pYru+8aR9ZFA5VLCIVz48liD6vEiW5ej
         TJcesEM9tcsCqnHG95NTfFBoNWQSIs6HnMHt9dFHKFOUl/2rBCjpUiLEBgoULyOMtoyi
         fQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CMwrJpB/DJy52CSm232qW3g+OfPChW9UXY1c0q2947s=;
        fh=sDKSa0R9KCfbDQmB3aHc5jEVUhKJOQAfojDhM9XKu20=;
        b=PO0cN1p5HDxtMP0M2KfRuI9eS+jsigPj8VSyvv/xyogIBeD1cV7JXofUdX5nOfiGrq
         hr30vsbocmZQUFv7fx87rQRt2z4992SUHFKQy2goZ0qmDNliT+8vjYQ0VmB5VwQLbkJT
         QoLFtJvTjB4ku8oeVq4SbQltVTRj9+b7v5ajkClRyJYr4gk0JJTpg4/08Xs4VMTq0kKr
         70KUuuRwGr4wdQEJ/fWpLa7a5vvrqvmof48ZqvJZ+6d3mPxQk3HQxVKr3kcjxEtk0tSV
         8LfXQpy7u6KgTutrKbhrtJdBDG7TPfcc/yB0QLZKrNmY5iR5zDkcXFb+CtC1uuFLo6Yh
         j1oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MMMHMZ3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wg1-20020a05620a568100b007883bac6392si6570196qkn.49.2024.03.08.05.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 05:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MMMHMZ3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riaG8-0000hy-0c; Fri, 08 Mar 2024 08:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riaG6-0000gw-Cu
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 08:27:34 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riaFy-0003FM-Ri
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 08:27:34 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d33986dbc0so21702241fa.2
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 05:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709904445; x=1710509245; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMwrJpB/DJy52CSm232qW3g+OfPChW9UXY1c0q2947s=;
 b=MMMHMZ3a6slhGLtxNCDxVa7+Yqwkf4PXXbrx6rVTZ3D7sUD2xCTxVCvtNrI6vYyT7G
 gLb+UA4xzrw4YN6EAsb+nDBk8FZm/L80VG0EJZtNdEybD9wnJ1OqdS6+BUDpsOJsis0S
 2RbuNXtwV9iDtriMzFWHsDIQ5iYhONpfi85M15ltgG+xhz4m9tcGpeN+f+ouKWAKwZzA
 aam/2ASuoeWHACnABXEHDXLYjqguF/la2lFoTVAIkSoszWYRj6djDKGL4/SW5WMmGctA
 U4FsHc34YLyJvY5Nx6H7vXMeokOOAH74wN4nnb1mk5ryYyEoZird2GQcOvGG0Z0FCSYY
 pM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709904445; x=1710509245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMwrJpB/DJy52CSm232qW3g+OfPChW9UXY1c0q2947s=;
 b=CHsjKusNab3bvclGtiKuFvt6DWt2xUOucPZ8PgxRONDDrz5Un6+pRTQNc7VM5DKKg+
 AWp/WWtUrwT0gxQOXOQJLubxkzkLKQkN3fPGcK9xbWXEzf82Wlkcz+WpEAkZ+7ZeZNiz
 sMPxZzU3KLcXeuy/BppAVaTyQ8eNITzT4Hd4G/OG31wE25OoT/KZ7JZoL1GH2rW0anAQ
 cJn6g0nDTkmTwsPTfnFNn2MtEi5fi4WZEMc8CnrfPH9yj/hH4VZhVGJU+Y1jVxH7rFGK
 99/c3fwHFRXPmWUsn7Hz1mvrfeo9euvO5qxcVdwHGZEO/g0mSAANMz81qWdTlPhQVePy
 OU/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/mZZd5mb0Yz6jqyXT9AgZNM+IDAczcY6rUpeG+RG7EicNDf/eX3IYJ4EwVG5/kHtOPrfLaxcLShfXQ55pCGftYJiR
X-Gm-Message-State: AOJu0YyQtR8guWTD9plvdklAPBZNKPMUTWqU48xh+CykxcbwZlHWB6y3
 ve3QCMBZb8lDfL/7UHcsw20zM8d8bMtelEc/ooUksldv2WIj3witI9hFQ0KBbNnyYJcquDxAquN
 AdUiEH5c5rFfSr42E8BSd0VZs+06xdjpS82MObA==
X-Received: by 2002:a05:651c:2de:b0:2d2:acef:6aca with SMTP id
 f30-20020a05651c02de00b002d2acef6acamr3290897ljo.41.1709904444869; Fri, 08
 Mar 2024 05:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20240215175752.82828-1-philmd@linaro.org>
 <20240215175752.82828-35-philmd@linaro.org>
In-Reply-To: <20240215175752.82828-35-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Mar 2024 13:27:14 +0000
Message-ID: <CAFEAcA-HpKCk-n4HsnZPiz09xq9sk=Sh5nt05KpRymy-NQ2HEg@mail.gmail.com>
Subject: Re: [PULL 34/56] hw/intc/grlib_irqmp: add ncpus property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5amKW69ucjCQ

On Thu, 15 Feb 2024 at 18:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Cl=C3=A9ment Chigot <chigot@adacore.com>
>
> This adds a "ncpus" property to the "grlib-irqmp" device to be used
> later, this required a little refactoring of how we initialize the
> device (ie: use realize instead of init).
>
> Co-developed-by: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-ID: <20240131085047.18458-3-chigot@adacore.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Hi; Coverity points out a bug in this commit (CID 1534914):


> -static void grlib_irqmp_init(Object *obj)
> +static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
>  {
> -    IRQMP *irqmp =3D GRLIB_IRQMP(obj);
> -    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
> +    IRQMP *irqmp =3D GRLIB_IRQMP(dev);
>
> -    qdev_init_gpio_in(DEVICE(obj), grlib_irqmp_set_irq, MAX_PILS);
> -    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
> -    memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
> +    if ((!irqmp->ncpus) || (irqmp->ncpus > IRQMP_MAX_CPU)) {
> +        error_setg(errp, "Invalid ncpus properties: "
> +                   "%u, must be 0 < ncpus =3D< %u.", irqmp->ncpus,
> +                   IRQMP_MAX_CPU);
> +    }

We detect the out-of-range 'ncpus' value, but forget the "return"
statement, so execution will continue onward regardless, and
overrun the irqmp->irq[] array when we call qdev_init_gpio_out_named().

> +
> +    qdev_init_gpio_in(dev, grlib_irqmp_set_irq, MAX_PILS);
> +    qdev_init_gpio_out_named(dev, &irqmp->irq, "grlib-irq", 1);
> +    memory_region_init_io(&irqmp->iomem, OBJECT(dev), &grlib_irqmp_ops, =
irqmp,
>                            "irqmp", IRQMP_REG_SIZE);
>
>      irqmp->state =3D g_malloc0(sizeof *irqmp->state);
>
> -    sysbus_init_mmio(dev, &irqmp->iomem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &irqmp->iomem);
>  }

thanks
-- PMM
