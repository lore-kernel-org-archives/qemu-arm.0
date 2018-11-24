Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3053166wrt;
        Sat, 24 Nov 2018 00:27:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5evCOQrjdJLvqdfQMoeADqfXC8AsEAwQdL+Bszx/N8EMOeDXUTyZKjrGrRxYOqoKQySYLG4
X-Received: by 2002:a0d:f302:: with SMTP id c2-v6mr20076112ywf.337.1543048045630;
        Sat, 24 Nov 2018 00:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048045; cv=none;
        d=google.com; s=arc-20160816;
        b=B4Yr4XEtwimktn7bRFj+z5a4lefbd46CyYGw9mz8F7j44ovwU9Mgip6FSnBwfoJ6mj
         zgQLtFOe7uIMez6KSahNr2skWb5D+HQ52XHac7ixjSLZzpdGgKne5ft8I6bpm4EbRLr/
         m75JI0ieS0yTTXImekVhngbpGDW6TvdrvWbwBpD0rHjR0Ss3GtJ855ll+ykrO3P9JoGp
         qDVORApmBqwt3m/b4Yu8Kn8XHij4rLhqkoQQqMjdWjatIdIbOTNmdJib2SqkPAr6RBgg
         HCYaw+TdNaNpC49Pt44vUdrGblJa7jibiQsUUY7BLQdZHVI6s1VRBBMfw0i47v4FP2fp
         uSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=FVQbZM7i3+Um9VORw4GH/QYP55eUVm3cX0wnz9vI/+A=;
        b=P9TvDmzUcevfIrGFwBuzr24eiloS0jxmtrPmf4/VkPIeEJsEbjkKoe6YnnaQ5ZUV++
         xku5+IsvOIN8uHpSyKkEohfZzz6qLJSKK15wFI8jb1d9KS3zD9GY+0/OEV3qwDeRoLeC
         czIni0gNN/LcSGIgD0TPDeb9Tl6oMAgG6ee4Psu19UOVQ2Hd02BfgjJ1M2IUr8rR7Uza
         DqJNiWKYn9/0Q+5dF4DTPC4WPEIX1cIUVT/POWET/O9OaHjsH3CwAME0PPZAcsIgToTO
         8UyEKWs75mvRkQTO/dIQrWrXoO9T/sLjxjne69t+8bZkLOr0eHBhELZOzTaV31LAokuu
         bXew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2-v6si34329923ywf.340.2018.11.24.00.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTHh-0005Wk-2g
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:27:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAq-0008Lg-Q1
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT47-0005rK-S8
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:13:24 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40464 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT44-0005fl-6U; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 0382BF38A598E43DE3D7;
	Sat, 24 Nov 2018 16:13:04 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8CufY023416;
	Sat, 24 Nov 2018 16:12:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416133747-12697202 ;
	Sat, 24 Nov 2018 16:13:37 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:27 +0800
Message-Id: <1543077273-16201-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:37,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:36,
	Serialize complete at 2018-11-24 16:12:36
X-MAIL: mse01.zte.com.cn wAO8CufY023416
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH 04/10] hw/misc/pvpanic: moving structure
 definition to header file
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 29ZIeUKlI0z/

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

