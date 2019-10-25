Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3495005wrq;
        Fri, 25 Oct 2019 01:56:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLheWb0FUhDNJ2TB9zOk4m5m/yAKKJ/6mo0acu+ksejWbhWid/qMv4D6R+qQJtQQTT5PO1
X-Received: by 2002:a05:620a:2158:: with SMTP id m24mr1963605qkm.350.1571993800985;
        Fri, 25 Oct 2019 01:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993800; cv=none;
        d=google.com; s=arc-20160816;
        b=cFsGSzwdYc5BgBKu7abaqhNvkgGDpX9O0xXh5UrkPR+Kg01Jp11iTV6YUwzUh91Qu9
         LnGOA25CjT6OfsmwIOoj4K+O8s19KXNj/C98EdGDu7l6nxfsaHgTkbwlsgu0xodn9vz7
         VeYkdeK3sLZRdpJhwqOZzmF9xewaPMbxnB6YNJcGaB6M9O7X/LLroLeVlqG8XwhwZnJr
         jLew/w8Ql+LNEbiPkNGtBpfD3Uj8nqL9xFTxSlr9p4JBHe4nH7B2nJ47RxNlSS7HuiSy
         SkuGxZ2wiWCX9HWz/jtz6xNLebHECeRVannxN910RqR+Zchz59OynABEkuHXR+q+SIey
         r8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+RWq9eHtCGiMt1KIDuKFn/A6+VkOAIp5BUP7tIBz7uo=;
        b=QpS8Dk+Jt2sZIfq40wT7w8QtHywM/I4Dxq2PU4Dvoc3uR8CHJ/HzAUsOgJXtDS2Hki
         o+gaOmf2c/cP7KRmO8buuUQ8f4iQaH0mIwQxEgAlxl2E+fUfduT3cbcey/PKb8C0hxLQ
         cbNE0cB5wJVZifGWxxBbNoYI67093NQ/KyrQGTG/XhiIbMK8jSC2Y8d281PtWmRYmTCX
         ikda53QvqRXfVea3c8VUQluwX0xblb5Ke0U5vMeSE2H5QRIDePdr6jDthYFePCYwaXYn
         Tv6aAKBOU3U9CkAPYcIjVdDNuw6vqkipvSSpqAh20MffUUOb2p8o4Mi9cglIfPy7SXYo
         idDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f61si888462qtd.221.2019.10.25.01.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvOi-0006Gt-Dt
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5Q-0001UU-J5
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5O-0008CV-OD
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 04:36:44 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5J-00089O-JD; Fri, 25 Oct 2019 04:36:37 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNc5b-1id6HK3O8Z-00P4ox; Fri, 25 Oct 2019 10:35:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] hw: Move Exynos4210 RTC from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri, 25 Oct 2019 10:35:07 +0200
Message-Id: <20191025083511.11463-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vack1BjZXw7zRhCywDDbJMpaQCtjGChZK3BCFTUq7S15JitEFJr
 5p9Ubc07Ugls6WUEmqDhlHC4187umJJJmCfpUAinfcUOUCw8LjqzFpnIdAgAeKrb3aOQtI1
 zjzGjIUoRXr1XGEvQUdQ3StRpC/nTG3m8ycOwOKuzUV4rFfPW+cyW+U+WqtFwc5Lgfws/Fv
 AablbPtdvnzy61crt85hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UxPdNoSktyo=:SOk0/YJjK7m8tevZBbEk6o
 rHaygyShR3IXb182XRgQ6Khb2Gu+pU1PUnCDzLpypQBadyzIS7xnNPxdhQxQKNdxaiYhQitoD
 Me6eZeXAPQd3KuhX/ikOfDbWxJQ8kkeb+lKE3VFU5Fl5M0UsykvUJslYA6XxgldablZZylsZo
 XZvsO91pYmL3foc/ZjtFEMOG9DfJxRiUxT5tKiN3CIpYK04igoxaeGgEAw7aEmtCzx8yN9X8u
 n71wQCsXdw38L0oNPdIom6eOIMIblG73jhFbvRJEkMe1A2dzBBhiniRQJobSszTcq568oxG/D
 WIVaGI5ex0PWdCTBWggLzwcj/KLr6Tyt+eT/Sik3mErO42Ex1rY2YTCN8rv/pvw+RKK/+zm/I
 ZcHAPjG4eYl3F9EJWERwTZt6kZy/bdKcS13f6T56HXYm2fImtm9fUwYnCEa3WfmGuveF/92ne
 en8UhO3iVjyYVS4EgmHg/JR9FAUvsJrgNPeyCkbrpybrS0X3jKRs4Qvn44p2vbUI+WAo1/Ec8
 FjcGJlupBZKDou02cHOs9UHiJGYMmoeN/ustEnk/3wEaDEw7fI+MO7x1bYS+QeGwMbC+2dp7j
 B3swZa7gRdkg0okz5LNb9G2N8istKZYzm0FxW435sVuP/AfEAgtXCnEOKvKARTsUuKchS1Lig
 IH38JuHrln+7sKwm4ugwNCPQXNFb8FtNu39SsuGLcxv1Ama/954vrY+Ryk66PSTnH86tlxQZL
 ABtEjukcMyh433wVRIxwk4GpGgv/aaXgWg8Q/rqehnUlZ0BdoRk5T+UNg7ga7zbWmCz7p03Bi
 ewQKIwIx4Ads2yNnuis323kmm6dDZFzew38WjiYDuo5O1uVNybopWPmm2Q/Ld7cndPPvkNAEg
 PJQUlxo6RkdNy3p8jbN3SEASkr0dbbXbvclipTO5Q=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L6BsBTsVqBYs

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move RTC devices under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-11-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/Makefile.objs               | 1 +
 hw/{timer => rtc}/exynos4210_rtc.c | 0
 hw/timer/Makefile.objs             | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/{timer => rtc}/exynos4210_rtc.c (100%)

diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 543a550a0f11..3d4763fc269e 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -7,5 +7,6 @@ endif
 common-obj-$(CONFIG_PL031) += pl031.o
 common-obj-$(CONFIG_TWL92230) += twl92230.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-rtc.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
 obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
diff --git a/hw/timer/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
similarity index 100%
rename from hw/timer/exynos4210_rtc.c
rename to hw/rtc/exynos4210_rtc.c
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 294465ef47ad..33191d74cb98 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -19,7 +19,6 @@ common-obj-$(CONFIG_NRF51_SOC) += nrf51_timer.o
 common-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
 common-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
 common-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
-common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
 common-obj-$(CONFIG_OMAP) += omap_gptimer.o
 common-obj-$(CONFIG_OMAP) += omap_synctimer.o
 common-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
-- 
2.21.0

