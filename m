Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp236822njb;
        Tue, 4 Feb 2025 06:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrYZOppHS3OH/5DRynJwCytt6IJRrj3WieNCz2Y0zPQCkAD/ghnS48HrNeSMkzQaRD/FKg5jOtRRrUDA==@linaro.org
X-Google-Smtp-Source: AGHT+IEP7TFX+OSJXC03DSZT0qzKW8VW1035r61uZ1brytXCpobKQSYE9GV23oilBBPAz2Xgvmo7
X-Received: by 2002:ad4:4eeb:0:b0:6d8:af66:6344 with SMTP id 6a1803df08f44-6e243befc16mr404627576d6.2.1738678466201;
        Tue, 04 Feb 2025 06:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738678466; cv=none;
        d=google.com; s=arc-20240605;
        b=aT5Cx+9WFV4RrSbfgKFhk8Mj5ScisnMPxAlD4s89cLl9ECC2zNhz0wD0Xvo+r9XCGT
         t9m93IBo1jiDJ80Bk1BU7jd6OnEZAkt//4+CxvI1FxHxYbzG78oNt5Fi9E8iZUyjyep7
         twE/x7TmG3c4+DJTk/RFJbat1916BdKlkynKr3VejtTKu5JdxiHZsqy21SSxUEI0thHk
         tcCSsVONa8Ga9hfjvgqkYX8NCaATC8EaV1WcKIyO75NnqAvzWQ0qXFS6mc2FlQUoNYlB
         p5Aa3IHxNmAjxGhpLEjHzMSle6QBp2P1I/ceJRMFqU9JF2JSpZURwJfwAQrNsGLpl52q
         X8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Nlu5T2bogCzgYYiWWaNBgtj4Bx6LB5+nciCf3px8pb0=;
        fh=J+MSWPZxbDEOau4dlWoFtS/7KrBkAfQvnrUl5fep0rM=;
        b=akpcywYR7g0kowz+KdFZYZRwxlBkuoEvoF7fGarW0appqjtL+TMccTLO13n/GNeaat
         PFt439/prOl2hBqeaQAg25bUGlmrtjjTYTXj+BJCCXo11qzsNQBnDKd3i2u8UvErP8j1
         Yj9WF5FOsisX3lS1L9uQo0EQ5TMSetUPsjz5/d5myETzWRGiPbUeksVHL6+9wtSv+4IW
         //oJ2zUP8EvLdgMOREcUlT+X45mt70QdI33yL/uSLf9QZ9r1TJ8M0QosyJmzVeejXM7Y
         uz/quxjsyBUmfunJMGTlaRIwhML1Q7DtR5vYRX36yNN68v7r/AViAUtIbOe1TaMLX1hg
         cEew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDJG6qIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e42644f0b5si13679176d6.136.2025.02.04.06.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kDJG6qIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfJgy-0002OE-QQ; Tue, 04 Feb 2025 09:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJgN-0002GG-3a
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:13:45 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfJgL-00031S-1J
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:13:42 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e46c6547266so4934173276.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738678419; x=1739283219; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nlu5T2bogCzgYYiWWaNBgtj4Bx6LB5+nciCf3px8pb0=;
 b=kDJG6qIllszQYaTmGBzr7Tv3MACeZorUKsYKulvXJfp/Gh4OJUDQRgaZmhtc+d5UAp
 qXHa6PNwjM+7U1bkrUrpqczU77PaTqVINjzzN5aN4LmaIl711QZPKGJ9PnIOQVtIRH9r
 0KNK+plsecQrCcveDfzK8kADyfV03VWLVc4ADF9N8D4GBG4uBK2pah1hWb65a6tR3/Fv
 7nLIWa+44fjGPBoz92CPJY6vYLL9kGX6P1NSPr02HQWt2dROynOntMtDFNXKd6jBnIPp
 n5YvPBL/Wpmad/vFBaOxJgqc1N1Qe/DfQpysNJHjOvhZsVo+IVV+8AswArMnt6lef+dc
 aqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738678419; x=1739283219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nlu5T2bogCzgYYiWWaNBgtj4Bx6LB5+nciCf3px8pb0=;
 b=Rjhf4OFIGme0PXe+eVhOa4NgddTCZ/wIe4ZaVo/I3qiYo8dyfzLLAlcra+8nNhfOJT
 i5d1/tqJlAB9L3eTYFxVFpbfDnJo9Aubpj8XAxqL1CyI39rTesnpt55HxHQTvyTmEr33
 O9cIEjeViv50zHncYc2s+EPLYXF9gPt8zXbSbxR/HpKjnn3tT99wsgqHfN9v9v0MncCk
 4IzeCRGBd6nwsNOJEp5E5YquX4oW1LvTbTiNolGHcm8pMO8hCy9AmbG5tD3kiMGS/Cp6
 ov6zpkEhl9aY9C6CEa0fJY34ivy6MGnB/7v26vK79kvX6kiXCTgV8fSxBqKZzL9Ul8GR
 txCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNL8K8MhJOfT/PHjStGkgzg/ZhdQBewhp2ALlROvImPZd0byNUiodElW/BUy7ZPjdiLSorzH5bIA==@nongnu.org
X-Gm-Message-State: AOJu0Yz/CoQWslhPQNxzn/xp495ranDMLOdZPBCh+yWOpl1bzIAjrPSC
 tpwUORgXvYIB+JawF2dr9e8KRW5/TcyYD1e//gaUIGT1wIcRLil6G4vi2Y1AWQUWk6wEVeAnBAI
 N0+xGg4nOx8yuZmeWY1TAzLXixofahLPAgAwyHw==
X-Gm-Gg: ASbGnctfuqWoOHR955KDk+UiMI1AgY/BDQSM9xVJRzArgrRkDlIG4lEmqp+VUrvwSpn
 2BSQZK4dozc+e+delcwaUYwBUt7cRoJdxPpVMJcm3NArNhn83r4Nh41oG7+5fssYKQUieGslAKQ
 ==
X-Received: by 2002:a05:6902:2e04:b0:e58:3990:3f77 with SMTP id
 3f1490d57ef6-e58a4b02ccdmr20490317276.22.1738678418591; Tue, 04 Feb 2025
 06:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-9-philmd@linaro.org>
In-Reply-To: <20250130182441.40480-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 14:13:27 +0000
X-Gm-Features: AWEUYZlm_bASjdgxOE3Y52KoDiyX0THDP9sh1OAgHWGMw2WMkCmYZ2THVFVFyu8
Message-ID: <CAFEAcA-ZtcP8epex5rJ5Y5F1mS6aURkaeJdzVZJ+Nty3uStZ4w@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/cpu/arm_mpcore: Remove default values for GIC
 external IRQs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5tN6zK2wzH3F

On Thu, 30 Jan 2025 at 18:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Implicit default values are often hard to figure out, better
> be explicit. Now that all boards explicitly set the number of
> GIC external IRQs, remove the default values (displaying an
> error message if it is not set).

> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index 3b0897e54ee..372b615178f 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -58,6 +58,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error=
 **errp)
>      bool has_el2 =3D false;
>      Object *cpuobj;
>
> +    if (!s->num_irq) {
> +        error_setg(errp, "Property 'num-irq' not set");
> +        return;
> +    }
> +
>      gicdev =3D DEVICE(&s->gic);
>      qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
>      qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
> @@ -146,13 +151,7 @@ static void a15mp_priv_realize(DeviceState *dev, Err=
or **errp)
>
>  static const Property a15mp_priv_properties[] =3D {
>      DEFINE_PROP_UINT32("num-cpu", A15MPPrivState, num_cpu, 1),
> -    /* The Cortex-A15MP may have anything from 0 to 224 external interru=
pt
> -     * IRQ lines (with another 32 internal). We default to 128+32, which
> -     * is the number provided by the Cortex-A15MP test chip in the
> -     * Versatile Express A15 development board.
> -     * Other boards may differ and should set this property appropriatel=
y.
> -     */
> -    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 160),
> +    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 0),

I think it's worth keeping at least some form of comment here
to document the valid range and that the value is internal + external
interrupts. Something like:

    /*
     * The Cortex-A15MP may have anything from 0 to 224 external interrupt
     * lines, plus always 32 internal IRQs. This property sets the total
     * of internal + external, so the valid range is from 32 to 256.
     * The board model must set this to whatever the configuration
     * used for the CPU on that board or SoC is.
     */

?

(I suppose we could also actually check the property really
is between 32 and 256, but a simple "did the board actually set
it?" check like you have here is fine.)

> @@ -160,13 +166,7 @@ static void a9mp_priv_realize(DeviceState *dev, Erro=
r **errp)
>
>  static const Property a9mp_priv_properties[] =3D {
>      DEFINE_PROP_UINT32("num-cpu", A9MPPrivState, num_cpu, 1),
> -    /* The Cortex-A9MP may have anything from 0 to 224 external interrup=
t
> -     * IRQ lines (with another 32 internal). We default to 64+32, which
> -     * is the number provided by the Cortex-A9MP test chip in the
> -     * Realview PBX-A9 and Versatile Express A9 development boards.
> -     * Other boards may differ and should set this property appropriatel=
y.
> -     */

Similarly here.

thanks
-- PMM
