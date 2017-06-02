Received: by 10.25.0.23 with SMTP id 23csp25628lfa;
        Fri, 2 Jun 2017 09:42:29 -0700 (PDT)
X-Received: by 10.200.41.119 with SMTP id z52mr9232174qtz.240.1496421748992;
        Fri, 02 Jun 2017 09:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421748; cv=none;
        d=google.com; s=arc-20160816;
        b=incsxKsMdjBLSb+K8uEDa6PvpG3IKvBpvuzXEs5zosrcgN9vKEgRl17z0eQzJiX4oi
         kktMGtq/OlnxsMZJzidtUihkIlCOebsuMe2/nSwKHEBY2yeN9IEf/O9lGsV/r6xuh+vm
         0N/67s9QheAdStmMXEPFccoyc3jibOIKfSxYYz2pG1RpYBN0+PMKBQ5/QW1HpbCwk5bx
         bEizev8kLHL/mshV4pQSHbp0jmrOBh5g106likd+YihYDZ085/uL7u2LkNhgoTwtwzTQ
         kogLa5J/ifCSgCBz8H1Q/NjDBqTx6D1AUmhrq8pqsYg+a7uvgkHUbfJUGliDVXHgPZ1r
         HpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=6W+mbuaFUGnAU9EmPOFsnYHKr5iRuP6hbEwk9f/B2sc=;
        b=rLSFNaK4RvjMOz6GzFy5Ba4DysRdVCR8fAcPlnfsGUsQJnpll/Slffvm0icETS1Kfz
         pZJ/28u1BzAnLzoM+fHwhT2nEc2A96EwbgXiBoFp84xVMKs0nzfE5+d8J5ze4MtOa/44
         ZuL97LUD2fm8mXIb/rQncoipcDiTrCr51bPZhV16cDS3DxyhFJ4JLk7tQDoBs0dsXXwi
         wfBEC0Nnh9T73nvRoAHSreJK+PBHCypFW+5/cPg79YQ8wttqyQfg7hkvGfmEkI51Blxd
         6sSorxK6cSeHtb2j2C1zwwnK8s+huj9mCmToCA7Me5WLNjia00P7vejGPRMIBX4Hf++c
         PoVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o186si23514367qkf.6.2017.06.02.09.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:42:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpec-000751-BM
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:42:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ2-00015H-Dl
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ1-0007b5-D1
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZ1-0007Zs-31; Fri, 02 Jun 2017 12:36:39 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8114C23A24;
	Fri,  2 Jun 2017 16:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8114C23A24
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:12 +0200
Message-Id: <20170602163618.6369-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 3/9] hw/timer/exynos4210_mct: Cleanup
 indentation and empty new lines
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X+UYEPuSUAuQ

Statements under 'case' were in some places wrongly indented bringing
confusion and making the code less readable.  Remove also few unneeded
blank lines.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 45 ++++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 2404fb737ac4..ea5f99d9a41b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1016,9 +1016,9 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
 
     case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
     case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
-    index = GET_G_COMP_IDX(offset);
-    shift = 8 * (offset & 0x4);
-    value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
+        index = GET_G_COMP_IDX(offset);
+        shift = 8 * (offset & 0x4);
+        value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
     break;
 
     case G_TCON:
@@ -1067,7 +1067,6 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
         lt_i = GET_L_TIMER_IDX(offset);
 
         value = exynos4210_lfrc_get_count(&s->l_timer[lt_i]);
-
         break;
 
     case L0_TCON: case L1_TCON:
@@ -1153,23 +1152,23 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
     case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
-    index = GET_G_COMP_IDX(offset);
-    shift = 8 * (offset & 0x4);
-    s->g_timer.reg.comp[index] =
-            (s->g_timer.reg.comp[index] &
-            (((uint64_t)UINT32_MAX << 32) >> shift)) +
-            (value << shift);
+        index = GET_G_COMP_IDX(offset);
+        shift = 8 * (offset & 0x4);
+        s->g_timer.reg.comp[index] =
+                (s->g_timer.reg.comp[index] &
+                (((uint64_t)UINT32_MAX << 32) >> shift)) +
+                (value << shift);
 
-    DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
+        DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
 
-    if (offset & 0x4) {
-        s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
-    } else {
-        s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
-    }
+        if (offset & 0x4) {
+            s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
+        } else {
+            s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
+        }
 
-    exynos4210_gfrc_restart(s);
-    break;
+        exynos4210_gfrc_restart(s);
+        break;
 
     case G_TCON:
         old_val = s->g_timer.reg.tcon;
@@ -1207,7 +1206,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case G_INT_ENB:
-
         /* Raise IRQ if transition from disabled to enabled and CSTAT pending */
         for (i = 0; i < MCT_GT_CMP_NUM; i++) {
             if ((value & G_INT_ENABLE(i)) > (s->g_timer.reg.tcon &
@@ -1288,7 +1286,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case L0_TCNTB: case L1_TCNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
@@ -1316,7 +1313,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case L0_ICNTB: case L1_ICNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
@@ -1353,13 +1349,12 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         if (icntb_max[lt_i] < value) {
             icntb_max[lt_i] = value;
         }
-DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
-        lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
+        DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
+                lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
 #endif
-break;
+        break;
 
     case L0_FRCNTB: case L1_FRCNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
-- 
2.9.3

