Received: by 10.182.105.169 with SMTP id gn9csp902636obb;
        Sun, 8 Nov 2015 17:20:36 -0800 (PST)
X-Received: by 10.141.28.76 with SMTP id f73mr27686969qhe.17.1447032036788;
        Sun, 08 Nov 2015 17:20:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si9354541qki.4.2015.11.08.17.20.36
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb8O-00066Y-Ep
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:20:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1R-0001Ll-2t
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0007xE-Of
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c]:36422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1O-0007x5-JE; Sun, 08 Nov 2015 20:13:22 -0500
Received: by qgad10 with SMTP id d10so132319591qga.3;
	Sun, 08 Nov 2015 17:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2KSKOOmijY8eUIFR1ZaUK3z+EegCoqyrfRFHlU0kuLY=;
	b=zVvqPHN0ToYMo0YWkP2jfQtfXv1jhJkfKCSt/p/K9i78Dl9wWNzCNvuIMIHhZ1zH0F
	qOv5hSQYpG78W/H2JSLPFBWfWZ4pUNuhiqZh9Eifn3XD4HBe9Xwox8qqzPBU/w2SyOGw
	J1hc8GEXBK1G3UlGU4bWUg3bTu0yPsHKITltG6x1xuBkeQTZwI0KBxLAOlOZKXT6R0vl
	aeJ4m749BdRqeqcS2BAwEFsrXQ1qTdDgwaZbtdKd7kq9n1LzmB941eWESfYRAoU5ylHN
	elp8zrx8oDzx6mGDNXPklk8VjXJLrKjnaSb/A9O+VVsaJd3u0SByYKwFHirdpJPwwJ2m
	0kCA==
X-Received: by 10.140.222.80 with SMTP id s77mr27838119qhb.21.1447031602182;
	Sun, 08 Nov 2015 17:13:22 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:21 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:37 -0500
Message-Id: <1447031505-12477-11-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22c
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 10/18] armv7m: NVIC initialization
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iYfrK7J/GRX6

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 107 ++++++++++++++++++++++++--------------------------
 1 file changed, 51 insertions(+), 56 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c860b36..8eaf677 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -827,7 +827,7 @@ int nvic_post_load(void *opaque, int version_id)
         set_prio(s, i, s->vectors[i].raw_prio);
     }
 
-    nvic_irq_update(s, highest_runnable_prio(s->cpu));
+    nvic_irq_update(s, 0);
 
     return 0;
 }
@@ -883,66 +883,66 @@ static const VMStateDescription vmstate_nvic = {
     }
 };
 
+static Property props_nvic[] = {
+    DEFINE_PROP_UINT32("num-irq", nvic_state, num_irq, 64),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void armv7m_nvic_reset(DeviceState *dev)
 {
     nvic_state *s = NVIC(dev);
-    NVICClass *nc = NVIC_GET_CLASS(s);
-    nc->parent_reset(dev);
-    /* Common GIC reset resets to disabled; the NVIC doesn't have
-     * per-CPU interfaces so mark our non-existent CPU interface
-     * as enabled by default, and with a priority mask which allows
-     * all interrupts through.
-     */
-    s->gic.cpu_ctlr[0] = GICC_CTLR_EN_GRP0;
-    s->gic.priority_mask[0] = 0x100;
-    /* The NVIC as a whole is always enabled. */
-    s->gic.ctlr = 1;
+
+    s->vectors[ARMV7M_EXCP_RESET].enabled = 1;
+    s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
+    s->vectors[ARMV7M_EXCP_HARD].enabled = 1;
+    s->vectors[ARMV7M_EXCP_SVC].enabled = 1;
+    s->vectors[ARMV7M_EXCP_DEBUG].enabled = 1;
+    s->vectors[ARMV7M_EXCP_PENDSV].enabled = 1;
+
+    s->vectors[ARMV7M_EXCP_RESET].prio_group = -3;
+    s->vectors[ARMV7M_EXCP_NMI].prio_group = -2;
+    s->vectors[ARMV7M_EXCP_HARD].prio_group = -1;
+
     systick_reset(s);
 }
 
 static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 {
     nvic_state *s = NVIC(dev);
-    NVICClass *nc = NVIC_GET_CLASS(s);
-    Error *local_err = NULL;
-
-    /* The NVIC always has only one CPU */
-    s->gic.num_cpu = 1;
-    /* Tell the common code we're an NVIC */
-    s->gic.revision = 0xffffffff;
-    s->num_irq = s->gic.num_irq;
-    nc->parent_realize(dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+
+    /* evil hack to get ARMCPU* ahead of time */
+    assert(cpus.tqh_first);
+    assert(!CPU_NEXT(cpus.tqh_first));
+    s->cpu = ARM_CPU(cpus.tqh_first);
+    assert(s->cpu);
+
+    if (s->num_irq > NVIC_MAX_IRQ) {
+        error_setg(errp, TYPE_NVIC " num_irq too large");
         return;
     }
-    gic_init_irqs_and_distributor(&s->gic);
-    /* The NVIC and system controller register area looks like this:
-     *  0..0xff : system control registers, including systick
-     *  0x100..0xcff : GIC-like registers
-     *  0xd00..0xfff : system control registers
-     * We use overlaying to put the GIC like registers
-     * over the top of the system control register region.
-     */
-    memory_region_init(&s->container, OBJECT(s), "nvic", 0x1000);
-    /* The system register region goes at the bottom of the priority
-     * stack as it covers the whole page.
+
+    qdev_init_gpio_in(dev, set_irq_level, s->num_irq);
+
+    s->num_irq += 16; /* include space for internal exception vectors */
+
+    /* The NVIC and system controller register area starts at 0xe000e000
+     * and looks like this:
+     *  0x004 - ICTR
+     *  0x010 - 0x1c - systick
+     *  0x100..0x7ec - NVIC
+     *  0x7f0..0xcff - Reserved
+     *  0xd00..0xd3c - SCS registers
+     *  0xd40..0xeff - Reserved or Not implemented
+     *  0xf00 - STIR
      */
-    memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &nvic_sysreg_ops, s,
                           "nvic_sysregs", 0x1000);
-    memory_region_add_subregion(&s->container, 0, &s->sysregmem);
-    /* Alias the GIC region so we can get only the section of it
-     * we need, and layer it on top of the system register region.
-     */
-    memory_region_init_alias(&s->gic_iomem_alias, OBJECT(s),
-                             "nvic-gic", &s->gic.iomem,
-                             0x100, 0xc00);
-    memory_region_add_subregion_overlap(&s->container, 0x100,
-                                        &s->gic_iomem_alias, 1);
+
     /* Map the whole thing into system memory at the location required
      * by the v7M architecture.
      */
-    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
+    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->iomem);
     s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
 }
 
@@ -954,36 +954,31 @@ static void armv7m_nvic_instance_init(Object *obj)
      * any user-specified property setting, so just modify the
      * value in the GICState struct.
      */
-    GICState *s = ARM_GIC_COMMON(obj);
     DeviceState *dev = DEVICE(obj);
     nvic_state *nvic = NVIC(obj);
-    /* The ARM v7m may have anything from 0 to 496 external interrupt
-     * IRQ lines. We default to 64. Other boards may differ and should
-     * set the num-irq property appropriately.
-     */
-    s->num_irq = 64;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
 }
 
 static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
 {
-    NVICClass *nc = NVIC_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    nc->parent_reset = dc->reset;
-    nc->parent_realize = dc->realize;
     dc->vmsd  = &vmstate_nvic;
+    dc->props = props_nvic;
     dc->reset = armv7m_nvic_reset;
     dc->realize = armv7m_nvic_realize;
 }
 
 static const TypeInfo armv7m_nvic_info = {
     .name          = TYPE_NVIC,
-    .parent        = TYPE_ARM_GIC_COMMON,
+    .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = armv7m_nvic_instance_init,
     .instance_size = sizeof(nvic_state),
     .class_init    = armv7m_nvic_class_init,
-    .class_size    = sizeof(NVICClass),
+    .class_size    = sizeof(SysBusDeviceClass),
 };
 
 static void armv7m_nvic_register_types(void)
-- 
2.1.4

