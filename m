Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp132392lfg;
        Tue, 23 Feb 2021 01:25:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfse9Mr8HCvbJ7SVuG788MMnD+5dX3PXSXEXQVmJyE0C3fe4DEJtotmKBiR2TftvGQW9r2
X-Received: by 2002:a6b:8f97:: with SMTP id r145mr19066723iod.133.1614072314846;
        Tue, 23 Feb 2021 01:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614072314; cv=none;
        d=google.com; s=arc-20160816;
        b=Bd6eICW+nQFkwA2jo54Nqod50AA4pXJqbd3oMUDmCelKbrviBzAGjyKv08kvVaGStW
         6zvEBhVwZ7TabAmtQrmnTC/g/4+f5fCz/L309FaJP4fiKmamVpyiwMsv99EYmDqf5Y5R
         0IEGu7lNB+mZEifYSE/00ysTeLTjrTC2LwQUXp303BZtK428oaZf0kCcuMycdf9dvyTF
         KrBkNxo2Y/+AqPQnu+vU8NzxBpOucyuUviqAY3v4uN5kRmHOr1mcrNYskBe1nJACMhfI
         lkzJfVlX22hhIYBYZ1SINs9KMhioI2ptUQvzHWy/gYxGS8JaHZspIS3A0zi9tZ9B0nb0
         v/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XpbWYoU0+SDi6RfU3R9Y6nRghh8hMZkw+/0HCdnNX2s=;
        b=r6Sk9Rlh/3fzr6pzZNS/vihMiep3BSCAArjDS1Wcqggc/GJ84aOFtEJXNQ4Fz6pb3K
         hrvhDuS45JXdLhSemHrSj0rZembR6Lr60RIgb2CuD2tk1eDRVBkDqYscSuCPJ4j5QZBf
         Fcx/FnCQ/XjNufS5ny/PWtjhdQP49F+EoUVAnG42gOI/uRTvBh+P9bea89CZS0N4526q
         ZPUkn1lHB4oYxfGVW0MKVlqYdGBIDpY+ViZ48Ekc9O8i83igO1acS8AlKWw2zDiteJ1i
         veS3e9uADK0Dr56/+GcayCtu54LqJIIeCMoe7FGGme5S0FBuRGorqHN7SmWjGeSH7ryQ
         cNFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hydl8b1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si16742836jap.97.2021.02.23.01.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 01:25:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hydl8b1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lETwQ-0002g3-68
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 04:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETvg-0002Hg-26; Tue, 23 Feb 2021 04:24:28 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:45527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETva-0008LW-5V; Tue, 23 Feb 2021 04:24:27 -0500
Received: by mail-lj1-x235.google.com with SMTP id c8so62194541ljd.12;
 Tue, 23 Feb 2021 01:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XpbWYoU0+SDi6RfU3R9Y6nRghh8hMZkw+/0HCdnNX2s=;
 b=hydl8b1B3XS0ot+XNYMgyJITakuA+faW0FOM+areHoMBCT0zg+DaA7O+8Dyazlp9jj
 9gV7PCr3wCK7ZRq3KpbnLSPdv60ESjJ44LeuTzDtVYB5DDXXLl8p6Ik7J1RAmrQH38IC
 wb6gdlv4OOYnAnRZgRqjrGxI9D6MCpHAD3ohS8uhTFPQgYKzQFkFQ+lurrhup1nO0CWa
 5gkqJf58vtfhkpf53Xra47zTXyJx4L4ATNN0vMWSqza56x11Ih5B/DZMeKCx5VE+sPod
 a10GCclW3/CjdMS9H3nMB8danjKXVoutyr70DeVszyWGb0t3C85fGTXcQ2BUnHnAuV3e
 VyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XpbWYoU0+SDi6RfU3R9Y6nRghh8hMZkw+/0HCdnNX2s=;
 b=l9TdmLUPRej7L/TBmgsyFVdtPl3X2BHkvBRLfLQCUylNTPx97ILlLEVbuEcPNFPFyX
 bUl5eCRgymP94rMZDxmMisLGLwRBNQmKxZGBKqTGqXsQRvXh5J89YJ8ysQXMDo+bcS+J
 KCZDMdeIoGyLKDg81GKYrLLiPFBMU3VX2242GLKMW3pK05FFpciOMkfM/s65CjNxDJ4a
 UzEvJoAFqlcWfLZ9v5inJ3SFeoaUD+8LQfD68uRyHnJwPpaY2n/ZVXreJOCD8C8F+DGw
 PfXVsmpcKpsPjd+4thwc83JNZ+1ao2DPwPkaNTQxPOy6Zv65/25tmT9aFi5RhPRKecYp
 WBmQ==
X-Gm-Message-State: AOAM530ZxKzQBsN0r5fCHO2r6drnTWkKr7UjBmR+7OHQokg+w24m6+gt
 kPQfS5WVkHlvOtpPtTojX6M=
X-Received: by 2002:a2e:b355:: with SMTP id q21mr16495016lja.209.1614072258721; 
 Tue, 23 Feb 2021 01:24:18 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q9sm2492094lfb.253.2021.02.23.01.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:24:18 -0800 (PST)
Date: Tue, 23 Feb 2021 10:24:17 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RESEND PATCH v4 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU
 DMA module for QSPI
Message-ID: <20210223092417.GW477672@toto>
References: <20210222131502.3098-1-bmeng.cn@gmail.com>
 <20210222131502.3098-4-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222131502.3098-4-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sELmBPtQWe+1

On Mon, Feb 22, 2021 at 09:15:00PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
> link of GQSPI to CSU DMA.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> ---
> RESEND this patch to remove 2 blank lines that were accidently added
> 
> Changes in v4:
> - Rename "csu_dma" to "qspi_dma"
> 
> Changes in v3:
> - new patch: xlnx-zynqmp: Add XLNX CSU DMA module
> 
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 12 ++++++++++++
>  hw/arm/Kconfig               |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index be15cc8814..2edeed911c 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -35,6 +35,7 @@
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
>  #include "net/can_emu.h"
> +#include "hw/dma/xlnx_csu_dma.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -108,6 +109,7 @@ struct XlnxZynqMPState {
>      XlnxZynqMPRTC rtc;
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
> +    XlnxCSUDMA qspi_dma;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 49465a2794..76cc3b5e78 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -50,6 +50,7 @@
>  #define QSPI_ADDR           0xff0f0000
>  #define LQSPI_ADDR          0xc0000000
>  #define QSPI_IRQ            15
> +#define QSPI_DMA_ADDR       0xff0f0800
>  
>  #define DP_ADDR             0xfd4a0000
>  #define DP_IRQ              113
> @@ -284,6 +285,8 @@ static void xlnx_zynqmp_init(Object *obj)
>      for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
>          object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
>      }
> +
> +    object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
>  }
>  
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> @@ -643,6 +646,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
>                             gic_spi[adma_ch_intr[i]]);
>      }
> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
> +    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> +                             OBJECT(&s->qspi_dma), errp);
>  }
>  
>  static Property xlnx_zynqmp_props[] = {
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4e6f4ffe90..27ec10f89b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -353,6 +353,7 @@ config XLNX_ZYNQMP_ARM
>      select SSI_M25P80
>      select XILINX_AXI
>      select XILINX_SPIPS
> +    select XLNX_CSU_DMA
>      select XLNX_ZYNQMP
>      select XLNX_ZDMA
>  
> -- 
> 2.25.1
> 
