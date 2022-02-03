Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2115366lfk;
        Thu, 3 Feb 2022 12:59:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZNDe7WVJUyTdFpZ6X/pVgHOw0xlC1MuKdFGqo0UO9VaRh4UothMhmyjlBC0rNGBrzVqBQ
X-Received: by 2002:a25:ce92:: with SMTP id x140mr40813028ybe.623.1643921996902;
        Thu, 03 Feb 2022 12:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643921996; cv=none;
        d=google.com; s=arc-20160816;
        b=Ekv8qoc6zaFEJLbClw4hQGrMmhWcw68uvUfyASL8fynspFeuG1YOVg7BVj7y5KoCm3
         Xm+AJxkwWYXxXxHg5ijde5MjN0F3NbFatgMJHV/7ylLRdJP/L3XX9QFani0JTCm43XEt
         Dq4547ppK9kIuNMKFDXw7zWte74VA4eqoM53c0bUja4ys1Sc6N6Acmg0pLpj2JmaFKUl
         MdeDi6baTQSdhmNB+pHRCxGZ52SjMJ+IRPKPyYbrXSp9AGyNnGb7rS938vs/fbJOpcns
         7EBMy/uR+BbnxKT9IBpZq8swVoDXN8oTsxPfOWhhtwgI40u3jx3qK77UwEUMmZP3xaDN
         1MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=S6pIafLwmXMhB4HxPHzMtVvhuYad7JK2VPHhJfX5tQo=;
        b=bnQv6gVP11XrABL3ECAPFWXmqy/yiTgoCTgueShoqGAPz06WqMp9P/Q+Vm8OxDQszr
         C4nebx5pYfVZQ8FYZsAW03cL9tAqqV8A3YlonI09c7qf4GOLOIqd9usbq/36ej81Dwcu
         Epx5cDSiTEGLjRsDHOngmpw8Zbw6c1wNu9Mo18V2DyJ/f2qaOl8aaKkrLDDzuAi8VFOX
         BevqfqwxKITcn/mlAiE3G+CRyJ082RhZbu7eGT7ScjVvolmkR6ua0fBMIYJI8Yg0L0F4
         IApBkbHtwoAAYGElaTaLXhM4MZ0aKv5q5sT6TlpX2P9hqNoavrCrzebIaIzWm6OAvzLo
         ZTxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=BpKANeOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si2062249ywh.565.2022.02.03.12.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Feb 2022 12:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=BpKANeOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:49342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFjCu-00015t-87
	for alex.bennee@linaro.org; Thu, 03 Feb 2022 15:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFidh-0000He-Dt; Thu, 03 Feb 2022 15:23:33 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFidf-0001hs-CU; Thu, 03 Feb 2022 15:23:33 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 6A82DC60912;
 Thu,  3 Feb 2022 21:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643919809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6pIafLwmXMhB4HxPHzMtVvhuYad7JK2VPHhJfX5tQo=;
 b=BpKANeOrkXOWJ9LscStDAqpb5IFKfzBj3Ez+59tjGCNytKFWhBVyV7bxmYd3AaS6kvjjwj
 COSUX1TaViEAYRyLHHGiwTcOZM3YV8m/8s0Ej6bqgzoF2jANL4wDnDOHnFfVXpj+T9848U
 xFZ4Kww4SPUAhiKP+IvhBPSA9O0yKcgFWGbDztU7v81ju/HcZ4YbxNXGnJQ5m1xMMYFlSc
 aKeeYm/bOiJmdBHq9rRtte1BnWlbr50Eifiz3b+tHyZz+Yhr12oT0TAE2fjFj2xW9scRE7
 8+Y2w2IvVTywO9HHxk0Cgw07ywKZsuIGNyrSaq34WKctkiSZfA20QtwCdHp0bQ==
Date: Thu, 3 Feb 2022 21:23:29 +0100
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Message-ID: <Yfw5wQu4QXiEyp/V@sekoia-pc.home.lmichel.fr>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-5-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-5-edgar.iglesias@gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CmcxE5aI0Jdh

On 00:12 Mon 31 Jan     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP CRF - Clock Reset FPD device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 99ceb8a609..d5a3ad3df2 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -38,6 +38,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-zynqmp-efuse.h"
> +#include "hw/misc/xlnx-zynqmp-crf.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -122,6 +123,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> +    XlnxZynqMPCRF crf;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index ba44e95899..857d3c9636 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -51,6 +51,9 @@
>  #define QSPI_IRQ            15
>  #define QSPI_DMA_ADDR       0xff0f0800
>  
> +#define CRF_ADDR            0xfd1a0000
> +#define CRF_IRQ             120
> +
>  #define SERDES_ADDR         0xfd400000
>  #define SERDES_SIZE         0x20000
>  
> @@ -279,6 +282,18 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +
> +    object_initialize_child(OBJECT(s), "crf", &s->crf, TYPE_XLNX_ZYNQMP_CRF);
> +    sbd = SYS_BUS_DEVICE(&s->crf);
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    sysbus_mmio_map(sbd, 0, CRF_ADDR);
> +    sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -682,6 +697,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      xlnx_zynqmp_create_bbram(s, gic_spi);
>      xlnx_zynqmp_create_efuse(s, gic_spi);
> +    xlnx_zynqmp_create_crf(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -- 
> 2.25.1
> 

-- 
