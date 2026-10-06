Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09291CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:45:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENB4-0007Kh-3O; Wed, 07 Oct 2026 04:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIfN-00062I-A6
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:50:20 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIfD-0002c2-Go
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:49:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8819033dbadso865901b3a.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791344993; cv=none;
 d=google.com; s=arc-20260327;
 b=KWS0CDohGZWL0a307EGygV/xwxLlaHxMkqdDzKKR8Jy6nwH/5hlGl5k0dOcMKqXDY/
 rKWW3rhDjSzZj4hPVXbKprS7Vx2jr5aGDShhHfLUqM/Cni7JCg/ovxRke0P/81w9/Sxx
 RGG/Muqxckso+uLFYuoK1nB1o7WgMl8blFFzA/+JJp3rCgpI6zZOnpVaXTpPMlCqYwsE
 2Hev/zp0iiSJj83DYFC8QX6DJv8YSvcEZTsu760Q8H9MJ+gtHkI/jjj7MkugRcM5/1FE
 gzRxGEeFw5oQLN2hH8v7Q6Trf6wfdQW8/N55TFUyWh8Bnm81qdE3p1ofH0yw65sRuY+E
 +sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8WK3zec8gA7pfREdAGlD6sa4szkDYgehy2nCGUiweF8=;
 fh=iEeL7+p0EA8UqMZWHQldFHp7aBq6KNFX2Iv8legLcC8=;
 b=F4kIJVJD7zlgPWT+FK5EWcjR6u05jGiNTd9+tQnSzLsBVsZ/Ja4Ia1t//v3juF39Ys
 hiheQaqiSAIcJI4vCxhpAcLfgixd6xd2KmOrpuvzarjPFkOLAriHyXiuPlZNiWWRL8e3
 l7GTWLazxF1vmRVJu4DOZmEzF0+MsYUGtKcWDG5hSmOlW0XtR3kcLKFkZ0A6paoR5HDf
 imsKiyLO7G9j1g+2Fah8+8Q861MGPQ1wT3o8cJMotaVPNsDY08yu65Iaswh1MT6A7NiS
 mbHpHhPmlxDg7LNF+1bkwT84AjXfBjoA4Vy1BGgK9N1zR8Ed4LLuZ/KJUViz4BOUObYE
 +LXg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791344993; x=1791949793; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8WK3zec8gA7pfREdAGlD6sa4szkDYgehy2nCGUiweF8=;
 b=lq58RpqikRjcY34VFPggitzWYtvsW2YXbEV5fWWtpiu950v/oKr3zJvNv8kPnbw1WR
 M6yEKupfnwvNLODduKq/N8xAbx9oecrSYFVjCC3f/CgLZP/sb1NRW5jbCcrt+cDkmSco
 t0Stm6rFyh8GPefJM/svhVMJOZoH3col90a9D24//Xcb+ATbuiPRdahUHOmuVlMlcFbc
 hSFiiWowwrSApeQM035CXEabFNNZ3qDredB6GCmXgDUGDlKX/JR9mk5DUafmWZXX6fOM
 YinEdFTqOSVYio3zYJ9iGfdoWjyjj/Ny4V3ZrxPPSwkjoOFBiplA2xMuI8nH1d+2tXpt
 D/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791344993; x=1791949793;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8WK3zec8gA7pfREdAGlD6sa4szkDYgehy2nCGUiweF8=;
 b=Zn/WSD0blXGaDYJrVI4AeHajNjhuEEUhBUXGUrgZx9At19Y84H+5CeicHWpimADLrl
 JF1nxssLO7/WUgZkNxi0XvFgsC+3iIjK5ZLq5zBdTnNcgOqi2QxlQo1L+anMeCuEL/XA
 mCcVNpdYLZncXhtLw9QdWiCZ+agGwmQW99RBOm9786BWAFdT1UD8lykGZs4SrZ+5NSf1
 LoTuMnehvWi11Wd9EeowCWcWEzA2gx0Ent0f3KwhoGNJEuT8p/+g9Fl9be+2YHPtf92H
 1ko6IHKYOCTrwOw9kZ6ilWW43xGKuYtTy8k6y0aFk0SzoSu7jI31Ep9t8YKFiO2cQ2+u
 P7Tw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzWioo9IUBi8unu3kjTnHNwaQfYVo8oRG8GZ+6dQZTGglYn8CV9I1QbVHWR7h2MvFrELvxO9hpLgw==@nongnu.org
X-Gm-Message-State: AFuF++nxAMV1D2riYffTGcoCwviqJ21Fbg9OGqGoDziyFRMAsbP7uHsZ
 2iXbWFprTbUijLOUxIvUxBecQ/BuS1cLLLeRxk+M0+s+HFXfkZ8de71swZ98pXBVlSHt1yvM84G
 HQ/7W74h1e1D0NomnmQMYF29ZZiEgmhIO++EkY97F4wb0btmzLt4GO/z1EQ==
X-Gm-Gg: AYBFou09/1Ca8G6CsMQxd7Y3WiigRItXy5YcpAnZVL/L2OeQutzad9xPgfUK9hWQIuH
 YBiNlzSs41KmKerwYr3uG+8ccpLJQQcHumV+hZba73KquFxhCxq3j0j+1dhAko99kvrUEq1/4e6
 jW9x1iBccwN6/uWF4yrTQAcAgPPQ9m9AqldioMxSFgeqnnCX5q4nlnAmyxI9fpKpWgrHUI31P4j
 j1+5TSIxoIIlaySlYkhmdHxkcr8jFxGXdTUk+TVd63QZuZVeQFWtVyfwA9Yg4QFGH/n2B5ELxJQ
 rQKQc4AVOL74/CDrrwbkXdWd7GG1CQ4mhrgCESApnYrCLVSQtQTtaktfgVW3yORSh6YR0F+Jvj5
 GtKvCehxZWllbHtEFNT0hR7ky4yn64Igda8py6cE=
X-Received: by 2002:a05:690c:110:b0:873:17c9:b054 with SMTP id
 00721157ae682-8b04f3b67e9mr2786957b3.21.1791284361945; Tue, 06 Oct 2026
 03:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261004090500.3082641-1-bin.meng@processmission.com>
 <20261004090500.3082641-2-bin.meng@processmission.com>
In-Reply-To: <20261004090500.3082641-2-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 11:59:09 +0100
X-Gm-Features: AclHuK_uCi8-12XdRHW0FiOqJOrRse9qKbJ7s6ql5zhkGQvmtOaKaNxVMtK9mac
Message-ID: <CAFEAcA_U-Aoo1MmvAm61_HxhbA+1A-YX1g+oh=1THsi9QKBeOg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] hw/cpu: a15mpcore: Model the reserved page as
 RAZ/WI
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 4 Oct 2026 at 10:05, Bin Meng <bin.meng@processmission.com> wrote:
>
> U-Boot's shared i.MX6 identification code reads PERIPHBASE + 0x4 on
> MCIMX6UL-EVK. The first private peripheral page is currently unmapped,
> so that access causes a data abort before the console is ready.
>
> The GIC-400 register map reserves offsets 0x0000 through 0x0fff and
> specifies read-as-zero, write-ignored accesses to reserved locations.
> Model that page in the private peripheral device.
>
> Reference: GIC-400 TRM (ARM DDI 0471B), sections 3.1 and 3.2
> https://documentation-service.arm.com/static/5e8f15e27100066a414f7424

The Cortex-A15's internal GIC isn't a GIC-400, as far as I know.

> Signed-off-by: Bin Meng <bin.meng@processmission.com>

RAZ/WI doesn't match the documented behaviour of the Cortex-A15
for this region in its TRM:

https://support.arm.com/documentation/ddi0438/i/generic-interrupt-controller/gic-functional-description/gic-memory-map?lang=en

"Read access to reserved regions results in a Data Abort exception to
the requesting processor. Write access to reserved regions results in
the assertion of nINTERRIRQ."

thanks
-- PMM

