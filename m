Received: by 10.223.172.38 with SMTP id v35csp2016417wrc;
        Sat, 16 Sep 2017 09:46:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA4NfJwoIIeZlOK+UUZgSSiGhP66VjnKO4Rkv1/0q1Q3zEuYf0MJ7T/IaggMzt/b5EoInzL
X-Received: by 10.233.230.1 with SMTP id z1mr13760439qkf.22.1505580377586;
        Sat, 16 Sep 2017 09:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580377; cv=none;
        d=google.com; s=arc-20160816;
        b=PK3q+Y5xw9JSzhqx7/QQYfMIXBMaDfWMfOR5p5rA1nyiHOYFHqJPSkHgOfEUgWEhhL
         4+kAvEwCD+NQKtffSmHZJ6MDpW/dShh1pPEYMqHb420O5IwyFA1K5PYMVa8xaMfMFAH/
         3RhoS3gsUJFmjPDCAYizrSNscbtLCqC6wBM1JCKK8K51AfsQUsxFol6NFgA1VsFbj6bo
         ARci1mn66+WDgJbQMQDFsdb5Mhzhh9taMrx6/fKdKZaSEWW2euM7bM14yLuzIPSY2SnL
         eC8rsDKjve7mOBsQh3MlGGLz1N6Buu3UgBPkTGc1ctq8nDUgubGpyDKqHKkW5mTAn7WI
         r0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qIXrrER2IcJcgl7JBQodbpZnQzXPjRFqzg1DmYJeCfg=;
        b=jVXDDFTOAjSaS2BUWofIgAj/VjGGy7ogYkyzWxBYkJlP9+rAeLI1ULpfkRI8oiY5MS
         X0c1VgPxm9cPYvpUKsAeqc7MpCGXQSyTCMfiv+BWdjdWC7Yo75wFGOxe7PSC7zBD7fwy
         Kd5/EkxJpDzJkQtk6EvAjP1qRyRlx6lCYCZ7w/plAgX4v0FTMGHAku/tvbs0uOSuupTt
         xVVP+mzHu2HqOD67li+QQNnonGU4waNiCRGbsjft7mTKlXiiaWWuKM8LdrX1eyI9ArKe
         qkYobdjy+J8LxwrdO6kda0v5/A5877dulBsDfvI4KraLWosGIjQNUEbOq8oeRg6WncRE
         ltpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l38si3613294qtk.138.2017.09.16.09.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGER-0008Fe-7J
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:46:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEC-0008Dk-Lq
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEB-00078Y-St
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGEB-00075o-M3; Sat, 16 Sep 2017 12:45:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGE1-00016I-H6; Sat, 16 Sep 2017 17:45:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:16 +0100
Message-Id: <1505580378-9044-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/6] hw/timer/omap_gptimer: Don't use old_mmio
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BjVUdAhjP5zI

Don't use the old_mmio struct in memory region ops.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/omap_gptimer.c | 49 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index 5e3e8a6..6d7c8a3 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -450,19 +450,44 @@ static void omap_gp_timer_writeh(void *opaque, hwaddr addr,
         s->writeh = (uint16_t) value;
 }
 
+static uint64_t omap_gp_timer_readfn(void *opaque, hwaddr addr,
+                                     unsigned size)
+{
+    switch (size) {
+    case 1:
+        return omap_badwidth_read32(opaque, addr);
+    case 2:
+        return omap_gp_timer_readh(opaque, addr);
+    case 4:
+        return omap_gp_timer_readw(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void omap_gp_timer_writefn(void *opaque, hwaddr addr,
+                                  uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 1:
+        omap_badwidth_write32(opaque, addr, value);
+        break;
+    case 2:
+        omap_gp_timer_writeh(opaque, addr, value);
+        break;
+    case 4:
+        omap_gp_timer_write(opaque, addr, value);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static const MemoryRegionOps omap_gp_timer_ops = {
-    .old_mmio = {
-        .read = {
-            omap_badwidth_read32,
-            omap_gp_timer_readh,
-            omap_gp_timer_readw,
-        },
-        .write = {
-            omap_badwidth_write32,
-            omap_gp_timer_writeh,
-            omap_gp_timer_write,
-        },
-    },
+    .read = omap_gp_timer_readfn,
+    .write = omap_gp_timer_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

