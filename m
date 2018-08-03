Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp157252wru;
        Fri, 3 Aug 2018 07:48:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcwC5CkPLOGh5mBmRWO8Amq27BQlrMQ+UClhBqXFlyxWg32o/QuFWB3ycJ+9XofJLD4Hvku
X-Received: by 2002:ac8:354e:: with SMTP id z14-v6mr4300543qtb.261.1533307692228;
        Fri, 03 Aug 2018 07:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307692; cv=none;
        d=google.com; s=arc-20160816;
        b=EKdlm5CT18MzWCG7O8rFUBvMYlbNTle8mAhnLirLaS1idura7brq3CdE147NpAzhsI
         fLaYRt6jpxl+GAEjvjI6kgUO4KJMRMCysqOauwJICx3KXMRi7LhjOLqcBPkmF4EsBcJm
         xnHTFlnavwgIdJgzeFcaaoycWHsX1vo4Tz9ngpXiFgTtgKfXDaVTBM7YY8n9/KrvDvGs
         wcUjxTstmQKcRkU4MTNeAKK5J2ffxY9pWQB6hn5SEciM4FxVNf30NWd1SU12PysYrD+r
         Bu7ZOINz0Ia7g66+PNbx/btLIlabJilyFlA5lgNfTQJEOZm5Ih7IW+CGrBtdzXxBoCNy
         GoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=VERtaVtC/p/tjFZ24yhc3GcZ4tG88eEuf1st1N3TBCM=;
        b=xane6rZjZ6agQaOdlQRJZr/zhzafU8t6hJqBtz1TyVAjMzUzM9CoPYeOh5qX016yv/
         tDDfxp6fP18Vec+1O+MTXaXQtnx7SzHzkDHR/gUhrfDAA+tSOgGDVxsaibQkxvAy21hH
         95D1pprBvXJUVwW44fV8fLCM6bXfY16nmcBjI1bt12Fnu4ykz9cArsS0oasl2TKl+arH
         dDLuNaTgZafwFurHuIC9ArsOIYLtOmLFmmfymLxBLAgLnPSRr8Zexp6u/flr6uJMIouT
         njQE8WRbjIZouqlW9qfw2RQ2pDD9/dPtZEoQiVHkj00CVotc3G4gWgt08SjaXycRdrWC
         Mpgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6-v6si1185983qvd.58.2018.08.03.07.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbNB-0002xA-2D
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:48:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMc-0002hk-Ly
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMZ-0007bt-SJ
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32946 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMZ-0007bg-MH; Fri, 03 Aug 2018 10:47:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0690D818A6A9;
	Fri,  3 Aug 2018 14:47:31 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A67BA215670D;
	Fri,  3 Aug 2018 14:47:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:16 +0100
Message-Id: <20180803144721.17036-2-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 14:47:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 03 Aug 2018 14:47:31 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 1/6] hw/arm: make bitbanded IO optional on
 ARMv7-M
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8ceXP5EQi9p

Some ARM CPUs have bitbanded IO, a memory region that allows convenient
bit access via 32-bit memory loads/stores.  This eliminates the need for
read-modify-update instruction sequences.

This patch makes this optional feature an ARMv7MState qdev property,
allowing boards to choose whether they want bitbanding or not.

Status of boards:
 * iotkit (Cortex M33), no bitband
 * mps2 (Cortex M3), bitband
 * msf2 (Cortex M3), bitband
 * stellaris (Cortex M3), bitband
 * stm32f205 (Cortex M3), bitband

As a side-effect of this patch, Peter Maydell noted that the Ethernet
controller on mps2 board is now accessible.  Previously they were hidden
by the bitband region (which does not exist on the real board).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/armv7m.h |  2 ++
 hw/arm/armv7m.c         | 37 ++++++++++++++++++++-----------------
 hw/arm/mps2.c           |  1 +
 hw/arm/msf2-soc.c       |  1 +
 hw/arm/stellaris.c      |  1 +
 hw/arm/stm32f205_soc.c  |  1 +
 6 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 78308d1484..2ba24953b6 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -43,6 +43,7 @@ typedef struct {
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
  * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
+ * + Property "enable-bitband": expose bitbanded IO
  */
 typedef struct ARMv7MState {
     /*< private >*/
@@ -63,6 +64,7 @@ typedef struct ARMv7MState {
     MemoryRegion *board_memory;
     Object *idau;
     uint32_t init_svtor;
+    bool enable_bitband;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 6b07666057..878613994d 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -211,25 +211,27 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
 
-    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
-        Object *obj = OBJECT(&s->bitband[i]);
-        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
+    if (s->enable_bitband) {
+        for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
+            Object *obj = OBJECT(&s->bitband[i]);
+            SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
 
-        object_property_set_int(obj, bitband_input_addr[i], "base", &err);
-        if (err != NULL) {
-            error_propagate(errp, err);
-            return;
-        }
-        object_property_set_link(obj, OBJECT(s->board_memory),
-                                 "source-memory", &error_abort);
-        object_property_set_bool(obj, true, "realized", &err);
-        if (err != NULL) {
-            error_propagate(errp, err);
-            return;
-        }
+            object_property_set_int(obj, bitband_input_addr[i], "base", &err);
+            if (err != NULL) {
+                error_propagate(errp, err);
+                return;
+            }
+            object_property_set_link(obj, OBJECT(s->board_memory),
+                                     "source-memory", &error_abort);
+            object_property_set_bool(obj, true, "realized", &err);
+            if (err != NULL) {
+                error_propagate(errp, err);
+                return;
+            }
 
-        memory_region_add_subregion(&s->container, bitband_output_addr[i],
-                                    sysbus_mmio_get_region(sbd, 0));
+            memory_region_add_subregion(&s->container, bitband_output_addr[i],
+                                        sysbus_mmio_get_region(sbd, 0));
+        }
     }
 }
 
@@ -239,6 +241,7 @@ static Property armv7m_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
     DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
+    DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c3946da317..0a0ae867d9 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -186,6 +186,7 @@ static void mps2_common_init(MachineState *machine)
         g_assert_not_reached();
     }
     qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&mms->armv7m), OBJECT(system_memory),
                              "memory", &error_abort);
     object_property_set_bool(OBJECT(&mms->armv7m), true, "realized",
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index dbefade644..2702e90b45 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -117,6 +117,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index dc521b4a5a..6c69ce79b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1304,6 +1304,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     nvic = qdev_create(NULL, TYPE_ARMV7M);
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
+    qdev_prop_set_bit(nvic, "enable-bitband", true);
     object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     /* This will exit with an error if the user passed us a bad cpu_type */
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index c486d06a8b..980e5af13c 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -109,6 +109,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
-- 
2.17.1

