Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6408617wrt;
        Mon, 21 Jan 2019 11:30:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7y2wem6AJ4Y8mGl6iATFmyhKfvTMsAdgo4bnz6kk4Ix2X/kbMUS8kD9b9iYNla+jk6q3hf
X-Received: by 2002:a5d:558a:: with SMTP id i10mr28422029wrv.287.1548099041291;
        Mon, 21 Jan 2019 11:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548099041; cv=none;
        d=google.com; s=arc-20160816;
        b=WoMgVWcLTc0BucZLLbWlzGtmEvoFDYCJpbbElu70VzA4P2huK1gKuRN5U2L0VDshQq
         ha85QztxA39fBSkuhi/XZbymnFBTrfogYA9uSV6ynpHukRO6MSZP7hR34byr1Fw4CvPr
         m6BVMqNbXrmknuRePDEK/WROeUHy7qAIC/6TyEkorJWx7fu/TKjSkLEm9M79s2ERquAs
         ZtrEMWKSJLUjg515PoLGXxXxYGbDXbEreu7xCzQ3R8NTzEsG64WzIBsnMoUBEDBHoUg1
         MdAbLwfs84yBjT8OZTHb+VfzGGZAC+Is6BKp7Ap9UT7M5Huh/vNAbK19e7kLs0aA8FjX
         OEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LzRvPMbQkQGhAdwFKIwhiAq/gXzdlKz74UrTsx5pEqs=;
        b=rOrI9anFRbiLHVOW2VYDgMuW6HB0rr2prrRhxOYjkxobdeNOrNZlT/1LsdR5ly2fjL
         Uxs8tWmrq2jSn0GBqxDhj/kkgF22RmiI6a9/XFnUcM4TgwfdRgbmc+7NNQ4sUWmiBgWw
         efaOQoe2Usm0e+Kt++kqxbv0eS3jPpaxvlH/nKqffGO+3qk0e7Luh79lZE0WENKdT7Ap
         VhoKeq1uBogx/esdYCSTsOOsWUCNZ5dJYRBnw8JkxfQZax2rziXwJdLDaZUVnnQ4wvMP
         ARNDsIwuYUuS7g/YCGJ9zjlCs5qGaq6BvbIRyX9G2lne05v/hS38Kw5sH4Si+yrDxm5h
         /ieg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTFIpc6p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si66562796wrs.105.2019.01.21.11.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:30:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTFIpc6p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfHM-0000sb-AG
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevR-0008OH-Fz
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002u5-LZ
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:47 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleff-0002qf-2P
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:43 -0500
Received: by mail-wr1-x443.google.com with SMTP id 96so24652761wrb.2
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LzRvPMbQkQGhAdwFKIwhiAq/gXzdlKz74UrTsx5pEqs=;
	b=HTFIpc6plfz5Oe4OMdVqt3PxMZFqJEa+VBhskWdK6sf8arXNcOMps+Q2BlZwycXeBf
	E9lnYWNq7kxZO4dLaFcxCQRB6rSV2JVVGHFzwh4N5lTSiy/x7kh53azg+JKckGvl3nCj
	CNzGrg5OHRU7RTpouszJJTG1tcRz6D45isqDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LzRvPMbQkQGhAdwFKIwhiAq/gXzdlKz74UrTsx5pEqs=;
	b=e9KWs+sHPLAll4V252i7QMWFgZRMasoPuFhhswOA10oi2K9gQkFZv1Y+t4ncbz0VUg
	+/aHJkoM/Qbmu68So5UQ6dnyYgS5LQaPjfOD/jpbaL18l4KiXyu0lp4u3Luc4bg89FOB
	dlWy/YTbQoW6p3iH+Bz2ZTY0N2flYkZNioyXd3vQOCY1BGYWntqEKorLmM4tJGzPiXkU
	WSeAGtbrn0NpwmYcdu7Nf3krLXMV2XxtQCbmIBNYA1ghUREyLTxI/g0m/YL2xbAml1R4
	h71+itmrLttNZteaZBc15QMAM5LxMB0TlrWQhvHlAy+nJUSGGShRoOzomy+OR0C+jthP
	xoQw==
X-Gm-Message-State: AJcUukcKVVug+wqSSbJbBXHCMhUAubxAuoO121tEdKdVVwKllt8maKuP
	G+MarV3Yy0SB8Fkfc0HBAAgmpA==
X-Received: by 2002:a5d:678b:: with SMTP id v11mr31459517wru.245.1548096698977;
	Mon, 21 Jan 2019 10:51:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:11 +0000
Message-Id: <20190121185118.18550-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 16/23] hw/arm/armsse: Add unimplemented-device
 stubs for PPUs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxKyw6mZffsp

Add unimplemented-device stubs for the various Power Policy Unit
devices that the SSE-200 has.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 11 ++++++++
 hw/arm/armsse.c         | 58 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index dbfcb280605..9855ec5f269 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -106,6 +106,16 @@
 
 #define SSE_MAX_CPUS 2
 
+/* These define what each PPU in the ppu[] index is for */
+#define CPU0CORE_PPU 0
+#define CPU1CORE_PPU 1
+#define DBG_PPU 2
+#define RAM0_PPU 3
+#define RAM1_PPU 4
+#define RAM2_PPU 5
+#define RAM3_PPU 6
+#define NUM_PPUS 7
+
 typedef struct ARMSSE {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -139,6 +149,7 @@ typedef struct ARMSSE {
     IoTKitSysCtl sysinfo;
 
     UnimplementedDeviceState mhu[2];
+    UnimplementedDeviceState ppu[NUM_PPUS];
 
     /*
      * 'container' holds all devices seen by all CPUs.
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 1f3dc89c8e8..280ba5c78be 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -31,6 +31,7 @@ struct ARMSSEInfo {
     uint32_t sys_version;
     SysConfigFormat sys_config_format;
     bool has_mhus;
+    bool has_ppus;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -41,6 +42,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sys_version = 0x41743,
         .sys_config_format = IoTKitFormat,
         .has_mhus = false,
+        .has_ppus = false,
     },
 };
 
@@ -265,6 +267,29 @@ static void armsse_init(Object *obj)
         sysbus_init_child_obj(obj, "mhu1", &s->mhu[1], sizeof(s->mhu[1]),
                               TYPE_UNIMPLEMENTED_DEVICE);
     }
+    if (info->has_ppus) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("CPU%dCORE_PPU", i);
+            int ppuidx = CPU0CORE_PPU + i;
+
+            sysbus_init_child_obj(obj, name, &s->ppu[ppuidx],
+                                  sizeof(s->ppu[ppuidx]),
+                                  TYPE_UNIMPLEMENTED_DEVICE);
+            g_free(name);
+        }
+        sysbus_init_child_obj(obj, "DBG_PPU", &s->ppu[DBG_PPU],
+                              sizeof(s->ppu[DBG_PPU]),
+                              TYPE_UNIMPLEMENTED_DEVICE);
+        for (i = 0; i < info->sram_banks; i++) {
+            char *name = g_strdup_printf("RAM%d_PPU", i);
+            int ppuidx = RAM0_PPU + i;
+
+            sysbus_init_child_obj(obj, name, &s->ppu[ppuidx],
+                                  sizeof(s->ppu[ppuidx]),
+                                  TYPE_UNIMPLEMENTED_DEVICE);
+            g_free(name);
+        }
+    }
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -329,6 +354,17 @@ static qemu_irq armsse_get_common_irq_in(ARMSSE *s, int irqno)
     }
 }
 
+static void map_ppu(ARMSSE *s, int ppuidx, const char *name, hwaddr addr)
+{
+    /* Map a PPU unimplemented device stub */
+    DeviceState *dev = DEVICE(&s->ppu[ppuidx]);
+
+    qdev_prop_set_string(dev, "name", name);
+    qdev_prop_set_uint64(dev, "size", 0x1000);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ppu[ppuidx]), 0, addr);
+}
+
 static void armsse_realize(DeviceState *dev, Error **errp)
 {
     ARMSSE *s = ARMSSE(dev);
@@ -833,6 +869,28 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50021000);
 
+    if (info->has_ppus) {
+        /* CPUnCORE_PPU for each CPU */
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("CPU%dCORE_PPU", i);
+
+            map_ppu(s, CPU0CORE_PPU + i, name, 0x50023000 + i * 0x2000);
+            /*
+             * We don't support CPU debug so don't create the
+             * CPU0DEBUG_PPU at 0x50024000 and 0x50026000.
+             */
+            g_free(name);
+        }
+        map_ppu(s, DBG_PPU, "DBG_PPU", 0x50029000);
+
+        for (i = 0; i < info->sram_banks; i++) {
+            char *name = g_strdup_printf("RAM%d_PPU", i);
+
+            map_ppu(s, RAM0_PPU + i, name, 0x5002a000 + i * 0x1000);
+            g_free(name);
+        }
+    }
+
     /* This OR gate wires together outputs from the secure watchdogs to NMI */
     object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
     if (err) {
-- 
2.20.1

