Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5178343lfm;
        Tue, 28 Apr 2020 01:11:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLuAh8ppukcGiOz/6itcZfjDlmeTnJctLlaBjBRTuKd5FmjgPUlIjPu1UStbYyCgTVx1b36
X-Received: by 2002:a0c:ba20:: with SMTP id w32mr25987888qvf.3.1588061508851;
        Tue, 28 Apr 2020 01:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588061508; cv=none;
        d=google.com; s=arc-20160816;
        b=r7VhCud5eSK4utwK6oALdIFSd1R/Z8Uw7pJLKg8NgmI75sH5HD8+U4peS7lIR2Mbgy
         sraOmk5aF1gOP+cA/TPmtTsJOLoaW+TTn3fukND6iN3vknWX/d0Tl60naLTwPWDc04wq
         mTtzgEz/5UXOZULz1RyHHdxEmSCmIdnn+nFay81d0B0jpX9dKC/RWACisW937aqVHetL
         e1Mx/JPFHLpg5sk4HSoH6D4qqhyq9bfEI/OGY95/g/HmI5C6xVaWbCYYsRElay+12/gd
         JpNIADR9k2IMu7bPpIu4ZfRLWvHbsn4BNy7G0UxiIr8bsMjrVBQfpU6RmnAjEuojdmjp
         YZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=jvR36v9I7G3ZbcmWE9zAsMRC1Ap8koZGFq/RrkcmjFw=;
        b=bzHXykniTm9qeZKFqS5hnpMsBVsArAdhNx+l8n5gM7DbV/3pUzqHfR0M/5zfNBQ+zE
         ioFG7874sLMQIfQ/PfExoUJVvi/O6WMgAdqkawwAkC8zYEX/1DVE05LxKBMLLqLFl6XG
         nxsqBCv/MVXGJ0LsXlrHbF36euxzM6y1bLGm4yp4he5fWcYGPIrc3CKltMLZrikmEAoa
         c8MlLB1MkVh2Q/X23f6fGbNHF5pdpkuEDcPhljT87q/KFRIwQbSh1hfJ2ijLTsVLM8qD
         9Wc5PrVYS5+Chk2A/sizVcMDHh3eYIb6I47WLizfbLf353zDj1Vbo9o91DiQA5TY4zfG
         FbgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rsHZOLPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si2464748qvp.44.2020.04.28.01.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 01:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rsHZOLPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45963 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTLLI-0001ce-8Y
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 04:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLFs-0001wy-VH
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 04:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLB6-0007AM-Lm
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 04:06:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLB6-0007AC-6y; Tue, 28 Apr 2020 04:01:16 -0400
Received: by mail-wm1-x344.google.com with SMTP id u16so1722455wmc.5;
 Tue, 28 Apr 2020 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvR36v9I7G3ZbcmWE9zAsMRC1Ap8koZGFq/RrkcmjFw=;
 b=rsHZOLPYOTuNO8g8d140VVUhjipWd/LB7hkPfINAa+5uECyZD34hwawTk0wAxbJ/RT
 Gjx+NEySWvOlwOIJC/kMD0caUForFG4A/1cpoWh9OsBzHmGhBJUVikHckjUII+/fKHLP
 TTukiCQwRjO/3GGTPWxQD4kGE/HGp9Vk+te+IrOvSmLeoVQAL6x3KAgJ/aUuXWpCiZ6v
 UgyGOYA5VWLLw4qkQPVcwSKMRcv8yrp2XHwBLSDdi9B3jHQjZs8MR+6y0ocMERgoihsg
 hb/2OnZR7gTTxF3ujn5SG/rWJwNmXGVqtJngx94VpYdHmROzKj2r4yUZzWkhmCYFlmGp
 bSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jvR36v9I7G3ZbcmWE9zAsMRC1Ap8koZGFq/RrkcmjFw=;
 b=h//UJdD25btzqyz84V5mdpACxlpr43tBtkj5HMcGqQ47eEouUYQtORrgYd0315kUor
 w7al4FtMqyWJDA6s639PsmapZTMu83ojGvLRFvo8RS95f5sjkWLLQEDi8LJ7R/Ija5eD
 k0+X3YEjdYanhfQxz6zcgIp+rBbHif1kexWzMZg3Uo8ZkWbtIAlhypJ1cbo+WzAg3k3e
 nopT42gMULgVY5/dqxdeQ3UOPY56CjOUjKAm9YjuNM7S2FnC83VhaIDZHo2t+IzgHUIR
 KBusuP+P5XS/byWqViykxuqIlDaUOY+A65sqn2Vv0AovKSs418iw8svFEUjB8sa1Kgv2
 0eEA==
X-Gm-Message-State: AGi0PubW9LHKYSMJI6eEOEygC/B4T8J4FOJNKwsAYnjIiQxMCYKYwiQl
 6C/2Y1SBa9UcCqxiQzYTIJE=
X-Received: by 2002:a1c:bc05:: with SMTP id m5mr2883021wmf.143.1588060874185; 
 Tue, 28 Apr 2020 01:01:14 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id z1sm2241999wmf.15.2020.04.28.01.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 01:01:13 -0700 (PDT)
Subject: Re: [PATCH v1 09/11] hw/arm: versal: Add support for the RTC
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-10-edgar.iglesias@gmail.com>
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
Message-ID: <c48cc173-39c4-4681-45ee-526d3ed34522@amsat.org>
Date: Tue, 28 Apr 2020 10:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-10-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::344
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BOujGcS9z2q2

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> hw/arm: versal: Add support for the RTC.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 21 +++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h |  8 ++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index e263bdf77a..321171bcce 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -240,6 +240,26 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_rtc(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +    MemoryRegion *mr;
> +
> +    sysbus_init_child_obj(OBJECT(s), "rtc", &s->pmc.rtc, sizeof(s->pmc.rtc),
> +                          TYPE_XLNX_ZYNQMP_RTC);
> +    sbd = SYS_BUS_DEVICE(&s->pmc.rtc);
> +    qdev_init_nofail(DEVICE(sbd));
> +
> +    mr = sysbus_mmio_get_region(sbd, 0);
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_RTC, mr);
> +
> +    /*
> +     * TODO: Connect the ALARM and SECONDS interrupts once our RTC model
> +     * supports them.
> +     */
> +    sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);

RTC IRQ#1 is 'irq_addr_error_int', OK. Maybe worth later switching to
the qdev gpio API using qdev_init_gpio_out_named() in
hw/rtc/xlnx-zynqmp-rtc.c and then qdev_get_gpio_in_named() here.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -323,6 +343,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_gems(s, pic);
>      versal_create_admas(s, pic);
>      versal_create_sds(s, pic);
> +    versal_create_rtc(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index e11693e29d..9c9f47ba9d 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -19,6 +19,7 @@
>  #include "hw/char/pl011.h"
>  #include "hw/dma/xlnx-zdma.h"
>  #include "hw/net/cadence_gem.h"
> +#include "hw/rtc/xlnx-zynqmp-rtc.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  #define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
> @@ -65,6 +66,8 @@ typedef struct Versal {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
>          } iou;
> +
> +        XlnxZynqMPRTC rtc;
>      } pmc;
>  
>      struct {
> @@ -89,7 +92,10 @@ typedef struct Versal {
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>  #define VERSAL_ADMA_IRQ_0          60
> +#define VERSAL_RTC_APB_ERR_IRQ     121
>  #define VERSAL_SD0_IRQ_0           126
> +#define VERSAL_RTC_ALARM_IRQ       142
> +#define VERSAL_RTC_SECONDS_IRQ     143
>  
>  /* Architecturally reserved IRQs suitable for virtualization.  */
>  #define VERSAL_RSVD_IRQ_FIRST 111
> @@ -143,4 +149,6 @@ typedef struct Versal {
>  #define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_CRP                  0xf1260000U
>  #define MM_PMC_CRP_SIZE             0x10000
> +#define MM_PMC_RTC                  0xf12a0000
> +#define MM_PMC_RTC_SIZE             0x10000
>  #endif
> 
