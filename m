Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1937706wrd;
        Tue, 21 Aug 2018 06:49:23 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb9Kd/Wnto/saYnn9B32agPlV0y/QTtG88uvMSGimHiWjK8KdDe/3xDIA3b/wCHtL+TTLkZ
X-Received: by 2002:aed:3b32:: with SMTP id p47-v6mr7625096qte.13.1534859363300;
        Tue, 21 Aug 2018 06:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859363; cv=none;
        d=google.com; s=arc-20160816;
        b=snT6qzMpjRQPrSi4BDPzTGMz/5fR1RACF0NK5tRE7ccPm7bpqx41tXM/vwP7nh4FNA
         N7QdAQ0/56L9q+vvneLwlYJIbuEMaUHGw4Iy24/KU1BKXD77iEAB7Pau4jDIQeoSQNze
         TTJ3an5y3h5aj+3NGIHhoyKfWj9IliotrhDLb6a0J8rGiCXlgHGkLC8BZMVGpcfWqDay
         v5GEHErmJ4oaujfQQ+MXMOE4Fsd9Gv4NuBKuCyJleogAo3aBiymY8TOtAR6r8AA/cSpc
         tZtAwJgZTfyP76MmrheD1GfinEIBQ9uTf8+MLc+wiKcC63t69H9mNnaaapaUgGIWlbwu
         hf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=jmAl00w4Qm9XxwpXK47ZdOqNJK8IokVi/+thwQCTHEc=;
        b=dBMjMEUfU2tKU85xp/MkXUx7qIsi6D7/st9l0dfyc2y3oKm6S7jMvOIiuHrxtopbuJ
         yNOh3hSigFX/7PLMX4zcKoA25YgjOU2czpw7dFqs+hx4ZwAVwTxpG09K3RFO22SOZswo
         UpFZCeOaFHJyb1UQ94YbLGCMj6t9aiPITWBjPrKcedWGWSBkwgNPe4dZVobtmgG1lCQS
         npaPfjMxWkDuBFpNxboS4SXUdc8SBgnwLJh/0jJhsIUo3b9HMktIWAPhhZWTI1Qf2ZmD
         iiCLDoPqJSoxZuyWwiHyqhwfnIaijLtySc39eckoVDDlY/8YkjIyBNlzBCMyV8H6CUhm
         lEAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n14-v6si1412664qtr.355.2018.08.21.06.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs72A-00080q-Mb
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:49:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hx-0005sO-Eb
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hw-0003fe-4t
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6ht-0003S5-OT; Tue, 21 Aug 2018 09:28:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hr-0004Cm-1S; Tue, 21 Aug 2018 14:28:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:11 +0100
Message-Id: <20180821132811.17675-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 9/9] hw/arm/vexpress: Add "virtualization"
 property controlling presence of EL2
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qNekOXrIIin8

Add a "virtualization" property to the vexpress-a15 board,
controlling presence of EL2. As with EL3, we default to
enabling it, but the user can disable it if they have an
older guest which can't cope with it being present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 56 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 3631f4de3a4..c02d18ee618 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -172,6 +172,7 @@ typedef struct {
 typedef struct {
     MachineState parent;
     bool secure;
+    bool virt;
 } VexpressMachineState;
 
 #define TYPE_VEXPRESS_MACHINE   "vexpress"
@@ -203,7 +204,7 @@ struct VEDBoardInfo {
 };
 
 static void init_cpus(const char *cpu_type, const char *privdev,
-                      hwaddr periphbase, qemu_irq *pic, bool secure)
+                      hwaddr periphbase, qemu_irq *pic, bool secure, bool virt)
 {
     DeviceState *dev;
     SysBusDevice *busdev;
@@ -216,6 +217,11 @@ static void init_cpus(const char *cpu_type, const char *privdev,
         if (!secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
+        if (!virt) {
+            if (object_property_find(cpuobj, "has_el2", NULL)) {
+                object_property_set_bool(cpuobj, false, "has_el2", NULL);
+            }
+        }
 
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, periphbase,
@@ -289,7 +295,8 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
     memory_region_add_subregion(sysmem, 0x60000000, ram);
 
     /* 0x1e000000 A9MPCore (SCU) private memory region */
-    init_cpus(cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic, vms->secure);
+    init_cpus(cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic,
+              vms->secure, vms->virt);
 
     /* Daughterboard peripherals : 0x10020000 .. 0x20000000 */
 
@@ -370,7 +377,8 @@ static void a15_daughterboard_init(const VexpressMachineState *vms,
     memory_region_add_subregion(sysmem, 0x80000000, ram);
 
     /* 0x2c000000 A15MPCore private memory region (GIC) */
-    init_cpus(cpu_type, TYPE_A15MPCORE_PRIV, 0x2c000000, pic, vms->secure);
+    init_cpus(cpu_type, TYPE_A15MPCORE_PRIV, 0x2c000000, pic, vms->secure,
+              vms->virt);
 
     /* A15 daughterboard peripherals: */
 
@@ -724,6 +732,20 @@ static void vexpress_set_secure(Object *obj, bool value, Error **errp)
     vms->secure = value;
 }
 
+static bool vexpress_get_virt(Object *obj, Error **errp)
+{
+    VexpressMachineState *vms = VEXPRESS_MACHINE(obj);
+
+    return vms->virt;
+}
+
+static void vexpress_set_virt(Object *obj, bool value, Error **errp)
+{
+    VexpressMachineState *vms = VEXPRESS_MACHINE(obj);
+
+    vms->virt = value;
+}
+
 static void vexpress_instance_init(Object *obj)
 {
     VexpressMachineState *vms = VEXPRESS_MACHINE(obj);
@@ -738,6 +760,32 @@ static void vexpress_instance_init(Object *obj)
                                     NULL);
 }
 
+static void vexpress_a15_instance_init(Object *obj)
+{
+    VexpressMachineState *vms = VEXPRESS_MACHINE(obj);
+
+    /*
+     * For the vexpress-a15, EL2 is by default enabled if EL3 is,
+     * but can also be specifically set to on or off.
+     */
+    vms->virt = true;
+    object_property_add_bool(obj, "virtualization", vexpress_get_virt,
+                             vexpress_set_virt, NULL);
+    object_property_set_description(obj, "virtualization",
+                                    "Set on/off to enable/disable the ARM "
+                                    "Virtualization Extensions "
+                                    "(defaults to same as 'secure')",
+                                    NULL);
+}
+
+static void vexpress_a9_instance_init(Object *obj)
+{
+    VexpressMachineState *vms = VEXPRESS_MACHINE(obj);
+
+    /* The A9 doesn't have the virt extensions */
+    vms->virt = false;
+}
+
 static void vexpress_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -784,12 +832,14 @@ static const TypeInfo vexpress_a9_info = {
     .name = TYPE_VEXPRESS_A9_MACHINE,
     .parent = TYPE_VEXPRESS_MACHINE,
     .class_init = vexpress_a9_class_init,
+    .instance_init = vexpress_a9_instance_init,
 };
 
 static const TypeInfo vexpress_a15_info = {
     .name = TYPE_VEXPRESS_A15_MACHINE,
     .parent = TYPE_VEXPRESS_MACHINE,
     .class_init = vexpress_a15_class_init,
+    .instance_init = vexpress_a15_instance_init,
 };
 
 static void vexpress_machine_init(void)
-- 
2.18.0

