Received: by 10.28.71.27 with SMTP id u27csp1374486wma;
        Tue, 20 Feb 2018 10:05:56 -0800 (PST)
X-Google-Smtp-Source: AH8x227JdRBotUPoOb0Elh4Fp4cxqYwFRHxqwfi/huERzUwg/2TTnY4Bsue5xMRul6DejLRe/5XP
X-Received: by 10.13.204.143 with SMTP id o137mr437964ywd.59.1519149956302;
        Tue, 20 Feb 2018 10:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149956; cv=none;
        d=google.com; s=arc-20160816;
        b=iSuN2rox5LgWMqqXqG3zu7Hxnj+9sGOjZZ0AZimFnb1J7jZbKtPSsf1LWb9whl3psx
         Nbt7GSvFUX6pv0vUKqwJGBmS7DSRp7ylli9FcCJ8jmA2wk1949IKsIj9jg5YlbN7nS2D
         5mIiac73tHAvHUdAEsunVxqPqcPIriaKFwnw+a+i+/4ovON3DxODv9NGDtAEdedWHOas
         pVW2jKM7f25qgechbQgRssc1SNDVvjzHcwI/63j23SE2D+8Jyn1iu/oHR4YOix8ozeZX
         Iiojf+XeNL9ysA4Wvg7Oi3oTLOlmJR9XAHSCNbyiphxb+vN5iV2DfacW+hBYlLjIZh9X
         J3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0Cbds/IGqZAFv9DEOSAMpbJmZBrT9NXXNd5pY9IBOVQ=;
        b=1Hk9/yyk6Syprn6XIDjJ/LE7k0lhyTAKxFvAb9+lr7c7ZATp49hDQsk6DA3TLtS+eT
         W522XMl/MUpD8FRyzI7bD/4HK7NxDBFnCksi9Vt0ASBNSt6dvLgm5+Z9tMOR/xP/TzbV
         jn5dhYP3U9SKQsuvilzJn5gSDAmg0fJto95luCk+7ZG1wn3COGQObqACUZdq1d6FKC+k
         TgPtn224FbapYN8VIRy+X155FNVJ4mDR5e2k0szuvDE/AixN6aAnkl23givT2cNDmWwk
         1DgkWYNyi15udb0FGywRs8IkjYXBd+lqT41YMLQsOsrGbWwIiGJ2NHA6ilARBglBC77E
         WQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x37si948532ywj.624.2018.02.20.10.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCId-0001Tx-Oh
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:05:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGW-0008AG-Tn
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGU-0001fs-SX
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:44 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGU-0001br-DI; Tue, 20 Feb 2018 13:03:42 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGJ-0008Rg-Ej; Tue, 20 Feb 2018 18:03:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:13 +0000
Message-Id: <20180220180325.29818-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/19] armv7m: Forward init-svtor property to CPU
 object
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
X-TUID: lthAyAiiFqIm

Create an "init-svtor" property on the armv7m container
object which we can forward to the CPU object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h | 2 ++
 hw/arm/armv7m.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 5c3f406ccc..78308d1484 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -42,6 +42,7 @@ typedef struct {
  *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
+ * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
  */
 typedef struct ARMv7MState {
     /*< private >*/
@@ -61,6 +62,7 @@ typedef struct ARMv7MState {
     /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
     MemoryRegion *board_memory;
     Object *idau;
+    uint32_t init_svtor;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 189066812c..149aa07cd5 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -168,6 +168,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+    object_property_set_uint(OBJECT(s->cpu), s->init_svtor, "init-svtor", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -224,6 +229,7 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
+    DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.16.1

