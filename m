Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2924754wre;
        Fri, 25 May 2018 04:23:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLk244e9+0UY3QS3jLBR9AZDl81wCJIxS3DYwWg+1qJbdUIOTNG859MILE1TUJmdard4x36
X-Received: by 2002:a37:21de:: with SMTP id f91-v6mr1530805qki.395.1527247420900;
        Fri, 25 May 2018 04:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527247420; cv=none;
        d=google.com; s=arc-20160816;
        b=MVfndm2HzP6emQtj9jF5FNqppb7IadTIKbDgTUDfPtgG5fhUH4bzczfRjIUfyHtnPI
         zIDvIRBGaQKi91bhJ6LevyZzcUfTYVin6n8h6vni9KbdCZS/dVzl1gie2rfP4tPl3utr
         kR7tjs/CFf8+QsQp3dZHYPsenyOR2dejq6y9fWlBPbBBtVexCV6HWV/CKDBqDLgz+/VU
         iTor+dU7mbQyJ5hqIfUR7OhAL9iXJHol6z4rrqDfu18aVGCLzVvHNQ995o/oWYukCcSi
         U1EPOK5CPowez3umCiUzFwiWSW2JbGGM91ArKkkqC2vu1NhWj8Ujli/IC79PLXD296Sq
         FLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=M2BOKX3cJSBUEWE0Qbhza8yBi0xpjoSrl8KzjsL4qKo=;
        b=S4PFq0vJu2zt42nbtLqcHr0famynNC5eb5/b2DjOvsLpsZ+QGzBDIkIJmuGu1o2LK8
         78dDTtueore9OofWfL1ZkvEEA3usVPA4Pes7i4GYQ1LAN8tfe2clYSL775fdw/Sb6RDv
         2sXwQB5U3SPUukVqpsKjv6FIHa4ot+1sT2+vvRtNbf7EyzdYCRzn4aXscjYGTOh6nJsO
         ok8h1xQj6o9CLgNOSKApQOM9zHM1SNF11OdeYbhuZEs98lduIKxov8//Nea5cX9Iexuc
         Zg9JD8bK1zNErew0jJ5t6QtWE/Gc0cYaErGXsukQdjweS9xsVj4AGcOY7IYBMGFyi0Zd
         +aDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si3216760qkf.68.2018.05.25.04.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 04:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fMAou-0003Lg-89
	for alex.bennee@linaro.org; Fri, 25 May 2018 07:23:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAod-0003I9-DD
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAoZ-0002v7-05
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:23 -0400
Received: from [45.249.212.35] (port=42619 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fMAoY-0002te-M7; Fri, 25 May 2018 07:23:18 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id F2071F1E479F5;
	Fri, 25 May 2018 19:23:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.382.0; Fri, 25 May 2018 19:23:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Fri, 25 May 2018 19:22:50 +0800
Message-ID: <1527247371-10592-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 1/2] arm_gicv3_kvm: kvm_dist_get/put_priority:
 skip the registers banked by GICR_IPRIORITYR
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5glheMaKH6bc

While for_each_dist_irq_reg loop starts from GIC_INTERNAL, it forgot to
offset the date array and index. This will overlap the GICR registers
value and leave the last GIC_INTERNAL irq's registers out of update.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3536795..147e691 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -135,7 +135,14 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     uint32_t reg, *field;
     int irq;
 
-    field = (uint32_t *)bmp;
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
+     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_IPRIORITYR<n>. It doesn't need to
+     * sync them. So it needs to skip the field of GIC_INTERNAL irqs in bmp and
+     * offset.
+     */
+    field = (uint32_t *)(bmp + GIC_INTERNAL);
+    offset += (GIC_INTERNAL * 8) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         kvm_gicd_access(s, offset, &reg, false);
         *field = reg;
@@ -149,7 +156,14 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     uint32_t reg, *field;
     int irq;
 
-    field = (uint32_t *)bmp;
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
+     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_IPRIORITYR<n>. It doesn't need to
+     * sync them. So it needs to skip the field of GIC_INTERNAL irqs in bmp and
+     * offset.
+     */
+    field = (uint32_t *)(bmp + GIC_INTERNAL);
+    offset += (GIC_INTERNAL * 8) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         reg = *field;
         kvm_gicd_access(s, offset, &reg, true);
-- 
2.0.4


