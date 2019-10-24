Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2723011wrq;
        Thu, 24 Oct 2019 11:28:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnh6FcD1ewwK6gFjhUXcTlp6fxslfz5q+XA4EboUJVm/ge56PN3W4XMUPt+LGO3m/Ccfhk
X-Received: by 2002:ac8:2fba:: with SMTP id l55mr3717520qta.167.1571941692952;
        Thu, 24 Oct 2019 11:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571941692; cv=none;
        d=google.com; s=arc-20160816;
        b=dE79AEYUVcNujEKb6Id0ivBvVXW8lkMKh4tE5EC8VSGBRF6MecQBleV8e1eLRvsMnR
         +mEsuFAWn0Soh+7uz81t6+uQPq4zpY9QtR2q0hE2KrjhzZGzrwyk4d8qcYkmcHsKWM/e
         T+gWiLl8BS8FnGTABEnzJ6XyDiNNiCk8g2Lay4t5PKib7WErQPLEholjFyD+TS58jt+n
         lY0Kf8jW4xNqLim24Fi9Nk3/hz9s/OXcgcAHvxUdsgB1ZneVUkK/Df+AtSsRfRg4YJ6s
         DnK+e61LdOrH8DASfk9lvcd3JyrPlpNYNGR0PnXRyvbgATgfye20LuHvzdjT5cqTD2jA
         Fifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject;
        bh=TIe8V9a6B2WoVVHFwPnYMc7VEcc+zRrlxlnBaIUIUos=;
        b=QDot9R2mpVWPn4p1sZcXnfp3k2ZcLuOwbI8Ity/FjK5jB00awvwyYkZGb0Z1oMtRs7
         rq7Bh59xkdH5FEiBiKLraQTaYwnriq2TdVLDiCCtXpLdPkXwkKGl+9q3u38J9GowXW/m
         rygGiDSnVafbEcc11PApPRPEN6NkRsIgZBcGZnF0IfWa6iPvBYefYclDP0ZYmBlTTLIZ
         ilvO2GjLJVnj5vug7n2qIa6ennEzm+VnefZp7v+aBQlGMGL54AVoMKheAIQ1NVtubwEk
         3qoK0U90clSdlr2AyGGpThI7fhpgsjRS8G+/9pN6IUNDuWUJu7FGvoWMS/JsjBfeVbfL
         DlwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si9064811qkj.81.2019.10.24.11.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 11:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNhqG-0004gK-0G
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 14:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNhoO-0001vp-Gz
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 14:26:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNhoN-0004Vy-3Z
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 14:26:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56647)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNhoK-0004Ug-4m; Thu, 24 Oct 2019 14:26:12 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOz8O-1ie8lB0VG0-00PM48; Thu, 24 Oct 2019 20:25:53 +0200
Subject: Re: [PATCH v2 07/14] hw: Move TWL92230 device from hw/timer/ to
 hw/rtc/ subdirectory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191003230404.19384-1-philmd@redhat.com>
 <20191003230404.19384-8-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fcf23019-02e2-128b-61cc-e5d554e47496@vivier.eu>
Date: Thu, 24 Oct 2019 20:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191003230404.19384-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MtYMBhPxCOVpabe3WxksqXWnhDcbXJIOMomRYYMhx/je009/pCv
 XNCauvArpahHmI2vOBeTG84/2tPkrG/c/n//Em+y5bz30JKGh9SDNSZgYR3W6nK3Mn5XcrL
 YLkBILCuMPT3tU9Yh5Kn0xM9Jf//Sxq9XJ/gfKNeBxING4Ug53n5sIdcQyIpcqdiEYql1L0
 brgoa6jliVwKvi3qfMiSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O8wnyq7m1lM=:60x+grpeL06QMLfe3jolm/
 6pgnXQ7FhOlOmm818AM1VaDxUDS0wgyTu/csG330GCTjE0bJ+fvfbiEJ/zY22Bpa25nyDHBsk
 OS/bL1B2VU8S50NQjn42A51+fVxaE/ERtWkx34B57QMAUvXu+cwVFXlUKB8KQ6P+iTPZ47gHy
 S1PMttjj+BPXCu4VIS4fnVrY/4gxlDAyyRshpSyNsgsWE4psNtMJvnkNuigSj2OIboOtLetSi
 AWc6CHUKAZfx91uDqggfmasMq0fj7b2xs9miLviBWVUckHPw9N7Wawzrks3Msk0zAEgVQ4qh1
 HWhVCp9TYhwEXVcv0QQLvG5Xq/CZYmWW/Zs+MZWClIYJCm/aHeS0pvUM2yVcBArvd3XzAXqoU
 cZ5gLX1P4V7ahhWZVkJ5N3mw1r7DfIfTrqaZMTpu9sEOlM844ekItdnNICiLbhOG9kJRnDw37
 jAeTEM7vIcUxO65EAZVUoGP2ush7KbuoJpDfhy0oqA121e/cjBhJt+sHxH2vSkfyj0vLASOJS
 rpMf1+2hdbiIDRDSv4MzOBA7cUs4mVAIUiZFzXNgl+v25tJ7g2tYrY3Paq67XU+Wx9TWxdh93
 2qqli8Jf4axg9IhZKL6KuDtEYvGvmfS9ALXpFVZChDoHR6nwck9BMqCmOT1v2tx3jmlTZpwgO
 EBzvBV0UhRcR8aFX9wX/GBy36fhEAvHvjLAIufl45qNhpAEVQRERlpVw8+QQijU/77qbJXW3z
 iwFthMFp7M0YzJI4rTA/xkVqDdhOrRPkvAWVSgsS4yCbOV3MdD2oBnu8GjBdeulPSy89DEBKM
 p66BGHji1ZWR8i8wdYAfcQuNdjbBaD8fkkUWzo+GF840CfdJcC15NDYyP0C0dgr04QvBDx3XC
 +fAnYY1xBachFzzkMt3JgJq3Jv5ae4s/UahJzh7Rk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJAwKBtHSAq0

Le 04/10/2019 à 01:03, Philippe Mathieu-Daudé a écrit :
> The TWL92230 is an "energy management device" companion with
> a RTC. Since we mostly model the RTC, move it under the hw/rtc/
> subdirectory.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS                  | 2 +-
>  hw/rtc/Kconfig               | 4 ++++
>  hw/rtc/Makefile.objs         | 1 +
>  hw/{timer => rtc}/twl92230.c | 0
>  hw/timer/Kconfig             | 4 ----
>  hw/timer/Makefile.objs       | 1 -
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  rename hw/{timer => rtc}/twl92230.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31e4fbf579..daa92cbff0 100644
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
>  common-obj-$(CONFIG_M48T59) += m48t59-isa.o
>  endif
>  common-obj-$(CONFIG_PL031) += pl031.o
> +common-obj-$(CONFIG_TWL92230) += twl92230.o
>  obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
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
> @@ -7,7 +7,6 @@ common-obj-$(CONFIG_DS1338) += ds1338.o
>  common-obj-$(CONFIG_HPET) += hpet.o
>  common-obj-$(CONFIG_I8254) += i8254_common.o i8254.o
>  common-obj-$(CONFIG_PUV3) += puv3_ost.o
> -common-obj-$(CONFIG_TWL92230) += twl92230.o
>  common-obj-$(CONFIG_XILINX) += xilinx_timer.o
>  common-obj-$(CONFIG_SLAVIO) += slavio_timer.o
>  common-obj-$(CONFIG_ETRAXFS) += etraxfs_timer.o
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
