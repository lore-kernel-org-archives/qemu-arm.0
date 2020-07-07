Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp891779lfm;
        Tue, 7 Jul 2020 05:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHuMd14bqMMLiUCe8oDRCVFRh59KoOyAM0mFmTKAaiM1Gu+/LegF8rZ5J+B/KbpoS73rDG
X-Received: by 2002:a25:7e84:: with SMTP id z126mr2495590ybc.73.1594124961532;
        Tue, 07 Jul 2020 05:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594124961; cv=none;
        d=google.com; s=arc-20160816;
        b=vG7buqdM1W/iR20RozlRoR55f6q7aqAymvkKyp7wCwQWNyJoUe29+vOMhMEobyuJwG
         ktSorjRNGPaX6it4jDSv8qm4CSR+xYt8eXhCs23IF+Jf4Ty0gK5ZkYNTZVFlKpdgV3Ld
         K8SPRD3p4dMgSYLWMgkELL8gBMffFqnL9IDslnzv69SOVQHxvi3Pn4jTOxUF0oH8/BPA
         60prWCUQAlb067nhSC0un4gG96x+Xei+9FvKJyLYsigIwGdC5cUsWTI4g1EeQOvzRlI7
         4d5xxzYHMmBERbMsYSxEk8SytV4SjaPd0dOYP2BIsamJ4nWJsiBkW2ME2KHGmuOzJ4B9
         hu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=zRJm2075jNt/WnZ8u8Po80i3zGOhDktttoUJTlqydjg=;
        b=kNVYMtGi6VEsFSy7O1Nw+kRsxRPanyAnNrSoMlfkcTKtPpOD6WMe60RAp6po9t27dt
         H98GjUc3skqAYnwOcqTl+aJnTujIEBiEXc7O0HQKG+rjH64+UF/zzsJmVmsyeBz/71tc
         L5VAmVaeqg+12gxv+jx7x1seDkL+RmUS+Mp1evFN+dhoIQaWBWkVZ+84oxe3BAKIdvce
         wUtjjgjho5vCsl0Mq1cc5IlZ0QHfPIctb6wpXleEK1ZvrWYSDgQg+0+4DduEzjW4+YLL
         JG3jh6t4RVja12H+MUAirHDtxdcDR+0rjJi9Ie3EcIzSkPu62aizIL41UTDbuZ9li7AH
         QGCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y4JBn3aT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63si21995068yba.164.2020.07.07.05.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 05:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y4JBn3aT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsmiu-0005pE-U5
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 08:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jsmiC-0004x2-HK; Tue, 07 Jul 2020 08:28:36 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jsmi8-0000Cl-BW; Tue, 07 Jul 2020 08:28:36 -0400
Received: by mail-lf1-x143.google.com with SMTP id s16so19122421lfp.12;
 Tue, 07 Jul 2020 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zRJm2075jNt/WnZ8u8Po80i3zGOhDktttoUJTlqydjg=;
 b=Y4JBn3aT4JPyyk4W8WWvf/q1p1nvOHwI6b2VLm0JauV2S7izOEQhuvkg3hzzwk0ttg
 YR1S5bWGq5DpZlowNL0tbQf6HM/xc2IeoJahQDtA65PbscPU2sZ7rtauuHKJIQhCp14V
 AxxLnkyxgJGYOE0S2IaHZhLmE/WrI699sd/jXtHVncS4pe07/64tXrnwzhFwrYyT0Wdr
 9Zw53sKlx62+KsH1bmhAt6fs5LdCg5QimvzPom/Al8+t48LumqvZa+2FelW1CUYl81WR
 h60tmjQSo6n/c+fQhtY820KJfpykBIJguYftzhgiLItJq+QLmPh62jubCeCkvacezT1N
 fySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zRJm2075jNt/WnZ8u8Po80i3zGOhDktttoUJTlqydjg=;
 b=aH3CA13nLEnfHVaxgYHnPRBtH3A51ZbZkaUGjBVbpdwYCt2FZWVhqi8V1wbTTPBEt6
 ESKIBHnNwaU+1G74VIrZ4RSCGzfF24dWPupgdpi+pcFNIwRkDaRlMZfTWF/9GhCYx+/R
 jc8iiJvuW79QriKEHypkAfQult94U+XCPvgbMEYXIFIz7NUOQMjX27K+d9/+6CXdfVGI
 jUVP+3HIRcvzF8y7BhmTvjjZfKBj+WstsLg8KNO9mUVX1TuE4FaKY2DOws4wOY+S8NYy
 VKGlqgwfamJLfqoHGSe2RNxXjjb3VWb9+wkfK72HmP5svhCnbMrxYzftu2jFBtlw9PmH
 hwfQ==
X-Gm-Message-State: AOAM533QlrgGW+nOIs4l9dn6YVqjJhIy9QGN/if8/2fOBJEeqGDhZvyi
 55mQWpzjmx9rPZIBgI4esTA=
X-Received: by 2002:a19:745:: with SMTP id 66mr32955784lfh.77.1594124897195;
 Tue, 07 Jul 2020 05:28:17 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m2sm134736ljc.58.2020.07.07.05.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 05:28:13 -0700 (PDT)
Date: Tue, 7 Jul 2020 14:28:49 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [PATCH v7 2/4] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
Message-ID: <20200707122849.GA4114@toto>
References: <1593113607-321118-1-git-send-email-fnu.vikram@xilinx.com>
 <1593113607-321118-3-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593113607-321118-3-git-send-email-fnu.vikram@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: francisco.iglesias@xilinx.com, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyKSivolODA+

On Thu, Jun 25, 2020 at 12:33:25PM -0700, Vikram Garhwal wrote:
> Connect CAN0 and CAN1 on the ZynqMP.
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
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
