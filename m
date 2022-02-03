Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2119597lfk;
        Thu, 3 Feb 2022 13:07:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwtUhiC/G/qdK9nSf0Yy91s6hVCgJTGpBxHvTf/74zz6a8MULv+KwGwByORv5ZmbDQQwq2
X-Received: by 2002:a25:cfc5:: with SMTP id f188mr11874ybg.500.1643922428916;
        Thu, 03 Feb 2022 13:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643922428; cv=none;
        d=google.com; s=arc-20160816;
        b=uCHs9qY6jZhwM3C955kgBT31+ZqCP/4srUJLUsVeNVKRvVaLvRf8SP3icsGLCvCfWX
         g7H3doKVyA7vXu7uIEQaKSN1EdTCpAA5fJ3pzkul3330D16yG8RfMhMfN0P08iL2hOZd
         xltcSi/XUHoQPAPQKdYFvUhh124sEzg3ExvFyNmV5SwgMscsavCALnzTSM4W45co/xCL
         BU8o2X82SRK4WvvahSh6zLtMLjV1bAaukt3Xy2MFi4LZuSwQ1/bVt3BhdGoUm1Kjc07/
         +ie3PXPXg3bpfPHTzqj7SICVfQN51JRMni8fTiCZMnc93cH7pCJOqUy1FFB3jF36x7vA
         B8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=3vXguq7PD9F7k4liOa9bZTi3OO9BnCz39Q9xD7dS0Tg=;
        b=q7K7fPEeKmg/BGSBlnsimtGHZAhLWi8jX9tIZ1/G6OecYvo8nuwtgSM+NHJ3rA5tdk
         Sw5jYGWi6G49z92EsOKDhdwG4PDuK8wAI0jGbqZaSK8i9ugpRHp6x4D6wUS+oIoLXlvJ
         f0TLQenDBCdMd94dOQhAJ0vCbbJW9d5+UwdX5C3hnAZ+KB4DP5dJq/gsZ5trOJalXkQb
         QO2lsT7e2D2utPOKfPBmxot28BLhPCh8zbzoRsF74WH5QIB5tLaswisfP8E1POntnIE1
         8g3MJj2hYxOqxHJaJ1gXpm94WK34j/dSKrvvf3Qj6FnnYOdvjxg0jp0J95mqsIpQRE2q
         xpqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=IG+1GEoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o131si38900313ybc.253.2022.02.03.13.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Feb 2022 13:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=IG+1GEoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFjJs-0007uh-AV
	for alex.bennee@linaro.org; Thu, 03 Feb 2022 16:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFigP-0004W1-SJ; Thu, 03 Feb 2022 15:26:21 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFigL-0002B3-Hq; Thu, 03 Feb 2022 15:26:20 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 5164AC60912;
 Thu,  3 Feb 2022 21:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643919971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vXguq7PD9F7k4liOa9bZTi3OO9BnCz39Q9xD7dS0Tg=;
 b=IG+1GEoZ5aEtH+xtsUPLog2Q1v2/8iXhH/ubw7cgxuI+51O2MXMvHTRiNYh8bOgmmPHWXY
 RMXidfLNeaUjGKnN6cmeASTsqHKoNl3r4ilzicCvIEQDqYBNvW+MlZkH8R3VD02Jv0scWl
 O+fQSvcgfPMbLP3vwhZis7z2+VWvk6ccqRccdikBjuRTuaDgwkL3eIxiAnpawm3hKPjRII
 SeBOlMw5tpl8DnhMcONe6Su9D1PtY9+WBPfDLcPmX+FBy8SpivlxVUP10y3o+KlKnYBuHZ
 1+NOCC6A8Kq6+5PIXiAuyDCO4v2T+NGpZgU3FIENGRegwjxd4OuYFG76Q4R1gQ==
Date: Thu, 3 Feb 2022 21:26:11 +0100
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Message-ID: <Yfw6Y3k+oUVEe2CX@sekoia-pc.home.lmichel.fr>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-7-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-7-edgar.iglesias@gmail.com>
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
X-TUID: N5flA39MwjR4

On 00:12 Mon 31 Jan     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP APU Control device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 +++-
>  hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index d5a3ad3df2..05cd2128f3 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -38,6 +38,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-zynqmp-efuse.h"
> +#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
> @@ -85,7 +86,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> -#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
> +#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
>  
>  struct XlnxZynqMPState {
>      /*< private >*/
> @@ -123,6 +124,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> +    XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
>  
>      char *boot_cpu;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 857d3c9636..21c411cd77 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -64,7 +64,7 @@
>  #define DPDMA_IRQ           116
>  
>  #define APU_ADDR            0xfd5c0000
> -#define APU_SIZE            0x100
> +#define APU_IRQ             153
>  
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
> @@ -282,6 +282,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "apu-ctrl", &s->apu_ctrl,
> +                            TYPE_XLNX_ZYNQMP_APU_CTRL);
> +    sbd = SYS_BUS_DEVICE(&s->apu_ctrl);
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +        g_autofree gchar *name = g_strdup_printf("cpu%d", i);
> +
> +        object_property_set_link(OBJECT(&s->apu_ctrl), name,
> +                                 OBJECT(&s->apu_cpu[i]), &error_abort);
> +    }
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    sysbus_mmio_map(sbd, 0, APU_ADDR);
> +    sysbus_connect_irq(sbd, 0, gic[APU_IRQ]);
> +}
> +
>  static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>  {
>      SysBusDevice *sbd;
> @@ -301,7 +322,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>          hwaddr base;
>          hwaddr size;
>      } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
> -        { .name = "apu", APU_ADDR, APU_SIZE },
>          { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
>      };
>      unsigned int nr;
> @@ -697,6 +717,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      xlnx_zynqmp_create_bbram(s, gic_spi);
>      xlnx_zynqmp_create_efuse(s, gic_spi);
> +    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
> -- 
> 2.25.1
> 

-- 
