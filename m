Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1587890lfm;
        Thu, 25 Jun 2020 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUBeLDnihhwDYtFVgvgky/jt8cCfVrOluJ2zl3T3dOp4D+J3F+ljrYKBjT5o7Y47gAXwEG
X-Received: by 2002:a25:6c09:: with SMTP id h9mr19691183ybc.252.1593111801739;
        Thu, 25 Jun 2020 12:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593111801; cv=none;
        d=google.com; s=arc-20160816;
        b=xbKq57oBGAkH1eo+bxm9wgP1q2Suyj0lGrOCHZhTr8cB5QUnALRhWPLzoIHvOJCh6m
         8lq6t2u77Szqj20FwbsdBLF49edtQP/lCaKkEhbE4NN9XImarM9hHZEPSRkrbB+pG5UK
         7K9/EAVn3aAtGCwN8ucPn2z8X/m+9HaMddPnhfgqG2L9gbOnuWNuJ6uG0DUtj9UifJik
         zIVB0az4E3aywu91rtftRs9xzeMr2Ra9+0HvwtWaYhBbj/1j03NLXeloiyFqm1ZSYiA2
         Awdq0GKLi3YuZmncyRqcMSRVonZHVlxmDCYL/lDKmdfPWk7WaOCejRO5fj6SnMcWXjY5
         rjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/A/l6vg+RhDpqLSHIO/nKjT2AsX6yvVGRtu53DWYpI=;
        b=EbSeX3hAyXiH6ltC0GCQdWhgXEVs1zwEDr3Qbe6hVflEgKbL7VxMLhbwXQCBRs2k7E
         aKrRixpr4UQKIWo89N6rjj86c2fqbgRORDUnTTTKt4WsqE4rSGTCFLqWtsl7p/MszFs0
         rOdxqSAFrBtkDqiSFt575YavZwU4Fv9BkYeEQCNmX6PTIzbJAZKsTFB87Sxxhw0zIKnu
         2F7oLSezA7cT7bJLaMCk14h36kwFt2+hOCovzrRnL3jiTSRl4Z2jK0DCyryK2pvKrayJ
         WLK721Tq3wCZPOintxpjTgsHuxZd5FetGTy0vhAanrdoEleZ9hHl2Urug2QCMRQXHCto
         vCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XtRc2Yqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si21617973ybc.254.2020.06.25.12.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 12:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XtRc2Yqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joX9c-00055h-VP
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 15:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1joX9F-00052j-2U; Thu, 25 Jun 2020 15:02:57 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:39365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1joX9D-0005V9-AT; Thu, 25 Jun 2020 15:02:56 -0400
Received: by mail-io1-xd44.google.com with SMTP id f23so7264534iof.6;
 Thu, 25 Jun 2020 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/A/l6vg+RhDpqLSHIO/nKjT2AsX6yvVGRtu53DWYpI=;
 b=XtRc2YqmCqZx8CiQKQY2TUtpTe+GMTvqkZWVR1a5V2cZvUyJYt8rLfUYAf8QuMGChC
 Y+4Mf/XURIVE1ZheyNXbh6EJu/GkTvfxzEH9kzNuGJgExhqcIWqmukL2Jbn6XiSNq2mi
 L2YHOtuBNhEmIOpXnIXe0HYSupTkDliPavhU3m/NjraT9aD9hCTZmKMnVfH2B8yycYg8
 W1lQVQ0BeJvcD4oxWfYy9gWvQzXMr1DrVpQUHT7KMyRWnn4x+3HlB/wUxB5QwMF+wwbb
 VJNXB8rLynkzhnIH2tHJx3sZpTFMWTRzA9hhR60muFjFeKDceQmF5JujGapJiFbCn+V3
 JPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/A/l6vg+RhDpqLSHIO/nKjT2AsX6yvVGRtu53DWYpI=;
 b=Thlwt50XL5wsuzWYsmn2jCI1o1T77irbdQ/bISQpZnlkPBzdZ2EP3plTuTU2bpzt3w
 7Z9JkPun+TOlI6D70hvcczdyvChvz8ATf2jmXAIs0Qh/oAQb7U6GXBN9b7wY5wKlpVdV
 6XHzatUMlAQtJjyZWU0jl8/GVetrhN7GcLJC+Dak5xKB6IRrZs3KefLbHJGcFDL/h/6/
 w1+k6ZIoOrUUbaI+KFJVs/NRnrIENBjpgTJWcZsssZ3QjLGhh6a98HVQENsggoGgydeO
 WbRI+/jPywB1P7mJNTlgkm+ATDSgPJqx6moJL3bmX+BycDjBkXgXTPCHhUn3nW+KmfKD
 CGIw==
X-Gm-Message-State: AOAM533h0YDBkgttZ/Rzv0f5dqDvjDqh62bK2W5zVZ/3dzy6gLaWGa4O
 mSYg35Zfv+sWFUEwShvK/yAcSIygM9jU+dNq/FxINiSh
X-Received: by 2002:a6b:6412:: with SMTP id t18mr19541953iog.175.1593111773664; 
 Thu, 25 Jun 2020 12:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <1592954616-65393-1-git-send-email-fnu.vikram@xilinx.com>
 <1592954616-65393-3-git-send-email-fnu.vikram@xilinx.com>
In-Reply-To: <1592954616-65393-3-git-send-email-fnu.vikram@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Jun 2020 11:53:17 -0700
Message-ID: <CAKmqyKM0z4dhEYgZ7e8o56BfMPw_bQzSYyOW-8hRP1XH1_j9TQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nhT2YSR7nKf1

On Tue, Jun 23, 2020 at 4:25 PM Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>
> Connect CAN0 and CAN1 on the ZynqMP.
>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c         | 28 ++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  4 ++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 1de9d4a..3f93524 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -81,6 +81,14 @@ static const int uart_intr[XLNX_ZYNQMP_NUM_UARTS] = {
>      21, 22,
>  };
>
> +static const uint64_t can_addr[XLNX_ZYNQMP_NUM_CAN] = {
> +    0xFF060000, 0xFF070000,
> +};
> +
> +static const int can_intr[XLNX_ZYNQMP_NUM_CAN] = {
> +    23, 24,
> +};
> +
>  static const uint64_t sdhci_addr[XLNX_ZYNQMP_NUM_SDHCI] = {
>      0xFF160000, 0xFF170000,
>  };
> @@ -247,6 +255,11 @@ static void xlnx_zynqmp_init(Object *obj)
>                                  TYPE_CADENCE_UART);
>      }
>
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
> +        object_initialize_child(obj, "can[*]", &s->can[i],
> +                              TYPE_XLNX_ZYNQMP_CAN);
> +    }
> +
>      object_initialize_child(obj, "sata", &s->sata, TYPE_SYSBUS_AHCI);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> @@ -492,6 +505,21 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>                             gic_spi[uart_intr[i]]);
>      }
>
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
> +        object_property_set_int(OBJECT(&s->can[i]), i, "ctrl-idx",
> +                                &error_abort);
> +        object_property_set_int(OBJECT(&s->can[i]), XLNX_ZYNQMP_CAN_REF_CLK,
> +                                "ext_clk_freq", &error_abort);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->can[i]), &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->can[i]), 0, can_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->can[i]), 0,
> +                           gic_spi[can_intr[i]]);
> +    }
> +
>      object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports",
>                              &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->sata), &err);
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 53076fa..dcb88e0 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -22,6 +22,7 @@
>  #include "hw/intc/arm_gic.h"
>  #include "hw/net/cadence_gem.h"
>  #include "hw/char/cadence_uart.h"
> +#include "hw/net/xlnx-zynqmp-can.h"
>  #include "hw/ide/ahci.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/ssi/xilinx_spips.h"
> @@ -41,6 +42,8 @@
>  #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
>  #define XLNX_ZYNQMP_NUM_GEMS 4
>  #define XLNX_ZYNQMP_NUM_UARTS 2
> +#define XLNX_ZYNQMP_NUM_CAN 2
> +#define XLNX_ZYNQMP_CAN_REF_CLK (24 * 1000 * 1000)
>  #define XLNX_ZYNQMP_NUM_SDHCI 2
>  #define XLNX_ZYNQMP_NUM_SPIS 2
>  #define XLNX_ZYNQMP_NUM_GDMA_CH 8
> @@ -92,6 +95,7 @@ typedef struct XlnxZynqMPState {
>
>      CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
>      CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
> +    XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
>      SysbusAHCIState sata;
>      SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
>      XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
> --
> 2.7.4
>
>
