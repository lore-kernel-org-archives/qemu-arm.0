Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3359165lfq;
        Tue, 19 Jan 2021 06:13:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6HJfIUuMjnNROW/D52/YHxqgbvuVNIoV+1K4Z1XkwrmJbgxP01qgeEyv+/QwInTjjTzln
X-Received: by 2002:a25:c68c:: with SMTP id k134mr6257066ybf.272.1611065584364;
        Tue, 19 Jan 2021 06:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611065584; cv=none;
        d=google.com; s=arc-20160816;
        b=fdhF4SpUrEqx926unSAzrmEsOF1WezlTKB6bMV5XD+mgqhcCybcoVmpz8y+ELcf786
         D8Zd1YfsRXuq8JCHOYCKeCvF+5s2cbsyA3bBAcoCq2IxfRkdba6l4L5DT6bZrdRupcAh
         ZZAVWgrOiyRo6T3X8ZqphzNiU8apvInRcrUky/rwY+JLGZQqgTBOTLNgL+i2zTEb0fda
         6+J95x43xmWuytKa5O4xv86jv5K4xzS5KLGWFWd9Hb3zmPTWa9pKn8NecbxW1H3zdUbW
         EkeUndQeCmFgJmGWWFJK0A6m8bN3363BxxqdAnSnrNGLZ8fB1/U6FGOIACW47W4ceuqT
         nnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G90+9oVFQRnmQsOMhZfnDMO73GYi5Rl59CMsJyndS3U=;
        b=evqsRDPwY7S2U7RmYlPfvPiSZmwSnePkFK6jQXMnYepLuBPKZ+cfzFiBCv7l3kGUjP
         FhotPIBFP7P+KcS7V27XIPv+29ax2KG1Flk7EnwSbT41ObKDlFn+rW8JNH/ivAFd8Ddl
         0QCG/jvHUHlRKzmCh1asd6pqKoxf67WVMIL7mIzVdVF03fGCT/E5AIH2hOMbC1Q6X50o
         eIIXTtkrGy8hmDR7NdKdRDTsLiCZlJiaAQTpD/DjA1Jm/HQlJVsTRcc61FkTI3xmuabA
         FEfvY/nTcnK8X0qD2HUtc77CJ6ei6B2Em7vUKkGIXyQDx4B+RNPjH+xa8lDh3cPTLpgb
         +itg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KlZTxJ/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si7365106ybc.430.2021.01.19.06.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 06:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KlZTxJ/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rkl-0007ty-OF
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 09:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rkZ-0007sR-FN
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 09:12:51 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rkW-0000Oa-Sh
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 09:12:51 -0500
Received: by mail-ej1-x631.google.com with SMTP id hs11so26361891ejc.1
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G90+9oVFQRnmQsOMhZfnDMO73GYi5Rl59CMsJyndS3U=;
 b=KlZTxJ/Rbj+qn8M822eFyVrL9gLiBIRdMQ65MtACkWVvw89ww9rKuJBWztJT3PRW+a
 mEgSoQItTu6w2JnDJP6n7GLHi2SjoHfK88IrFx2eAawADx2908OerhYUyCvgPE2BqX3R
 sROCI1r3GfSqk3iq1vJ1iZmI4kqRt0XAkca8GkuPlWTK87plJetuh0Pp+D/UdoLsxXG7
 tHW3cB6fjPS/BGnKfvqbgV07sB9WuoYNyO+ibKq9VehobWR0d1n9LG/aj/Y5vxln1jyk
 J72nXZhCJ16X8LCl1HmdgB2Wc1ESnFVMEyj94Q8feMTVIM8Cmw2UNKvy1wfAj1UkzyRu
 6ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G90+9oVFQRnmQsOMhZfnDMO73GYi5Rl59CMsJyndS3U=;
 b=eYukzK98+2qJcB57h8J9goeVUyUF2/7VgLP3CjCV2rPlWJ0zeQd6y93x4vu73uPT4w
 xwGD7Mq9wFpDvp7cWq6q/TReLBP6mKuQQNCaAR/dCjT8mtkKsZsIzIoQYmCbF5txoFgE
 LQvVSoUEHFRG8b3qVHKWfqFp26fXnu178rEy9o5PXP20v6H9AoauCBMG9jpLsgj13A3j
 CobviS+9lrxeUcxgCXwYgvfDn2XH4jYLet5XHGNK09CDxCJmvcj4edV0NGivJDn0/rO/
 6LrXpFUZ4X4cQd+iYWPsml8n4g7+JsOscUOS58mbWk3Gg03UceZXXGiqaWjzL77av4fP
 Jp1g==
X-Gm-Message-State: AOAM533YcDdQaR7PGHElYyjWcwQM5qLM0kpHs/nYf4S8WmqAg0w7sg6F
 lIq6fz9imJNWiQuFCG53c59a/KZ/yODqGbALVSApyg==
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr3030501ejz.407.1611065566676; 
 Tue, 19 Jan 2021 06:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-4-maxim.uvarov@linaro.org>
 <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
 <CAD8XO3YjP8RUDd2T6+VwfnnCm4fk-i6x5DbmtOHF553yxt9Jtw@mail.gmail.com>
In-Reply-To: <CAD8XO3YjP8RUDd2T6+VwfnnCm4fk-i6x5DbmtOHF553yxt9Jtw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:12:35 +0000
Message-ID: <CAFEAcA-9NR4JtE_heC6N1tX9bd7zAxXgke4APyv81df0nBr2_A@mail.gmail.com>
Subject: Re: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7qW8CUy5ufBr

On Tue, 19 Jan 2021 at 13:47, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Tue, 19 Jan 2021 at 16:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > Remind me why we start with GPIO line number 3 and not 0 ?
> >
>
> Original gpio power key use 3 and 4 (non-secure). I just selected the
> same to be consistent.

Those are different GPIO lines on a different PL061 doing a
different job. I don't think they need to be the same number.
The power keys are on 3 and 4 because pins 0, 1 and 2 were
reserved for PCI hotplug, CPU hotplug and memory hotplug.
Unless you have some similar reason why you need to reserve
pins on the secure PL061, I would just start from 0.

> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
> > > +
> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
> > > +                            "label", "GPIO PWR Poweroff");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
> > > +                          ATF_GPIO_POWEROFF);
> > > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
> > > +                           "gpios", phandle, 3, 0);
> > > +
> > > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
> > > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
> > > +                            "label", "GPIO PWR Reboot");
> > > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
> > > +                          ATF_GPIO_REBOOT);
> > > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
> > > +                           "gpios", phandle, 3, 0);
> >
> > There doesn't seem to be any documented 'gpio-pwr' devicetree
> > binding. Where does this come from ?
> >
> gpio-pwr created from the first patch.  There are no bindings yet.

You can't use bindings you've just made up -- you have to get them
accepted into the kernel's official devicetree documentation if
the ones already there aren't sufficient, before you can add
code to QEMU that generates them.

> > I think the bindings you want to be using are
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-restart.txt
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
> >
> These handles are from 'secure memory' where linux does not have
> access.  But I think we can use that
> binding with other compatible. Like compatible = "gpio-poweroff,secure".

That's not how you specify that a node is only relevant to the
secure world: you set the 'status' property to 'disabled'
and the 'secure-status' property to 'okay':
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt

thanks
-- PMM
