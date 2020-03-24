Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2943859lfi;
        Tue, 24 Mar 2020 09:05:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtuUJYYUfTMXmO5zUoaJMEX5OaHZ/EedxS9CA5E6s+2jgBj/8gwlbsbC6F2Ws0XPhGCArD8
X-Received: by 2002:a37:d244:: with SMTP id f65mr18519774qkj.373.1585065916183;
        Tue, 24 Mar 2020 09:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585065916; cv=none;
        d=google.com; s=arc-20160816;
        b=g6/YteP5x2iTKMK9cHlVX5hcN4v1TikKDR12zS4Ph4ycO23n1T6IAQDSG5SDhga59b
         z8fFensOYRdZFwNCUCQ7G3eGNJXxJEAHtKMhg4JPRcVzNIq+MOh+YWa9MN8S/E/u2yNi
         dLqqkPmrgB1nWvYloRY3Y6vUt8khQnzHtm2PrzI3l3+IyO+0BpE2hlEF3nAV0wCxLmUB
         4aZvHZ+jEvJPa0t9+2ds1z9cXowwa9DtBNwkAKx17rEckEFOc1MM4CKxTLm9CG8QUlIb
         UooVek6nAWwxS30ebbBnTcGNuiTy++N5DmDwt6gFOuzTSGbKLNY0tGKF270DF+LhzQx4
         o9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbhvlv+VbNXkIg6kT2d/mzvdrSvgE+JmNkuAgdwxn30=;
        b=aWauTTTMX78f1U8RyxvvqoW0+APti30EDNaoGt9MCbw7M2nU54Rcbe5CKkTsK+BukD
         tdQG+IjYQVAqMHvC5mODyxRmna4E772gA5eEs8fg9kfGK1YG40KxPkESW0zq6/Imkz6K
         jzkb8geeBl7fPI1PDHDPRpCpG0VqK6KiXjVJ92B/YUKZKnifriswOrA9WsRL+XyC938x
         vqHtMMBK1zcWwMTu81VNKDhkvC84kC0AYaU4QUw+9uTpo+cSLMnfCd0j/4AdV/L6beBI
         rWSUJliP3vZlajwiUchf6BO+o3yNPevIxuK/EDZmvFwffWGC7Veq23KUEpYvKKxJK0Bd
         CJTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jhhzG9Jc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si10111951qvf.49.2020.03.24.09.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 09:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jhhzG9Jc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGm3H-0004dN-Df
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 12:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGm2h-0003r6-PG
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 12:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGm2g-0007sc-GY
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 12:04:39 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:39928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGm2g-0007s8-CG; Tue, 24 Mar 2020 12:04:38 -0400
Received: by mail-vs1-xe42.google.com with SMTP id j128so4879366vsd.6;
 Tue, 24 Mar 2020 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbhvlv+VbNXkIg6kT2d/mzvdrSvgE+JmNkuAgdwxn30=;
 b=jhhzG9JcJEPxMLGs/HS+1eXfMAhovoP7GyYd8K4rkAp4mbkIRLJoHHitf/17cZv1S5
 /M5ieUn4u/gCFZIkhwQ7UZAT1yX5cWAWoPJlNxvlDrUEz9KRyA4RHAGeSSARcfxhBQHX
 LWf3HT6l6gLhtEbrToSgr6jIAGBF5QVUacRs+tTbhHDPAvWaUn3sH1Rr7FyANXxFwmid
 ErjvlwiifjpsBf0iBlNRHCud4XPRah+D5aP6hhrK7aH/CfMyGSQPKqfTEMwubgMpHT9b
 Tc85MypPqD+gAbY6GcWdya7vqI8I0zkOT0TChiWMsv2YR0XQExUfNzbt4jS+xmL5LxnZ
 eWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbhvlv+VbNXkIg6kT2d/mzvdrSvgE+JmNkuAgdwxn30=;
 b=gh4RA9SPloA9lp6NgkX3mcGR/0O6ek/lr1LperWOgAqlRTT9u7P2wT7OM/4v3O6zOz
 f8G6RMevWJxrLyK7HZGYZHp6caKqd0aPhk/HxEg19UDyHW4bIPibfuiRuIiSSTdLhyH6
 QU6B8WoPBJKkYSrtlkdUoqYAGBQnYKmYr2zZblcfi/DPGSBKsqNHvPQ2x4HjanWj+Ij3
 AiYQja59Sf/wClZm0ajNiy7OJwkdQf2TrE7/g15GUcWghmnEssF1nzLARYyXuTtlcICt
 0rqT1QO4e6w/O+wVXJjXMtREeIg8Vw6oqC+/W5GcxOlBT02tleihPhNe7065pG7hwAv5
 FarQ==
X-Gm-Message-State: ANhLgQ1lIzrL30LY3gQvaPfpB6eaTX5nfxoeHmv66px3R+H6xgJLqVEB
 PEqVVTSyi3tGODhCxQWOVwMaOl+hleEiDi1pmqs=
X-Received: by 2002:a67:26c2:: with SMTP id
 m185mr20502695vsm.180.1585065877605; 
 Tue, 24 Mar 2020 09:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200324134947.15384-1-peter.maydell@linaro.org>
 <20200324134947.15384-3-peter.maydell@linaro.org>
In-Reply-To: <20200324134947.15384-3-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Mar 2020 08:56:39 -0700
Message-ID: <CAKmqyKNpw=oWsCjFSocsahRJQDO3Z8F7dnE-JUrhNk_tfHOCtw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/xlnx-zynqmp.c: Add missing error-propagation
 code
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5q7vkJQkWWpp

On Tue, Mar 24, 2020 at 6:50 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In some places in xlnx_zynqmp_realize() we were putting an
> error into our local Error*, but forgetting to check for
> failure and pass it back to the caller. Add the missing code.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Spotted while I was writing the previous patch.
> ---
>  hw/arm/xlnx-zynqmp.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index a13dbeeacec..b84d153d56a 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -530,8 +530,20 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>           * - eMMC Specification Version 4.51
>           */
>          object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_uint(sdhci, UHS_I, "uhs", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(sdhci, true, "realized", &err);
>          if (err) {
>              error_propagate(errp, err);
> @@ -551,6 +563,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          gchar *bus_name;
>
>          object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
> @@ -565,6 +581,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      }
>
>      object_property_set_bool(OBJECT(&s->qspi), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
> @@ -619,6 +639,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
>          object_property_set_uint(OBJECT(&s->gdma[i]), 128, "bus-width", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->gdma[i]), true, "realized", &err);
>          if (err) {
>              error_propagate(errp, err);
> --
> 2.20.1
>
>
