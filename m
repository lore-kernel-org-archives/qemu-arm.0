Received: by 10.28.91.67 with SMTP id p64csp850311wmb;
        Tue, 13 Mar 2018 08:36:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsSGkrJMw1Tru1VyEyO9aeAMmqjcdW1ezbqPK9Q5J+67d2QS6gUM4xUGEC8mWwzXTtHMNrf
X-Received: by 10.200.13.134 with SMTP id s6mr1627943qti.124.1520955414026;
        Tue, 13 Mar 2018 08:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955414; cv=none;
        d=google.com; s=arc-20160816;
        b=MDGD+qrHHvWN6Jzhe/P6fuzJTj/eKXEYPBvfodzoWPFX3/Zmk0RCsL2F8Bs4Zy4/JR
         W1Cp8YLM1SC+sLiFMa6RLDLM9DAHUCpObXES9vG5BbMnpTmN+wmAq9I7s1z2hmAnD8Kr
         GUz2UQSAlYHERvleJPPcxrmu9pFRCzur396Xf2iCy0ZBraBlAb2PzMjhbMjrqLv3Qgpd
         TYLfN61Y03/Y4Mh1m+PWBT7MLCl7jG37iy5D3bIiUZ2JkJ4c5G24Z+BlY67QB4qxu+T4
         apVA8DH/JGov89KEmC8RZNWuBzRZHyzymoFg7XHxxwKcf4iE+T/wZFYiUpjnIq+xbsKt
         PV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=g1aqrBkN2F567LdqxfbyOdcy6E9Whq74r4KnWfeYgvc=;
        b=mhQ22fiIiYMy9/0gA29zfzJzSZwtDPCgE5QyW+MQGZxJXsfqvsmNfqNDqOC9H1+SYh
         oKHVN5Y4POlxKTlPY5KHy8/HIaiZKtEoTBiRKcxlJrgreje7XG34lzrqXum+UMo6u99I
         r8h5p+1IA3mJZsteu/hmdtBZOs6gXCOGZobTDmEGmJexCfaU4DbfDnJnfEZFsC74fUBP
         nIA01bE8AL7VvEaNHhSQC4Vt688OdB3Q5or56ymGkZQw/eNAVhAvc4NmP6lHbZLZqW/f
         IHQlgexD2AYNNdD5o0RgKPla67AD3elWwFYVZ6yJbLhf+9Mqel5JWkJ3/66GeaJneKA4
         yRSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q70si427746qka.438.2018.03.13.08.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evlyv-0007Lh-Eb
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxR-0005Va-2V
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxL-0005pN-4o
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:21 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxK-0005j0-DS; Tue, 13 Mar 2018 11:35:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlxB-0003Fi-98; Tue, 13 Mar 2018 15:35:05 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:55 +0000
Message-Id: <20180313153458.26822-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/9] hw/arm/bcm2836: Create proper bcm2837 device
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
X-TUID: kkJ+FvizLuqi

The bcm2837 is pretty similar to the bcm2836, but it does have
some differences. Notably, the MPIDR affinity aff1 values it
sets for the CPUs are 0x0, rather than the 0xf that the bcm2836
uses, and if this is wrong Linux will not boot.

Rather than trying to have one device with properties that
configure it differently for the two cases, create two
separate QOM devices for the two SoCs. We use the same approach
as hw/arm/aspeed_soc.c and share code and have a data table
that might differ per-SoC. For the moment the two types don't
actually have different behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/bcm2836.h | 19 +++++++++++++++++++
 hw/arm/bcm2836.c         | 37 ++++++++++++++++++++++++++++++++-----
 hw/arm/raspi.c           |  3 ++-
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 9a10a76631..93248399ba 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -20,6 +20,13 @@
 
 #define BCM283X_NCPUS 4
 
+/* These type names are for specific SoCs; other than instantiating
+ * them, code using these devices should always handle them via the
+ * BCM283x base class, so they have no BCM2836(obj) etc macros.
+ */
+#define TYPE_BCM2836 "bcm2836"
+#define TYPE_BCM2837 "bcm2837"
+
 typedef struct BCM283XState {
     /*< private >*/
     DeviceState parent_obj;
@@ -33,4 +40,16 @@ typedef struct BCM283XState {
     BCM2835PeripheralState peripherals;
 } BCM283XState;
 
+typedef struct BCM283XInfo BCM283XInfo;
+
+typedef struct BCM283XClass {
+    DeviceClass parent_class;
+    const BCM283XInfo *info;
+} BCM283XClass;
+
+#define BCM283X_CLASS(klass) \
+    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
+#define BCM283X_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
+
 #endif /* BCM2836_H */
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 1d1908654b..07d2705f96 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -23,6 +23,19 @@
 /* "QA7" (Pi2) interrupt controller and mailboxes etc. */
 #define BCM2836_CONTROL_BASE    0x40000000
 
+struct BCM283XInfo {
+    const char *name;
+};
+
+static const BCM283XInfo bcm283x_socs[] = {
+    {
+        .name = TYPE_BCM2836,
+    },
+    {
+        .name = TYPE_BCM2837,
+    },
+};
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -156,25 +169,39 @@ static Property bcm2836_props[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static void bcm2836_class_init(ObjectClass *oc, void *data)
+static void bcm283x_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM283XClass *bc = BCM283X_CLASS(oc);
 
-    dc->props = bcm2836_props;
+    bc->info = data;
     dc->realize = bcm2836_realize;
+    dc->props = bcm2836_props;
 }
 
-static const TypeInfo bcm2836_type_info = {
+static const TypeInfo bcm283x_type_info = {
     .name = TYPE_BCM283X,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(BCM283XState),
     .instance_init = bcm2836_init,
-    .class_init = bcm2836_class_init,
+    .class_size = sizeof(BCM283XClass),
+    .abstract = true,
 };
 
 static void bcm2836_register_types(void)
 {
-    type_register_static(&bcm2836_type_info);
+    int i;
+
+    type_register_static(&bcm283x_type_info);
+    for (i = 0; i < ARRAY_SIZE(bcm283x_socs); i++) {
+        TypeInfo ti = {
+            .name = bcm283x_socs[i].name,
+            .parent = TYPE_BCM283X,
+            .class_init = bcm283x_class_init,
+            .class_data = (void *) &bcm283x_socs[i],
+        };
+        type_register(&ti);
+    }
 }
 
 type_init(bcm2836_register_types)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 58c6e80a17..f588720138 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -136,7 +136,8 @@ static void raspi_init(MachineState *machine, int version)
     BusState *bus;
     DeviceState *carddev;
 
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM283X);
+    object_initialize(&s->soc, sizeof(s->soc),
+                      version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
                               &error_abort);
 
-- 
2.16.2

