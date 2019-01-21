Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6401808wrt;
        Mon, 21 Jan 2019 11:21:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7echCYcHpGzh6lYxangkoERqUmM0DUg3JHpsnvBkQcHuwPRiny+QVHoUOb7qkSIFb95srC
X-Received: by 2002:a5d:694d:: with SMTP id r13mr75113wrw.323.1548098466347;
        Mon, 21 Jan 2019 11:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098466; cv=none;
        d=google.com; s=arc-20160816;
        b=wwdU3EhHjWNoJnTlU5Km5gIlXg2Iomj03dzRq0O9uGPA2mP560rH4IpFJc6PxdvS2w
         8Mqf0NtQ5g38GVNQUooWwSAH4xxyi3UYKorIH+lvQhqh0eK4qty7CcgW9+Ho2v4QNPbX
         UaaDMuskLSWPh15xymsPU2+exqkus3C6bcGV2aPqn2rgyOZNf70gHo1r5fT4LbKKiZz3
         bz60Q8A8Y+DhQ8+uzpwTPchAPWo0sg0KkHk06FxMCip7MhHtLliMEwfW97Ncn3ucYjQy
         kHIo5MtZeVjX8Qb11NJLtYCB7m2K/gR/qZjCrCD6O/9mlfKf0ki6I/WtS0NYx8Q6CCfj
         DUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8/8nrDNxFDGGiKzCXqhPzki/Hbmqf6CuZf0plZpfE7M=;
        b=aqSP/Z6YzxPRLQDWcu/C1UaLoeQM4gT69Y0Yf7Wz5jOolqDiOgJK0PicSPJADW/tVD
         fVb/KYHcNhsZZfUNzbJVOj1xiCJ1Wm0oE4u1z/83Se+3c277dgZwiu2QJ3ohYlx0l9Fo
         QLN2RCxcl+HhlRIwdl8eS0/N/ooogFL2fogfFb75pblapT08huuvOrFNdw7Y7b8Qav9c
         yCh49ZYZXAR0tZVPE3FDTeS6ZdgyB2YQ6B3zHFua6KsYWJqcFP2Hlz30DNhXMX9WR/YL
         GiKwdfLO4tKzzIofJjNp7atlz4CDxXie7HVng2bUG1lJrBxdRhHjzycjKXBM1JZk24D2
         iK4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvIAnboj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y74si32871046wmc.97.2019.01.21.11.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:21:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XvIAnboj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf85-0002Cu-9x
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevV-0008OY-TK
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefT-0002dx-77
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefR-0002bN-C1
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id f188so11783800wmf.5
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8/8nrDNxFDGGiKzCXqhPzki/Hbmqf6CuZf0plZpfE7M=;
	b=XvIAnboji2u7aobGX3RE5JSxCNVqGBP1JBOfYm4yjDB2ljtp5oDzEEj5FM9j/R0MAj
	K101rhiL0ot6tc63jnBc58PF8Ms+fwyTWhJ5eglyo36AGQ7GOliWyjIrz3pupx9xq+xA
	4MPfHSveN1ZfpshNq1bLtyTo33sIhOMtEOTkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8/8nrDNxFDGGiKzCXqhPzki/Hbmqf6CuZf0plZpfE7M=;
	b=M9zxTRK02OWATL3YZjrUoVcP3GcCkc+V+/TOy7zy4lOK27yzIKwrNbzFKztQ0QxwGO
	XAW6InHvh+qSeZv38wYpCJ6JwRtST8ifi+5Zf1nhKAqGghN7G+zOXRPOoijeGUVzeEdv
	UiD5RiYVHvQ1JWmp8jmvTkLnc5CVblMd43VYCl1BMX3RuNBd/YaC0HOpbZTH8LQpudlR
	k9/Zv7ToQLFg4N1GtFHQNB/MxK7X+P2TXMkyl9mP6+crsuzIFiuGItT6Duc+YgTVSrAL
	7DX4MFwIm6V/3tKChT0EYYA3qcb7o98Fprka1dYxE2dhdRx7nDplA+uykIcR4zyuO4sO
	aZFg==
X-Gm-Message-State: AJcUukc+ekUf8hcmtYItgb57gH4pfn04QDmyf66EuccYAswOnyjBV8Ee
	CdOLKWUxILyp/2vVR76Zasbjb6Vl61Izig==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr550689wmc.55.1548096686163;
	Mon, 21 Jan 2019 10:51:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:00 +0000
Message-Id: <20190121185118.18550-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 05/23] hw/arm/iotkit: Refactor into abstract base
 class and subclass
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
X-TUID: PCCPl9tNg8St

The Arm SSE-200 Subsystem for Embedded is a revised and
extended version of the older IoTKit SoC. Prepare for
adding a model of it by refactoring the IoTKit code into
an abstract base class which contains the functionality,
driven by a class data block specific to each subclass.
(This is the same approach used by the existing bcm283x
SoC family implementation.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h | 22 +++++++++++++++++-----
 hw/arm/iotkit.c         | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 9701738ec75..521d1f73757 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -74,15 +74,15 @@
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
 
-#define TYPE_ARMSSE "iotkit"
+#define TYPE_ARMSSE "arm-sse"
 #define ARMSSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARMSSE)
 
 /*
- * For the moment TYPE_IOTKIT is a synonym for TYPE_ARMSSE (and the
- * latter's underlying name is left as "iotkit"); in a later
- * commit it will become a subclass of TYPE_ARMSSE.
+ * These type names are for specific IoTKit subsystems; other than
+ * instantiating them, code using these devices should always handle
+ * them via the ARMSSE base class, so they have no IOTKIT() etc macros.
  */
-#define TYPE_IOTKIT TYPE_ARMSSE
+#define TYPE_IOTKIT "iotkit"
 
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
@@ -143,4 +143,16 @@ typedef struct ARMSSE {
     uint32_t mainclk_frq;
 } ARMSSE;
 
+typedef struct ARMSSEInfo ARMSSEInfo;
+
+typedef struct ARMSSEClass {
+    DeviceClass parent_class;
+    const ARMSSEInfo *info;
+} ARMSSEClass;
+
+#define ARMSSE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(ARMSSEClass, (klass), TYPE_ARMSSE)
+#define ARMSSE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ARMSSEClass, (obj), TYPE_ARMSSE)
+
 #endif
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 9360053184e..d5b172933c3 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -18,6 +18,16 @@
 #include "hw/arm/iotkit.h"
 #include "hw/arm/arm.h"
 
+struct ARMSSEInfo {
+    const char *name;
+};
+
+static const ARMSSEInfo armsse_variants[] = {
+    {
+        .name = TYPE_IOTKIT,
+    },
+};
+
 /* Clock frequency in HZ of the 32KHz "slow clock" */
 #define S32KCLK (32 * 1000)
 
@@ -732,29 +742,43 @@ static void iotkit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(klass);
+    ARMSSEClass *asc = ARMSSE_CLASS(klass);
 
     dc->realize = iotkit_realize;
     dc->vmsd = &iotkit_vmstate;
     dc->props = iotkit_properties;
     dc->reset = iotkit_reset;
     iic->check = iotkit_idau_check;
+    asc->info = data;
 }
 
-static const TypeInfo iotkit_info = {
+static const TypeInfo armsse_info = {
     .name = TYPE_ARMSSE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ARMSSE),
     .instance_init = iotkit_init,
-    .class_init = iotkit_class_init,
+    .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_IDAU_INTERFACE },
         { }
     }
 };
 
-static void iotkit_register_types(void)
+static void armsse_register_types(void)
 {
-    type_register_static(&iotkit_info);
+    int i;
+
+    type_register_static(&armsse_info);
+
+    for (i = 0; i < ARRAY_SIZE(armsse_variants); i++) {
+        TypeInfo ti = {
+            .name = armsse_variants[i].name,
+            .parent = TYPE_ARMSSE,
+            .class_init = iotkit_class_init,
+            .class_data = (void *)&armsse_variants[i],
+        };
+        type_register(&ti);
+    }
 }
 
-type_init(iotkit_register_types);
+type_init(armsse_register_types);
-- 
2.20.1

