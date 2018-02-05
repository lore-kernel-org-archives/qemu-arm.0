Received: by 10.28.71.27 with SMTP id u27csp2344770wma;
        Mon, 5 Feb 2018 03:01:03 -0800 (PST)
X-Google-Smtp-Source: AH8x225TxzHeIdAm9Oko8rEwCJ1086uk8etZNNrrZXPQzO8h80O84IwBI9EGHs6UaWmBhiBXPXOK
X-Received: by 10.129.155.4 with SMTP id s4mr31022870ywg.451.1517828463365;
        Mon, 05 Feb 2018 03:01:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828463; cv=none;
        d=google.com; s=arc-20160816;
        b=GP4eQTJ4HLtDB8pkgnlf6ibXKVHAONKUwJ2ODrIM5G740VyNV4KbLEOLKlnmVBWEuL
         oPUSK64yPy31gcqJaNfSquy6xxhrB1v/OICA9m/Pmqvqb+8xdEmrsFmnFNSekpk9QTpO
         dwGbj4oC3P9MMJdV9cHmo5hKempu0+hKYcFu0lZKEWkW1ReaQPHyVMHywRm0ZsM3fSwr
         Pp8/Uv+moms3sUoOOoLhbriynhX/BrOlAZc1nhHGnabebCMiPbIpYHLkP27Geic8k5HM
         tBDWmsFTnrys6utajc7r7vqnFadC5efHQT2sj9xmjDxaqaktJEznbD7doABoU7D2ryB9
         NbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=l+JgEAHFviShm48gAli+1TIZm+WhEFLfOVS0Ldfwfek=;
        b=S/qdZrB2P2DMw5V/OO1qxibp/7SvtiAg73h/z9ty8mqLbOzdQ3wupt0tzgbMkp+OpU
         3VrjbpmoKPov8WfTLeWb3GpjSVeZbRURejW6PfhORYHqV+gnMQ5JA8L+K1nEkpQHrNqb
         up0MjIWVCqP2a41KDPL7ID2+o6zeBCQSIt4XE13zssIEDiuWZJ2OfizyDBZMx29U7C/u
         4Qm6THkBdroWdeVHT/Uxpkyb2PAuvE7ZLdQuuYDkdCOIfIe3hm/cby0M2FRj36GG4CrA
         LCtzLTt5WFSVELVtSxhKzznDZsgafqvOLFO+bJtj+6jBHU9qFNH4X6qu2/4VGZ3WRTRJ
         LCSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si1395125ybn.386.2018.02.05.03.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 03:01:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieWE-0008Ih-Ml
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 06:01:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieT4-0006Dc-5B
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 05:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSz-0007IH-E1
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 05:57:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSw-00076t-Fo; Mon, 05 Feb 2018 05:57:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSg-0004EP-Ny; Mon, 05 Feb 2018 10:57:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:13 +0000
Message-Id: <20180205105720.14620-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205105720.14620-1-peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 1/8] hw/intc/armv7m_nvic: Don't hardcode M
 profile ID registers in NVIC
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
X-TUID: kuEtGorjhoBn

Instead of hardcoding the values of M profile ID registers in the
NVIC, use the fields in the CPU struct. This will allow us to
give different M profile CPU types different ID register values.

This commit includes the addition of the missing ID_ISAR5,
which exists as RES0 in both v7M and v8M.

(The values of the ID registers might be wrong for the M4 --
this commit leaves the behaviour there unchanged.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 9da6ea505c..223361fb50 100644
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

