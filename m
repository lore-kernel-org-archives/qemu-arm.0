Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp300970ejf;
        Mon, 15 Jan 2024 07:07:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1XAKIrqyv4itz/67dBYLxuAKHK3qeTxXRT8BhXzAzjy+boK/PY+/iTDN+FRkl86BotRpr
X-Received: by 2002:a05:622a:1901:b0:429:a704:8582 with SMTP id w1-20020a05622a190100b00429a7048582mr6977548qtc.106.1705331279586;
        Mon, 15 Jan 2024 07:07:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705331279; cv=none;
        d=google.com; s=arc-20160816;
        b=gRHCHUNLsRBat0gJLy1d8C75nhq6Q3wok3WZ/J/kvu77ieLhaCzCKlK7sVxNv0d0KA
         2NzuccceCEmJ243ztIWLH/RX8MB7NxEWxJJCbTEBf7r1HuD8zkIsf8j9jfa14a4d5Bih
         mER2tgiXrIsc5auQyw4+eUrd4dxJB5JZwHmr2s+e4Pd+LGOTPC9hUh7kBX+Mc7QUb9XJ
         0igDLFowz53cExgV4B72OUGz4oEAaQiGaRiXUgWUsP572PgV4fEOyjzPDu/zDQ6bpBnF
         I6MTk9oW10Lfi4edajR+PbapTtkl3HTqjQgeQ7ObMP3xJkT9YjXXWuLsYz+yT5y0LEI9
         U4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wl9pu1rNawDQg9EF8HQ59l55zNZKk/tf1CmvyTOKoN4=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=AfQOZzR4ZkG7wZbBx0E+eCXa0TdCOI0pJ2u2E8GHI/oysSf7jOL42tiJzmPOc3IpH9
         Vk6Z1JchgJs/i2akunPdIHV0dIsGDu4DtL9J7CQXswqJYhGS/zlJMS9a4dBQ/ESUXHSE
         EO5u9mDnlrjqY2ObqXBx0PhWFOiWi5zjSLFt6YYpfZ8l9h+MMmuBVwerHoGnUKHXLkxl
         ZpgcL19UnSn+8TsDa+wWVoFNLquvR6qpUHh1sL8TbFqYCA32qq7UAMYz8YH/at+bgE63
         /jxmiVK8S6fQk6XvyjzXiNNh9sfYmlw4qE3Q8Qjcs4vzfBgJtFuWGe2Ilr065hdZ+H9Z
         7Eiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ayaco7fM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ac85e4b000000b00429d5815307si5309795qtx.362.2024.01.15.07.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 07:07:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ayaco7fM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rPOYr-0007pb-LE; Mon, 15 Jan 2024 10:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOYo-0007na-35
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 10:07:35 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOYk-0000na-Hg
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 10:07:33 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5596fa1e2ebso443547a12.2
 for <qemu-devel@nongnu.org>; Mon, 15 Jan 2024 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705331248; x=1705936048; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wl9pu1rNawDQg9EF8HQ59l55zNZKk/tf1CmvyTOKoN4=;
 b=Ayaco7fM5jUBVVVXnA+Qk30EVHiESPdy9OumzGQFDr7SWo+sDQgj93Vf0XaOz9Ff7e
 C3npE1KaWB8EBOnWonjax/lTKMmpHct8xT5ymY+URen5JWcojdIteI+AOmrtgAPXPxwo
 S5BdAG4AkUvzPm9lzzLaEIXhfmp4qQ/0Tg9UwAHa63pFyN0IMzWCCziGoC0Sd4Rwhj9i
 gNHBIGQrxQQZ5wwYF9wJVSDh08Ypo7O5VNyBZcMRq1q2RH/I6fnxKpr4tcwm3es91nOU
 MWBNz//SFf4rTJZt43XmzKa7245t0Vq0dWx6tikray2T2I2GpePd0Gy8UwzOKQ+WBDE0
 7Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705331248; x=1705936048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl9pu1rNawDQg9EF8HQ59l55zNZKk/tf1CmvyTOKoN4=;
 b=Qzs65zInlaqm1KflpKr3cAC7syS1SWlAZvO0v8RSQifhmccdwG1X796DvLI+F2cAlh
 tTv8RBHHhFiXHRFG5D4wBZogHTEB2Z1bd+fRBURiVavbgsif3Iy86h0ZVpB/WrhxqsmC
 WpZNyshuQZVZZ2E/Gk8OlMK0dKksAv7IXdPRMvbp/ky6ZDsrJ3EpB0Ql2aUqyPWe2GQO
 22QhHyDJZpEuAzCGvszH4SDLeOxE6RxhX7GsL9pD0A5MPaIHGVEYmnF8ys5Kth32IKjw
 2BgsHKGtN5RdC3muy4a6ktnVaNP2GSVnboryZEuAHI8tRxsWLFbiB8d/tISxTYKH9CHa
 L9TA==
X-Gm-Message-State: AOJu0YwFfsBydnAeCyt2Rg33bMooGlK7qMhWs5y8eJI2JbUFqHdBmNzC
 GmUeyQ+pIYut1qSui0V0vRfaLunEGtCSSKrVzgZ+C4Gup78icg==
X-Received: by 2002:aa7:c88c:0:b0:558:8a94:49c with SMTP id
 p12-20020aa7c88c000000b005588a94049cmr2683793eds.34.1705331248284; Mon, 15
 Jan 2024 07:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-44-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-44-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 15:07:16 +0000
Message-ID: <CAFEAcA98HqPHe_0zV7B4MfWZAaa9kOT=u6uX_yFsTQcnBZcwQA@mail.gmail.com>
Subject: Re: [PATCH v4 43/45] Add missed BCM2835 properties
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ylaNxLVqI1WN

On Fri, 8 Dec 2023 at 02:36, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/misc/bcm2835_property.c           | 47 ++++++++++++++++++++++++++++
>  include/hw/arm/raspberrypi-fw-defs.h | 12 ++++++-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index ff55a4e2cd..dfeb793b3e 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -19,6 +19,9 @@
>  #include "trace.h"
>  #include "hw/arm/raspi_platform.h"
>
> +#define RPI_EXP_GPIO_BASE       128

This define doesn't seem to be used in this patch.

> +#define VCHI_BUSADDR_SIZE       sizeof(uint32_t)
> +
>  /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
>
>  static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
> @@ -138,6 +141,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen = 8;
>              break;
>
> +        case RPI_FWREQ_GET_CLOCKS:
> +            /* TODO: add more clock IDs if needed */
> +            stl_le_phys(&s->dma_as, value + 12, 0);
> +            stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_ARM_CLK_ID);
> +            resplen = 8;
> +            break;
> +
>          case RPI_FWREQ_SET_CLOCK_RATE:
>          case RPI_FWREQ_SET_MAX_CLOCK_RATE:
>          case RPI_FWREQ_SET_MIN_CLOCK_RATE:
> @@ -276,6 +286,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              stl_le_phys(&s->dma_as, value + 12, 0);
>              resplen = 4;
>              break;
> +
>          case RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS:
>              stl_le_phys(&s->dma_as, value + 12, 1);
>              resplen = 4;
> @@ -301,6 +312,42 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>                                      resplen);
>              break;
>
> +        case RPI_FWREQ_GET_THROTTLED:
> +            stl_le_phys(&s->dma_as, value + 12, 0);
> +            resplen = 4;
> +            break;
> +
> +        case RPI_FWREQ_FRAMEBUFFER_SET_PITCH:
> +            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_FRAMEBUFFER_SET_PITCH "
> +                              "is not implemented\n");
> +            break;
> +
> +        case RPI_FWREQ_GET_GPIO_CONFIG:
> +            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_CONFIG "
> +                          "is not implemented\n");
> +            break;
> +
> +        case RPI_FWREQ_SET_GPIO_CONFIG:
> +            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_CONFIG "
> +                          "is not implemented\n");
> +            break;
> +
> +        case RPI_FWREQ_GET_GPIO_STATE:
> +            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_STATE "
> +                          "is not implemented\n");
> +            break;
> +
> +        case RPI_FWREQ_SET_GPIO_STATE:
> +            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_STATE "
> +                          "is not implemented\n");
> +            break;

These don't do anything that isn't already covered by the
"default" case. The only reason to have a case specifically
for an unimplemented property is for where we need to at least
get the response length correct to avoid the guest falling over.
You'll note that all the other LOG_UNIMP cases in this switch
set resplen.

> +
> +        case RPI_FWREQ_VCHIQ_INIT:
> +            stl_le_phys(&s->dma_as,
> +                        value + offsetof(rpi_firmware_prop_request_t, payload),
> +                        0);
> +            resplen = VCHI_BUSADDR_SIZE;
> +            break;
>          default:
>              qemu_log_mask(LOG_UNIMP,
>                            "bcm2835_property: unhandled tag 0x%08x\n", tag);
> diff --git a/include/hw/arm/raspberrypi-fw-defs.h b/include/hw/arm/raspberrypi-fw-defs.h
> index 4551fe7450..ded7a22f02 100644
> --- a/include/hw/arm/raspberrypi-fw-defs.h
> +++ b/include/hw/arm/raspberrypi-fw-defs.h
> @@ -101,7 +101,6 @@ enum rpi_firmware_property_tag {
>      RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_ID =             0x00040016,
>      RPI_FWREQ_FRAMEBUFFER_SET_DISPLAY_NUM =            0x00048013,
>      RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS =           0x00040013,
> -    RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_SETTINGS =       0x00040014,

Why do we delete this ?

>      RPI_FWREQ_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
>      RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
>      RPI_FWREQ_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
> @@ -160,4 +159,15 @@ enum rpi_firmware_clk_id {
>      RPI_FIRMWARE_NUM_CLK_ID,
>  };
>
> +struct rpi_firmware_property_tag_header {
> +    uint32_t tag;
> +    uint32_t buf_size;
> +    uint32_t req_resp_size;
> +};
> +
> +typedef struct rpi_firmware_prop_request {
> +    struct rpi_firmware_property_tag_header hdr;
> +    uint8_t payload[0];
> +} rpi_firmware_prop_request_t;
> +
>  #endif /* INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_ */

thanks
-- PMM
