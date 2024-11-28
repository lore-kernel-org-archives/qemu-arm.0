Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1425269njb;
        Thu, 28 Nov 2024 03:07:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9UDnn03crr+gPG0uQKS/8MvnKi7YJWVjNaNELuXjJNpYeZEQqIAVKAp1L32bk4rRIjn2YjD2klWBdIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGkj3TtPyTdQrUGoxnwXQt/wJbEdQAPE5OCkjvtpmzrx9X/yFyBvKCliyTVBvrSP5JyeV1z
X-Received: by 2002:a05:6214:1253:b0:6d3:f54c:e412 with SMTP id 6a1803df08f44-6d864d2a409mr115443216d6.16.1732792042992;
        Thu, 28 Nov 2024 03:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732792042; cv=none;
        d=google.com; s=arc-20240605;
        b=FuRPMkoJxMNpxqoVKIhMx/DG4w5/auXBvqkyZAore13KWIv2khvo3ANZ5sNaTo9xQG
         rCLG6Bt4hC5d/2LiyGJKgwLsZ3LTC2TP7SJwLPP72Mk2BezaX9RYNuupODjd7BQztwLt
         RhQej++WcHwO02er3+U4+qiEk5sTH8xGgpo7t5tgaRkBjxkZwSTbRDQs6Wl1pm/5co9O
         mNBmYYaTgjsNjChypnbNrlbYpJ1NLvPQ5oZ5CpsvPGdKK28MmZNpv3DheLYW2p2OdaK8
         jqhZofTqDmX/r0qFyJ+FJQs5on8Ef29Hn9ISU/Td2oF29BY7EaqxggoZXfn930nwFLtl
         ECfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8kNjCRSoXw2jqQFwpOaavwKDFP4GzOqvpfROk6xC3N4=;
        fh=JNeet/2xuFLoNGjBbRTYZPIdanPb8pcB8lU0Xv3pM8M=;
        b=Wt58zBx+ptW/BreVHxwoenYFdm3XLnrOtjA60anWWrhuVbU9bhjQ0dgjiQcr2Roo9T
         95jL/b5+p0hGL7KZ1bB+kYqgkIeVwcEQtPSj/lwtNFx6Xr0MQLLhp6wTjs0FZpyOWkW1
         ySDKAmktoMkAWI5Z3P4isupLVMptmE/QmsdpTaghlYXkGyWuKt655V23vlabXtGcVNzw
         6v6YIvdQO0t9i5/JSY7bsCs65NCuRypdoVK8PLpXfi5WvzL7arGfHNEU2dwZQUQ/7JQk
         qihgA57R1gKt35uX6zn6mM2E1UoUxe6uw3QXa15qPovJUtdoRT4zqHjfA2us+sxF8L+p
         h52g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TP2zoSAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8751cec8csi16567456d6.124.2024.11.28.03.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2024 03:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TP2zoSAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGcMZ-0003X7-8J; Thu, 28 Nov 2024 06:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGcMT-0003W5-29
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 06:07:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGcMM-0005os-Hc
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 06:07:01 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d0062e9c80so875619a12.2
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2024 03:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732792015; x=1733396815; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kNjCRSoXw2jqQFwpOaavwKDFP4GzOqvpfROk6xC3N4=;
 b=TP2zoSAm/jipZkA17Sor8QdKYZpGcbDLqblorBi92fc43FG9nR3ltzIqvzCMCk/8Gr
 l8hSydpfPjhd4KQ39JoudsujcVuvT26MfVzEzN+UOhvQ2iqDJsY6BQ1hJ2IgjK9FWvXx
 te64vH+JjeYYfZdzHH0WZ/XIa2jPWprbkXuLXYG2vxlSzgYOD+kdjTTjw/EuL9vtOH+T
 v/vmOhujieYqBoJsDEaNLB6FXAw0PuxSM1iID4hNBwjFiwFd73Gp3m1gx7k/cD+PGNfg
 A6LIR68GDJgixLuF2qMPRO9d53bghtoLX59c25OfJk0L1EXAl6PC1kqTJFJTyPF9PduN
 V9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732792015; x=1733396815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kNjCRSoXw2jqQFwpOaavwKDFP4GzOqvpfROk6xC3N4=;
 b=XlO9viSw9/jbXQex9P/HKXgSVl+UUKIIsCdPMAcSNp04nHpRAo4qopG6CwePF1DJ0s
 JT9DfDLGuhY+udHWod3UST0H6dWewLUlEf8Faioa7To/HzHaLZavFYiYzNURn8P+FqGY
 YAiXnvOdocq7N6OsWgoug9Gqn7v8QmmBOymW/BLgzvkWqO+wG0yvk29dAvLtfmvXgNqY
 03jZJ4Hhk0Wbe9YYeVnPunlYwN3iAQURmExp+Kugkg5X+UK8r/z7uKdtwWLHTiuLBeWs
 uiuF+7oA9m5s0hiGeXbPM9xxDiQtrW+9BrGTZosTta3NT2XLskMg2gNZNe7pmxoHPnBa
 VFwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSx7OiiqH8fZwcrnEbKKkI28X4pXEvT4G+pwsr1lHYlGFOlEdR18d/bNssrYTKstWdinT0A0YIBA==@nongnu.org
X-Gm-Message-State: AOJu0Yzm9gdwHIHql9v1vGfY6H4m1frUCcygS+uAszZJo0CUFYCvLKDq
 H5ukf3Jybp/Zferoy+5eDqY1NBAS1H4x4txVZ6LsGA896AoZ4OIwiH/wxJHuICCiVIM271hTrPC
 4mf9VGtBWkSIuDWDUF2lpOnrKyj2/T2MdLzhiVw==
X-Gm-Gg: ASbGncs637CamEKT7LRNMB8RZ7y5RH9k0AfoXAOYDcDayOgiBpwUCsDCAqPE60VLlSJ
 5SBPxTEiDv70+kB4J9i45q5WS2ZmpvpU0
X-Received: by 2002:a05:6402:40c6:b0:5cf:f82:ecef with SMTP id
 4fb4d7f45d1cf-5d080b8c951mr6241892a12.2.1732792015459; Thu, 28 Nov 2024
 03:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <2e956389-289a-4806-8985-ab846d808736@kaod.org>
 <b520adf4-12f1-4261-a48f-bb74589bb31d@linaro.org>
 <a7c967ce-6bc0-47e0-aa25-cc89dab29cfb@kaod.org>
In-Reply-To: <a7c967ce-6bc0-47e0-aa25-cc89dab29cfb@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Nov 2024 11:06:44 +0000
Message-ID: <CAFEAcA9e5PFNoNh4u7paY5k5RnMgJ-3c++eGJd4u8CjjvDCvYw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce a new Write Protected pin inverted
 property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:SD (Secure Card)" <qemu-block@nongnu.org>, troy_lee@aspeedtech.com,
 yunlin.tang@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: Cg97J06jirxk

On Wed, 27 Nov 2024 at 11:26, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
>
> > Having to modify sdhci.c internals is dubious, since inversion
> > occurs out of this block. If this is the soc/board layer, isn't
> > better to model at this level? Smth like:
> >
> > -- >8 --
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index be3eb70cdd7..aad9be66b75 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -559,8 +559,9 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
> >       }
> >       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
> >                       sc->memmap[ASPEED_DEV_SDHCI]);
> > +    irq =3D aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI);
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
> > -                       aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
> > +                       sc->sdhci_wp_inverted ? qemu_irq_invert(irq) : =
irq);
> >
> >       /* eMMC */
> >       if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
> > ---
>
> Nice ! I didn't know about qemu_irq_invert().

I am not a fan of qemu_irq_invert(). It's one of those ancient
pre-QOM APIs that we ideally would get rid of at some point.
Two problems with it:

(1) It allocates and returns a qemu_irq directly,
so in the patch above you're effectively leaking that
allocation. (Not a big deal since the SoC object is going to
be around for the life of the QEMU process, but probably
the clang leak-sanitizer will complain.)

(2) It calls qemu_irq_raise() directly, immediately. This is
kind of bogus in a realize function, where you're not supposed
to be raising IRQ lines yet; it also doesn't do anything about
reset, so if the device on the other end *did* care about seeing
that 0->1 transition then it will be broken on system-reset
because the transition won't happen. (Handling "device is supposed
to have an asserted-as-1 line coming out of reset" is not
something that we do very well in QEMU generally. In theory
3-phase reset is supposed to help with this by letting you do
the assert-the-line in the reset-exit phase, but in practice we
typically just don't model the line-assertion at all and
trust that the reset state of the device on the far end is
what it ought to be anyway...)

I would not recommend using qemu_irq_invert() in new code.

I guess in an ideal world we'd implement a QOM object
that encapsulated the the "not gate" logic, similar to
TYPE_OR_IRQ. (Though for TYPE_OR_IRQ we made the mistake
of making it inherit from TYPE_DEVICE, not TYPE_SYSBUS_DEVICE,
so it doesn't get reset properly on system reset and so
the "what happens to the output on reset" is still not
really correct.)

thanks
-- PMM
