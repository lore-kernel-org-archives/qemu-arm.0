Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6394484wrt;
        Mon, 21 Jan 2019 11:11:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4WlleSMAnKSrveQM466XuET/UmyHHMt0Oz3tcYUrVEuvFN7noatfiCT7mmbG0vvACLflBM
X-Received: by 2002:adf:ae41:: with SMTP id u1mr27994508wrd.20.1548097885432;
        Mon, 21 Jan 2019 11:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548097885; cv=none;
        d=google.com; s=arc-20160816;
        b=mC7VHmYAKPu8y1Cr5uaGhv6xE6C0pmDyRjpRuPmx+MFayCsmX/zW3reeJVxG7jWO8H
         /rBjV6MhrwcBmjnK3jDsF1Lt4mBd1k3AtbIMvIT22giHaEIN7OO9IjcouWUKUeTruwCD
         soNx1/s+oZHjVsLBgf1kEwZ8eLXxvgVUGfufdK7x6qrGb5DKOSjd2wVe5kVA5vxD+yuk
         DoA/wju95b+AUkMAlJNfKR70Sbs3cFS9HWC3hDdNOebgmc1/RsagWIFI+Uj0VmyZLg5Q
         xuGpON32B6EV+Bwam1Y73GstykR/dJ13DkIYetMAurBLT42qU3sgdt2VwuT2hYPdwHo3
         X7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GwOkcaqB4nWlxWAy1SiSdUxzJLjM4/IN2mfdSNwClek=;
        b=lztClFd6iilQenghegxtNHyzWmuY1Zzf61+En8b32nhwX/zCWl2JtaP8Ree/Yqcru7
         wYOLjrDirke6g5cR7h6bNwPjEduJb8PwQlTsYC/ydlr3atmFfouHMvv5bEQMPyHq5N6b
         tdFnDNESYOl5UebxWCNWW17vjRzj3aAebNagxLU/CcI6H2sT8Q9RVNuMNj8FWVKg95B5
         l3qkMiJObOzt9QZI7RcmG/v2B8D7yxmmQpN9PzqQP4Uv7nWcySeYdDz5fJKN35czrqHM
         23LnSDlkfyj/M80S2pZrdYmxJ42XeLJBIyQ7GQCAMkxWNNad8o84DhIbifg3Tni5vGo0
         b0AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYRKVfhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si58524686wru.43.2019.01.21.11.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYRKVfhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gleyi-0002Ci-8h
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleui-0007jF-9f
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefT-0002dr-6j
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:32 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefR-0002bk-B9
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:31 -0500
Received: by mail-wr1-x444.google.com with SMTP id t6so24556309wrr.12
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GwOkcaqB4nWlxWAy1SiSdUxzJLjM4/IN2mfdSNwClek=;
	b=NYRKVfhK0bl0+Rx6WK64jDuRfNTgKFq3Ifv/AFF9m3+CxYnmDg795Y6zahCpFxUgWI
	LZOq98MmawMUasCmvAvsmwwFeNsQ6kk6+8FqxGEx2mvvWFMgQzc+o5VJ51OGIkRc5lwn
	r6TY9shzKF/7d0q1VTHofuS24pMdG+iguf06w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GwOkcaqB4nWlxWAy1SiSdUxzJLjM4/IN2mfdSNwClek=;
	b=ABM8zn+tTwtxltcjpJrN/L6wAq6CP1gFXnwDG3DB4Js6rH9mRpP/yXjFiEnrRialse
	dlLz7XpLdAgnn7W+hb5OTj/nZKpTLycFB7AKi/s7sRaNpoU79gN4NJ3+59/1Foywuepv
	O1i/1U7swDyHE7FsB+nXsQIVDvCGbL1feETo7F0vnIvs9DUcDZ6BTwQ8cFXe/hBqjOrV
	/x9+eU+bFpCJbL8Iuxv+8iWiX9iWRWSgiQAKbez9bp+ZhLo0Gzv+78ZeoBTRO15rutap
	5s57DqVv0PGG4O9025mpipaONT/5OuTYtFW3ikOVCSdDrQChq9F+vOM/b8P6NMVuFztj
	hHvQ==
X-Gm-Message-State: AJcUukfII5oXc4TbUjy0KfPBEIX+fg88puNIQEd6zyLgZWG2ftKXRY+e
	yreOofnUaq+paxTguGU+jshUyQ==
X-Received: by 2002:adf:f848:: with SMTP id d8mr31169495wrq.178.1548096687479; 
	Mon, 21 Jan 2019 10:51:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:01 +0000
Message-Id: <20190121185118.18550-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 06/23] hw/arm/iotkit: Rename 'iotkit' local
 variables and functions
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
X-TUID: ZmbsZVk9uYXr

Rename various internal uses of 'iotkit' in hw/arm/iotkit.c to
'armsse', for consistency. The remaining occurences are:
 * related to the devices TYPE_IOTKIT_SYSCTL, TYPE_IOTKIT_SYSINFO,
   etc, which this refactor is not touching
 * references that apply specifically to the IoTKit (like
   the lack of a private CPU region)
 * the vmstate, which keeps its old "iotkit" name for
   migration compatibility reasons

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/iotkit.c | 68 ++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index d5b172933c3..7ff14fd5aef 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -56,7 +56,7 @@ static void nsccfg_handler(void *opaque, int n, int level)
     s->nsccfg = level;
 }
 
-static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
+static void armsse_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
 {
     /* Each of the 4 AHB and 4 APB PPCs that might be present in a
      * system using the ARMSSE has a collection of control lines which
@@ -65,22 +65,22 @@ static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
      * code using the ARMSSE can wire them up to the PPCs.
      */
     SplitIRQ *splitter = &s->ppc_irq_splitter[ppcnum];
-    DeviceState *iotkitdev = DEVICE(s);
+    DeviceState *armssedev = DEVICE(s);
     DeviceState *dev_secctl = DEVICE(&s->secctl);
     DeviceState *dev_splitter = DEVICE(splitter);
     char *name;
 
     name = g_strdup_printf("%s_nonsec", ppcname);
-    qdev_pass_gpios(dev_secctl, iotkitdev, name);
+    qdev_pass_gpios(dev_secctl, armssedev, name);
     g_free(name);
     name = g_strdup_printf("%s_ap", ppcname);
-    qdev_pass_gpios(dev_secctl, iotkitdev, name);
+    qdev_pass_gpios(dev_secctl, armssedev, name);
     g_free(name);
     name = g_strdup_printf("%s_irq_enable", ppcname);
-    qdev_pass_gpios(dev_secctl, iotkitdev, name);
+    qdev_pass_gpios(dev_secctl, armssedev, name);
     g_free(name);
     name = g_strdup_printf("%s_irq_clear", ppcname);
-    qdev_pass_gpios(dev_secctl, iotkitdev, name);
+    qdev_pass_gpios(dev_secctl, armssedev, name);
     g_free(name);
 
     /* irq_status is a little more tricky, because we need to
@@ -96,15 +96,15 @@ static void iotkit_forward_ppc(ARMSSE *s, const char *ppcname, int ppcnum)
     qdev_connect_gpio_out(dev_splitter, 1,
                           qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), ppcnum));
     s->irq_status_in[ppcnum] = qdev_get_gpio_in(dev_splitter, 0);
-    qdev_init_gpio_in_named_with_opaque(iotkitdev, irq_status_forwarder,
+    qdev_init_gpio_in_named_with_opaque(armssedev, irq_status_forwarder,
                                         s->irq_status_in[ppcnum], name, 1);
     g_free(name);
 }
 
-static void iotkit_forward_sec_resp_cfg(ARMSSE *s)
+static void armsse_forward_sec_resp_cfg(ARMSSE *s)
 {
     /* Forward the 3rd output from the splitter device as a
-     * named GPIO output of the iotkit object.
+     * named GPIO output of the armsse object.
      */
     DeviceState *dev = DEVICE(s);
     DeviceState *dev_splitter = DEVICE(&s->sec_resp_splitter);
@@ -115,12 +115,12 @@ static void iotkit_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
-static void iotkit_init(Object *obj)
+static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARMSSE(obj);
     int i;
 
-    memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
+    memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
 
     sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
                           TYPE_ARMV7M);
@@ -160,9 +160,9 @@ static void iotkit_init(Object *obj)
                           sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
     sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
                           sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
-    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl,
+    sysbus_init_child_obj(obj, "armsse-sysctl", &s->sysctl,
                           sizeof(s->sysctl), TYPE_IOTKIT_SYSCTL);
-    sysbus_init_child_obj(obj, "iotkit-sysinfo", &s->sysinfo,
+    sysbus_init_child_obj(obj, "armsse-sysinfo", &s->sysinfo,
                           sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
@@ -183,20 +183,20 @@ static void iotkit_init(Object *obj)
     }
 }
 
-static void iotkit_exp_irq(void *opaque, int n, int level)
+static void armsse_exp_irq(void *opaque, int n, int level)
 {
     ARMSSE *s = ARMSSE(opaque);
 
     qemu_set_irq(s->exp_irqs[n], level);
 }
 
-static void iotkit_mpcexp_status(void *opaque, int n, int level)
+static void armsse_mpcexp_status(void *opaque, int n, int level)
 {
     ARMSSE *s = ARMSSE(opaque);
     qemu_set_irq(s->mpcexp_status_in[n], level);
 }
 
-static void iotkit_realize(DeviceState *dev, Error **errp)
+static void armsse_realize(DeviceState *dev, Error **errp)
 {
     ARMSSE *s = ARMSSE(dev);
     int i;
@@ -287,7 +287,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->exp_numirq; i++) {
         s->exp_irqs[i] = qdev_get_gpio_in(DEVICE(&s->armv7m), i + 32);
     }
-    qdev_init_gpio_in_named(dev, iotkit_exp_irq, "EXP_IRQ", s->exp_numirq);
+    qdev_init_gpio_in_named(dev, armsse_exp_irq, "EXP_IRQ", s->exp_numirq);
 
     /* Set up the big aliases first */
     make_alias(s, &s->alias1, "alias 1", 0x10000000, 0x10000000, 0x00000000);
@@ -336,7 +336,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
                                 qdev_get_gpio_in(dev_splitter, 0));
 
     /* This RAM lives behind the Memory Protection Controller */
-    memory_region_init_ram(&s->sram0, NULL, "iotkit.sram0", 0x00008000, &err);
+    memory_region_init_ram(&s->sram0, NULL, "armsse.sram0", 0x00008000, &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -608,14 +608,14 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < IOTS_NUM_AHB_EXP_PPC; i++) {
         char *ppcname = g_strdup_printf("ahb_ppcexp%d", i);
 
-        iotkit_forward_ppc(s, ppcname, i);
+        armsse_forward_ppc(s, ppcname, i);
         g_free(ppcname);
     }
 
     for (i = 0; i < IOTS_NUM_APB_EXP_PPC; i++) {
         char *ppcname = g_strdup_printf("apb_ppcexp%d", i);
 
-        iotkit_forward_ppc(s, ppcname, i + IOTS_NUM_AHB_EXP_PPC);
+        armsse_forward_ppc(s, ppcname, i + IOTS_NUM_AHB_EXP_PPC);
         g_free(ppcname);
     }
 
@@ -672,10 +672,10 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     /* Create GPIO inputs which will pass the line state for our
      * mpcexp_irq inputs to the correct splitter devices.
      */
-    qdev_init_gpio_in_named(dev, iotkit_mpcexp_status, "mpcexp_status",
+    qdev_init_gpio_in_named(dev, armsse_mpcexp_status, "mpcexp_status",
                             IOTS_NUM_EXP_MPC);
 
-    iotkit_forward_sec_resp_cfg(s);
+    armsse_forward_sec_resp_cfg(s);
 
     /* Forward the MSC related signals */
     qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
@@ -695,7 +695,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
 }
 
-static void iotkit_idau_check(IDAUInterface *ii, uint32_t address,
+static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
                               int *iregion, bool *exempt, bool *ns, bool *nsc)
 {
     /*
@@ -713,7 +713,7 @@ static void iotkit_idau_check(IDAUInterface *ii, uint32_t address,
     *iregion = region;
 }
 
-static const VMStateDescription iotkit_vmstate = {
+static const VMStateDescription armsse_vmstate = {
     .name = "iotkit",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -723,7 +723,7 @@ static const VMStateDescription iotkit_vmstate = {
     }
 };
 
-static Property iotkit_properties[] = {
+static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
@@ -731,24 +731,24 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static void iotkit_reset(DeviceState *dev)
+static void armsse_reset(DeviceState *dev)
 {
     ARMSSE *s = ARMSSE(dev);
 
     s->nsccfg = 0;
 }
 
-static void iotkit_class_init(ObjectClass *klass, void *data)
+static void armsse_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(klass);
     ARMSSEClass *asc = ARMSSE_CLASS(klass);
 
-    dc->realize = iotkit_realize;
-    dc->vmsd = &iotkit_vmstate;
-    dc->props = iotkit_properties;
-    dc->reset = iotkit_reset;
-    iic->check = iotkit_idau_check;
+    dc->realize = armsse_realize;
+    dc->vmsd = &armsse_vmstate;
+    dc->props = armsse_properties;
+    dc->reset = armsse_reset;
+    iic->check = armsse_idau_check;
     asc->info = data;
 }
 
@@ -756,7 +756,7 @@ static const TypeInfo armsse_info = {
     .name = TYPE_ARMSSE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ARMSSE),
-    .instance_init = iotkit_init,
+    .instance_init = armsse_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_IDAU_INTERFACE },
@@ -774,7 +774,7 @@ static void armsse_register_types(void)
         TypeInfo ti = {
             .name = armsse_variants[i].name,
             .parent = TYPE_ARMSSE,
-            .class_init = iotkit_class_init,
+            .class_init = armsse_class_init,
             .class_data = (void *)&armsse_variants[i],
         };
         type_register(&ti);
-- 
2.20.1

