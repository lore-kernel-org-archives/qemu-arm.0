Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4493519wrp;
        Mon, 16 Sep 2019 14:31:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/OWvwHiGSj+/thtk2Z5w9P9ZtIHlXsc1AIP8uAsCxXEseLKF+xa/ZgtCMyN+Hr4xiIJMp
X-Received: by 2002:a0c:9e20:: with SMTP id p32mr387864qve.39.1568669506321;
        Mon, 16 Sep 2019 14:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568669506; cv=none;
        d=google.com; s=arc-20160816;
        b=n3KHY4h8JjN2/p84q7aagVmmgX/kFmVJW16Kil9x6SL7hcyTYfeo4VnI3PrGGPLnsQ
         VXMzRJdcVltwVnAFpJsGH90JiSusf3Wzi74qSE9RAUtm+OT0w79pZnKJA4BeFvfly3ug
         3Qh3jXg60BUnFvdyRcgUojE7iX60ZVp9EwVO8vo2gFnBlmaeZYNXtvNOLe5KKnmN8pHP
         Uov9ItSIeVQVyosJhOh9pY1U/2oNxP+ZxoWhSiGonhsgaFnNFCrbKMC/2/bbn4jA+kN9
         3Z/D9yh1NetO4YnM4cLM2ee9i+Rzb3pzDUXBVfXfAs3x4vxOR05GXMswwXL1iSUgk2lT
         wlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=dzOo5iF+PS67mIaAS7E3oa6CGJDLcuVs/L7NlmeUK4k=;
        b=RZQhDgpkCzfuGi6LkHQ/nPpOWss1YqXTltf0RsgFZvn62nZaZb8qRJ/c4cMIYnq6o0
         q9WkUut7flzWLrS8/GJpqUgpRyJ9Yb60iCwByMBikLhoupH1h2rwRb1Q3DvOdAwQfaLR
         yne1E/QzmtsTnOsazmzyXG12l38OqeQ168uUolM2jOTb630rjMkwC5PUtmf2P6qtQnx4
         gmVOg4UzFK+JE4VPwrbe3beUzZP4p75iXLZdDxl+E+GCJ+v7VBYpvqNfuKjWNEXPAWTh
         lUqV/w6hUYSnIwQrHP8I7yAKUKMFeaa1mMSnWk+yoTNnAQm5wIgdWHlsMx3X+6pRARb5
         GosQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hp9nU3d4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h54si187563qte.393.2019.09.16.14.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 14:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hp9nU3d4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9yb3-0001vr-8p
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 17:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9yae-0001uc-9o
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9yac-0004wQ-Ad
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:31:20 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yaY-0004tD-Pb; Mon, 16 Sep 2019 17:31:15 -0400
Received: by mail-lj1-x244.google.com with SMTP id v24so1384871ljj.3;
 Mon, 16 Sep 2019 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dzOo5iF+PS67mIaAS7E3oa6CGJDLcuVs/L7NlmeUK4k=;
 b=Hp9nU3d4+NgnzQXJ4UOaeiwSzsF/MpVPMAvgZ1OZuPguwe37hLVtpyXm8s6kOGjCYn
 K+t/dpNr6bPaMZTXb3B8Hjh23ibVC4QKKGG0lBAy3Y5enWnYDMx5a3sFOGGF6wmv0Xom
 G6l6vX0C/e14fGIJTXcoYs+qkbLuWOQAgme8qFLd6WCpcgWWpvy95X17vRi7AqxjCKWn
 hkGUg4hg9p6DEQYFOW97tEgG22U9+JLvXnAaJn9N92a87h6dYC0Z004RbSBI5QR6DHGR
 Lp2NydbJZ3bqq+iedNaowoi5iv68aIS/NVRrnVHvhJ1nzG5VDl9qvVX0H2gVP4e1VOu3
 vK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dzOo5iF+PS67mIaAS7E3oa6CGJDLcuVs/L7NlmeUK4k=;
 b=CrhoAKm9WgAH93MLE0WNLyWH+F07GUIuTg/BmjxthlgXZBSEC68oji066M+Q8XO+9q
 ncXw6isDVv+YngGQk/8Px1mTVvR10eBWryynbMtdW3ACgUHKiRR2STzWdPBs2P38LM6S
 JxT/Mod91w0wSTpxgijT3F/KvIdkkDzevlSsVlcT4uRdutSv0hmthWz8tf+borXtOo+6
 oPDt/tiGhHh8ONNzyhQiGexrBr4yz2hvtlUMU+4zeRmZzNYkJgZ8LS7A36usj1KmpHrU
 OZHNziaLBDjzE8+uj6qv5MZS24flinMWOmfZTGhzlWUfeV8y0D+ofeuUhxYALLYERzUw
 5IGA==
X-Gm-Message-State: APjAAAW7/Ix5xqPBPbHcDHy7To1zaJITgBEAvsN54979C3YPMR9MdTam
 8RQY9AFPkIGWH56oJYUvfPxOnvQnJEaerHYM5wU=
X-Received: by 2002:a2e:3902:: with SMTP id g2mr9956lja.196.1568669473416;
 Mon, 16 Sep 2019 14:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-6-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:26:42 -0700
Message-ID: <CAKmqyKMh1OMYH5Vy52imhM+Tn0FBrf2FC2otfVH8PV9yScomrQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/13] hw: Move M41T80 device
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
X-TUID: FdDube53YfyU

On Mon, Sep 16, 2019 at 9:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The M41T80 is a Real Time Clock, not a timer.
> Move it under the hw/rtc/ subdirectory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                | 2 +-
>  hw/rtc/Kconfig             | 4 ++++
>  hw/rtc/Makefile.objs       | 1 +
>  hw/{timer =3D> rtc}/m41t80.c | 0
>  hw/timer/Kconfig           | 4 ----
>  hw/timer/Makefile.objs     | 1 -
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  rename hw/{timer =3D> rtc}/m41t80.c (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 679b026fe0..fd68b2383a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1113,7 +1113,7 @@ F: hw/ppc/sam460ex.c
>  F: hw/ppc/ppc440_pcix.c
>  F: hw/display/sm501*
>  F: hw/ide/sii3112.c
> -F: hw/timer/m41t80.c
> +F: hw/rtc/m41t80.c
>  F: pc-bios/canyonlands.dt[sb]
>  F: pc-bios/u-boot-sam460ex-20100605.bin
>  F: roms/u-boot-sam460ex
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index 159c233517..434b20b2b1 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -1,3 +1,7 @@
> +config M41T80
> +    bool
> +    depends on I2C
> +
>  config M48T59
>      bool
>
> diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
> index c87f81405e..89e8e48c64 100644
> --- a/hw/rtc/Makefile.objs
> +++ b/hw/rtc/Makefile.objs
> @@ -1,3 +1,4 @@
> +common-obj-$(CONFIG_M41T80) +=3D m41t80.o
>  common-obj-$(CONFIG_M48T59) +=3D m48t59.o
>  ifeq ($(CONFIG_ISA_BUS),y)
>  common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
> diff --git a/hw/timer/m41t80.c b/hw/rtc/m41t80.c
> similarity index 100%
> rename from hw/timer/m41t80.c
> rename to hw/rtc/m41t80.c
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index a57e9b59fc..a6b668b255 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -20,10 +20,6 @@ config HPET
>  config I8254
>      bool
>
> -config M41T80
> -    bool
> -    depends on I2C
> -
>  config TWL92230
>      bool
>      depends on I2C
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index fe2d1fbc40..2fb12162a6 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -6,7 +6,6 @@ common-obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
>  common-obj-$(CONFIG_DS1338) +=3D ds1338.o
>  common-obj-$(CONFIG_HPET) +=3D hpet.o
>  common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
> -common-obj-$(CONFIG_M41T80) +=3D m41t80.o
>  common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
>  common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
>  common-obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
> --
> 2.20.1
>
>
