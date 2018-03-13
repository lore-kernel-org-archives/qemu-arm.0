Received: by 10.28.91.67 with SMTP id p64csp853454wmb;
        Tue, 13 Mar 2018 08:39:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsVP7AzCNxdDTfZpiDa3Hhy05KnZ0Lussyni+3nuF6aCsEtz3uaX7Badj+z9eOKm2xxK4Xn
X-Received: by 10.55.163.130 with SMTP id m124mr1662989qke.256.1520955599300;
        Tue, 13 Mar 2018 08:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955599; cv=none;
        d=google.com; s=arc-20160816;
        b=ADDYjmxZv+QMHfN6Qj816HFjc3GkQQihUtJsppjYMAfWNNJ+PI4RFM6ZJcj2UjIkov
         TyfjiunwI7b8sMpPdMgO9s5ujoFYv+BIfJlBpCBroH7ZLtw2nGUPTcoOIcVvos2o4eQH
         KX2pBj2h6m6hCmgeI24MXqoJod0PeWIvkAc+bhdxVNl8SC+D0R9V+Aeo86hIT7LFTgxB
         hfHiNT1gRWDhzbxHvaMpSNSIwJZDxr0u3TSiW1aI07yXJ85e23Ca8dVIBxzj/pvl5B2E
         DehDg0frC0c06G71tTXpIqoRmbOeZqDlWXS3BmtLa9XwKc8A+uWeYVk2k+NG1fW0D2Nu
         kAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nsIGKyyFidvC+AdTqJMdTWp859RnsqAZbaUyJ4NXijo=;
        b=Ytn20gs1lJ0aILS1WkesWlyDtTXXTQgfb0bk5T7mfqVaUMB103xhKoy6dFJQvdd5J8
         c/WPN2M4y0wXrEcoWnDtms5zNc316NR/M5834UgQKMmlUBUfJtZqYswUKqsy/EkzScpP
         mT/y2Skyr/abmHUAdGCstwx0k+dQLUThj/D00qMnmTNMnFy5iwNUi+nCDqjN6bg2HV7z
         v5q2+998yN9kHcSe2hXY1U+qaxT2AlZy+n7JXcxg9mZJc+89F+yiWRnd8b3AUe3teic3
         dfxbWrVPc7b9RZSjUUPt0bs9rsb6ypAlbIxmfbpZfuImKL783Vu/Hs15AmbU7ucDzZos
         RS7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g207si431973qke.137.2018.03.13.08.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm1u-0001jd-Nq
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:39:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxS-0005Xe-Lr
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxM-0005pv-3Q
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:22 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxL-0005j0-RD; Tue, 13 Mar 2018 11:35:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlxA-0003FQ-IQ; Tue, 13 Mar 2018 15:35:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:54 +0000
Message-Id: <20180313153458.26822-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/9] hw/arm/bcm2836: Rename bcm2836 type/struct
 to bcm283x
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rb53rtHft4UR

Our BCM2836 type is really a generic one that can be any of
the bcm283x family. Rename it accordingly. We change only
the names which are visible via the header file to the
rest of the QEMU code, leaving private function names
in bcm2836.c as they are.

This is a preliminary to making bcm283x be an abstract
parent class to specific types for the bcm2836 and bcm2837.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/bcm2836.h | 12 ++++++------
 hw/arm/bcm2836.c         | 17 +++++++++--------
 hw/arm/raspi.c           | 16 ++++++++--------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 4758b4ae54..9a10a76631 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -15,12 +15,12 @@
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/intc/bcm2836_control.h"
 
-#define TYPE_BCM2836 "bcm2836"
-#define BCM2836(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2836)
+#define TYPE_BCM283X "bcm283x"
+#define BCM283X(obj) OBJECT_CHECK(BCM283XState, (obj), TYPE_BCM283X)
 
-#define BCM2836_NCPUS 4
+#define BCM283X_NCPUS 4
 
-typedef struct BCM2836State {
+typedef struct BCM283XState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
@@ -28,9 +28,9 @@ typedef struct BCM2836State {
     char *cpu_type;
     uint32_t enabled_cpus;
 
-    ARMCPU cpus[BCM2836_NCPUS];
+    ARMCPU cpus[BCM283X_NCPUS];
     BCM2836ControlState control;
     BCM2835PeripheralState peripherals;
-} BCM2836State;
+} BCM283XState;
 
 #endif /* BCM2836_H */
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 9266f27c14..1d1908654b 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,7 +25,7 @@
 
 static void bcm2836_init(Object *obj)
 {
-    BCM2836State *s = BCM2836(obj);
+    BCM283XState *s = BCM283X(obj);
 
     object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
     object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
@@ -44,7 +44,7 @@ static void bcm2836_init(Object *obj)
 
 static void bcm2836_realize(DeviceState *dev, Error **errp)
 {
-    BCM2836State *s = BCM2836(dev);
+    BCM283XState *s = BCM283X(dev);
     Object *obj;
     Error *err = NULL;
     int n;
@@ -52,7 +52,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     /* common peripherals from bcm2835 */
 
     obj = OBJECT(dev);
-    for (n = 0; n < BCM2836_NCPUS; n++) {
+    for (n = 0; n < BCM283X_NCPUS; n++) {
         object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
                           s->cpu_type);
         object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
@@ -102,7 +102,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
-    for (n = 0; n < BCM2836_NCPUS; n++) {
+    for (n = 0; n < BCM283X_NCPUS; n++) {
         /* Mirror bcm2836, which has clusterid set to 0xf
          * TODO: this should be converted to a property of ARM_CPU
          */
@@ -150,8 +150,9 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 }
 
 static Property bcm2836_props[] = {
-    DEFINE_PROP_STRING("cpu-type", BCM2836State, cpu_type),
-    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
+    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
+    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
+                       BCM283X_NCPUS),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -164,9 +165,9 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo bcm2836_type_info = {
-    .name = TYPE_BCM2836,
+    .name = TYPE_BCM283X,
     .parent = TYPE_DEVICE,
-    .instance_size = sizeof(BCM2836State),
+    .instance_size = sizeof(BCM283XState),
     .instance_init = bcm2836_init,
     .class_init = bcm2836_class_init,
 };
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1ac0737149..58c6e80a17 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -32,7 +32,7 @@
 static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
 
 typedef struct RasPiState {
-    BCM2836State soc;
+    BCM283XState soc;
     MemoryRegion ram;
 } RasPiState;
 
@@ -136,7 +136,7 @@ static void raspi_init(MachineState *machine, int version)
     BusState *bus;
     DeviceState *carddev;
 
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
+    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM283X);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
                               &error_abort);
 
@@ -189,9 +189,9 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
-    mc->max_cpus = BCM2836_NCPUS;
-    mc->min_cpus = BCM2836_NCPUS;
-    mc->default_cpus = BCM2836_NCPUS;
+    mc->max_cpus = BCM283X_NCPUS;
+    mc->min_cpus = BCM283X_NCPUS;
+    mc->default_cpus = BCM283X_NCPUS;
     mc->default_ram_size = 1024 * 1024 * 1024;
     mc->ignore_memory_transaction_failures = true;
 };
@@ -212,9 +212,9 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
-    mc->max_cpus = BCM2836_NCPUS;
-    mc->min_cpus = BCM2836_NCPUS;
-    mc->default_cpus = BCM2836_NCPUS;
+    mc->max_cpus = BCM283X_NCPUS;
+    mc->min_cpus = BCM283X_NCPUS;
+    mc->default_cpus = BCM283X_NCPUS;
     mc->default_ram_size = 1024 * 1024 * 1024;
 }
 DEFINE_MACHINE("raspi3", raspi3_machine_init)
-- 
2.16.2

