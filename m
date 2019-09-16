Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4506307wrp;
        Mon, 16 Sep 2019 14:48:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzce2cS/OZNY218xs8TcTROi54q10KgQO/tGksHdDSnsXfRHlMUqoiUeX/hrw6+jfrRjxAP
X-Received: by 2002:a17:906:6c7:: with SMTP id v7mr2027694ejb.27.1568670480770;
        Mon, 16 Sep 2019 14:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568670480; cv=none;
        d=google.com; s=arc-20160816;
        b=RfC2TKitcYEBmuY0C3BPS4fxFaIG0AlG8QhQD5NAdvCOqXLGKhDEg6SMiuYzDyv99w
         a8y8Eiib0jxW8uuTql76zYBaDYTiSME3F7ICecIbgR5DCFNPk9ZResBurxyQaBIh8Rad
         Yv8o6WTbHUiVCfb4dXye9TNV0Hj2mJ29Uke5ZpHvJIppPQlGiHgec6eAP2SgAV/F+oRC
         nCA3qX6BnMjERUNLChUqGE57RAXZbXPsEJemuPeltaESyGAUsaMX0ZyHHR1AnHGjHWQp
         TiAggPtoFqPsiqw+b954Q8elLxGBxQ+uRca+iSV82QTmAEA/X5HlojuR8FlBX8xRsbNl
         GyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=d6KsQJZ4uOyC2kdk7MqSRWQlWcAq1Lv8qHXSBMW/b9Q=;
        b=M7qrIWrqboHPq9UYPewXQnO/aQCvtlyKLcpXCoqh4szO9o5PDmeMCbjNAxzcQ+NS4H
         Kyy9sQ8BmmjEpP9aHlPoIdoQmEAu7xOI6Wgz4FMTgRb5ZlPCI5+qqEjtF6eD461KYbQD
         alfFV0kpVz2l6SovC5zYIPL4vb7Cfb/5bMF5mcChFRGFyuj9S950RIWWLl4skDIHmNcx
         +nEDZGtr7wj0IdpOdiM+5ivUc+Y4cK3xanYPwgpP4HgcVRyoqyNqz0Kw9XC/jntBxXtt
         kEbLZmzQfPG96UFMgujN1JzaQOYzw4wKdhxN901Y6jDNgwpUbVH24vfeTFjWk+u6dhLg
         J1hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ItSHY9nO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb1si105247ejb.112.2019.09.16.14.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 14:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ItSHY9nO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9yql-0001gm-1j
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 17:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9yqY-0001eD-D6
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9yqX-0002ix-9W
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:47:46 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yqU-0002gQ-VG; Mon, 16 Sep 2019 17:47:43 -0400
Received: by mail-lf1-x143.google.com with SMTP id r2so1141389lfn.8;
 Mon, 16 Sep 2019 14:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d6KsQJZ4uOyC2kdk7MqSRWQlWcAq1Lv8qHXSBMW/b9Q=;
 b=ItSHY9nOzTCzVMLRr4d2oWSz6AoLhREAUiG8wFWG/VNkS8A+COXukZvpLFtWXv9mgZ
 oWMfGQrjiLS4dC6ZuwWXClpywoEesNvYH32NBUAePfWCE0ShEVPI//yZk6ZSGaE9EjcC
 784pA+OPRnOOhXqSmX6w8NsH2Qhh+WfwcB+wI5ZHJR5DzqudQegwLIq7wMQTfVm7nSAB
 z4pqlwmpVvTYs7eMJBvku+Nx8D34yylijFqYWXVV3FYivtq/t3UOqnhV7EraQaLWxnBd
 ZDVSysaR1uTyi6U12Zv8ofU0yG/bm+dqWeTKxnhMqENATy8Gh3Gs/Wx/A4DLT1xGyjJt
 Lbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d6KsQJZ4uOyC2kdk7MqSRWQlWcAq1Lv8qHXSBMW/b9Q=;
 b=g6vsZKYyCP7w9q5ZycPUKqeGM0oPiIdVZ4r9MJ7NsxJEbgi72Hn62h4TutW9YgjoP+
 m9m0luWaS2HO0xvTh1ReN1APUmQmb9bkabIxx/yq1nHxJG8/2wzhea0af3UdeMOQHPg1
 RBPwIxHWZFbSwtzgoa6Yh9dbezyk+ieMaUlZJ+oYe+RnriZy0Mka7Z/D/bqF3HMBkyZD
 K3yDL4A6ZEJysz2ni02KqMULHADR72xjfez/KBu1AIZq+FDOQcTxbroK4JI81Ae9iMRh
 +IVCw7jYi15sPfvfGzYA2oSXsj9wD7WHeWOikO9/VgJOaMBNC27cftRVzlBecd11kwLG
 VH5A==
X-Gm-Message-State: APjAAAWH/GqJaCAzDan9tGV6bsxvEWl6r1AM/fwFvw1Hqfv8Q3VED1+v
 SN1wt3cusD1g8qnjy9VIa8/kg+KFb1XVmQpZXts=
X-Received: by 2002:ac2:4a69:: with SMTP id q9mr176281lfp.86.1568670461772;
 Mon, 16 Sep 2019 14:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-9-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-9-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:43:10 -0700
Message-ID: <CAKmqyKOFCbNyOvrm2Y4UuB9X96dGO5NEz1=yZju0kqhJ-j_vOA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/13] hw: Move DS1338 device
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
X-TUID: xSJvVf3v4Haw

On Mon, Sep 16, 2019 at 9:39 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The DS1338 is a Real Time Clock, not a timer.
> Move it under the hw/rtc/ subdirectory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/rtc/Kconfig             | 4 ++++
>  hw/rtc/Makefile.objs       | 1 +
>  hw/{timer =3D> rtc}/ds1338.c | 0
>  hw/timer/Kconfig           | 4 ----
>  hw/timer/Makefile.objs     | 1 -
>  5 files changed, 5 insertions(+), 5 deletions(-)
>  rename hw/{timer =3D> rtc}/ds1338.c (100%)
>
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index dff9d60946..45daa8d655 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -1,3 +1,7 @@
> +config DS1338
> +    bool
> +    depends on I2C
> +
>  config M41T80
>      bool
>      depends on I2C
> diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
> index 810a38ee7b..b195863291 100644
> --- a/hw/rtc/Makefile.objs
> +++ b/hw/rtc/Makefile.objs
> @@ -1,3 +1,4 @@
> +common-obj-$(CONFIG_DS1338) +=3D ds1338.o
>  common-obj-$(CONFIG_M41T80) +=3D m41t80.o
>  common-obj-$(CONFIG_M48T59) +=3D m48t59.o
>  ifeq ($(CONFIG_ISA_BUS),y)
> diff --git a/hw/timer/ds1338.c b/hw/rtc/ds1338.c
> similarity index 100%
> rename from hw/timer/ds1338.c
> rename to hw/rtc/ds1338.c
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 9357875f28..a990f9fe35 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -9,10 +9,6 @@ config ARM_MPTIMER
>  config A9_GTIMER
>      bool
>
> -config DS1338
> -    bool
> -    depends on I2C
> -
>  config HPET
>      bool
>      default y if PC
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 23be70b71d..70b61b69c7 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -3,7 +3,6 @@ common-obj-$(CONFIG_ARM_MPTIMER) +=3D arm_mptimer.o
>  common-obj-$(CONFIG_ARM_V7M) +=3D armv7m_systick.o
>  common-obj-$(CONFIG_A9_GTIMER) +=3D a9gtimer.o
>  common-obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
> -common-obj-$(CONFIG_DS1338) +=3D ds1338.o
>  common-obj-$(CONFIG_HPET) +=3D hpet.o
>  common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
>  common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
> --
> 2.20.1
>
>
