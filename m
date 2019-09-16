Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4183585wrp;
        Mon, 16 Sep 2019 09:01:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyemJCvoBLGzPyvOO3O99m/dxyGUSzqm2xRyoPd+0jcrqnd1HBu5cbuOgFQzanpJRglBIyU
X-Received: by 2002:aa7:ce02:: with SMTP id d2mr15869edv.270.1568649719710;
        Mon, 16 Sep 2019 09:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568649719; cv=none;
        d=google.com; s=arc-20160816;
        b=GU3nz66zTdTqTH+j8zMLW3J1VpDDnfv+WX5fm7+2bSxVTnEChKyqirdXBUoD9mm2he
         Hrf2uWpz8n/K0t2Z42QwUtxnK8YiyWASCU5yuRwabit9NfH3hlK/oitq3u4tGv2T5MaG
         UTglkzHPzlOc9o37ipB1xNtcLJjm9vNOON182kc3TbCC3reQnXDdja9RQsv0K0JPFHoj
         20diapvbsnJVKgIitUfV7SAQ+LU9L4DyVsj/jM+3/v5JsQKHoyuQTLXAWQDFTnG114Dt
         2fYlrBulUB9AVnFOFaaqF9nLCBcldu9dQAlBNXiPlqakRUtSV4WJYqkKAFvuvIDoOrpg
         o5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=M1pfLagUB+4LB34OVMRSzO3ElMAckZObBJ6pPjaI5Pk=;
        b=Kp4I+IXNnWucNvIWpqsqC5LOK9BhEoqRfLDnSSV46JVjy4rZp8oBr/1wijgCdHmK+x
         27ABJinAR+A36JAN61ZxonV/MJuxtlz626DGfoLe+jlcsE9YPZI7w9Mbc0UVTcqrT6Cr
         2aTFa4sAgvJHFtIw77QcjPIqoLQ3PqhB5ORZx6IRgtD1o9tSuBHSPbJ/ggHYqXh2GBec
         Z5qrtoaO3mLOA7ofzytpWr9SVmLNY2/eRjerYsR5WBlfUG3X5gHQhDNlksBDaIHIKALL
         9QDq8EMbHsX18uTB1g2EI5FHTWA7VVg2P7ZGUgAlxQoYBXoBwvKDQfwb3BFujWFWouuf
         czjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id se14si2621772ejb.322.2019.09.16.09.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 09:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9tRt-0002t4-Ov
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 12:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9tIO-0002vv-7X
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9tIN-0002XQ-7C
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 11:52:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i9tIK-0002Uj-Pk; Mon, 16 Sep 2019 11:52:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF570C009DE1;
 Mon, 16 Sep 2019 15:52:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A16196AE;
 Mon, 16 Sep 2019 15:51:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 17:48:44 +0200
Message-Id: <20190916154847.28936-11-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-1-philmd@redhat.com>
References: <20190916154847.28936-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 16 Sep 2019 15:52:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 10/13] hw: Move Exynos4210 RTC from hw/timer/
 to hw/rtc/ subdirectory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: syYsoxhtIxZG

Move RTC devices under the hw/rtc/ subdirectory.

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

