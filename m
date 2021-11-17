Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1211253lfk;
        Wed, 17 Nov 2021 11:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsVTtmCwG4ePm0bSNA/DzaJ2iPx55UWw7wJFTEV4eXkczQ+meSbRh8uhayBWykossvEd/z
X-Received: by 2002:ac5:cdfa:: with SMTP id v26mr92944540vkn.12.1637178369311;
        Wed, 17 Nov 2021 11:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637178369; cv=none;
        d=google.com; s=arc-20160816;
        b=C+NlKjBHp0OQCqKO7VVerMbOYfeganDkU5GQoY0yoKNTmljIT5DLEPZVt+RakL7LiA
         Dn+U6Y+2uydYayOeEoqLDblJWJNYXNJqw9z/h5H2RiWvr4V+l7+98S4N5JiglKG9wjmQ
         cjkjJ23VHUUpwMv8ndzbdEEqPH3NsCosOVnIOjziZfOvJcNArkuTwJH4UP6eVJvXgQzu
         kJESgWjGlUeD1sb4sfdwjaxZf6F7+PRghSDooMqUpN9bWeHiOTTEHgzAYRcDZp4/E/RS
         NFoIl2Ub8zSFTyNNqCuZudFTEZfCYgHHPlZItPDz/6rMQqinf9Hzqs0pxDwbYrv1Lr+9
         YqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4eFPrPtK65vZsTz3tzd39EIfmfxT6Ag0N8Oz3HpTPmE=;
        b=0SEcEIWnsvqE1BLVET8UQl51OM/+kcTsNQ6bvhzsiVmuV/HGnkRwnMr1/MMHyoTBYm
         0w+kG4SdHQX1eynVjBh1qJ8IyXXf9Rk8nbALxvzE59jaTnI6H0UJ8hloNh/7CXTBXq8S
         K6zeg2pgAqNTezwFZKBNM7xhB2IqR4A8aRi2UcU1aAoERmNGvZegntkyo3vGTOeF+p3P
         8u/6QIhfz5KFcob2NIeuvMjRoEUipQqdUfvurj/KgEbQnwA1aoGrDqSzZeYW8+SsspAw
         w1650skXTrIbsK5Agb8BVvELiBCIhht/VuaDfbTonWuZu71LM37XAtHdUB0/QxfBIs/D
         r0uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=T6fvcFlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si1236030vsh.270.2021.11.17.11.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 11:46:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=T6fvcFlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnQsi-0003GG-Ks
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 14:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnQs0-0003Et-SY; Wed, 17 Nov 2021 14:45:26 -0500
Received: from [2a00:1450:4864:20::42a] (port=46989
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnQrv-0000ap-RH; Wed, 17 Nov 2021 14:45:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so6804354wru.13;
 Wed, 17 Nov 2021 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4eFPrPtK65vZsTz3tzd39EIfmfxT6Ag0N8Oz3HpTPmE=;
 b=T6fvcFlfHH6tNxeNaxODATJLdEv3KMeiqya3PHCMeMYDEEg9e/v4t5AgpFrSvad47k
 ve1Uwu2PQ6wRXS1tdohF+5LKnSEQNGrGXcocVSjrHzsSOXcjKUGKouDYj+UAhtVrfHX6
 rM+CFrwtGWYxf/aoEzreppB/MgP6NwBbKlqmuTWbNoZ/g2w4J8lpBD7o1fIcVjkqdgfz
 jKniRtqqdg6F3xyC7mOxBkCBIgPZAa/sn0Ng6CEkkrgFVe1SAz9dpxCAvCs2QHy6yOyU
 93cd6v0xPUa6NbcPOQaa/mmnXW6zTLCpzPdOSlkcFj/EgFRCgYbHxSQjTDGO78EYl8JG
 r46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4eFPrPtK65vZsTz3tzd39EIfmfxT6Ag0N8Oz3HpTPmE=;
 b=Hnvy7URdRTHLWWKMx6EEePu0kQTMlttzTkOHi3zWMcXfOI8Fmoher+0NfUdd/or7nm
 JFjuxpJjsBIC0ihSeYV4U5Omrjtnsu7kmmAq0YmQKWUU/0kBGsHjHxJhOmG6o38Kw9IH
 txo+BmWxDq68AuJNwt6MMZXv+EE+7muE6UYlQWncUPwwqhffLQmwE+iI7tT89wDOIA+y
 Jp8vsQQtPxvrOO72DHBVHWWrDnbI8U1kSGYAQdgp/Wz7wSwEEudftVXud2wyyplYnd/k
 7j8TXVU1gUGUgbj3YnwYVBN+iD5XgyfWgP/sQ5mdyObQLHNhb0y7JRAZ+Vh9hEWTKbEb
 OvJg==
X-Gm-Message-State: AOAM532/OryER7ED3eDud5xmFJt9i1EqQilnVzUPWOlWS521kwfup1Oa
 Avne84lB4WTsp0D1PxkLvNk=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr23254239wri.376.1637178316802; 
 Wed, 17 Nov 2021 11:45:16 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x13sm880056wrr.47.2021.11.17.11.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 11:45:16 -0800 (PST)
Message-ID: <575fcf95-f4f0-3d88-ab08-b4d21f2da354@amsat.org>
Date: Wed, 17 Nov 2021 20:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 01/13] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211117163409.3587705-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SIwf/pPhQoo

Hi Markus, Peter,

On 11/17/21 17:33, Markus Armbruster wrote:
> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
> and marked FIXME.
> 
> Move it to the boards that create these devices.  Prior art: commit
> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
> device "pl181".
> 
> The device remains not user-creatable, because its users should (and
> do) wire up its GPIO chip-select line.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/stellaris.c  | 15 ++++++++++++++-
>  hw/riscv/sifive_u.c | 13 ++++++++++++-
>  hw/sd/ssi-sd.c      | 29 +----------------------------
>  3 files changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 78827ace6b..b6c8a5d609 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> +#include "hw/sd/sd.h"
>  #include "hw/ssi/ssi.h"
>  #include "hw/arm/boot.h"
>  #include "qemu/timer.h"
> @@ -1157,6 +1158,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>              void *bus;
>              DeviceState *sddev;
>              DeviceState *ssddev;
> +            DriveInfo *dinfo;
> +            DeviceState *carddev;
> +            BlockBackend *blk;
>  
>              /*
>               * Some boards have both an OLED controller and SD card connected to
> @@ -1221,8 +1225,17 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>               *  - Make the ssd0323 OLED controller chipselect active-low
>               */
>              bus = qdev_get_child_bus(dev, "ssi");
> -
>              sddev = ssi_create_peripheral(bus, "ssi-sd");
> +
> +            dinfo = drive_get(IF_SD, 0, 0);
> +            blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> +            carddev = qdev_new(TYPE_SD_CARD);
> +            qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);

I guess a already asked this once but don't remember now... What is the
point of creating a SD card without drive? Is this due to the old design
issue we hotplug the drive to the SD card and not the SD card on the SD
bus?

> +            qdev_prop_set_bit(carddev, "spi", true);
> +            qdev_realize_and_unref(carddev,
> +                                   qdev_get_child_bus(sddev, "sd-bus"),
> +                                   &error_fatal);
> +
