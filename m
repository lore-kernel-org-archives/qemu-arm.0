Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1937316ejb;
        Mon, 24 Jul 2023 08:01:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE7RkkZKN0JnUXiIO6dgG0YeD+gYkCXuaXB9yFs80xWchW8gFUM8JjHRFrxqaVsuubtVX8M
X-Received: by 2002:a67:b308:0:b0:444:bb6f:b983 with SMTP id a8-20020a67b308000000b00444bb6fb983mr2823929vsm.2.1690210911497;
        Mon, 24 Jul 2023 08:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690210911; cv=none;
        d=google.com; s=arc-20160816;
        b=tvII8ZRAFGsgjsZ5ezW4jaKphIk9QY2jIL7YA+dmTXZFsGvIcQ44ZNKIe61kNaW6OQ
         4kg4nQLwl74GkzAAMIYfwB6e+5LS/gPWgO1AspB9P7ZrVn4+XS+0dDQXdpmviN4dMh40
         yGGqfrOcNcrwty+RYDFDW6IWev0DcOiy1YosTXdnILaehFO8tmBNdWdVwCvRdcn4aPWe
         9skw93GG63YpvpinJCGTZUfGWTtKWkkebeD+1u/VPEYbb9C83UJ76SNw7OlzcSgkaVbk
         RDbBWQCAdWZUr9OirDdS/KsDjpwsVAKm1QHU1fPiN4I4GdRc1hUYpnzhbhehdlCJvXGa
         5WeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+BKvwNBXiR8ToZCcduRzqfCJfeFNN3EIFViHd8mstXA=;
        fh=3T1YPPpNLZ4tTSVZAOw2S5f+A5bw66Y6AE/Qn/ZE1iQ=;
        b=OBf3cIEXqRJEWYVtenb08xz8wAXzZoTPUUNa3LxxH4jvC8VL0aw3fIR7UvrYl32ijM
         mItsKJEigmNHdMoqVEDSsk7Eqe1jdDtVssTI3S1ILvMch4XCEfbH5715ziHSwVKenz1P
         EOMy2osLp95cU+06Sfs5q1a/+H/vlrGm0i4uBkuaNTDB97tpFQ1H0Eztl7QWSSM+xpHe
         2NZuF5Le1jQSkqv7Fpcv6nrFVOp9RaImkkq72LavfWCz94GpryZMmahIkVLVoQjiJOuD
         tk3raWfXslog/xpNIk7HYi60IPyZ5mQBNULv4eGIhtiefIiSflwdwjRh5kB6PrHPz0rF
         J9Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEjh8G3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a0cf4d3000000b0063cf3391f11si2783904qvm.524.2023.07.24.08.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 08:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEjh8G3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNx49-0001vz-EL; Mon, 24 Jul 2023 11:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNx47-0001vl-Jm
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 11:01:40 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNx46-0004hO-26
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 11:01:39 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fdd14c1fbfso6622597e87.1
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690210895; x=1690815695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BKvwNBXiR8ToZCcduRzqfCJfeFNN3EIFViHd8mstXA=;
 b=NEjh8G3Z656MK4p9CYoi2MqX0iab9lbLjdjnGoYYUNiH+imMEAPzcBuogL8xSN/zoR
 3hnCq74QLnL9QBjY0VVL2jEcrq9DugUkp8ZuUm4G1mNqSoBtudEMYsJLFyEv2SG45/JF
 pWLFrnghLksIYlarAy26Js15GIr1H83i0+AXAVv4bPQylEIYO4vYB3EYjwSagwMxVILj
 2VKCRQKBFWz1gczwTqzsOD4LKrb8odK/vP0I1p25zvMmcURg/JsQTraSM+395WRJYvUD
 Z4rSAjEXkKyJ4QG+xzoLpSuStsZmg0/bA5CVEOB8IwQZTdEJbOS0j5TAP8nEjU4geyVE
 Zepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690210895; x=1690815695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BKvwNBXiR8ToZCcduRzqfCJfeFNN3EIFViHd8mstXA=;
 b=KkJWBCaJPKJkPAdlFFmyZ9IxwuZ9XeOttO+fyM0qn/isoeCOg1UFckTalINuspKlBs
 5xhWODfeEzgkcfB8TWO2hBcGl31mmlpoIiKqlVKJJcY4fLq4Zf4e7rfmHOXBVP5gdVh0
 GOcW4yS3Qby2z3OAqiZPrNJf2Ezr53d3SzsoGQx2DBbcFV55x5JlPfk6z5Us7OWU+56m
 taW8d9BAuYJPQPSh0KR3yKs+WCJHMC/WcBOBligXzAn2n6XU7269QoBPWJ+Y2XitR1qI
 GN4v9KjB0fCA8sNV1AaXzJDuoL86aOmL0iDglhGJ4ijGHimdtBzoE9UrNTbUfyqKrT39
 1arw==
X-Gm-Message-State: ABy/qLYmcdzJMNBzhvXXQuEY9xFIB5Q1SwpuuFwXp5TIy60ATE1qevhV
 XurfFnyX3qI/EPlXKUfaiHs8ITI1B4b0hPHAIgpcbQ==
X-Received: by 2002:a05:6512:128a:b0:4fb:74da:989a with SMTP id
 u10-20020a056512128a00b004fb74da989amr6452284lfs.3.1690210895234; Mon, 24 Jul
 2023 08:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-18-philmd@linaro.org>
In-Reply-To: <20230704145012.49870-18-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2023 16:01:24 +0100
Message-ID: <CAFEAcA9Qk2jMLdM+3zjAvFj0wF6NBhH+wB7zpeU-zE5e9a_RJw@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] hw/timer/arm_timer: QDev'ify ARM_TIMER
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vzjUISIRAirh

On Tue, 4 Jul 2023 at 15:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Introduce the ARM_TIMER sysbus device, exposing one output IRQ
> and a single MMIO region.
>
> arm_timer_new() is converted as QOM instance init()/finalize()
> handlers. Note in arm_timer_finalize() we release a ptimer handle
> which was previously leaked.
>
> ArmTimer is directly embedded into SP804Timer/IntegratorPIT,
> and is initialized as a QOM child.
>
> Since the timer frequency belongs to ARM_TIMER, have it hold the
> QOM property. SP804Timer/IntegratorPIT directly access it.
>
> For IntegratorPIT, each ARM_TIMER sysbus output IRQ is wired as
> input IRQ.
>
> For the SP804Timer, we add a TYPE_OR_IRQ to OR the ARM_TIMER sysbus
> output IRQs together, exposing a single output IRQ.
> The Kconfig entry have to select the OR_IRQ dependency.

How much did you test the migration compat handling in this patch?
TYPE_OR_IRQ has its own migration state, and I forget how
it works when you migrate from a machine without a device
to one that has it. Does it just work and the extra device
ends up with the same state it has at reset?

Anyway, we should list in the commit message all the
affected boards (whether that's "migration break" or
"migration compat, forwards only").

> +static int sp804_post_load(void *opaque, int version_id)
> +{
> +    SP804Timer *s =3D opaque;
> +
> +    if (version_id < 2) {
> +        for (unsigned i =3D 0; i < ARRAY_SIZE(s->timer); i++) {
> +            qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->irq_orgate), i),
> +                         s->mig_v1_level[i]);
> +        }
> +    }
> +    return 0;
> +}

Is it really OK to call qemu_set_irq() in a post_load
handler? This is going to end up causing the OR gate
to call qemu_set_irq() on whatever its output is connected
to, and there's no guarantee about migration order between
us and whatever that other device is...

thanks
-- PMM
