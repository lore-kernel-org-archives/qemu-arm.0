Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp230360ejf;
        Mon, 15 Jan 2024 05:12:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoFcQNim+8sBMwb3t3HjINXL5UCWTDQR+0uneeXDNsLxUPy3X9P2Yi3yjGaYcng8v58PGd
X-Received: by 2002:a05:6214:1d2d:b0:680:c7ba:e9f5 with SMTP id f13-20020a0562141d2d00b00680c7bae9f5mr7240917qvd.113.1705324379318;
        Mon, 15 Jan 2024 05:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705324379; cv=none;
        d=google.com; s=arc-20160816;
        b=KJAsicQDEGcCBRxMf65Wru5dowobQZaNgceh81XUHVVWQgsQ5eAGT21W067g8sJ8Je
         mvV0nDA8NkHZktUUi+5wA2FC+/bWr48UvtfeuK9RQEJnzNjP+JrBJQAy7f379MdBzNDh
         LPctGg1qp5CT8pZV0286PRs3iIfqWHO68AweLgiMtQlaZTlScIzppw/zbo1R0UsUNZfq
         p9WGOjzp5L2iFh2e+KBSl/pRdMAtGzdWC7PEc1CR5QTqzMvwho5ffgqrKgLF1qw7AfRv
         qI1xcsW+1EO5K5mytMEU45S7PrzlsGaKEF21muvoXoWCn/bFs4cRFoEe+iDEFp4p9SdK
         GojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=utOW4KHiyUGEp6pFYtWe3XbaL9IhUgwTvb30EZyAdQI=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=W9pqEZHE+AZXxQp71VNlSV2Fl7e5n1ni77IwkakGzfkdmOx+2lp8eRM05kJMyxKBWb
         fFhrpm4QN8ZuThfyBp9Jm5cuWsyPzZmiImHezt+mq/SdKqaguWfSwrl9PCD8Ud2VPZSL
         UEpWXcsMYNb6g0UigTSqsfn+qr0neGZi4Qm2C/vCiptAMZjASXIGSDnRiUCqCX9OCS0B
         gi1mv2XMAMbTVbXedymqlhJCZTw2Pmo6TKcXVoNmXYgBSoCZWkzm0W5LTRKG36fGfYyE
         BPKuUYKi7HbfEmW+RJS+ehbPwnOmlOTnfqbnfWQPDZnnfXapN1/A9ItVy3J6bWtjF+UP
         0Oxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZp7QaLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a0ce14e000000b0067f099cb65bsi7826409qvl.351.2024.01.15.05.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 05:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZp7QaLp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPMlS-0005pJ-Po; Mon, 15 Jan 2024 08:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPMlG-0005lE-Pa
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 08:12:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPMlE-00020H-7R
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 08:12:18 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-557c188f313so13420133a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 05:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705324331; x=1705929131; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=utOW4KHiyUGEp6pFYtWe3XbaL9IhUgwTvb30EZyAdQI=;
 b=KZp7QaLpG2oEsHqaJDcvBE1gNWRfpDq/OUiMHPwvtmzdjDtlSjKNpxhvQIX1y3K+1U
 8RBcSBq7Dql4x+NaECr2laLoOwG6oyyXkW8pit5U405L7UcSxo7oXAJqfjdkYJ05xO8P
 2d6TBbbR/CUs1G6s8cyIoD+vJG9rzuIintQAfmO2/I41r0q8Udu1qTNJaMiwUdJMItUI
 MNpST8jszbd5to5UTK7JcELnMrr99WRVdeTbTO/9RX0b/gWhsb3E3JOr1vuY7pBF8HmJ
 VIxaCY66tcVjH1M+b9JrEJOAZDmCQ336BXHuJf+9tRV9DC7XhhybxzUX71qNy1/3wtWf
 gJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705324331; x=1705929131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utOW4KHiyUGEp6pFYtWe3XbaL9IhUgwTvb30EZyAdQI=;
 b=eMhnb1F03jM4aEPwxjxYZ7HEdV70+uflouFCF+jMGHXgFpJFBH+g80AKsxVm+hmuhf
 XGnXrNYvF3zMOTGIiWwFwYYw795aUU6wGHN4+jq2no9mdHyjxEFvVDCgJ/lzKKacd+Fl
 4wzdnCtYyh2raQUZe4tKHt1sHFHBflk6Wyx8+QXVunwSpYx7ONLOhhLxUoLusP4C6DdG
 r3H6pcsqVq7n92RRC8VfAGZaXLBw+WHTWoX/SgGhDv40W7hSTokzhuvNbGaagwKNfDIV
 YPfbgOVQXegUNziWHiaEb4ldcrgXsraWuHYeza3JRW/KHpU4NfGXRgMo9yc2X1x5lKLM
 2u7A==
X-Gm-Message-State: AOJu0Yw3gZVBeLnUA6dKN2vutI319Vn57FoJxfvsrwaN69Vr7N2FZijV
 iF6JtiWTh7sJbycQhXjnyDCDgDErjDb6nop/W+ctxxD2GEzh3Q==
X-Received: by 2002:a05:6402:1747:b0:558:308f:db04 with SMTP id
 v7-20020a056402174700b00558308fdb04mr5071223edx.18.1705324331357; Mon, 15 Jan
 2024 05:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-14-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-14-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 13:12:00 +0000
Message-ID: <CAFEAcA8XxM7SuSdJAM=wGwUH=KxO-s7+idEeKYuZ9bE+YpU09w@mail.gmail.com>
Subject: Re: [PATCH v4 13/45] Add memory region for BCM2837 RPiVid ASB
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: txVPpv0UV1W/

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 3 +++
>  include/hw/arm/bcm2838_peripherals.h | 3 ++-
>  include/hw/arm/raspi_platform.h      | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index 196fb890a2..d3b42cf25b 100644
> --- a/hw/arm/bcm2838_peripherals.c
> +++ b/hw/arm/bcm2838_peripherals.c
> @@ -182,6 +182,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
>          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
>
>      object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
> +
> +    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
> +    create_unimp(s_base, &s->asb, "bcm2838-asb", RPI4B_ASB_OFFSET, 0x24);
>  }
>
>  static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
> index 0a87645e01..af085934c9 100644
> --- a/include/hw/arm/bcm2838_peripherals.h
> +++ b/include/hw/arm/bcm2838_peripherals.h
> @@ -64,12 +64,13 @@ struct BCM2838PeripheralState {
>      MemoryRegion mphi_mr_alias;
>
>      SDHCIState emmc2;
> -    UnimplementedDeviceState clkisp;

This seems like it should be in some other patch ?

>      BCM2838GpioState gpio;
>
>      OrIRQState mmc_irq_orgate;
>      OrIRQState dma_7_8_irq_orgate;
>      OrIRQState dma_9_10_irq_orgate;
> +
> +    UnimplementedDeviceState asb;
>  };
>
>  struct BCM2838PeripheralClass {
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> index 0db146e592..537fc6b4af 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -74,6 +74,7 @@ uint64_t board_ram_size(uint32_t board_rev);
>  #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
>  #define ARBA_OFFSET             0x9000
>  #define BRDG_OFFSET             0xa000
> +#define RPI4B_ASB_OFFSET        0xa000   /* BCM2838 (BCM2711) RPiVid ASB */

I think the existing BRDG_OFFSET was intended to be the
define for the address of this bridge device, so we can just use
it rather than adding a new define.

>  #define ARM_OFFSET              0xB000   /* ARM control block */
>  #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
>  #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */

thanks
-- PMM
