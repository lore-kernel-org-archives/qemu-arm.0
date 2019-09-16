Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4503525wrp;
        Mon, 16 Sep 2019 14:44:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynYReZgWUxXrP7WVlV9meXoAmtt5vnpddDQ3L7Y7t1EWL8AnINR3VtHF8C6DjBTfG+zZ+C
X-Received: by 2002:a37:9b48:: with SMTP id d69mr511650qke.390.1568670269323;
        Mon, 16 Sep 2019 14:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568670269; cv=none;
        d=google.com; s=arc-20160816;
        b=cyrInp0WIgvhPkvt1cDX1X71EfZPeFzX0tMRNArYK6z/PMrtCLhKXdXGfmrmuWSdQu
         7/XqoN5E0Ly5u2chS110oT4bu2NEJzFhFTl1in2cjXpPZTIgQB7Q7TS+7FOwF5sg6sOe
         9xzOTKeEPlouBmBaBMTFwtmGA+C+Invq09shWxmF3xenAGMVak8XdhhIAV5DMW/Gkh8Z
         5gfJejq4Zxsd4btT2PqcrESlFgegUhUJlgH5hcyJLjbm7WfPiQSLys33LPONpkeUIWlG
         AKkEZQjbe3Svs2GCWkOoWLWRqdwY4T0MQQO5jvaQ9I2bbrrq7VyDrG8bpZa4Fo4RI7HY
         VVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ydq/wOLNsVLu6DqAx1bi9sX41tAUm839UCibkHYqB+U=;
        b=mVoQzdUuxQ785uMjbOF6AKgfR6Cr1mwge6Hni71WnSEi5VvDaqsCfR/unPmftLwxaI
         v9+43dSkK3IVGmCvVFqVdwPScIHbgcCCjWQ0eNeXgKRjhcPLIo/BRJ45vEyAM6yCtf+3
         3Qg2zz7wx9drL/vFIax6CURz+MFUnNMHPPeQ5RzXU/Vs5UfevJ1yh37auS0YOAEDqu5L
         3jwBotNQ4o0XtKgB7EW0vVs8PutvBDJPZQNwgA5dHNlm32cwQlSTBTsJC61RaIzYysJh
         SeBNMTVHR5RhTm9jpVfgonAiSDohLwuUz2l7U20aVg/kM9Hb3t8FI1AArW7TpinqVooi
         rLdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AuaFVrBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si169834qvh.194.2019.09.16.14.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 14:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AuaFVrBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9ynM-0000FD-HT
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 17:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9ynC-0000Ck-2q
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9ynA-0001do-Eq
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:44:17 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:37115)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yn6-0001cQ-TU; Mon, 16 Sep 2019 17:44:13 -0400
Received: by mail-lf1-x141.google.com with SMTP id w67so1165014lff.4;
 Mon, 16 Sep 2019 14:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ydq/wOLNsVLu6DqAx1bi9sX41tAUm839UCibkHYqB+U=;
 b=AuaFVrBMa7k8XWhGI3mpm4hMbxzh2Qw/K46Y1nrbWP95OahsDwZGczNg+adQA9m2dg
 RaGNn6Sc9jXUXRkoC2LTjDOQQ85hrFe4UXlWFBU8Q/jdhtxQgkXK5+TXtz0lFdDzLwkj
 5IEy515UP4hRxxFaB8RYf4AwgwfOOZJpgQl7wXe71j3sMQ+pc3eiDXdXZf8zpqsN3Fpe
 h31gKdgzWSHNvdAc29eKWhEwRDu1aSjFONfBwGGF/vj91SxHdrqCJLEta7Y0QsBjMIBg
 Cs+Lc23a0oRxBfLjlf2hamsZqExJFotXnOIJW8kxiVJYwmnsO+IxQ3CWRRt8p0N9hmkv
 +JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ydq/wOLNsVLu6DqAx1bi9sX41tAUm839UCibkHYqB+U=;
 b=fcdeY3WlOmn9TbTMyIJ6/hdLjCp4N89FezUGoHIckhzk97+dHaM73G+eH8nTR3ux2Z
 Ox+gU9K/MIW4jxS20hUiWM/oTzKWahEYFETMo1ufHoQQ+jHCsvqefYX+XhobM+Moda7h
 O8unOXjuQm2obMzK+i4Vn0KdJiryf4Y27SukfoiB8k/y06yeKEHpqGDgcLaYlUvq8OIH
 ArJwI5duOSObpoYSBvvAEtaHJxOvSr4+iZAxYmM376JPzfBSw1WUoXo3ouxog9AYOwTw
 6ypXncenoQU9VB0xeVfDQvuYrkptpgT8J8TrDAtsVPt8yCR5SyrsrufaldXG4WYamBq3
 PaVA==
X-Gm-Message-State: APjAAAVyQqp4iaYPP7Kmz5SgRFJpX+M2RLKFkPhvY49Vofjv2YKgkis6
 6BLVSdDRr5/syXGt3/74S815oDzmuSKqVEgboYM=
X-Received: by 2002:ac2:51cd:: with SMTP id u13mr161547lfm.135.1568670251059; 
 Mon, 16 Sep 2019 14:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-8-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:39:40 -0700
Message-ID: <CAKmqyKNM5AkkdS6MHtyRqdN16cyiN2abG5DDfJY48OnJAGE5OA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/13] hw: Move TWL92230 device
 from hw/timer/ to hw/rtc/ subdirectory
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R4bgrbsTGNIu

On Mon, Sep 16, 2019 at 9:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The TWL92230 is an "energy management device" companion with
> a RTC. Since we mostly model the RTC, move it under the hw/rtc/
> subdirectory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                  | 2 +-
>  hw/rtc/Kconfig               | 4 ++++
>  hw/rtc/Makefile.objs         | 1 +
>  hw/{timer =3D> rtc}/twl92230.c | 0
>  hw/timer/Kconfig             | 4 ----
>  hw/timer/Makefile.objs       | 1 -
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  rename hw/{timer =3D> rtc}/twl92230.c (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb9a1ed075..d17058264b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -663,7 +663,7 @@ F: hw/display/blizzard.c
>  F: hw/input/lm832x.c
>  F: hw/input/tsc2005.c
>  F: hw/misc/cbus.c
> -F: hw/timer/twl92230.c
> +F: hw/rtc/twl92230.c
>  F: include/hw/display/blizzard.h
>  F: include/hw/input/tsc2xxx.h
>  F: include/hw/misc/cbus.h
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index cc7fead764..dff9d60946 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -8,6 +8,10 @@ config M48T59
>  config PL031
>      bool
>
> +config TWL92230
> +    bool
> +    depends on I2C
> +
>  config MC146818RTC
>      bool
>
> diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
> index 4621b37bc2..810a38ee7b 100644
> --- a/hw/rtc/Makefile.objs
> +++ b/hw/rtc/Makefile.objs
> @@ -4,5 +4,6 @@ ifeq ($(CONFIG_ISA_BUS),y)
>  common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
>  endif
>  common-obj-$(CONFIG_PL031) +=3D pl031.o
> +common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
>  obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
>  common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
> diff --git a/hw/timer/twl92230.c b/hw/rtc/twl92230.c
> similarity index 100%
> rename from hw/timer/twl92230.c
> rename to hw/rtc/twl92230.c
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index b04c928136..9357875f28 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -20,10 +20,6 @@ config HPET
>  config I8254
>      bool
>
> -config TWL92230
> -    bool
> -    depends on I2C
> -
>  config ALTERA_TIMER
>      bool
>      select PTIMER
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 034bd30255..23be70b71d 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -7,7 +7,6 @@ common-obj-$(CONFIG_DS1338) +=3D ds1338.o
>  common-obj-$(CONFIG_HPET) +=3D hpet.o
>  common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
>  common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
> -common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
>  common-obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
>  common-obj-$(CONFIG_SLAVIO) +=3D slavio_timer.o
>  common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_timer.o
> --
> 2.20.1
>
>
