Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1516428njf;
        Tue, 3 Sep 2024 09:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV9ABjGzab/KMJkvaeGHQqDgk9ysyC2Xh90tjOnqquqq++B7pBNT5H5fsRyF7thgWKI9ldPZ5kaptMoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjTgUmLTynhICaNELAmGKNTj+N3HEu7OF6Y9Oy9nYYEQQujdyKqmv0w69yxRoj/nnqrUlT
X-Received: by 2002:a05:6808:1929:b0:3d9:2e91:96a5 with SMTP id 5614622812f47-3e00cb88f2bmr3356502b6e.18.1725382547498;
        Tue, 03 Sep 2024 09:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725382547; cv=none;
        d=google.com; s=arc-20160816;
        b=hgWKHmfth2ixAlvuatOcLeat6UwsvsocrMMKwL7bslRZcRdcmiRkA4PkcSb+OnoQJB
         UKu/PKnS0gIIJDWFuxGs13Nj04PBWjzfQnKwEVZZNKBPsXeXULRoA48z6ecuLlZ5rp4j
         55qbi8yA90QUjd/diwHzUN3cA5yoNE28s7mWG4vQh9Mtbksz4cNx8658mgeyglYNViHB
         MHI3ZxyLP2IOY65oJiQyqtND4WU51gqRZ/dR19ie552CO7jbYiI21ZIKF5WcmqbphW+3
         JQGApm8YDGopeD9z6HOOCIwEL8uhj/YMlMKvZoz4k+Fnu18Cr4ZIg7BGO4UiXMMtDbGD
         AjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TzGHsTPwbo7y9GvAFEd0eWxpbpA9qjgaCZBT9AhWJio=;
        fh=oorHHx/Z0bO8azh1aJxnZ8TVzszR5QMROosYlJoD4iE=;
        b=px1WTIe6YWa7G5O5FqUiw4f+44SKnJQJVjSWU68ae6IyfxyEEV1KX3QeP2yLBWu9sj
         WeAf0LBDveHQ7l7kUU9tmR6ZEhBIJEXuKCQHPJQagElS1cYqYzPojQZ549tnaAWQe2tm
         maoSlmoyBl2oK402pM5xBZXwZwEgp5SbbIFc1uakLEHOdCm9cJr4iKdoMFzbp2XtUJ2q
         +8iYxJTR1pWUDiXcaKnYlb4Xae2nlZ1RWHv4UFUsf0t/VFPHDMQsZa2JtuKaixKkd/yH
         CA4d04HG8suDtfZHVsc/GPvdRGQpiEGljuTojhUwySKmuGBQ3ndAY9dNUYiKVtIeVabU
         Yjsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDNylC0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c8594bsi110002891cf.145.2024.09.03.09.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDNylC0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWod-0008TY-7S; Tue, 03 Sep 2024 12:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slWoa-0008Dh-AL
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slWoM-0000oH-MJ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725382520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TzGHsTPwbo7y9GvAFEd0eWxpbpA9qjgaCZBT9AhWJio=;
 b=GDNylC0MSIIgHgDbhEB7S9kO42YAfButSgh+Z4+hdb3dOWsmuk66UAATlOOfsL8k5hYGVs
 pmy9MdZMqeY6fn+5TCTN2//V/TJSS50caVaaw5dzKMlaCQbr4nVwS8TlFvCFpS0t4AXB0L
 yoUdXHWnIh2dqVzyzCBoVIV4dSmGjnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-K34yBXlpPgKKPwIkXhKHWQ-1; Tue, 03 Sep 2024 12:55:19 -0400
X-MC-Unique: K34yBXlpPgKKPwIkXhKHWQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5c25d413306so2002636a12.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725382518; x=1725987318;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TzGHsTPwbo7y9GvAFEd0eWxpbpA9qjgaCZBT9AhWJio=;
 b=BRTI4y+VuMPuHJ+5BRgjI4wMm4o9bbTZFCJEWD7njk77EucMN//05KFNe+470kgtHi
 shLUeMZ8CGE2c+ngqb3MHKDRGFMSRvSnFjb8nB7sJ8Kvc+SeF0S2qYDBQO7T7v8bzbVD
 5A9H9GF61YX9SbKCxMfuiJKiCzpUVfxzzHHxser+TNb3N6e2rQCK3CcvWgqx3WT7qdKN
 iWaJ90g0w/oFuXMf6+cg3Ag5HAIPI1bbX4zQwFT8sSw+EbtU2zt0+SJHFiWwSmDP/oVn
 nrolAQcM9lsU/9ZX5nYzLCg7XdZTY1sED2RBQ6j79dYwKmGntWUVK0S4xjVJWcVN8cJv
 U44A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtSj6JPpoqnf4lgx6nsWYrtiaV8UOLBK3D4GY6l6K4B2/sjTcQTyfJjQKZlQA99CwVbaaElWgdfQ==@nongnu.org
X-Gm-Message-State: AOJu0YxV+ViYf5JPFkzoQQVUSDPKgEKTJ9GGc3sQ3CB2pCO/sHj28G2d
 /JQLmFzpZ+kovKmRqQKKwitamG3UusJM5MQKnDwqhYq5PoqQirviWRoYKM3NyQ5/HOoHlLlXcGI
 EA+qCAPfUu1p4xtNFywhM1rjzFJeR2uJLTXDcB6VMgE7PsMMy/Q==
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id
 a640c23a62f3a-a89d878234bmr820436466b.23.1725382517905; 
 Tue, 03 Sep 2024 09:55:17 -0700 (PDT)
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id
 a640c23a62f3a-a89d878234bmr820432466b.23.1725382517235; 
 Tue, 03 Sep 2024 09:55:17 -0700 (PDT)
Received: from [192.168.10.3] ([151.95.101.29])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm707109066b.135.2024.09.03.09.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 09:55:16 -0700 (PDT)
Message-ID: <762867ba-8980-44f6-a9a6-5e766bc6a60b@redhat.com>
Date: Tue, 3 Sep 2024 18:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5GBy/zGK2xep

On 9/3/24 18:06, Peter Maydell wrote:
> This patchset removes the various Arm machines which we deprecated
> for the 9.0 release and are therefore allowed to remove for the 9.2
> release:
>   akita, borzoi, cheetah, connex, mainstone, n800, n810,
>   spitz, terrier, tosa, verdex, z2
> We get to drop over 30,000 lines of unmaintained code. So it's
> a big patchset but it's almost all deletions.
> 
> We have some command line options which were documented as only used
> by the pxa2xx LCD display driver: -portrait and -rotate.  These
> allowed the user to tell the display device to rotate its output by
> 90/180/270 degrees (and the ui input layer to correspondingly rotate
> mouse event coordinates to match).  I didn't realize these existed
> when we deprecated the pxa2xx machines -- do we need a separate
> deprecate-and-drop period to remove the command line options?  (If
> so, I can drop the relevant patch from this series.)

They are not specific to PXA; PXA LCD is the only one that supports 
passing it to the guest, but the logic is generic: if (for whatever 
reason) your VM generates output that is rotated, you can use the option 
to rotate mouse input.

It's okay to remove it without deprecation notice, but also to keep it. 
Your choice, it's not a lot of code.

Paolo

> The series includes removal of some code which while not strictly
> specific to these machines was in practice used only by them:
>   * the OneNAND flash memory device
>   * the PCMCIA subsystem
>   * the MUSB USB2.0 OTG USB controller chip (hcd-musb)
> 
> Removing these machines hopefully will make it easier to complete
> some API transitions (e.g.  there is only one caller of the
> ui/input-legacy.c function qemu_add_kbd_event_handler() left, and
> five of qemu_add_mouse_event_handler(); a lot of
> qemu_register_reset() calls have gone; and so on).
> 
> (There will be a trivial conflict with my reset patch that gets rid
> of direct setting of DeviceClass::reset in some places, but I'll fix
> that up when merging.)
> 
> thanks
> -- PMM
> 
> Peter Maydell (53):
>    hw/arm: Remove deprecated akita, borzoi, spitz, terrier, tosa boards
>    hw/input: Drop ADS7846 device
>    hw/adc: Remove MAX111X device
>    hw/gpio: Remove MAX7310 device
>    hw/ide: Remove DSCM-1XXXX microdrive device model
>    hw/display: Remove tc6393xb device
>    hw/arm/KConfig: Replace ZAURUS with ZAURUS_SCOOP
>    hw/arm: Remove 'cheetah' machine
>    hw/arm: Remove 'connex' and 'verdex' machines
>    hw/arm: Remove 'mainstone' machine
>    hw/misc: Remove MAINSTONE_FPGA device
>    hw/arm: Remove 'z2' machine
>    hw/arm: Remove STRONGARM->PXA2XX dependency
>    hw/timer/pxa2xx_timer: Remove use of pxa.h header
>    hw/arm: Remove pxa2xx.c
>    hw/sd: Remove pxa2xx_mmci.c
>    hw/input: Remove pxa2xx_keypad
>    hw/display: Remove pxa2xx_lcd.c
>    hw/dma: Remove pxa2xx_dma
>    hw/pcmcia: Remove pxa2xx pcmcia device
>    hw/arm: Remove pxa2xx_gpio
>    hw/arm: Remove pxa2xx_pic
>    hw/timer: Remove pxa27x-timer
>    vl.c: Remove pxa2xx-specific -portrait and -rotate options
>    hw/arm: Remove 'n800' and 'n810' machines
>    hw/misc: Remove cbus
>    hw/display: Remove Blizzard display device
>    hw/input: Remove tsc2005 touchscreen controller
>    hw/input: Remove tsc210x device
>    hw/rtc: Remove twl92230 device
>    hw/input: Remove lm832x device
>    hw/block: Remove OneNAND device
>    hw/usb: Remove tusb6010 USB controller
>    hw/usb: Remove MUSB USB host controller
>    hw: Remove PCMCIA subsystem
>    docs: Document removal of old Arm boards
>    hw/arm: Remove omap2.c
>    hw/gpio: Remove TYPE_OMAP2_GPIO
>    hw/char: Remove omap2_uart
>    hw/intc: Remove omap2-intc device
>    hw/sd: Remove omap2_mmc device
>    hw/misc: Remove omap_sdrc device
>    hw/misc: Remove omap_gpmc
>    hw/timer: Remove omap_gptimer
>    hw/timer: Remove omap_synctimer
>    hw/block: Remove ecc
>    hw/ssi: Remove omap_mcspi
>    hw/misc: Remove omap_tap device
>    hw/display: Remove omap_dss
>    hw/misc: Remove omap_l4 device
>    hw/misc/omap_clk: Remove OMAP2-specifics
>    hw/dma: Remove omap_dma4 device
>    hw: Remove omap2 specific defines and enums
> 
>   MAINTAINERS                             |   58 +-
>   docs/about/deprecated.rst               |   15 -
>   docs/about/removed-features.rst         |   15 +
>   docs/system/arm/gumstix.rst             |   21 -
>   docs/system/arm/mainstone.rst           |   25 -
>   docs/system/arm/nseries.rst             |   33 -
>   docs/system/arm/palm.rst                |   23 -
>   docs/system/arm/xscale.rst              |   35 -
>   docs/system/target-arm.rst              |    5 -
>   configs/devices/arm-softmmu/default.mak |    7 -
>   include/hw/adc/max111x.h                |   56 -
>   include/hw/arm/omap.h                   |  350 +--
>   include/hw/arm/pxa.h                    |  197 --
>   include/hw/block/flash.h                |   14 -
>   include/hw/display/blizzard.h           |   21 -
>   include/hw/display/tc6393xb.h           |   21 -
>   include/hw/input/lm832x.h               |   28 -
>   include/hw/input/tsc2xxx.h              |   41 -
>   include/hw/misc/cbus.h                  |   31 -
>   include/hw/pcmcia.h                     |   66 -
>   include/hw/usb/hcd-musb.h               |   49 -
>   include/sysemu/sysemu.h                 |    1 -
>   hw/adc/max111x.c                        |  236 --
>   hw/arm/gumstix.c                        |  141 --
>   hw/arm/mainstone.c                      |  175 --
>   hw/arm/nseries.c                        | 1473 ------------
>   hw/arm/omap2.c                          | 2715 -----------------------
>   hw/arm/palm.c                           |  324 ---
>   hw/arm/pxa2xx.c                         | 2393 --------------------
>   hw/arm/pxa2xx_gpio.c                    |  365 ---
>   hw/arm/pxa2xx_pic.c                     |  359 ---
>   hw/arm/spitz.c                          | 1284 -----------
>   hw/arm/tosa.c                           |  327 ---
>   hw/arm/z2.c                             |  355 ---
>   hw/block/ecc.c                          |   91 -
>   hw/block/onenand.c                      |  872 --------
>   hw/char/omap_uart.c                     |  113 -
>   hw/display/blizzard.c                   | 1026 ---------
>   hw/display/omap_dss.c                   | 1093 ---------
>   hw/display/pxa2xx_lcd.c                 | 1451 ------------
>   hw/display/tc6393xb.c                   |  568 -----
>   hw/dma/omap_dma.c                       |  451 +---
>   hw/dma/pxa2xx_dma.c                     |  591 -----
>   hw/gpio/max7310.c                       |  217 --
>   hw/gpio/omap_gpio.c                     |  557 -----
>   hw/ide/microdrive.c                     |  644 ------
>   hw/input/ads7846.c                      |  186 --
>   hw/input/lm832x.c                       |  528 -----
>   hw/input/pxa2xx_keypad.c                |  331 ---
>   hw/input/tsc2005.c                      |  571 -----
>   hw/input/tsc210x.c                      | 1241 -----------
>   hw/intc/omap_intc.c                     |  276 ---
>   hw/misc/cbus.c                          |  619 ------
>   hw/misc/mst_fpga.c                      |  269 ---
>   hw/misc/omap_clk.c                      |  527 +----
>   hw/misc/omap_gpmc.c                     |  898 --------
>   hw/misc/omap_l4.c                       |  162 --
>   hw/misc/omap_sdrc.c                     |  167 --
>   hw/misc/omap_tap.c                      |  117 -
>   hw/pcmcia/pcmcia.c                      |   24 -
>   hw/pcmcia/pxa2xx.c                      |  248 ---
>   hw/rtc/twl92230.c                       |  882 --------
>   hw/sd/omap_mmc.c                        |   63 -
>   hw/sd/pxa2xx_mmci.c                     |  594 -----
>   hw/ssi/omap_spi.c                       |  380 ----
>   hw/timer/omap_gptimer.c                 |  512 -----
>   hw/timer/omap_synctimer.c               |  110 -
>   hw/timer/pxa2xx_timer.c                 |   25 -
>   hw/usb/hcd-musb.c                       | 1553 -------------
>   hw/usb/tusb6010.c                       |  850 -------
>   system/globals.c                        |    1 -
>   system/vl.c                             |   11 -
>   ui/input.c                              |   36 -
>   hw/Kconfig                              |    1 -
>   hw/adc/Kconfig                          |    3 -
>   hw/adc/meson.build                      |    1 -
>   hw/arm/Kconfig                          |   90 +-
>   hw/arm/meson.build                      |    9 -
>   hw/block/Kconfig                        |    6 -
>   hw/block/meson.build                    |    2 -
>   hw/display/Kconfig                      |    3 -
>   hw/display/meson.build                  |    4 -
>   hw/dma/meson.build                      |    1 -
>   hw/gpio/Kconfig                         |    7 +-
>   hw/gpio/meson.build                     |    3 +-
>   hw/ide/Kconfig                          |    6 -
>   hw/ide/meson.build                      |    1 -
>   hw/input/Kconfig                        |   13 -
>   hw/input/meson.build                    |    5 -
>   hw/input/trace-events                   |    3 -
>   hw/meson.build                          |    1 -
>   hw/misc/Kconfig                         |    1 -
>   hw/misc/meson.build                     |    6 -
>   hw/pcmcia/Kconfig                       |    2 -
>   hw/pcmcia/meson.build                   |    2 -
>   hw/rtc/Kconfig                          |    4 -
>   hw/rtc/meson.build                      |    1 -
>   hw/sd/meson.build                       |    1 -
>   hw/sd/trace-events                      |    4 -
>   hw/ssi/meson.build                      |    1 -
>   hw/timer/Kconfig                        |    3 +
>   hw/timer/meson.build                    |    4 +-
>   hw/usb/Kconfig                          |    8 -
>   hw/usb/meson.build                      |    2 -
>   qemu-options.hx                         |   16 -
>   tests/avocado/machine_arm_n8x0.py       |   49 -
>   106 files changed, 39 insertions(+), 30338 deletions(-)
>   delete mode 100644 docs/system/arm/gumstix.rst
>   delete mode 100644 docs/system/arm/mainstone.rst
>   delete mode 100644 docs/system/arm/nseries.rst
>   delete mode 100644 docs/system/arm/palm.rst
>   delete mode 100644 docs/system/arm/xscale.rst
>   delete mode 100644 include/hw/adc/max111x.h
>   delete mode 100644 include/hw/arm/pxa.h
>   delete mode 100644 include/hw/display/blizzard.h
>   delete mode 100644 include/hw/display/tc6393xb.h
>   delete mode 100644 include/hw/input/lm832x.h
>   delete mode 100644 include/hw/input/tsc2xxx.h
>   delete mode 100644 include/hw/misc/cbus.h
>   delete mode 100644 include/hw/pcmcia.h
>   delete mode 100644 include/hw/usb/hcd-musb.h
>   delete mode 100644 hw/adc/max111x.c
>   delete mode 100644 hw/arm/gumstix.c
>   delete mode 100644 hw/arm/mainstone.c
>   delete mode 100644 hw/arm/nseries.c
>   delete mode 100644 hw/arm/omap2.c
>   delete mode 100644 hw/arm/palm.c
>   delete mode 100644 hw/arm/pxa2xx.c
>   delete mode 100644 hw/arm/pxa2xx_gpio.c
>   delete mode 100644 hw/arm/pxa2xx_pic.c
>   delete mode 100644 hw/arm/spitz.c
>   delete mode 100644 hw/arm/tosa.c
>   delete mode 100644 hw/arm/z2.c
>   delete mode 100644 hw/block/ecc.c
>   delete mode 100644 hw/block/onenand.c
>   delete mode 100644 hw/display/blizzard.c
>   delete mode 100644 hw/display/omap_dss.c
>   delete mode 100644 hw/display/pxa2xx_lcd.c
>   delete mode 100644 hw/display/tc6393xb.c
>   delete mode 100644 hw/dma/pxa2xx_dma.c
>   delete mode 100644 hw/gpio/max7310.c
>   delete mode 100644 hw/ide/microdrive.c
>   delete mode 100644 hw/input/ads7846.c
>   delete mode 100644 hw/input/lm832x.c
>   delete mode 100644 hw/input/pxa2xx_keypad.c
>   delete mode 100644 hw/input/tsc2005.c
>   delete mode 100644 hw/input/tsc210x.c
>   delete mode 100644 hw/misc/cbus.c
>   delete mode 100644 hw/misc/mst_fpga.c
>   delete mode 100644 hw/misc/omap_gpmc.c
>   delete mode 100644 hw/misc/omap_l4.c
>   delete mode 100644 hw/misc/omap_sdrc.c
>   delete mode 100644 hw/misc/omap_tap.c
>   delete mode 100644 hw/pcmcia/pcmcia.c
>   delete mode 100644 hw/pcmcia/pxa2xx.c
>   delete mode 100644 hw/rtc/twl92230.c
>   delete mode 100644 hw/sd/pxa2xx_mmci.c
>   delete mode 100644 hw/ssi/omap_spi.c
>   delete mode 100644 hw/timer/omap_gptimer.c
>   delete mode 100644 hw/timer/omap_synctimer.c
>   delete mode 100644 hw/usb/hcd-musb.c
>   delete mode 100644 hw/usb/tusb6010.c
>   delete mode 100644 hw/pcmcia/Kconfig
>   delete mode 100644 hw/pcmcia/meson.build
>   delete mode 100644 tests/avocado/machine_arm_n8x0.py
> 

