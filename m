Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4806376wrp;
        Mon, 16 Sep 2019 21:58:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6QSc38MY5lXLdNJKxfvVCstz8ekJcGzzD5q1oiq9mcMnsj/yi5jzWLPB44oBDP6DbrDzm
X-Received: by 2002:a17:906:3187:: with SMTP id 7mr3014228ejy.238.1568696316592;
        Mon, 16 Sep 2019 21:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568696316; cv=none;
        d=google.com; s=arc-20160816;
        b=HQQCxIaljqFHaKaoupop0b+BU0KK4IeDPvHIW22iN9CoaqpuycE1a9Vk/ZqfRdeWWi
         s89QhSPBXCHVKwfHVgv4AvEv7GKf9lSCRDDwrwfO2lCk8lBSvbCxtIbYMNqz+CUMNKX8
         VoD7m2p+piVXgR0h/r3XdSsANQ5hYoV40E5FzufgTpCVr+A2jOIohl1J5XEPEuLsfx99
         gy+99gPDRhSopphrvqeJZAQyZiAR0wQkWqa+xFMWBTy34/8aKV1fqq00pWlzAMJTbizr
         5XRAjtDOnFJJ7/K/YpNRXOmUtItDEOQy9pk7tcMa6ABuPFy2jEZgYN7QzkkFpU+2bKMR
         QROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=z67WCEyHIuMQeKk5nY1KzvChx6fbSRBTQZ5M9Ud/3tY=;
        b=0xt6KJFUJxWsc7tKa6p2IBAH9BZPcTThQa0jZj7NBdgraP/AHWTdsYD1E5frI385F8
         5kk4Pd6MzrioSFl9ni6mR/z19/48D1FKmaRvHB3M4GzDjRKP1sMpRHAiAirTcc05Gwdv
         HTnKX7MyeiMhW5BmN4PO09MxluASVNT9NwWCgJIDnNsNXiEBXEzeRTEmeDky3rJES39Z
         Fhon/Hnc7XzPP0ATPlUzZq1f+8BHR+UiVBc7FheSNd5VhHVb4cjc8c1w0ukAw87WKboM
         WOUg0LL+fDL7OYI/rvSv2LI0NLZaH8j0DT2ohO5txCO4vimHoTxCJG0tQV9JzuVG8QRM
         MU5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si726123edb.308.2019.09.16.21.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 21:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iA5ZT-0008T4-IF
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 00:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iA5Z7-0008Sk-7b
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 00:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iA5Z4-0005yh-Nv
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 00:58:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iA5Z4-0005yC-GN; Tue, 17 Sep 2019 00:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B439307D90D;
 Tue, 17 Sep 2019 04:58:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-28.ams2.redhat.com [10.36.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C38E60600;
 Tue, 17 Sep 2019 04:57:52 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <1c79bc3a-740e-ed69-303f-3a53afaf48e3@redhat.com>
Date: Tue, 17 Sep 2019 06:57:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916154847.28936-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 17 Sep 2019 04:58:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 01/13] hw/timer: Compile devices not
 target-dependent as common object
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
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OBE9uPPjUNW8

On 16/09/2019 17.48, Philippe Mathieu-Daud=C3=A9 wrote:
> All these devices do not contain any target-specific. While most
> of them are arch-specific, they are shared between different
> targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
> endianess, ...).
> Put them into common-obj-y to compile them once for all targets.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/timer/Makefile.objs | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 123d92c969..f407523aa4 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysct=
l.o
>  common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
>  common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
> =20
> -obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> -obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
> -obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
> -obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
> -obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
> -obj-$(CONFIG_SH4) +=3D sh_timer.o
> -obj-$(CONFIG_DIGIC) +=3D digic-timer.o
> -obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
> +common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> +common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
> +common-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
> +common-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
> +common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
> +common-obj-$(CONFIG_SH4) +=3D sh_timer.o
> +common-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
> +common-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
> =20
>  obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> =20
> -obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> +common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> =20
>  common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

FWIW, that change is also part of my "hw/*/Makefile.objs: Move many .o
files to common-objs" patch ... but since it looks identical, it should
not matter, which patch goes in first.
