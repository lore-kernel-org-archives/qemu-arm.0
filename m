Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp103854wrp;
        Thu, 3 Oct 2019 16:38:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvh+BjVJ/bmBAssyCyWaIM3iaepkiwznzwbzuNf1WltszhvvC0q4ayYtXeCkvU1th84ttc
X-Received: by 2002:a37:95c6:: with SMTP id x189mr7161830qkd.323.1570145919382;
        Thu, 03 Oct 2019 16:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145919; cv=none;
        d=google.com; s=arc-20160816;
        b=wis87YNPJOGplu8aCKv72vbsTAdBDG4UaA8VXIc2+n8CLVVn4SoqPASCSWBye0wpDQ
         4FscoSC7cFFHwbREz/prWf4rX0w1+Y1aHlpSUPtCijpZGcud76vLn/Uw3QJekNTweyhg
         INbUg06E/Kv06wkef8J5k4IXeB5aaIdHNmR6tXTQb+QyKbMxUAW+JJfmy9pG5Nsu2B7V
         AbRw4AbltomVbQ7yFQ1MuOMXoCJwEuTwwwzzEO9soQL93F6L8cRW8wMUn5exyw7KJxiP
         3XLfo4ZdmEeeVIV21IvSGjrJzQtkH/lLakDFqdEBy9OMZhBZzeBTxGx1fMsLw3hfIBRc
         IUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=37cMGUJE3eWIK7cGJhw5qDzw9kXc9ZYsOMupvTqBb2w=;
        b=DxRUSWJEzlm3KTWFuX9FOOyGM6c9C/BKvj22sedvpfVA5GVgJHzGvO938Sl4GOwDmL
         iL1TaZVbZyd9cCs4MGImN5sAJdgoENTmkBVgZsWwHqzVTBRV3Ogh/3SDQfGpeA6QbIu9
         +HoUXVUGd4ef1/MYyytpRlt3+zT1LRV7JS54uNlebPY1K9dOBUSZKMBHZ7E9xl9LNOjr
         e6dhCLuRn54RAiTbVKIa8Fth7FFncfD+qptPN66gekE2i5hsoucsR0kihg5WQose0pvv
         UKqB1Z0f88p5+ev3jIk5xPag9UFJV4PUUN49cTRPi6TTAYeO6bQh+5qTA/aoF2zdsd9U
         rkWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z32si4196318qta.72.2019.10.03.16.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAgA-0005lX-2W
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGABF-0001rk-M7
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGABD-0006qp-U7
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:06:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45508)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGABD-0006qF-JE; Thu, 03 Oct 2019 19:06:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8738E307D84D;
 Thu,  3 Oct 2019 23:06:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49D9510013A7;
 Thu,  3 Oct 2019 23:06:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/14] hw: Move Exynos4210 RTC from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri,  4 Oct 2019 01:04:00 +0200
Message-Id: <20191003230404.19384-11-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 03 Oct 2019 23:06:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YaFJzuyAJ/zK

Move RTC devices under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/rtc/Makefile.objs               | 1 +
 hw/{timer =3D> rtc}/exynos4210_rtc.c | 0
 hw/timer/Makefile.objs             | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/{timer =3D> rtc}/exynos4210_rtc.c (100%)

diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 543a550a0f..3d4763fc26 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -7,5 +7,6 @@ endif
 common-obj-$(CONFIG_PL031) +=3D pl031.o
 common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
 common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
diff --git a/hw/timer/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
similarity index 100%
rename from hw/timer/exynos4210_rtc.c
rename to hw/rtc/exynos4210_rtc.c
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 294465ef47..33191d74cb 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -19,7 +19,6 @@ common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
 common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
 common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
 common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
-common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
 common-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
 common-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
 common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
--=20
2.20.1

