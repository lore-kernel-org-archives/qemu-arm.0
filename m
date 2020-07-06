Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp165318lfm;
        Mon, 6 Jul 2020 10:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykJu/+XsZttaAU8chP0bkUGePASXA7Kzm6FpuwVSKzIccaflXTvOWi2mvUsX3W/IEJ0UaA
X-Received: by 2002:a25:20c4:: with SMTP id g187mr84210570ybg.347.1594055301293;
        Mon, 06 Jul 2020 10:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594055301; cv=none;
        d=google.com; s=arc-20160816;
        b=JNqMgngx1XohU6i8ilXtmOoaeiXFn7H+J0vgXEDXyQe0WQzk16iJ5FVls7h5PXI1A4
         AO0v0R47OVGsrJf9+U9wuaa+rY5ic03PAHQmb7P/WcDPRRa91kBvzBzgblkvUlFt6K39
         OwFGSo6VnymefNB/gA8NWlElG7Qz3RdvpfNFVI2iGT2q7Y+0VpgQ7GHFdMPNWJKufThM
         UDmLA2ldd+JEySQpuwEl1TZtPF2T5Y+nW6ZdPyq1/V/3tUHms8bZzj40MnS5Ir3+KWFP
         WqmVCPpfd7lNG0Zg1nybYFROs4zdR7gS78cKycgSEMLBLqigwAtar57JQapcR0bERL2S
         pN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Nbx9IfByicVhiGofOcBwvynyHEZt9D8sbVE/rksuBKQ=;
        b=eW2IFaVExU1vVSz7EuXai5y22+U40YGFP4fPX2YCe/FziXwEOaoCc3cKFI0IaPGQ6Y
         R6bsyqRH9lNon9KDzUbIgfzDCzG51gb1p3HBoibzXOZqsTKehxZy1IqA3Z8/5/CSxqUB
         vJCF7dEeavLiCd+Qtq9fa/LWu78+Tjv8Sorrn0I2MOnlKTvfMTA393l+FAgiOsOYbV3P
         XUjTB+Q27HEsGTr4uEJ391mYgqzflGqTrLyyB7NqsR8UsIJ1nkHEob5iZHYDNGAi75m6
         FD1+GfOJPNjnnywIPlT9fZhwGD/P4ReOF4WwhXFhcpYhEN5f0sSg4HUavsOH/9JyQh1h
         CBjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlAqpNrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si21242135ybe.464.2020.07.06.10.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlAqpNrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUbM-00077j-L6
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUIz-0000wH-El; Mon, 06 Jul 2020 12:49:21 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:40080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUIx-0004Pa-5U; Mon, 06 Jul 2020 12:49:21 -0400
Received: by mail-il1-x141.google.com with SMTP id e18so22772008ilr.7;
 Mon, 06 Jul 2020 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nbx9IfByicVhiGofOcBwvynyHEZt9D8sbVE/rksuBKQ=;
 b=VlAqpNrKxCPkyItSx5oheqbtPIm7Un993nTRk23s0wL2NGLawIMQzVHROozLKBVDd5
 LHl0zYjP+OtF6o5KCM2TWF3D0trQbqJllGxBp/wF+wAPypXHEobmGRqxoL3/0xh7rWkx
 j8jaHHPy4a3YnQNaORJvKpS9ppo1SeXplNNrhFolASokM8S9gInT9SKRXoF2QgD1Bqwf
 G86D9t4nLxd8UmlSyxQKfE3ljgAnll5zJQsGFXoPMQCHU4wy1XSfk8jrIjyh0LqkA3be
 yuS9Ls/ayZyVBKoKQ/zfRkyO0KCCrzz2lnyozUyBx9gJU0kF+xCHjyT8aIU9ckdbqsrY
 /WrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nbx9IfByicVhiGofOcBwvynyHEZt9D8sbVE/rksuBKQ=;
 b=NDdfFxXHNxI4w2ZJkSE2AvbHuJmSicrfxbPndy1TT0nDUzDl7KtTG4bMoPYOUDXq1y
 3K/bZEMQaPpH6I/jNlNAgmMMnKdSDtWZhpYYGRxdcskfd3C7SoSXq8HNnCl6mKE0EUTq
 pR4YXpVYF0bR7koZyvrU+UqDtRhm1vW90HhAzcmmV3FVX32laqtiwf/hl2hqjxnZUGbz
 Koue6oMwUZUQyTyT/ZIOcFdEJQ1AxLhcyCKIatdYFag6YYJmQnYqXJRZaZs/COYq5ltT
 Cx1FIy41KQSIkoqucMutCdzRnFIMbdeXX+SX2UIh/N9WWKFSEjM9CLJFWQ7sek/D+er9
 lvBA==
X-Gm-Message-State: AOAM530tQQsuCBPPU5sFSCCwKllEtvVu4SOncZVaIf1DbOiYt5RuN6fR
 Wqcp75h63k5aDxdGeGoUxk+cP3NkwuIw1ZGAmm4=
X-Received: by 2002:a92:5f12:: with SMTP id t18mr31642216ilb.267.1594054157141; 
 Mon, 06 Jul 2020 09:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200705213350.24725-1-f4bug@amsat.org>
 <20200705213350.24725-3-f4bug@amsat.org>
In-Reply-To: <20200705213350.24725-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:39:25 -0700
Message-ID: <CAKmqyKO_1HhM4WVejpEBcqNW9W6Ept9Vks0E75uF2CJAxHH0HQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/sd/pxa2xx_mmci: Trivial simplification
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vf27ob4/Iqw5

On Sun, Jul 5, 2020 at 2:35 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Avoid declaring PXA2xxMMCIState local variable, return it directly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/pxa2xx_mmci.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 9482b9212d..2996a2ef17 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -480,10 +480,8 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysm=
em,
>  {
>      DeviceState *dev;
>      SysBusDevice *sbd;
> -    PXA2xxMMCIState *s;
>
>      dev =3D qdev_new(TYPE_PXA2XX_MMCI);
> -    s =3D PXA2XX_MMCI(dev);
>      sbd =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(sbd, 0, base);
>      sysbus_connect_irq(sbd, 0, irq);
> @@ -491,7 +489,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysme=
m,
>      qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
>      sysbus_realize_and_unref(sbd, &error_fatal);
>
> -    return s;
> +    return PXA2XX_MMCI(dev);
>  }
>
>  static void pxa2xx_mmci_set_inserted(DeviceState *dev, bool inserted)
> --
> 2.21.3
>
>
