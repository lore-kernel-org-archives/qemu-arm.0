Received: by 10.223.134.117 with SMTP id 50csp12126862wrw;
        Wed, 3 Jan 2018 08:42:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCvrJwmAPKs/ZllANHR8TljpR7X5ZXtb4sE9E26bUOXrfubXMsf7ReevP/ohtDEkgoT9JG
X-Received: by 10.129.48.202 with SMTP id w193mr1851926yww.378.1514997727660;
        Wed, 03 Jan 2018 08:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514997727; cv=none;
        d=google.com; s=arc-20160816;
        b=PVtFN6fipZ7fcpwbkmGCK7dxSzEryv1s2besMS9+oSWYmQ7SWD4JTmiqb/zqq+OGId
         WCaZpB8RkAPSQ5z1IQtOi0SdFxHB5QhbGsMMchCjoFT9cQZ8yeHbV8lSmgbmcPD9DAHy
         JrbQItVoDeBpQCU5mtASfdCWEkQFGqCOaPVBONDD1AoO1GGr+ZcN17q4zeXa69U/eg2P
         h19DU7tieKkA7v2GF9b5n0nbqu/rSVqHefjTeAiN6LfBmZhc8x3dbVPrUFdRLt93A77m
         fdpHOOJaee1hcdkYzIUwqXz/uuDMAf0WEi3ZIG8FiR1io3+JyB/11kNTNvl0vZtMVTHy
         /AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kp0v9BZBdkpa54HNbA4v69D2pn6p6erAf7fA8SMR8YA=;
        b=rHcbMj6ejJOC9BB5+Wnyv+6Jxjgqk1CnEJcL/i3l4IdQ3nCRZUgCyUVokWnFajNAZ+
         P3IPKcscunBSTBoEicYnj+L5S6P6bacgndBvzHWrEixrIYyQfre7E24FECcseaB1V1n0
         RyHe7liJvHoFEBuz/oHrMWESGvP0lZOdO6w+ZooDnWZmQxE9UFJPhNlcyTms+JOoYjOc
         apnDFCAnpmDeybVD3KkVVFtojuhrc+LPXnGgs5WrFdlEEOar7DCi/dR0Ca2fOdsnY0yk
         AbQi9PHw/nYewL2fzClUPannuVqdzrNR9hg2WGzrkPY1qqqe30aKr9Sqq7oaoeXB+LV1
         0fkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dL3LCTmk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si283998yba.548.2018.01.03.08.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dL3LCTmk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWm7D-0005iW-16
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:42:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6e-0005eu-3Z
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6d-0007hL-4w
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:32 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6c-0007h4-VK; Wed, 03 Jan 2018 11:41:31 -0500
Received: by mail-qt0-x244.google.com with SMTP id k19so2789739qtj.6;
	Wed, 03 Jan 2018 08:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kp0v9BZBdkpa54HNbA4v69D2pn6p6erAf7fA8SMR8YA=;
	b=dL3LCTmk+l1xpVJ2KlK0LvXPlHIPzWZ8jpPmUKpMhfxyKa0rgQuMRzhQ6etPpM5mJ6
	vHG6+L+0QEs9riMLbaBxcuAYzyXgQR2WqaXwBP5i1OLqkT2ahdvTRbu8JnxjgBhbl+P+
	tpQKRSCwwmnF6pSDLPjj2KLnliYl12s/aEMD3tAhvCeN4FWkjzkB07RhLq6LpeOS4IUM
	oRtTZkyMz5/PBhV+kqCbKxwPtps/k83KU70n9kEJmLjWcxMNFop/NpGBKCBaZNhSJ4aH
	Cdpv6qxVW5v9yKGMdr148zb4se8gs+9ou5iWxnqqyIyQSlTTy543ocDDca6TllomIXQz
	8Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kp0v9BZBdkpa54HNbA4v69D2pn6p6erAf7fA8SMR8YA=;
	b=ZVDsSFrZrSCcl3cWHQcEAc3VFzI5cwVx1hBC/w2T3iMyhASIzA6Sn6O7O5SP0xQ5Mn
	hjNS5INpOLIyKCMd82vsN75la3ZelYpFDdOqwx6hDCkEeFgib162eHGivOkztCTkUmc2
	Mh+BLTdYy2XuXBfUsEbrQcx8DAWzoP+I1z1Usx5h1T2lN5F9qPPZTkahp3UeWyqgduHp
	QoWINHafPNA9iMzAC9ilkNq4lkKuxGDmWWjIKNmP+Nsmy6Q9EroK0ou9XO0Q/RQxNSy3
	Hv213SxQwUIYdyrsJs/Vp8haNACErlzp79Jb0suf76kofyAmxCEdS14lhFJbOh/EVidb
	6HMw==
X-Gm-Message-State: AKGB3mK7oiNaPlz7YDXsPwvVJGoXoxWTofeLff/mnY66TBDFPWHoBAP3
	n5lc999CGo5dt3PcLLYgGzI=
X-Received: by 10.200.3.194 with SMTP id z2mr2497171qtg.309.1514997690295;
	Wed, 03 Jan 2018 08:41:30 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id a67sm846643qkg.64.2018.01.03.08.41.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:41:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 13:41:17 -0300
Message-Id: <20180103164117.11850-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103164117.11850-1-f4bug@amsat.org>
References: <20180103164117.11850-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH 2/2] hw/sd/pxa2xx_mmci: add read/write() trace
 events
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90Dodeib2rhU

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pxa2xx_mmci.c | 63 ++++++++++++++++++++++++++++++++++-------------------
 hw/sd/trace-events  |  4 ++++
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3deccf02c9..0759a0d2eb 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -19,6 +19,7 @@
 #include "hw/qdev.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "trace.h"
 
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
@@ -278,43 +279,55 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
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
         ret = 0;
         while (size-- && s->rx_len) {
@@ -324,16 +337,19 @@ static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned size)
         }
         s->intreq &= ~INT_RXFIFO_REQ;
         pxa2xx_mmci_fifo_update(s);
-        return ret;
+        break;
+        ret = ret;
     case MMC_RDWAIT:
-        return 0;
+        break;
     case MMC_BLKS_REM:
-        return s->numblk;
+        ret = s->numblk;
+        break;
     default:
         hw_error("%s: Bad offset " REG_FMT "\n", __FUNCTION__, offset);
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

