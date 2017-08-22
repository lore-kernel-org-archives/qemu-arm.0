Received: by 10.223.188.70 with SMTP id a6csp5078656wrh;
        Tue, 22 Aug 2017 08:22:26 -0700 (PDT)
X-Received: by 10.55.92.199 with SMTP id q190mr1571152qkb.127.1503415346232;
        Tue, 22 Aug 2017 08:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415346; cv=none;
        d=google.com; s=arc-20160816;
        b=fHTYUceRQ7dPlNQ+ICpv1KPYpyjHmrh2GkdPXeY7r7UXIC+2X7KpwP7eI7z4MSMgUk
         aY2vH/9xsDUsUVpq1NeiTnIMChQWgX3e5KfZP8kaaRyHbv8h/dsMtwGBOlsKpMANjFUp
         7atraJoxYd6u/9/xMjX8AJd4iXYDTUjkvQ6hTPy6svKd4Fv0/HDVIhTGjGl3oEdyBoq9
         vP4VZFF6UZXVyAboDgRXX0wXPGr1veilM0nVhl8seNSzmOacNT4waFIiSM3TRgZCTx//
         /HTF68uEbfQs1WI7pTzaTxrt1oziXphVI7AoW0+OXoAQfEMU1FQfbZMd9gVf3Kr8R37A
         5JsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NVR8daCllQZEGcqq9pMnjnFCUcSOnndLSUTX08xOwWw=;
        b=xEGUOLc3Tc6pgMvP8PzrTXMl9sIuT8vF4AzGE5Mj5ZQcP2KmZj2qTyR+QCd3IbJZ7Z
         nhQlZR8kR2KrBq+mJDsERpUelTIhsJabIuk+rvloU53wysHOhxOGZrptBtfBFuqgZXMr
         BpjvDIgGeWapgBpIerpLlyWnOmmYZpNFVbCQtYwiOMBSTQka0iRXQdojK7PefbtFPw2V
         XOTq82hwgeHmtD5detEABLvJxl4EQZsvn+Qfme878lMpj2eauLE24RwX0M/gpYswGNhf
         8bAXjrmlchlwSY1k6x5AYSy5YG4uXxslkec9TZ5B5Nsm4vHh0Rz5uGqCm/sa8cJyDXqh
         ANiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n1si13755363qkc.535.2017.08.22.08.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB0Z-0000e0-Q6
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAns-0006XU-U5
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnp-0003FQ-77
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:16 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAni-00031e-Lm; Tue, 22 Aug 2017 11:09:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAng-0004ho-IY; Tue, 22 Aug 2017 16:09:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:49 +0100
Message-Id: <1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS region
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
X-TUID: /2CL2zDjTugU

For v8M the range 0xe002e000..0xe002efff is an alias region which
for secure accesses behaves like a NonSecure access to the main
SCS region. (For nonsecure accesses including when the security
extension is not implemented, it is RAZ/WI.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  1 +
 hw/intc/armv7m_nvic.c         | 66 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 1d145fb..1a4cce7 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -50,6 +50,7 @@ typedef struct NVICState {
     int exception_prio; /* group prio of the highest prio active exception */
 
     MemoryRegion sysregmem;
+    MemoryRegion sysreg_ns_mem;
     MemoryRegion container;
 
     uint32_t num_irq;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index babdc3b..2b0b328 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1040,6 +1040,47 @@ static const MemoryRegionOps nvic_sysreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
+                                        uint64_t value, unsigned size,
+                                        MemTxAttrs attrs)
+{
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return nvic_sysreg_write(opaque, addr, value, size, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
+                                       uint64_t *data, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return nvic_sysreg_read(opaque, addr, data, size, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        *data = 0;
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps nvic_sysreg_ns_ops = {
+    .read_with_attrs = nvic_sysreg_ns_read,
+    .write_with_attrs = nvic_sysreg_ns_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static int nvic_post_load(void *opaque, int version_id)
 {
     NVICState *s = opaque;
@@ -1141,6 +1182,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     NVICState *s = NVIC(dev);
     SysBusDevice *systick_sbd;
     Error *err = NULL;
+    int regionlen;
 
     s->cpu = ARM_CPU(qemu_get_cpu(0));
     assert(s->cpu);
@@ -1173,8 +1215,23 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
      *  0xd00..0xd3c - SCS registers
      *  0xd40..0xeff - Reserved or Not implemented
      *  0xf00 - STIR
+     *
+     * Some registers within this space are banked between security states.
+     * In v8M there is a second range 0xe002e000..0xe002efff which is the
+     * NonSecure alias SCS; secure accesses to this behave like NS accesses
+     * to the main SCS range, and non-secure accesses (including when
+     * the security extension is not implemented) are RAZ/WI.
+     * Note that both the main SCS range and the alias range are defined
+     * to be exempt from memory attribution (R_BLJT) and so the memory
+     * transaction attribute always matches the current CPU security
+     * state (attrs.secure == env->v7m.secure). In the nvic_sysreg_ns_ops
+     * wrappers we change attrs.secure to indicate the NS access; so
+     * generally code determining which banked register to use should
+     * use attrs.secure; code determining actual behaviour of the system
+     * should use env->v7m.secure.
      */
-    memory_region_init(&s->container, OBJECT(s), "nvic", 0x1000);
+    regionlen = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? 0x21000 : 0x1000;
+    memory_region_init(&s->container, OBJECT(s), "nvic", regionlen);
     /* The system register region goes at the bottom of the priority
      * stack as it covers the whole page.
      */
@@ -1185,6 +1242,13 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                                         sysbus_mmio_get_region(systick_sbd, 0),
                                         1);
 
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
+        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
+                              &nvic_sysreg_ns_ops, s,
+                              "nvic_sysregs_ns", 0x1000);
+        memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
+    }
+
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
 }
 
-- 
2.7.4

