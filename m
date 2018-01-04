Received: by 10.223.134.117 with SMTP id 50csp12512417wrw;
        Wed, 3 Jan 2018 16:02:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBou51aSSTzSQ973VtjPdR5bAws7Jyrc8evJbVCPM5vTnXwBNftHPDQbNALPa3ah02uNDzh7b
X-Received: by 10.37.2.16 with SMTP id 16mr2798521ybc.202.1515024158931;
        Wed, 03 Jan 2018 16:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515024158; cv=none;
        d=google.com; s=arc-20160816;
        b=gzt5ObHGqxX9eHRD68NWATCkIb/jDDzzANqdkp+ATCgRDTfkBGMaQyxsIXolNb3s5Y
         ZEghyyF4CCzRWqS0gD6fE7fJBe4+C16Ufug5GXrjj7+E2hwB0qCiGZDgVAq70kqdKiOe
         vevBjVaBCoUs/OwmzVLZ5PP/rZIHH+e3WCQpFYLyEOWDx+vQapmUJC6C2Dd061tN7Xc8
         Exodwyp+THqtO5wtc3ZoqtbJthzmXhsetQoxulluQ232zJ54NdWf0lYz4GKDuOWeFNz7
         6f3XmNrxk5nYM/92/Vto9a9iGhlbrjftMCSCeLhrNiSJIssUsY7igvRiWZdy2dwd8mdE
         h3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=a3g00lNMHzJKsv7I9WtwrBC30R37RN+3JMtQb/2m2rM=;
        b=NemUP9rjXd0g7+xbNX8SoRcQFrpST7A1nIhQzzY6dCOe8hrkJIrzZwXrMQU34pCb4e
         anjpSavYOs6e7D3VFiXa86pa4aaKFPat4hZDRLFTiZ/vLgp8401TV7GuFzrU6pONizoj
         Enqv/wJV3BcY9Bofv7yD0N68/DrvC1vGaxHTZeo9eYVAfM9CY4OEIH0bIj4FdPN1ract
         MwESpQle5+MqOGd8SK2vfBXmHaYkXZKfCd2q2GY3ssO6e2P3Y8Pry4M0pLFpJOkCgRcQ
         ztSsoYZe9AZzn4SAgjEfemMJKoU5ifAXjU4lzqdWlWeMABZpU6sfCxIcjVfXpd5zUzr5
         YEEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=snLYc4Tk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a11si445805ybl.597.2018.01.03.16.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 16:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=snLYc4Tk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWszW-0003TK-DI
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 19:02:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWszM-0003Ry-LW
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 19:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWszL-0007M3-Ks
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 19:02:28 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWszG-0007I6-Sm; Wed, 03 Jan 2018 19:02:22 -0500
Received: by mail-qt0-x244.google.com with SMTP id g9so56560qth.9;
	Wed, 03 Jan 2018 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a3g00lNMHzJKsv7I9WtwrBC30R37RN+3JMtQb/2m2rM=;
	b=snLYc4Tk2CbW+2OygkqYYswLKbc5tTcB4v+8MlZW2VBH+pLmOn1fzZKzJUsViYm508
	ixwQG+cNoCRz3I5rPqYMiZEOJMYsmSio4fj2nw9z4llX9QNkrwpW6OSCzIDukj+Ip8yA
	dDQQaMdXO86blxFBsvIfCXRLM0dzhk5YXzcH1AxVAlKVts3aYoIJl0/GVZXoRRjeLp7G
	Ocd+7yysGz4yCxndYf4uTiDNHRzJuix+bCQFJDP1S6Fow1zxgg8Jall3hXoRIZmYEOH7
	PkWOFCZuBpPTjC0sfM0TvR1T+nRJ4cLbcDEhamOAof2PQzI5SHMO++Y56Lf/UAFYPpiY
	03Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=a3g00lNMHzJKsv7I9WtwrBC30R37RN+3JMtQb/2m2rM=;
	b=W9Woj38qr286eSCYmEOCEcZyQPu/pBCAJYzG/2Gzb1Thn096TIB0kGzdl+xlB0LChJ
	0gHrs/levJ/7WCbrpepcnFogjMFj7Ad8TL0Mhlr1ohu9P8XtPoksF3o+pSMdbaJmsqWt
	Txy5vsmMYz5jDevM11tpfisWSb40G7jpMLGaemnyScpPcgXYmAkMF1pgfm5dUPm75M7G
	qknU9QEh08hbArC1qZDcveIwPGq25kP54WV+E/JHfGrPPBagokXvz2+rvURA+kg5DQRK
	FmT6KG5FaUmp3CSdzPxEiBHxYE8N4ijAOMazRBcgVT+ixQRCeP2uc08ewERhc0bFds2c
	N9QQ==
X-Gm-Message-State: AKGB3mL7OLB1qrpMFM9x2eChR0HrqgAEaStF30SnRDGUXUOuJIGiGz2S
	t23xFf6m3eOzRIeVriUYkoU=
X-Received: by 10.200.49.29 with SMTP id g29mr4215850qtb.215.1515024142252;
	Wed, 03 Jan 2018 16:02:22 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v58sm1367928qtk.18.2018.01.03.16.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 16:02:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 21:01:56 -0300
Message-Id: <20180104000156.30932-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103224208.30291-1-f4bug@amsat.org>
References: <20180103224208.30291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v2 2/2] hw/sd/pxa2xx_mmci: add read/write() trace
 events
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: btrVA6Accx88

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/pxa2xx_mmci.c | 77 ++++++++++++++++++++++++++++++++++-------------------
 hw/sd/trace-events  |  4 +++
 2 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3deccf02c9..63223b797e 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -19,6 +19,7 @@
 #include "hw/qdev.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "trace.h"
 
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
@@ -278,45 +279,56 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
 static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned size)
 {
     PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
-    uint32_t ret;
+    uint32_t ret = 0;
 
     switch (offset) {
     case MMC_STRPCL:
-        return 0;
+        break;
     case MMC_STAT:
-        return s->status;
+        ret = s->status;
+        break;
     case MMC_CLKRT:
-        return s->clkrt;
+        ret = s->clkrt;
+        break;
     case MMC_SPI:
-        return s->spi;
+        ret = s->spi;
+        break;
     case MMC_CMDAT:
-        return s->cmdat;
+        ret = s->cmdat;
+        break;
     case MMC_RESTO:
-        return s->resp_tout;
+        ret = s->resp_tout;
+        break;
     case MMC_RDTO:
-        return s->read_tout;
+        ret = s->read_tout;
+        break;
     case MMC_BLKLEN:
-        return s->blklen;
+        ret = s->blklen;
+        break;
     case MMC_NUMBLK:
-        return s->numblk;
+        ret = s->numblk;
+        break;
     case MMC_PRTBUF:
-        return 0;
+        break;
     case MMC_I_MASK:
-        return s->intmask;
+        ret = s->intmask;
+        break;
     case MMC_I_REG:
-        return s->intreq;
+        ret = s->intreq;
+        break;
     case MMC_CMD:
-        return s->cmd | 0x40;
+        ret = s->cmd | 0x40;
+        break;
     case MMC_ARGH:
-        return s->arg >> 16;
+        ret = s->arg >> 16;
+        break;
     case MMC_ARGL:
-        return s->arg & 0xffff;
+        ret = s->arg & 0xffff;
+        break;
     case MMC_RES:
-        if (s->resp_len < 9)
-            return s->resp_fifo[s->resp_len ++];
-        return 0;
+        ret = (s->resp_len < 9) ? s->resp_fifo[s->resp_len++] : 0;
+        break;
     case MMC_RXFIFO:
-        ret = 0;
         while (size-- && s->rx_len) {
             ret |= s->rx_fifo[s->rx_start++] << (size << 3);
             s->rx_start &= 0x1f;
@@ -324,16 +336,20 @@ static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned size)
         }
         s->intreq &= ~INT_RXFIFO_REQ;
         pxa2xx_mmci_fifo_update(s);
-        return ret;
+        break;
     case MMC_RDWAIT:
-        return 0;
+        break;
     case MMC_BLKS_REM:
-        return s->numblk;
+        ret = s->numblk;
+        break;
     default:
-        hw_error("%s: Bad offset " REG_FMT "\n", __FUNCTION__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: incorrect register 0x%02" HWADDR_PRIx "\n",
+                      __func__, offset);
     }
+    trace_pxa2xx_mmci_read(size, offset, ret);
 
-    return 0;
+    return ret;
 }
 
 static void pxa2xx_mmci_write(void *opaque,
@@ -341,6 +357,7 @@ static void pxa2xx_mmci_write(void *opaque,
 {
     PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
 
+    trace_pxa2xx_mmci_write(size, offset, value);
     switch (offset) {
     case MMC_STRPCL:
         if (value & STRPCL_STRT_CLK) {
@@ -368,8 +385,10 @@ static void pxa2xx_mmci_write(void *opaque,
 
     case MMC_SPI:
         s->spi = value & 0xf;
-        if (value & SPI_SPI_MODE)
-            printf("%s: attempted to use card in SPI mode\n", __FUNCTION__);
+        if (value & SPI_SPI_MODE) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: attempted to use card in SPI mode\n", __func__);
+        }
         break;
 
     case MMC_CMDAT:
@@ -442,7 +461,9 @@ static void pxa2xx_mmci_write(void *opaque,
         break;
 
     default:
-        hw_error("%s: Bad offset " REG_FMT "\n", __FUNCTION__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: incorrect reg 0x%02" HWADDR_PRIx " "
+                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
     }
 }
 
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 1fc0bcf44b..6eca3470e2 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -3,3 +3,7 @@
 # hw/sd/milkymist-memcard.c
 milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+
+# hw/sd/pxa2xx_mmci.c
+pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
+pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
-- 
2.15.1

