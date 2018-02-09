Received: by 10.28.71.27 with SMTP id u27csp1165397wma;
        Fri, 9 Feb 2018 09:03:44 -0800 (PST)
X-Google-Smtp-Source: AH8x224lI82G1YmKEA9LATDqUx//Q+oFOBMTRePksWO/A7G7eCwVPAHrAIvmxPngxBkXXrXH/KQB
X-Received: by 10.37.113.70 with SMTP id m67mr2416145ybc.307.1518195824253;
        Fri, 09 Feb 2018 09:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195824; cv=none;
        d=google.com; s=arc-20160816;
        b=AKGgxI38HTQeQaHJ//W9bSmLU+teA5Nuno08hOrD3qvYb74DtVR5HtAkhwqGSX1Oty
         UBDFoyviOlxBlqSmacAmr1c6wSE6f6QskkLS9pZjsT3+o6+TmW9rfxBogDy7ttCmg11R
         knIvX20Yx7DdtCBQTz8zBF34/wkGxf3cR+VUHMOKG6kKIXnIw1T+NWaQBeaMaZ4/v+wG
         /LBL1Xe1rOet6eo04h/5fEn32dw9m9+6ljTEcbbtAnPxZdskecfK76B3kplzoPmBmT4D
         I0F6aeKGdyKFQ62ft82IanI5xxL4b0Bf4AlDqB5bnG/lOsDYO9lnx5hsgrUt3jwv2Xq1
         Mv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LI7RuXzMx0H/AOlskAaw4Z2larWm5hSq8EQxepAoQMQ=;
        b=WoPCk1FAWPfUtvyw8crnIWbV8/48xXTv+2IPMlVjgKnTpOA0wBRJMSgRJOpAgp2bVy
         Acd9CYqMKr/HeJa1p5ll4qIdqkmH9esK+0oj/8Mu/EeF0Z0j8+w2twHCH7s95ZeNiHqv
         PdJnmIyNNXT9ZRe9bO+ZIfOO4Eea0VQxSpgUXMDoiIR+YQpeFAVlzzcH3AWuQcioGrGH
         xjA+FccgueEStfg5mM+e/xqVWJGJE84ev7GocJD4oTcgFzZ5RVz9GNAbLEaVfkcK2CHu
         vhc3FTvid2JQSu7+7hwcRI5eG8qJmIFo3ZO/PADOFVcEhtAa84dzIAFNlObyvulUCZfQ
         pcmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v191si41889ywg.131.2018.02.09.09.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC5P-0007td-Ia
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:03:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0C-0003xi-K7
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0A-0007mV-VG
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:20 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0A-0007fy-MG; Fri, 09 Feb 2018 11:58:18 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC04-0002zI-Np; Fri, 09 Feb 2018 16:58:12 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:00 +0000
Message-Id: <20180209165810.6668-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 01/11] hw/intc/armv7m_nvic: Don't hardcode M
 profile ID registers in NVIC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xHrz+awA504u

Instead of hardcoding the values of M profile ID registers in the
NVIC, use the fields in the CPU struct. This will allow us to
give different M profile CPU types different ID register values.

This commit includes the addition of the missing ID_ISAR5,
which exists as RES0 in both v7M and v8M.

(The values of the ID registers might be wrong for the M4 --
this commit leaves the behaviour there unchanged.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/armv7m_nvic.c | 30 ++++++++++++++++--------------
 target/arm/cpu.c      | 28 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 360889d30b..63da0fee34 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -990,31 +990,33 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
                       "Aux Fault status registers unimplemented\n");
         return 0;
     case 0xd40: /* PFR0.  */
-        return 0x00000030;
-    case 0xd44: /* PRF1.  */
-        return 0x00000200;
+        return cpu->id_pfr0;
+    case 0xd44: /* PFR1.  */
+        return cpu->id_pfr1;
     case 0xd48: /* DFR0.  */
-        return 0x00100000;
+        return cpu->id_dfr0;
     case 0xd4c: /* AFR0.  */
-        return 0x00000000;
+        return cpu->id_afr0;
     case 0xd50: /* MMFR0.  */
-        return 0x00000030;
+        return cpu->id_mmfr0;
     case 0xd54: /* MMFR1.  */
-        return 0x00000000;
+        return cpu->id_mmfr1;
     case 0xd58: /* MMFR2.  */
-        return 0x00000000;
+        return cpu->id_mmfr2;
     case 0xd5c: /* MMFR3.  */
-        return 0x00000000;
+        return cpu->id_mmfr3;
     case 0xd60: /* ISAR0.  */
-        return 0x01141110;
+        return cpu->id_isar0;
     case 0xd64: /* ISAR1.  */
-        return 0x02111000;
+        return cpu->id_isar1;
     case 0xd68: /* ISAR2.  */
-        return 0x21112231;
+        return cpu->id_isar2;
     case 0xd6c: /* ISAR3.  */
-        return 0x01111110;
+        return cpu->id_isar3;
     case 0xd70: /* ISAR4.  */
-        return 0x01310102;
+        return cpu->id_isar4;
+    case 0xd74: /* ISAR5.  */
+        return cpu->id_isar5;
     /* TODO: Implement debug registers.  */
     case 0xd90: /* MPU_TYPE */
         /* Unified MPU; if the MPU is not present this value is zero */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 89ccdeae12..d796085be9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1146,6 +1146,20 @@ static void cortex_m3_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_M);
     cpu->midr = 0x410fc231;
     cpu->pmsav7_dregion = 8;
+    cpu->id_pfr0 = 0x00000030;
+    cpu->id_pfr1 = 0x00000200;
+    cpu->id_dfr0 = 0x00100000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x00000030;
+    cpu->id_mmfr1 = 0x00000000;
+    cpu->id_mmfr2 = 0x00000000;
+    cpu->id_mmfr3 = 0x00000000;
+    cpu->id_isar0 = 0x01141110;
+    cpu->id_isar1 = 0x02111000;
+    cpu->id_isar2 = 0x21112231;
+    cpu->id_isar3 = 0x01111110;
+    cpu->id_isar4 = 0x01310102;
+    cpu->id_isar5 = 0x00000000;
 }
 
 static void cortex_m4_initfn(Object *obj)
@@ -1157,6 +1171,20 @@ static void cortex_m4_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fc240; /* r0p0 */
     cpu->pmsav7_dregion = 8;
+    cpu->id_pfr0 = 0x00000030;
+    cpu->id_pfr1 = 0x00000200;
+    cpu->id_dfr0 = 0x00100000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x00000030;
+    cpu->id_mmfr1 = 0x00000000;
+    cpu->id_mmfr2 = 0x00000000;
+    cpu->id_mmfr3 = 0x00000000;
+    cpu->id_isar0 = 0x01141110;
+    cpu->id_isar1 = 0x02111000;
+    cpu->id_isar2 = 0x21112231;
+    cpu->id_isar3 = 0x01111110;
+    cpu->id_isar4 = 0x01310102;
+    cpu->id_isar5 = 0x00000000;
 }
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
-- 
2.16.1

