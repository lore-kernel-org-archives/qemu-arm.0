Received: by 10.223.188.70 with SMTP id a6csp1438141wrh;
        Wed, 23 Aug 2017 18:09:46 -0700 (PDT)
X-Received: by 10.55.170.195 with SMTP id t186mr6058103qke.201.1503536986309;
        Wed, 23 Aug 2017 18:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503536986; cv=none;
        d=google.com; s=arc-20160816;
        b=cak186eOl2fp96399uDq7Z9d9Hh9W6r6HUXRPaOaRUblmQ7QNRJcNosqqt99Pi1Uc2
         apOwBkk3VM/7Bx9RaPptLpMNHAFTurG8bkZXneJDi18xLB+NxXia9lWNXpdnZMjLWs+o
         jErMEcMEOy3+dp5HheMTJ6Bqe2alxln/Mou34LGnyTVUpeOGi1IX88qS4vB3VSGAEawk
         jHsrKxer0HBy54CbC68Y8VYfExuF6AKzFcwQCt+jiCZ1+T43u1NvhgoPULvq/f0BhsmV
         bO2Z9EBQ/8LRqPYNgKdMhXBR+iq+t3WQkXnLfPme2rb+cmvAELpJDUvyTINoH7xbYa5S
         pScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=x0MRMSK5LMp0DP+4By2xWah6Pq/tp8y1V2HbHjHZsOY=;
        b=U3cZI3Sc3zR72RgffT4ynkoRvMWkvUtWm9JoeiMICWuEJm5+xEeZFPAGi0wwkjBPdx
         bQ1nJEfVQP3F9hk0WkzfE4E8CoeR0zXICm4s4nSgF35+sDqXW4Y/vcF4j81JsHAfwFIx
         KLEGHlgb/IiggmLJ/lMBABVo/JKN+X4KqqeqppA1Rn2qAkJDhrUkxUxhIvzinkBDNVbV
         5JtF+2uuEPKKBGnk5AjvN8se0ZlnI9evU6UbC0cgXhEO0zm14dv/Qbg3wUHwMJU5ilq7
         YZ4atjE3uiKrv5PS4IvDzYlZFD+vVxvMmizhxBnm52A3eLoHj8euqLgR0PL+p45biXXG
         ka6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si2722275qkh.134.2017.08.23.18.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 18:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkgeV-0002qZ-UF
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 21:09:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wanghaibin.wang@huawei.com>) id 1dkSoh-0008A0-4G
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 06:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wanghaibin.wang@huawei.com>) id 1dkSoc-0007cT-Bl
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 06:23:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <wanghaibin.wang@huawei.com>) id 1dkSob-0007ay-OO
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 06:23:14 -0400
Received: from 172.30.72.59 (EHLO DGGEMS405-HUB.china.huawei.com)
	([172.30.72.59])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DFS41564; Wed, 23 Aug 2017 18:23:02 +0800 (CST)
Received: from localhost (10.177.27.144) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.301.0; Wed, 23 Aug 2017
	18:22:55 +0800
From: wanghaibin <wanghaibin.wang@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <cdall@linaro.org>,
	<marc.zyngier@arm.com>
Date: Wed, 23 Aug 2017 18:22:33 +0800
Message-ID: <1503483753-12384-1-git-send-email-wanghaibin.wang@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.144]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.599D5787.00EB, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 58dfff39be03c63925f8a226ad986ecc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
X-Mailman-Approved-At: Wed, 23 Aug 2017 21:09:13 -0400
Subject: [Qemu-arm] [RFC PATCH] hw/intc/arm_gic_kvm.c: access the
 implemented APRn
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
Cc: wanghaibin <wanghaibin.wang@huawei.com>, wu.wubin@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QqtZE4DuQYNC

Whether the APRn is implemented depends on how many priority
bits support. Compared with GICv3, There is no way to retrieve
this information directly from the register, so GICD_IPRIORITYR
access method is used here according to the SPEC:
To determine the number of priority bits implemented for SPIs,
software can write 0xFF to a writable
GICD_IPRIORITYR<n> priority field and read back the value stored.

Signed-off-by: wanghaibin <wanghaibin.wang@huawei.com>
---
 hw/intc/arm_gic_kvm.c | 56 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index ae095d0..a2f3139 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -290,13 +290,30 @@ static void kvm_dist_put(GICState *s, uint32_t offset, int width,
     }
 }
 
+static int kvm_arm_gic_get_pri_bits(GICState *s)
+{
+    uint32_t reg = 0xff;
+
+    /* 
+     * To determine the number of priority bits implemented, Just wirte the 0xff to 
+     * the first SPI(32) GICD_IPRIORITYR priority field and read back the value 
+     * stored. 
+     * Note: Assume that implementations support the same number of priority 
+     * bits for each PE
+     */
+    kvm_gicd_access(s, 0x400 + 0x20, 0, &reg, true);
+    kvm_gicd_access(s, 0x400 + 0x20, 0, &reg, false);
+
+    return 8 - ctz32(reg);
+}
+
 static void kvm_arm_gic_put(GICState *s)
 {
     uint32_t reg;
-    int i;
     int cpu;
     int num_cpu;
     int num_irq;
+    int num_pri_bits;
 
     /* Note: We do the restore in a slightly different order than the save
      * (where the order doesn't matter and is simply ordered according to the
@@ -326,6 +343,8 @@ static void kvm_arm_gic_put(GICState *s)
             abort();
     }
 
+    num_pri_bits = kvm_arm_gic_get_pri_bits(s);
+
     /* TODO: Consider checking compatibility with the IIDR ? */
 
     /* irq_state[n].enabled -> GICD_ISENABLERn */
@@ -353,7 +372,6 @@ static void kvm_arm_gic_put(GICState *s)
     kvm_dist_put(s, 0x380, 1, s->num_irq, translate_clear);
     kvm_dist_put(s, 0x300, 1, s->num_irq, translate_active);
 
-
     /* s->priorityX[irq] -> ICD_IPRIORITYRn */
     kvm_dist_put(s, 0x400, 8, s->num_irq, translate_priority);
 
@@ -384,9 +402,18 @@ static void kvm_arm_gic_put(GICState *s)
         kvm_gicc_access(s, 0x1c, cpu, &reg, true);
 
         /* s->apr[n][cpu] -> GICC_APRn */
-        for (i = 0; i < 4; i++) {
-            reg = s->apr[i][cpu];
-            kvm_gicc_access(s, 0xd0 + i * 4, cpu, &reg, true);
+        switch (num_pri_bits) {
+        case 7:
+            reg = s->apr[3][cpu];
+            kvm_gicc_access(s, 0xd0 + 3 * 4, cpu, &reg, true);
+            reg = s->apr[2][cpu];
+            kvm_gicc_access(s, 0xd0 + 2 * 4, cpu, &reg, true);
+        case 6:
+            reg = s->apr[1][cpu];
+            kvm_gicc_access(s, 0xd0 + 1 * 4, cpu, &reg, true);
+        default:
+            reg = s->apr[0][cpu];
+            kvm_gicc_access(s, 0xd0, cpu, &reg, true);
         }
     }
 }
@@ -396,6 +423,7 @@ static void kvm_arm_gic_get(GICState *s)
     uint32_t reg;
     int i;
     int cpu;
+    int num_pri_bits;
 
     /*****************************************************************
      * Distributor State
@@ -448,6 +476,7 @@ static void kvm_arm_gic_get(GICState *s)
     /* GICD_CPENDSGIRn -> s->sgi_pending */
     kvm_dist_get(s, 0xf10, 8, GIC_NR_SGIS, translate_sgisource);
 
+    num_pri_bits = kvm_arm_gic_get_pri_bits(s);
 
     /*****************************************************************
      * CPU Interface(s) State
@@ -470,10 +499,19 @@ static void kvm_arm_gic_get(GICState *s)
         kvm_gicc_access(s, 0x1c, cpu, &reg, false);
         s->abpr[cpu] = (reg & 0x7);
 
-        /* GICC_APRn -> s->apr[n][cpu] */
-        for (i = 0; i < 4; i++) {
-            kvm_gicc_access(s, 0xd0 + i * 4, cpu, &reg, false);
-            s->apr[i][cpu] = reg;
+        /* s->apr[n][cpu] -> GICC_APRn */
+        switch (num_pri_bits) {
+        case 7:
+            kvm_gicc_access(s, 0xd0 + 3 * 4, cpu, &reg, false);
+            s->apr[3][cpu] = reg;
+            kvm_gicc_access(s, 0xd0 + 2 * 4, cpu, &reg, false);
+            s->apr[2][cpu] = reg;
+        case 6:
+            kvm_gicc_access(s, 0xd0 + 1 * 4, cpu, &reg, false);
+            s->apr[1][cpu] = reg;
+        default:
+            kvm_gicc_access(s, 0xd0, cpu, &reg, false);
+            s->apr[0][cpu] = reg;
         }
     }
 }
-- 
1.8.3.1


