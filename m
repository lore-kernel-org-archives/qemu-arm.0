Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp274795lfo;
        Tue, 2 Feb 2021 08:49:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrtZYZcI1+dJk5kFA+w4YlEutvpYxxeNXhld3ZLQMm+j0Wxvgrr/7ibQuj3TP5MTGUdoPQ
X-Received: by 2002:a25:2057:: with SMTP id g84mr32273439ybg.133.1612284589875;
        Tue, 02 Feb 2021 08:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612284589; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzllFfptkL2xG/g+jgK+QpGfnyX9yCx7hjJzdZ62dO0GrTHfgWC0RUvLBG0VSZbuXr
         QPCuz0YaoFWlwWu4+TkzpvbjPXVPCulNQs7gi085Kjw4oYkcFLa3F+mwOuVt/S2p/yso
         WHSGDobn6tzsIg/YXjbG6btMJa88+jkv9JmoY4v1p55/2NuQwpDDN6VslOKAHi3sm/15
         r3LX7iTidIWzVfBzenbYO+dYwWdQAG3+H7LX1J3tJHBjDbL0/Iclnqin6N3cFVeU1LaT
         IdeWMEam6MEDR3ih+ZTMdIItgECrTTtRAR9x4u/zcrSJI404LjkBKtk2tJHoPsDbyFF+
         TcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dMdFc/ZPdE6IqyYDyHhRVdQb90fMPhMj3kfL4wEIXo8=;
        b=qqtRUtWM5gkNHQQrxRLQxjHPjRVciotZyNO0toiU8YZjy1dFvhS1Of7d8EoDxZld9I
         /lJdutEsuA3CKTzPo5Dw5KfNerYxE48naWt+gUIie52FM7Wjd3PS4Kw4sR7KvDAiknA7
         2ZqS7uQNIH7VNn4wWXhMdduHU23lWIrxIJuXR1ukG5JCtBGxf6u/e1cJ36u11EPSMDT2
         jMBzcW0k/wW1e+e4WJXjiFJA7OLISSQUxtkefwY5RzOfTMh8q19O2TtJbRGRIPr4SmzM
         AJm1U2dK4NFIA6+7NXCeV0iHkNboWhfjywhqBDrXwaAVXJDoZLir9S4aoYJSY8Ywf6PL
         GEOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m1Wa2Jzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r141si5653218ybc.469.2021.02.02.08.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 08:49:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m1Wa2Jzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6ys9-0004xl-70
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 11:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yrb-0004vk-2m
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:49:15 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yrY-0000rm-5L
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:49:14 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s3so9972232edi.7
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dMdFc/ZPdE6IqyYDyHhRVdQb90fMPhMj3kfL4wEIXo8=;
 b=m1Wa2JzgMevYoUfm1XRh5Lj7jwmLq5O4VwihKeCxy5QNCQlQvsHl4FknwI3dzIF3WE
 b58amwJvno133AhPytzcXV61NnYuPE0H+1XE74VqvBqU94dnqcBfRe1n/r72K52Yk3gI
 C3rhExEtBeHHPhsqU/8xbBgl1jstRy1bjr8ciII4K0Yw3U8cLGsbW+jMCteCL0VsO4Oq
 qH0MS5Kqa0T3pITQDoPV81xQII8jotf2kcqLWwcQaAz8FiW7EdUShhOTbYdFBqyNOHVQ
 +nYIl1cdiHsgD8vlZBfubi3YlS1Sd2HDG/VyqmcyOASPjy5wNhIj5b2siNFh3h9R7eL0
 6tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dMdFc/ZPdE6IqyYDyHhRVdQb90fMPhMj3kfL4wEIXo8=;
 b=VysUmfSCBfkDIyplSruIGmCUWSvAOeK+1rNXUw0rEhGBc8M73tan8zXPJxodHibyF4
 vj0rGc3ZTIX3ftcjOyNSoU7h5XmqVl3VNv3SB8PtcbeOZbaGgMBPfJjniOg7K//goQZA
 YlO96o8mAcuMD+JWkGpYywpdIQwu0XN2e7F+LaLToU2L8Iwkby5rGOzd1S+wbKiD3h8N
 XEQ0ASp+M3y7qJ9anZXZ9LrkmrDRPHCFJpWMUWYP+GlwPQ9i4jCgMDOwtRfMPe3+xEF3
 HQG2ESqSe9Z+Bmkp0PHfMWzZbfwekBL88mesXv12sH648is2IQR9x8kizJqqkU6NidDU
 KJGg==
X-Gm-Message-State: AOAM530PppiEM2n5c5afCJwwDtojsPXOSEEjB3fZR2nQRHyFvepUsy5p
 T4//cDmul8VWmhdVefuV14+ZBrSTHwnJzydRlXK8Zg==
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr16606763edc.146.1612284550470; 
 Tue, 02 Feb 2021 08:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:48:59 +0000
Message-ID: <CAFEAcA-z3CfCCbvR=MMTcvB9A=Eig5uFLewvu=fYUkLhAcB5-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: Misc trivial fixes/cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRxsv76T9Wly

On Sun, 31 Jan 2021 at 18:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Trivial bugfixes and cleanup patches noticed while rebasing
> my "Support disabling TCG on ARM (part 2)" series.
>
> Since v2:
> - removed incorrect patches added in v2 =3D)
> - more fixes for Versal board (CAN, RTC)
>
> Since v1:
> - added patches to remove 64-bit specific features on 32-bit build.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
>   hw/arm/exynos4210: Add missing dependency on OR_IRQ
>   hw/arm/xlnx-versal: Versal SoC requires ZDMA
>   hw/arm/xlnx-versal: Versal SoC requires ZynqMP peripherals
>   hw/net/can: ZynqMP CAN device requires PTIMER
>   hw/arm: Display CPU type in machine description



Applied to target-arm.next, thanks.

-- PMM
