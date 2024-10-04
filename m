Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp617370njb;
        Fri, 4 Oct 2024 11:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqTfshiETo3EiF0hHsjtOAIDbXZFgGapTeiCzYwL1oDVv2vIjo9JLKJetNNdJ1c2Bcz8kYdJ+qKXu0fg==@linaro.org
X-Google-Smtp-Source: AGHT+IF3ZZ3AZipqpG7T+95yhFz7YaiCHgQBMJe4I79aarOarScTdT48o4PEtNnKqxPUtFBPIzMI
X-Received: by 2002:a05:620a:4627:b0:7a9:d019:f312 with SMTP id af79cd13be357-7ae6f45e8dfmr555537285a.39.1728065361494;
        Fri, 04 Oct 2024 11:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728065361; cv=none;
        d=google.com; s=arc-20240605;
        b=Iq3uj37T2/hsexmV9YUmncAMwc71f4QJZs57QDCW0ZET4QXPx9YwBRQpSBa+dIdy1T
         1IDfht5vCJWjmFSMlDQzPpo8R9FG+RjNeypgWoggOUxQGNR19CMrXd8bfcpQ19nLN7O9
         6OPw/EqqdthV9xDRGNZZnQ1Q0Xu5lOvpOrIVxZY1Hll0Y0zfTKK7/jDwjMElHYaEIIIW
         /7nk74ACA9C8FTbThlMVrC7Qn9+3K2LskWCS1MxRPGnXOpe1iQF2NcXjyt9b2N+soppG
         vhjyijsfQ3oToznFjqP69g4QMud0A2JGXHoVFVg7cGlsC6oJErJYRUDz/IJwacwubTdq
         B0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NVhmfTB3+t8GIphg/MqRf11PybumnQ5PkJB9ZmVTj88=;
        fh=gc5KcyZvb5EukBWAcAqJYJFzy2j7OfIVnH14NzjLUiU=;
        b=JcjDRmGIax1T7MggYcdK4VV4RbpscW29IjbZvqEtxMBTIyUIhNcHw22+ugoGZ3VMWN
         GXbut+Q/Ul0xx3dpVl79gz21SvW5kMcaASDOSBrc7GpaEXzSOdXdnCMrIKxmzsNwtYIi
         wyHONmGGiCNnUYRpS8gR0lqZwVaDN9LW3HYIHnrdJWPRct7mJHgEf5weBTBtevKjwMHk
         JaCak6wcUnA3qnR3mcDHU2AbgjCbwMjWCw2XRnFomd/HhdkFB2T89DXR5dTD3n4q9pl4
         XENAwce99cN+YAio3uwmHHv6VgUUgGMGXjE7udOMJ644eIgGk35QCR76vaujXF1QKvry
         E/Kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCLgcWkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae756629c7si15338785a.301.2024.10.04.11.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 11:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QCLgcWkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swmjr-0005Hz-Ls; Fri, 04 Oct 2024 14:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmjp-0005HX-UG
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:09:13 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmjo-0000be-9u
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:09:13 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso26115691fa.0
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728065350; x=1728670150; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVhmfTB3+t8GIphg/MqRf11PybumnQ5PkJB9ZmVTj88=;
 b=QCLgcWkxnJdXAO5FO3QGGHP8lSZhxQQ7ORb+0DJb2Dlud8D4WpLBOnGWUCu9AiYnKv
 vXSd/Fb6y8LfvUkXXhgX0RZZqt7Sqfh78Tp8tj22+LMeYOWY+ir4HjJ28i+YTvJ5GaC5
 AC90E2XfoARMKlI9KsyeBRYDT5A/26djfYw9t6Qz1r42NgduoNVLYPJaMYBuXjszFbQT
 l3xYNGRN5/9toZt4frmUoaS9Q4Qf15fcPDUyCF2IQ/8D39UqOME3MGP01CeNt6oZkvi8
 p2d8J/t1fOWS0K+KbHEcqrcGINxRFKfixokHvJ6Nlos7vID824BujTGYfBkTqiCfTV+Q
 qPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728065350; x=1728670150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVhmfTB3+t8GIphg/MqRf11PybumnQ5PkJB9ZmVTj88=;
 b=fWXScdajYKFDMIO7kexjxaR6UzJlJDfyKGNwhk7Xf4osFiOccnuYdE5aVhC4eDGV1y
 QgdFX3ueRSFjf02nnB+3y7jA4AaNnA1GR658CmBgs0TIXpBmLtPCVycz3EeaGH6B/ren
 J8RlGitWvmcjoPlIGslyHNrAmEwplgLMKfMDPy3CbtHcdlAoNjNBgrZ/vAoWMfZodAnp
 DNSolRZPI2Z+VaFawsmEPjYFkct5Ipd3OI9grPI8L87msw6BfMRDCar16PLw0QTMRooI
 ImPogriyGe49ecMDGCLG1BvCddbyQ9MTw1BOKa2bERidOXLIO+mThVTE0xGAI9Sn8dnt
 CVQg==
X-Gm-Message-State: AOJu0YwlI5TtkqPt0t165m6cnvhpb7Qiboist/EBSWEhPcIhvpLIy2N4
 dHJOQ3SBHuZwzj2kGrjlputZgM/fNNntZ5/M1CYdyLOmMVHcO5wuvE+D7MUxRWqho5FnVZA7ljl
 H0f0H0OwHC/yQ5/YcJGn222tI9+WClwDpznbfWQ==
X-Received: by 2002:a05:6512:2313:b0:535:d4e6:14e2 with SMTP id
 2adb3069b0e04-539ab89ac5bmr2199845e87.36.1728065349985; Fri, 04 Oct 2024
 11:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240927150738.57786-1-rcardenas.rod@gmail.com>
 <20240927150738.57786-3-rcardenas.rod@gmail.com>
In-Reply-To: <20240927150738.57786-3-rcardenas.rod@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:08:58 +0100
Message-ID: <CAFEAcA-QUAKPuzcjLafU8U_=wk2HWhHbxx76WgwN+Cgdec_kGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] STM32: new GPIO device
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?= <rcardenas.rod@gmail.com>
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: iRtDxgLNJyQD

On Fri, 27 Sept 2024 at 16:08, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez
<rcardenas.rod@gmail.com> wrote:
>
> Generic GPIO class for STM32 devices. It can be used for most of STM32 ch=
ips.
> Note that it does not implement configuration locking mechanisms.

So we already have an stm32l4x5 GPIO device. How different
is that one from these ones? Should we be sharing implementation,
or are they too different?

When adding a new file, could you please add lines to
the MAINTAINERS file putting it in an appropriate subsection?

> +static void stm32_gpio_irq_reset(void *opaque, int line, int value)
> +{
> +    STM32GPIOState *s =3D STM32_GPIO(opaque);
> +
> +    trace_stm32_gpio_irq_reset(line, value);
> +
> +    bool prev_reset =3D s->reset;

QEMU's coding style says that variable declarations
should always be at the start of a code block, never
in the middle. (There are some other cases of this here
and in patch 4, I think.)

> +    s->reset =3D value !=3D 0;
> +    if (prev_reset !=3D s->reset) {
> +        if (s->reset) {
> +            stm32_gpio_reset(DEVICE(s));
> +        } else {
> +            stm32_gpio_update_state(s);
> +        }
> +    }
> +}

> +static Property stm32_gpio_properties[] =3D {
> +    DEFINE_PROP_UINT32("family", STM32GPIOState, family, STM32_F2),

For this sort of situation where we have a set of devices that
are very similar but have some slight model-to-model variation,
rather than using a device property to tell the device which
variation it is, we generally use a parent class with the
implementation and a set of child classes which tweak fields
controlling the parent class behaviour. For an example, look at
hw/gpio/aspeed_gpio.c -- TYPE_ASPEED_GPIO is marked ".abstract =3D true",
and it has most of the implementation. Then the various subtypes
inherit from it, and their class init functions set fields in
the class struct to define the behaviour.
hw/char/stm32l4x5_usart.c is another example.

> +static void stm32_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, stm32_gpio_properties);
> +    dc->vmsd =3D &vmstate_stm32_gpio;
> +    dc->realize =3D stm32_gpio_realize;
> +    device_class_set_legacy_reset(dc, stm32_gpio_reset);

Could you use the non-legacy reset instead? It's not much of
a change, instead of calling this you set the ResettableClass
phases.hold, and the reset function has a slightly different
function signature. hw/char/stm32l4x5_usart.c has an example.

thanks
-- PMM
