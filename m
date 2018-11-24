Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3063428wrt;
        Sat, 24 Nov 2018 00:40:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U7BQ8kpNSakhj3Od+43p6z96T4OfDDM0OcHltr7qYb3bSsHRxGmmXnO43H2ccLqKcDejcz
X-Received: by 2002:a25:4457:: with SMTP id r84-v6mr9423995yba.192.1543048853181;
        Sat, 24 Nov 2018 00:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048853; cv=none;
        d=google.com; s=arc-20160816;
        b=Gqta/BJtLr/Blc7IoUME5EikiW6o5JIyt65ZqioO/CJgqHM66RjWvTc7814ALLSsmu
         mBtL1hkyyqrla4Ibxm7SX3QiW2buGdPsxcKTSsTKKkCYVx3D4cicGIn+wByA3OgSRCCy
         ygV0CIL5s82KzahGQ0cjGWHNNcW2NRoOmau8ewxNDUOaBmfiWGToCqW7mm2drAOh44iO
         +HbyAxCDAxXhC1aID7DHgbvgXsnYZZXW6YRO8gioDHbks/3VSK4CgvVji2zQQqeLa7K5
         /Y+j9iRqeNHKn06Yr7fpYsLjocgCi7YaCY1FP7WKuHLZgHxoRLiVDsIBBVMhHXsUC8mM
         OrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=FVQbZM7i3+Um9VORw4GH/QYP55eUVm3cX0wnz9vI/+A=;
        b=C6C462CH/K8koF2qiBfxOaZ1hYz06ce1KqppQmfkx6NVofn+POUExmRANPalka1+MO
         c8Kof1cDZjaYVeq4aU3JrgA9nxiu5ayOiOFXCWUtUGGzmoXRWonnJW4MDmlVIGmf1ivl
         /X0QkZ12dTtXXfEH5swgvXzmkrb5NFrBJ/u1ecjIfvly+nDuoak4bhVydaRoaa0QTIwd
         K++h1Wr86V7UEAyNtVnoC2NMVNTUc8NplNYeNOn6zC6jIv6c21J+4uR7bI4CXUf8HCQw
         smoBcZhrhdSW1U4K5TIdOXkjqt7Hb7xPSp8xB//8j/qVzAain3Dd2xffzemyF2t/3xJo
         naVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a201si15907101ywa.415.2018.11.24.00.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTUi-00032e-Io
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:40:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUG-0002ZA-HW
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSZ-0000En-GV
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:38:43 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:17068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSZ-0000B4-5L; Sat, 24 Nov 2018 03:38:39 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 174ACB70F3C75C59699A;
	Sat, 24 Nov 2018 16:38:37 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cTHm035015;
	Sat, 24 Nov 2018 16:38:29 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391610-12702401 ;
	Sat, 24 Nov 2018 16:39:16 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:15 +0800
Message-Id: <1543078821-16636-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:16,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:10,
	Serialize complete at 2018-11-24 16:38:10
X-MAIL: mse01.zte.com.cn wAO8cTHm035015
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V8 04/10] hw/misc/pvpanic: moving structure
 definition to header file
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jCKRPfX2gMb7

Move structure definition to header file uniformly

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/pvpanic.c         | 16 ----------------
 include/hw/misc/pvpanic.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 2bcbfc5..aaa8b0c 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -27,9 +27,6 @@
 /* The pv event value */
 #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
 
-#define PVPANIC_ISA_DEVICE(obj)    \
-    OBJECT_CHECK(PVPanicISAState, (obj), TYPE_PVPANIC)
-
 static void handle_event(int event)
 {
     static bool logged;
@@ -45,19 +42,6 @@ static void handle_event(int event)
     }
 }
 
-#include "hw/isa/isa.h"
-
-/* PVPanicISAState for ISA device and
- * use ioport.
- */
-typedef struct PVPanicISAState {
-    ISADevice parent_obj;
-    /*< private>*/
-    uint16_t ioport;
-    /*<public>*/
-    MemoryRegion mr;
-} PVPanicISAState;
-
 /* return supported events on read */
 static uint64_t pvpanic_read(void *opaque, hwaddr addr, unsigned size)
 {
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 66dbdfe..066c707 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -13,12 +13,24 @@
  */
 #ifndef HW_MISC_PVPANIC_H
 #define HW_MISC_PVPANIC_H
+#include "hw/isa/isa.h"
 
 #define TYPE_PVPANIC "pvpanic"
 #define TYPE_PVPANIC_MMIO "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
+/* PVPanicISAState for ISA device and
+ * use ioport.
+ */
+typedef struct PVPanicISAState {
+    ISADevice parent_obj;
+    /*< private>*/
+    uint16_t ioport;
+    /*<public>*/
+    MemoryRegion mr;
+} PVPanicISAState;
+
 /* PVPanicMMIOState for sysbus device and
  * use mmio.
  */
@@ -30,6 +42,9 @@ typedef struct PVPanicMMIOState {
     MemoryRegion mr;
 } PVPanicMMIOState;
 
+#define PVPANIC_ISA_DEVICE(obj)    \
+    OBJECT_CHECK(PVPanicISAState, (obj), TYPE_PVPANIC)
+
 #define PVPANIC_MMIO_DEVICE(obj)    \
     OBJECT_CHECK(PVPanicMMIOState, (obj), TYPE_PVPANIC_MMIO)
 
-- 
1.8.3.1

