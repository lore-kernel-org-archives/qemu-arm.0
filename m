Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3489233wrq;
        Fri, 25 Oct 2019 01:49:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzV+8dyqKJx1rxdh8PPidchpZC+d+Ek/2sA9kC00FErxzEFFgOf+PagyGsBnr5QT2ZldBsO
X-Received: by 2002:a0c:9048:: with SMTP id o66mr2177910qvo.72.1571993396836;
        Fri, 25 Oct 2019 01:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993396; cv=none;
        d=google.com; s=arc-20160816;
        b=W77sm4pU9e60SqEldyJ5GG76AaJSyStBZptQFdKhO4FEp+3o4MSa8bN9xo+ghp118U
         E7Xa98l1XulNtXWwqINoQDY1Jp+zQA9hS4c9aXwNMijru1mzuM5V5pIP+i75h4bACsWo
         AQ4dLX8+aoPwGflNDFMz3cQKaJYI0+Tb7tr3MtOZL4gMmJAcQ3BiUn7JLhXMIXf1S1zE
         0JAZQlcLulaM7kKyjKtpaGQ18aN/v0TCvm1hmqR/sMnoUxMzHbENgCszfUatXf5M4RQD
         owCOeA2chMhwZnAI3UnL7Dei/1krAgtxDusJffvG9N4ARDa5R2krtrqLNhbKZRO9nbLy
         eYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cPEgXPA+p+ULrNB6lIvubJrJiwyzegLFncV5J+EIJAY=;
        b=P/A3P90oK+iorGeon8aWhn/yxzrSVALjxD+F6r/Pe1qytlzhjd+RJqUJdTDgwoebdu
         L9mUs98gommZudmeCOQINPq5zb74pQ9KwJ+2etBDC2OFxvubE1CPGhqN04E7SDk9hwXP
         KK4fEKuGcXXdTDixtisgnvxky6sPSe+cetBFCIjdcKO06c7oALW08GzUwFRSCH/ZG7gk
         jDrCvyrQHJqQpeGjiX1cBhCZ32DszmHKEMD7gVAxCBLRsdg3elqG/Ra/xgpeiYE1qIpK
         mP/52yIdNQaaObzNGAmx0XOWxy9jX6obY54Yde5eIWmQcTSJPJdx03pglVZyC5beFYmx
         QHDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v59si998840qvv.107.2019.10.25.01.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvIB-0005w8-Pk
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv51-0000mf-7Y
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4z-0007tY-SA
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42539)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4p-0007i4-NA; Fri, 25 Oct 2019 04:36:07 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MPXta-1iacMQ3LTG-00Mbyg; Fri, 25 Oct 2019 10:35:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] hw/timer: Compile devices not target-dependent as common
 object
Date: Fri, 25 Oct 2019 10:34:58 +0200
Message-Id: <20191025083511.11463-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fJ4V1AnXTAcItYSV9oR8i35L0OGfAII0+g067o8KOiaQpL/F/Dy
 ZwprbljE8vnKw8Swcki38wOLABSHSdwgvzsbd+ruAOD6OewQ2dfUeIPD3xqRfGXKlWl8MGW
 uN+u7znWyXKIvvd+uqmtszoEu4aaEcKL/AakDVxCLTeOfq8keKigQPyAktuA1038zubP+aE
 R0KAfL6HP8jiXkSihxieg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Rpo3xlo6y0=:J14/lgwOwfUNXqY26XKPK6
 /LCbiixh3U/3SOte/ZGRUhk+qolPY5xQqR270PaRTA3v/G2M+NOBR+aLMRmKFJPx4NdV/1ltx
 fv72HigBTOsZPL/BZJ+Et2RcShxvX28bivAsnJ2IlswAaPXI6xKuSVQ8NSB8qc5fBMccYLuEj
 F5qF4fkimZFsbsgoXyYmry9jl0cWgRd2hU4F22Bs49KlwCJuGSCrh5QFTKUmHn3N0ZE+jiB6W
 ZDf1pBmPYrsXfG9DVDbkGzPQJeocDJzxvh5uGm+Mrdgx3udtJ11UJpNWjQ6SKrAHxff413K8P
 xzagBpNEGKT4O2LUZsJ2fECKH60Llus3OwJ30mQyB2/p4JOIm/upvzxyx3cW6xt2EuKOjo+mr
 NcSHPmpzoYPhrzGFrUomDARcEsRLJ58rBbCObt91brilSotJ8rF/o6Vs/Gv0iDiYSI8AXAbGE
 B1W8Ias8YXT+zsuQm5KKja5bjWPWCbN9STEQquRCYj256usZuLNi9ms0n2GsDu4VvKc5ilGz6
 N9KTMkJieMGuT0JQYAUJZXUPw0t7jiqBk9UWsjJir50pZOyB1ncdpY2h3S7+4J/HSanLbYPTt
 Lj4FBn5fktue0bg3uDk0+Io9V6rDCtvvxiy3zKx6yBVjm5cM2PzaQopdc+zdIjKvpcktqw/vy
 HtFm25iYMsF8SRj35bU1kG9q+iIiITv+yAp2wzNkm1JevXaFgUAQl/djX+XMaDQVjoeGk7y8d
 2rJOl/ShR9yxS20Tx5wuxhNJRlFYqxvNLu+qz9YoBdOeEjD6pGeNlhJIPqwtJEUqibuT7wXod
 mVE40dupzFuta57phzfzRSI6J/I4S3cymRmnXEpBe4dwb09KizjrRiofQwws+hKwn6Gq0lZNl
 o5vwYz3el7btGeww7WCqF4c5qSYOgtzRxedd5CLao=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMWqYcsuEMEx

From: Philippe Mathieu-Daudé <philmd@redhat.com>

All these devices do not contain any target-specific. While most
of them are arch-specific, they are shared between different
targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
endianess, ...).
Put them into common-obj-y to compile them once for all targets.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191003230404.19384-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/Makefile.objs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 123d92c9692c..f407523aa49d 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_NRF51_SOC) += nrf51_timer.o
 
-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
-obj-$(CONFIG_OMAP) += omap_gptimer.o
-obj-$(CONFIG_OMAP) += omap_synctimer.o
-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
-obj-$(CONFIG_SH4) += sh_timer.o
-obj-$(CONFIG_DIGIC) += digic-timer.o
-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
+common-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
+common-obj-$(CONFIG_OMAP) += omap_gptimer.o
+common-obj-$(CONFIG_OMAP) += omap_synctimer.o
+common-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
+common-obj-$(CONFIG_SH4) += sh_timer.o
+common-obj-$(CONFIG_DIGIC) += digic-timer.o
+common-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
 
 obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 
-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
+common-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o aspeed_rtc.o
-- 
2.21.0

