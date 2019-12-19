Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2607603lff;
        Thu, 19 Dec 2019 10:55:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwp5e6Nnvj7vXTse2qOSx7AmHnEpA5cekaFLKDeT67eMhFsSquxHnJwHAjuM7lX44HvrBR8
X-Received: by 2002:ac8:6b83:: with SMTP id z3mr2292182qts.157.1576781705381;
        Thu, 19 Dec 2019 10:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576781705; cv=none;
        d=google.com; s=arc-20160816;
        b=cLOQzsPo7w9SqZnA2hAQRw7hth8szN/1grK3E1GTvRJpOOZ+v9NqQG5inWe0E0sQNc
         SiXmjkQFv7eCKX+JzARohM8jcVcjk5w+Ykt08E0l4Mh1m8b0gcokuS5Qctk1XdWmMfXV
         oAWJ2tL5ny53ZPWmGL0aHdadPoxzzLemEk9BPSo5YweNJTH1drRBHMPCBrkpsrUfOIgj
         xPyIDqQsyCetcvxVhcEw+cQJyEbAr/8JKqPE87J5Y0Ojg96DM2FC4VQ7UlkPlkfaxDsz
         s8FJtCrmyfeqjqaSLnUFUJcVSIMaE9v0lsvOlx5V6bllTYXE5sYPBxJHEn0Q6RA6D1BN
         VZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YyPr5A6rnL1yXh0BplYIOMYBILGoNVomOgJvBtF2zv8=;
        b=vnb20HTpJtFeFPcUj/SxY2VozBxHcErl/8DkuWoJ9daxiAU35HfhlcJTEaEtZo3aIl
         ooa9D5uZQFfJX0Z/Ltsv/v0A2RJ62rg9hYTAH4JvfDyrOFHOvfTS3NI0/tm87flI/ksU
         qQuBqHky2Xp7iLV47aFrMtKoRcs2kk4+nlBUL0l889EVASN9W8zYPZGzbPAiMcapM0Pb
         GFTcBAh41sRB/nJBXFX7FoXz2softthDYjUtBTw9HpBACnLrZvOjYCufOrP3uCOsjngr
         /mHeW4mLEyhJekoXJ3xI3o2u+JXkaFPpJj2DnWEW1fVny0Xcwp7uOENSAmZD42OwYMoi
         LeOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gUuO85Em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f131si3834208qke.358.2019.12.19.10.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 10:55:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gUuO85Em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii0wy-0002zC-8n
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 13:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0ts-0007RJ-8a
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 13:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tq-0000WW-LG
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 13:51:52 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tm-00007T-UD; Thu, 19 Dec 2019 13:51:47 -0500
Received: by mail-wr1-x442.google.com with SMTP id t2so7079099wrr.1;
 Thu, 19 Dec 2019 10:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YyPr5A6rnL1yXh0BplYIOMYBILGoNVomOgJvBtF2zv8=;
 b=gUuO85EmTJkhrApzSOHS/sPi8S4du85fP8278KxyPehzc58JtzuXRUDCRLHkbiuvp3
 NPazvAgtkPY9ecZf5T0lc7UizXq/gbCP/e70LfomtWKylgfOUoWoig1KNrPvqKdjTVut
 kj4T5ALd+fG02eGAUgloEo/sTga7V1oWywzZXCmyYy/XtgytdRuvGZz+D0Bvf19x/EXk
 ZP/lw86I7jo9M4e6zkHA9y4I2guuaSO4Tula4t3nu6W8Foa3lL1D7/miOnbr9lrICrvB
 PYp1a7J1Pdew9MiHsTcWogWyYLKMKiqXu0FmbzU6APBcnc2YOW+zCerMqrPuxJO9fBcN
 GWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YyPr5A6rnL1yXh0BplYIOMYBILGoNVomOgJvBtF2zv8=;
 b=bDf3O4bo4QDGUDPRcTShc3X1Di+4fJN8pA/VOFJj+25oQVS9kVzdDb3s+HU1hAYuhq
 kON0/utza1Q7536jopm/IMYZPMpHomldISpEON3E1bWNi9SlhLvmVp4nZsgphXavVr06
 268AiIu/mtNoA/hMc7Ju+Lkbts2e3X41aCDLxiCswMWIMXOTm8K84py6YIrI8A7MI8pq
 6gVXt+KFd6+7oU9h7/YbG1aa9G05qedlCitXsDvc9XoSb9Mwk+2FHyN9/5UUMHFaXlY6
 ECNYZleXvFnfdllRTPPhU1PN4xytQJ4arVr1YCaHzwaunF6ybxQrjeQxnaKMd8d94DTJ
 2K3A==
X-Gm-Message-State: APjAAAU8kHw3/qFbu1Ip0A/2901COuryXBYofBpXotztEvrM5sleL8Fg
 yw1YJW6O7qySU5Pbp/qp17TB5BC4
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr10656214wrx.14.1576781505386; 
 Thu, 19 Dec 2019 10:51:45 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [RFC PATCH 13/13] hw/timer/allwinner: Rename functions not specific
 to the A10 SoC
Date: Thu, 19 Dec 2019 19:51:27 +0100
Message-Id: <20191219185127.24388-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219185127.24388-1-f4bug@amsat.org>
References: <20191219185127.24388-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ywlvcnJUP9g1

These functions are used by different Allwinner timer controllers,
rename them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/allwinner-a10-pit.c | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index 7413f046cc..dff534cfef 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -68,7 +68,7 @@ typedef struct AllwinnerTmrCtrlClass {
 #define AW_TIMER_GET_CLASS(obj) \
      OBJECT_GET_CLASS(AllwinnerTmrCtrlClass, (obj), TYPE_AW_COMMON_PIT)
 
-static void a10_pit_update_irq(AllwinnerTmrCtrlState *s)
+static void allwinner_timer_update_irq(AllwinnerTmrCtrlState *s)
 {
     int i;
 
@@ -78,7 +78,7 @@ static void a10_pit_update_irq(AllwinnerTmrCtrlState *s)
     }
 }
 
-static uint64_t a10_pit_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t allwinner_timer_read(void *opaque, hwaddr offset, unsigned size)
 {
     AllwinnerTmrCtrlState *s = AW_TIMER_CTRL(opaque);
     uint8_t index;
@@ -125,7 +125,7 @@ static uint64_t a10_pit_read(void *opaque, hwaddr offset, unsigned size)
 }
 
 /* Must be called inside a ptimer transaction block for s->timer[idx].ptimer */
-static void a10_pit_set_freq(AllwinnerTmrCtrlState *s, int index)
+static void allwinner_ptimer_set_freq(AllwinnerTmrCtrlState *s, int index)
 {
     uint32_t prescaler, source, source_freq;
 
@@ -141,8 +141,8 @@ static void a10_pit_set_freq(AllwinnerTmrCtrlState *s, int index)
     }
 }
 
-static void a10_pit_write(void *opaque, hwaddr offset, uint64_t value,
-                            unsigned size)
+static void allwinner_timer_write(void *opaque, hwaddr offset,
+                                  uint64_t value, unsigned size)
 {
      AllwinnerTmrCtrlState *s = AW_TIMER_CTRL(opaque);
      uint8_t index;
@@ -150,11 +150,11 @@ static void a10_pit_write(void *opaque, hwaddr offset, uint64_t value,
     switch (offset) {
     case AW_A10_PIT_TIMER_IRQ_EN:
         s->irq_enable = value;
-        a10_pit_update_irq(s);
+        allwinner_timer_update_irq(s);
         break;
     case AW_A10_PIT_TIMER_IRQ_ST:
         s->irq_status &= ~value;
-        a10_pit_update_irq(s);
+        allwinner_timer_update_irq(s);
         break;
     case AW_A10_PIT_TIMER_BASE ... AW_A10_PIT_TIMER_BASE_END:
         index = offset & 0xf0;
@@ -164,7 +164,7 @@ static void a10_pit_write(void *opaque, hwaddr offset, uint64_t value,
         case AW_A10_PIT_TIMER_CONTROL:
             s->timer[index].control = value;
             ptimer_transaction_begin(s->timer[index].ptimer);
-            a10_pit_set_freq(s, index);
+            allwinner_ptimer_set_freq(s, index);
             if (s->timer[index].control & AW_A10_PIT_TIMER_RELOAD) {
                 ptimer_set_count(s->timer[index].ptimer,
                                  s->timer[index].interval);
@@ -229,13 +229,13 @@ static void a10_pit_write(void *opaque, hwaddr offset, uint64_t value,
     }
 }
 
-static const MemoryRegionOps a10_pit_ops = {
-    .read = a10_pit_read,
-    .write = a10_pit_write,
+static const MemoryRegionOps allwinner_timer_ops = {
+    .read = allwinner_timer_read,
+    .write = allwinner_timer_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static Property a10_pit_properties[] = {
+static Property allwinner_timer_properties[] = {
     DEFINE_PROP_UINT32("clk0-freq", AllwinnerTmrCtrlState, clk_freq[0], 0),
     DEFINE_PROP_UINT32("clk1-freq", AllwinnerTmrCtrlState, clk_freq[1], 0),
     DEFINE_PROP_UINT32("clk2-freq", AllwinnerTmrCtrlState, clk_freq[2], 0),
@@ -276,14 +276,14 @@ static const VMStateDescription vmstate_a10_pit = {
     }
 };
 
-static void a10_pit_reset(DeviceState *dev)
+static void allwinner_timer_reset(DeviceState *dev)
 {
     AllwinnerTmrCtrlState *s = AW_TIMER_CTRL(dev);
     uint8_t i;
 
     s->irq_enable = 0;
     s->irq_status = 0;
-    a10_pit_update_irq(s);
+    allwinner_timer_update_irq(s);
 
     for (i = 0; i < s->timer_count; i++) {
         s->timer[i].control = AW_A10_PIT_DEFAULT_CLOCK;
@@ -291,7 +291,7 @@ static void a10_pit_reset(DeviceState *dev)
         s->timer[i].count = 0;
         ptimer_transaction_begin(s->timer[i].ptimer);
         ptimer_stop(s->timer[i].ptimer);
-        a10_pit_set_freq(s, i);
+        allwinner_ptimer_set_freq(s, i);
         ptimer_transaction_commit(s->timer[i].ptimer);
     }
     s->watch_dog_mode = 0;
@@ -301,7 +301,7 @@ static void a10_pit_reset(DeviceState *dev)
     s->count_ctl = 0;
 }
 
-static void a10_pit_timer_cb(void *opaque)
+static void allwinner_ptimer_cb(void *opaque)
 {
     AllwinnerTmrState *tc = opaque;
     AllwinnerTmrCtrlState *s = tc->container;
@@ -313,11 +313,11 @@ static void a10_pit_timer_cb(void *opaque)
             ptimer_stop(s->timer[i].ptimer);
             s->timer[i].control &= ~AW_A10_PIT_TIMER_EN;
         }
-        a10_pit_update_irq(s);
+        allwinner_timer_update_irq(s);
     }
 }
 
-static void aw_pit_instance_init(Object *obj)
+static void allwinner_timer_instance_init(Object *obj)
 {
     AllwinnerTmrCtrlState *s = AW_TIMER_CTRL(obj);
     AllwinnerTmrCtrlClass *c = AW_TIMER_GET_CLASS(s);
@@ -329,8 +329,8 @@ static void aw_pit_instance_init(Object *obj)
     for (i = 0; i < s->timer_count; i++) {
         sysbus_init_irq(sbd, &s->timer[i].irq);
     }
-    memory_region_init_io(&s->iomem, OBJECT(s), &a10_pit_ops, s,
-                          TYPE_AW_COMMON_PIT, c->region_size);
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_timer_ops,
+                          s, TYPE_AW_COMMON_PIT, c->region_size);
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < s->timer_count; i++) {
@@ -338,7 +338,7 @@ static void aw_pit_instance_init(Object *obj)
 
         tc->container = s;
         tc->index = i;
-        s->timer[i].ptimer = ptimer_init(a10_pit_timer_cb, tc,
+        s->timer[i].ptimer = ptimer_init(allwinner_ptimer_cb, tc,
                                          PTIMER_POLICY_DEFAULT);
     }
 }
@@ -347,8 +347,8 @@ static void aw_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->reset = a10_pit_reset;
-    dc->props = a10_pit_properties;
+    dc->reset = allwinner_timer_reset;
+    dc->props = allwinner_timer_properties;
     dc->desc = "Allwinner Timer Controller";
     dc->vmsd = &vmstate_a10_pit;
 }
@@ -356,7 +356,7 @@ static void aw_timer_class_init(ObjectClass *klass, void *data)
 static const TypeInfo allwinner_pit_info = {
     .name = TYPE_AW_COMMON_PIT,
     .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_init = aw_pit_instance_init,
+    .instance_init = allwinner_timer_instance_init,
     .instance_size = sizeof(AllwinnerTmrCtrlState),
     .class_init = aw_timer_class_init,
     .class_size = sizeof(AllwinnerTmrCtrlClass),
@@ -379,10 +379,10 @@ static const TypeInfo a10_pit_info = {
     .class_init = a10_pit_class_init,
 };
 
-static void a10_register_types(void)
+static void allwinner_timer_register_types(void)
 {
     type_register_static(&allwinner_pit_info);
     type_register_static(&a10_pit_info);
 }
 
-type_init(a10_register_types);
+type_init(allwinner_timer_register_types);
-- 
2.21.0

