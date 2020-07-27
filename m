Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp33970lfy;
        Mon, 27 Jul 2020 15:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylAhVBMMIpNKBqvswtnrt6lcTM3ZvHwHpDDxlrq4JzChiC7fYYhT20NJOK55gg11wpMZSs
X-Received: by 2002:a25:6d08:: with SMTP id i8mr34562298ybc.6.1595889131714;
        Mon, 27 Jul 2020 15:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595889131; cv=none;
        d=google.com; s=arc-20160816;
        b=x6Us9BIkCrrQtTvY07ZxuGQbJ9xMcnK5W21siiQQCIZSWIaLO2Pp+33RXj53xaTbDK
         rqs/rNHJHJAn8QJgYQG/FZWMoqxciLsy7tmBlnQMBO3Po1cdqu6dADLn5MyesnRcJ3vM
         P7Q/aKjV8wR900HfleTLNiCO7YtrCniy0rmiaOQ1QDmKg6AAcxfYz5dajCHymdwNARw6
         csZ0k90LVWaRFLsQsNCaMXjk8tgT5o2VnMVJ2Ag/YXwS+AnIGjYjhC5/SdMbfAtYbGCQ
         sqXjmvvA/afyvF4X/KJOE9YCKIOYRqEN8yN3eajXw8vw87E4EIGBrKueINfjL20SfEI1
         BEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9kq99KriXlIbHZbsbGw9fV6+ZK//0fEX1E3FO43lfX0=;
        b=Xo0TwD5/DhQymP710G8Z4oGyBeVPJESnKVyqiBoa5HJJ1ajj8RPTPKY2JFAEGdV779
         3IBtMMPh1eeEB+RZC8JzyzwmVUs04O+pW2aON57N4nq2h0vaQCw9Z6c4XIkB8VcsJH6F
         MApi5Van1k2fxWtqivcfFNN3ly5WYbQlufXilSraj6midFYZvx9Q+qjBGr/Cg5j/e92a
         6DEI8lteH2bk7uea56pLHTAok3vNceACPTJZenDN/Kb1pXb7e4W8rNyNNzAfkxcBz1tS
         1Fi5isYz4wdnF0cepI4nRt7wlkPq0/4QbG54lUmhK5uYr2oZ6SaB3fuUTE2Wh3btRQ2Y
         WQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nO3fb3b5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63si10489827ybb.47.2020.07.27.15.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 15:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nO3fb3b5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0BfH-0000o5-4I
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 18:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0Bdy-0008LT-Nq; Mon, 27 Jul 2020 18:30:50 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0Bdw-0000Gt-Tg; Mon, 27 Jul 2020 18:30:50 -0400
Received: by mail-il1-x143.google.com with SMTP id e18so14503050ilr.7;
 Mon, 27 Jul 2020 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9kq99KriXlIbHZbsbGw9fV6+ZK//0fEX1E3FO43lfX0=;
 b=nO3fb3b5BqyoxbuCiYM10VWAHSSR9u7md+df6C8VPnZoqIpDw4cYj3BgkHLUkjFQks
 ged5ufmX8nJ1D0EJs0fHzhaU5zKjNRtZDeot/fp/cHN3C7DeYTKbjvc+6pOrL8B10Aec
 3GOAFVvsDZNlZe3m/XRGTrpEtSwTUswf4GeL21m4uM2nqINBbH0QIfTxCUdBD2MTeCrh
 M/9NKrrls5zNSi8R/wqNxCPczDb3Etfj4+kwYRZo6Zw21ep8dKijJFcfbOKtGyLIxslS
 RNhAduX3UqXXyjC5bk7axDDAArLU42bWcMdIeU5rdUIO/1+qa9v/izQRF7Dc0zLjeYHq
 nesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9kq99KriXlIbHZbsbGw9fV6+ZK//0fEX1E3FO43lfX0=;
 b=JuJ9BVpidQ0OGeYzSZyM+w9wlr6jiXR0dWENrTEm36U+HhJ/bcEV8kaXS1A3auhfhZ
 mTX8XCvxTZQ6xQVgdDMZGC2cphviJJVSrkk/k7Fi6CIox3pwa/VMLgEXb0VD1GGEE5M1
 Gyjq/QR1ffEO5VfCPh8fn2MQxURkD3gy+lz+uBb/iqaJqg5V5ByuXBUz4WihXOXyKBI1
 ACRrLfvb7wSMoFZmJiUlsNtKG4ckBG6YmebM5rmOHnNYianQr109TUuFFEatqzC/zz8q
 TitNjpSJawVCP4nBp8tYgaa1qLW3N6SDVHStiiYgoSzJWstgxPebczLWwGubNSpI4ds2
 zd6Q==
X-Gm-Message-State: AOAM532DCJEjErp579HCpPsJweHqOnOISvRRwc98BzA/b1j9YzmAPqsA
 /n0nOjS3cTcnfJHwBI3RFx3b90D+caCuHoZNf9s=
X-Received: by 2002:a92:cf50:: with SMTP id c16mr5795057ilr.131.1595889045975; 
 Mon, 27 Jul 2020 15:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200727162617.26227-1-peter.maydell@linaro.org>
In-Reply-To: <20200727162617.26227-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jul 2020 15:20:30 -0700
Message-ID: <CAKmqyKO3D5TAaeVmBfxu2jabHCxPufuMw=Wdi2cFeKTCyHFvNA@mail.gmail.com>
Subject: Re: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohOc2eghRlM2

On Mon, Jul 27, 2020 at 9:26 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The netduino2 and netduinoplus2 boards forgot to set the system_clock_scale
> global, which meant that if guest code used the systick timer in "use
> the processor clock" mode it would hang because time never advances.
>
> Set the global to match the documented CPU clock speed of these boards.
> Judging by the data sheet this is slightly simplistic because the
> SoC allows configuration of the SYSCLK source and frequency via the
> RCC (reset and clock control) module, but we don't model that.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1876187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> NB: tested with "make check" only...
>
>  hw/arm/netduino2.c     | 10 ++++++++++
>  hw/arm/netduinoplus2.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 79e19392b56..8f103341443 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/boot.h"
>
> +/* Main SYSCLK frequency in Hz (120MHz) */
> +#define SYSCLK_FRQ 120000000ULL
> +
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F205_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 958d21dd9f9..68abd3ec69d 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f405_soc.h"
>  #include "hw/arm/boot.h"
>
> +/* Main SYSCLK frequency in Hz (168MHz) */
> +#define SYSCLK_FRQ 168000000ULL
> +
>  static void netduinoplus2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F405_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> --
> 2.20.1
>
>
