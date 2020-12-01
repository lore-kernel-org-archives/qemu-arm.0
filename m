Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5782502lfb;
        Mon, 30 Nov 2020 18:04:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaoPRUb2tns4MxLo7+PWLSA48VrAXoyFxwBwaDZ6erforypgzBL4LprGSghnxzaY112BFt
X-Received: by 2002:a25:2d05:: with SMTP id t5mr563574ybt.297.1606788268367;
        Mon, 30 Nov 2020 18:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606788268; cv=none;
        d=google.com; s=arc-20160816;
        b=g9odc4LKYYQgM48fjyvjmaEqaiPdc00MIrhyxc4klM4aVEo7IvjzZsP+cTg91OIgiF
         8LAz7CUQpW8nhYgmEMhbLNCPt9Jmtleq18/dq0lCPpm+IcdbJ6VbmIoqc3kw//SY+FA2
         I5sbB0lYFjEfU2/Z9qxSKnLkPtgLjMLLkKG8JX1S7Zg3x4uoSMwAvwSup+XcthV02JzK
         ByQBXEgdIm5lwZobBMyGnV8VhcfMB4OBakg2Dy7+TnmdLFr/U8Nq2A6+gUCVqVCjA1M8
         dUt/QWJAIMmsukaPJRPTwg3GXJiIYOItD6jAokJROjUTV6KjZ5oU1j+eyLmNnahSkiA9
         WfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AyocmZBaWefAPt+dNjMqu4XTXi7KxfPksz5qVukrjQo=;
        b=IUN/O61j/rURSXPSzo1cW2DzaVv3S1Q9sim1Wt3ZI5NVnUFiVlb+vFtrguokejj5mL
         3n26LNQRKaMBEiT7FZx0xpMSH7tH3UgAG+nXaOzMALIsZ+2XdGAunaZ6LjX27d1nrIXZ
         rTik93Fov2z9PrB+sc6FIKDhq1JjwWMZOUIMFymIZPqRKRpDIrCqCGhkwsNbBPqZdA/q
         /q2DMuQKAp00XkM9gXrA9Mtrdc9lFopMhYk71OdppnhiXp8UoAwkj51ER/CqEG35C/4T
         qkkLwWtKYvu5iuJcDLfCLlZE5ts0Bp1Yh1ei0lGAUIwQb46DMU37YonuI23oKxSLxY+N
         1/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QfdRoERr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si257185ybb.251.2020.11.30.18.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 18:04:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QfdRoERr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjv1n-00060o-PC
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 21:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv1O-00060T-OL; Mon, 30 Nov 2020 21:04:02 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:45295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv1N-0000FV-8F; Mon, 30 Nov 2020 21:04:02 -0500
Received: by mail-il1-x141.google.com with SMTP id w8so133046ilg.12;
 Mon, 30 Nov 2020 18:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AyocmZBaWefAPt+dNjMqu4XTXi7KxfPksz5qVukrjQo=;
 b=QfdRoERrFsXBpux9BcQTY+qPP7gUXEO8iXsl/WIwfOLIXPrPu07mN18tJTXMc+h58g
 en8k0UACAy7+e8yaxHN1DaCwvP0Ry0lq5dc/JIfFWfyZeeGse0TmAqBN1gNxktqdyse5
 qnIc8iAXPBrlV0A8XfRH4QDHYJz+Tn1DmdX+cM9LtG0x2hulZmYyw5qmXdctrLI7/0pr
 HqY7m6oOrJGfcj61q0Cgxeby0WbM2tkyT/9iE56uISoH1Eey+IZ1MCm7mKaLk6mwo1U5
 DxrH9iRGUF6+Lzq/kVGgxxrSR0xJw/XGzYmJPirHR9pN6UJGNPeIFNxHWdjgV6vVy+ZE
 hgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AyocmZBaWefAPt+dNjMqu4XTXi7KxfPksz5qVukrjQo=;
 b=Y0cmbo9EvnOMrYFT7GT6c0WMg/GE5xN002wsTmwqOW5DurumceoXpLg64lf2LxR8SO
 t32L9J/AnCPEvkckvP+ydXUH+39lhX+ESl4EvEqBa24OgoBrPVajgnfcIHkDBnpWjQQr
 UZOipt/KpWKf1QMlbeYFkmOjVrzLaGaplBmS6LZ5zp5akeAvHfXjEFNG6mj9rfFWhU0M
 QbKD2bL0vDBQHXZyCdYzHcYlDz/0QPR7SO+Ao44tZ/JL+jOVmKRQjFR/K1CNEL2HseXv
 jZQxU86Kr5TRGjj6FKLMqTHhFwof+xsExKcQ/sbyQ3c2P5iIovYUcnIpHK4jE9gYOvHt
 /nwA==
X-Gm-Message-State: AOAM532uatiuo4vB0Owyhc8J5HQjfS+boOV4CGyFJF4HKqxM1V7towEx
 5rgEhzDvsp+RT02xGuNO1B6NKwoHilLOZYl6kzo=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr659170ilg.40.1606788239431; 
 Mon, 30 Nov 2020 18:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
 <20201124094941.485767-3-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:51:42 -0800
Message-ID: <CAKmqyKNs1u3ZOZWj0i07qVGtG5L20Tm_0WOeRtdBCWH5yZ32+g@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 2/4] hw/arm/exynos4210: Add SD bus QOM alias on
 the SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p5+9WVtxuq7H

On Tue, Nov 24, 2020 at 1:55 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to select a particular SD bus from the command
> line, add a QOM alias on the SoC (using an unique name).
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index ced2769b102..a60f08d372a 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -408,6 +408,7 @@ static void exynos4210_realize(DeviceState *socdev, E=
rror **errp)
>
>      /*** SD/MMC host controllers ***/
>      for (n =3D 0; n < EXYNOS4210_SDHCI_NUMBER; n++) {
> +        g_autofree char *bus_name =3D NULL;
>          DeviceState *carddev;
>          BlockBackend *blk;
>          DriveInfo *di;
> @@ -432,6 +433,10 @@ static void exynos4210_realize(DeviceState *socdev, =
Error **errp)
>          sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
>          sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29=
, n)]);
>
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", n);
> +        object_property_add_alias(OBJECT(s), bus_name, OBJECT(dev), "sd-=
bus");
> +
>          di =3D drive_get(IF_SD, 0, n);
>          blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>          carddev =3D qdev_new(TYPE_SD_CARD);
> --
> 2.26.2
>
>
