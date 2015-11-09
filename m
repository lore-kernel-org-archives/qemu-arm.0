Received: by 10.182.105.169 with SMTP id gn9csp901781obb;
        Sun, 8 Nov 2015 17:17:48 -0800 (PST)
X-Received: by 10.141.28.136 with SMTP id f130mr28046687qhe.66.1447031868542;
        Sun, 08 Nov 2015 17:17:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o81si9300628qhb.80.2015.11.08.17.17.48
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb5g-0000kw-Bg
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:17:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1P-0001LJ-PR
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1N-0007wV-Vx
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:23 -0500
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236]:33478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1N-0007wQ-Rr; Sun, 08 Nov 2015 20:13:21 -0500
Received: by qgea14 with SMTP id a14so50581422qge.0;
	Sun, 08 Nov 2015 17:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=42BBENRFpu52VV/vv+IsUOCC3hNzbbllz/YBqtS9q+E=;
	b=sDqfG4byFFByUc2C14O8bTpNvBaKp8uYf71GYhXZVb6KbPQeBj9wwhxocKKewXKG4X
	TGd0eaGSZJe8QdaQghWKdClsV0fHk0GqLH52ceV8SX6qGTLTqdLtILZMGvVd+N0FMbYL
	OKfuSVxwcSEXnIz7oW3meGreGUJ+pROrzR4ssCcQMJIVaQCXpQjgD95Omv0u7TmK2uvm
	YkXmQeIabf0d4cJMxXA1GeGZnktgT9kLiyUgSRzUu9pilzxI0YYkFZpBZlZYKTLvTUmT
	xyspL8fNve9muM/CrIyv9mjQQ9QQ+sj2UZLYxjFNIkrjbDZIViz/POPNgskwCS4GuLMD
	Fsvw==
X-Received: by 10.140.232.70 with SMTP id d67mr28774912qhc.62.1447031601473;
	Sun, 08 Nov 2015 17:13:21 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:21 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:36 -0500
Message-Id: <1447031505-12477-10-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 09/18] armv7m: NVIC update vmstate
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
X-TUID: VIqiFwlsvDvy

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3b10dee..c860b36 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -810,15 +810,75 @@ static const MemoryRegionOps nvic_sysreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static
+int nvic_post_load(void *opaque, int version_id)
+{
+    nvic_state *s = opaque;
+    unsigned i;
+
+    /* evil hack to get ARMCPU* ahead of time */
+    assert(cpus.tqh_first);
+    assert(!CPU_NEXT(cpus.tqh_first));
+    s->cpu = ARM_CPU(cpus.tqh_first);
+    assert(s->cpu);
+
+    /* recalculate priorities */
+    for (i = 4; i < s->num_irq; i++) {
+        set_prio(s, i, s->vectors[i].raw_prio);
+    }
+
+    nvic_irq_update(s, highest_runnable_prio(s->cpu));
+
+    return 0;
+}
+
+static
+int vec_info_get(QEMUFile *f, void *pv, size_t size)
+{
+    vec_info *I = pv;
+    I->prio_sub = qemu_get_be16(f);
+    I->prio_group = qemu_get_byte(f);
+    I->raw_prio = qemu_get_ubyte(f);
+    I->enabled = qemu_get_ubyte(f);
+    I->pending = qemu_get_ubyte(f);
+    I->active = qemu_get_ubyte(f);
+    I->level = qemu_get_ubyte(f);
+    return 0;
+}
+
+static
+void vec_info_put(QEMUFile *f, void *pv, size_t size)
+{
+    vec_info *I = pv;
+    qemu_put_be16(f, I->prio_sub);
+    qemu_put_byte(f, I->prio_group);
+    qemu_put_ubyte(f, I->raw_prio);
+    qemu_put_ubyte(f, I->enabled);
+    qemu_put_ubyte(f, I->pending);
+    qemu_put_ubyte(f, I->active);
+    qemu_put_ubyte(f, I->level);
+}
+
+static const VMStateInfo vmstate_info = {
+    .name = "armv7m_nvic_info",
+    .get = vec_info_get,
+    .put = vec_info_put,
+};
+
 static const VMStateDescription vmstate_nvic = {
     .name = "armv7m_nvic",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .post_load = &nvic_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_ARRAY(vectors, nvic_state, NVIC_MAX_VECTORS, 0,
+                      vmstate_info, vec_info),
+        VMSTATE_UINT8(prigroup, nvic_state),
         VMSTATE_UINT32(systick.control, nvic_state),
         VMSTATE_UINT32(systick.reload, nvic_state),
         VMSTATE_INT64(systick.tick, nvic_state),
         VMSTATE_TIMER_PTR(systick.timer, nvic_state),
+        VMSTATE_UINT32(num_irq, nvic_state),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.1.4

