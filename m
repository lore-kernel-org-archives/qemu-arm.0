Received: by 10.80.166.35 with SMTP id d32csp717564edc;
        Tue, 1 Nov 2016 08:28:43 -0700 (PDT)
X-Received: by 10.31.193.71 with SMTP id r68mr7805212vkf.114.1478014123348;
        Tue, 01 Nov 2016 08:28:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e38si13787786uaa.196.2016.11.01.08.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Nov 2016 08:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1azS-0007nw-MT
	for alex.bennee@linaro.org; Tue, 01 Nov 2016 11:28:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1azM-0007lf-Pf
	for qemu-arm@nongnu.org; Tue, 01 Nov 2016 11:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c1azJ-0004Y7-MO
	for qemu-arm@nongnu.org; Tue, 01 Nov 2016 11:28:36 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:43812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c1azJ-0004Xb-GH; Tue, 01 Nov 2016 11:28:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 63EDC11810AA;
	Tue,  1 Nov 2016 16:28:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6Jxf6iCSPVKM; Tue,  1 Nov 2016 16:28:29 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 269C411810A3;
	Tue,  1 Nov 2016 16:28:29 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id F2279466BFF; Tue,  1 Nov 2016 16:28:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Date: Tue,  1 Nov 2016 16:28:19 +0100
Message-Id: <20161101152819.18906-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: Fix typo in member names
 of GICv3ITSState
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tzEdvQzqU/h/

translater -> translator (found by codespell)

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/intc/arm_gicv3_its_kvm.c            | 10 +++++-----
 include/hw/intc/arm_gicv3_its_common.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index fc246e0..c3e074d 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -33,18 +33,18 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
 {
     struct kvm_msi msi;
 
-    if (unlikely(!s->translater_gpa_known)) {
+    if (unlikely(!s->translator_gpa_known)) {
         MemoryRegion *mr = &s->iomem_its_translation;
         MemoryRegionSection mrs;
 
         mrs = memory_region_find(mr, 0, 1);
         memory_region_unref(mrs.mr);
-        s->gits_translater_gpa = mrs.offset_within_address_space + 0x40;
-        s->translater_gpa_known = true;
+        s->gits_translator_gpa = mrs.offset_within_address_space + 0x40;
+        s->translator_gpa_known = true;
     }
 
-    msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
-    msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
+    msi.address_lo = extract64(s->gits_translator_gpa, 0, 32);
+    msi.address_hi = extract64(s->gits_translator_gpa, 32, 32);
     msi.data = le32_to_cpu(value);
     msi.flags = KVM_MSI_VALID_DEVID;
     msi.devid = devid;
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 1ba1894..00aa04d 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -38,8 +38,8 @@ struct GICv3ITSState {
     GICv3State *gicv3;
 
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
-    uint64_t gits_translater_gpa;
-    bool translater_gpa_known;
+    uint64_t gits_translator_gpa;
+    bool translator_gpa_known;
 
     /* Registers */
     uint32_t ctlr;
-- 
2.10.1

