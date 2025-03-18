Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3003830njb;
        Tue, 18 Mar 2025 08:18:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYJIgUp3qQpITMMuUlgeBGmrr4jJwWI9x0Z+A5MrOj4MxphJFo04C2KCS02soegbNy5PPeksQfl+Q+Kw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrWCYd+Eti8MeDgSkdntjI/ygVt+BirYvCDJsFtjTjLE3/AV1gi8WpJ+WBnRwzVfM0iXtT
X-Received: by 2002:a05:6102:5712:b0:4bb:e1c9:80b4 with SMTP id ada2fe7eead31-4c4d8ddbb02mr4463829137.0.1742311109263;
        Tue, 18 Mar 2025 08:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742311109; cv=none;
        d=google.com; s=arc-20240605;
        b=Hup9fVTgp6drOIDUGIlFxV4/ncKDd+CJ+h8fBI58V9APtnWbrjyBckVydatmrieo51
         aUwQeLdCcOm5/Gdaqu33tLisj9izmGbWNqzzUqPbVErvluFXLv76z8S2pEhyPvtZvmIj
         NFYvxk8QbJjiwvRSLIaPPGsFkz67wnQb5T13SRggxI7uHAAGXKcmhLhqkzje/yFHs6VQ
         QRpVbNO4Nf/ekOc4oLcv9juO+4+Ll1AsuPxjgCxEtc4u1b18Z68DV5ccJ+bTa+kb4bMj
         gYKnz3slREZMnOBj8P+rWH/8rqtW/nTlx61cbVOVW6Ye087zaHhhBWSzjZH6MpxnhBTz
         ncMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R1SeOpDbVoflkzU0s+KaAenmYo2MGwybLQsGDksjjJM=;
        fh=pQfliYMuY9jYfDg84AMvyVaZSanBrZjRJrqsmJqjaoY=;
        b=ewOtashbxYc/cbcXr6djeySMq8OE2RaXw1v1Ffvf7y19i2yq9FFQwdlzsbox73UH3l
         FulWw85aDi2Gy+aToywgxnb85sNycSufV79LT4gzxJ9rgqg8H7M3O2lDRyo/R6SEZth+
         OHtAxcjpaLBKLZVIOGnfxDxENqTKH8YBTAqA326hHv7+Kq23EYm1ayRpgwIE3O/mz+ip
         30FoJxDrHlsP0+Hge03xM5UosjMBrg2uCD/upWmXbtdHXCq+GJP7EWQYoICk8nPRwHBK
         pJ/NHESwb3VpFWf9tKyNshvN2iNCSkhFIyZsL/+BCMqfv7OV/Erd0hF9pm+41yoUq7EL
         5/Pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsiL1iJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c37484a1cdsi2932210137.174.2025.03.18.08.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 08:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsiL1iJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuYhV-0001Bb-7H; Tue, 18 Mar 2025 11:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYhS-0001Af-6r
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:17:50 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYhQ-0000MQ-O5
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:17:49 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e63a159525bso4106373276.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742311066; x=1742915866; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R1SeOpDbVoflkzU0s+KaAenmYo2MGwybLQsGDksjjJM=;
 b=MsiL1iJxPCg+U7KsUyBzgRZjv8YEOk+xD2Iclk1/kz6WmYQMEAlM1TgdvAre+/fV2p
 8b5ad45t7xOueYUg22lbs99htynEK7TY5nhOz9x0MnsX7eTtrMsH54v7LeIlOhqoezl9
 o9tGl4eZtgbjdqu0e50UEWKOJQgHj3lT2MJC+qjv0QK1m/hTtHms31I8xCHQ3BEqDgX7
 yCB/84f2c/JZJZTlhHOxXc7fHicms4zyBiIM4Xs7LwRui220GueRpXnl2JuMu6e+AkTZ
 5yB0NT1M8z+0YftOQN7GFq0+yYO+2WKLoUkawXrQ0L0F4hdTXTmAel9VJN+7jn0ysnrX
 D7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742311066; x=1742915866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1SeOpDbVoflkzU0s+KaAenmYo2MGwybLQsGDksjjJM=;
 b=Hbtb5QJSNLx9D+9UpE3nI8RR9RtuqzsfsORrvAfJAuiYbEdYvswjBPF/oTN5gbjYyv
 eJpL0nsYmDVatX+bigaUTAxuMIoqdpNqgoYtpZ+zVrzdajOaPV9ZaRyTlOu4dNdv/GAb
 QBR6CBuHO/YTLSWglKekm7zntNhQCD4jqWlam1GRrwUkDs1pk+bOT2BZTeQV2yhtL8hy
 2JxjMAUGaHRr0vsYaDUEwz9bnEA3CGTlw9KC9cdD4EYasMImcgltJjGLC/wVY8pptLa8
 4hntkJC5wsYIdeHs8PjRGYQkkGyPoQ2wx297kH09h/6LjqO8X9Xfn0+vbh6Vsdz/sFgx
 LyhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtS32+xJwlASzcA2UXsoSmNhT27YeGrPPWR2DaeMXtuFYP3sa5luHeEfZ/H1l+q4jQoMnjzFlhwQ==@nongnu.org
X-Gm-Message-State: AOJu0Yymq2fMBVew94yV8WfGW6jWg/m9xHR6jXoSOsiRjGQZUKMHA7wd
 DKcmAfRxqt+hUTFmrBPKjq24+Rqf0468r4nhR7jU2mCkgnehK2Pd+qFuH45uKUGIIaqGuSVJTfX
 suYhLn1MOMCTk6aZanH540qFqwRTNCQvV6civ2g==
X-Gm-Gg: ASbGncsFI7KKrSV52LaiSoHrT3y1OvF+pAfS5seiFOd09dOJMlSUHNLpD7U8kHmTYcf
 hy00GBm3nl1pyHTCDmvbQ5y0MLsI/hQhb2oKCUOnCkRKOkehs78l0AWgdNDHd16rwggC9xoxiUO
 R2IVVRGNzUzPMlBRa0PSkpJUDPnk5MrVg1l68lKg==
X-Received: by 2002:a05:6902:1690:b0:e63:cba9:4cb1 with SMTP id
 3f1490d57ef6-e64c0e3de0bmr5853823276.43.1742311066597; Tue, 18 Mar 2025
 08:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250314183224.21822-1-shentey@gmail.com>
 <20250314183224.21822-3-shentey@gmail.com>
In-Reply-To: <20250314183224.21822-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 15:17:34 +0000
X-Gm-Features: AQ5f1JrDc_c4PmCT954MtuWyzIvg3vsoaYMwu3dNehayyL6DNHIVHV-7zO7vAkE
Message-ID: <CAFEAcA_z8mpTgOyp+xn9pSy0p2kx_EydXBHZ4ahstg46YmArFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm/fsl-imx8mp: Remove unused define
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: RD+cmkqSSrCl

On Fri, 14 Mar 2025 at 18:32, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The SoC has three SPI controllers, not four. Remove the extra define of an SPI
> IRQ.
>
> Fixes: 06908a84f036 "hw/arm/fsl-imx8mp: Add SPI controllers"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
