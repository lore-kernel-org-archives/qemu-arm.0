Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7517265wrx;
        Fri, 22 Feb 2019 16:21:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZIEdAaFpCu8dSkK20VvmwynYoq71g2Hy832VXauqrK+qjPnt+db0ZU+Z1tmElEwD4IjFwq
X-Received: by 2002:a25:2c2:: with SMTP id 185mr5923017ybc.322.1550881285126;
        Fri, 22 Feb 2019 16:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550881285; cv=none;
        d=google.com; s=arc-20160816;
        b=xwg4yuoPVMRZuTGhhYmK3MQ96hq26hAHXkFQ/+M7kS31n2ABheCUZg/x1gwkbEFNry
         H6hU5Xouqm+KLSgA26/ysUENXbMi/yQAdG7sAhY+Ww/Xya3SyPJ8MUezn66Rd91vuaIw
         173zggGB+vHd8T0mJiSvIQB95PaEV3+k+2z+ZgeyV/M6Koh4zwawMvdALlrY3EJCarTu
         IGDLz+vEEPCv1Rj6jC76tNPCKVrVkhpXqoeoAon2aeuplTjtY/fJYFiLsHcsFqnU7bEZ
         DyVdgxJ1C3pjoFReXnj0aP9wDzyw7J2LJwRV0Is4vjtHeV7H1pAreU+3X488pX8nJ7Tf
         NL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=MHm+IAapOiBzL901PzQLZ/BE05vz+/FSZkBItL7Bfr4=;
        b=UKmsNppYJcxN2VvqRc/7BlmrgyEVoOY6XJEeNDi+7XXXcIUjBBtVjoRTY1oWIzGoyx
         Il+fnqi9jf/qega9LsfpVzBbpBNrq7EilN3PmgHvEgb+Z7OQnhZz2IxGOgf5XzECpI/x
         i/dFjklLGlHDJitzuxwhDsFMOxJhmtU/1yJHCX16WUczxj86X3Cb8nqha32N8S369Ipd
         oMiIE5yabYW15oG958TwSpuD2TYHZESfI6UgByeMsrjuKceVgtJ0XHQXG5Hly1DIO3cl
         Jp7HBvGa+AC7AFjcBCgpP6UgdBfjBg5ozjKoeGFAOAovOJeBsdJdjDZyUQm+rltHncPt
         XqSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W4D5cDW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186si1728030ybg.136.2019.02.22.16.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 16:21:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W4D5cDW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxL4G-00085E-Im
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 19:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michelheily@gmail.com>) id 1gxKVv-0004Qr-MR
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 18:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michelheily@gmail.com>) id 1gxKVr-0007gx-EQ
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 18:45:52 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <michelheily@gmail.com>)
	id 1gxKVh-0007TW-PJ; Fri, 22 Feb 2019 18:45:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id f14so4122475wrg.1;
	Fri, 22 Feb 2019 15:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MHm+IAapOiBzL901PzQLZ/BE05vz+/FSZkBItL7Bfr4=;
	b=W4D5cDW34vj15hJsMVgYcvBrL3A78yhnJuGro+t++N7PYotpAv5UoLY/QIHVCJUrXn
	+tY/kgQgS9K6iGkZErYWDgC/9ufwhEN67cdY57ofTzDbVKt+l0P+dqepnDIPWiu50tqA
	TXKXsrcMUoyW+QWdfgvq+MqJHsEmuWGYYiUs3WtXYL+CQi3wHDBTPJs4IohxR9LGzD61
	hk87rDnmZpsR1B1OnCK1nnPymZOkA2S+6+zdAvJxIU1H0+jrgLMm8XUpWFBDBLUP3nIy
	dVis/voB9T8m1O3D2nVPo+nw2iGH+QQoje8jJ8pxGnG3Yp0VqDuax23DpXi41N3CPmB1
	e3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MHm+IAapOiBzL901PzQLZ/BE05vz+/FSZkBItL7Bfr4=;
	b=bOYzQSXUNXxwQnxGXL7/sUC8QzYt10F98OpwFXoRrwsKWWEeHYczJMBKNFZO7RPJiO
	Dyawrk7qzPxKVnP8IphoQInh3mC+3OT8JrwR9wosnGJ9Jo1gVjeD37YsEF6utgp0tGcs
	moMGk9uBaWzi6FPAvOaGSP3fWbRY8A/htTe/OSqElJDov/ZK284EPR+TEPJlb1ME37mV
	5OQrMpC4Pn/QhWngBROn+l+8H/oW3zN0ycGGmol1yd9h5BUp5qW6Pg5ll8cp+tJ5C0yB
	Url7ZY0Wfw6mvoCHvAD3Z69PAjUofNlBurpOoDyLv1QbZaaI5PP42UoAJ8hhZ07I9Se8
	fL9w==
X-Gm-Message-State: AHQUAuYNb+Iv7YPLBwAiKx2rhd2cksGSJeYiZ4VhHspSeL5Cv0O+jRM+
	+Y6haVHmUZFwjv4Ob3WapomXRjsgIoo=
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr5047220wrw.76.1550879129008;
	Fri, 22 Feb 2019 15:45:29 -0800 (PST)
Received: from localhost.localdomain (bzq-84-109-209-49.cablep.bezeqint.net.
	[84.109.209.49])
	by smtp.gmail.com with ESMTPSA id o12sm5264918wre.0.2019.02.22.15.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Feb 2019 15:45:28 -0800 (PST)
From: michelheily@gmail.com
To: qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 01:38:06 +0200
Message-Id: <1550878686-23934-1-git-send-email-michelheily@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Fri, 22 Feb 2019 19:21:11 -0500
Subject: [Qemu-arm] [PATCH] hw/arm/stellaris: Implement watchdog timer
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
Cc: Michel Heily <michelheily@gmail.com>,
	"open list:Stellaris" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1B1IqaRo8uPh

From: Michel Heily <michelheily@gmail.com>

Signed-off-by: Michel Heily <michelheily@gmail.com>
---
 hw/arm/stellaris.c | 260 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 258 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 442529c..08baeb2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -348,6 +348,241 @@ static void stellaris_gptm_init(Object *obj)
 }
 
 
+/* Hardware watchdog. */
+
+#define TYPE_STELLARIS_WDTIMER "stellaris-wdtimer"
+#define STELLARIS_WDTIMER(obj) \
+    OBJECT_CHECK(wdtimer_state, (obj), TYPE_STELLARIS_WDTIMER)
+
+typedef struct wdtimer_state {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t control;
+    uint32_t load;
+    uint32_t tick;
+    uint32_t state;
+    uint32_t mask;
+    uint32_t stage;
+    bool locked;
+    bool reset;
+
+    struct wdtimer_state *opaque;
+    QEMUTimer *timer;
+    qemu_irq irq;
+} wdtimer_state;
+
+static void wdtimer_reset(wdtimer_state *s)
+{
+    s->load = 0xffffffff;
+    s->tick = 0xffffffff;
+    s->state = 0;
+    s->mask = 0;
+    s->locked = false;
+    s->reset = false;
+    s->stage = 1;
+}
+
+static void wdtimer_update_irq(wdtimer_state *s)
+{
+    int level;
+    level = (s->state & s->mask) != 0;
+    qemu_set_irq(s->irq, level);
+}
+
+
+static void wdtimer_reload(wdtimer_state *s, uint32_t stage)
+{
+    s->stage = stage;
+
+    uint64_t tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod(s->timer, tick + s->load * system_clock_scale);
+}
+
+static void wdtimer_expired(void *opaque)
+{
+    wdtimer_state **p = (wdtimer_state **)opaque;
+    wdtimer_state *s;
+
+    s = *p;
+
+    if (s->mask & 1) {
+        s->state = 1; /* assert IRQ */
+        wdtimer_update_irq(s);
+    }
+
+    if (s->stage == 1) {
+        wdtimer_reload(s, 2);
+
+    } else if (s->stage == 2) {
+        if (s->reset && (s->state & s->mask) != 0) {
+            qemu_log_mask(CPU_LOG_RESET,
+                          "WDT: system reset on 2nd time-out\n");
+            wdtimer_reset(s);
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+        } else {
+            wdtimer_reload(s, 1);
+        }
+    }
+}
+
+/* WDT offsets */
+#define WDT_O_LOAD              0x00000000
+#define WDT_O_VALUE             0x00000004
+#define WDT_O_CTL               0x00000008
+#define WDT_O_ICR               0x0000000C
+#define WDT_O_RIS               0x00000010
+#define WDT_O_MIS               0x00000014
+#define WDT_O_TEST              0x00000418
+#define WDT_O_LOCK              0x00000C00
+#define WDT_O_PeriphID4         0x00000FD0
+#define WDT_O_PeriphID5         0x00000FD4
+#define WDT_O_PeriphID6         0x00000FD8
+#define WDT_O_PeriphID7         0x00000FDC
+#define WDT_O_PeriphID0         0x00000FE0
+#define WDT_O_PeriphID1         0x00000FE4
+#define WDT_O_PeriphID2         0x00000FE8
+#define WDT_O_PeriphID3         0x00000FEC
+#define WDT_O_PCellID0          0x00000FF0
+#define WDT_O_PCellID1          0x00000FF4
+#define WDT_O_PCellID2          0x00000FF8
+#define WDT_O_PCellID3          0x00000FFC
+
+static uint64_t wdtimer_read(void *opaque, hwaddr offset,
+                          unsigned size)
+{
+    wdtimer_state *s = (wdtimer_state *)opaque;
+
+    switch (offset) {
+    case WDT_O_LOAD:
+        return s->load;
+    case WDT_O_VALUE:
+        return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    case WDT_O_CTL:
+        return s->control;
+    case WDT_O_RIS:
+        return s->state;
+    case WDT_O_MIS:
+        return s->state & s->mask;
+    case WDT_O_TEST:
+        qemu_log_mask(LOG_UNIMP,
+                      "WDT: stall not implemented\n");
+        return 0;
+    case WDT_O_LOCK:
+        return s->locked ? 1 : 0;
+    case WDT_O_PeriphID4: /* fallthrough */
+    case WDT_O_PeriphID5:
+    case WDT_O_PeriphID6:
+    case WDT_O_PeriphID7:
+    case WDT_O_PeriphID0:
+    case WDT_O_PeriphID1:
+    case WDT_O_PeriphID2:
+    case WDT_O_PeriphID3:
+        qemu_log_mask(LOG_UNIMP,
+                      "WDT: Peripheral identification not implemented\n");
+        return 0;
+    case WDT_O_PCellID0:
+    case WDT_O_PCellID1:
+    case WDT_O_PCellID2:
+    case WDT_O_PCellID3:
+        qemu_log_mask(LOG_UNIMP,
+                      "WDT: PrimieCell identification not implemented\n");
+        return 0;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "WDT: read at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
+        return 0;
+    }
+}
+
+static void wdtimer_write(void *opaque, hwaddr offset,
+                       uint64_t value, unsigned size)
+{
+    wdtimer_state *s = (wdtimer_state *)opaque;
+
+    if (s->locked) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "WDT: write to watchdog registers in locked state\n");
+        wdtimer_update_irq(s);
+        return;
+    }
+
+    switch (offset) {
+    case WDT_O_LOAD:
+        s->load = value;
+        wdtimer_reload(s, 1);
+        break;
+    case WDT_O_CTL:
+        if (!(s->mask & 1)) {
+            if (value & 2) {
+                s->reset = true;
+            }
+            if (value & 1) {
+                s->mask = value;
+                wdtimer_reload(s, 1);
+            }
+        }
+        break;
+    case WDT_O_ICR:
+        /* clear the interrupt and reload the counter */
+        s->state &= ~value;
+        wdtimer_reload(s, 1);
+        break;
+    case WDT_O_TEST:
+        qemu_log_mask(LOG_UNIMP,
+                      "WDT: stall not implemented\n");
+        break;
+    case WDT_O_LOCK:
+        s->locked = value == 0x1acce551;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "WDT: write at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
+    }
+    wdtimer_update_irq(s);
+}
+
+static const MemoryRegionOps wdtimer_ops = {
+    .read = wdtimer_read,
+    .write = wdtimer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_stellaris_wdtimer = {
+    .name = "stellaris_wdtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(control, wdtimer_state),
+        VMSTATE_UINT32(load, wdtimer_state),
+        VMSTATE_UINT32(tick, wdtimer_state),
+        VMSTATE_UINT32(state, wdtimer_state),
+        VMSTATE_UINT32(mask, wdtimer_state),
+        VMSTATE_UINT32(stage, wdtimer_state),
+        VMSTATE_BOOL(locked, wdtimer_state),
+        VMSTATE_BOOL(reset, wdtimer_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void stellaris_wdtimer_init(Object *obj)
+{
+    wdtimer_state *s = STELLARIS_WDTIMER(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    sysbus_init_irq(sbd, &s->irq);
+    memory_region_init_io(&s->iomem, obj, &wdtimer_ops, s,
+                          "wdtimer", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    s->opaque = s;
+
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, wdtimer_expired, &s->opaque);
+    wdtimer_reset(s);
+}
+
+
 /* System controller.  */
 
 typedef struct {
@@ -1243,7 +1478,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      * Stellaris LM3S6965 Microcontroller Data Sheet (rev I)
      * http://www.ti.com/lit/ds/symlink/lm3s6965.pdf
      *
-     * 40000000 wdtimer (unimplemented)
+     * 40000000 wdtimer
      * 40002000 i2c (unimplemented)
      * 40004000 GPIO
      * 40005000 GPIO
@@ -1335,6 +1570,12 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
+    if (board->dc1 & (1  << 3)) { /* watchdog present */
+        dev  = sysbus_create_simple(TYPE_STELLARIS_WDTIMER,
+                                    0x40000000,
+                                    qdev_get_gpio_in(nvic, 18));
+    }
+
     stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
                        board, nd_table[0].macaddr.a);
 
@@ -1431,7 +1672,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* Add dummy regions for the devices we don't implement yet,
      * so guest accesses don't cause unlogged crashes.
      */
-    create_unimplemented_device("wdtimer", 0x40000000, 0x1000);
     create_unimplemented_device("i2c-0", 0x40002000, 0x1000);
     create_unimplemented_device("i2c-2", 0x40021000, 0x1000);
     create_unimplemented_device("PWM", 0x40028000, 0x1000);
@@ -1517,6 +1757,13 @@ static void stellaris_gptm_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_stellaris_gptm;
 }
 
+static void stellaris_wdtimer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_stellaris_wdtimer;
+}
+
 static const TypeInfo stellaris_gptm_info = {
     .name          = TYPE_STELLARIS_GPTM,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -1525,6 +1772,14 @@ static const TypeInfo stellaris_gptm_info = {
     .class_init    = stellaris_gptm_class_init,
 };
 
+static const TypeInfo stellaris_wdtimer_info = {
+    .name          = TYPE_STELLARIS_WDTIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(wdtimer_state),
+    .instance_init = stellaris_wdtimer_init,
+    .class_init    = stellaris_wdtimer_class_init,
+};
+
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1545,6 +1800,7 @@ static void stellaris_register_types(void)
     type_register_static(&stellaris_i2c_info);
     type_register_static(&stellaris_gptm_info);
     type_register_static(&stellaris_adc_info);
+    type_register_static(&stellaris_wdtimer_info);
 }
 
 type_init(stellaris_register_types)
-- 
2.7.4

