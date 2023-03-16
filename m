Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp301692ejb;
        Thu, 16 Mar 2023 06:42:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set9paU+eENe31eznHERu27+pT7vzFFRzrvjJGzwUF3O5UTO/wjF9IN9/N6zc0Uhe5Q4BXCQ6
X-Received: by 2002:ac8:7f03:0:b0:3bf:d372:a5a4 with SMTP id f3-20020ac87f03000000b003bfd372a5a4mr5113750qtk.50.1678974142150;
        Thu, 16 Mar 2023 06:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678974142; cv=none;
        d=google.com; s=arc-20160816;
        b=ZarQ9DZr+YgprQqdbUsDgGfO0Oo9kxJ/EztRIzuoPtxQLRC/AyJqgLof27BotS4khj
         R07FMAgiOZP0Oibzc1ssFYXk9pCBr5XDpkugzRO5SzNhiHfEdpuaYLxa7e8S487qoKoK
         +OU5Nu5RbRWR2qZKWJCGtEmrVYYsGfQGKxPHWZF0gQRxz4B1tpY73jL4bPOqt2YX5gtS
         dVefMMQYByy+ZscYk0ZXRAEgzNEuDNgnRpTtY09En0kpsq1gNtronz98M2OSGEcMgIV4
         yLdnKIUBrO+ouHPAuEPHF0UQ82D1b3X8lOdrmXg1E3vQDa9pVPgkTrYn5UZ+1njv1sTC
         Gz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Apye2Rbn9g02f7KVerpT1+IoZIGGJf4C6uxn1AtIaAc=;
        b=yVDVzxT9UiPkgVzxHtOI5gVApXaBKiQRt12e4/Jx72IvxO7dw7xrrlmfHUsIdWFZk6
         qCt/yY3ONFcdMTdyEmVTA9weJvACqUWnx45XqLpmeo9aU0/LDdnwhtP70luaKFNaLokN
         ovJFVZSCg1JKNaQG/hZwwUXH3J/MFhZvU0Aif0vI+TZLY2wW++SIAI3NY2Ei66bvrQX8
         GUn7MK1LoEvfGvSrx/drc1GiRC+taXblagNL47H/K/4tY/81umT0oU9e+usgr1X66h61
         jG5N3DeDS3k9n//p4fEslpCpJlkXRQNRsJ+CO9q1f8fpVEhrE32g6v9PgjS2kgzGKmCY
         TOHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zHKE0rEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a05620a298b00b0073b9e507487si7017888qkp.553.2023.03.16.06.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 06:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zHKE0rEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcnrw-0000KT-Cg; Thu, 16 Mar 2023 09:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnru-0000FI-Tp
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 09:42:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnrt-0002UG-17
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 09:42:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id z11so1152803pfh.4
 for <qemu-arm@nongnu.org>; Thu, 16 Mar 2023 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678974127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Apye2Rbn9g02f7KVerpT1+IoZIGGJf4C6uxn1AtIaAc=;
 b=zHKE0rEokKaIe5c79NfBv/i3ArooFzMRfKzt5cSQXJ/DN6GxYPE/DaPFQH6QejafCo
 d5cxXwfAqmPYi5EMrq+Smwz+vvG4lnDfXivKpOMvA0hjMJjrhnyD3IlHAuAqHxGUq5/l
 PRprYhvp4rDdLego9VI1DLzu19GYLvrth4uAn1rkcOnbyC0mXJjzXbNoTAK4xex+9vjT
 0fpbvFsZ8uK6OzV1a7mW89S/9oXFBOR4pdrkOXCwh2GqEk7ZEXFRtxqT7Iy82oFJiBYn
 9gJY4MNGT15nWd4psfc5N2MqNFSzDsiGacCIUioaIVkUK2G+9O4xgJsX7HooHmeD8LiB
 50wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Apye2Rbn9g02f7KVerpT1+IoZIGGJf4C6uxn1AtIaAc=;
 b=kT14tS59Hc+glRL9wHIAVbJwNnFR9nSk+C/hVnJGqkVwHr3333nSrt1LHBpoTAaocw
 qJLROcTPo8A3Esz2R3mrwc0mf9UrmpzdE/Vjrfga9tkxxIqIp+pQJ94+JXKh9IGahKz3
 S6Q+1aLKc7iXEllkCHrJrFFDwNRg1CW/yOLjgSm7qqKu2ld1t6BSOWOj7YWnDYbykZNA
 zE2UPQu5KPHTealV7BDxBTjmANneEuSKoC1jrCxF/7RzK7kXR79OpC3Hr4wqyKcHXv+z
 58Xh7vqdzjyaGxGgWHNjg8IzgbhKPHsW7ECywmo45TnZ4rd3dU4i5EVSVMAvfJxldi+V
 J7og==
X-Gm-Message-State: AO0yUKUXQRjXL/SDaUbn+j4Uje3kxnVOWK+ZE6g4qbS/rJYHpqZ6DpER
 p/4g8l62pYqKg/ZsTAjvCeC0hnST20GllKE70jpNFQ==
X-Received: by 2002:a65:5087:0:b0:503:a26a:2e7a with SMTP id
 r7-20020a655087000000b00503a26a2e7amr903666pgp.6.1678974127409; Thu, 16 Mar
 2023 06:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
In-Reply-To: <20200313014551.12554-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 13:41:56 +0000
Message-ID: <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bSlTvml5HeYM

On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> and i.MX7 SoCs.
>
> The only support really needed - at least to boot Linux - is support
> for soft reset, which needs to reset various registers to their initial
> value. Otherwise, just record register values.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Hi Guenter; we've had a fuzzer report that this device model
accesses off the end of the usbphy[] array:
https://gitlab.com/qemu-project/qemu/-/issues/1408

> +static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
> +    uint32_t index = offset >> 2;
> +    uint32_t value;


> +    default:
> +        value = s->usbphy[index];

No bounds check in the default case (or ditto in the write function)...

> +        break;
> +    }
> +    return (uint64_t)value;
> +}

> +static void imx_usbphy_realize(DeviceState *dev, Error **errp)
> +{
> +    IMXUSBPHYState *s = IMX_USBPHY(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
> +                          "imx-usbphy", 0x1000);

...and the memory region is created at size 0x1000 so the read/write
fns can be called with offsets up to that size...

> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}

> +enum IMXUsbPhyRegisters {
> +    USBPHY_PWD,
> +    USBPHY_PWD_SET,
> +    USBPHY_PWD_CLR,
> +    USBPHY_PWD_TOG,
> +    USBPHY_TX,
> +    USBPHY_TX_SET,
> +    USBPHY_TX_CLR,
> +    USBPHY_TX_TOG,
> +    USBPHY_RX,
> +    USBPHY_RX_SET,
> +    USBPHY_RX_CLR,
> +    USBPHY_RX_TOG,
> +    USBPHY_CTRL,
> +    USBPHY_CTRL_SET,
> +    USBPHY_CTRL_CLR,
> +    USBPHY_CTRL_TOG,
> +    USBPHY_STATUS,
> +    USBPHY_DEBUG = 0x14,
> +    USBPHY_DEBUG_SET,
> +    USBPHY_DEBUG_CLR,
> +    USBPHY_DEBUG_TOG,
> +    USBPHY_DEBUG0_STATUS,
> +    USBPHY_DEBUG1 = 0x1c,
> +    USBPHY_DEBUG1_SET,
> +    USBPHY_DEBUG1_CLR,
> +    USBPHY_DEBUG1_TOG,
> +    USBPHY_VERSION,
> +    USBPHY_MAX
> +};
> +
> +#define USBPHY_CTRL_SFTRST BIT(31)
> +
> +#define TYPE_IMX_USBPHY "imx.usbphy"
> +#define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
> +
> +typedef struct IMXUSBPHYState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion iomem;
> +
> +    uint32_t usbphy[USBPHY_MAX];

...but the array is only created with USBPHY_MAX entries.

Do you know what the device is supposed to do with these
off-the-end acceses? We could either reduce the memory region
size or bounds check and RAZ/WI the out-of-range accesses.

thanks
-- PMM
