Received: by 10.223.188.70 with SMTP id a6csp1832576wrh;
        Wed, 30 Aug 2017 20:56:07 -0700 (PDT)
X-Received: by 10.200.34.10 with SMTP id o10mr5092553qto.63.1504151767572;
        Wed, 30 Aug 2017 20:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504151767; cv=none;
        d=google.com; s=arc-20160816;
        b=YIaxD9O+twxtIaXLkeDjs1MWfeSxOPsuUgy56ikw9y+zXrDslHNzaqcWS/W3DX1ifD
         XvD0jbrdocCDgyNfS+ftdbn1Rx9HDTkjfiotGRmpAPPA1MzxyW9Z+ijGIzPI3RZiNmyK
         PIfWAkPRcmk4fJgx1euwCvgKmrqOoQi3zPGctTpfFfDJ1Vahx11P7WNHFsqYMpYkWTFt
         MBiyQtdHaFJPnD58bu8sScTRVZJ/jx84cGe8vChzr2Ho2ZO+cbJmtmI/gJ9npxxAP3Jd
         KIt5acKZlS4MlXa62SWWhO5c+6YWrCbyuhzHYp2Jjxf23hUaf8T4cf76Yv4m4I5KVvRV
         9Q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uAZVgqVk/IJrL2WN49KZ/EeyKG6Gdk+6kpmck+4Aqas=;
        b=z2VmPbkHn37PbYUKbf8htbquuDv2HfVv2GINo61R4O8mqq2veyIMDqZRcye6UmtIBb
         KGX/0yaYorir6L6CLUeFoSX7NDeyUH7wFK81Z+1ZHCoC+qFz8kpKl6eToSikiBYsfRIQ
         xVVizYP46FGo9WDemWmcMog/dcIdT6qBf1PktOO3ck4l57oN69ZdCozjESGgjWBxJBNT
         shIlErm1WMib6eOA5MzuNGiDDm3tlk1dkRNlvUwA921EJqCqgr/dXkDO1S8fF1Pp7KWJ
         qJcoTOhyj+h+KDcNwOJD4w9/R8YodeUD2h7kZBKTmCQoXCWB66Ipku6MLxNvFUT9MMA5
         o7cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jpPwTEQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si6678765qtg.275.2017.08.30.20.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 20:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jpPwTEQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnGaL-0003GF-8u
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 23:56:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXv-0000oO-4j
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 23:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXu-0006d5-As
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 23:53:35 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXo-0006aq-QC; Wed, 30 Aug 2017 23:53:28 -0400
Received: by mail-qk0-x244.google.com with SMTP id p67so6720135qkd.2;
	Wed, 30 Aug 2017 20:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uAZVgqVk/IJrL2WN49KZ/EeyKG6Gdk+6kpmck+4Aqas=;
	b=jpPwTEQ7gcwxj2aCwXoWc9p+BSuoa+Lv92dlf3cZ2Ol4tnh/ILR4bM/k60MzB2SjCB
	gvRVMsPLitzlVTLoopVXN2/7EEbA/A+5nbp2tbVw2SF/fD+oPho0HHR1zpgnxTgLHzt1
	2YtOwj6zJag/1bCh+ekxeuWrO/zVy5sE6lkaqAtx8gx6EOivXxln8xOYEOo9AodhKf2k
	rOkXyih6RSGMIkC0K4y0CO0kxCDf2TF00h1VrTRnkFDePMtxf/j98ADkJ2KB8LkxJg7o
	zUWDO8q/HiAPDsFUdG8ZjdBLcXF8HFM1JC2bjAsbGbtTB5SfmsKPixfUzGflRTWSVLRO
	DWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uAZVgqVk/IJrL2WN49KZ/EeyKG6Gdk+6kpmck+4Aqas=;
	b=sKg274HwBU8IJp+jjAWZf2BDdwE4F9zI09o13jLO1AsckQfQ30s7sl1dyvRQpNYptt
	8Im8VkvVh1zt7oMkCRQG35WC4BqE4K05+sFRs82Ve+TiGBlTu2t2BrQQ4MbRC3WxRmLR
	IyaLOUU2axCtbbXNPpJUhnGnstNQT8XBic6q4WOf8AL2wFMwyH7Q0bbewupfaddvaFO0
	3/thU2mLQ44N0f5o6BaUsISn0whdkz6Di+mMNH1HtfSdjwBrg83DvTfesqWTFFE8U4J0
	e7YosOYocBHvRcWW5wS4NF3Dh3y5Pc/+xJO5oarsc7IWda9bviPKn9Oo82TX1KDSgufx
	LkVg==
X-Gm-Message-State: AHPjjUh1D70nq8VldbuOsRcU6r0ivJFb/cbtnvoQYhwKJkwYqNtX/38l
	A+B9mchJ5m22SQ==
X-Received: by 10.55.4.1 with SMTP id 1mr1983512qke.325.1504151608268;
	Wed, 30 Aug 2017 20:53:28 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id x20sm5072398qtb.5.2017.08.30.20.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 20:53:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 31 Aug 2017 00:53:04 -0300
Message-Id: <20170831035306.29170-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831035306.29170-1-f4bug@amsat.org>
References: <20170831035306.29170-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH 5/7] hw/char/exynos4210_uart: use
 serial_chr_nonnull()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l7327imn9+kr

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
This ARRAY_SIZE() first surprised me but was valid :)

 hw/char/exynos4210_uart.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 3957e78abf..b6cdfc3006 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -27,6 +27,7 @@
 #include "chardev/char-serial.h"
 
 #include "hw/arm/exynos4210.h"
+#include "hw/char/serial.h"
 
 #undef DEBUG_UART
 #undef DEBUG_UART_EXTEND
@@ -589,9 +590,6 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
     DeviceState  *dev;
     SysBusDevice *bus;
 
-    const char chr_name[] = "serial";
-    char label[ARRAY_SIZE(chr_name) + 1];
-
     dev = qdev_create(NULL, TYPE_EXYNOS4210_UART);
 
     if (!chr) {
@@ -600,15 +598,7 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
                          MAX_SERIAL_PORTS);
             exit(1);
         }
-        chr = serial_hds[channel];
-        if (!chr) {
-            snprintf(label, ARRAY_SIZE(label), "%s%d", chr_name, channel);
-            chr = qemu_chr_new(label, "null");
-            if (!(chr)) {
-                error_report("Can't assign serial port to UART%d", channel);
-                exit(1);
-            }
-        }
+        chr = serial_chr_nonnull(serial_hds[channel]);
     }
 
     qdev_prop_set_chr(dev, "chardev", chr);
-- 
2.14.1

