Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C7EC1431
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxO8l-0005E5-28; Tue, 03 Mar 2026 06:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO8d-00058l-Fe
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:42:07 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO8b-0001gZ-S0
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:42:07 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ca1ba0089so4789962d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772538125; cv=none;
 d=google.com; s=arc-20240605;
 b=M2dAkX5hP10LQSfIAOU/a6tCSXQxqBLiIe+LiySKyaT3oMde9UUM1rTQvO/Ars37m+
 iPpn90b1CXggA+G5yiwH0jLjfI6IjfCkyFg1alQQBahbDpSSuF3Jusae6oiy6baOuONw
 9agAFHpWjkMAsUiBSs+2k3IeB6uWX8dFwAi9S6zYan8oSOjxwbhhcJ0HvKNj4TPcWrrD
 8GZrokL3R0w06RXxoTRlrT2yKdCL5aixcdNBfAIVq1CaN4VgzEarcDre0YK4Un18m1AF
 RBnu3exmrnJ8AQRoG+Qx6gJyKXPvmMCo7EJutQYKvmDquvwGKuYI8QBVQeDapPocZdP+
 IvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TmcAWmmVEiZVO2IXHyRF4hwYUTz2/PggnQC6ob57Es4=;
 fh=V2ugROAbF94SSiCphgfGJAXLhrhIWYHJOH0S/osoqPE=;
 b=gx6T+vTFXlWxj7QaGxH+FpJk69VIl3kbcUmIGsFSh74RU7cWawIgIW1D9O+qOm2P1/
 jvG37lN4ZdnA5Qb6Euv4gI6cLJJJGumH+IIiaMkP80n+W/IJzlfsC0FoVZB3CZ4eMP8U
 FDenEPcu/aCR8HCQPicQoyYkrG37BciyxnO7wgNNCQcFcAPVacsyDNklEvcIjHOkP5TK
 nFwbfX4nf87Oto4FVJI8Xg2XftcOZtSHA4pU0sKCw/doEXEtAYwYpicPxEeoAnMzSXEl
 B3mvZQvHWyqc64771L/VasqsRjSoSjLwf8gipgIYbYvLDQKtBkCMH9MyIvu4BCvkS3ic
 BxMw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772538125; x=1773142925; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TmcAWmmVEiZVO2IXHyRF4hwYUTz2/PggnQC6ob57Es4=;
 b=wD6Jgnr5KFz7zPTsEMJtCfRm/WsXhkOqA9FCKCC/vIEUGeA96qGo28gcJFDGAOu2/7
 qh3dhDubXxHQ+K6HDvIb7h0m+LHitXSWugusxMtfzmuKuGTLEQe0VFnLsj5ZFcH7lrLL
 xsF8nnUoHV0KLSAjFKvx/7V0ZF1U7onNLxeufTtR5wI9FSSk9+V26AFon/ACMrI0QL6q
 jGaEsiLcY2v+Bnm2jwDP174G1+3mu8L3+2TBVf9fDdaaYOQwluljcvkMj/ahV9aKr2uc
 bAGGwCosZSpietnC0qaqrD/Zz3lrJE/uQP5xemrg11ts9YqAGvZjpWpEUfBJqrLXvdA7
 mL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772538125; x=1773142925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmcAWmmVEiZVO2IXHyRF4hwYUTz2/PggnQC6ob57Es4=;
 b=Dv+l61T8G+XE4AU9vJq1Lv8jSDSSFdlFBYjVUGxDXPJ3I+DC/HxOCMI6YAP8UmwdOs
 hcm0+fhiiWdR8YBK9eY3r20tIIsfrza8Afzw7merd28vF5ZDkk9tq5j7H16cfCsDvbD7
 eHwCdlxnp0Ltaw05B68R0ed7zRs7IyNNUiN728VHnEM2PT3aGywgzvpb8pQws0sy7WWs
 w35PjN3FHlP2twO3yPWTJCxF9v/RWisyvhf/K5LnDqCucCOkT9QI3CvNwYB6BBmKOuUx
 +ZO8uoGejY8RSXBlFS/Ass5aW4StbUB+YX6/w52NatULOxCPtX2+PpxDXocYR91RuSTi
 +2VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1sj1Wf+9IclyChhryCAdWbmINsIgdvIyaOHsY8aMsKWpO9CUQxBN4K5VP3ojAYTBl/yDc3MYzSw==@nongnu.org
X-Gm-Message-State: AOJu0Yyahc2JMC/KTb2WKcNYVzZVahqr5loKNKC5SSM9aGnXPjby3RVL
 Z+29wz7F/GgTI2FxAtEBs3k/1+sXld340b7LD/teD5x/Y+b0NL6fpRExFK/X4faEAOG6L2r13dJ
 C6WpV7a1OYYcx3n5KuVlr0FX9DdB2OKuHm6aGMUA5Mw==
X-Gm-Gg: ATEYQzx8LQ6ncqaIuAPe3k2dgIDPr46n9pikRUYTPQeH4SmXSe32N8Jll9GFljigcw7
 g2c+GmX3pFgbFk+PZCwA7Yx/RREyAkvl106VSaDz0/5HxzoNJnuWT0jLwDIcukn2UodPjrHjRFR
 G1W1Gx424uzzjSTRaqReyPW5ezKDcCjblVDa/H2xUiMDCMA5dP5Atz8cOTtfXnx7f80cgbfto+B
 +40cRQHWlVqyIxROn20/mO8aikarAsAkFfzjmw9RLYR68W0h1Uh90/iLIkgby2oIrtN2uLsyxCB
 iJLa0Iff/D94RY+PqeXnUpXvWLWfkB19piHgdE2DSQTIdcmjFYRYzWB8xR+t9ccVG74=
X-Received: by 2002:a05:690e:44a5:b0:649:6872:9d89 with SMTP id
 956f58d0204a3-64cc2285d6dmr9939518d50.50.1772538124574; Tue, 03 Mar 2026
 03:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-12-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-12-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:41:52 +0000
X-Gm-Features: AaiRm50ZDWOSzNYDTMqP2C9-_reSRaMxHA35okEURMI-9ETR6WIHoSKGo3tJgUk
Message-ID: <CAFEAcA-dmbSDNC+AL=OO9w=bM-79gVaysroQty=u-SxzQziUrg@mail.gmail.com>
Subject: Re: [PATCH 11/12] hw/char: Have SerialState inherit from SysBusDevice
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> SerialState currently inherits just from DeviceState and serial devices
> use SerialState as an "IP block". Since DeviceState doesn't have an API
> to provide MMIO regions or IRQs, all serial devices access attributes
> internal to SerialState directly. Fix this by having SerialState inherit
> from SysBusDevice.
>
> In addition, SerialState doesn't participate in the reset framework
> while SysBusDevice does. This allows for implementing reset
> functionality more idiomatically.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>



> @@ -76,12 +76,13 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
>      }
>      index++;
>
> -    s->irq = isa_get_irq(isadev, isa->isairq);
> -    qdev_realize(DEVICE(s), NULL, errp);
> +    sysbus_realize(sbd, errp);
> +    sysbus_connect_irq(sbd, 0, isa_get_irq(isadev, isa->isairq));
>      qdev_set_legacy_instance_id(dev, isa->iobase, 3);
>
> -    memory_region_init_io(&s->io, OBJECT(isa), &serial_io_ops, s, "serial", 8);
> -    isa_register_ioport(isadev, &s->io, isa->iobase);
> +    memory_region_init_io(sysbus_mmio_get_region(sbd, 0), OBJECT(isa),
> +                          &serial_io_ops, sbd, "serial", 8);

This looks very odd, because sysbus_mmio_get_region() is supposed
to be "the sysbus device provides an MR it has initialized, and this
is how you get hold of it". But here we're taking an uninitialized
thing and initializing it by calling memory_region_init_io(). It works
because it's just returning a pointer into the internal memory, but
it's still making assumptions about the internals of the device just as
much as directly accessing s->io.

Maybe this is worthwhile for the benefit of getting reset
handling automatically into the reset tree.

thanks
-- PMM

