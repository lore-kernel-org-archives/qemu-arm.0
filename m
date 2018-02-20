Received: by 10.28.71.27 with SMTP id u27csp1373243wma;
        Tue, 20 Feb 2018 10:05:06 -0800 (PST)
X-Google-Smtp-Source: AH8x227S9Trnm2UeyN4bAMOK95k2O9ccen6eIRN5No5O+MmQnpq0aatqjczcpy85ifgeh63e//Im
X-Received: by 2002:a25:ae5b:: with SMTP id g27-v6mr437718ybe.79.1519149906134;
        Tue, 20 Feb 2018 10:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149906; cv=none;
        d=google.com; s=arc-20160816;
        b=0QRF6q15NfAidA732bwfnvbG2XKoaDhBW8Squ491/VVeLXrapzKyYXIDYdlUO1lcCo
         Agja1N6hDQO4Aq4XSf1QHpqOa0eDo0dab14atHG7W1iwbUXw6STs6D6poGBIDZonAX/X
         YDYkvLVDtAn15CK2XO+APQzMbntTjP2BqvKN38pksgqTF8hXYvb+zcx//VDqUjvy5Sgx
         C3f9I0MCo6lGSBxHdE30V5CDvPk4/b81BdeDPKwA4jJmYiwTpO63szmN4T8YdLP+bFHN
         KwcvG7zxPjH3pa9bXdRY8+so1HmsWoldIIQD04Ar9cSn3+Y8F/vhtz6PFWX3SKVPp1KM
         AyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Nu0uc5UQoBK0lrd4Q3Zr+Xjg7pTQ4WDc2ujZf06wKdo=;
        b=BP9xd9fNwL4wMicJhZ5COgAbvjuJRFo66Cg/FaaY+Qq+x9LusbwjfyFbqzA/NpwZOY
         XWu0JP0xhObQ4qft+LKODiDZZu/nAu/VSnHmKnJQrt7XZgoTMEkmCMR35iaLB2hO46nb
         Y5sDD0WP6V1I51t2IWjztjUGY5FXSWwAzFwKeCoC660SKaM8u2zIqQ0juultH7DtB3SJ
         pSG7gKyPED6zRoy9aFIVC/Kpb9z2dxUSGo6PPGpHZ90zDE+wnu4LSDlXuFFkdNf5DAYJ
         uqG2FV9fEnRsRFcLm5qeSPyO7clbVV7YMGcUhPVrEenttwIM8cTMzzdPZK4FSCUMOYnD
         qVLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x12si33885ybk.677.2018.02.20.10.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCHp-0000jh-D1
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:05:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGU-00089y-GO
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGT-0001dn-ES
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGT-0001br-6L; Tue, 20 Feb 2018 13:03:41 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGK-0008SA-RT; Tue, 20 Feb 2018 18:03:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:15 +0000
Message-Id: <20180220180325.29818-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/19] hw/misc/unimp: Move struct to header file
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
X-TUID: pZv/SuYVrAyU

Move the definition of the struct for the unimplemented-device
from unimp.c to unimp.h, so that users can embed the struct
in their own device structs if they prefer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/unimp.h | 10 ++++++++++
 hw/misc/unimp.c         | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 52e068ec3e..2a291ca42d 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -12,6 +12,16 @@
 
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
+#define UNIMPLEMENTED_DEVICE(obj) \
+    OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
+
+typedef struct {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    char *name;
+    uint64_t size;
+} UnimplementedDeviceState;
+
 /**
  * create_unimplemented_device: create and map a dummy device
  * @name: name of the device for debug logging
diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index bcbb585888..1c0ba2f0a7 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -18,16 +18,6 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 
-#define UNIMPLEMENTED_DEVICE(obj) \
-    OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
-
-typedef struct {
-    SysBusDevice parent_obj;
-    MemoryRegion iomem;
-    char *name;
-    uint64_t size;
-} UnimplementedDeviceState;
-
 static uint64_t unimp_read(void *opaque, hwaddr offset, unsigned size)
 {
     UnimplementedDeviceState *s = UNIMPLEMENTED_DEVICE(opaque);
-- 
2.16.1

