Received: by 10.28.91.67 with SMTP id p64csp2685399wmb;
        Mon, 19 Mar 2018 07:38:13 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvXlWb94ZSHsEXwhOIVP7oJUI4ac0VaQh4IhBvrhOoj4SQbz/AQNpZ6ltEsPWvqDagkkwXb
X-Received: by 10.237.54.161 with SMTP id f30mr18733446qtb.128.1521470293680;
        Mon, 19 Mar 2018 07:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521470293; cv=none;
        d=google.com; s=arc-20160816;
        b=De9xdvPS7bYys4sceQtZ4fDGODuzV4nadxg2Em+oysQ1uKmbnBT/VbFhEkVHyOGSzT
         jU8yXei6Kak80lRmp4FgMIrGH9rBQV2fC+k1FZ/m/4puXIO0Skuvt7LQoLdHCmro49xI
         fRbycj60frAxWKWxePC5PXk/nW2dBeykd+jRI1BqxljPFBY17LbochAkDuk3iNU6vcVj
         TJQePA6zJVAjCYDz94a2mU3O6uslyhBH12kQyO2BXSyXS3Mz95/fN+81mdu63uBPNyKH
         CdVh9lScAqgwXdEoBJWWvpHLxtZu+5zx5rld4p8urcJlb2gLHySrMHOZpKKZUnpw5MjH
         QODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=u0GrKPMSSdfJkBCRnNiyB7t79uIzhVEmXLH4tqwIF40=;
        b=EsyWN7gwwRD7HyXqAdjyLpj+qZGGuQnjAI3McmBZVMgrePdGepZcqNMtUYNnG28pzD
         worKiEQ7/B2p3GmWQQdzk/h0uJWq3iJOZY48U1jYwa0FInqcGkuM2BpDS3FEBhAUTS/J
         hnk7IPMgXltU/BI1nrYiFRwvgNuB3sAQRHNET1uzdTAgaaiNn93zzD6UColKshsuWThy
         Nu+Q0Fu68/P9fVDbO86mdn2LB6eCpz0L99oB7ZH489NrIBcKwYPtJtD0ZOmK3Rb4ERyy
         QgxKrwT1eyloJ1/ivjMGcZU5i7YldEBIOyRECT6FHEEO5LjyNKZgi86G6WVe2qiSWmLy
         /Bxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11si170236qtn.109.2018.03.19.07.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 07:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exvvR-0000u1-3b
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 10:38:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvvA-0000lE-0P
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvv5-0005yh-9M
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from [45.249.212.32] (port=46594 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1exvv4-0005sp-Tq; Mon, 19 Mar 2018 10:37:51 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E2D38B7D75A48;
	Mon, 19 Mar 2018 22:37:44 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.361.1; Mon, 19 Mar 2018 22:37:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Mon, 19 Mar 2018 22:36:17 +0800
Message-ID: <1521470177-14760-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
References: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip the
 registers banked by GICR
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JbDmgzgcBOpV

It should skip to getting/putting the registers banked by GICR so that
it could get/put the correct ones.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 7000716..e967e4f 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -136,6 +136,8 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     int irq;
 
     field = (uint32_t *)bmp;
+    /* The first 8 GICD_IPRIORITYR should skip. */
+    offset += (8 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         kvm_gicd_access(s, offset, &reg, false);
         *field = reg;
@@ -150,6 +152,8 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     int irq;
 
     field = (uint32_t *)bmp;
+    /* The first 8 GICD_IPRIORITYR should skip. */
+    offset += (8 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         reg = *field;
         kvm_gicd_access(s, offset, &reg, true);
@@ -164,6 +168,8 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* The first 2 GICD_ICFGR should skip. */
+    offset += (2 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         kvm_gicd_access(s, offset, &reg, false);
         reg = half_unshuffle32(reg >> 1);
@@ -181,6 +187,8 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* The first 2 GICD_ICFGR should skip. */
+    offset += (2 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         reg = *gic_bmp_ptr32(bmp, irq);
         if (irq % 32 != 0) {
@@ -222,6 +230,8 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
     uint32_t reg;
     int irq;
 
+    /* The first 1 GICD_XXXX should skip. */
+    offset += (1 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         kvm_gicd_access(s, offset, &reg, false);
         *gic_bmp_ptr32(bmp, irq) = reg;
@@ -236,6 +246,10 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
     int irq;
 
     clroffset_index = clroffset;
+    /* The first 1 GICD_XXXX should skip. */
+    offset += (1 * sizeof(uint32_t));
+    if (clroffset != 0)
+        clroffset_index += (1 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         /* If this bitmap is a set/clear register pair, first write to the
          * clear-reg to clear all bits before using the set-reg to write
-- 
2.0.4


