Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649700wrq;
        Sat, 14 Jul 2018 10:17:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeNYOGubkXQw5YpLSHqh7YcbqOszqBPKkcPh688eBIV5p2qf5J5Qw4/4cJFMp0OnQVeehfc
X-Received: by 2002:ae9:d8c1:: with SMTP id u184-v6mr9206272qkf.13.1531588631733;
        Sat, 14 Jul 2018 10:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588631; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0sTzytpUdH3G14nr3l0e298ZBp8BPAICQpuF0mbQsRnmM1xv03iVNpcq/4afZYtb6
         kl1LkQbf97VoZYwcx6kUb7ugX+bLQVu0kaiceVJAHtdA0L06RulraG8D4JpTdvWkUIT+
         kIKmhRPlpTgyhrTJx55iLBHzrDx9OPLjcUXPsSQMiO8yDVUDDSDLO+5Qq6rHEs/KEAoo
         YsEQj8zWaC3elpllUlr90J8XLiF4nTvcYM7l3b28YOvcuK2MLdGpyZJ/DwJx8xlBqhZj
         Jm7IDIEhs7sPXeMdhdkxikJzfUMOhbgLp4LMg7ZRilL4a191cBa4XDzBeSVHmdI6PSfw
         Czvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=yu+n94ZJ9+vFCfMEijHHvZjORfBMRPodnHce9FTH42o=;
        b=Znw5Dsmu57qYWKKWkIxl3igMK2AiDVUkUTGAuaywfklGbbZZCnESIdStx+4KmzDKxY
         lpwlOo4NrbGObgp88ShCJ7gMsam7Y+vvmIQrcyLcGwFk7JABvDXwe1yqWogt0flfDVdo
         iw75Uzgjjknv6X0JK/pDbUhI3iKECtkxy1O3QqjYJtiXp/Yc3cLYLtd87WsptuQluQ56
         mP3XSX59TL1zjEuKM0FzyJw9hwt4u8LP1UM2HDDxb5dzDwf2FY69eeKHQS5tT4XyPQyI
         Zj4ZZ+/+C2Y/kTjZLr8vPPK4pJCOk+4oiTKhBRERq95gHA9+9w0yocpaCbvZzfWG6dzZ
         nHaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=fUmqbDx3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bjz9MlO1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bjz9MlO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b57-v6si3138851qte.346.2018.07.14.10.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=fUmqbDx3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bjz9MlO1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bjz9MlO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAR-00068O-77
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k8-Aw
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004S5-Tx
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004QU-FT; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A6DBE443480;
	Sat, 14 Jul 2018 19:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588585;
	bh=gAGn4PasunLM8q8SMWKDBFXch2i23lCbZ04LlKRrBME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fUmqbDx3JsU1zuPFZd8sIqkF0qTFeP1CHDgRQcHN/7SnQy+kUg7uxYfhXVz+qiRqi
	PT88mjEa/m0nWmdKAmaxas5LuaL48XEg2uEv0uQ1BkQkfDGRfuiaoxXZPtjr0zvRxO
	fnJ6XGw09hX90zkM0Z7/rwobU1iiMxbp86SFHGoQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bjz9MlO1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bjz9MlO1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hopGqZN0Y-EY; Sat, 14 Jul 2018 19:16:24 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C364DC7AF0; Sat, 14 Jul 2018 19:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588584;
	bh=gAGn4PasunLM8q8SMWKDBFXch2i23lCbZ04LlKRrBME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bjz9MlO1anu/gWPjkJ+z2Sp21s0QTe7EvHq+rclzryNftJv8JP8FL/teSGctHgxSG
	UPPMVZ7HgtdcLBnUIUADNSXeSovh0TxEnJu9RF+aLtOIv2M80iThRXRhwhEAolILO2
	88YkerfI4Cw8qoI+YJwRjsMzd42QDLKBv1JX5z7U=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 18B10C7ADD;
	Sat, 14 Jul 2018 19:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588584;
	bh=gAGn4PasunLM8q8SMWKDBFXch2i23lCbZ04LlKRrBME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bjz9MlO1anu/gWPjkJ+z2Sp21s0QTe7EvHq+rclzryNftJv8JP8FL/teSGctHgxSG
	UPPMVZ7HgtdcLBnUIUADNSXeSovh0TxEnJu9RF+aLtOIv2M80iThRXRhwhEAolILO2
	88YkerfI4Cw8qoI+YJwRjsMzd42QDLKBv1JX5z7U=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:51 +0200
Message-Id: <20180714171601.5734-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 10/20] intc/arm_gic: Implement virtualization
 extensions in gic_(activate_irq|drop_prio)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z59YXv6I5fAs

Implement virtualization extensions in gic_activate_irq() and
gic_drop_prio() and in gic_get_prio_from_apr_bits() called by
gic_drop_prio().

When the current CPU is a vCPU:
  - Use GIC_VIRT_MIN_BPR and GIC_VIRT_NR_APRS instead of their non-virt
  counterparts,
  - the vCPU APR is stored in the virtual interface, in h_apr.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index ad241d12c2..60704cabbb 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -276,16 +276,23 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
      * and update the running priority.
      */
     int prio = gic_get_group_priority(s, cpu, irq);
-    int preemption_level = prio >> (GIC_MIN_BPR + 1);
+    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+    int preemption_level = prio >> (min_bpr + 1);
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
+    uint32_t *papr = NULL;
 
-    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
-        s->nsapr[regno][cpu] |= (1 << bitno);
+    if (gic_is_vcpu(cpu)) {
+        assert(regno == 0);
+        papr = &s->h_apr[gic_get_vcpu_real_id(cpu)];
+    } else if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
+        papr = &s->nsapr[regno][cpu];
     } else {
-        s->apr[regno][cpu] |= (1 << bitno);
+        papr = &s->apr[regno][cpu];
     }
 
+    *papr |= (1 << bitno);
+
     s->running_priority[cpu] = prio;
     gic_set_active(s, irq, cpu);
 }
@@ -296,6 +303,16 @@ static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
      * on the set bits in the Active Priority Registers.
      */
     int i;
+
+    if (gic_is_vcpu(cpu)) {
+        uint32_t apr = s->h_apr[gic_get_vcpu_real_id(cpu)];
+        if (apr) {
+            return ctz32(apr) << (GIC_VIRT_MIN_BPR + 1);
+        } else {
+            return 0x100;
+        }
+    }
+
     for (i = 0; i < GIC_NR_APRS; i++) {
         uint32_t apr = s->apr[i][cpu] | s->nsapr[i][cpu];
         if (!apr) {
@@ -324,16 +341,25 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
      * running priority will be wrong, so interrupts that should preempt
      * might not do so, and interrupts that should not preempt might do so.
      */
-    int i;
+    if (gic_is_vcpu(cpu)) {
+        int rcpu = gic_get_vcpu_real_id(cpu);
 
-    for (i = 0; i < GIC_NR_APRS; i++) {
-        uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
-        if (!*papr) {
-            continue;
+        if (s->h_apr[rcpu]) {
+            /* Clear lowest set bit */
+            s->h_apr[rcpu] &= s->h_apr[rcpu] - 1;
+        }
+    } else {
+        int i;
+
+        for (i = 0; i < GIC_NR_APRS; i++) {
+            uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
+            if (!*papr) {
+                continue;
+            }
+            /* Clear lowest set bit */
+            *papr &= *papr - 1;
+            break;
         }
-        /* Clear lowest set bit */
-        *papr &= *papr - 1;
-        break;
     }
 
     s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
-- 
2.18.0

