Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp74099lfb;
        Wed, 4 Nov 2020 08:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLWKA5UJmw3czEz5gUQYKDkJBdO/Kkg3WZFN4bGB9tAOtANCg6aPm/+a+jvax+H7vjyeSw
X-Received: by 2002:ac8:1287:: with SMTP id y7mr9639032qti.108.1604507644505;
        Wed, 04 Nov 2020 08:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604507644; cv=none;
        d=google.com; s=arc-20160816;
        b=LCZtyXkbmh/0jpHR4cH6S2tOJ2BD7YklUkuCz3xENK0M+3GEiPOxv8hLwdo82HoOcq
         QXlJnRHsn7/6ltFGlczGzycjOX60N68XkX54COebgn5jgQy+t0ln55jdRuyY4NBwJUAI
         O7vlQzIvji2A7ASsSAIHfsCbAdBJkYAer1uQMtZqhNd/d5wcGE34BnPj1QBT50lg6pRu
         kcCFXXtzD/njNxta0T96uOowx2x0Dis1/CgFMzqPGz8xJth20Xe2OCNwA/mtVomdl14a
         zRwfT0vWKAImxPaWs7ph+Co55JuSlmpdhBDCwp+HYk1UlYtmg+yucRC81oh35KWpU9QY
         u31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqwmb6PrP8ZH8SWTlskXS7GXfl2EXLdVj41LHwfo5jc=;
        b=iyOI7Z1xeaLRal9L4yEjC7EUEvXOZ8PczMDo1vpmbHOIoPtjazSBoKmC/e7u5NU0JF
         MUkZTrpcY240RK8pFq38desm+JX9TFcpWxtRTwGRwJV3iF3RKcRDDJj7y0awHB+rYIDc
         2OdvWvNoRpkroCdYeVk3qxM9QIDSpbUpkdK22WjMy2KuuB/VKiwmZlnEOy57hkksUdhu
         qU5F2UNq/+V/5AAWpKWxamhfxKu+Bnka9qmWb7IvDVNncbLlGjyqQAHXRUYjAcSHiEc5
         Ssmxo8YeVusQkoCMoQJBQLYBKw4JQFVQthxedOXWD3ftgX8Ytg4qR8iSXAsbfzIKHQpx
         5o+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NB59nJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si1456131qka.193.2020.11.04.08.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 08:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NB59nJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaLjX-0004ZL-UX
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 11:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kaLjO-0004X4-L7; Wed, 04 Nov 2020 11:33:54 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:33995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kaLjM-0000r2-5c; Wed, 04 Nov 2020 11:33:54 -0500
Received: by mail-il1-x143.google.com with SMTP id p2so5002047ilg.1;
 Wed, 04 Nov 2020 08:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqwmb6PrP8ZH8SWTlskXS7GXfl2EXLdVj41LHwfo5jc=;
 b=NB59nJU80o5gEBh61X4PCFfbJzGBGOWlj6TuXeNwWO/NuRBIQ9WMtKvNxGxF3P4bEB
 zkBMHt3+5+Z85LNF9I53glrcdcBWdjIc8q1PZdoV+a03TTR1zZBp1QV5SbWZdF6BlAi5
 vj99CswShiN/rLbN19S4qmewmsncDZhqOPkkFYJKTgIpAH6zAHJB2NCHSPY+YgyPju7y
 TgxNph46mh3K9+ShNizXqBvFIlyrxyCxkoR2LAhiQ97uBqOO2CCppWDdJZ/Stp5xyrKG
 t0BcH61ULFdDcuvaG2TNBuf8/XEAu9Yiniyj5YZO6//XmHPkl2L3tJmoaFBOLRBZgypL
 g7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqwmb6PrP8ZH8SWTlskXS7GXfl2EXLdVj41LHwfo5jc=;
 b=mNNzYP6DXmQn1r5+TNQ2khlDiJbDxckqiuxsTg9iWjA6F5c5kPTeaq2g7gPW5bsyRg
 IycGuzWCaOGjJaFArqem6m9uVHaRlCjBLPagI9yB0IYOMb/BoRiQra2u2dahwFGTHQzA
 dG0gun3WhDV0LHgKyiNZ2iTHgw+9zGB5q9F/75WyT27U+/nyk+vdEvDO0Je1T2QM0Xo7
 RF/OGzNS11aWcxth5gk1KSbGpAhk77RrD09knY5tL2+ClZV2WDwH46/wGgFWs4kctfzQ
 w/QTr5rUbeMpz+yJOSr17mYM9mnQXNZKAi0GM/KNYcfblpYRmiQJhPgPJSd1Gkwca456
 tIOw==
X-Gm-Message-State: AOAM5310wWcj6L3EEJpeSRlQdfaCvTyDqREQ6wmq1I0EWCXO7tLdJgv3
 2Wt/Yb99n/gERV5YQqm20TTel85xvOBzu1E1PuY=
X-Received: by 2002:a05:6e02:f41:: with SMTP id
 y1mr19868790ilj.267.1604507630165; 
 Wed, 04 Nov 2020 08:33:50 -0800 (PST)
MIME-Version: 1.0
References: <5FA280F5.8060902@huawei.com>
In-Reply-To: <5FA280F5.8060902@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Nov 2020 08:21:52 -0800
Message-ID: <CAKmqyKOS4bALKNTA9wMK=HANz4Dc=fffq2pZafCxGFqsJ_LMkg@mail.gmail.com>
Subject: Re: [PATCH] ssi: Fix bad printf format specifiers
To: AlexChen <alex.chen@huawei.com>
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
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, QEMU <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oSmGD8RdBz90

On Wed, Nov 4, 2020 at 2:23 AM AlexChen <alex.chen@huawei.com> wrote:
>
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/imx_spi.c    | 2 +-
>  hw/ssi/xilinx_spi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 7f703d8328..d8885ae454 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -53,7 +53,7 @@ static const char *imx_spi_reg_name(uint32_t reg)
>      case ECSPI_MSGDATA:
>          return  "ECSPI_MSGDATA";
>      default:
> -        sprintf(unknown, "%d ?", reg);
> +        sprintf(unknown, "%u ?", reg);
>          return unknown;
>      }
>  }
> diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
> index fec8817d94..49ff275593 100644
> --- a/hw/ssi/xilinx_spi.c
> +++ b/hw/ssi/xilinx_spi.c
> @@ -142,7 +142,7 @@ static void xlx_spi_update_irq(XilinxSPI *s)
>         irq chain unless things really changed.  */
>      if (pending != s->irqline) {
>          s->irqline = pending;
> -        DB_PRINT("irq_change of state %d ISR:%x IER:%X\n",
> +        DB_PRINT("irq_change of state %u ISR:%x IER:%X\n",
>                      pending, s->regs[R_IPISR], s->regs[R_IPIER]);
>          qemu_set_irq(s->irq, pending);
>      }
> --
> 2.19.1
>
