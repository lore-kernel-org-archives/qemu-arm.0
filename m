Received: by 10.223.172.38 with SMTP id v35csp2016447wrc;
        Sat, 16 Sep 2017 09:46:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC48bt+oI0CJknqM0Yst8oQqqNTvW1bgNqkamoEsknAHZK7AC0Rfdsb0EiOyTDzZcy1wE1A
X-Received: by 10.200.47.216 with SMTP id m24mr36308518qta.331.1505580380772;
        Sat, 16 Sep 2017 09:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580380; cv=none;
        d=google.com; s=arc-20160816;
        b=reHMu0kJA9q+Z8xEL/aCE0eJjvt2DTJ7M8/i4hUytoKX86evg/Z4Zf+0po0c9oleCf
         4aemgwqqwAb0uGKJn0KSswV8Y7gNcuM+n5Fp4Jslb9eKZd+rSC8omcdgMFoPjcV0iQv9
         UBlDUoLiK8LEOTAnEtcQrhsucNHZC0yQEaAnxPAqFRH3b/HcB9Z8trMHwhel6eyZd1HW
         COnrrwpJxr7fG8bU0aiqst/cdh+YOqOYZ3NWi4fcIKERtaqLH1vlI1a/zLTXrC3h2om2
         EYAQbeiLWRcUsDEONdsNO4yegOmiqYZ28kMUb34wHr34Cif3KibwSsdpEwZh7bNorkEH
         cT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PKdAAGH0o/7tw6ZHPHLLuE90WfmeHs4Xx+QYKatu3gQ=;
        b=XYsEy//HQBCadJSwiGgykXeG7sLFrbVKW1WqTCpTSD3M1zpRZCgfuTq3rxXulg2BTv
         5zVWeA/7PCnG5ULGku0/P2hgkQ9YNobBu/oeW1EVbg8CPpgKsMLWx3fjSvoRs+/WGYs9
         V0MyPosgTr+RuqwNxNm/Zqxye2+ysDlYspzzAbTTBGrj58I+uOcbF/VWdc0xY881zjaJ
         CdseiIhBPy+mA+jV2mvnpQPiudWnIccyWi5TGVbEjHe6GelJd2sZ3W1huo6z6bmILWl7
         mLxTGZvAHr9Z6lA0OB9JUguhJ32vfbu+pweCSfvYH8Zy5yP8MaIBPzOPBW3UY2+BDsDT
         kytQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n34si3621788qtb.277.2017.09.16.09.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGEU-0008G7-HT
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGED-0008Dw-Su
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGEC-00079A-QW
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:46:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGEC-00075o-Kh; Sat, 16 Sep 2017 12:46:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGE0-000163-RP; Sat, 16 Sep 2017 17:45:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:15 +0100
Message-Id: <1505580378-9044-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/6] hw/timer/omap_synctimer.c: Don't use old_mmio
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
X-TUID: n48XI5AfW3lf

Don't use the old_mmio in the memory region ops struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/omap_synctimer.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index 9ee6519..0d75a90 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -68,25 +68,32 @@ static uint32_t omap_synctimer_readh(void *opaque, hwaddr addr)
     }
 }
 
-static void omap_synctimer_write(void *opaque, hwaddr addr,
-                uint32_t value)
+static uint64_t omap_synctimer_readfn(void *opaque, hwaddr addr,
+                                      unsigned size)
+{
+    switch (size) {
+    case 1:
+        return omap_badwidth_read32(opaque, addr);
+    case 2:
+        return omap_synctimer_readh(opaque, addr);
+    case 4:
+        return omap_synctimer_readw(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void omap_synctimer_writefn(void *opaque, hwaddr addr,
+                                   uint64_t value, unsigned size)
 {
     OMAP_BAD_REG(addr);
 }
 
 static const MemoryRegionOps omap_synctimer_ops = {
-    .old_mmio = {
-        .read = {
-            omap_badwidth_read32,
-            omap_synctimer_readh,
-            omap_synctimer_readw,
-        },
-        .write = {
-            omap_badwidth_write32,
-            omap_synctimer_write,
-            omap_synctimer_write,
-        },
-    },
+    .read = omap_synctimer_readfn,
+    .write = omap_synctimer_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.7.4

