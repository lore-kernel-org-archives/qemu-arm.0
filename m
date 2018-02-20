Received: by 10.28.71.27 with SMTP id u27csp1376675wma;
        Tue, 20 Feb 2018 10:07:38 -0800 (PST)
X-Google-Smtp-Source: AH8x226ttQXG4Pnzg9r5DPNKdgU2EufXZWlTChJ54i/140Fa+yYhhXmlzU53If+k+GZg30jTCaVz
X-Received: by 2002:a25:32c6:: with SMTP id y189-v6mr447681yby.75.1519150058891;
        Tue, 20 Feb 2018 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519150058; cv=none;
        d=google.com; s=arc-20160816;
        b=d0ccHyulouEmWK7MnXwb5bF2MGOSZy+P7gdp08cojvGUOVfnscm0cCLr5rPOjnp/uh
         rnbk5BHxnlXl5Khp8hZPFISlLbg5FQKVH03Eh8EQbJ0tvjdVMheEwQs3eiFC+WrCujIV
         oBaHvXL1zcP9vLSGttKgG9mYopUsBJaXcN/neVTw18+tu7PvThEwYhXXT/gJ01M0K30w
         8RcANTkl2GF1TRLo4QmZdCsyxxAU0uZ+EVTSFFyaFyl6PDKZfbVsvrEs4Thub5HAN0Of
         DTxkqDVgrJqDyn7iMI9ETYQQJ9NkeCz29vwT2euBxUD+zyNh9MSxpsKjvlqw+PqHScit
         /sDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mh7dUpPyL0HYA3nleYLaiCNrahCcX6ec2JmtwubcgdI=;
        b=EANqPOlYVqCerv5JXUM3reeF/dW1FkCttBtirbhXeZfA9yTAOsWFXnzbf47Ho7Oubi
         Lk8K+IGeNGdhYLByI3G4vK5MoRK91q6PFAgr9IZI4thPN6JsHeP89kLR+EGWeAfvs/mX
         oENnp/kAme3iN43Ulde1lfjS/DKJcVzBhKiMoNGLnJMp8WTg1jqtI78YU1eODb+ZxuDO
         nSTO4O9yr6Z/jlyLm2X/aHsSp3RtshZtzef80OYvTbM2a2aSFK4f0vnnBAAujcopyctH
         ojyLsMhmEXDCmxNqdh3q3Bv86475nnxvcYFu8JKdv2lQ/P7095EzCzrjkR7bRgQZ9KuV
         QAWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g27si1426323ybe.57.2018.02.20.10.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:07:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCKI-000306-97
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:07:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGa-0008Ew-GB
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGV-0001gI-Fy
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:48 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGV-0001ae-6U; Tue, 20 Feb 2018 13:03:43 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGI-0008RC-2L; Tue, 20 Feb 2018 18:03:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:11 +0000
Message-Id: <20180220180325.29818-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/19] armv7m: Forward idau property to CPU object
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
X-TUID: +9te86cKey9u

Create an "idau" property on the armv7m container object which
we can forward to the CPU object. Annoyingly, we can't use
object_property_add_alias() because the CPU object we want to
forward to doesn't exist until the armv7m container is realized.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h | 3 +++
 hw/arm/armv7m.c         | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 35ab757264..5c3f406ccc 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -12,6 +12,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/intc/armv7m_nvic.h"
+#include "target/arm/idau.h"
 
 #define TYPE_BITBAND "ARM,bitband-memory"
 #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
@@ -40,6 +41,7 @@ typedef struct {
  * + Property "memory": MemoryRegion defining the physical address space
  *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
  *   devices will be automatically layered on top of this view.)
+ * + Property "idau": IDAU interface (forwarded to CPU object)
  */
 typedef struct ARMv7MState {
     /*< private >*/
@@ -58,6 +60,7 @@ typedef struct ARMv7MState {
     char *cpu_type;
     /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
     MemoryRegion *board_memory;
+    Object *idau;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index facc536b07..189066812c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -19,6 +19,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "target/arm/idau.h"
 
 /* Bitbanded IO.  Each word corresponds to a single bit.  */
 
@@ -162,6 +163,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
                              &error_abort);
+    object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -217,6 +223,7 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_STRING("cpu-type", ARMv7MState, cpu_type),
     DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.16.1

