Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F40CD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSsvJ-0001ZP-OH; Fri, 29 May 2026 04:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSsvC-0001Yc-Tu
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:50:28 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSsv9-0003CU-RE
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:50:26 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7dc78af7371so19885847b3.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780044622; cv=none;
 d=google.com; s=arc-20240605;
 b=ftqHswtv01IrU7pApEsGEK5XDQhEASk4l4WmE4tK0bwLVplqqPEYYDRJlPWyw56AQD
 Gaic3U/Vf1dbgunIAraQh0Kv5SsXm4wDPmZsDVjS2eaa6BrEj2GMlD9Z0cWXupMokUDM
 4QtLGevPKAhdygVpuhgHqCi/DmXCi5s0GgllBSF/NsERpdxepXkz4PPARN5xZ2ZRmCug
 tI190GbTvKwpGOwqpc7HWEkYjoeRcKn3VjbwMi7Q20g1h8FQc6DBMEBlcQDLzX6iO+jT
 P6eMB6UUvXWQsVeqXz58vyl5GJhTNTvXPySn2l1wK1hmWkKlrj1Xv5shOe120FeySl0g
 t39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DrVOr67pBSyoz+W7dxZk6XghmFcY56Frp1nv3yrTup8=;
 fh=42Dq0s/m0H4a426PDEi6CSf86xXlr2XuAMJ5Rtt5Qr4=;
 b=krselvAygnr7TmHviyjtBUJyqZa2YYGx0l+lDhLeXj1ZsamM3CyV2wAg0VrL5XKGSB
 SIXQHZ+4sFGSy9/eOvdX+95I2/GIqi7TuOzA8tjPPISmen+UAFc2gJntdjNBEV29Ya24
 fgacQ7eUoSOGTLUZWIhyHq8gQ51SAVQydDRHLpX6QslM1bViaqIzaWOhBNTLTBNdcoqq
 r2Ze6qn4GXcpi4GrPNgckkA+frEWjR5e9EIVGsRImiVqD20kuRsnC9g4Z9xWESiJm+ix
 rcUTNnizQcFd8z5C6OanJ0GtCouUE9vAavVSUSZx09MIigk3agO6WPxtKO4UHsKN/xWV
 FcUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780044622; x=1780649422; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrVOr67pBSyoz+W7dxZk6XghmFcY56Frp1nv3yrTup8=;
 b=gFzyYNjnZl4/N/x1sGe54Ueky2tZl27RFyRGGrmJg/RkDxdFWFEDT7BcljHTNvwebM
 Njaf81zqI2tD71+oimJ0HRA1pLQjZHEPYvWcOfqYanA0zQtJyyHOkyURCbIzmW2nuO/k
 0AlROKImQ/jzvrIeghKYo6m5DJCMOuJzWCssjUaXFjc6IyUZ/IfnPvCJ7fn1mwUV3v27
 UPFmCFmA5jIfdWWyPbF+kFGPpl06XTMxfTS70Ti/thU8a/DriaR4Ks79ySWhdycivDUQ
 bxx5PleAbDgAmcvwNmbittQUYR7uCJBssrm8LNRDIKGHeP6+ZeNTcJOQ87qon5Y1dbAc
 BOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780044622; x=1780649422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DrVOr67pBSyoz+W7dxZk6XghmFcY56Frp1nv3yrTup8=;
 b=hz93Ni/P3eQQWzmAAetmp3V9wvGyuUIvaNgMqXPEWQO0FfZZ+ohWECvp+a59K+upAp
 XeR6gpKlCxpt2B7l+a8JK9320BgMV4Yjw0a2zSwqUfdp9DmZUA4BTHWgTzX2FAabWEdv
 NR9cQLWixNtMKIrd3qw4T+NK5i3cu+csHJBR64NiLYB50CDYUhNvbtKLWnYpIQtPN5wF
 fh2vX+vzhfV7n6AYJifjgE1OqfiK70pa2APlWzIjU/eZhpeyYNQOqH/HYkSTVpAMezkv
 RJ9icU+rjGaetpvweEfmj7sx+W38F+5JMlbNLBKPnGvdfodla/uvSxZcAWc5hNlco9Ll
 6gNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7n7LBMwmfujH0wES6A7CW3pvV/bwVKBU8U6e5m8+xVP43RSzcG1UmQFnr3tTdQw0NLtka53W92A==@nongnu.org
X-Gm-Message-State: AOJu0YzHWxjgy0DSyAlIJLc8Wrh+zwlsL0Zx/5ta5RURXyd7v3fm+xEw
 ZnR+hQkELDmLH/oocVjl41T0TUz7Mm1f8sut2upUaJrqQRyfgILwGm0jZ/7onkuxdtQywSIXmNV
 oRizpkikox64pQQ7MIMu7kJNTldovzKMkry03ER9FzQ==
X-Gm-Gg: Acq92OE067GShjUofYwKjKW5mfk6MNJtn/33qUacNhcknx9ECxXjjCOdwBUiLNExkq/
 kBZGrMVGQpQuTfXOKRI8y2OJrN6ZmaiRvB/WL4deExUyXH1/Hx4g6GoM/WKqQlbG7zF8FzMyr0G
 bgWxWWPw4BmFSeRxNXMU8S98aVXj8qyqtESC6160+hvX0naCZQYr/g5sxfAHcTtrKRo88cKIUdK
 9s6zYxZaitjvVCjMjBJhzyRSXxrqe2bLOKiDOnFBXhUPWsMtjyktxLDI1d+B3C3QoZ9TdrR3+V0
 eYu6BCPmHdaBZIrQDuH2JtTT2lyAbDMFo1Xp6Pbkw+sINl/Uh/GICLA6mYdLbl0Gb1S4Kw7ZC3m
 12Q==
X-Received: by 2002:a05:690c:62c1:b0:7b8:3b51:c9b2 with SMTP id
 00721157ae682-7de48f927ecmr15334657b3.23.1780044622455; Fri, 29 May 2026
 01:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779986496.git.matyas.bobek@gmail.com>
 <51fe163b259b9ff315377b952d38665a18351b0d.1779986496.git.matyas.bobek@gmail.com>
In-Reply-To: <51fe163b259b9ff315377b952d38665a18351b0d.1779986496.git.matyas.bobek@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 09:50:09 +0100
X-Gm-Features: AVHnY4IhWjWRG4X4tVHkplq8_jXuu7_G_MkTucshARgDb-mSR8JD7TvUkrwM51A
Message-ID: <CAFEAcA8RM1i3-ixhkOPVRPsyEEYepXL+QjWAY_V32EpPEOux0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] hw/net/can/flexcan: NXP FlexCAN core emulation
To: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>
Cc: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>, 
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>,
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Nikita Ostrenkov <n.ostrenkov@gmail.com>, Andrey Volkov <andrey@volkov.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 28 May 2026 at 18:17, Maty=C3=A1=C5=A1 Bobek <matyas.bobek@gmail.co=
m> wrote:
>
> Added the FlexCAN2 emulator implementation core, with
> CAN_FLEXCAN Kconfig flag and MAINTAINERS entry.
>
> FlexCAN2 version can be found in i.MX6 SoCs and others.
>
> More information about the implementation can be found in [1].
>
> Some macro and struct defintions were borrowed from the Linux kernel.
> The original authors agreed with relicensing them to GPL-2.0-or-later on
> the qemu-devel mailing list.
>
> [1] http://dspace.cvut.cz/bitstream/handle/10467/122654/F3-BP-2025-Bobek-=
Matyas-BP_Bobek_FlexCAN_final_4.pdf
>
> Signed-off-by: Maty=C3=A1=C5=A1 Bobek <matyas.bobek@gmail.com>
> Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
> Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>



> +/**
> + * The following macros were originally written for the Linux kernel by:
> + *   Andrey Volkov <andrey@volkov.fr>
> + *   Sascha Hauer <s.hauer@pengutronix.de>
> + *   Marc Kleine-Budde <mkl@pengutronix.de>
> + *   David Jander <david@protonic.nl>
> + */

For clarity, we should add a line to this comment:
"and they have agreed to license them under GPL-2.0-or-later".

thanks
-- PMM

