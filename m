Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5177557lfm;
        Tue, 28 Apr 2020 01:11:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyBfU2DgBnc9/hcVWvAhh92KC1go0Q44ox8zx7LRm4q3TmfsrS4NfGbTcHW8rh4ROqLm2X
X-Received: by 2002:ac8:7448:: with SMTP id h8mr27850207qtr.225.1588061461192;
        Tue, 28 Apr 2020 01:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588061461; cv=none;
        d=google.com; s=arc-20160816;
        b=hPrnTDF7W2Qhkb789y6cZKj9gJ2wLojFEBna120jl+K7zOngHfzUKdIc2MDNV06atx
         B9g8rzAa3G/lZRkiz4iavX7OvZF5PD04VGpYJnvhrLQbvUh3fjWgewQ7GdCBGdqArWB6
         3M9ueZnY7BQKZ4EkzzYmBK1AcKrziF4SleU+HWmh/xLK7O5D58j+pM9kBUBZZ3G0PtgR
         Lx5dLw3lAASqCMtLrfGD4sGF7Zl+0INVTnjTuFfA0brV5/LB/ln1gJfeGkUn/2a8WhHO
         LfcvirzpxRLh2WD6XmLo1H0jVpG1rnc0dyLnVv9Yeg+FOwLS7qcHE/Xglm14GvAqdaT1
         LCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=97Z+i1pZv8Icwzvb0dbeILUZJ248k0PpUZJviJ25BYw=;
        b=QZp8+zhXv1k7XQKtCdfrHALtLlk7MZaVgJ1vihIhDKA88rG2705pATi8i1aa55xM+E
         u8fIbte/g08TqUHLwfAURmc5Uv+V4SyjJfRrLnMOjWqPTxrKnuwdbq0Fo8fICJf6fCTY
         gEcSWpNNscybmasNqdw+/3u8cqBo2zJ5VxUxMECb5hvtzdbKvv3USCpaFS9WN597BT+B
         eHleqfP5kJnmHJbfxv2qY3Im/Ps9WvnskR2aACqrVJEwa0qmSx7xDVfsJX4ROG5YD0dy
         8rKiUCZ1B1VbzsAqUrjmjJmz0sSENcVfrWlNSKXFoWcnWZ4slwRAfWmicWzb6O56VWiN
         GL8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YhZ0KIta;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si9966216qtp.124.2020.04.28.01.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 01:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YhZ0KIta;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTLKW-0007Bc-Bh
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 04:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLI5-0001oN-Ri
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 04:09:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTL6Y-0004bD-9f
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 03:58:17 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTL1h-0002d1-Qs; Tue, 28 Apr 2020 03:51:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id i10so23430056wrv.10;
 Tue, 28 Apr 2020 00:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97Z+i1pZv8Icwzvb0dbeILUZJ248k0PpUZJviJ25BYw=;
 b=YhZ0KIta6YAwRt+11LDyoaPQkWiS/9tq9pJV4tLMl2SUnMJGcWuszpfZt8kZuaR8pE
 dsBRa6VBj0KmTh5Vz9x6EYSI2ag/Dl19ndsrD4SWETY3xmEQBnPbCLEXKtxc7yvD8LqF
 WOmWH6KFry00RrvZcIAW07gc4Xgm/NDj6qSFpg6FkW3/TspFmsWJvBX0AwAVa7QmbVSV
 XkwMMpW+zwbtm49zxptmACr7CQE4MLv2CKaAR+4Px72dwMxyolNShi2hYQ4E6MmQHdOO
 hlJG22tYiJZ/jN1prxHiTD+Xmaawl5R+ZL+96lKssRAhKkhfwl6FRBbRIRbcmBLoxOlO
 VeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=97Z+i1pZv8Icwzvb0dbeILUZJ248k0PpUZJviJ25BYw=;
 b=UpIBChky6zer2my/zFt/Tz7l7JsLado0ydokHfmZGfqtdYz9ZzlqyvzzTziOkoNJeh
 VStzPaE6oViFiTgRY5sZDxiW+RO47Mq9PIjJhsNw4YJySDjt1EpskySANZO3WuO9RHx6
 +5/CCpSSBeNgdUqyS3OM284xofneVUxe+uGnmIhciKPNSYgWIFaqN/GTx6f1WQD1vqHj
 V6+XwbZL6HYTlJRAjBrVSLfTtehl0f1tMXHAYdoQ+M+O9scFbpoBwIAAXcu/FIgE2xUh
 zuKHUnBDx0Ioby92k9AoHT4OsXAkBBblukAJ3E9l2SGA95QdU/gPF1ymPwbGoTCBI/lJ
 GlmA==
X-Gm-Message-State: AGi0PuZQYet54MwNIgThUwcTv6d7NapTrBPkqj7COdo0IohvxECY+KBc
 tVaaBq2N6LEtjeflJSk1+vE=
X-Received: by 2002:adf:82cf:: with SMTP id 73mr31334515wrc.411.1588060291847; 
 Tue, 28 Apr 2020 00:51:31 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id s18sm25775634wra.94.2020.04.28.00.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 00:51:31 -0700 (PDT)
Subject: Re: [PATCH v1 08/11] hw/arm: versal: Add support for SD
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-9-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <ed0d7473-0e7e-b7f6-6bd1-c4a55f7dff02@amsat.org>
Date: Tue, 28 Apr 2020 09:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-9-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7A71/tgI11AD

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for SD.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 31 +++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 12 ++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index c8a296e2e0..e263bdf77a 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -210,6 +210,36 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +#define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
> +static void versal_create_sds(Versal *s, qemu_irq *pic)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
> +        DeviceState *dev;
> +        MemoryRegion *mr;
> +
> +        sysbus_init_child_obj(OBJECT(s), "sd[*]",
> +                              &s->pmc.iou.sd[i], sizeof(s->pmc.iou.sd[i]),
> +                              TYPE_SYSBUS_SDHCI);
> +        dev = DEVICE(&s->pmc.iou.sd[i]);
> +
> +        object_property_set_uint(OBJECT(dev),
> +                                 3, "sd-spec-version", &error_fatal);
> +        object_property_set_uint(OBJECT(dev), SDHCI_CAPABILITIES, "capareg",
> +                                 &error_fatal);
> +        object_property_set_uint(OBJECT(dev), UHS_I, "uhs", &error_fatal);
> +        qdev_init_nofail(dev);
> +
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +        memory_region_add_subregion(&s->mr_ps,
> +                                    MM_PMC_SD0 + i * MM_PMC_SD0_SIZE, mr);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                           pic[VERSAL_SD0_IRQ_0 + i * 2]);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -292,6 +322,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_uarts(s, pic);
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
> +    versal_create_sds(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 426b66449d..e11693e29d 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -14,6 +14,7 @@
>  
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
> +#include "hw/sd/sdhci.h"
>  #include "hw/intc/arm_gicv3.h"
>  #include "hw/char/pl011.h"
>  #include "hw/dma/xlnx-zdma.h"
> @@ -26,6 +27,7 @@
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
>  #define XLNX_VERSAL_NR_ADMAS   8
> +#define XLNX_VERSAL_NR_SDS     2
>  #define XLNX_VERSAL_NR_IRQS    192
>  
>  typedef struct Versal {
> @@ -58,6 +60,13 @@ typedef struct Versal {
>          } iou;
>      } lpd;
>  
> +    /* The Platform Management Controller subsystem.  */
> +    struct {
> +        struct {
> +            SDHCIState sd[XLNX_VERSAL_NR_SDS];
> +        } iou;
> +    } pmc;
> +
>      struct {
>          MemoryRegion *mr_ddr;
>          uint32_t psci_conduit;
> @@ -80,6 +89,7 @@ typedef struct Versal {
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>  #define VERSAL_ADMA_IRQ_0          60
> +#define VERSAL_SD0_IRQ_0           126
>  
>  /* Architecturally reserved IRQs suitable for virtualization.  */
>  #define VERSAL_RSVD_IRQ_FIRST 111
> @@ -129,6 +139,8 @@ typedef struct Versal {
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
>  
> +#define MM_PMC_SD0                  0xf1040000U
> +#define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_CRP                  0xf1260000U
>  #define MM_PMC_CRP_SIZE             0x10000
>  #endif
> 
