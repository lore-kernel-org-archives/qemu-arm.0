Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1741413lff;
        Sun, 19 Jan 2020 10:44:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfb8R37IsS7QJ2EaRrNLJVnOH/xO/TWtH1GXISD+Z24ZarFMyi1QteGFvyC89E+M1sqTo4
X-Received: by 2002:a17:906:2651:: with SMTP id i17mr16907583ejc.246.1579459471895;
        Sun, 19 Jan 2020 10:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579459471; cv=none;
        d=google.com; s=arc-20160816;
        b=Qj+UYhtNFH4+rlyGB+58mJLtRZ+Wl9lNnTi7Lt47bhy5sULD79DqGBfpsoMnyFqBmO
         JMETlw+ESnfjtysJzaSEQXSeefl8Nh6hX7l++J0a3VIsTVOhm99fm+GOGcEZe+9PPY2v
         tOIhAqxRb1Y9lOwNNz+IObQtJynC8hgqodPJ6DZIJXHkiAJ/QKmNSLzDfi86L1tE54Sy
         VqvhhbmKbkmq8R6yWwqVnW6G5skSi/8kXoJkRo00ksFoDn7rNQgA+xhCMSABheIoMx5o
         rEXM6NKSHqiiqtr8Fk0QOmsWl/UJr2Er2yGXBpy4uvAkGT+KeznfwkRlw7v90aTlJPoZ
         B5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=P1Do3fehiU5YLb3JcweKxgKgiUuvDvmxETHnDMh9EaI=;
        b=OlxZ+9XQ9ghssnwv2IPXJxMbb+2SA+uyu8QFP7/nSR7Pw0o+Vq23CKC/ms70zZc7vG
         cfvyCny0KNyPE1hS0jnMpINW8U9dgy75Ck1CwznZc5XR2fDaze1DTFEfNcSGpAzQcziE
         31mkyDbcGFEeNJWkebSXJ7fkLq+nC7XsB3n0Wf+23RwJkNQ8hza63AozjsJfQ8F9FJFR
         j7YoAGxMm5kGodFVKINHoleiUvXfqCfz+ro5B4ebQHkbi2f3K/pFDfTfy4YY7RlMqTZB
         NsPu4AnIh8f5DbWTYC3dc8oaNpzYj7KrhpJX79220ebD0DzqsyvGCf8d1X/IO/atiEIw
         uJqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBf0d4bG;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id rv6si20924534ejb.167.2020.01.19.10.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBf0d4bG;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579459470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1Do3fehiU5YLb3JcweKxgKgiUuvDvmxETHnDMh9EaI=;
	b=OBf0d4bGHApdM9Tb4clifSrIHDuSXigijreU6WZX7OKlmrPvpzZs67JrPBFy+UrO5PGGtn
	nY1FACgU+K74StEnqrXAIhs7fOm4xrdfHfBpTGOlncW3zflWuEvwhVDAoro6zYWO+CyJuZ
	zTUYY0kudf+Ui94nD1A6cUxT9miHvJc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-G_LUJzPsMr-_W1lQ0DJnrA-1; Sun, 19 Jan 2020 13:44:29 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so12983302wrq.12
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 10:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qtuBjOvsDm0iD4q3HPN9A6dD6GUaj932MEe1Kfvvi0g=;
        b=ufuYnWoG1rnlvBeEQ/NBb8GEJkRhw2buXeDONfpZxEHfgzc4655tHB8BFYt7YWKLT2
         TkoyjKuWZW5bsTPBpP1dnSjqFUv84lue0fS4uh5QIozCM/IgLvkCp73XlUVRqtoSHGhi
         zkE0NM7DmV2RW2bb2zWUEIbNhcsjokd9CAa/MxU+L0TA0D82ipOR6tALcRBXE6WLRZQk
         EfckZOUeeI5i/1DgLaxjzhcc+lVAGYP3k19w8tJ64HgU+uisSIsQZ6Px2uqKTcdmwI6R
         gucl+Hung8i8fJHIvpQcHx8bw2sCNN3pydP6U38KyS4+bUiyQGxrV1XQLeHMduyoeRGZ
         Cevg==
X-Gm-Message-State: APjAAAWprAnj0t/v/ppTAAZUaXq8XBOgRAciRVRtYIL7AB7QwPFggmTq
	CcACR8dc9NcOtypsu0eWDwAroGeJNH/S4ZafaPLLQD80l6tF0HsWRe946AwyA5JBS4yOGFrQ9Sn
	9yD3oj6/ToGmF4u9a
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr15621658wma.32.1579459468161;
        Sun, 19 Jan 2020 10:44:28 -0800 (PST)
X-Received: by 2002:a05:600c:2383:: with SMTP id m3mr15621642wma.32.1579459467896;
        Sun, 19 Jan 2020 10:44:27 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id t125sm20251103wmf.17.2020.01.19.10.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:44:27 -0800 (PST)
Subject: Re: [PATCH v4 04/20] hw/arm/allwinner-h3: add USB host controller
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-5-nieklinnenbank@gmail.com>
 <39b5cc92-df42-50a4-72ba-10850aa00b04@redhat.com>
Message-ID: <851e2620-82f8-b911-7641-f1690238cc2a@redhat.com>
Date: Sun, 19 Jan 2020 19:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <39b5cc92-df42-50a4-72ba-10850aa00b04@redhat.com>
Content-Language: en-US
X-MC-Unique: G_LUJzPsMr-_W1lQ0DJnrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: yF/tjAde6Vby

On 1/19/20 7:37 PM, Philippe Mathieu-Daud=E9 wrote:
> On 1/19/20 1:50 AM, Niek Linnenbank wrote:
>> The Allwinner H3 System on Chip contains multiple USB 2.0 bus
>> connections which provide software access using the Enhanced
>> Host Controller Interface (EHCI) and Open Host Controller
>> Interface (OHCI) interfaces. This commit adds support for
>> both interfaces in the Allwinner H3 System on Chip.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>> =A0 hw/usb/hcd-ehci.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
>> =A0 include/hw/arm/allwinner-h3.h |=A0 8 ++++++
>> =A0 hw/arm/allwinner-h3.c=A0=A0=A0=A0=A0=A0=A0=A0 | 52 +++++++++++++++++=
+++++++++++++++---
>> =A0 hw/usb/hcd-ehci-sysbus.c=A0=A0=A0=A0=A0 | 17 ++++++++++++
>> =A0 4 files changed, 74 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
>> index 0298238f0b..edb59311c4 100644
>> --- a/hw/usb/hcd-ehci.h
>> +++ b/hw/usb/hcd-ehci.h
>> @@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
>> =A0 #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
>> =A0 #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
>> =A0 #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
>> +#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
>> =A0 #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
>> =A0 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
>> =A0 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
>> diff --git a/include/hw/arm/allwinner-h3.h=20
>> b/include/hw/arm/allwinner-h3.h
>> index abdc20871a..4f4dcbcd17 100644
>> --- a/include/hw/arm/allwinner-h3.h
>> +++ b/include/hw/arm/allwinner-h3.h
>> @@ -56,6 +56,14 @@ enum {
>> =A0=A0=A0=A0=A0 AW_H3_SRAM_A1,
>> =A0=A0=A0=A0=A0 AW_H3_SRAM_A2,
>> =A0=A0=A0=A0=A0 AW_H3_SRAM_C,
>> +=A0=A0=A0 AW_H3_EHCI0,
>> +=A0=A0=A0 AW_H3_OHCI0,
>> +=A0=A0=A0 AW_H3_EHCI1,
>> +=A0=A0=A0 AW_H3_OHCI1,
>> +=A0=A0=A0 AW_H3_EHCI2,
>> +=A0=A0=A0 AW_H3_OHCI2,
>> +=A0=A0=A0 AW_H3_EHCI3,
>> +=A0=A0=A0 AW_H3_OHCI3,
>> =A0=A0=A0=A0=A0 AW_H3_CCU,
>> =A0=A0=A0=A0=A0 AW_H3_PIT,
>> =A0=A0=A0=A0=A0 AW_H3_UART0,
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index 8df8e3e05e..f360625ee9 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -28,6 +28,7 @@
>> =A0 #include "hw/sysbus.h"
>> =A0 #include "hw/char/serial.h"
>> =A0 #include "hw/misc/unimp.h"
>> +#include "hw/usb/hcd-ehci.h"
>> =A0 #include "sysemu/sysemu.h"
>> =A0 #include "hw/arm/allwinner-h3.h"
>> @@ -36,6 +37,14 @@ const hwaddr allwinner_h3_memmap[] =3D {
>> =A0=A0=A0=A0=A0 [AW_H3_SRAM_A1]=A0=A0=A0 =3D 0x00000000,
>> =A0=A0=A0=A0=A0 [AW_H3_SRAM_A2]=A0=A0=A0 =3D 0x00044000,
>> =A0=A0=A0=A0=A0 [AW_H3_SRAM_C]=A0=A0=A0=A0 =3D 0x00010000,
>> +=A0=A0=A0 [AW_H3_EHCI0]=A0=A0=A0=A0=A0 =3D 0x01c1a000,
>> +=A0=A0=A0 [AW_H3_OHCI0]=A0=A0=A0=A0=A0 =3D 0x01c1a400,
>> +=A0=A0=A0 [AW_H3_EHCI1]=A0=A0=A0=A0=A0 =3D 0x01c1b000,
>> +=A0=A0=A0 [AW_H3_OHCI1]=A0=A0=A0=A0=A0 =3D 0x01c1b400,
>> +=A0=A0=A0 [AW_H3_EHCI2]=A0=A0=A0=A0=A0 =3D 0x01c1c000,
>> +=A0=A0=A0 [AW_H3_OHCI2]=A0=A0=A0=A0=A0 =3D 0x01c1c400,
>> +=A0=A0=A0 [AW_H3_EHCI3]=A0=A0=A0=A0=A0 =3D 0x01c1d000,
>> +=A0=A0=A0 [AW_H3_OHCI3]=A0=A0=A0=A0=A0 =3D 0x01c1d400,
>> =A0=A0=A0=A0=A0 [AW_H3_CCU]=A0=A0=A0=A0=A0=A0=A0 =3D 0x01c20000,
>> =A0=A0=A0=A0=A0 [AW_H3_PIT]=A0=A0=A0=A0=A0=A0=A0 =3D 0x01c20c00,
>> =A0=A0=A0=A0=A0 [AW_H3_UART0]=A0=A0=A0=A0=A0 =3D 0x01c28000,
>> @@ -73,10 +82,10 @@ struct AwH3Unimplemented {
>> =A0=A0=A0=A0=A0 { "msgbox",=A0=A0=A0 0x01c17000, 4 * KiB },
>> =A0=A0=A0=A0=A0 { "spinlock",=A0 0x01c18000, 4 * KiB },
>> =A0=A0=A0=A0=A0 { "usb0-otg",=A0 0x01c19000, 4 * KiB },
>> -=A0=A0=A0 { "usb0",=A0=A0=A0=A0=A0 0x01c1a000, 4 * KiB },
>> -=A0=A0=A0 { "usb1",=A0=A0=A0=A0=A0 0x01c1b000, 4 * KiB },
>> -=A0=A0=A0 { "usb2",=A0=A0=A0=A0=A0 0x01c1c000, 4 * KiB },
>> -=A0=A0=A0 { "usb3",=A0=A0=A0=A0=A0 0x01c1d000, 4 * KiB },
>> +=A0=A0=A0 { "usb0-phy",=A0 0x01c1a000, 4 * KiB },
>> +=A0=A0=A0 { "usb1-phy",=A0 0x01c1b000, 4 * KiB },
>> +=A0=A0=A0 { "usb2-phy",=A0 0x01c1c000, 4 * KiB },
>> +=A0=A0=A0 { "usb3-phy",=A0 0x01c1d000, 4 * KiB },
>=20
> As in v3 comment, this can be done in patch #1.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Err, this patch is incomplete, when using ./configure=20
--without-default-devices:

$ qemu-system-arm -M orangepi-pc
qemu-system-arm: invalid accelerator kvm
qemu-system-arm: falling back to tcg
qemu-system-arm: Unknown device 'aw-h3-ehci-usb' for default sysbus
qemu-system-arm: Unknown device 'sysbus-ohci' for default sysbus
Aborted (core dumped)

You need to amend:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bb75c1de17..57b29cc522 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -302,6 +302,8 @@ config ALLWINNER_H3
      select ARM_TIMER
      select ARM_GIC
      select UNIMP
+    select USB_OHCI
+    select USB_EHCI_SYSBUS

  config RASPI
      bool
---

R/T-b tags can stay with this amended.

>> =A0=A0=A0=A0=A0 { "smc",=A0=A0=A0=A0=A0=A0 0x01c1e000, 4 * KiB },
>> =A0=A0=A0=A0=A0 { "pio",=A0=A0=A0=A0=A0=A0 0x01c20800, 1 * KiB },
>> =A0=A0=A0=A0=A0 { "owa",=A0=A0=A0=A0=A0=A0 0x01c21000, 1 * KiB },
>> @@ -144,6 +153,14 @@ enum {
>> =A0=A0=A0=A0=A0 AW_H3_GIC_SPI_UART3=A0=A0=A0=A0 =3D=A0 3,
>> =A0=A0=A0=A0=A0 AW_H3_GIC_SPI_TIMER0=A0=A0=A0 =3D 18,
>> =A0=A0=A0=A0=A0 AW_H3_GIC_SPI_TIMER1=A0=A0=A0 =3D 19,
>> +=A0=A0=A0 AW_H3_GIC_SPI_EHCI0=A0=A0=A0=A0 =3D 72,
>> +=A0=A0=A0 AW_H3_GIC_SPI_OHCI0=A0=A0=A0=A0 =3D 73,
>> +=A0=A0=A0 AW_H3_GIC_SPI_EHCI1=A0=A0=A0=A0 =3D 74,
>> +=A0=A0=A0 AW_H3_GIC_SPI_OHCI1=A0=A0=A0=A0 =3D 75,
>> +=A0=A0=A0 AW_H3_GIC_SPI_EHCI2=A0=A0=A0=A0 =3D 76,
>> +=A0=A0=A0 AW_H3_GIC_SPI_OHCI2=A0=A0=A0=A0 =3D 77,
>> +=A0=A0=A0 AW_H3_GIC_SPI_EHCI3=A0=A0=A0=A0 =3D 78,
>> +=A0=A0=A0 AW_H3_GIC_SPI_OHCI3=A0=A0=A0=A0 =3D 79,
>> =A0 };
>> =A0 /* Allwinner H3 general constants */
>> @@ -284,6 +301,33 @@ static void allwinner_h3_realize(DeviceState=20
>> *dev, Error **errp)
>> =A0=A0=A0=A0=A0 qdev_init_nofail(DEVICE(&s->ccu));
>> =A0=A0=A0=A0=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW=
_H3_CCU]);
>> +=A0=A0=A0 /* Universal Serial Bus */
>> +=A0=A0=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_EHCI0)=
);
>> +=A0=A0=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI1],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_EHCI1)=
);
>> +=A0=A0=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI2],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_EHCI2)=
);
>> +=A0=A0=A0 sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI3],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_EHCI3)=
);
>> +
>> +=A0=A0=A0 sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_OHCI0)=
);
>> +=A0=A0=A0 sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_OHCI1)=
);
>> +=A0=A0=A0 sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_OHCI2)=
);
>> +=A0=A0=A0 sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 qdev_get_gpio_in(DEVICE(&s->gic),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AW_H3_GIC_SPI_OHCI3)=
);
>> +
>> =A0=A0=A0=A0=A0 /* UART0. For future clocktree API: All UARTS are connec=
ted to=20
>> APB2_CLK. */
>> =A0=A0=A0=A0=A0 serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART=
0], 2,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 qdev_get_gp=
io_in(DEVICE(&s->gic),=20
>> AW_H3_GIC_SPI_UART0),
>> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
>> index 020211fd10..174c3446ef 100644
>> --- a/hw/usb/hcd-ehci-sysbus.c
>> +++ b/hw/usb/hcd-ehci-sysbus.c
>> @@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info =3D=
 {
>> =A0=A0=A0=A0=A0 .class_init=A0=A0=A0 =3D ehci_exynos4210_class_init,
>> =A0 };
>> +static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
>> +{
>> +=A0=A0=A0 SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
>> +=A0=A0=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);
>> +
>> +=A0=A0=A0 sec->capsbase =3D 0x0;
>> +=A0=A0=A0 sec->opregbase =3D 0x10;
>> +=A0=A0=A0 set_bit(DEVICE_CATEGORY_USB, dc->categories);
>> +}
>> +
>> +static const TypeInfo ehci_aw_h3_type_info =3D {
>> +=A0=A0=A0 .name=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D TYPE_AW_H3_EHCI,
>> +=A0=A0=A0 .parent=A0=A0=A0=A0=A0=A0=A0 =3D TYPE_SYS_BUS_EHCI,
>> +=A0=A0=A0 .class_init=A0=A0=A0 =3D ehci_aw_h3_class_init,
>> +};
>> +
>> =A0 static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
>> =A0 {
>> =A0=A0=A0=A0=A0 SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
>> @@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_platform_type_info);
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_xlnx_type_info);
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_exynos4210_type_info);
>> +=A0=A0=A0 type_register_static(&ehci_aw_h3_type_info);
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_tegra2_type_info);
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_ppc4xx_type_info);
>> =A0=A0=A0=A0=A0 type_register_static(&ehci_fusbh200_type_info);
>>
