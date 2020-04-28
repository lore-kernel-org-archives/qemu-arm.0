Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5887170lfm;
        Tue, 28 Apr 2020 11:57:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJHT10CfoGZXeD5nuxsVuoJQWVbb46PFLZtkAWexqAfUZl4JBEmg5kha8m4G+40J4XvkFpP
X-Received: by 2002:a0c:90ef:: with SMTP id p102mr28842168qvp.248.1588100277942;
        Tue, 28 Apr 2020 11:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588100277; cv=none;
        d=google.com; s=arc-20160816;
        b=H/rogPNg+P6sjpLgwKAheylic3u02oaMfZkDFyq0n8V4gCOmbdY2TMP+tlnuJ1t2jX
         dYGbaFlPJ+vXBAhuYoaRpOWPf17Jjdlg9RTjZ7yqKEidzlCzh19cB3nrjuXqPim7eFsz
         ujCbRzABba2jKoppjvK/bOhVQ0frg/LUlHAAhfWTvEWaQlJHEHij9jruqJaeIvd1gBEQ
         QsfLEIfxeBxSW2igrAvlwBWnKQyd+H5Imfn72aeICXiUf+ZV1C4Vc4f8YMSKMYR8RWeb
         O7QKSITkzdohSyi0aPXrRr+wNYcJ+vd+PnYVXSC1bmcz9OKN6DZhJ0pmRssMVypaeiVG
         XZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=3WQb39qb3qFPRCFp9//hGfhfcbKualdj6DWguugT4sM=;
        b=WdtgIu0A8o/qMnDso3xQhoUfIEqwmg0IWXcLK8D7gj0jZkuBsy2fWtylL+3x20cYrH
         jWt1Kc0yuxr8GbQUbTLN7Rh5ORA630kdptH4KHoE13hIzebM55uXu9fzzb14h+Z7Op/2
         0L+wksPk56GiW5DvHiEFklC+MSfJh73TM5g2SMfLtAtCjUMjR8fjQ+tryKD7GOel0zb2
         NHFZIm8KgbllpvXa7oU7DluRrbLPcmoyumk2WNpaCMRMvYctubnqSFVjYTY5IuaefuaB
         i8XWReAcaJAscjM45OSD42A0USdcZZVaa56Rzj4iDNadmfqaJQccUUsd1gyC8IgVdJrx
         t6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PS5mzIT9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si11351179qkm.302.2020.04.28.11.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 11:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PS5mzIT9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTVQb-0000Lu-A4
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 14:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jTVPT-0007vJ-Or
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 14:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jTVP0-0007iY-46
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 14:56:47 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jTVOz-0007h2-Mr; Tue, 28 Apr 2020 14:56:17 -0400
Received: by mail-lj1-x244.google.com with SMTP id u15so22642382ljd.3;
 Tue, 28 Apr 2020 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3WQb39qb3qFPRCFp9//hGfhfcbKualdj6DWguugT4sM=;
 b=PS5mzIT9W6+NMGb46exgifnv5s6PWmaslFSwUXObkx7oNYuse7FIovkhjf7woJ4PxV
 wKog6MpJfvaVFuJqbf/wdqtmJs8SY9j73H2qsGikzPMEVlpNRJEuSrzHpGxKvAXCa1fb
 UTLD8GHgiJUeBFA14sEOPHN+F9ph1iDZoCKAN8K0sGrRUe2JmC9FVYhatwgU2BReMr21
 ouz5VSEL2WGEYCrGCMj3PFYzFHPzmpeBsf5Fnu1bJAdi+XVQGRlSVrhAbfmnV0SE7XiJ
 nbGNIeaO0Z7O5IM8CtHbq5vWhnw++kovMRR36dR507RnF1Fu0BwG4dihpG2a693wUltg
 B3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3WQb39qb3qFPRCFp9//hGfhfcbKualdj6DWguugT4sM=;
 b=mLX2EJWV96DbHMsbbVvp6GDR+LeiQWngpEW9uuTV+uIDrwFpMlgitxhnWshPAwrd9N
 5EXWGURh5NPymcgal3FIZwlZmnCUU5zt56bYY0rBo0p9tKn3+gQHdPUgikW93MEFCmjt
 2Tq+eFJs3VDaNPtNEjAObTGkx6wyjlQ7HRTnRbe3OCWs12SQY1NXnZpnFmPI4XsQQsb+
 2kRyx2/pYQJ2JEFuL6RUcg4rPofPzmT/oUB788dzTQA89AmFQZyvmww5PPulqZrWSJuE
 HVu0j03QqrpS7Ns7dyHwrax5v8IFaghmrwryS13wPOLhn/C+rlvFZcAhaODVPKyW7plr
 UvNg==
X-Gm-Message-State: AGi0PuZEq6PFK7PTcY/OyaX/Y2zBh9lJykiUCX1h+q5fl4wa9UHWQWIp
 oB56hUGgM84JMJvvgSPGGV0=
X-Received: by 2002:a2e:90c9:: with SMTP id o9mr16614941ljg.187.1588100175013; 
 Tue, 28 Apr 2020 11:56:15 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j22sm77869lfg.96.2020.04.28.11.56.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 11:56:14 -0700 (PDT)
Date: Tue, 28 Apr 2020 20:56:12 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [PATCH v3 2/4] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controller
Message-ID: <20200428185611.qn4nolfq2zklahxm@fralle-msi>
References: <1587603369-14644-1-git-send-email-fnu.vikram@xilinx.com>
 <1587603369-14644-3-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587603369-14644-3-git-send-email-fnu.vikram@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::244
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y99irmqniRUp

Hi Vikram,

A couple of more comments:

On the git summary:
s/controller/controllers/

On [2020 Apr 22] Wed 17:56:07, Vikram Garhwal wrote:
> Connect CAN0 and CAN1 to ZCU102 board.

Perhaps also:
s/to ZCU102 board/on the ZynqMP/

(even though zcu102 is the only board using it at the moment).

Best regards,
Francisco

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 26 ++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  3 +++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index b84d153..e5f0d9f 100644
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
> @@ -254,6 +262,11 @@ static void xlnx_zynqmp_init(Object *obj)
>                                TYPE_CADENCE_UART);
>      }
>  
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
> +        sysbus_init_child_obj(obj, "can[*]", &s->can[i], sizeof(s->can[i]),
> +                              TYPE_XLNX_ZYNQMP_CAN);
> +    }
> +
>      sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
>                            TYPE_SYSBUS_AHCI);
>  
> @@ -508,6 +521,19 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>                             gic_spi[uart_intr[i]]);
>      }
>  
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
> +        object_property_set_int(OBJECT(&s->can[i]), i, "ctrl-idx",
> +                                &error_abort);
> +        object_property_set_bool(OBJECT(&s->can[i]), true, "realized", &err);
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
>      object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 53076fa..2be0ff9 100644
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
> @@ -41,6 +42,7 @@
>  #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
>  #define XLNX_ZYNQMP_NUM_GEMS 4
>  #define XLNX_ZYNQMP_NUM_UARTS 2
> +#define XLNX_ZYNQMP_NUM_CAN 2
>  #define XLNX_ZYNQMP_NUM_SDHCI 2
>  #define XLNX_ZYNQMP_NUM_SPIS 2
>  #define XLNX_ZYNQMP_NUM_GDMA_CH 8
> @@ -92,6 +94,7 @@ typedef struct XlnxZynqMPState {
>  
>      CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
>      CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
> +    XlnxZynqMPCANState    can[XLNX_ZYNQMP_NUM_CAN];
>      SysbusAHCIState sata;
>      SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
>      XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
> -- 
> 2.7.4
> 
> 
