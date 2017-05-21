Received: by 10.103.124.15 with SMTP id x15csp1047959vsc;
        Sun, 21 May 2017 08:31:54 -0700 (PDT)
X-Received: by 10.55.131.198 with SMTP id f189mr16105408qkd.187.1495380714268;
        Sun, 21 May 2017 08:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380714; cv=none;
        d=google.com; s=arc-20160816;
        b=YKY90FNxPxfVM86JdqYnrng4RrK+27AjVBwlrx2CubP15/YBOiU+YMBlpjb0Gqi4YO
         kKchLKMkCNmqaaTmJXKhoviPtTS6l1RV58UlMGvSUKyVtJLz6nIjD87eVcQBGXjRHCew
         usjb0Tq4vk/cYYAtqq3Uze5av0cVJoJRmCOAeMMmfEGruA6cJcQThK7BTQKeu7yoxoyh
         I+rxMAof81M2nBniUQloQxBJaB1a7x2CKubog0io6H178nRKrBNDfh5bXcF7exqdCmVv
         nmR9uebpN+TJBVWA0MEDmv61awrJOXtSSgYQKVV8uv15US3Aq02ks+WqqJxA3y966AlP
         Ux0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=6W+mbuaFUGnAU9EmPOFsnYHKr5iRuP6hbEwk9f/B2sc=;
        b=hz9kUXNm+aiUN4JgUKZGIwaBDwLmUOxk8tU1J9KJVIebhMsozZWKrjp59RChoLw4c1
         f3V4xG9+ZUR+TRkeJ4RVs+fstp2gsAZJhaWq3Y5DQdQDBHgHkfNh7OT8kSZe/tjStvV4
         Nk7mhjHuTMQvbzvUIeZdL568DzGE/SB6bHe7iNm7aHWZCHuDTy55g6HM8JLTwUERICV1
         R04l3M6OkQ/2o2j2VTIaCdEg//c636EjjHrlTTbpp+RSkhMQjsZcL8l1m9AJsoinQupU
         oUCdS7quZKEN6qllUa98kIEBT+9DZ6W8UPTYvetPtxZY6z8sgvDDYhRe1z4RUeMuyHzp
         ngOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si15399678qkc.115.2017.05.21.08.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSpl-0003X1-Om
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:31:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo4-0002IX-Ig
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo3-0007DE-LN
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSo3-0007Bg-Cs; Sun, 21 May 2017 11:30:07 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 85E21239B0;
	Sun, 21 May 2017 15:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E21239B0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:42 +0200
Message-Id: <20170521152949.15338-5-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 04/11] hw/timer/exynos4210_mct: Cleanup
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qYVGl/ZsU+kG

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

