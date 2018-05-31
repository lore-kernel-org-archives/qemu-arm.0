Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5444037wre;
        Wed, 30 May 2018 20:17:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLxR76oM0D566E7mRw6I0QDfTgMe5s/85TQ2NYRDev72JFM24BEVuUCB8TArlJislU5BbzC
X-Received: by 2002:a0c:f288:: with SMTP id k8-v6mr5056370qvl.14.1527736620158;
        Wed, 30 May 2018 20:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527736620; cv=none;
        d=google.com; s=arc-20160816;
        b=koJWQdqW+co1dKR82TZNZpidR8xdM0l2tnbzpyQwoaiCrARdHDq/uxRbyfCC2xgCla
         K5MfvckNQfHS9WII/+Os9O+GZGe2Is8uAbGHqIxTgtVru6kROx9q+prejXB6pVidS9rc
         LZ9stUY2EtEZhSPYxVqX+fQwYV2s/8ZDU+/UNKCf3pkhNKI5h07Ydl2yycZyxQtApH4v
         +ejjnbLsxNmNwKQxSN6XAnsSV7I86ANHu9Vf9gy30eys49kIeWwTAERCbMhaeyBHAPl5
         VbdcWwcl/E5jNbpBMiPtXy2P81X18r/ilgtk88opnyXKjxSVDa3rOeKYyVjFv/ZdmaEY
         lhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=32HNVgkLdpIMgJuM/IwD2UagXYNDQFL8E/w2hxbw1II=;
        b=us6btv933VFVYK5ju2EEbeaQtNJPWiqak/qL/mrtWXOinFkZcO8HpQoIzxqJFZw14T
         a3sOF+2qE7+Dn8uDGbCjHnE85HK2f90gwSQD7E6S0ZcLOxIqEFWZt8jwbMQBdxCZNlMf
         Roc67BDBMYRu+M2F6hX7T2rGLZPMF1aaVLB64Mpnm7C7q71pPZDFNi4oycv71vZuk3Kj
         QR2JJKnOODgokQiTU1t5EztgLO+2FEtNfJY3c2pq01fpHR0t9X+1sHZp6MuB2tcXO5CM
         dvDUnycokDcOaoUHQ3YAT1J/MN6/5S+kF45/UeWPr8Q5vov9JB+LVzPhl4A7iZQtUaRr
         A/pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si8104194qtc.6.2018.05.30.20.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOE5D-0004OY-Ff
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:16:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE54-0004Nw-18
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE50-0004WX-01
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:50 -0400
Received: from [45.249.212.35] (port=40702 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOE4z-0004Us-Kp; Wed, 30 May 2018 23:16:45 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id B5F6920FF1A53;
	Thu, 31 May 2018 11:16:39 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:16:32 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Thu, 31 May 2018 11:15:56 +0800
Message-ID: <1527736557-11084-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v5 1/2] arm_gicv3_kvm: kvm_dist_get/put_priority:
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
X-TUID: Pn8bZZBcBLxX

While for_each_dist_irq_reg loop starts from GIC_INTERNAL, it forgot to
offset the date array and index. This will overlap the GICR registers
value and leave the last GIC_INTERNAL irq's registers out of update.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


