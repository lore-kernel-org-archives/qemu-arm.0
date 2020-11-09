Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3676973lfb;
        Mon, 9 Nov 2020 06:28:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwb1TZEbfFUACB/SohYgDmzpuDeyGXqP4ljkBfbWhmI28ZZSSIiDmMH1espiARmvWOKXBv
X-Received: by 2002:a0c:b525:: with SMTP id d37mr14795484qve.31.1604932124864;
        Mon, 09 Nov 2020 06:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604932124; cv=none;
        d=google.com; s=arc-20160816;
        b=Ougm/DVi/x6bvdiAMlSFN2dAb4wedG44Rq3agQ9OBoo20UrJV9+pu6rjyt0F9V8OQO
         0TdFUye/80WcgQPn/lRS/rACpGEgGtTuX7ilSDF4KnYb411q17Ea6i563goXr8jrC6+z
         sQ2nyN0EizMOHZmxO5NPf8ruDO6913C8Ld5l2xR16JE+zzpv2OUDAcy+LuL5xasY6oIz
         VvwsRGbMO6KcJ69uClNDrm9IAc/ENJqFmXmhwlH7U6z78lEjzqqFfYCUmPDtkWHC43dL
         wVwZwgeYAYK8mWxqa0RnWBCsBKtk846tRbMbA7Qm9T9ETr5WEn2ze6HtmEnvZcvXozWm
         IMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ifc7tPDGaZEFSSRnHYJFa5ZhQiHy+6mT1hkV3fNAT8E=;
        b=LQzBugTGnpmkR9leCtTux9Cyv4lfGH0xR+Q2xq5L4S1NjUIrijbdN09bTnEoZN3gJ2
         kboHOMvqdlVj90hDPwPCtWi2v8v9w+buUXyfPQqw6KxbCl2y0XLfeLAZiSrK7XKaHJOO
         drDzBNZBNjwxgiRa31FSIVpXxFVaL5PcbhUQy81Ys3RjNoWwKlh4iCu7LLzlB4KFveQr
         5nODfET3X+iln/vXt7RBiYXxPZEC1ewZ64GTWpM0sefv4XgYlJ2D10kAcE+tihQuCWz2
         BSrNkrJGcVQS6cpsZ2U831gtp0LpwetRyOsYKLDBKrHZ9a+/cM6r0bGrCB73SMxce9yz
         m4Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GVhIvtDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si4880872qtw.347.2020.11.09.06.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GVhIvtDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc8A0-0007ek-93
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc83q-0000c3-Tf
 for qemu-arm@nongnu.org; Mon, 09 Nov 2020 09:22:22 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc83k-0006fA-A1
 for qemu-arm@nongnu.org; Mon, 09 Nov 2020 09:22:22 -0500
Received: by mail-ej1-x62b.google.com with SMTP id cw8so12496650ejb.8
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2020 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ifc7tPDGaZEFSSRnHYJFa5ZhQiHy+6mT1hkV3fNAT8E=;
 b=GVhIvtDD7OX3O+d4oxGRrJQHtRqCwaNAHyN4nwEuySNrNUJAK7dj0NGx6A3mSshz/3
 +vMJ5fsbjNiJXV5NRsi3uDYd2044N93gwEy2E03ETtKAIz3NpeiA+PkgX/X7Nk4aJDCt
 0Xp9Gh7c9xbhM2tWG5CUXpxNMd5zKSi31q3CP+fogvmoy2lNgs2Os32nJxvTT6MrSWaH
 TMX2DPnO65AsCoKaVABsnn+/aU47HtO/AEwOGgRg2QhCZ0QCjiC17ZN3bmHD0dpMBb1u
 dGNRqUoNgLwtf/XHF9XiLICX69MqBLSXYaClVrfSNxS0H6I4My9WZfqjuVEdHsCcnmIT
 QZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ifc7tPDGaZEFSSRnHYJFa5ZhQiHy+6mT1hkV3fNAT8E=;
 b=uO1vt0Fd7VhE4joOoFpCZJaYdIv84Xh0m9kb1FwHnODZUkrkRNhQ1ncTE0K0Z4bwMw
 T0Puaxi0ZGvsPRiEspKEwa2RGQSu2fV8MG7DXY1azlgNAMTe3TY+uV+l6WsHUcTeenEs
 HZyi/RlsLKlEozX6I31pbH+u+02UoZLxdcV+qcBOCalHI1T9v+R+Fwq4dhtTOufDE6F1
 RFlA6yBgu7X8x8CpbTsKZbGhsQeImAZ6yLF2yhRS2PVXHoz/Net72EVeicVZs7V25Et+
 8CPp5YC2XiEwGtMYIL1+NkAU9JP+IKl3LBhAQOZw/5Cjn+Qf5CrhucrHK59vdMcqqMvn
 mnFg==
X-Gm-Message-State: AOAM530fopw1rxP0NKnNYD0o/nTQsxSuVAOn0RROBcmHIub6DCNWga0U
 FKmcvEq/Rdg+bOxm9Qmtar6tutu6LNuuBzbiHOadKA==
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr15941391ejr.56.1604931732610; 
 Mon, 09 Nov 2020 06:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20201107193403.436146-1-f4bug@amsat.org>
 <20201107193403.436146-4-f4bug@amsat.org>
In-Reply-To: <20201107193403.436146-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 14:22:01 +0000
Message-ID: <CAFEAcA-DAN7_wXDLxCfzwWDMysYzQyT5WUjOQrWHZ87t9Q4QbA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 3/5] hw/arm/nseries: Remove invalid/unnecessary
 n8x0_uart_setup()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jan Kiszka <jan.kiszka@web.de>, qemu-arm <qemu-arm@nongnu.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skqram0Az/pA

On Sat, 7 Nov 2020 at 19:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> omap2420_mpu_init() introduced in commit 827df9f3c5f ("Add basic
> OMAP2 chip support") takes care of creating the 3 UARTs.
>
> Then commit 58a26b477e9 ("Emulate a serial bluetooth HCI with H4+
> extensions and attach to n8x0's UART") added n8x0_uart_setup()
> which create the UART and connects it to an IRQ output,
> overwritting the existing peripheral and its IRQ connection.
> This is incorrect.
>
> Fortunately we don't need to fix this, because commit 6da68df7f9b
> ("hw/arm/nseries: Replace the bluetooth chardev with a "null"
> chardev") removed the use of this peripheral. We can simply
> remove the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 76fd7fe9854..6215c18d627 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -789,16 +789,6 @@ static void n8x0_cbus_setup(struct n800_s *s)
>      cbus_attach(cbus, s->tahvo =3D tahvo_init(tahvo_irq, 1));
>  }
>
> -static void n8x0_uart_setup(struct n800_s *s)
> -{
> -    Chardev *radio =3D qemu_chr_new("bt-dummy-uart", "null", NULL);
> -    /*
> -     * Note: We used to connect N8X0_BT_RESET_GPIO and N8X0_BT_WKUP_GPIO
> -     * here, but this code has been removed with the bluetooth backend.
> -     */
> -    omap_uart_attach(s->mpu->uart[BT_UART], radio);
> -}

This deletes the only use of omap_uart_attach(), so as a
follow-up patch you could remove that function entirely.

thanks
-- PMM
