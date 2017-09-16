Received: by 10.223.172.38 with SMTP id v35csp2017803wrc;
        Sat, 16 Sep 2017 09:48:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC5cO0cQThisDc0aYpZkoYE5l5fIV/YbBYQt7apI2dddRGL0pdTSOzEVgdAMUVb9iURTJQg
X-Received: by 10.55.156.79 with SMTP id f76mr13307002qke.298.1505580495904;
        Sat, 16 Sep 2017 09:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580495; cv=none;
        d=google.com; s=arc-20160816;
        b=K8YxKz/fyWuaAwpZlN7Gy09ebDEDbyorNe9FW7PbYHrhdpt6zPPWfzitJcov8X2O3b
         M0yhZLXyij7La2ZuVbQ5xbyXjzmEbyRgd0mcJgIW86rTlWlPULcKcGC2pezylJ0T9fIq
         iq+swRH7xLMsn7LxGcOm+DlAXtLD31wXPARZfmIrshRz1Nt39Pvbfv0HiGTZ4gsR+DCz
         od6HwzrOwJo5xy39idXhSgsjU9QI3aCB9Jk9dTmJeOAAW7ryzRyaIG3aErhvqf8J6A8y
         Zbs92aFeV+Iiq5wUfnrUXGosFBOgQ95fMHist9D59DFe1PO1LVNYMMVnbnH0X2HgQ9hW
         QgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sbevA5BWogLLpJSXjYD1zGiwxLp2kS6Wf9YWUjPFYoA=;
        b=C3oTypbn5gA2rDpViWvfzS4cJ8o1YFAeNhcFiaPh+y6zvtDfTFlA268gKdeghg/0+0
         5AwEYxM2B3rg3C4OTtJQzUhQ0kRvFiiFFocnmJEdtfqsbEtjyo2lD3dYuknArjrs19Sm
         2AonMLNwcRLEI7e/Z/OA1l0tVc/oPjX0bNOcZ8ZgnkEy5UrySRT3O9e1TIX9yH1OVRqz
         e6oflF5cClPi8yaZPmMkV5ibmxLaIvByzObzBGlPbzyHQLpbRS1X5C+6PfjlQGI1WTUA
         Qz6fk10mOCiYv2bHURLh7lMZJ+04yq7zzWcrlPJeT/+fEMHz812QHyTf/+sFokDZYmWb
         RZyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si3348236qke.146.2017.09.16.09.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGGL-0001PR-KO
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEB-0008D7-Oo
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEA-000785-TQ
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:45:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGEA-00075o-N8; Sat, 16 Sep 2017 12:45:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGE2-000171-5a; Sat, 16 Sep 2017 17:45:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:17 +0100
Message-Id: <1505580378-9044-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/6] hw/i2c/omap_i2c.c: Don't use old_mmio
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
X-TUID: gxf93178ULAj

Don't use old_mmio in the memory region ops struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/omap_i2c.c | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index f6e80be..12264ee 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -430,19 +430,39 @@ static void omap_i2c_writeb(void *opaque, hwaddr addr,
     }
 }
 
+static uint64_t omap_i2c_readfn(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    switch (size) {
+    case 2:
+        return omap_i2c_read(opaque, addr);
+    default:
+        return omap_badwidth_read16(opaque, addr);
+    }
+}
+
+static void omap_i2c_writefn(void *opaque, hwaddr addr,
+                             uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 1:
+        /* Only the last fifo write can be 8 bit. */
+        omap_i2c_writeb(opaque, addr, value);
+        break;
+    case 2:
+        omap_i2c_write(opaque, addr, value);
+        break;
+    default:
+        omap_badwidth_write16(opaque, addr, value);
+        break;
+    }
+}
+
 static const MemoryRegionOps omap_i2c_ops = {
-    .old_mmio = {
-        .read = {
-            omap_badwidth_read16,
-            omap_i2c_read,
-            omap_badwidth_read16,
-        },
-        .write = {
-            omap_i2c_writeb, /* Only the last fifo write can be 8 bit.  */
-            omap_i2c_write,
-            omap_badwidth_write16,
-        },
-    },
+    .read = omap_i2c_readfn,
+    .write = omap_i2c_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

